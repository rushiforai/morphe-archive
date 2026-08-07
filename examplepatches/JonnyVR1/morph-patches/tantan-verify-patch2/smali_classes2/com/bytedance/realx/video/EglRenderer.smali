.class public Lcom/bytedance/realx/video/EglRenderer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/EglRenderer$HandlerWithExceptionCallback;,
        Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;,
        Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;,
        Lcom/bytedance/realx/video/EglRenderer$FirstVideoFrameRenderListener;,
        Lcom/bytedance/realx/video/EglRenderer$FrameListener;
    }
.end annotation


# static fields
.field private static final LOG_INTERVAL_SEC:J = 0x4L

.field private static final TAG:Ljava/lang/String; = "EglRenderer"

.field private static enableGLWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;


# instance fields
.field private final bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

.field private final drawMatrix:Landroid/graphics/Matrix;

.field private drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private eglBase:Lcom/bytedance/realx/video/EglBase;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

.field private final firstRenderLock:Ljava/lang/Object;

.field private final firstVideoFrameListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/bytedance/realx/video/EglRenderer$FirstVideoFrameRenderListener;",
            ">;"
        }
    .end annotation
.end field

.field private final fpsReductionLock:Ljava/lang/Object;

.field private final frameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

.field private final frameListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;",
            ">;"
        }
    .end annotation
.end field

.field private final frameLock:Ljava/lang/Object;

.field private framesDropped:I

.field private framesReceived:I

.field private framesRendered:I

.field private final glClearWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround;

.field private final handlerLock:Ljava/lang/Object;

.field private haveRenderFirstVideoFrame:Z

.field private layoutAspectRatio:F

.field private final layoutLock:Ljava/lang/Object;

.field private final logStatisticsRunnable:Ljava/lang/Runnable;

.field private minRenderPeriodNs:J

.field private mirrorHorizontally:Z

.field private mirrorVertically:Z

.field protected final name:Ljava/lang/String;

.field private nextFrameTimeNs:J

.field private pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private volatile renderModel:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

.field private renderSwapBufferTimeNs:J

.field private renderThreadHandler:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private renderTimeNs:J

.field private final statisticsLock:Ljava/lang/Object;

.field private statisticsStartTimeNs:J

.field private usePresentationTimeStamp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusUnknown:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 2
    .line 3
    sput-object v0, Lcom/bytedance/realx/video/EglRenderer;->enableGLWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bytedance/realx/video/GlClearWorkaround;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bytedance/realx/video/GlClearWorkaround;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->glClearWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstVideoFrameListeners:Ljava/util/ArrayList;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/Object;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 38
    .line 39
    new-instance v0, Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/bytedance/realx/video/VideoFrameDrawer;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/Object;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 59
    .line 60
    new-instance v0, Ljava/lang/Object;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstRenderLock:Ljava/lang/Object;

    .line 66
    .line 67
    new-instance v0, Ljava/lang/Object;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 73
    .line 74
    new-instance v0, Ljava/lang/Object;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 80
    .line 81
    new-instance v0, Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 82
    .line 83
    const/16 v1, 0x1908

    .line 84
    .line 85
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;-><init>(I)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 89
    .line 90
    sget-object v0, Lcom/bytedance/realx/video/RendererCommon$ScalingType;->SCALE_ASPECT_FILL:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderModel:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 93
    .line 94
    new-instance v0, Lcom/bytedance/realx/video/EglRenderer$1;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Lcom/bytedance/realx/video/EglRenderer$1;-><init>(Lcom/bytedance/realx/video/EglRenderer;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 100
    .line 101
    new-instance v0, Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    invoke-direct {v0, p0, v1}, Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;-><init>(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/EglRenderer$1;)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->name:Ljava/lang/String;

    .line 110
    .line 111
    const/4 p1, 0x0

    .line 112
    iput-boolean p1, p0, Lcom/bytedance/realx/video/EglRenderer;->haveRenderFirstVideoFrame:Z

    .line 113
    .line 114
    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/EglRenderer;->renderFrameOnRenderThread()V

    return-void
.end method

.method public static synthetic access$000(Lcom/bytedance/realx/video/EglRenderer;)Lcom/bytedance/realx/video/EglBase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/video/EglRenderer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/EglRenderer;->logStatistics()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/bytedance/realx/video/EglRenderer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/bytedance/realx/video/EglRenderer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/bytedance/realx/video/EglRenderer;Landroid/os/Handler;)Landroid/os/Handler;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/bytedance/realx/video/EglRenderer;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

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

.method public static synthetic b(Lcom/bytedance/realx/video/EglRenderer;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->detachCurrent()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->releaseSurface()V

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

.method public static synthetic c(Lcom/bytedance/realx/video/EglRenderer;FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bytedance/realx/video/EglRenderer;->clearSurfaceOnRenderThread(FFFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearSurfaceOnRenderThread(FFFF)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->hasSurface()Z

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->surfaceWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->surfaceHeight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/16 v4, 0x4000

    .line 29
    .line 30
    move-object v1, p0

    .line 31
    move v5, p1

    .line 32
    move v6, p2

    .line 33
    move v7, p3

    .line 34
    move v8, p4

    .line 35
    invoke-direct/range {v1 .. v8}, Lcom/bytedance/realx/video/EglRenderer;->glClear(IIIFFFF)V

    .line 36
    .line 37
    .line 38
    iget-object p0, v1, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 39
    .line 40
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->swapBuffers()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private createEglSurfaceInternal(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;->setSurface(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/EglBase$Context;[I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "EglBase10.create context"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Lcom/bytedance/realx/video/EglBase;->createEgl10([I)Lcom/bytedance/realx/video/EglBase;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "EglBase.create shared context"

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p2}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->glClearWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/bytedance/realx/video/GlClearWorkaround;->init()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic e(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/EglRenderer$FrameListener;FZ)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 4
    .line 5
    :cond_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 6
    .line 7
    new-instance v0, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;

    .line 8
    .line 9
    invoke-direct {v0, p2, p3, p1, p4}, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;-><init>(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic f(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->glClearWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlClearWorkaround;->release()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/bytedance/realx/video/RendererCommon$GlDrawer;->release()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/bytedance/realx/video/VideoFrameDrawer;->release()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->release()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const-string v0, "eglBase detach and release."

    .line 35
    .line 36
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 40
    .line 41
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->detachCurrent()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 45
    .line 46
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstRenderLock:Ljava/lang/Object;

    .line 57
    .line 58
    monitor-enter v0

    .line 59
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstVideoFrameListeners:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 62
    .line 63
    .line 64
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p0
.end method

.method public static synthetic g(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V
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
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

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
    check-cast p1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->listener:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

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

.method private glClear(IIIFFFF)V
    .locals 10

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglRenderer;->enableGLWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 2
    .line 3
    sget-object v1, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusUnknown:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/bytedance/realx/video/GlClearWorkaround;->isNeedWorkaround()Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/bytedance/realx/video/EglRenderer;->enableGLWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcom/bytedance/realx/video/EglRenderer;->enableGLWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 14
    .line 15
    sget-object v1, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusEnable:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->glClearWorkaround:Lcom/bytedance/realx/video/GlClearWorkaround;

    .line 20
    .line 21
    const/high16 v8, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/16 v9, 0x8

    .line 24
    .line 25
    move v1, p1

    .line 26
    move v2, p2

    .line 27
    move v3, p3

    .line 28
    move v4, p4

    .line 29
    move v5, p5

    .line 30
    move/from16 v6, p6

    .line 31
    .line 32
    move/from16 v7, p7

    .line 33
    .line 34
    invoke-virtual/range {v0 .. v9}, Lcom/bytedance/realx/video/GlClearWorkaround;->clear(IIIFFFFFI)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-static/range {p4 .. p7}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 39
    .line 40
    .line 41
    const/16 v0, 0x4000

    .line 42
    .line 43
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic h(Lcom/bytedance/realx/video/EglRenderer;Landroid/os/Looper;)V
    .locals 1

    .line 1
    const-string v0, "Quitting render thread."

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/Looper;->quit()V

    .line 7
    .line 8
    .line 9
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
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->name:Ljava/lang/String;

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
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

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
    iget-object v4, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v4

    .line 17
    :try_start_0
    iget-wide v5, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsStartTimeNs:J

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
    iget v7, p0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

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
    iget v0, p0, Lcom/bytedance/realx/video/EglRenderer;->framesReceived:I

    .line 59
    .line 60
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, ". Dropped: "

    .line 64
    .line 65
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v0, p0, Lcom/bytedance/realx/video/EglRenderer;->framesDropped:I

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
    iget v0, p0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

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
    iget-wide v0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderTimeNs:J

    .line 102
    .line 103
    iget v5, p0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

    .line 104
    .line 105
    invoke-direct {p0, v0, v1, v5}, Lcom/bytedance/realx/video/EglRenderer;->averageTimeAsString(JI)Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderSwapBufferTimeNs:J

    .line 118
    .line 119
    iget v5, p0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

    .line 120
    .line 121
    invoke-direct {p0, v0, v1, v5}, Lcom/bytedance/realx/video/EglRenderer;->averageTimeAsString(JI)Ljava/lang/String;

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0, v2, v3}, Lcom/bytedance/realx/video/EglRenderer;->resetStatistics(J)V

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
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->name:Ljava/lang/String;

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
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private notifyCallbacks(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

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
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    const/high16 v1, 0x3f000000    # 0.5f

    .line 19
    .line 20
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/bytedance/realx/video/EglRenderer;->mirrorHorizontally:Z

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
    iget-boolean v4, p0, Lcom/bytedance/realx/video/EglRenderer;->mirrorVertically:Z

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
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 52
    .line 53
    const/high16 v1, -0x41000000    # -0.5f

    .line 54
    .line 55
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameListeners:Ljava/util/ArrayList;

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
    check-cast v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;

    .line 75
    .line 76
    if-nez p2, :cond_3

    .line 77
    .line 78
    iget-boolean v2, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->applyFpsReduction:Z

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
    iget v2, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->scale:F

    .line 87
    .line 88
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedWidth()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    int-to-float v3, v3

    .line 93
    mul-float/2addr v2, v3

    .line 94
    float-to-int v4, v2

    .line 95
    iget v2, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->scale:F

    .line 96
    .line 97
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedHeight()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-float v3, v3

    .line 102
    mul-float/2addr v2, v3

    .line 103
    float-to-int v5, v2

    .line 104
    if-eqz v4, :cond_5

    .line 105
    .line 106
    if-nez v5, :cond_4

    .line 107
    .line 108
    goto/16 :goto_3

    .line 109
    .line 110
    :cond_4
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 111
    .line 112
    invoke-virtual {v2, v4, v5}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->setSize(II)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 116
    .line 117
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->getFrameBufferId()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    const v11, 0x8d40

    .line 122
    .line 123
    .line 124
    invoke-static {v11, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->bitmapTextureFramebuffer:Lcom/bytedance/realx/video/GlTextureFrameBuffer;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/bytedance/realx/video/GlTextureFrameBuffer;->getTextureId()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    const v3, 0x8ce0

    .line 134
    .line 135
    .line 136
    const/16 v6, 0xde1

    .line 137
    .line 138
    const/4 v12, 0x0

    .line 139
    invoke-static {v11, v3, v6, v2, v12}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 140
    .line 141
    .line 142
    const/4 v9, 0x0

    .line 143
    const/4 v10, 0x0

    .line 144
    const/16 v6, 0x4000

    .line 145
    .line 146
    const/4 v7, 0x0

    .line 147
    const/4 v8, 0x0

    .line 148
    move-object v3, p0

    .line 149
    invoke-direct/range {v3 .. v10}, Lcom/bytedance/realx/video/EglRenderer;->glClear(IIIFFFF)V

    .line 150
    .line 151
    .line 152
    iget-object v3, p0, Lcom/bytedance/realx/video/EglRenderer;->frameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 153
    .line 154
    move v6, v5

    .line 155
    iget-object v5, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 156
    .line 157
    move v10, v6

    .line 158
    iget-object v6, p0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 159
    .line 160
    const/4 v7, 0x0

    .line 161
    const/4 v8, 0x0

    .line 162
    move v9, v4

    .line 163
    move-object v4, p1

    .line 164
    invoke-virtual/range {v3 .. v10}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    .line 165
    .line 166
    .line 167
    move v4, v9

    .line 168
    move v5, v10

    .line 169
    mul-int v2, v4, v5

    .line 170
    .line 171
    mul-int/lit8 v2, v2, 0x4

    .line 172
    .line 173
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v9

    .line 177
    invoke-static {v12, v12, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 178
    .line 179
    .line 180
    const/16 v7, 0x1908

    .line 181
    .line 182
    const/16 v8, 0x1401

    .line 183
    .line 184
    const/4 v3, 0x0

    .line 185
    move v6, v5

    .line 186
    move v5, v4

    .line 187
    const/4 v4, 0x0

    .line 188
    invoke-static/range {v3 .. v9}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 189
    .line 190
    .line 191
    move v4, v5

    .line 192
    move v5, v6

    .line 193
    invoke-static {v11, v12}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 194
    .line 195
    .line 196
    const-string v2, "EglRenderer.notifyCallbacks"

    .line 197
    .line 198
    invoke-static {v2}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 202
    .line 203
    invoke-static {v4, v5, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2, v9}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->listener:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    .line 211
    .line 212
    invoke-interface {v1, v2}, Lcom/bytedance/realx/video/EglRenderer$FrameListener;->onFrame(Landroid/graphics/Bitmap;)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_2

    .line 216
    .line 217
    :cond_5
    :goto_3
    iget-object v1, v1, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->listener:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    .line 218
    .line 219
    const/4 v2, 0x0

    .line 220
    invoke-interface {v1, v2}, Lcom/bytedance/realx/video/EglRenderer$FrameListener;->onFrame(Landroid/graphics/Bitmap;)V

    .line 221
    .line 222
    .line 223
    goto/16 :goto_2

    .line 224
    .line 225
    :cond_6
    :goto_4
    return-void
.end method

.method private notifyFristRenderCallback()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstVideoFrameListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/bytedance/realx/video/EglRenderer$FirstVideoFrameRenderListener;

    .line 21
    .line 22
    invoke-interface {v1}, Lcom/bytedance/realx/video/EglRenderer$FirstVideoFrameRenderListener;->onFirstVideoFrameRender()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
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

.method private postToRenderThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

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
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v8, v0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 7
    .line 8
    if-nez v8, :cond_0

    .line 9
    .line 10
    monitor-exit v1

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto/16 :goto_c

    .line 14
    .line 15
    :cond_0
    const/4 v2, 0x0

    .line 16
    iput-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 17
    .line 18
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v1}, Lcom/bytedance/realx/video/EglBase;->hasSurface()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    :cond_1
    move-object v3, v8

    .line 30
    goto/16 :goto_b

    .line 31
    .line 32
    :cond_2
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 33
    .line 34
    monitor-enter v1

    .line 35
    :try_start_1
    iget-wide v2, v0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

    .line 36
    .line 37
    const-wide v4, 0x7fffffffffffffffL

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    cmp-long v4, v2, v4

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    const/4 v10, 0x1

    .line 46
    if-nez v4, :cond_3

    .line 47
    .line 48
    :goto_0
    move v11, v5

    .line 49
    goto :goto_2

    .line 50
    :cond_3
    const-wide/16 v6, 0x0

    .line 51
    .line 52
    cmp-long v2, v2, v6

    .line 53
    .line 54
    if-gtz v2, :cond_4

    .line 55
    .line 56
    :goto_1
    move v11, v10

    .line 57
    goto :goto_2

    .line 58
    :cond_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    iget-wide v6, v0, Lcom/bytedance/realx/video/EglRenderer;->nextFrameTimeNs:J

    .line 63
    .line 64
    cmp-long v4, v2, v6

    .line 65
    .line 66
    if-gez v4, :cond_5

    .line 67
    .line 68
    const-string v2, "Skipping frame rendering - fps reduction is active."

    .line 69
    .line 70
    invoke-direct {v0, v2}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catchall_1
    move-exception v0

    .line 75
    goto/16 :goto_a

    .line 76
    .line 77
    :cond_5
    iget-wide v11, v0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

    .line 78
    .line 79
    add-long/2addr v6, v11

    .line 80
    iput-wide v6, v0, Lcom/bytedance/realx/video/EglRenderer;->nextFrameTimeNs:J

    .line 81
    .line 82
    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    iput-wide v2, v0, Lcom/bytedance/realx/video/EglRenderer;->nextFrameTimeNs:J

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :goto_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 90
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v12

    .line 94
    invoke-interface {v8}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedHeight()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-gtz v1, :cond_6

    .line 99
    .line 100
    return-void

    .line 101
    :cond_6
    invoke-interface {v8}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedWidth()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    int-to-float v1, v1

    .line 106
    invoke-interface {v8}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getRotatedHeight()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    int-to-float v2, v2

    .line 111
    div-float/2addr v1, v2

    .line 112
    iget-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 113
    .line 114
    monitor-enter v2

    .line 115
    :try_start_2
    iget v3, v0, Lcom/bytedance/realx/video/EglRenderer;->layoutAspectRatio:F

    .line 116
    .line 117
    const/4 v4, 0x0

    .line 118
    cmpl-float v4, v3, v4

    .line 119
    .line 120
    if-eqz v4, :cond_7

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_7
    move v3, v1

    .line 124
    :goto_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 125
    iget-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 126
    .line 127
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase;->surfaceWidth()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iget-object v4, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 132
    .line 133
    invoke-interface {v4}, Lcom/bytedance/realx/video/EglBase;->surfaceHeight()I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    sget-object v6, Lcom/bytedance/realx/video/EglRenderer$3;->$SwitchMap$com$bytedance$realx$video$RendererCommon$ScalingType:[I

    .line 138
    .line 139
    iget-object v7, v0, Lcom/bytedance/realx/video/EglRenderer;->renderModel:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 140
    .line 141
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    aget v6, v6, v7

    .line 146
    .line 147
    const/4 v7, 0x2

    .line 148
    const/high16 v9, 0x3f800000    # 1.0f

    .line 149
    .line 150
    if-eq v6, v10, :cond_a

    .line 151
    .line 152
    if-eq v6, v7, :cond_9

    .line 153
    .line 154
    cmpl-float v6, v1, v3

    .line 155
    .line 156
    if-lez v6, :cond_8

    .line 157
    .line 158
    div-float/2addr v3, v1

    .line 159
    move v14, v5

    .line 160
    move v15, v14

    .line 161
    move-object/from16 v16, v8

    .line 162
    .line 163
    move v1, v9

    .line 164
    move v8, v2

    .line 165
    move v9, v4

    .line 166
    move v2, v1

    .line 167
    goto :goto_6

    .line 168
    :cond_8
    div-float/2addr v1, v3

    .line 169
    move v14, v5

    .line 170
    move v15, v14

    .line 171
    move-object/from16 v16, v8

    .line 172
    .line 173
    move v3, v9

    .line 174
    :goto_4
    move v8, v2

    .line 175
    move v9, v4

    .line 176
    move v2, v3

    .line 177
    goto :goto_6

    .line 178
    :cond_9
    move v14, v5

    .line 179
    move v15, v14

    .line 180
    :goto_5
    move-object/from16 v16, v8

    .line 181
    .line 182
    move v1, v9

    .line 183
    move v3, v1

    .line 184
    goto :goto_4

    .line 185
    :cond_a
    cmpl-float v3, v1, v3

    .line 186
    .line 187
    iget-object v6, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 188
    .line 189
    if-lez v3, :cond_b

    .line 190
    .line 191
    invoke-interface {v6}, Lcom/bytedance/realx/video/EglBase;->surfaceWidth()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    int-to-float v3, v3

    .line 196
    div-float/2addr v3, v1

    .line 197
    float-to-int v4, v3

    .line 198
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 199
    .line 200
    invoke-interface {v1}, Lcom/bytedance/realx/video/EglBase;->surfaceHeight()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    sub-int/2addr v1, v4

    .line 205
    div-int/2addr v1, v7

    .line 206
    move v15, v1

    .line 207
    move v14, v5

    .line 208
    goto :goto_5

    .line 209
    :cond_b
    invoke-interface {v6}, Lcom/bytedance/realx/video/EglBase;->surfaceHeight()I

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    int-to-float v2, v2

    .line 214
    mul-float/2addr v2, v1

    .line 215
    float-to-int v2, v2

    .line 216
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 217
    .line 218
    invoke-interface {v1}, Lcom/bytedance/realx/video/EglBase;->surfaceWidth()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    sub-int/2addr v1, v2

    .line 223
    div-int/2addr v1, v7

    .line 224
    move v14, v1

    .line 225
    move v15, v5

    .line 226
    goto :goto_5

    .line 227
    :goto_6
    iget-object v4, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 228
    .line 229
    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 230
    .line 231
    .line 232
    iget-object v4, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 233
    .line 234
    const/high16 v5, 0x3f000000    # 0.5f

    .line 235
    .line 236
    invoke-virtual {v4, v5, v5}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 237
    .line 238
    .line 239
    iget-object v4, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 240
    .line 241
    iget-boolean v5, v0, Lcom/bytedance/realx/video/EglRenderer;->mirrorHorizontally:Z

    .line 242
    .line 243
    const/high16 v6, -0x40800000    # -1.0f

    .line 244
    .line 245
    if-eqz v5, :cond_c

    .line 246
    .line 247
    move v5, v6

    .line 248
    goto :goto_7

    .line 249
    :cond_c
    move v5, v2

    .line 250
    :goto_7
    iget-boolean v7, v0, Lcom/bytedance/realx/video/EglRenderer;->mirrorVertically:Z

    .line 251
    .line 252
    if-eqz v7, :cond_d

    .line 253
    .line 254
    move v2, v6

    .line 255
    :cond_d
    invoke-virtual {v4, v5, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 256
    .line 257
    .line 258
    iget-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 259
    .line 260
    invoke-virtual {v2, v3, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 261
    .line 262
    .line 263
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 264
    .line 265
    const/high16 v2, -0x41000000    # -0.5f

    .line 266
    .line 267
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 268
    .line 269
    .line 270
    if-eqz v11, :cond_f

    .line 271
    .line 272
    iget-object v1, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 273
    .line 274
    invoke-interface {v1}, Lcom/bytedance/realx/video/EglBase;->surfaceWidth()I

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    iget-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 279
    .line 280
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase;->surfaceHeight()I

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    const/4 v6, 0x0

    .line 285
    const/4 v7, 0x0

    .line 286
    const/16 v3, 0x4000

    .line 287
    .line 288
    const/4 v4, 0x0

    .line 289
    const/4 v5, 0x0

    .line 290
    invoke-direct/range {v0 .. v7}, Lcom/bytedance/realx/video/EglRenderer;->glClear(IIIFFFF)V

    .line 291
    .line 292
    .line 293
    iget-object v2, v0, Lcom/bytedance/realx/video/EglRenderer;->frameDrawer:Lcom/bytedance/realx/video/VideoFrameDrawer;

    .line 294
    .line 295
    iget-object v4, v0, Lcom/bytedance/realx/video/EglRenderer;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 296
    .line 297
    iget-object v5, v0, Lcom/bytedance/realx/video/EglRenderer;->drawMatrix:Landroid/graphics/Matrix;

    .line 298
    .line 299
    move v6, v14

    .line 300
    move v7, v15

    .line 301
    move-object/from16 v3, v16

    .line 302
    .line 303
    invoke-virtual/range {v2 .. v9}, Lcom/bytedance/realx/video/VideoFrameDrawer;->drawFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    .line 304
    .line 305
    .line 306
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 307
    .line 308
    .line 309
    move-result-wide v1

    .line 310
    iget-boolean v4, v0, Lcom/bytedance/realx/video/EglRenderer;->usePresentationTimeStamp:Z

    .line 311
    .line 312
    iget-object v5, v0, Lcom/bytedance/realx/video/EglRenderer;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 313
    .line 314
    if-eqz v4, :cond_e

    .line 315
    .line 316
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->getTimestampNs()J

    .line 317
    .line 318
    .line 319
    move-result-wide v6

    .line 320
    invoke-interface {v5, v6, v7}, Lcom/bytedance/realx/video/EglBase;->swapBuffers(J)V

    .line 321
    .line 322
    .line 323
    goto :goto_8

    .line 324
    :cond_e
    invoke-interface {v5}, Lcom/bytedance/realx/video/EglBase;->swapBuffers()V

    .line 325
    .line 326
    .line 327
    :goto_8
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 328
    .line 329
    .line 330
    move-result-wide v4

    .line 331
    iget-object v6, v0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 332
    .line 333
    monitor-enter v6

    .line 334
    :try_start_3
    iget v7, v0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

    .line 335
    .line 336
    add-int/2addr v7, v10

    .line 337
    iput v7, v0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

    .line 338
    .line 339
    iget-wide v7, v0, Lcom/bytedance/realx/video/EglRenderer;->renderTimeNs:J

    .line 340
    .line 341
    sub-long v12, v4, v12

    .line 342
    .line 343
    add-long/2addr v7, v12

    .line 344
    iput-wide v7, v0, Lcom/bytedance/realx/video/EglRenderer;->renderTimeNs:J

    .line 345
    .line 346
    iget-wide v7, v0, Lcom/bytedance/realx/video/EglRenderer;->renderSwapBufferTimeNs:J

    .line 347
    .line 348
    sub-long/2addr v4, v1

    .line 349
    add-long/2addr v7, v4

    .line 350
    iput-wide v7, v0, Lcom/bytedance/realx/video/EglRenderer;->renderSwapBufferTimeNs:J

    .line 351
    .line 352
    monitor-exit v6

    .line 353
    goto :goto_9

    .line 354
    :catchall_2
    move-exception v0

    .line 355
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 356
    throw v0

    .line 357
    :cond_f
    move-object/from16 v3, v16

    .line 358
    .line 359
    :goto_9
    invoke-direct {v0, v3, v11}, Lcom/bytedance/realx/video/EglRenderer;->notifyCallbacks(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;Z)V

    .line 360
    .line 361
    .line 362
    iget-boolean v1, v0, Lcom/bytedance/realx/video/EglRenderer;->haveRenderFirstVideoFrame:Z

    .line 363
    .line 364
    if-nez v1, :cond_10

    .line 365
    .line 366
    invoke-direct {v0}, Lcom/bytedance/realx/video/EglRenderer;->notifyFristRenderCallback()V

    .line 367
    .line 368
    .line 369
    iput-boolean v10, v0, Lcom/bytedance/realx/video/EglRenderer;->haveRenderFirstVideoFrame:Z

    .line 370
    .line 371
    :cond_10
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :catchall_3
    move-exception v0

    .line 376
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 377
    throw v0

    .line 378
    :goto_a
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 379
    throw v0

    .line 380
    :goto_b
    const-string v1, "Dropping frame - No surface"

    .line 381
    .line 382
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 386
    .line 387
    .line 388
    return-void

    .line 389
    :goto_c
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 390
    throw v0
.end method

.method private resetStatistics(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-wide p1, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsStartTimeNs:J

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/bytedance/realx/video/EglRenderer;->framesReceived:I

    .line 8
    .line 9
    iput p1, p0, Lcom/bytedance/realx/video/EglRenderer;->framesDropped:I

    .line 10
    .line 11
    iput p1, p0, Lcom/bytedance/realx/video/EglRenderer;->framesRendered:I

    .line 12
    .line 13
    const-wide/16 p1, 0x0

    .line 14
    .line 15
    iput-wide p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderTimeNs:J

    .line 16
    .line 17
    iput-wide p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderSwapBufferTimeNs:J

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
.method public addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;F)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/bytedance/realx/video/EglRenderer;->addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/bytedance/realx/video/EglRenderer;->addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V
    .locals 6
    .param p3    # Lcom/bytedance/realx/video/RendererCommon$GlDrawer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/pse;

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
    invoke-direct/range {v0 .. v5}, Ll/pse;-><init>(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/EglRenderer$FrameListener;FZ)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/bytedance/realx/video/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public addFristFrameListener(Lcom/bytedance/realx/video/EglRenderer$FirstVideoFrameRenderListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstRenderLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->firstVideoFrameListeners:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

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

.method public clearImage()V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/bytedance/realx/video/EglRenderer;->clearImage(FFFF)V

    return-void
.end method

.method public clearImage(FFFF)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

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
    new-instance v2, Ll/jse;

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
    invoke-direct/range {v2 .. v7}, Ll/jse;-><init>(Lcom/bytedance/realx/video/EglRenderer;FFFF)V

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
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->createEglSurfaceInternal(Ljava/lang/Object;)V

    return-void
.end method

.method public createEglSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->createEglSurfaceInternal(Ljava/lang/Object;)V

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
    invoke-virtual {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->setFpsReduction(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 1
    .param p1    # Lcom/bytedance/realx/video/EglBase$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 122
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/bytedance/realx/video/EglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V

    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V
    .locals 2
    .param p1    # Lcom/bytedance/realx/video/EglBase$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "Initializing EglRenderer"

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Lcom/bytedance/realx/video/EglRenderer;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 14
    .line 15
    iput-boolean p4, p0, Lcom/bytedance/realx/video/EglRenderer;->usePresentationTimeStamp:Z

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
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->name:Ljava/lang/String;

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
    new-instance p4, Lcom/bytedance/realx/video/EglRenderer$HandlerWithExceptionCallback;

    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    new-instance v1, Lcom/bytedance/realx/video/EglRenderer$2;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/bytedance/realx/video/EglRenderer$2;-><init>(Lcom/bytedance/realx/video/EglRenderer;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p4, p3, v1}, Lcom/bytedance/realx/video/EglRenderer$HandlerWithExceptionCallback;-><init>(Landroid/os/Looper;Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iput-object p4, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 59
    .line 60
    new-instance p3, Ll/mse;

    .line 61
    .line 62
    invoke-direct {p3, p0, p1, p2}, Ll/mse;-><init>(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/EglBase$Context;[I)V

    .line 63
    .line 64
    .line 65
    invoke-static {p4, p3}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 69
    .line 70
    iget-object p2, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

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
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/EglRenderer;->resetStatistics(J)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

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
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer;->name:Ljava/lang/String;

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

.method public onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/bytedance/realx/video/EglRenderer;->framesReceived:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    add-int/2addr v1, v2

    .line 8
    iput v1, p0, Lcom/bytedance/realx/video/EglRenderer;->framesReceived:I

    .line 9
    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 11
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string p1, "Dropping frame - Not initialized or already released."

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

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
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    :try_start_2
    iget-object v3, p0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

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
    invoke-interface {v3}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

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
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 46
    .line 47
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->retain()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 51
    .line 52
    new-instance v3, Ll/bte;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Ll/bte;-><init>(Lcom/bytedance/realx/video/EglRenderer;)V

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
    iget-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->statisticsLock:Ljava/lang/Object;

    .line 65
    .line 66
    monitor-enter p1

    .line 67
    :try_start_4
    iget v0, p0, Lcom/bytedance/realx/video/EglRenderer;->framesDropped:I

    .line 68
    .line 69
    add-int/2addr v0, v2

    .line 70
    iput v0, p0, Lcom/bytedance/realx/video/EglRenderer;->framesDropped:I

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
    invoke-virtual {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->setFpsReduction(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public printStackTrace()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

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
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/EglRenderer;->logW(Ljava/lang/String;)V

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
    invoke-direct {p0, v4}, Lcom/bytedance/realx/video/EglRenderer;->logW(Ljava/lang/String;)V

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

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
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-string v0, "Already released"

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

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
    iget-object v3, p0, Lcom/bytedance/realx/video/EglRenderer;->logStatisticsRunnable:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v3, Ll/vse;

    .line 36
    .line 37
    invoke-direct {v3, p0, v0}, Ll/vse;-><init>(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 50
    .line 51
    new-instance v4, Ll/yse;

    .line 52
    .line 53
    invoke-direct {v4, p0, v2}, Ll/yse;-><init>(Lcom/bytedance/realx/video/EglRenderer;Landroid/os/Looper;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    iput-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 61
    .line 62
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    invoke-static {v0}, Lcom/bytedance/realx/base/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->frameLock:Ljava/lang/Object;

    .line 67
    .line 68
    monitor-enter v0

    .line 69
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

    .line 70
    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->pendingFrame:Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

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
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;->setSurface(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->eglSurfaceCreationRunnable:Lcom/bytedance/realx/video/EglRenderer$EglSurfaceCreation;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

    .line 20
    .line 21
    new-instance v2, Ll/sse;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1}, Ll/sse;-><init>(Lcom/bytedance/realx/video/EglRenderer;Ljava/lang/Runnable;)V

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

.method public removeFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V
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
    iget-object v1, p0, Lcom/bytedance/realx/video/EglRenderer;->handlerLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

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
    iget-object v3, p0, Lcom/bytedance/realx/video/EglRenderer;->renderThreadHandler:Landroid/os/Handler;

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
    new-instance v2, Ll/ete;

    .line 35
    .line 36
    invoke-direct {v2, p0, v0, p1}, Ll/ete;-><init>(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/EglRenderer;->postToRenderThread(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    invoke-static {v0}, Lcom/bytedance/realx/base/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->fpsReductionLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iget-wide v1, p0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

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
    iput-wide v3, p0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

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
    iput-wide v3, p0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

    .line 44
    .line 45
    :goto_0
    iget-wide v3, p0, Lcom/bytedance/realx/video/EglRenderer;->minRenderPeriodNs:J

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
    iput-wide v1, p0, Lcom/bytedance/realx/video/EglRenderer;->nextFrameTimeNs:J

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput p1, p0, Lcom/bytedance/realx/video/EglRenderer;->layoutAspectRatio:F

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput-boolean p1, p0, Lcom/bytedance/realx/video/EglRenderer;->mirrorHorizontally:Z

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
    invoke-direct {p0, v0}, Lcom/bytedance/realx/video/EglRenderer;->logD(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer;->layoutLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iput-boolean p1, p0, Lcom/bytedance/realx/video/EglRenderer;->mirrorVertically:Z

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

.method public setRenderModel(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer;->renderModel:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 2
    .line 3
    return-void
.end method
