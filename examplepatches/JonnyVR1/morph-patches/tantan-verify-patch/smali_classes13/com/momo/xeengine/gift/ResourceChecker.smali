.class final Lcom/momo/xeengine/gift/ResourceChecker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;
    }
.end annotation


# instance fields
.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final mainHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/momo/xeengine/gift/ResourceChecker;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    new-instance v0, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/xeengine/gift/ResourceChecker;->mainHandler:Landroid/os/Handler;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;->onComplete(Z)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;ZLjava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    new-instance p2, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {p2, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftUtils;->getResourcePathWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p3, Ljava/io/File;

    .line 25
    .line 26
    invoke-direct {p3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    :goto_0
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1, p0}, Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;->onComplete(Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/util/List;Ljava/lang/String;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    monitor-enter p1

    .line 5
    if-nez p6, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_3

    .line 13
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    monitor-enter p3

    .line 15
    const/4 p2, 0x0

    .line 16
    :try_start_1
    aget p6, p3, p2

    .line 17
    .line 18
    add-int/lit8 p6, p6, 0x1

    .line 19
    .line 20
    aput p6, p3, p2

    .line 21
    .line 22
    if-ne p6, p4, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object p0, p0, Lcom/momo/xeengine/gift/ResourceChecker;->mainHandler:Landroid/os/Handler;

    .line 29
    .line 30
    new-instance p2, Lcom/momo/xeengine/gift/q;

    .line 31
    .line 32
    invoke-direct {p2, p5, p1}, Lcom/momo/xeengine/gift/q;-><init>(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :catchall_1
    move-exception p0

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    :goto_1
    monitor-exit p3

    .line 42
    return-void

    .line 43
    :goto_2
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 44
    throw p0

    .line 45
    :goto_3
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    throw p0
.end method

.method public static synthetic d(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-interface {p0, v0}, Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;->onComplete(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private downloadResourceAtURL(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/gift/GiftSDKPreferences;->getInstance()Lcom/momo/xeengine/gift/GiftSDKPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/gift/GiftSDKPreferences;->getDownloader()Lcom/momo/xeengine/gift/IResourceDownloader;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-interface {p2, p0}, Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;->onComplete(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Lcom/momo/xeengine/gift/p;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/gift/p;-><init>(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, p1, v0}, Lcom/momo/xeengine/gift/IResourceDownloader;->downloadResourceWithURL(Ljava/lang/String;Lcom/momo/xeengine/gift/IResourceDownloader$Callback;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/lang/String;Ljava/util/List;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xeengine/gift/t;

    .line 5
    .line 6
    move-object v1, p0

    .line 7
    move-object v3, p1

    .line 8
    move-object v2, p2

    .line 9
    move-object v4, p3

    .line 10
    move v5, p4

    .line 11
    move-object v6, p5

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/momo/xeengine/gift/t;-><init>(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/util/List;Ljava/lang/String;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v1, v3, v0}, Lcom/momo/xeengine/gift/ResourceChecker;->downloadResourceAtURL(Ljava/lang/String;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public downloadResources(Ljava/util/List;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    move-object v2, p0

    .line 10
    move-object v7, p2

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    const/4 v0, 0x0

    .line 22
    filled-new-array {v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v3, v0

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/xeengine/gift/ResourceChecker;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 44
    .line 45
    new-instance v1, Lcom/momo/xeengine/gift/s;

    .line 46
    .line 47
    move-object v2, p0

    .line 48
    move-object v7, p2

    .line 49
    invoke-direct/range {v1 .. v7}, Lcom/momo/xeengine/gift/s;-><init>(Lcom/momo/xeengine/gift/ResourceChecker;Ljava/lang/String;Ljava/util/List;[IILcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :goto_1
    if-eqz v7, :cond_2

    .line 57
    .line 58
    iget-object p0, v2, Lcom/momo/xeengine/gift/ResourceChecker;->mainHandler:Landroid/os/Handler;

    .line 59
    .line 60
    new-instance p1, Lcom/momo/xeengine/gift/r;

    .line 61
    .line 62
    invoke-direct {p1, v7}, Lcom/momo/xeengine/gift/r;-><init>(Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method
