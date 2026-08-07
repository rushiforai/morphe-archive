.class public Lcom/cosmos/photon/push/util/ThreadUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/util/ThreadUtils$PhotonThreadFactory;
    }
.end annotation


# static fields
.field private static final DEFAULT_KEEP_ALIVE_TIME:J = 0x1eL

.field private static final DEFAULT_KEEP_CORE_SIZE:I = 0x0

.field private static final DEFAULT_KEEP_MAX_SIZE:I = 0xa

.field private static final DEFAULT_UNIT:Ljava/util/concurrent/TimeUnit;

.field private static rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    sput-object v0, Lcom/cosmos/photon/push/util/ThreadUtils;->DEFAULT_UNIT:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
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

.method public static declared-synchronized execute(Ljava/lang/Runnable;)V
    .locals 4

    const-class v0, Lcom/cosmos/photon/push/util/ThreadUtils;

    monitor-enter v0

    .line 33
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x0

    invoke-static {p0, v2, v3, v1}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static declared-synchronized execute(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V
    .locals 3

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/ThreadUtils;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/push/util/ThreadUtils;->initPool()V

    .line 5
    .line 6
    .line 7
    sget-boolean v1, Lcom/cosmos/photon/push/util/AppContext;->DEBUGGABLE:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 12
    .line 13
    new-instance v2, Lcom/cosmos/photon/push/util/ThreadUtils$1;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/util/ThreadUtils$1;-><init>(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2, p1, p2, p3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    sget-object v1, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 25
    .line 26
    invoke-virtual {v1, p0, p1, p2, p3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :goto_0
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0
.end method

.method private static declared-synchronized initPool()V
    .locals 5

    .line 1
    const-class v0, Lcom/cosmos/photon/push/util/ThreadUtils;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 9
    .line 10
    new-instance v2, Lcom/cosmos/photon/push/util/ThreadUtils$PhotonThreadFactory;

    .line 11
    .line 12
    invoke-direct {v2}, Lcom/cosmos/photon/push/util/ThreadUtils$PhotonThreadFactory;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v3, Lcom/cosmos/photon/push/util/ThreadUtils$2;

    .line 16
    .line 17
    invoke-direct {v3}, Lcom/cosmos/photon/push/util/ThreadUtils$2;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-direct {v1, v4, v2, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 25
    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->setMaximumPoolSize(I)V

    .line 29
    .line 30
    .line 31
    sget-object v1, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 32
    .line 33
    sget-object v2, Lcom/cosmos/photon/push/util/ThreadUtils;->DEFAULT_UNIT:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    const-wide/16 v3, 0x1e

    .line 36
    .line 37
    invoke-virtual {v1, v3, v4, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit v0

    .line 44
    return-void

    .line 45
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    throw v1
.end method

.method public static submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;)",
            "Ljava/util/concurrent/Future<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/ThreadUtils;->initPool()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/cosmos/photon/push/util/ThreadUtils;->rightNowPool:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
