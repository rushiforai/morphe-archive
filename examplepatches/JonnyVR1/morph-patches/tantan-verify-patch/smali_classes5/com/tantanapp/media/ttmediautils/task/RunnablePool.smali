.class public Lcom/tantanapp/media/ttmediautils/task/RunnablePool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediautils/task/RunnablePool$Type;,
        Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;,
        Lcom/tantanapp/media/ttmediautils/task/RunnablePool$RejectExecutorHolder;
    }
.end annotation


# static fields
.field public static final IO_OPERATION:I = 0x1

.field public static final IO_WRITE_READ:Ljava/lang/String; = "ttmeida_io_write_read"

.field public static final LIGHT_OPERATION:I = 0x3

.field public static final LIGHT_OPERATION_NAME:Ljava/lang/String; = "ttmeida_light_operation_name"

.field public static final LOGGING:I = 0x4

.field public static final LOGGING_NAME:Ljava/lang/String; = "ttmeida_logging"

.field public static final NETWORK_OPERATION_NAME:Ljava/lang/String; = "ttmeida_network_operation"

.field public static final NET_OPERATION:I = 0x2

.field public static final REJECT_NAME:Ljava/lang/String; = "ttmeida_reject"

.field public static final TASK_DISTRIBUTE:I = 0x5

.field public static final TASK_DISTRIBUTE_NAME:Ljava/lang/String; = "ttmeida_task_distribute_name"

.field private static volatile instance:Lcom/tantanapp/media/ttmediautils/task/RunnablePool;


# instance fields
.field private volatile mIoExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private volatile mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private volatile mLoggingExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private volatile mNetworkExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private volatile mTaskDistributor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private maxSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    iput v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->maxSize:I

    .line 7
    .line 8
    return-void
.end method

.method public static getInstance()Lcom/tantanapp/media/ttmediautils/task/RunnablePool;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->instance:Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->instance:Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->instance:Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

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
    sget-object v0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->instance:Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 27
    .line 28
    return-object v0
.end method

.method private initIOExecutor()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mIoExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mIoExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v8, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 13
    .line 14
    iget v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->maxSize:I

    .line 15
    .line 16
    invoke-direct {v8, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;

    .line 20
    .line 21
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    new-instance v9, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 24
    .line 25
    const-string v0, "ttmeida_io_write_read"

    .line 26
    .line 27
    invoke-direct {v9, v0}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v10, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 31
    .line 32
    const-string v0, "ttmeida_io_write_read"

    .line 33
    .line 34
    invoke-direct {v10, v0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v11, "ttmeida_io_write_read"

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    const/4 v4, 0x4

    .line 41
    const-wide/16 v5, 0x2

    .line 42
    .line 43
    invoke-direct/range {v2 .. v11}, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mIoExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_1
    return-void
.end method

.method private initLoggingExecutor()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLoggingExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLoggingExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 13
    .line 14
    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 18
    .line 19
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    new-instance v9, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 22
    .line 23
    const-string v0, "ttmeida_logging"

    .line 24
    .line 25
    invoke-direct {v9, v0}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v10, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 29
    .line 30
    const-string v0, "ttmeida_logging"

    .line 31
    .line 32
    invoke-direct {v10, v0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    const/4 v4, 0x1

    .line 37
    const-wide/16 v5, 0x0

    .line 38
    .line 39
    invoke-direct/range {v2 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLoggingExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    move-object p0, v0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    monitor-exit v1

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0

    .line 52
    :cond_1
    return-void
.end method

.method private initTaskDistributor()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mTaskDistributor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mTaskDistributor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v8, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 13
    .line 14
    iget v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->maxSize:I

    .line 15
    .line 16
    invoke-direct {v8, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;

    .line 20
    .line 21
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    new-instance v9, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 24
    .line 25
    const-string v0, "ttmeida_task_distribute_name"

    .line 26
    .line 27
    invoke-direct {v9, v0}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v10, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 31
    .line 32
    const-string v0, "ttmeida_task_distribute_name"

    .line 33
    .line 34
    invoke-direct {v10, v0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v11, "ttmeida_task_distribute_name"

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    const/4 v4, 0x1

    .line 41
    const-wide/16 v5, 0x0

    .line 42
    .line 43
    invoke-direct/range {v2 .. v11}, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mTaskDistributor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_1
    return-void
.end method


# virtual methods
.method public addTaskIntoPool(Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;I)V
    .locals 0

    .line 9
    invoke-virtual {p0, p2}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getExecutor(I)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public addTaskIntoPool(Ljava/lang/Runnable;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getExecutor(I)Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getExecutor(I)Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 1
    .param p1    # I
        .annotation build Lcom/tantanapp/media/ttmediautils/task/RunnablePool$Type;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initLightExecutor()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initTaskDistributor()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mTaskDistributor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initLoggingExecutor()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLoggingExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initLightExecutor()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initNetworkExecutor()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mNetworkExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_4
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->initIOExecutor()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mIoExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 50
    .line 51
    return-object p0
.end method

.method public getThread(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/ThreadGroup;

    .line 2
    .line 3
    const-string v0, "TTMedia#ThreadGroup#RunnablePool"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/media/ttmediautils/task/MyThread;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/task/MyThread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setPriority(I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public getThread(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;
    .locals 0

    .line 18
    new-instance p0, Lcom/tantanapp/media/ttmediautils/task/MyThread;

    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/media/ttmediautils/task/MyThread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p1, 0x3

    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setPriority(I)V

    return-object p0
.end method

.method public initLightExecutor()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v8, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 13
    .line 14
    iget v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->maxSize:I

    .line 15
    .line 16
    invoke-direct {v8, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;

    .line 20
    .line 21
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    new-instance v9, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 24
    .line 25
    const-string v0, "ttmeida_light_operation_name"

    .line 26
    .line 27
    invoke-direct {v9, v0}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v10, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 31
    .line 32
    const-string v0, "ttmeida_light_operation_name"

    .line 33
    .line 34
    invoke-direct {v10, v0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v11, "ttmeida_light_operation_name"

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    const/4 v4, 0x4

    .line 41
    const-wide/16 v5, 0x2

    .line 42
    .line 43
    invoke-direct/range {v2 .. v11}, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mLightExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_1
    return-void
.end method

.method public initNetworkExecutor()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mNetworkExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mNetworkExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v8, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 13
    .line 14
    iget v0, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->maxSize:I

    .line 15
    .line 16
    invoke-direct {v8, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;

    .line 20
    .line 21
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    new-instance v9, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 24
    .line 25
    const-string v0, "ttmeida_network_operation"

    .line 26
    .line 27
    invoke-direct {v9, v0}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v10, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 31
    .line 32
    const-string v0, "ttmeida_network_operation"

    .line 33
    .line 34
    invoke-direct {v10, v0}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v11, "ttmeida_network_operation"

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v4, 0x2

    .line 41
    const-wide/16 v5, 0x2

    .line 42
    .line 43
    invoke-direct/range {v2 .. v11}, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->mNetworkExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_1
    return-void
.end method

.method public startThread(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getThread(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
