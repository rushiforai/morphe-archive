.class public Lcom/cosmos/photon/push/service/PushService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;
    }
.end annotation


# static fields
.field public static final COMMAND_BIND:Ljava/lang/String; = "bind"

.field public static final COMMAND_CREATE:Ljava/lang/String; = "create"

.field public static final KEY_ALIAS:Ljava/lang/String; = "alias"

.field public static final KEY_CHANNEL:Ljava/lang/String; = "channel"

.field public static final KEY_COMMAND:Ljava/lang/String; = "cmd"

.field public static final KEY_PACKAGE:Ljava/lang/String; = "package"

.field public static final KEY_TOKEN:Ljava/lang/String; = "token"


# instance fields
.field private final aliasSetMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private channelListening:Z

.field private currentChannelId:Ljava/lang/String;

.field private hasChannel:Z

.field private volatile isImInited:Z

.field private mAlias:Ljava/lang/String;

.field private pkgName:Ljava/lang/String;

.field private sWorker:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

.field private selfToken:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->isImInited:Z

    .line 6
    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/cosmos/photon/push/service/PushService;->aliasSetMap:Ljava/util/Map;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->channelListening:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic access$100(Lcom/cosmos/photon/push/service/PushService;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/cosmos/photon/push/service/PushService;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/service/PushService;->hasChannel:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/cosmos/photon/push/service/PushService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/service/PushService;->watchImStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/cosmos/photon/push/service/PushService;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService;->selfToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/cosmos/photon/push/service/PushService;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService;->aliasSetMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method private blockLt(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private checkSyncLt(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/DeviceUtils;->clearAppInstallCache()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string p1, "*"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/PushImManager;->sendSyncRequest(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private exeCommand(ILandroid/content/Intent;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 8

    .line 1
    const-string v1, "MoPush-Channel"

    .line 2
    .line 3
    :try_start_0
    const-string v0, "cmd"

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    const-string v0, "channel"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    const-string v0, "exeCommand %s PushService channelId = %s"

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {v2, v7}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1, v0, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "package"

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v6, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v6, :cond_1

    .line 49
    .line 50
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    if-eqz p3, :cond_0

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p3, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    .line 64
    move-object p0, v0

    .line 65
    goto :goto_5

    .line 66
    :cond_0
    :goto_0
    new-instance v2, Lcom/cosmos/photon/push/service/PushService$1;

    .line 67
    .line 68
    move-object v3, p0

    .line 69
    invoke-direct/range {v2 .. v7}, Lcom/cosmos/photon/push/service/PushService$1;-><init>(Lcom/cosmos/photon/push/service/PushService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    move-object v3, p0

    .line 77
    :goto_1
    iput-object v7, v3, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 78
    .line 79
    const-string p0, "token"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iput-object p0, v3, Lcom/cosmos/photon/push/service/PushService;->selfToken:Ljava/lang/String;

    .line 86
    .line 87
    const-string p0, "alias"

    .line 88
    .line 89
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iput-object p0, v3, Lcom/cosmos/photon/push/service/PushService;->mAlias:Ljava/lang/String;

    .line 94
    .line 95
    iput-object v5, v3, Lcom/cosmos/photon/push/service/PushService;->pkgName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .line 97
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    const/4 p0, 0x1

    .line 105
    if-ne p1, p0, :cond_3

    .line 106
    .line 107
    const-string p1, "onStartCommand"

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    const-string p1, "onBind"

    .line 111
    .line 112
    :goto_2
    iget-object p2, v3, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 113
    .line 114
    iget-object p3, v3, Lcom/cosmos/photon/push/service/PushService;->selfToken:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v0, v3, Lcom/cosmos/photon/push/service/PushService;->mAlias:Ljava/lang/String;

    .line 117
    .line 118
    filled-new-array {p1, v4, p2, p3, v0}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string p2, "%s command: %s channelId:%s token:%s alias:%s"

    .line 123
    .line 124
    invoke-static {v1, p2, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    .line 129
    .line 130
    const-string p1, "create"

    .line 131
    .line 132
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-nez p1, :cond_4

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_4
    iput-boolean p0, v3, Lcom/cosmos/photon/push/service/PushService;->hasChannel:Z

    .line 140
    .line 141
    invoke-direct {v3}, Lcom/cosmos/photon/push/service/PushService;->listenChannel()V

    .line 142
    .line 143
    .line 144
    invoke-direct {v3}, Lcom/cosmos/photon/push/service/PushService;->watchImStatus()V

    .line 145
    .line 146
    .line 147
    :goto_3
    iget-object p0, v3, Lcom/cosmos/photon/push/service/PushService;->pkgName:Ljava/lang/String;

    .line 148
    .line 149
    iget-object p1, v3, Lcom/cosmos/photon/push/service/PushService;->mAlias:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-nez p1, :cond_5

    .line 156
    .line 157
    iget-object p1, v3, Lcom/cosmos/photon/push/service/PushService;->mAlias:Ljava/lang/String;

    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_5
    iget-object p1, v3, Lcom/cosmos/photon/push/service/PushService;->selfToken:Ljava/lang/String;

    .line 161
    .line 162
    :goto_4
    invoke-direct {v3, p0, p1}, Lcom/cosmos/photon/push/service/PushService;->checkSyncLt(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :goto_5
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private declared-synchronized initPushImManager()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->isImInited:Z

    .line 4
    .line 5
    new-instance v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/cosmos/photon/baseim/push/PushAuthInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getAppId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->appId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->deviceId:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/cosmos/photon/push/service/PushService;->selfToken:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->token:Ljava/lang/String;

    .line 23
    .line 24
    const/16 v1, 0x3016

    .line 25
    .line 26
    iput v1, v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->version:I

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/cosmos/photon/push/util/DeviceUtils;->getModle()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, "@"

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/cosmos/photon/push/util/DeviceUtils;->getManufacturer()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/cosmos/photon/baseim/push/PushAuthInfo;->clientType:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/PushImManager;->setPushAuthInfo(Lcom/cosmos/photon/baseim/push/PushAuthInfo;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget-object v1, Lcom/immomo/push/pb/BodyType;->MSG:Lcom/immomo/push/pb/BodyType;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    new-instance v2, Lcom/cosmos/photon/push/service/PushService$2;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/service/PushService$2;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/PushImManager;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget-object v1, Lcom/immomo/push/pb/BodyType;->MSGV2:Lcom/immomo/push/pb/BodyType;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    new-instance v2, Lcom/cosmos/photon/push/service/PushService$3;

    .line 94
    .line 95
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/service/PushService$3;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/PushImManager;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget-object v1, Lcom/immomo/push/pb/BodyType;->NOTIFY:Lcom/immomo/push/pb/BodyType;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    new-instance v2, Lcom/cosmos/photon/push/service/PushService$4;

    .line 112
    .line 113
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/service/PushService$4;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/PushImManager;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget-object v1, Lcom/immomo/push/pb/BodyType;->NOTIFYV2:Lcom/immomo/push/pb/BodyType;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    new-instance v2, Lcom/cosmos/photon/push/service/PushService$5;

    .line 130
    .line 131
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/service/PushService$5;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/PushImManager;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Lcom/cosmos/photon/push/service/PushService$6;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/service/PushService$6;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/PushImManager;->setAuthListener(Lcom/cosmos/photon/push/PushImManager$AuthListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    .line 148
    .line 149
    monitor-exit p0

    .line 150
    return-void

    .line 151
    :catchall_0
    move-exception v0

    .line 152
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    throw v0
.end method

.method private listenChannel()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->channelListening:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->channelListening:Z

    .line 8
    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v1, 0x1c

    .line 12
    .line 13
    if-ge v0, v1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->sWorker:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->sWorker:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->sWorker:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->start(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->registerChannelReceiver(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v0, p0}, Lcom/cosmos/photon/push/channel/inner/FileChannel;->writeConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private onDispatchFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private onDispatchSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private stopChannel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->hasChannel:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->channelListening:Z

    .line 5
    .line 6
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService;->currentChannelId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/cosmos/photon/push/channel/inner/FileChannel;->deleteConfig(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->unRegisterChannelReceiver()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/cosmos/photon/push/service/PushService;->sWorker:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->stop()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private watchImStatus()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->isImInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/cosmos/photon/push/service/PushService;->initPushImManager()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PushImManager;->isWorking()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PushImManager;->connect()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, v0, p1, v1}, Lcom/cosmos/photon/push/service/PushService;->exeCommand(ILandroid/content/Intent;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;

    .line 7
    .line 8
    invoke-direct {p1, p0, v1}, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;-><init>(Lcom/cosmos/photon/push/service/PushService;Lcom/cosmos/photon/push/service/PushService$1;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public onCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MoPush-Channel"

    .line 5
    .line 6
    const-string v1, "onCreate"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Lcom/cosmos/photon/push/util/NetUtil;->init(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/service/PushService$7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/service/PushService$7;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/cosmos/photon/push/service/PushService;->hasChannel:Z

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/cosmos/photon/push/service/PushService;->stopChannel()V

    .line 13
    .line 14
    .line 15
    const-string v0, "MoPush-Channel"

    .line 16
    .line 17
    const-string v1, "onDestroy"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->destroy()V

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string p3, "MoPush-Channel"

    .line 14
    .line 15
    const-string v0, "onStartCommand %d %d"

    .line 16
    .line 17
    invoke-static {p3, v0, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x2

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return p2

    .line 24
    :cond_0
    new-instance p3, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-direct {p3, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v0, p1, p3}, Lcom/cosmos/photon/push/service/PushService;->exeCommand(ILandroid/content/Intent;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 31
    .line 32
    .line 33
    return p2
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2

    .line 1
    const-string v0, "MoPush-Channel"

    .line 2
    .line 3
    const-string v1, "onUnbind"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
