.class public Lcom/momo/rtcbase/SurfaceTextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceTextureHelper"


# instance fields
.field private final eglBase:Lcom/momo/rtcbase/EglBase;

.field private frameRotation:I

.field private final handler:Landroid/os/Handler;

.field private hasPendingTexture:Z

.field private isQuitting:Z

.field private volatile isTextureInUse:Z

.field private listener:Lcom/momo/rtcbase/VideoSink;

.field private final oesTextureId:I

.field private pendingListener:Lcom/momo/rtcbase/VideoSink;

.field final setListenerRunnable:Ljava/lang/Runnable;

.field private final surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private textureHeight:I

.field private textureWidth:I

.field private final timestampAligner:Lcom/momo/rtcbase/TimestampAligner;

.field private final yuvConverter:Lcom/momo/rtcbase/YuvConverter;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/YuvConverter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/rtcbase/YuvConverter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/rtcbase/SurfaceTextureHelper$2;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper$2;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iput-object p2, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 34
    .line 35
    if-eqz p3, :cond_0

    .line 36
    .line 37
    new-instance v2, Lcom/momo/rtcbase/TimestampAligner;

    .line 38
    .line 39
    invoke-direct {v2}, Lcom/momo/rtcbase/TimestampAligner;-><init>()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iput-object v2, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->timestampAligner:Lcom/momo/rtcbase/TimestampAligner;

    .line 43
    .line 44
    sget-object p3, Lcom/momo/rtcbase/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 45
    .line 46
    invoke-static {p1, p3}, Lcom/momo/rtcbase/EglBase;->create(Lcom/momo/rtcbase/EglBase$Context;[I)Lcom/momo/rtcbase/EglBase;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 51
    .line 52
    :try_start_0
    invoke-interface {p1}, Lcom/momo/rtcbase/EglBase;->createDummyPbufferSurface()V

    .line 53
    .line 54
    .line 55
    invoke-interface {p1}, Lcom/momo/rtcbase/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    const p1, 0x8d65

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Lcom/momo/rtcbase/GlUtil;->generateTexture(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->oesTextureId:I

    .line 66
    .line 67
    new-instance p3, Landroid/graphics/SurfaceTexture;

    .line 68
    .line 69
    invoke-direct {p3, p1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 70
    .line 71
    .line 72
    iput-object p3, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 73
    .line 74
    new-instance p1, Ll/hah0;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/hah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p3, p1, p2}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :catch_0
    move-exception p1

    .line 84
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 85
    .line 86
    invoke-interface {p0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 94
    .line 95
    .line 96
    throw p1

    .line 97
    :cond_1
    const-string p0, "SurfaceTextureHelper must be created on the handler thread"

    .line 98
    .line 99
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v2
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;ZLcom/momo/rtcbase/SurfaceTextureHelper$1;)V
    .locals 0

    .line 103
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/rtcbase/SurfaceTextureHelper;-><init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;Z)V

    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->frameRotation:I

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/SurfaceTextureHelper;)Lcom/momo/rtcbase/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->pendingListener:Lcom/momo/rtcbase/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/momo/rtcbase/SurfaceTextureHelper;Lcom/momo/rtcbase/VideoSink;)Lcom/momo/rtcbase/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->pendingListener:Lcom/momo/rtcbase/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$202(Lcom/momo/rtcbase/SurfaceTextureHelper;Lcom/momo/rtcbase/VideoSink;)Lcom/momo/rtcbase/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->listener:Lcom/momo/rtcbase/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/SurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/momo/rtcbase/SurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->updateTexImage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isQuitting:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;)Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-static {p0, p1, v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;Z)Lcom/momo/rtcbase/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;Z)Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;

    .line 19
    .line 20
    invoke-direct {v0, p1, v1, p2, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper$1;-><init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;ZLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 28
    .line 29
    return-object p0
.end method

.method public static synthetic d(Lcom/momo/rtcbase/SurfaceTextureHelper;II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->textureWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->textureHeight:I

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic e(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isQuitting:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->returnTextureFrame()V

    return-void
.end method

.method public static synthetic g(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->listener:Lcom/momo/rtcbase/VideoSink;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->pendingListener:Lcom/momo/rtcbase/VideoSink;

    .line 5
    .line 6
    return-void
.end method

.method private release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-ne v0, v1, :cond_2

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isQuitting:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/momo/rtcbase/YuvConverter;->release()V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->oesTextureId:I

    .line 31
    .line 32
    filled-new-array {v0}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 47
    .line 48
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->timestampAligner:Lcom/momo/rtcbase/TimestampAligner;

    .line 61
    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/momo/rtcbase/TimestampAligner;->dispose()V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void

    .line 68
    :cond_1
    const-string p0, "Unexpected release."

    .line 69
    .line 70
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const-string p0, "Wrong thread."

    .line 75
    .line 76
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private returnTextureFrame()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/nah0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private tryDeliverTextureFrame()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-ne v0, v1, :cond_4

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isQuitting:Z

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->listener:Lcom/momo/rtcbase/VideoSink;

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->updateTexImage()V

    .line 41
    .line 42
    .line 43
    const/16 v0, 0x10

    .line 44
    .line 45
    new-array v0, v0, [F

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 55
    .line 56
    .line 57
    move-result-wide v1

    .line 58
    iget-object v3, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->timestampAligner:Lcom/momo/rtcbase/TimestampAligner;

    .line 59
    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    invoke-virtual {v3, v1, v2}, Lcom/momo/rtcbase/TimestampAligner;->translateTimestamp(J)J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    :cond_1
    iget v4, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->textureWidth:I

    .line 67
    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    iget v5, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->textureHeight:I

    .line 71
    .line 72
    if-eqz v5, :cond_2

    .line 73
    .line 74
    new-instance v3, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 75
    .line 76
    sget-object v6, Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;->OES:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 77
    .line 78
    iget v7, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->oesTextureId:I

    .line 79
    .line 80
    invoke-static {v0}, Lcom/momo/rtcbase/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    iget-object v9, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 85
    .line 86
    iget-object v10, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 87
    .line 88
    new-instance v11, Ll/wah0;

    .line 89
    .line 90
    invoke-direct {v11, p0}, Ll/wah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 91
    .line 92
    .line 93
    invoke-direct/range {v3 .. v11}, Lcom/momo/rtcbase/TextureBufferImpl;-><init>(IILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Lcom/momo/rtcbase/VideoFrame;

    .line 97
    .line 98
    iget v4, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->frameRotation:I

    .line 99
    .line 100
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->listener:Lcom/momo/rtcbase/VideoSink;

    .line 104
    .line 105
    invoke-interface {p0, v0}, Lcom/momo/rtcbase/VideoSink;->onFrame(Lcom/momo/rtcbase/VideoFrame;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    const-string p0, "Texture size has not been set."

    .line 113
    .line 114
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_0
    return-void

    .line 118
    :cond_4
    const-string p0, "Wrong thread."

    .line 119
    .line 120
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private updateTexImage()V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/EglBase;->lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 1
    const-string v0, "SurfaceTextureHelper"

    .line 2
    .line 3
    const-string v1, "dispose()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Ll/eah0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/eah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public isTextureInUse()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->isTextureInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFrameRotation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/tah0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/tah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTextureSize(II)V
    .locals 2

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v1, Ll/kah0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, p2}, Ll/kah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "Texture height must be positive, but was "

    .line 22
    .line 23
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "Texture width must be positive, but was "

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public startListening(Lcom/momo/rtcbase/VideoSink;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->listener:Lcom/momo/rtcbase/VideoSink;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->pendingListener:Lcom/momo/rtcbase/VideoSink;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->pendingListener:Lcom/momo/rtcbase/VideoSink;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "SurfaceTextureHelper listener has already been set."

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public stopListening()V
    .locals 2

    .line 1
    const-string v0, "SurfaceTextureHelper"

    .line 2
    .line 3
    const-string v1, "stopListening()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    new-instance v1, Ll/qah0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/qah0;-><init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public textureToYuv(Lcom/momo/rtcbase/VideoFrame$TextureBuffer;)Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/momo/rtcbase/VideoFrame$Buffer;->toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
