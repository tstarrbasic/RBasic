library(ggplot2)
library(dplyr)

set.seed(100)
df <- diamonds[sample(1:nrow(diamonds),5000),]

#
ggplot(df, aes(carat,price)) + 
  geom_point(stat = "identity",
             position = "identity")

#lm:�u�ʦ^�k
ggplot(df, aes(carat,price)) + 
  geom_point(stat = "identity",
             position = "identity") +
  geom_smooth(se = T, method = "lm")

#����
ggplot(df, aes(carat,price)) + 
  geom_point(stat = "identity",
             position = "identity") +
  geom_smooth(se = T) + 
  facet_wrap( ~ cut)

#
ggplot(df, aes(carat,price)) + 
  geom_point(stat = "identity",
             position = "identity",
             shape=17) +
  geom_smooth(se = T) + 
  facet_wrap( ~ cut)

#
ggplot(df, aes(carat,price)) + 
  geom_point(stat = "identity",
             position = "identity",
             shape=17) +
  geom_smooth(se = T) + 
  facet_wrap( ~ cut) + 
  labs(x = "�J��",y = "����", title="������")

#
ggplot(df, aes(carat,price,colour=cut)) + 
  geom_point(stat = "identity",
             position = "identity",
             shape=17) +
  labs(x = "�J��",y = "����", title="������")

#multi scatter
#install.packages("car")
library(car)
scatterplotMatrix(~carat + price + depth + table,
                  data = df,
                  main = "Scatter Plot Matrix") #

install.packages("ggcorrplot")
library(ggcorrplot)
df1 <- df[sapply(df, is.numeric)] 
corr <- round(cor(df1),1)
View(corr)
ggcorrplot(corr,
           hc.order = T,
           type = "lower",
           lab = T,
           lab_size = 3,
           method = "circle",
           colors = c("red","white","lightgreen"),
           title="�Ϫ��D�D",
           ggtheme=theme_bw)


#���O��
heat <- df %>% 
  group_by(cut,color) %>% 
  summarise(number=n()) %>% 
  ungroup()

plot <- ggplot(heat, aes(cut,color)) + 
  geom_tile(aes(fill = number)) +
  theme_bw() + 
  scale_fill_gradient(low = "white", high = "red") +
  labs(x = "���u", y = "�C��", title = "���O��")


setwd("//vibo/nfs/CHPublic/�Ȥ�A�ȨƷ~��/�������ΰ�/R�y���ҵ{/HW3/�ҵ{���e���D��/")

getwd() 
ggsave(plot, file="plot4.png")

ggsave(plot, file="plot3.png", width = 6,
       height = 4, units = "cm")


















