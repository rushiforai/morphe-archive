.class public Lcom/cosmos/photon/push/PushImManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/push/ConnectStateChangeListener;
.implements Landroid/os/Handler$Callback;
.implements Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/PushImManager$AuthListener;,
        Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;
    }
.end annotation


# static fields
.field public static final AUTH_STATE_AUTHING:I = -0x2

.field public static final AUTH_STATE_AUTHORIZED:I = 0x0

.field public static final AUTH_STATE_AUTH_FAILED:I = 0x193

.field public static final AUTH_STATE_DECRYPT_ERROR:I = 0x190

.field public static final AUTH_STATE_KICK:I = 0x199

.field public static final AUTH_STATE_REDIRECT:I = 0x19a

.field public static final AUTH_STATE_UNAUTHORIZED:I = -0x1

.field private static final CMD_TYPE_AUTH:I = 0x2

.field private static final CMD_TYPE_CONNECT:I = 0x1

.field private static volatile instance:Lcom/cosmos/photon/push/PushImManager;


# instance fields
.field private authListener:Lcom/cosmos/photon/push/PushImManager$AuthListener;

.field private volatile authState:I

.field autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

.field private condition:Ljava/util/concurrent/locks/Condition;

.field private volatile connectRetryCount:I

.field private volatile connectState:I

.field private currentAddress:Lcom/cosmos/photon/push/Address;

.field private volatile currentRetryLevel:I

.field private volatile forbiddenAutoConnect:Z

.field private handler:Landroid/os/Handler;

.field private volatile interrupt:Z

.field private volatile isNetAvailable:Z

.field private lock:Ljava/util/concurrent/locks/Lock;

.field private volatile pausedNetAvailable:Z

.field private processThread:Landroid/os/HandlerThread;

.field private pushAuthInfo:Lcom/cosmos/photon/baseim/push/PushAuthInfo;

.field private pushClient:Lcom/cosmos/photon/baseim/push/PushClient;


# direct methods
.method private constructor <init>()V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 6
    .line 7
    new-instance v1, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v7, 0x2

    .line 11
    invoke-direct {v1, v2, v7, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 15
    .line 16
    const/16 v3, 0x8

    .line 17
    .line 18
    invoke-direct {v2, v7, v3, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 19
    .line 20
    .line 21
    move v4, v3

    .line 22
    new-instance v3, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 23
    .line 24
    const/4 v5, 0x4

    .line 25
    const/16 v6, 0x20

    .line 26
    .line 27
    invoke-direct {v3, v5, v6, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 28
    .line 29
    .line 30
    move v5, v4

    .line 31
    new-instance v4, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 32
    .line 33
    const/16 v8, 0x40

    .line 34
    .line 35
    invoke-direct {v4, v5, v8, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 36
    .line 37
    .line 38
    new-instance v5, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 39
    .line 40
    const/16 v8, 0x10

    .line 41
    .line 42
    const/16 v9, 0x80

    .line 43
    .line 44
    invoke-direct {v5, v8, v9, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 45
    .line 46
    .line 47
    move v8, v6

    .line 48
    new-instance v6, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 49
    .line 50
    invoke-direct {v6, v8, v0, v0}, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;-><init>(III)V

    .line 51
    .line 52
    .line 53
    filled-new-array/range {v1 .. v6}, [Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 58
    .line 59
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Lcom/cosmos/photon/baseim/push/PushContextHolder;->init(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Lcom/cosmos/photon/baseim/push/PushClient;

    .line 67
    .line 68
    invoke-direct {v1}, Lcom/cosmos/photon/baseim/push/PushClient;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 72
    .line 73
    invoke-virtual {v1, p0}, Lcom/cosmos/photon/baseim/push/PushClient;->setConnectStateChangeListener(Lcom/cosmos/photon/baseim/push/ConnectStateChangeListener;)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Landroid/os/HandlerThread;

    .line 77
    .line 78
    const-string v2, "mm_push_proc"

    .line 79
    .line 80
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Lcom/cosmos/photon/push/PushImManager;->processThread:Landroid/os/HandlerThread;

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 86
    .line 87
    .line 88
    new-instance v1, Landroid/os/Handler;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->processThread:Landroid/os/HandlerThread;

    .line 91
    .line 92
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-direct {v1, v2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 97
    .line 98
    .line 99
    iput-object v1, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 100
    .line 101
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    iput-boolean v1, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 106
    .line 107
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->pausedNetAvailable:Z

    .line 108
    .line 109
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 110
    .line 111
    iput v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 112
    .line 113
    iput v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 114
    .line 115
    const/4 v0, -0x1

    .line 116
    iput v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 117
    .line 118
    iput v7, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 119
    .line 120
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 121
    .line 122
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 126
    .line 127
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->condition:Ljava/util/concurrent/locks/Condition;

    .line 132
    .line 133
    invoke-static {p0}, Lcom/cosmos/photon/push/util/NetUtil;->registerNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 137
    .line 138
    sget-object v1, Lcom/immomo/push/pb/BodyType;->DISCONNECT:Lcom/immomo/push/pb/BodyType;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    new-instance v2, Lcom/cosmos/photon/push/PushImManager$1;

    .line 145
    .line 146
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/PushImManager$1;-><init>(Lcom/cosmos/photon/push/PushImManager;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/baseim/push/PushClient;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public static synthetic access$002(Lcom/cosmos/photon/push/PushImManager;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/push/PushImManager$AuthListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->authListener:Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/cosmos/photon/push/PushImManager;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/cosmos/photon/push/PushImManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/PushImManager;->processAp(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/cosmos/photon/push/PushImManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Lock;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Condition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->condition:Ljava/util/concurrent/locks/Condition;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/cosmos/photon/push/PushImManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/cosmos/photon/push/PushImManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PushImManager;->resetAutoRetryLevel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 3

    .line 1
    const-class v0, Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    iput-boolean v2, v1, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 12
    .line 13
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/cosmos/photon/push/PushImManager;->interruptAuth()V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/cosmos/photon/push/util/NetUtil;->unregisterNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V

    .line 21
    .line 22
    .line 23
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/cosmos/photon/baseim/push/PushClient;->removeAllPacketReceiver()V

    .line 28
    .line 29
    .line 30
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/cosmos/photon/baseim/push/PushClient;->release()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v1

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    :goto_0
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/cosmos/photon/push/PushImManager;->processThread:Landroid/os/HandlerThread;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/cosmos/photon/push/PushImManager;->processThread:Landroid/os/HandlerThread;

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 57
    .line 58
    .line 59
    :cond_1
    const/4 v1, 0x0

    .line 60
    sput-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    :cond_2
    monitor-exit v0

    .line 63
    return-void

    .line 64
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw v1
.end method

.method public static getInstance()Lcom/cosmos/photon/push/PushImManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/cosmos/photon/push/PushImManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/cosmos/photon/push/PushImManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/cosmos/photon/push/PushImManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/cosmos/photon/push/PushImManager;->instance:Lcom/cosmos/photon/push/PushImManager;

    .line 27
    .line 28
    return-object v0
.end method

.method private interruptAuth()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    :try_start_0
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->condition:Ljava/util/concurrent/locks/Condition;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :catch_0
    move-exception v0

    .line 28
    :try_start_1
    const-string v1, "MoPush-"

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 37
    .line 38
    .line 39
    throw v0
.end method

.method private isNetAccessible()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 7
    .line 8
    if-gt v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string v0, "Unavailable"

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const-string v0, "Available"

    .line 15
    .line 16
    :goto_1
    iget-boolean v2, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 17
    .line 18
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v3, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 23
    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    filled-new-array {v0, v2, v3}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v2, "MoPush-IM"

    .line 33
    .line 34
    const-string v3, "isNetAccessible : %s (%b, %d)"

    .line 35
    .line 36
    invoke-static {v2, v3, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 40
    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iget p0, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 44
    .line 45
    if-gt p0, v1, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_3
    :goto_2
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method private processAp(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, ":"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length p1, p0

    .line 8
    const/4 v0, 0x2

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget-object p1, p0, p1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    :try_start_0
    aget-object p0, p0, v0

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {}, Lcom/cosmos/photon/push/referee/Referee;->getInstance()Lcom/cosmos/photon/push/referee/Referee;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Lcom/cosmos/photon/push/Address;

    .line 26
    .line 27
    invoke-direct {v1, p1, p0}, Lcom/cosmos/photon/push/Address;-><init>(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/referee/Referee;->setRedirectAddress(Lcom/cosmos/photon/push/Address;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    const-string p1, "MoPush-IM"

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private resetAutoRetryLevel()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 3
    .line 4
    iput v0, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 5
    .line 6
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    move v2, v0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget-object v3, p0, v2

    .line 13
    .line 14
    iput v0, v3, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 15
    .line 16
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public addPshLtBlackList(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "addPshLtBlackList %s"

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "MoPush-IM"

    .line 14
    .line 15
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->addPshLtBlackList(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public connect()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void

    .line 12
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public disconnect()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/push/PushClient;->disconnect()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 8
    .line 9
    if-eq p1, v1, :cond_5

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :cond_1
    const/4 p1, -0x2

    .line 17
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 18
    .line 19
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 23
    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 26
    .line 27
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 28
    .line 29
    sget-object v2, Lcom/immomo/push/pb/BodyType;->SAUTH_RET:Lcom/immomo/push/pb/BodyType;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    new-instance v3, Lcom/cosmos/photon/push/PushImManager$2;

    .line 36
    .line 37
    invoke-direct {v3, p0, p1}, Lcom/cosmos/photon/push/PushImManager$2;-><init>(Lcom/cosmos/photon/push/PushImManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v2, v3}, Lcom/cosmos/photon/baseim/push/PushClient;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 46
    .line 47
    .line 48
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->pushAuthInfo:Lcom/cosmos/photon/baseim/push/PushAuthInfo;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Lcom/cosmos/photon/baseim/push/PushClient;->auth(Lcom/cosmos/photon/baseim/push/PushAuthInfo;)V

    .line 53
    .line 54
    .line 55
    const-wide v2, 0x5d21dba00L

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    :goto_0
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 61
    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    const-wide/16 v4, 0x0

    .line 71
    .line 72
    cmp-long v0, v2, v4

    .line 73
    .line 74
    if-lez v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->condition:Ljava/util/concurrent/locks/Condition;

    .line 77
    .line 78
    invoke-interface {v0, v2, v3}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p1

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .line 89
    if-nez v0, :cond_3

    .line 90
    .line 91
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 92
    .line 93
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 97
    .line 98
    sget-object p1, Lcom/immomo/push/pb/BodyType;->SAUTH_RET:Lcom/immomo/push/pb/BodyType;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->removePacketReceiver(I)V

    .line 105
    .line 106
    .line 107
    return v1

    .line 108
    :cond_3
    :try_start_1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->interrupt:Z

    .line 109
    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_4

    .line 117
    .line 118
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 119
    .line 120
    new-instance v0, Lcom/cosmos/photon/push/PushImManager$3;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/PushImManager$3;-><init>(Lcom/cosmos/photon/push/PushImManager;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    .line 127
    .line 128
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 129
    .line 130
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 134
    .line 135
    sget-object p1, Lcom/immomo/push/pb/BodyType;->SAUTH_RET:Lcom/immomo/push/pb/BodyType;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->removePacketReceiver(I)V

    .line 142
    .line 143
    .line 144
    goto :goto_4

    .line 145
    :goto_2
    :try_start_2
    const-string v0, "MoPush-IM"

    .line 146
    .line 147
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :goto_3
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 152
    .line 153
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 157
    .line 158
    sget-object v0, Lcom/immomo/push/pb/BodyType;->SAUTH_RET:Lcom/immomo/push/pb/BodyType;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/immomo/push/pb/BodyType;->getNumber()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-virtual {p0, v0}, Lcom/cosmos/photon/baseim/push/PushClient;->removePacketReceiver(I)V

    .line 165
    .line 166
    .line 167
    throw p1

    .line 168
    :cond_5
    iget p1, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 169
    .line 170
    if-nez p1, :cond_6

    .line 171
    .line 172
    iget p1, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 173
    .line 174
    if-eq p1, v1, :cond_7

    .line 175
    .line 176
    :cond_6
    iget p1, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 177
    .line 178
    add-int/2addr p1, v1

    .line 179
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager;->connectRetryCount:I

    .line 180
    .line 181
    invoke-static {}, Lcom/cosmos/photon/push/referee/Referee;->getInstance()Lcom/cosmos/photon/push/referee/Referee;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1}, Lcom/cosmos/photon/push/referee/Referee;->getImAddress()Lcom/cosmos/photon/push/Address;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->currentAddress:Lcom/cosmos/photon/push/Address;

    .line 190
    .line 191
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 192
    .line 193
    iget-object v0, p1, Lcom/cosmos/photon/push/Address;->host:Ljava/lang/String;

    .line 194
    .line 195
    iget p1, p1, Lcom/cosmos/photon/push/Address;->port:I

    .line 196
    .line 197
    invoke-virtual {p0, v0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->connect(Ljava/lang/String;I)V

    .line 198
    .line 199
    .line 200
    :cond_7
    :goto_4
    return v1
.end method

.method public isWorking()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public notifySyncMsgSaved(Ljava/lang/String;J)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/cosmos/photon/baseim/push/PushClient;->notifyMessageSaved(Ljava/lang/String;J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onConnectStateChanged(I)V
    .locals 4

    .line 1
    const-string v0, "MoPush-IM"

    .line 2
    .line 3
    :try_start_0
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager;->connectState:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/cosmos/photon/push/referee/Referee;->getInstance()Lcom/cosmos/photon/push/referee/Referee;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->currentAddress:Lcom/cosmos/photon/push/Address;

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Lcom/cosmos/photon/push/referee/Referee;->success(Lcom/cosmos/photon/push/Address;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    if-ne v1, p1, :cond_7

    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/cosmos/photon/push/referee/Referee;->getInstance()Lcom/cosmos/photon/push/referee/Referee;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v1, p0, Lcom/cosmos/photon/push/PushImManager;->currentAddress:Lcom/cosmos/photon/push/Address;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Lcom/cosmos/photon/push/referee/Referee;->failed(Lcom/cosmos/photon/push/Address;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 42
    .line 43
    new-instance v1, Lcom/cosmos/photon/push/PushImManager$4;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PushImManager$4;-><init>(Lcom/cosmos/photon/push/PushImManager;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    iget-boolean p1, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 52
    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_2
    invoke-direct {p0}, Lcom/cosmos/photon/push/PushImManager;->isNetAccessible()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 v1, 0x1

    .line 62
    if-eqz p1, :cond_6

    .line 63
    .line 64
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 65
    .line 66
    iget v2, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 67
    .line 68
    aget-object p1, p1, v2

    .line 69
    .line 70
    iget v2, p1, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 71
    .line 72
    add-int/2addr v2, v1

    .line 73
    iput v2, p1, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 74
    .line 75
    const-string p1, "Auto Connect retry %d times at level_%d "

    .line 76
    .line 77
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 78
    .line 79
    iget v3, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 80
    .line 81
    aget-object v2, v2, v3

    .line 82
    .line 83
    iget v2, v2, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 84
    .line 85
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iget v3, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 90
    .line 91
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v0, p1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 103
    .line 104
    iget v2, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 105
    .line 106
    aget-object p1, p1, v2

    .line 107
    .line 108
    iget p1, p1, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->currentRetryCount:I

    .line 109
    .line 110
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 111
    .line 112
    iget v3, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 113
    .line 114
    aget-object v2, v2, v3

    .line 115
    .line 116
    iget v2, v2, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->maxRetryCount:I

    .line 117
    .line 118
    if-lt p1, v2, :cond_4

    .line 119
    .line 120
    iget p1, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 121
    .line 122
    const/4 v2, 0x5

    .line 123
    if-ge p1, v2, :cond_3

    .line 124
    .line 125
    iget p1, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 126
    .line 127
    add-int/2addr p1, v1

    .line 128
    iput p1, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 129
    .line 130
    const-string p1, "Auto Connect retry level increase to %d"

    .line 131
    .line 132
    iget v2, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 133
    .line 134
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-static {v0, p1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_3
    const-string p1, "Auto Connect at highest level"

    .line 147
    .line 148
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->autoRetryLevelStep:[Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;

    .line 152
    .line 153
    iget v2, p0, Lcom/cosmos/photon/push/PushImManager;->currentRetryLevel:I

    .line 154
    .line 155
    aget-object p1, p1, v2

    .line 156
    .line 157
    iget p1, p1, Lcom/cosmos/photon/push/PushImManager$RETRY_LEVEL;->waitTime:I

    .line 158
    .line 159
    const-string v2, "reconnect delay %d seconds"

    .line 160
    .line 161
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-static {v0, v2, v3}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 173
    .line 174
    invoke-virtual {v2, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eqz v2, :cond_5

    .line 179
    .line 180
    const-string p0, "already has connect message,no need to repeat send another"

    .line 181
    .line 182
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_5
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 187
    .line 188
    mul-int/lit16 p1, p1, 0x3e8

    .line 189
    .line 190
    int-to-long v2, p1

    .line 191
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_6
    const-string p1, "network unavailable, pause reconnect"

    .line 196
    .line 197
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iput-boolean v1, p0, Lcom/cosmos/photon/push/PushImManager;->pausedNetAvailable:Z

    .line 201
    .line 202
    return-void

    .line 203
    :cond_7
    const/4 v1, 0x3

    .line 204
    if-ne v1, p1, :cond_8

    .line 205
    .line 206
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 207
    .line 208
    new-instance v1, Lcom/cosmos/photon/push/PushImManager$5;

    .line 209
    .line 210
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PushImManager$5;-><init>(Lcom/cosmos/photon/push/PushImManager;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    .line 215
    .line 216
    :cond_8
    :goto_1
    return-void

    .line 217
    :goto_2
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public onNetworkChanged()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->isNetAvailable:Z

    .line 8
    .line 9
    const-string v1, "MoPush-IM"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string v0, "onNetworkChanged available"

    .line 14
    .line 15
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->pausedNetAvailable:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->forbiddenAutoConnect:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PushImManager;->pausedNetAvailable:Z

    .line 28
    .line 29
    const-string v0, "reconnect when network restored"

    .line 30
    .line 31
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->handler:Landroid/os/Handler;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    const-string p0, "onNetworkChanged unavailable"

    .line 42
    .line 43
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/photon/baseim/push/PushClient;->registerPacketReceiver(ILcom/cosmos/photon/baseim/push/PacketReceiver;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removePshLtBlackList(Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "removePshLtBlackList %s"

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "MoPush-IM"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->removePshLtBlackList(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public sendProbePacket()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/cosmos/photon/baseim/push/PushClient;->sendProbePacket()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public sendSyncRequest(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PushImManager;->authState:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "sendSyncRequest %s"

    .line 8
    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "MoPush-IM"

    .line 14
    .line 15
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager;->pushClient:Lcom/cosmos/photon/baseim/push/PushClient;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/baseim/push/PushClient;->sendSyncRequest(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setAuthListener(Lcom/cosmos/photon/push/PushImManager$AuthListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->authListener:Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 2
    .line 3
    return-void
.end method

.method public setPushAuthInfo(Lcom/cosmos/photon/baseim/push/PushAuthInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager;->pushAuthInfo:Lcom/cosmos/photon/baseim/push/PushAuthInfo;

    .line 2
    .line 3
    return-void
.end method
