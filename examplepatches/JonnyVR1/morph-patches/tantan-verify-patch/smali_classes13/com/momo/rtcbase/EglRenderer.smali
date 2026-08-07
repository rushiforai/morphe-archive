.class public Lcom/momo/rtcbase/EglRenderer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/EglRenderer$HandlerWithExceptionCallback;,
        Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;,
        Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;,
        Lcom/momo/rtcbase/EglRenderer$FrameListener;
    }
.end annotation


# static fields
.field private static final LOG_INTERVAL_SEC:J = 0x4L

.field private static final TAG:Ljava/lang/String; = "EglRenderer"


# instance fields
.field private final bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

.field private final drawMatrix:Landroid/graphics/Matrix;

.field private drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

.field private eglBase:Lcom/momo/rtcbase/EglBase;

.field private final eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

.field private final fpsReductionLock:Ljava/lang/Object;

.field private final frameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

.field private final frameListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;",
            ">;"
        }
    .end annotation
.end field

.field private final frameLock:Ljava/lang/Object;

.field private framesDropped:I

.field private framesReceived:I

.field private framesRendered:I

.field private final handlerLock:Ljava/lang/Object;

.field private layoutAspectRatio:F

.field private final layoutLock:Ljava/lang/Object;

.field private final logStatisticsRunnable:Ljava/lang/Runnable;

.field private minRenderPeriodNs:J

.field private mirrorHorizontally:Z

.field private mirrorVertically:Z

.field protected final name:Ljava/lang/String;

.field private nextFrameTimeNs:J

.field private pendingFrame:Lcom/momo/rtcbase/VideoFrame;

.field private renderSwapBufferTimeNs:J

.field private renderThreadHandler:Landroid/os/Handler;

.field private renderTimeNs:J

.field private final statisticsLock:Ljava/lang/Object;

.field private statisticsStartTimeNs:J

.field private usePresentationTimeStamp:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

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
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 24
    .line 25
    new-instance v0, Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/momo/rtcbase/VideoFrameDrawer;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/Object;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 45
    .line 46
    new-instance v0, Ljava/lang/Object;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/Object;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 59
    .line 60
    new-instance v0, Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 61
    .line 62
    const/16 v1, 0x1908

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/GlTextureFrameBuffer;-><init>(I)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 68
    .line 69
    new-instance v0, Lcom/momo/rtcbase/EglRenderer$1;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/EglRenderer$1;-><init>(Lcom/momo/rtcbase/EglRenderer;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 75
    .line 76
    new-instance v0, Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-direct {v0, p0, v1}, Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;-><init>(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/EglRenderer$1;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->name:Ljava/lang/String;

    .line 85
    .line 86
    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/EglBase$Context;[I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "EglBase10.create context"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Lcom/momo/rtcbase/EglBase;->createEgl10([I)Lcom/momo/rtcbase/EglBase;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v0, "EglBase.create shared context"

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p2}, Lcom/momo/rtcbase/EglBase;->create(Lcom/momo/rtcbase/EglBase$Context;[I)Lcom/momo/rtcbase/EglBase;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/EglRenderer;)Lcom/momo/rtcbase/EglBase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/EglRenderer;->logStatistics()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/EglRenderer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/EglRenderer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/EglRenderer;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method private averageTimeAsString(JI)Ljava/lang/String;
    .locals 2

    .line 1
    if-gtz p3, :cond_0

    .line 2
    .line 3
    const-string p0, "NA"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    int-to-long v0, p3

    .line 12
    div-long/2addr p1, v0

    .line 13
    const-wide/16 v0, 0x3e8

    .line 14
    .line 15
    div-long/2addr p1, v0

    .line 16
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, " us"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic b(Lcom/momo/rtcbase/EglRenderer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public static synthetic c(Lcom/momo/rtcbase/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/EglRenderer;->renderFrameOnRenderThread()V

    return-void
.end method

.method private clearSurfaceOnRenderThread(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->hasSurface()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "clearSurface"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0x4000

    .line 20
    .line 21
    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 25
    .line 26
    invoke-interface {p0}, Lcom/momo/rtcbase/EglBase;->swapBuffers()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private createEglSurfaceInternal(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;->setSurface(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/momo/rtcbase/EglRenderer;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->detachCurrent()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/momo/rtcbase/EglBase;->releaseSurface()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e(Lcom/momo/rtcbase/EglRenderer;FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/rtcbase/EglRenderer;->clearSurfaceOnRenderThread(FFFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/EglRenderer$FrameListener;FZ)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 4
    .line 5
    :cond_0
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 6
    .line 7
    new-instance v0, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;

    .line 8
    .line 9
    invoke-direct {v0, p2, p3, p1, p4}, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;-><init>(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic g(Lcom/momo/rtcbase/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/momo/rtcbase/EglRenderer$FrameListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->listener:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    .line 26
    .line 27
    if-ne p1, p2, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public static synthetic h(Lcom/momo/rtcbase/EglRenderer;Landroid/os/Looper;)V
    .locals 1

    .line 1
    const-string v0, "Quitting render thread."

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic i(Lcom/momo/rtcbase/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/momo/rtcbase/RendererCommon$GlDrawer;->release()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrameDrawer;->release()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->release()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string v0, "eglBase detach and release."

    .line 33
    .line 34
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 38
    .line 39
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->detachCurrent()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 43
    .line 44
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 48
    .line 49
    :cond_1
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private logD(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "EglRenderer"

    .line 19
    .line 20
    invoke-static {p1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private logStatistics()V
    .locals 11

    .line 1
    const-string v0, "Duration: "

    .line 2
    .line 3
    new-instance v1, Ljava/text/DecimalFormat;

    .line 4
    .line 5
    const-string v2, "#.0"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iget-object v4, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v4

    .line 17
    :try_start_0
    iget-wide v5, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsStartTimeNs:J

    .line 18
    .line 19
    sub-long v5, v2, v5

    .line 20
    .line 21
    const-wide/16 v7, 0x0

    .line 22
    .line 23
    cmp-long v7, v5, v7

    .line 24
    .line 25
    if-gtz v7, :cond_0

    .line 26
    .line 27
    monitor-exit v4

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v7, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 32
    .line 33
    int-to-long v7, v7

    .line 34
    const-wide/32 v9, 0x3b9aca00

    .line 35
    .line 36
    .line 37
    mul-long/2addr v7, v9

    .line 38
    long-to-float v7, v7

    .line 39
    long-to-float v8, v5

    .line 40
    div-float/2addr v7, v8

    .line 41
    new-instance v8, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-wide/32 v9, 0xf4240

    .line 47
    .line 48
    .line 49
    div-long/2addr v5, v9

    .line 50
    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v0, " ms. Frames received: "

    .line 54
    .line 55
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v0, p0, Lcom/momo/rtcbase/EglRenderer;->framesReceived:I

    .line 59
    .line 60
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, " Dropped: "

    .line 64
    .line 65
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v0, p0, Lcom/momo/rtcbase/EglRenderer;->framesDropped:I

    .line 69
    .line 70
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, ". Rendered: "

    .line 74
    .line 75
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v0, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 79
    .line 80
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v0, ". Render fps: "

    .line 84
    .line 85
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    float-to-double v5, v7

    .line 89
    invoke-virtual {v1, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, ". Average render time: "

    .line 97
    .line 98
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-wide v0, p0, Lcom/momo/rtcbase/EglRenderer;->renderTimeNs:J

    .line 102
    .line 103
    iget v5, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 104
    .line 105
    invoke-direct {p0, v0, v1, v5}, Lcom/momo/rtcbase/EglRenderer;->averageTimeAsString(JI)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v0, ". Average swapBuffer time: "

    .line 113
    .line 114
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-wide v0, p0, Lcom/momo/rtcbase/EglRenderer;->renderSwapBufferTimeNs:J

    .line 118
    .line 119
    iget v5, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 120
    .line 121
    invoke-direct {p0, v0, v1, v5}, Lcom/momo/rtcbase/EglRenderer;->averageTimeAsString(JI)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, "."

    .line 129
    .line 130
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0, v2, v3}, Lcom/momo/rtcbase/EglRenderer;->resetStatistics(J)V

    .line 141
    .line 142
    .line 143
    monitor-exit v4

    .line 144
    return-void

    .line 145
    :goto_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    throw p0
.end method

.method private logW(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "EglRenderer"

    .line 19
    .line 20
    invoke-static {p1, p0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private notifyCallbacks(Lcom/momo/rtcbase/VideoFrame;Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    const/high16 v1, 0x3f000000    # 0.5f

    .line 19
    .line 20
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorHorizontally:Z

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const/high16 v3, -0x40800000    # -1.0f

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    move v1, v3

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_0
    iget-boolean v4, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorVertically:Z

    .line 37
    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    move v4, v3

    .line 41
    goto :goto_1

    .line 42
    :cond_2
    move v4, v2

    .line 43
    :goto_1
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 52
    .line 53
    const/high16 v1, -0x41000000    # -0.5f

    .line 54
    .line 55
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;

    .line 75
    .line 76
    if-nez p2, :cond_3

    .line 77
    .line 78
    iget-boolean v2, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->applyFpsReduction:Z

    .line 79
    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 84
    .line 85
    .line 86
    iget v2, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->scale:F

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedWidth()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    int-to-float v3, v3

    .line 93
    mul-float/2addr v2, v3

    .line 94
    float-to-int v5, v2

    .line 95
    iget v2, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->scale:F

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotatedHeight()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-float v3, v3

    .line 102
    mul-float/2addr v2, v3

    .line 103
    float-to-int v6, v2

    .line 104
    if-eqz v5, :cond_5

    .line 105
    .line 106
    if-nez v6, :cond_4

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_4
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 110
    .line 111
    invoke-virtual {v2, v5, v6}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->setSize(II)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 115
    .line 116
    invoke-virtual {v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    const v11, 0x8d40

    .line 121
    .line 122
    .line 123
    invoke-static {v11, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->bitmapTextureFramebuffer:Lcom/momo/rtcbase/GlTextureFrameBuffer;

    .line 127
    .line 128
    invoke-virtual {v2}, Lcom/momo/rtcbase/GlTextureFrameBuffer;->getTextureId()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    const v3, 0x8ce0

    .line 133
    .line 134
    .line 135
    const/16 v4, 0xde1

    .line 136
    .line 137
    const/4 v12, 0x0

    .line 138
    invoke-static {v11, v3, v4, v2, v12}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 139
    .line 140
    .line 141
    const/4 v2, 0x0

    .line 142
    invoke-static {v2, v2, v2, v2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 143
    .line 144
    .line 145
    const/16 v2, 0x4000

    .line 146
    .line 147
    invoke-static {v2}, Landroid/opengl/GLES20;->glClear(I)V

    .line 148
    .line 149
    .line 150
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->frameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 151
    .line 152
    move v9, v5

    .line 153
    iget-object v5, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 154
    .line 155
    move v10, v6

    .line 156
    iget-object v6, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 157
    .line 158
    const/4 v7, 0x0

    .line 159
    const/4 v8, 0x0

    .line 160
    move-object v4, p1

    .line 161
    invoke-virtual/range {v3 .. v10}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    .line 162
    .line 163
    .line 164
    mul-int v5, v9, v10

    .line 165
    .line 166
    mul-int/lit8 v5, v5, 0x4

    .line 167
    .line 168
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-static {v12, v12, v9, v10}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 173
    .line 174
    .line 175
    const/16 v7, 0x1908

    .line 176
    .line 177
    const/16 v8, 0x1401

    .line 178
    .line 179
    const/4 v3, 0x0

    .line 180
    const/4 v4, 0x0

    .line 181
    move v5, v9

    .line 182
    move v6, v10

    .line 183
    move-object v9, v2

    .line 184
    invoke-static/range {v3 .. v9}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 185
    .line 186
    .line 187
    move v9, v5

    .line 188
    invoke-static {v11, v12}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 189
    .line 190
    .line 191
    const-string v3, "EglRenderer.notifyCallbacks"

    .line 192
    .line 193
    invoke-static {v3}, Lcom/momo/rtcbase/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 197
    .line 198
    invoke-static {v9, v10, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {v3, v2}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 203
    .line 204
    .line 205
    iget-object v1, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->listener:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    .line 206
    .line 207
    invoke-interface {v1, v3}, Lcom/momo/rtcbase/EglRenderer$FrameListener;->onFrame(Landroid/graphics/Bitmap;)V

    .line 208
    .line 209
    .line 210
    goto/16 :goto_2

    .line 211
    .line 212
    :cond_5
    :goto_3
    iget-object v1, v1, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->listener:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    .line 213
    .line 214
    const/4 v2, 0x0

    .line 215
    invoke-interface {v1, v2}, Lcom/momo/rtcbase/EglRenderer$FrameListener;->onFrame(Landroid/graphics/Bitmap;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_2

    .line 219
    .line 220
    :cond_6
    :goto_4
    return-void
.end method

.method private postToRenderThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method private renderFrameOnRenderThread()V
    .locals 13

    .line 1
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    monitor-exit v1

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    move-object p0, v0

    .line 12
    goto/16 :goto_a

    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 16
    .line 17
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 19
    .line 20
    if-eqz v0, :cond_b

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->hasSurface()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_9

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 31
    .line 32
    monitor-enter v1

    .line 33
    :try_start_1
    iget-wide v4, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 34
    .line 35
    const-wide v6, 0x7fffffffffffffffL

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    cmp-long v0, v4, v6

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    const/4 v10, 0x1

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    :goto_0
    move v0, v2

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    const-wide/16 v6, 0x0

    .line 49
    .line 50
    cmp-long v0, v4, v6

    .line 51
    .line 52
    if-gtz v0, :cond_3

    .line 53
    .line 54
    :goto_1
    move v0, v10

    .line 55
    goto :goto_2

    .line 56
    :cond_3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    iget-wide v6, p0, Lcom/momo/rtcbase/EglRenderer;->nextFrameTimeNs:J

    .line 61
    .line 62
    cmp-long v0, v4, v6

    .line 63
    .line 64
    if-gez v0, :cond_4

    .line 65
    .line 66
    const-string v0, "Skipping frame rendering - fps reduction is active."

    .line 67
    .line 68
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_1
    move-exception v0

    .line 73
    move-object p0, v0

    .line 74
    goto/16 :goto_8

    .line 75
    .line 76
    :cond_4
    iget-wide v8, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 77
    .line 78
    add-long/2addr v6, v8

    .line 79
    iput-wide v6, p0, Lcom/momo/rtcbase/EglRenderer;->nextFrameTimeNs:J

    .line 80
    .line 81
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 82
    .line 83
    .line 84
    move-result-wide v4

    .line 85
    iput-wide v4, p0, Lcom/momo/rtcbase/EglRenderer;->nextFrameTimeNs:J

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :goto_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 89
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 90
    .line 91
    .line 92
    move-result-wide v11

    .line 93
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->getRotatedWidth()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    int-to-float v1, v1

    .line 98
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->getRotatedHeight()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    int-to-float v2, v2

    .line 103
    div-float/2addr v1, v2

    .line 104
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 105
    .line 106
    monitor-enter v2

    .line 107
    :try_start_2
    iget v4, p0, Lcom/momo/rtcbase/EglRenderer;->layoutAspectRatio:F

    .line 108
    .line 109
    const/4 v5, 0x0

    .line 110
    cmpl-float v6, v4, v5

    .line 111
    .line 112
    if-eqz v6, :cond_5

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    move v4, v1

    .line 116
    :goto_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 117
    cmpl-float v2, v1, v4

    .line 118
    .line 119
    const/high16 v6, 0x3f800000    # 1.0f

    .line 120
    .line 121
    if-lez v2, :cond_6

    .line 122
    .line 123
    div-float/2addr v4, v1

    .line 124
    move v1, v6

    .line 125
    goto :goto_4

    .line 126
    :cond_6
    div-float/2addr v1, v4

    .line 127
    move v4, v6

    .line 128
    :goto_4
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 129
    .line 130
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 134
    .line 135
    const/high16 v7, 0x3f000000    # 0.5f

    .line 136
    .line 137
    invoke-virtual {v2, v7, v7}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 141
    .line 142
    iget-boolean v7, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorHorizontally:Z

    .line 143
    .line 144
    const/high16 v8, -0x40800000    # -1.0f

    .line 145
    .line 146
    if-eqz v7, :cond_7

    .line 147
    .line 148
    move v7, v8

    .line 149
    goto :goto_5

    .line 150
    :cond_7
    move v7, v6

    .line 151
    :goto_5
    iget-boolean v9, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorVertically:Z

    .line 152
    .line 153
    if-eqz v9, :cond_8

    .line 154
    .line 155
    move v6, v8

    .line 156
    :cond_8
    invoke-virtual {v2, v7, v6}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 157
    .line 158
    .line 159
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 160
    .line 161
    invoke-virtual {v2, v4, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 165
    .line 166
    const/high16 v2, -0x41000000    # -0.5f

    .line 167
    .line 168
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 169
    .line 170
    .line 171
    if-eqz v0, :cond_a

    .line 172
    .line 173
    invoke-static {v5, v5, v5, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 174
    .line 175
    .line 176
    const/16 v1, 0x4000

    .line 177
    .line 178
    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 179
    .line 180
    .line 181
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->frameDrawer:Lcom/momo/rtcbase/VideoFrameDrawer;

    .line 182
    .line 183
    iget-object v4, p0, Lcom/momo/rtcbase/EglRenderer;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 184
    .line 185
    iget-object v5, p0, Lcom/momo/rtcbase/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 186
    .line 187
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 188
    .line 189
    invoke-interface {v1}, Lcom/momo/rtcbase/EglBase;->surfaceWidth()I

    .line 190
    .line 191
    .line 192
    move-result v8

    .line 193
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 194
    .line 195
    invoke-interface {v1}, Lcom/momo/rtcbase/EglBase;->surfaceHeight()I

    .line 196
    .line 197
    .line 198
    move-result v9

    .line 199
    const/4 v6, 0x0

    .line 200
    const/4 v7, 0x0

    .line 201
    invoke-virtual/range {v2 .. v9}, Lcom/momo/rtcbase/VideoFrameDrawer;->drawFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    .line 202
    .line 203
    .line 204
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 205
    .line 206
    .line 207
    move-result-wide v1

    .line 208
    iget-boolean v4, p0, Lcom/momo/rtcbase/EglRenderer;->usePresentationTimeStamp:Z

    .line 209
    .line 210
    iget-object v5, p0, Lcom/momo/rtcbase/EglRenderer;->eglBase:Lcom/momo/rtcbase/EglBase;

    .line 211
    .line 212
    if-eqz v4, :cond_9

    .line 213
    .line 214
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 215
    .line 216
    .line 217
    move-result-wide v6

    .line 218
    invoke-interface {v5, v6, v7}, Lcom/momo/rtcbase/EglBase;->swapBuffers(J)V

    .line 219
    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_9
    invoke-interface {v5}, Lcom/momo/rtcbase/EglBase;->swapBuffers()V

    .line 223
    .line 224
    .line 225
    :goto_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 226
    .line 227
    .line 228
    move-result-wide v4

    .line 229
    iget-object v6, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 230
    .line 231
    monitor-enter v6

    .line 232
    :try_start_3
    iget v7, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 233
    .line 234
    add-int/2addr v7, v10

    .line 235
    iput v7, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 236
    .line 237
    iget-wide v7, p0, Lcom/momo/rtcbase/EglRenderer;->renderTimeNs:J

    .line 238
    .line 239
    sub-long v9, v4, v11

    .line 240
    .line 241
    add-long/2addr v7, v9

    .line 242
    iput-wide v7, p0, Lcom/momo/rtcbase/EglRenderer;->renderTimeNs:J

    .line 243
    .line 244
    iget-wide v7, p0, Lcom/momo/rtcbase/EglRenderer;->renderSwapBufferTimeNs:J

    .line 245
    .line 246
    sub-long/2addr v4, v1

    .line 247
    add-long/2addr v7, v4

    .line 248
    iput-wide v7, p0, Lcom/momo/rtcbase/EglRenderer;->renderSwapBufferTimeNs:J

    .line 249
    .line 250
    monitor-exit v6

    .line 251
    goto :goto_7

    .line 252
    :catchall_2
    move-exception v0

    .line 253
    move-object p0, v0

    .line 254
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 255
    throw p0

    .line 256
    :cond_a
    :goto_7
    invoke-direct {p0, v3, v0}, Lcom/momo/rtcbase/EglRenderer;->notifyCallbacks(Lcom/momo/rtcbase/VideoFrame;Z)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :catchall_3
    move-exception v0

    .line 264
    move-object p0, v0

    .line 265
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 266
    throw p0

    .line 267
    :goto_8
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 268
    throw p0

    .line 269
    :cond_b
    :goto_9
    const-string v0, "Dropping frame - No surface"

    .line 270
    .line 271
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :goto_a
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 279
    throw p0
.end method

.method private resetStatistics(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-wide p1, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsStartTimeNs:J

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/momo/rtcbase/EglRenderer;->framesReceived:I

    .line 8
    .line 9
    iput p1, p0, Lcom/momo/rtcbase/EglRenderer;->framesDropped:I

    .line 10
    .line 11
    iput p1, p0, Lcom/momo/rtcbase/EglRenderer;->framesRendered:I

    .line 12
    .line 13
    const-wide/16 p1, 0x0

    .line 14
    .line 15
    iput-wide p1, p0, Lcom/momo/rtcbase/EglRenderer;->renderTimeNs:J

    .line 16
    .line 17
    iput-wide p1, p0, Lcom/momo/rtcbase/EglRenderer;->renderSwapBufferTimeNs:J

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public addFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;F)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/momo/rtcbase/EglRenderer;->addFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public addFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/EglRenderer;->addFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public addFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V
    .locals 6

    .line 1
    new-instance v0, Ll/wse;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move-object v2, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/wse;-><init>(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/EglRenderer$FrameListener;FZ)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/momo/rtcbase/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public clearImage()V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/momo/rtcbase/EglRenderer;->clearImage(FFFF)V

    return-void
.end method

.method public clearImage(FFFF)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    monitor-exit v1

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    move-object p0, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v2, Ll/tse;

    .line 14
    .line 15
    move-object v3, p0

    .line 16
    move v4, p1

    .line 17
    move v5, p2

    .line 18
    move v6, p3

    .line 19
    move v7, p4

    .line 20
    invoke-direct/range {v2 .. v7}, Ll/tse;-><init>(Lcom/momo/rtcbase/EglRenderer;FFFF)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 24
    .line 25
    .line 26
    monitor-exit v1

    .line 27
    return-void

    .line 28
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public createEglSurface(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/EglRenderer;->createEglSurfaceInternal(Ljava/lang/Object;)V

    return-void
.end method

.method public createEglSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/EglRenderer;->createEglSurfaceInternal(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public disableFpsReduction()V
    .locals 1

    .line 1
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->setFpsReduction(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public init(Lcom/momo/rtcbase/EglBase$Context;[ILcom/momo/rtcbase/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/EglRenderer;->init(Lcom/momo/rtcbase/EglBase$Context;[ILcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public init(Lcom/momo/rtcbase/EglBase$Context;[ILcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "Initializing EglRenderer"

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Lcom/momo/rtcbase/EglRenderer;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 14
    .line 15
    iput-boolean p4, p0, Lcom/momo/rtcbase/EglRenderer;->usePresentationTimeStamp:Z

    .line 16
    .line 17
    new-instance p3, Landroid/os/HandlerThread;

    .line 18
    .line 19
    new-instance p4, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "EglRenderer"

    .line 30
    .line 31
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    invoke-direct {p3, p4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    .line 42
    .line 43
    .line 44
    new-instance p4, Lcom/momo/rtcbase/EglRenderer$HandlerWithExceptionCallback;

    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    new-instance v1, Ll/cte;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/cte;-><init>(Lcom/momo/rtcbase/EglRenderer;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p4, p3, v1}, Lcom/momo/rtcbase/EglRenderer$HandlerWithExceptionCallback;-><init>(Landroid/os/Looper;Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iput-object p4, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 59
    .line 60
    new-instance p3, Ll/fte;

    .line 61
    .line 62
    invoke-direct {p3, p0, p1, p2}, Ll/fte;-><init>(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/EglBase$Context;[I)V

    .line 63
    .line 64
    .line 65
    invoke-static {p4, p3}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 69
    .line 70
    iget-object p2, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 76
    .line 77
    .line 78
    move-result-wide p1

    .line 79
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/EglRenderer;->resetStatistics(J)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 85
    .line 86
    const-wide/16 p2, 0xfa0

    .line 87
    .line 88
    invoke-virtual {p1, p0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 89
    .line 90
    .line 91
    monitor-exit v0

    .line 92
    return-void

    .line 93
    :catchall_0
    move-exception p0

    .line 94
    goto :goto_0

    .line 95
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 96
    .line 97
    new-instance p2, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/momo/rtcbase/EglRenderer;->name:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string p0, "Already initialized"

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    throw p0
.end method

.method public onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/momo/rtcbase/EglRenderer;->framesReceived:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    add-int/2addr v1, v2

    .line 8
    iput v1, p0, Lcom/momo/rtcbase/EglRenderer;->framesReceived:I

    .line 9
    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 11
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string p1, "Dropping frame - Not initialized or already released."

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    monitor-exit v1

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_3

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    :try_start_2
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    move v4, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v4, 0x0

    .line 37
    :goto_0
    if-eqz v4, :cond_2

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    :goto_1
    iput-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->retain()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 51
    .line 52
    new-instance v3, Ll/zse;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Ll/zse;-><init>(Lcom/momo/rtcbase/EglRenderer;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 58
    .line 59
    .line 60
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 61
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    if-eqz v4, :cond_3

    .line 63
    .line 64
    iget-object p1, p0, Lcom/momo/rtcbase/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 65
    .line 66
    monitor-enter p1

    .line 67
    :try_start_4
    iget v0, p0, Lcom/momo/rtcbase/EglRenderer;->framesDropped:I

    .line 68
    .line 69
    add-int/2addr v0, v2

    .line 70
    iput v0, p0, Lcom/momo/rtcbase/EglRenderer;->framesDropped:I

    .line 71
    .line 72
    monitor-exit p1

    .line 73
    return-void

    .line 74
    :catchall_2
    move-exception p0

    .line 75
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 76
    throw p0

    .line 77
    :cond_3
    return-void

    .line 78
    :goto_2
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 79
    :try_start_6
    throw p0

    .line 80
    :goto_3
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 81
    throw p0

    .line 82
    :catchall_3
    move-exception p0

    .line 83
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 84
    throw p0
.end method

.method public pauseVideo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->setFpsReduction(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public printStackTrace()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    array-length v2, v1

    .line 25
    if-lez v2, :cond_1

    .line 26
    .line 27
    const-string v2, "EglRenderer stack trace:"

    .line 28
    .line 29
    invoke-direct {p0, v2}, Lcom/momo/rtcbase/EglRenderer;->logW(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    array-length v2, v1

    .line 33
    const/4 v3, 0x0

    .line 34
    :goto_1
    if-ge v3, v2, :cond_1

    .line 35
    .line 36
    aget-object v4, v1, v3

    .line 37
    .line 38
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/EglRenderer;->logW(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public release()V
    .locals 5

    .line 1
    const-string v0, "Releasing."

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-string v0, "Already released"

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    monitor-exit v1

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v3, Ll/kse;

    .line 36
    .line 37
    invoke-direct {v3, p0, v0}, Ll/kse;-><init>(Lcom/momo/rtcbase/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 50
    .line 51
    new-instance v4, Ll/nse;

    .line 52
    .line 53
    invoke-direct {v4, p0, v2}, Ll/nse;-><init>(Lcom/momo/rtcbase/EglRenderer;Landroid/os/Looper;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    iput-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 61
    .line 62
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    invoke-static {v0}, Lcom/momo/rtcbase/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 67
    .line 68
    monitor-enter v0

    .line 69
    :try_start_1
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 70
    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->pendingFrame:Lcom/momo/rtcbase/VideoFrame;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_1
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    const-string v0, "Releasing done."

    .line 83
    .line 84
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 89
    throw p0

    .line 90
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    throw p0
.end method

.method public releaseEglSurface(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;->setSurface(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->eglSurfaceCreationRunnable:Lcom/momo/rtcbase/EglRenderer$EglSurfaceCreation;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance v2, Ll/hse;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1}, Ll/hse;-><init>(Lcom/momo/rtcbase/EglRenderer;Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw p0
.end method

.method public removeFrameListener(Lcom/momo/rtcbase/EglRenderer$FrameListener;)V
    .locals 4

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
    iget-object v1, p0, Lcom/momo/rtcbase/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    monitor-exit v1

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/momo/rtcbase/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-eq v2, v3, :cond_1

    .line 33
    .line 34
    new-instance v2, Ll/qse;

    .line 35
    .line 36
    invoke-direct {v2, p0, v0, p1}, Ll/qse;-><init>(Lcom/momo/rtcbase/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/momo/rtcbase/EglRenderer$FrameListener;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v2}, Lcom/momo/rtcbase/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    invoke-static {v0}, Lcom/momo/rtcbase/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 48
    .line 49
    const-string p1, "removeFrameListener must not be called on the render thread."

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw p0
.end method

.method public setFpsReduction(F)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setFpsReduction: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iget-wide v1, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    cmpg-float v3, p1, v3

    .line 25
    .line 26
    if-gtz v3, :cond_0

    .line 27
    .line 28
    const-wide v3, 0x7fffffffffffffffL

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    iput-wide v3, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const v3, 0x4e6e6b28    # 1.0E9f

    .line 39
    .line 40
    .line 41
    div-float/2addr v3, p1

    .line 42
    float-to-long v3, v3

    .line 43
    iput-wide v3, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 44
    .line 45
    :goto_0
    iget-wide v3, p0, Lcom/momo/rtcbase/EglRenderer;->minRenderPeriodNs:J

    .line 46
    .line 47
    cmp-long p1, v3, v1

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    iput-wide v1, p0, Lcom/momo/rtcbase/EglRenderer;->nextFrameTimeNs:J

    .line 56
    .line 57
    :cond_1
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw p0
.end method

.method public setLayoutAspectRatio(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLayoutAspectRatio: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput p1, p0, Lcom/momo/rtcbase/EglRenderer;->layoutAspectRatio:F

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public setMirror(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMirrorHorizontally: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput-boolean p1, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorHorizontally:Z

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public setMirrorVertically(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMirrorVertically: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput-boolean p1, p0, Lcom/momo/rtcbase/EglRenderer;->mirrorVertically:Z

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
