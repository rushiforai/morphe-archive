.class public Lcom/ss/bytertc/engine/utils/LogRecover;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static instance:Lcom/ss/bytertc/engine/utils/LogRecover;

.field private static isRunning:Z

.field private static timer:Ljava/util/Timer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/utils/LogRecover;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/utils/LogRecover;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/ss/bytertc/engine/utils/LogRecover;
    .locals 3

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogRecover;->instance:Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogRecover;->instance:Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/ss/bytertc/engine/utils/LogRecover;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/ss/bytertc/engine/utils/LogRecover;->instance:Lcom/ss/bytertc/engine/utils/LogRecover;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    :try_start_1
    new-instance v1, Ljava/util/Timer;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcom/ss/bytertc/engine/utils/LogRecover;->timer:Ljava/util/Timer;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    :try_start_2
    sput-boolean v1, Lcom/ss/bytertc/engine/utils/LogRecover;->isRunning:Z

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    goto :goto_1

    .line 32
    :catch_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    const-string v2, "LogRecover timer create failed as out of memory"

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw v1

    .line 40
    :cond_0
    :goto_0
    monitor-exit v0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    throw v1

    .line 44
    :cond_1
    :goto_2
    sget-object v0, Lcom/ss/bytertc/engine/utils/LogRecover;->instance:Lcom/ss/bytertc/engine/utils/LogRecover;

    .line 45
    .line 46
    return-object v0
.end method

.method public static native nativeSendLogRecoverRequest()V
.end method

.method private runOnUIThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Landroid/os/Handler;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public declared-synchronized startTimer()V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/ss/bytertc/engine/utils/LogRecover;->isRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    new-instance v2, Lcom/ss/bytertc/engine/utils/LogRecover$1;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Lcom/ss/bytertc/engine/utils/LogRecover$1;-><init>(Lcom/ss/bytertc/engine/utils/LogRecover;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/ss/bytertc/engine/utils/LogRecover;->timer:Ljava/util/Timer;

    .line 14
    .line 15
    const-wide/16 v3, 0x3e8

    .line 16
    .line 17
    const-wide/32 v5, 0x927c0

    .line 18
    .line 19
    .line 20
    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    sput-boolean v0, Lcom/ss/bytertc/engine/utils/LogRecover;->isRunning:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    throw v0
.end method
