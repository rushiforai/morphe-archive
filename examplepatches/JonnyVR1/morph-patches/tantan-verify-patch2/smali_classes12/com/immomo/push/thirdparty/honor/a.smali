.class public Lcom/immomo/push/thirdparty/honor/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/thirdparty/IPushEngine;


# static fields
.field protected static b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/immomo/push/thirdparty/honor/a;->a:Landroid/content/Context;

    .line 9
    .line 10
    sput-object p1, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/hihonor/push/sdk/HonorPushClient;->getInstance()Lcom/hihonor/push/sdk/HonorPushClient;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/hihonor/push/sdk/HonorPushClient;->checkSupportHonorPush(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public clearNotify()V
    .locals 0

    return-void
.end method

.method public register()V
    .locals 4

    .line 1
    const-string v0, "honor"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logReg(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/hihonor/push/sdk/HonorPushClient;->getInstance()Lcom/hihonor/push/sdk/HonorPushClient;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Lcom/immomo/push/thirdparty/honor/a;->a:Landroid/content/Context;

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    invoke-virtual {v1, v2, v3}, Lcom/hihonor/push/sdk/HonorPushClient;->init(Landroid/content/Context;Z)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    invoke-static {}, Lcom/hihonor/push/sdk/HonorPushClient;->getInstance()Lcom/hihonor/push/sdk/HonorPushClient;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Lcom/immomo/push/thirdparty/honor/a$a;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Lcom/immomo/push/thirdparty/honor/a$a;-><init>(Lcom/immomo/push/thirdparty/honor/a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/hihonor/push/sdk/HonorPushClient;->getPushToken(Lcom/hihonor/push/sdk/HonorPushCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    const/4 v1, -0x1

    .line 31
    const-string v2, ""

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logRegCallback(Ljava/lang/String;ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public unregister()V
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getRegisteredToken()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0xbba

    .line 12
    .line 13
    const/16 v2, 0xb

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 18
    .line 19
    invoke-interface {p0, v2, v1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 20
    .line 21
    .line 22
    const-string p0, "\u8363\u8000push\u6ce8\u9500\u5931\u8d25\uff0ctoken\u4e3a\u7a7a"

    .line 23
    .line 24
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/hihonor/push/sdk/HonorPushClient;->getInstance()Lcom/hihonor/push/sdk/HonorPushClient;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v3, Lcom/immomo/push/thirdparty/honor/a$b;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Lcom/immomo/push/thirdparty/honor/a$b;-><init>(Lcom/immomo/push/thirdparty/honor/a;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Lcom/hihonor/push/sdk/HonorPushClient;->deletePushToken(Lcom/hihonor/push/sdk/HonorPushCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p0

    .line 42
    sget-object v0, Lcom/immomo/push/thirdparty/honor/a;->b:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 43
    .line 44
    invoke-interface {v0, v2, v1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 45
    .line 46
    .line 47
    const-string v0, "\u8363\u8000push\u6ce8\u9500\u7ed3\u679c\uff1afail"

    .line 48
    .line 49
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
