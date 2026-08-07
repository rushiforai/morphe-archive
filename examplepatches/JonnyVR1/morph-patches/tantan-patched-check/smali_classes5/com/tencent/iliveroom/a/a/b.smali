.class public Lcom/tencent/iliveroom/a/a/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/Object;

.field private b:Lcom/tencent/liteav/basic/c/g;

.field private c:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->c:Landroid/os/HandlerThread;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 99
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 100
    :try_start_0
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    if-nez v1, :cond_0

    .line 101
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "liveRoomGLThread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->c:Landroid/os/HandlerThread;

    .line 102
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 103
    new-instance v1, Lcom/tencent/liteav/basic/c/g;

    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/b;->c:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/tencent/liteav/basic/c/g;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    .line 104
    const-string p0, "TRTCAdapter-TRTCGLThreadHelper"

    const-string v1, "GLThread -> GLThread start."

    invoke-static {p0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 105
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v0, "GLThread -> Attach EGL14Context "

    .line 2
    .line 3
    const-string v1, "GLThread -> Attach EGL10Context "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/b;->a:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    instance-of v3, p1, Ljavax/microedition/khronos/egl/EGLContext;

    .line 15
    .line 16
    const/16 v4, 0x64

    .line 17
    .line 18
    const/16 v5, 0x2d0

    .line 19
    .line 20
    const/16 v6, 0x500

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 26
    .line 27
    move-object v0, p1

    .line 28
    check-cast v0, Ljavax/microedition/khronos/egl/EGLContext;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 31
    .line 32
    iput v6, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 33
    .line 34
    iput v5, p0, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 35
    .line 36
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 37
    .line 38
    .line 39
    const-string p0, "TRTCAdapter-TRTCGLThreadHelper"

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    instance-of v1, p1, Landroid/opengl/EGLContext;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    iput-boolean v1, p0, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 65
    .line 66
    move-object v1, p1

    .line 67
    check-cast v1, Landroid/opengl/EGLContext;

    .line 68
    .line 69
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/g;->f:Landroid/opengl/EGLContext;

    .line 70
    .line 71
    iput v6, p0, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 72
    .line 73
    iput v5, p0, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 74
    .line 75
    invoke-virtual {p0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 76
    .line 77
    .line 78
    const-string p0, "TRTCAdapter-TRTCGLThreadHelper"

    .line 79
    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    :goto_0
    monitor-exit v2

    .line 96
    return-void

    .line 97
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    throw p0
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 2

    .line 106
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz p0, :cond_1

    .line 107
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 108
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    .line 109
    :cond_0
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method public b(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/tencent/iliveroom/a/a/b$1;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, v0}, Lcom/tencent/iliveroom/a/a/b$1;-><init>(Lcom/tencent/iliveroom/a/a/b;Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/tencent/iliveroom/a/a/b;->a(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public b()Z
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 28
    :try_start_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/b;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a/b;->c:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/c/g;->a(Landroid/os/Handler;Landroid/os/HandlerThread;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "TRTCAdapter-TRTCGLThreadHelper"

    .line 14
    .line 15
    const-string v2, "GLThread -> Destroy GL Thread"

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 24
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->b:Lcom/tencent/liteav/basic/c/g;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/tencent/iliveroom/a/a/b;->c:Landroid/os/HandlerThread;

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
