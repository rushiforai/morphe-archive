.class public Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceTextureHelper"

.field private static TEX_MATRIX:[F


# instance fields
.field private capture2DTexture:Z

.field private final eglBase:Lcom/bytedance/realx/video/EglBase;

.field private final frameBufferId:I

.field private frameRotation:I

.field private final glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

.field private final handler:Landroid/os/Handler;

.field private hasPendingTexture:Z

.field private isQuitting:Z

.field private volatile isTextureInUse:Z

.field private lastDeliverTime:J

.field private listener:Lcom/ss/bytertc/base/media/VideoSink;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mUsedByCamera:Z

.field private maxDeliverTimerInternal:I

.field private final oesTextureId:I

.field private pendingListener:Lcom/ss/bytertc/base/media/VideoSink;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field final setListenerRunnable:Ljava/lang/Runnable;

.field private final surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private textureHeight:I

.field private textureWidth:I

.field final timedDeliverRunnable:Ljava/lang/Runnable;

.field private final timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final twoDTextureId:I

.field private final yuvConverter:Lcom/bytedance/realx/video/YuvConverter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    sput-object v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 6
    .line 7
    return-void
.end method

.method private constructor <init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZ)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bytedance/realx/video/YuvConverter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->capture2DTexture:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->mUsedByCamera:Z

    .line 15
    .line 16
    new-instance v1, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$2;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$2;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    iput-wide v1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->lastDeliverTime:J

    .line 26
    .line 27
    const/4 v1, -0x1

    .line 28
    iput v1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 29
    .line 30
    new-instance v1, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->timedDeliverRunnable:Ljava/lang/Runnable;

    .line 36
    .line 37
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v3, 0x0

    .line 50
    if-ne v1, v2, :cond_2

    .line 51
    .line 52
    iput-object p2, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 53
    .line 54
    if-eqz p3, :cond_0

    .line 55
    .line 56
    new-instance p3, Lcom/bytedance/realx/video/TimestampAligner;

    .line 57
    .line 58
    invoke-direct {p3}, Lcom/bytedance/realx/video/TimestampAligner;-><init>()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object p3, v3

    .line 63
    :goto_0
    iput-object p3, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 64
    .line 65
    iput-boolean p4, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->capture2DTexture:Z

    .line 66
    .line 67
    sget-object p3, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 68
    .line 69
    invoke-static {p1, p3}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 74
    .line 75
    :try_start_0
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->createDummyPbufferSurface()V

    .line 76
    .line 77
    .line 78
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    if-eqz p4, :cond_1

    .line 82
    .line 83
    new-instance p1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 84
    .line 85
    invoke-direct {p1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    new-array p3, p1, [I

    .line 92
    .line 93
    invoke-static {p1, p3, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 94
    .line 95
    .line 96
    aget p1, p3, v0

    .line 97
    .line 98
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameBufferId:I

    .line 99
    .line 100
    sget-object p1, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 101
    .line 102
    invoke-static {p1, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 103
    .line 104
    .line 105
    const/16 p1, 0xde1

    .line 106
    .line 107
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    iput-object v3, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 115
    .line 116
    iput v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameBufferId:I

    .line 117
    .line 118
    iput v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 119
    .line 120
    :goto_1
    const p1, 0x8d65

    .line 121
    .line 122
    .line 123
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->oesTextureId:I

    .line 128
    .line 129
    new-instance p3, Landroid/graphics/SurfaceTexture;

    .line 130
    .line 131
    invoke-direct {p3, p1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 132
    .line 133
    .line 134
    iput-object p3, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 135
    .line 136
    new-instance p1, Ll/rah0;

    .line 137
    .line 138
    invoke-direct {p1, p0}, Ll/rah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p3, p1, p2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catch_0
    move-exception p1

    .line 146
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 147
    .line 148
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 156
    .line 157
    .line 158
    throw p1

    .line 159
    :cond_2
    const-string p0, "SurfaceTextureHelper must be created on the handler thread"

    .line 160
    .line 161
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw v3
.end method

.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZLcom/ss/bytertc/base/media/SurfaceTextureHelper$1;)V
    .locals 0

    .line 165
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZ)V

    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->returnTextureFrame()V

    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Lcom/ss/bytertc/base/media/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->pendingListener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Lcom/ss/bytertc/base/media/VideoSink;)Lcom/ss/bytertc/base/media/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->pendingListener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Lcom/ss/bytertc/base/media/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Lcom/ss/bytertc/base/media/VideoSink;)Lcom/ss/bytertc/base/media/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->updateTexImage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->lastDeliverTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isQuitting:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;II)V
    .locals 10

    .line 1
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureHeight:I

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->capture2DTexture:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const v0, 0x84c0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 13
    .line 14
    .line 15
    iget p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 16
    .line 17
    const/16 v0, 0xde1

    .line 18
    .line 19
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 20
    .line 21
    .line 22
    const/16 v8, 0x1401

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    const/16 v1, 0xde1

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const/16 v3, 0x1908

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const/16 v7, 0x1908

    .line 32
    .line 33
    move v4, p1

    .line 34
    move v5, p2

    .line 35
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Z)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Z)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-static {p0, p1, p2, v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZ)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZ)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 7

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
    new-instance v3, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$1;

    .line 19
    .line 20
    move-object v6, p0

    .line 21
    move-object v2, p1

    .line 22
    move v4, p2

    .line 23
    move v5, p3

    .line 24
    invoke-direct/range {v1 .. v6}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$1;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 32
    .line 33
    return-object p0
.end method

.method public static synthetic d(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameRotation:I

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic e(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isQuitting:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic f(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic g(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->pendingListener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 5
    .line 6
    return-void
.end method

.method private release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

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
    if-ne v0, v1, :cond_3

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isQuitting:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/bytedance/realx/video/YuvConverter;->release()V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->oesTextureId:I

    .line 31
    .line 32
    filled-new-array {v0}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->capture2DTexture:Z

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 46
    .line 47
    filled-new-array {v0}, [I

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 52
    .line 53
    .line 54
    iget v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameBufferId:I

    .line 55
    .line 56
    filled-new-array {v0}, [I

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlGenericDrawer;->release()V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 74
    .line 75
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 88
    .line 89
    if-eqz p0, :cond_1

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TimestampAligner;->dispose()V

    .line 92
    .line 93
    .line 94
    :cond_1
    return-void

    .line 95
    :cond_2
    const-string p0, "Unexpected release."

    .line 96
    .line 97
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    const-string p0, "Wrong thread."

    .line 102
    .line 103
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private returnTextureFrame()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/fah0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/fah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

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
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-ne v1, v2, :cond_7

    .line 18
    .line 19
    iget-boolean v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isQuitting:Z

    .line 20
    .line 21
    if-nez v1, :cond_6

    .line 22
    .line 23
    iget-boolean v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 24
    .line 25
    if-eqz v1, :cond_6

    .line 26
    .line 27
    iget-boolean v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 28
    .line 29
    if-nez v1, :cond_6

    .line 30
    .line 31
    iget-object v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 32
    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_0
    iget v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureWidth:I

    .line 38
    .line 39
    if-eqz v1, :cond_5

    .line 40
    .line 41
    iget v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureHeight:I

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    goto/16 :goto_2

    .line 46
    .line 47
    :cond_1
    const/4 v1, 0x1

    .line 48
    iput-boolean v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    iput-boolean v2, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 52
    .line 53
    invoke-direct {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->updateTexImage()V

    .line 54
    .line 55
    .line 56
    const/16 v3, 0x10

    .line 57
    .line 58
    new-array v4, v3, [F

    .line 59
    .line 60
    iget-boolean v5, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->mUsedByCamera:Z

    .line 61
    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    new-array v4, v3, [F

    .line 65
    .line 66
    const/high16 v3, 0x3f800000    # 1.0f

    .line 67
    .line 68
    aput v3, v4, v2

    .line 69
    .line 70
    const/4 v5, 0x0

    .line 71
    aput v5, v4, v1

    .line 72
    .line 73
    const/4 v1, 0x2

    .line 74
    aput v5, v4, v1

    .line 75
    .line 76
    const/4 v1, 0x3

    .line 77
    aput v5, v4, v1

    .line 78
    .line 79
    const/4 v1, 0x4

    .line 80
    aput v5, v4, v1

    .line 81
    .line 82
    const/4 v1, 0x5

    .line 83
    const/high16 v6, -0x40800000    # -1.0f

    .line 84
    .line 85
    aput v6, v4, v1

    .line 86
    .line 87
    const/4 v1, 0x6

    .line 88
    aput v5, v4, v1

    .line 89
    .line 90
    const/4 v1, 0x7

    .line 91
    aput v5, v4, v1

    .line 92
    .line 93
    const/16 v1, 0x8

    .line 94
    .line 95
    aput v5, v4, v1

    .line 96
    .line 97
    const/16 v1, 0x9

    .line 98
    .line 99
    aput v5, v4, v1

    .line 100
    .line 101
    const/16 v1, 0xa

    .line 102
    .line 103
    aput v3, v4, v1

    .line 104
    .line 105
    const/16 v1, 0xb

    .line 106
    .line 107
    aput v5, v4, v1

    .line 108
    .line 109
    const/16 v1, 0xc

    .line 110
    .line 111
    aput v5, v4, v1

    .line 112
    .line 113
    const/16 v1, 0xd

    .line 114
    .line 115
    aput v3, v4, v1

    .line 116
    .line 117
    const/16 v1, 0xe

    .line 118
    .line 119
    aput v5, v4, v1

    .line 120
    .line 121
    const/16 v1, 0xf

    .line 122
    .line 123
    aput v3, v4, v1

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    iget-object v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 127
    .line 128
    invoke-virtual {v1, v4}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iget-object v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 132
    .line 133
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 134
    .line 135
    .line 136
    move-result-wide v5

    .line 137
    iget-object v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 138
    .line 139
    if-eqz v1, :cond_3

    .line 140
    .line 141
    invoke-virtual {v1, v5, v6}, Lcom/bytedance/realx/video/TimestampAligner;->translateTimestamp(J)J

    .line 142
    .line 143
    .line 144
    move-result-wide v5

    .line 145
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 146
    .line 147
    .line 148
    move-result-wide v7

    .line 149
    iput-wide v7, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->lastDeliverTime:J

    .line 150
    .line 151
    iget-boolean v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->capture2DTexture:Z

    .line 152
    .line 153
    if-eqz v1, :cond_4

    .line 154
    .line 155
    iget v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameBufferId:I

    .line 156
    .line 157
    const v3, 0x8d40

    .line 158
    .line 159
    .line 160
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 161
    .line 162
    .line 163
    const/16 v1, 0xde1

    .line 164
    .line 165
    iget v7, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 166
    .line 167
    const v8, 0x8ce0

    .line 168
    .line 169
    .line 170
    invoke-static {v3, v8, v1, v7, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 171
    .line 172
    .line 173
    iget-object v9, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 174
    .line 175
    iget v10, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->oesTextureId:I

    .line 176
    .line 177
    sget-object v11, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 178
    .line 179
    iget v12, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureWidth:I

    .line 180
    .line 181
    iget v13, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureHeight:I

    .line 182
    .line 183
    const/4 v14, 0x0

    .line 184
    const/4 v15, 0x0

    .line 185
    move/from16 v16, v12

    .line 186
    .line 187
    move/from16 v17, v13

    .line 188
    .line 189
    invoke-virtual/range {v9 .. v17}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIII)V

    .line 190
    .line 191
    .line 192
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 193
    .line 194
    .line 195
    new-instance v18, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 196
    .line 197
    iget v1, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureWidth:I

    .line 198
    .line 199
    iget v2, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureHeight:I

    .line 200
    .line 201
    sget-object v21, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 202
    .line 203
    iget v3, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->twoDTextureId:I

    .line 204
    .line 205
    invoke-static {v4}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 206
    .line 207
    .line 208
    move-result-object v23

    .line 209
    iget-object v4, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 210
    .line 211
    iget-object v7, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 212
    .line 213
    new-instance v8, Ll/iah0;

    .line 214
    .line 215
    invoke-direct {v8, v0}, Ll/iah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 216
    .line 217
    .line 218
    move/from16 v19, v1

    .line 219
    .line 220
    move/from16 v20, v2

    .line 221
    .line 222
    move/from16 v22, v3

    .line 223
    .line 224
    move-object/from16 v24, v4

    .line 225
    .line 226
    move-object/from16 v25, v7

    .line 227
    .line 228
    move-object/from16 v26, v8

    .line 229
    .line 230
    invoke-direct/range {v18 .. v26}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 231
    .line 232
    .line 233
    move-object/from16 v7, v18

    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_4
    new-instance v7, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 237
    .line 238
    iget v8, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureWidth:I

    .line 239
    .line 240
    iget v9, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->textureHeight:I

    .line 241
    .line 242
    sget-object v10, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 243
    .line 244
    iget v11, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->oesTextureId:I

    .line 245
    .line 246
    invoke-static {v4}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 247
    .line 248
    .line 249
    move-result-object v12

    .line 250
    iget-object v13, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 251
    .line 252
    iget-object v14, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 253
    .line 254
    new-instance v15, Ll/iah0;

    .line 255
    .line 256
    invoke-direct {v15, v0}, Ll/iah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 257
    .line 258
    .line 259
    invoke-direct/range {v7 .. v15}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 260
    .line 261
    .line 262
    :goto_1
    new-instance v1, Lcom/bytedance/realx/video/VideoFrame;

    .line 263
    .line 264
    iget v2, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->frameRotation:I

    .line 265
    .line 266
    invoke-direct {v1, v7, v2, v5, v6}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 267
    .line 268
    .line 269
    iget-object v0, v0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 270
    .line 271
    invoke-interface {v0, v1}, Lcom/ss/bytertc/base/media/VideoSink;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_5
    :goto_2
    const-string v0, "SurfaceTextureHelper"

    .line 279
    .line 280
    const-string v1, "Texture size has not been set."

    .line 281
    .line 282
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    :cond_6
    :goto_3
    return-void

    .line 286
    :cond_7
    const-string v0, "Wrong thread."

    .line 287
    .line 288
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method private updateTexImage()V
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

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
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Ll/lah0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/lah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public isTextureInUse()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->isTextureInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFrameRotation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/uah0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/uah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMinFps(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    div-float/2addr v0, p1

    .line 7
    float-to-int p1, v0

    .line 8
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 13
    .line 14
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
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v1, Ll/oah0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, p2}, Ll/oah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;II)V

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

.method public setUsedByCamera(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->mUsedByCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public startListening(Lcom/ss/bytertc/base/media/VideoSink;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->listener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->pendingListener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->pendingListener:Lcom/ss/bytertc/base/media/VideoSink;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->timedDeliverRunnable:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "SurfaceTextureHelper listener has already been set."

    .line 27
    .line 28
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
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
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    new-instance v1, Ll/xah0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/xah0;-><init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public textureToYuv(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
