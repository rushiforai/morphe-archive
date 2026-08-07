.class public interface abstract Lcom/heytap/mcssdk/callback/PushCallback;
.super Ljava/lang/Object;


# virtual methods
.method public abstract onGetAliases(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onGetNotificationStatus(II)V
.end method

.method public abstract onGetPushStatus(II)V
.end method

.method public abstract onGetTags(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onGetUserAccounts(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onRegister(ILjava/lang/String;)V
.end method

.method public abstract onSetAliases(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onSetPushTime(ILjava/lang/String;)V
.end method

.method public abstract onSetTags(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onSetUserAccounts(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onUnRegister(I)V
.end method

.method public abstract onUnsetAliases(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onUnsetTags(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onUnsetUserAccounts(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation
.end method
