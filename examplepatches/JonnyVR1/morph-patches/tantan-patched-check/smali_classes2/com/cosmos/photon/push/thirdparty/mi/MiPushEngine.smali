.class public Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;
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
    sput-object p1, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clearNotify()V
    .locals 0

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public register()V
    .locals 3

    .line 1
    const-string p0, "mipush register "

    .line 2
    .line 3
    :try_start_0
    const-string v0, "xiaomi"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logReg(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 19
    .line 20
    invoke-interface {v1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/16 v2, 0x80

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 35
    .line 36
    const-string v1, "MI_PUSH_APPID"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "MI_PUSH_APPKEY"

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, " "

    .line 65
    .line 66
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 80
    .line 81
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0, v1, v0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->registerPush(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    .line 88
    :catch_0
    return-void
.end method

.method public unregister()V
    .locals 2

    .line 1
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->unregisterPush(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u5c0f\u7c73push \u6ce8\u9500\u6210\u529f"

    .line 11
    .line 12
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/cosmos/photon/push/thirdparty/mi/MiPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 16
    .line 17
    const/16 v0, 0xb

    .line 18
    .line 19
    const/16 v1, 0xbb9

    .line 20
    .line 21
    invoke-interface {p0, v0, v1}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->onUnRegisterResult(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
