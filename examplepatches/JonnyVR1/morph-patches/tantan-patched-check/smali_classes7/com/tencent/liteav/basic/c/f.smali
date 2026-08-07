.class public Lcom/tencent/liteav/basic/c/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/g$a;
.implements Lcom/tencent/liteav/basic/c/m;


# instance fields
.field public a:I

.field private volatile b:Landroid/os/HandlerThread;

.field private volatile c:Lcom/tencent/liteav/basic/c/g;

.field private d:Lcom/tencent/liteav/basic/c/n;

.field private e:[I

.field private f:Landroid/graphics/SurfaceTexture;

.field private g:Z

.field private h:J

.field private i:J

.field private j:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/f;->g:Z

    .line 15
    .line 16
    const/16 v0, 0x19

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/liteav/basic/c/f;->a:I

    .line 19
    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/tencent/liteav/basic/c/f;->i:J

    .line 25
    .line 26
    const/16 v0, 0x10

    .line 27
    .line 28
    new-array v0, v0, [F

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->j:[F

    .line 31
    .line 32
    return-void
.end method

.method private a(I)V
    .locals 1

    .line 87
    monitor-enter p0

    .line 88
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 90
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private a(IJ)V
    .locals 1

    .line 83
    monitor-enter p0

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 86
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private a(ILjava/lang/Runnable;)V
    .locals 1

    .line 91
    monitor-enter p0

    .line 92
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    .line 93
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 94
    iput p1, v0, Landroid/os/Message;->what:I

    .line 95
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 96
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 97
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/c/f;I)V
    .locals 0

    .line 73
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/c/f;->a(I)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/c/f;ILjava/lang/Runnable;)V
    .locals 0

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/c/f;->a(ILjava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/c/f;Z)Z
    .locals 0

    .line 75
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/c/f;->g:Z

    return p1
.end method

.method private b()V
    .locals 3

    .line 1
    const-string v0, "create gl thread "

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->f()V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    new-instance v1, Landroid/os/HandlerThread;

    .line 8
    .line 9
    const-string v2, "TXGLSurfaceTextureThread"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/tencent/liteav/basic/c/g;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-direct {v1, v2}, Lcom/tencent/liteav/basic/c/g;-><init>(Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/basic/c/g;->a(Lcom/tencent/liteav/basic/c/g$a;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 40
    .line 41
    const/16 v2, 0x500

    .line 42
    .line 43
    iput v2, v1, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 44
    .line 45
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 46
    .line 47
    const/16 v2, 0x2d0

    .line 48
    .line 49
    iput v2, v1, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 50
    .line 51
    const-string v1, "TXGLSurfaceTextureThread"

    .line 52
    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    const/16 v0, 0x64

    .line 76
    .line 77
    invoke-direct {p0, v0}, Lcom/tencent/liteav/basic/c/f;->a(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    throw v0
.end method

.method private f()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/c/g;->a(Landroid/os/Handler;Landroid/os/HandlerThread;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "TXGLSurfaceTextureThread"

    .line 14
    .line 15
    const-string v1, "destroy gl thread"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->b:Landroid/os/HandlerThread;

    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw v0
.end method

.method private g()V
    .locals 4

    .line 1
    const-string v0, "TXGLSurfaceTextureThread"

    .line 2
    .line 3
    const-string v1, "destroy surface texture "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->d:Lcom/tencent/liteav/basic/c/n;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Lcom/tencent/liteav/basic/c/n;->b(Landroid/graphics/SurfaceTexture;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/tencent/liteav/basic/c/f;->g:Z

    .line 32
    .line 33
    iput-object v2, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method private h()V
    .locals 3

    .line 1
    const-string v0, "TXGLSurfaceTextureThread"

    .line 2
    .line 3
    const-string v1, "init surface texture "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 12
    .line 13
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->b()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    aput v1, v0, v2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 21
    .line 22
    aget v0, v0, v2

    .line 23
    .line 24
    if-gtz v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 33
    .line 34
    aget v1, v1, v2

    .line 35
    .line 36
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 40
    .line 41
    const/16 v1, 0x500

    .line 42
    .line 43
    const/16 v2, 0x2d0

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 49
    .line 50
    new-instance v1, Lcom/tencent/liteav/basic/c/f$2;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/tencent/liteav/basic/c/f$2;-><init>(Lcom/tencent/liteav/basic/c/f;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->d:Lcom/tencent/liteav/basic/c/n;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 63
    .line 64
    invoke-interface {v0, p0}, Lcom/tencent/liteav/basic/c/n;->a(Landroid/graphics/SurfaceTexture;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method private i()Z
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/f;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-wide v2, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iput-wide v2, p0, Lcom/tencent/liteav/basic/c/f;->i:J

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    iget-wide v6, p0, Lcom/tencent/liteav/basic/c/f;->i:J

    .line 22
    .line 23
    iget-wide v8, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 24
    .line 25
    const-wide/32 v10, 0x3b9aca00

    .line 26
    .line 27
    .line 28
    mul-long/2addr v8, v10

    .line 29
    iget v0, p0, Lcom/tencent/liteav/basic/c/f;->a:I

    .line 30
    .line 31
    int-to-long v12, v0

    .line 32
    div-long/2addr v8, v12

    .line 33
    add-long/2addr v8, v6

    .line 34
    cmp-long v0, v4, v8

    .line 35
    .line 36
    if-gez v0, :cond_1

    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    cmp-long v0, v6, v2

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iput-wide v4, p0, Lcom/tencent/liteav/basic/c/f;->i:J

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    add-long/2addr v6, v10

    .line 47
    cmp-long v0, v4, v6

    .line 48
    .line 49
    if-lez v0, :cond_3

    .line 50
    .line 51
    iput-wide v2, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 52
    .line 53
    iput-wide v4, p0, Lcom/tencent/liteav/basic/c/f;->i:J

    .line 54
    .line 55
    :cond_3
    :goto_0
    iget-wide v0, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 56
    .line 57
    const-wide/16 v2, 0x1

    .line 58
    .line 59
    add-long/2addr v0, v2

    .line 60
    iput-wide v0, p0, Lcom/tencent/liteav/basic/c/f;->h:J

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 78
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->f()V

    return-void
.end method

.method public a(IZ)V
    .locals 0

    .line 76
    iput p1, p0, Lcom/tencent/liteav/basic/c/f;->a:I

    .line 77
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->b()V

    return-void
.end method

.method public a(IZIIIZ)V
    .locals 0

    .line 82
    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    .line 79
    monitor-enter p0

    .line 80
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 81
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a(Z)V
    .locals 3

    .line 1
    const-string p1, "updateTexImage failed."

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_4

    .line 17
    :catch_0
    move-exception v0

    .line 18
    goto :goto_2

    .line 19
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/f;->g:Z

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_3

    .line 35
    :cond_2
    :goto_1
    :try_start_1
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :goto_2
    const-string v1, "TXGLSurfaceTextureThread"

    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_3
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 59
    .line 60
    new-instance v0, Lcom/tencent/liteav/basic/c/f$1;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/tencent/liteav/basic/c/f$1;-><init>(Lcom/tencent/liteav/basic/c/f;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 66
    .line 67
    .line 68
    monitor-exit p0

    .line 69
    return-void

    .line 70
    :goto_4
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p1
.end method

.method public a([B)V
    .locals 0

    .line 72
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    const/16 v0, 0x66

    .line 2
    .line 3
    const-wide/16 v1, 0x5

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/basic/c/f;->a(IJ)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->j:[F

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception v0

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "onMsgRend Exception "

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "TXGLSurfaceTextureThread"

    .line 55
    .line 56
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->d:Lcom/tencent/liteav/basic/c/n;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/f;->e:[I

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    aget v1, v1, v2

    .line 67
    .line 68
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/f;->j:[F

    .line 69
    .line 70
    invoke-interface {v0, v1, p0}, Lcom/tencent/liteav/basic/c/n;->a(I[F)I

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/f;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getGLContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f;->c:Lcom/tencent/liteav/basic/c/g;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/g;->a()Ljavax/microedition/khronos/egl/EGLContext;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    monitor-exit p0

    .line 17
    return-object v0

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/f;->f:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRendMirror(I)V
    .locals 0

    return-void
.end method

.method public setRendMode(I)V
    .locals 0

    return-void
.end method

.method public setSurfaceTextureListener(Lcom/tencent/liteav/basic/c/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/f;->d:Lcom/tencent/liteav/basic/c/n;

    .line 2
    .line 3
    return-void
.end method
