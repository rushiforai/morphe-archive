.class interface abstract Lcom/heytap/mcssdk/c;
.super Ljava/lang/Object;


# virtual methods
.method public abstract clearNotificationType(Lorg/json/JSONObject;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract clearNotifications(Lorg/json/JSONObject;)V
.end method

.method public abstract getAliases(Lorg/json/JSONObject;)V
.end method

.method public abstract getNotificationStatus(Lorg/json/JSONObject;)V
.end method

.method public abstract getRegister(Lorg/json/JSONObject;)V
.end method

.method public abstract getTags(Lorg/json/JSONObject;)V
.end method

.method public abstract getUserAccounts(Lorg/json/JSONObject;)V
.end method

.method public abstract openNotificationSettings(Lorg/json/JSONObject;)V
.end method

.method public abstract pausePush(Lorg/json/JSONObject;)V
.end method

.method public abstract register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/heytap/mcssdk/callback/PushCallback;)V
.end method

.method public abstract resumePush(Lorg/json/JSONObject;)V
.end method

.method public abstract setAliases(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation
.end method

.method public abstract setNotificationType(ILorg/json/JSONObject;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setPushTime(Ljava/util/List;IIIILorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;IIII",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation
.end method

.method public abstract setTags(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation
.end method

.method public abstract setUserAccount(Ljava/lang/String;Lorg/json/JSONObject;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract unRegister(Lorg/json/JSONObject;)V
.end method

.method public abstract unsetAlias(Ljava/lang/String;Lorg/json/JSONObject;)V
.end method

.method public abstract unsetAliases(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract unsetTags(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation
.end method

.method public abstract unsetUserAccounts(Ljava/util/List;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
