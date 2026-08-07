.class public Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/thirdparty/IPushEngine;


# static fields
.field static pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 5
    .line 6
    return-void
.end method

.method public static isSupport(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/vivo/push/PushClient;->isSupport()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, "vivo"

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, "vivo push not support"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logIsSupport(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logIsSupport(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return p0
.end method


# virtual methods
.method public clearNotify()V
    .locals 0

    return-void
.end method

.method public register()V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/vivo/push/PushClient;->initialize()V
    :try_end_0
    .catch Lcom/vivo/push/util/VivoPushException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :goto_0
    const-string v0, "vivo"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logReg(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$1;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$1;-><init>(Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/vivo/push/PushClient;->turnOnPush(Lcom/vivo/push/IPushActionListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public unregister()V
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/vivo/push/PushClient;->getInstance(Landroid/content/Context;)Lcom/vivo/push/PushClient;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$2;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine$2;-><init>(Lcom/cosmos/photon/push/thirdparty/vivo/VivoPushEngine;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/vivo/push/PushClient;->turnOffPush(Lcom/vivo/push/IPushActionListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
