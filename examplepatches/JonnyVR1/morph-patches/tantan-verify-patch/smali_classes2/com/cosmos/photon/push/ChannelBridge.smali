.class public Lcom/cosmos/photon/push/ChannelBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAX_FAILEDTIMES:I = 0xa

.field private static final MAX_FAILEDTIMES_NO_OPPO:I = 0x14

.field private static deviceId:Ljava/lang/String;

.field private static failedTimes:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile handler:Landroid/os/Handler;

.field private static final handlerLock:Ljava/lang/Object;

.field private static isOppo:Z

.field private static isRunningInMainProcess:Z

.field static listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

.field protected static pushConfigPrivateChannel:Z

.field private static volatile sAlias:Ljava/lang/String;

.field private static volatile sToken:Ljava/lang/String;

.field private static volatile useDeviceId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->failedTimes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->handlerLock:Ljava/lang/Object;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    sput-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 17
    .line 18
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$7;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/cosmos/photon/push/ChannelBridge$7;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->sendProbePacket()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->sToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->sAlias:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$400(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/cosmos/photon/push/ChannelBridge;->start(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->checkCreateChannel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->createChannel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static declared-synchronized check()V
    .locals 2

    .line 1
    const-class v0, Lcom/cosmos/photon/push/ChannelBridge;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->deviceId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->initChannel()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    throw v1
.end method

.method private static checkCreateChannel()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->shouldLimit()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->failedTimes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->getMaxFailedtimes()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lt v0, v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->handler:Landroid/os/Handler;

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->handlerLock:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v2, Lcom/cosmos/photon/push/ChannelBridge;->handler:Landroid/os/Handler;

    .line 29
    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    new-instance v2, Landroid/os/Handler;

    .line 33
    .line 34
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lcom/cosmos/photon/push/ChannelBridge;->handler:Landroid/os/Handler;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    monitor-exit v1

    .line 47
    goto :goto_2

    .line 48
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw v0

    .line 50
    :cond_2
    :goto_2
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->handler:Landroid/os/Handler;

    .line 51
    .line 52
    new-instance v2, Lcom/cosmos/photon/push/ChannelBridge$8;

    .line 53
    .line 54
    invoke-direct {v2}, Lcom/cosmos/photon/push/ChannelBridge$8;-><init>()V

    .line 55
    .line 56
    .line 57
    mul-int/lit16 v0, v0, 0x3e8

    .line 58
    .line 59
    int-to-long v3, v0

    .line 60
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->createChannel()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private static createChannel()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$5;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/cosmos/photon/push/ChannelBridge$5;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->check()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 5
    .line 6
    return-object v0
.end method

.method private static getMaxFailedtimes()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isOppo:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/16 v0, 0x14

    .line 9
    .line 10
    return v0
.end method

.method private static initChannel()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->isRunningInMainProcess()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 6
    .line 7
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/siw;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->deviceId:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "initChannel gen deviceId : %s"

    .line 18
    .line 19
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v2, "MoPush-Channel"

    .line 24
    .line 25
    invoke-static {v2, v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->deviceId:Ljava/lang/String;

    .line 29
    .line 30
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 31
    .line 32
    sget-boolean v0, Lcom/cosmos/photon/push/PhotonPushManager;->uniqueChannel:Z

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->pushConfigPrivateChannel:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->deviceId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, ":+"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 67
    .line 68
    :cond_1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->getDeviceId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    sget-object v1, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->useDeviceId:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveDeviceId(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lcom/cosmos/photon/push/ApiCacheUtil;->clearAll()V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ljava/lang/Exception;

    .line 99
    .line 100
    const-string v1, "deviceid\u51fa\u73b0\u4e0d\u4e00\u81f4\u95ee\u9898"

    .line 101
    .line 102
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->watchFixChannelIdChange()V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method private static sendProbePacket()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$6;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/cosmos/photon/push/ChannelBridge$6;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static setAlias(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$3;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/ChannelBridge$3;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static shouldLimit()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method

.method public static start(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 58
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    if-nez v0, :cond_0

    return-void

    .line 59
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 60
    const-string p0, "MoPush-Channel"

    const-string p1, "start failed, self token is null"

    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 61
    :cond_1
    sput-object p0, Lcom/cosmos/photon/push/ChannelBridge;->sToken:Ljava/lang/String;

    .line 62
    sput-object p1, Lcom/cosmos/photon/push/ChannelBridge;->sAlias:Ljava/lang/String;

    .line 63
    const-string p0, "oppo"

    sget-object p1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    sput-boolean p0, Lcom/cosmos/photon/push/ChannelBridge;->isOppo:Z

    .line 64
    sget-object p0, Lcom/cosmos/photon/push/ChannelBridge;->failedTimes:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    .line 65
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->check()V

    .line 66
    invoke-static {p1}, Lcom/cosmos/photon/push/ChannelBridge;->start(Z)V

    return-void
.end method

.method private static start(Z)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    new-instance p0, Ljava/util/Random;

    .line 19
    .line 20
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/util/Random;->nextInt(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "MoPush-Channel"

    .line 38
    .line 39
    const-string v2, "random sleep %d seconds"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    :goto_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$1;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/cosmos/photon/push/ChannelBridge$1;-><init>()V

    .line 49
    .line 50
    .line 51
    int-to-long v1, p0

    .line 52
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 53
    .line 54
    invoke-static {v0, v1, v2, p0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static stopSync(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->sToken:Ljava/lang/String;

    .line 8
    .line 9
    sput-object v0, Lcom/cosmos/photon/push/ChannelBridge;->sAlias:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v0, Lcom/cosmos/photon/push/ChannelBridge;->listener:Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/cosmos/photon/push/channel/IChannelManager$ChannelListener;->getChannel()Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v1, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "key_token"

    .line 25
    .line 26
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "logout"

    .line 30
    .line 31
    invoke-interface {v0, v1, p0}, Lcom/cosmos/photon/push/channel/IChannelManager$IChannel;->executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public static unsetAlias(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$4;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/ChannelBridge$4;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static watchFixChannelIdChange()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/ChannelBridge;->isRunningInMainProcess:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/ChannelBridge$2;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/cosmos/photon/push/ChannelBridge$2;-><init>()V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x2

    .line 12
    .line 13
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v3}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
