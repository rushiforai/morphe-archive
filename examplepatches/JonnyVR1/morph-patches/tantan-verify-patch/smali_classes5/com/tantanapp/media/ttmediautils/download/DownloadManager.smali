.class public Lcom/tantanapp/media/ttmediautils/download/DownloadManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static mDownloadManager:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;


# instance fields
.field private currentThreadNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field protected mLstDoing:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field protected mLstPause:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field protected mLstTodo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskRunnable:Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->currentThreadNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    new-instance v0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;

    .line 33
    .line 34
    const-string v1, "download"

    .line 35
    .line 36
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;-><init>(Lcom/tantanapp/media/ttmediautils/download/DownloadManager;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mTaskRunnable:Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p2}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p2}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private declared-synchronized executeTask()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->currentThreadNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x3

    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mTaskRunnable:Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-static {v0, v1}, Lcom/tantanapp/media/ttmediautils/task/TaskManager;->startRunnableRequestInPool(Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->currentThreadNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw v0
.end method

.method public static getInstance()Lcom/tantanapp/media/ttmediautils/download/DownloadManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mDownloadManager:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mDownloadManager:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mDownloadManager:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

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
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mDownloadManager:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public declared-synchronized addDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->removeDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized addPauseTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->removeDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized addTodoTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method

.method public declared-synchronized clearTask()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-lez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/4 v0, 0x0

    .line 72
    :goto_0
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->cancel()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->clearTask()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    .line 80
    :cond_3
    monitor-exit p0

    .line 81
    return-void

    .line 82
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    throw v0
.end method

.method public clearTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 84
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->removeTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 85
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->cancel()V

    :cond_0
    return-void
.end method

.method public contains(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public download(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->addTodoTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->executeTask()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public downloadApk(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/tantanapp/media/ttmediautils/download/Action1;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/io/File;",
            ">;",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x4000

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->setBufferSize(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 p2, 0x1f4

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->setUpdateInterval(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/o9e;

    .line 19
    .line 20
    invoke-direct {p2, p3}, Ll/o9e;-><init>(Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onSuccess(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/q9e;

    .line 28
    .line 29
    invoke-direct {p2, p4}, Ll/q9e;-><init>(Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onFail(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->download(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 37
    .line 38
    .line 39
    return-object p1
.end method

.method public declared-synchronized getDoingTaskByPath(Ljava/lang/String;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getNetPath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-object v1

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getNetPath()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    return-object v1

    .line 64
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getNetPath()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    monitor-exit p0

    .line 93
    return-object v1

    .line 94
    :cond_5
    monitor-exit p0

    .line 95
    const/4 p0, 0x0

    .line 96
    return-object p0

    .line 97
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 98
    throw p1
.end method

.method public getDownloadTask(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->getTask(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public declared-synchronized getNextTask()Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->currentThreadNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :cond_1
    monitor-exit p0

    .line 36
    return-object v0

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw v0
.end method

.method public declared-synchronized getTask(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    if-ne v2, p1, :cond_0

    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-object v1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    if-ne v2, p1, :cond_2

    .line 57
    .line 58
    monitor-exit p0

    .line 59
    return-object v1

    .line 60
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    if-ne v2, p1, :cond_4

    .line 85
    .line 86
    monitor-exit p0

    .line 87
    return-object v1

    .line 88
    :cond_5
    monitor-exit p0

    .line 89
    const/4 p0, 0x0

    .line 90
    return-object p0

    .line 91
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 92
    throw p1
.end method

.method public declared-synchronized isDoing(Ljava/lang/String;)Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getOriginPath()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    move v0, v3

    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getOriginPath()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    move v0, v3

    .line 69
    :cond_3
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getOriginPath()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    move v0, v3

    .line 100
    goto :goto_2

    .line 101
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    throw p1

    .line 103
    :cond_5
    :goto_2
    monitor-exit p0

    .line 104
    return v0
.end method

.method public pauseTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->needPause()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public declared-synchronized removeDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public declared-synchronized removeTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstDoing:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw p1
.end method

.method public declared-synchronized resumePauseTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstPause:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->needResume()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->mLstTodo:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public resumeTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isPaused()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->resumePauseTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->executeTask()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
