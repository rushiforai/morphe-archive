.class public Lcom/immomo/push/thirdparty/honor/HonorMsgService;
.super Lcom/hihonor/push/sdk/HonorMessageService;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hihonor/push/sdk/HonorMessageService;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onMessageReceived(Lcom/hihonor/push/sdk/HonorPushDataMsg;)V
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/HonorPushDataMsg;->getData()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onReceivePassThroughMessage(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->printStack(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onNewToken(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    invoke-interface {p0, v0, v1, p1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onPushRegisterResult(IILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
