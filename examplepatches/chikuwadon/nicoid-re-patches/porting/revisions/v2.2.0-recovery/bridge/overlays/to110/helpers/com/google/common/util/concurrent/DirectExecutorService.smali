.class final Lcom/google/common/util/concurrent/DirectExecutorService;
.super Lcom/google/common/util/concurrent/AbstractListeningExecutorService;
.source "DirectExecutorService.java"


# instance fields
.field private final lock:Ljava/lang/Object;

.field private runningTasks:I

.field private shutdown:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .line 28
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 40
    iput v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    .line 43
    iput-boolean v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    return-void
.end method

.method private endTask()V
    .registers 3

    .line 121
    iget-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 122
    :try_start_0
    iget v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    if-nez v1, :cond_0

    .line 124
    iget-object p0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 126
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private startTask()V
    .registers 3

    .line 111
    iget-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 112
    :try_start_0
    iget-boolean v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    if-nez v1, :cond_0

    .line 115
    iget v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    .line 116
    monitor-exit v0

    return-void

    .line 113
    :cond_0
    new-instance p0, Ljava/util/concurrent/RejectedExecutionException;

    const-string v1, "Executor already shutdown"

    invoke-direct {p0, v1}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 116
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method


# virtual methods
.method public awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 89
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    .line 90
    iget-object p3, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter p3

    .line 92
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    if-nez v0, :cond_0

    const/4 p0, 0x1

    .line 93
    monitor-exit p3

    return p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    const/4 p0, 0x0

    .line 95
    monitor-exit p3

    return p0

    .line 97
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 98
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v3, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    invoke-virtual {v2, v3, p1, p2}, Ljava/util/concurrent/TimeUnit;->timedWait(Ljava/lang/Object;J)V

    .line 99
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, v0

    sub-long/2addr p1, v2

    goto :goto_0

    .line 102
    :goto_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1
.end method

.method public execute(Ljava/lang/Runnable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "command"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Lcom/google/common/util/concurrent/DirectExecutorService;->startTask()V

    .line 50
    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    invoke-direct {p0}, Lcom/google/common/util/concurrent/DirectExecutorService;->endTask()V

    return-void

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lcom/google/common/util/concurrent/DirectExecutorService;->endTask()V

    .line 53
    throw p1
.end method

.method public isShutdown()Z
    .registers 2

    .line 58
    iget-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 59
    :try_start_0
    iget-boolean p0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    monitor-exit v0

    return p0

    .line 60
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public isTerminated()Z
    .registers 3

    .line 82
    iget-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 83
    :try_start_0
    iget-boolean v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    if-eqz v1, :cond_0

    iget p0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    .line 84
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1
.end method

.method public shutdown()V
    .registers 3

    .line 65
    iget-object v0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 66
    :try_start_0
    iput-boolean v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown:Z

    .line 67
    iget v1, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->runningTasks:I

    if-nez v1, :cond_0

    .line 68
    iget-object p0, p0, Lcom/google/common/util/concurrent/DirectExecutorService;->lock:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 70
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public shutdownNow()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 76
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/DirectExecutorService;->shutdown()V

    .line 77
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method
