.class final Le/e/a/NetworkTask;
.super Ljava/lang/Object;
.source "NetworkTask.java"


# static fields
.field private static final CLOSER:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private volatile cancelled:Z

.field private connection:Ljava/net/HttpURLConnection;

.field private executor:Ljava/util/concurrent/ExecutorService;

.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    new-instance v0, Le/e/a/NetworkTask$2;

    invoke-direct {v0}, Le/e/a/NetworkTask$2;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/NetworkTask;->CLOSER:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .line 8
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-network-close"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .local v0, "thread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method


# virtual methods
.method declared-synchronized bind(Ljava/net/HttpURLConnection;)Z
    .registers 4
    .param p1, "value"    # Ljava/net/HttpURLConnection;

    monitor-enter p0

    .line 19
    :try_start_1
    iget-boolean v0, p0, Le/e/a/NetworkTask;->cancelled:Z

    if-eqz v0, :cond_15

    sget-object v0, Le/e/a/NetworkTask;->CLOSER:Ljava/util/concurrent/ExecutorService;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/NetworkTask$0;

    invoke-direct {v1, p1}, Le/e/a/NetworkTask$0;-><init>(Ljava/net/HttpURLConnection;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_1a

    monitor-exit p0

    const/4 v0, 0x0

    return v0

    .line 20
    .end local p0    # "this":Le/e/a/NetworkTask;
    :cond_15
    :try_start_15
    iput-object p1, p0, Le/e/a/NetworkTask;->connection:Ljava/net/HttpURLConnection;
    :try_end_17
    .catchall {:try_start_15 .. :try_end_17} :catchall_1a

    monitor-exit p0

    const/4 v0, 0x1

    return v0

    .line 18
    .end local p1    # "value":Ljava/net/HttpURLConnection;
    :catchall_1a
    move-exception p1

    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw p1
.end method

.method declared-synchronized cancel()V
    .registers 4

    monitor-enter p0

    .line 24
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Le/e/a/NetworkTask;->cancelled:Z

    .line 25
    iget-object v1, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    .line 26
    iget-object v1, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 29
    iget-object v0, p0, Le/e/a/NetworkTask;->executor:Ljava/util/concurrent/ExecutorService;

    instance-of v0, v0, Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v0, :cond_25

    iget-object v0, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;

    instance-of v0, v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_25

    .line 30
    iget-object v0, p0, Le/e/a/NetworkTask;->executor:Ljava/util/concurrent/ExecutorService;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;

    check-cast v1, Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    .line 31
    .end local p0    # "this":Le/e/a/NetworkTask;
    :cond_25
    iput-object v2, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;

    .line 33
    :cond_27
    iput-object v2, p0, Le/e/a/NetworkTask;->executor:Ljava/util/concurrent/ExecutorService;

    .line 34
    iget-object v0, p0, Le/e/a/NetworkTask;->connection:Ljava/net/HttpURLConnection;

    .local v0, "current":Ljava/net/HttpURLConnection;
    iput-object v2, p0, Le/e/a/NetworkTask;->connection:Ljava/net/HttpURLConnection;

    .line 35
    if-eqz v0, :cond_3c

    sget-object v1, Le/e/a/NetworkTask;->CLOSER:Ljava/util/concurrent/ExecutorService;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Le/e/a/NetworkTask$0;

    invoke-direct {v2, v0}, Le/e/a/NetworkTask$0;-><init>(Ljava/net/HttpURLConnection;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_3c
    .catchall {:try_start_2 .. :try_end_3c} :catchall_3e

    .line 36
    :cond_3c
    monitor-exit p0

    return-void

    .line 23
    .end local v0    # "current":Ljava/net/HttpURLConnection;
    :catchall_3e
    move-exception v0

    :try_start_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v0
.end method

.method cancelled()Z
    .registers 2

    .line 37
    iget-boolean v0, p0, Le/e/a/NetworkTask;->cancelled:Z

    if-nez v0, :cond_11

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_11

    :cond_f
    const/4 v0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v0, 0x1

    :goto_12
    return v0
.end method

.method synthetic lambda$start$1$e-e-a-NetworkTask(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 16
    iget-boolean v0, p0, Le/e/a/NetworkTask;->cancelled:Z

    if-nez v0, :cond_7

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_7
    return-void
.end method

.method declared-synchronized release(Ljava/net/HttpURLConnection;)V
    .registers 3
    .param p1, "value"    # Ljava/net/HttpURLConnection;

    monitor-enter p0

    .line 22
    :try_start_1
    iget-object v0, p0, Le/e/a/NetworkTask;->connection:Ljava/net/HttpURLConnection;

    if-ne v0, p1, :cond_8

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NetworkTask;->connection:Ljava/net/HttpURLConnection;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .end local p0    # "this":Le/e/a/NetworkTask;
    :cond_8
    monitor-exit p0

    return-void

    .line 22
    .end local p1    # "value":Ljava/net/HttpURLConnection;
    :catchall_a
    move-exception p1

    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw p1
.end method

.method declared-synchronized start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;
    .param p2, "runnable"    # Ljava/lang/Runnable;

    monitor-enter p0

    .line 14
    :try_start_1
    iget-boolean v0, p0, Le/e/a/NetworkTask;->cancelled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_16

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    .line 15
    :cond_7
    :try_start_7
    iput-object p1, p0, Le/e/a/NetworkTask;->executor:Ljava/util/concurrent/ExecutorService;

    .line 16
    new-instance v0, Le/e/a/NetworkTask$1;

    invoke-direct {v0, p0, p2}, Le/e/a/NetworkTask$1;-><init>(Le/e/a/NetworkTask;Ljava/lang/Runnable;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NetworkTask;->future:Ljava/util/concurrent/Future;
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_16

    .line 17
    monitor-exit p0

    return-void

    .line 13
    .end local p0    # "this":Le/e/a/NetworkTask;
    .end local p1    # "executor":Ljava/util/concurrent/ExecutorService;
    .end local p2    # "runnable":Ljava/lang/Runnable;
    :catchall_16
    move-exception p1

    :try_start_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw p1
.end method
