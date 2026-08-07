.class interface abstract Lcom/heytap/mcssdk/b;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/heytap/mcssdk/c;


# virtual methods
.method public abstract clearNotificationType()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract clearNotifications()V
.end method

.method public abstract getAliases()V
.end method

.method public abstract getNotificationStatus()V
.end method

.method public abstract getRegister()V
.end method

.method public abstract getRegisterID()Ljava/lang/String;
.end method

.method public abstract getTags()V
.end method

.method public abstract getUserAccounts()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract openNotificationSettings()V
.end method

.method public abstract pausePush()V
.end method

.method public abstract register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/heytap/mcssdk/callback/PushCallback;)V
.end method

.method public abstract requestNotificationPermission()V
.end method

.method public abstract resumePush()V
.end method

.method public abstract setAliases(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setNotificationType(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setPushTime(Ljava/util/List;IIII)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;IIII)V"
        }
    .end annotation
.end method

.method public abstract setRegisterID(Ljava/lang/String;)V
.end method

.method public abstract setTags(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setUserAccount(Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setUserAccounts(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract unRegister()V
.end method

.method public abstract unsetAlias(Ljava/lang/String;)V
.end method

.method public abstract unsetAliases(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract unsetTags(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract unsetUserAccounts(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
