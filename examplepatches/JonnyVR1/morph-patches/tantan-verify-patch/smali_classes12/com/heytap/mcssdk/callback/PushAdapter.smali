.class public Lcom/heytap/mcssdk/callback/PushAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/heytap/mcssdk/callback/PushCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onGetNotificationStatus(II)V
    .locals 0

    return-void
.end method

.method public onGetPushStatus(II)V
    .locals 0

    return-void
.end method

.method public onGetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onGetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onRegister(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onSetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSetPushTime(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onSetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnRegister(I)V
    .locals 0

    return-void
.end method

.method public onUnsetAliases(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnsetTags(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onUnsetUserAccounts(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
