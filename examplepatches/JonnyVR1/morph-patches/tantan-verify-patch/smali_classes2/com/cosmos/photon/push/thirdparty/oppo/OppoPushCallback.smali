.class public Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/heytap/mcssdk/callback/PushCallback;


# instance fields
.field mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;->mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 5
    .line 6
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
    .locals 3

    .line 1
    const-string v0, "oppo"

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logRegCallback(Ljava/lang/String;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xa

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    const-string p1, "OPush register \u6210\u529f"

    .line 11
    .line 12
    invoke-static {p1}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "RegistrationId:"

    .line 18
    .line 19
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;->mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 33
    .line 34
    iget-boolean p1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->unregister()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 43
    .line 44
    const/16 p1, 0x3e9

    .line 45
    .line 46
    invoke-interface {p0, v0, p1, p2}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onPushRegisterResult(IILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "OPush register \u5931\u8d25:"

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p1, " message:"

    .line 61
    .line 62
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;->mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 76
    .line 77
    const/4 p1, 0x0

    .line 78
    iput-boolean p1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 79
    .line 80
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 81
    .line 82
    const/16 p1, 0x3ea

    .line 83
    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-interface {p0, v0, p1, p2}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onPushRegisterResult(IILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
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
    .locals 3

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "OPush \u6ce8\u9500 \u6210\u529f"

    .line 6
    .line 7
    invoke-static {p1}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;->mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 13
    .line 14
    const/16 p1, 0xbb9

    .line 15
    .line 16
    invoke-interface {p0, v0, p1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "OPush \u6ce8\u9500 \u5931\u8d25:"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;->mPushEngine:Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 40
    .line 41
    const/16 p1, 0xbba

    .line 42
    .line 43
    invoke-interface {p0, v0, p1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 44
    .line 45
    .line 46
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
