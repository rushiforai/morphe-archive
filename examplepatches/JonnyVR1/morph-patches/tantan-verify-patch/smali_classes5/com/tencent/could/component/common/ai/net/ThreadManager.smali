.class public Lcom/tencent/could/component/common/ai/net/ThreadManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:Lcom/tencent/could/component/common/ai/net/ThreadManager;


# instance fields
.field public a:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/concurrent/ThreadPoolExecutor;

.field public c:Ljava/util/concurrent/DelayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/DelayQueue<",
            "Lcom/tencent/could/component/common/ai/net/HttpTask;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/tencent/could/component/common/ai/net/HttpTask;

.field public e:Ljava/lang/Runnable;

.field public failedRunnable:Ljava/lang/Runnable;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/could/component/common/ai/net/ThreadManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->f:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/DelayQueue;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/DelayQueue;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->c:Ljava/util/concurrent/DelayQueue;

    .line 17
    .line 18
    new-instance v0, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/tencent/could/component/common/ai/net/ThreadManager$1;-><init>(Lcom/tencent/could/component/common/ai/net/ThreadManager;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->failedRunnable:Ljava/lang/Runnable;

    .line 24
    .line 25
    new-instance v0, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/tencent/could/component/common/ai/net/ThreadManager$2;-><init>(Lcom/tencent/could/component/common/ai/net/ThreadManager;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->e:Ljava/lang/Runnable;

    .line 31
    .line 32
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 33
    .line 34
    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 35
    .line 36
    const/4 v0, 0x4

    .line 37
    invoke-direct {v7, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 38
    .line 39
    .line 40
    new-instance v8, Lcom/tencent/could/component/common/ai/net/ThreadManager$3;

    .line 41
    .line 42
    invoke-direct {v8, p0}, Lcom/tencent/could/component/common/ai/net/ThreadManager$3;-><init>(Lcom/tencent/could/component/common/ai/net/ThreadManager;)V

    .line 43
    .line 44
    .line 45
    const/16 v3, 0xa

    .line 46
    .line 47
    const-wide/16 v4, 0xf

    .line 48
    .line 49
    const/4 v2, 0x3

    .line 50
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 51
    .line 52
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->e:Ljava/lang/Runnable;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->failedRunnable:Ljava/lang/Runnable;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static getInstance()Lcom/tencent/could/component/common/ai/net/ThreadManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->f:Lcom/tencent/could/component/common/ai/net/ThreadManager;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public addFailedTask(Lcom/tencent/could/component/common/ai/net/HttpTask;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-wide/16 v0, 0x3e8

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1}, Lcom/tencent/could/component/common/ai/net/HttpTask;->setDelayTime(J)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->c:Ljava/util/concurrent/DelayQueue;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/concurrent/DelayQueue;->offer(Ljava/util/concurrent/Delayed;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public addTask(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "add network task error , message: "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "ThreadManager"

    .line 34
    .line 35
    invoke-virtual {p1, v0, p0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public declared-synchronized stopCurrentRequest()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/ThreadManager;->d:Lcom/tencent/could/component/common/ai/net/HttpTask;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/net/HttpTask;->cleanRequest()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method
