.class public Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/push/thirdparty/IPushEngine;


# instance fields
.field isUnregisterFail:Z

.field pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

.field private unregisterFailRetryNumber:I


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/thirdparty/IPushBridge;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->unregisterFailRetryNumber:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 10
    .line 11
    return-void
.end method

.method public static isSupport(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->isSupportPush(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string v0, "OppoPush not support"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const-string v0, "oppo"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logIsSupport(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return p0
.end method


# virtual methods
.method public clearNotify()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/heytap/mcssdk/PushManager;->isSupportPush(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/heytap/mcssdk/PushManager;->clearNotifications()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->printStack(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public register()V
    .locals 6

    .line 1
    const-string v0, "oppopush register "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-boolean v2, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 5
    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    iput v1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->unregisterFailRetryNumber:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception v0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 14
    .line 15
    invoke-interface {v2}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 24
    .line 25
    invoke-interface {v3}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const/16 v4, 0x80

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 40
    .line 41
    const-string v3, "OPPO_PUSH_APPKEY"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "OPPO_PUSH_SECRET"

    .line 48
    .line 49
    invoke-virtual {v2, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v4, "oppo"

    .line 54
    .line 55
    invoke-static {v4}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->logReg(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v0, " "

    .line 67
    .line 68
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v4, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->pushBridge:Lcom/cosmos/photon/push/thirdparty/IPushBridge;

    .line 86
    .line 87
    invoke-interface {v4}, Lcom/cosmos/photon/push/thirdparty/IPushBridge;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    new-instance v5, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;

    .line 92
    .line 93
    invoke-direct {v5, p0}, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushCallback;-><init>(Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v4, v3, v2, v5}, Lcom/heytap/mcssdk/PushManager;->register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/heytap/mcssdk/callback/PushCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :catchall_0
    move-exception p0

    .line 101
    throw p0

    .line 102
    :goto_1
    iput-boolean v1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 103
    .line 104
    new-instance p0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v1, "OPush register \u5931\u8d25:"

    .line 107
    .line 108
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public unregister()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 3
    .line 4
    :try_start_0
    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/heytap/mcssdk/PushManager;->unRegister()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    throw p0

    .line 16
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "OPush unregister \u5931\u8d25:"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/PushLogger;->i(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->unregisterFailRetryNumber:I

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    add-int/2addr v0, v1

    .line 43
    iput v0, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->unregisterFailRetryNumber:I

    .line 44
    .line 45
    iput-boolean v1, p0, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->isUnregisterFail:Z

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/cosmos/photon/push/thirdparty/oppo/OppoPushEngine;->register()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
