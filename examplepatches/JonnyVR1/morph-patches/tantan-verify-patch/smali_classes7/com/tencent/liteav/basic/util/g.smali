.class public Lcom/tencent/liteav/basic/util/g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/os/Handler;

.field private b:Landroid/os/Looper;

.field private c:Z

.field private d:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/HandlerThread;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/util/g;->c:Z

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/tencent/liteav/basic/util/g;->b:Landroid/os/Looper;

    .line 20
    .line 21
    new-instance p1, Landroid/os/Handler;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tencent/liteav/basic/util/g;->b:Landroid/os/Looper;

    .line 24
    .line 25
    invoke-direct {p1, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/basic/util/g;->d:Ljava/lang/Thread;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/util/g;)Landroid/os/Handler;
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public a()Landroid/os/Handler;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    return-object p0
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Z

    .line 3
    .line 4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Lcom/tencent/liteav/basic/util/g;->d:Ljava/lang/Thread;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 21
    .line 22
    monitor-enter v1

    .line 23
    const/4 v2, 0x0

    .line 24
    :try_start_0
    aput-boolean v2, v0, v2

    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 27
    .line 28
    new-instance v4, Lcom/tencent/liteav/basic/util/g$1;

    .line 29
    .line 30
    invoke-direct {v4, p0, p1, v0}, Lcom/tencent/liteav/basic/util/g$1;-><init>(Lcom/tencent/liteav/basic/util/g;Ljava/lang/Runnable;[Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    :catch_0
    :goto_0
    aget-boolean p1, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    :try_start_1
    iget-object p1, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :try_start_2
    monitor-exit v1

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p0
.end method

.method public a(Ljava/lang/Runnable;J)V
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public b(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/util/g;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/basic/util/g;->a:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
