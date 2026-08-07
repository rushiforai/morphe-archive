.class public Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/ISurfaceTextureHelper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/TimerSurfaceTextureHelper$IVideoCapture;
    }
.end annotation


# static fields
.field private static final ANDROID_API_TEXTURE_IN_USE:I = 0xa

.field private static final DEFAULT_MAX_BUFFER_COUNT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "TSurfaceTextureHelper"


# instance fields
.field private final auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

.field private eglBase:Lio/agora/base/internal/video/EglBase;

.field private frameRate:I

.field private frameRotation:I

.field private final handler:Landroid/os/Handler;

.field private hasFrameRate:Z

.field private hasPendingTexture:Z

.field private volatile isOesTextureInUse:Z

.field private isQuitting:Z

.field private listener:Lio/agora/base/internal/video/VideoSink;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private notifyIntervalInMS:I

.field private final oesTextureId:I

.field private pendingListener:Lio/agora/base/internal/video/VideoSink;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private volatile prevTimeMillis:J

.field private final proxyHandler:Landroid/os/Handler;

.field final scheduledExecutorRunnable:Ljava/lang/Runnable;

.field private scheduledService:Ljava/util/concurrent/ScheduledExecutorService;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field final setListenerRunnable:Ljava/lang/Runnable;

.field private final sharedContext:Lio/agora/base/internal/video/EglBase$Context;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final smoothCapture:Z

.field final supplementRunnable:Ljava/lang/Runnable;

.field private final surfaceTexture:Landroid/graphics/SurfaceTexture;

.field final systemGenerateRunnable:Ljava/lang/Runnable;

.field private final textureBufferPool:Lio/agora/base/internal/video/TextureBufferPool;

.field private textureHeight:I

.field private textureWidth:I

.field final timerNotifyRunnable:Ljava/lang/Runnable;

.field final timerRunnable:Ljava/lang/Runnable;

.field private final videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

.field private final yuvConverter:Lio/agora/base/internal/video/YuvConverter;


# direct methods
.method private constructor <init>(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;I)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x43

    .line 5
    .line 6
    iput v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->prevTimeMillis:J

    .line 11
    .line 12
    new-instance v8, Lio/agora/base/internal/video/YuvConverter;

    .line 13
    .line 14
    invoke-direct {v8}, Lio/agora/base/internal/video/YuvConverter;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v8, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasPendingTexture:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isQuitting:Z

    .line 25
    .line 26
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 32
    .line 33
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$3;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$3;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerNotifyRunnable:Ljava/lang/Runnable;

    .line 39
    .line 40
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$4;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$4;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->systemGenerateRunnable:Ljava/lang/Runnable;

    .line 46
    .line 47
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$5;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->supplementRunnable:Ljava/lang/Runnable;

    .line 53
    .line 54
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$6;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerRunnable:Ljava/lang/Runnable;

    .line 60
    .line 61
    new-instance v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledExecutorRunnable:Ljava/lang/Runnable;

    .line 67
    .line 68
    invoke-virtual {p4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    if-ne v0, v1, :cond_1

    .line 81
    .line 82
    iput-object p4, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 83
    .line 84
    iput-boolean p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->smoothCapture:Z

    .line 85
    .line 86
    new-instance p2, Landroid/os/HandlerThread;

    .line 87
    .line 88
    const-string v0, "delayThread"

    .line 89
    .line 90
    invoke-direct {p2, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 94
    .line 95
    .line 96
    new-instance v0, Landroid/os/Handler;

    .line 97
    .line 98
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-direct {v0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 106
    .line 107
    :try_start_0
    sget-object p2, Lio/agora/base/internal/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 108
    .line 109
    invoke-static {p3, p2}, Lio/agora/base/internal/video/EglBaseFactory;->create(Lio/agora/base/internal/video/EglBase$Context;[I)Lio/agora/base/internal/video/EglBase;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    iput-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 114
    .line 115
    invoke-interface {p2}, Lio/agora/base/internal/video/EglBase;->createDummyPbufferSurface()V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 119
    .line 120
    invoke-interface {p2}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .line 122
    .line 123
    new-instance p2, Lio/agora/base/internal/video/VideoDecimator;

    .line 124
    .line 125
    invoke-direct {p2}, Lio/agora/base/internal/video/VideoDecimator;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 129
    .line 130
    new-instance p2, Lio/agora/base/internal/video/VideoDecimator;

    .line 131
    .line 132
    invoke-direct {p2}, Lio/agora/base/internal/video/VideoDecimator;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 136
    .line 137
    if-eqz p3, :cond_0

    .line 138
    .line 139
    move-object p2, p3

    .line 140
    goto :goto_0

    .line 141
    :cond_0
    iget-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 142
    .line 143
    invoke-interface {p2}, Lio/agora/base/internal/video/EglBase;->getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    :goto_0
    iput-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 148
    .line 149
    const p2, 0x8d65

    .line 150
    .line 151
    .line 152
    invoke-static {p2}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    iput p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->oesTextureId:I

    .line 157
    .line 158
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 159
    .line 160
    invoke-direct {v0, p2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 161
    .line 162
    .line 163
    iput-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 164
    .line 165
    const/16 v4, 0x1907

    .line 166
    .line 167
    iget-object v6, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 168
    .line 169
    move-object v2, p1

    .line 170
    move-object v7, p3

    .line 171
    move-object v5, p4

    .line 172
    move v3, p5

    .line 173
    invoke-static/range {v2 .. v8}, Lio/agora/base/internal/video/TextureBufferPool;->createWithinGlThread(Ljava/lang/String;IILandroid/os/Handler;Lio/agora/base/internal/video/EglBase;Lio/agora/base/internal/video/EglBase$Context;Lio/agora/base/internal/video/YuvConverter;)Lio/agora/base/internal/video/TextureBufferPool;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureBufferPool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 178
    .line 179
    new-instance p2, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$8;

    .line 180
    .line 181
    invoke-direct {p2, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$8;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, p2}, Lio/agora/base/internal/video/TextureBufferPool;->setPoolBufferReleaseCallback(Ljava/lang/Runnable;)V

    .line 185
    .line 186
    .line 187
    new-instance p1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$9;

    .line 188
    .line 189
    invoke-direct {p1, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$9;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 190
    .line 191
    .line 192
    invoke-static {v0, p1, v5}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    move-object v5, p4

    .line 198
    move-object p1, v0

    .line 199
    :try_start_1
    iget-object p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 200
    .line 201
    invoke-interface {p2}, Lio/agora/base/internal/video/EglBase;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :catch_1
    move-exception v0

    .line 206
    move-object p2, v0

    .line 207
    invoke-static {p2}, Lcom/google/devtools/build/android/desugar/runtime/ThrowableExtension;->printStackTrace(Ljava/lang/Throwable;)V

    .line 208
    .line 209
    .line 210
    :goto_1
    invoke-virtual {v5}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    invoke-virtual {p2}, Landroid/os/Looper;->quit()V

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 224
    .line 225
    .line 226
    throw p1

    .line 227
    :cond_1
    const-string p0, "SurfaceTextureHelper must be created on the handler thread"

    .line 228
    .line 229
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    const/4 p0, 0x0

    .line 233
    throw p0
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;ILio/agora/base/internal/video/TimerSurfaceTextureHelper$1;)V
    .locals 0

    .line 234
    invoke-direct/range {p0 .. p5}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;-><init>(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;I)V

    return-void
.end method

.method public static synthetic access$100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->pendingListener:Lio/agora/base/internal/video/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->prevTimeMillis:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1002(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->prevTimeMillis:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$102(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Lio/agora/base/internal/video/VideoSink;)Lio/agora/base/internal/video/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->pendingListener:Lio/agora/base/internal/video/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/TextureBufferPool;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureBufferPool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->release()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasFrameRate:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1700(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isSmoothCapture()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1802(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureWidth:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1902(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureHeight:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2002(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->frameRotation:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Lio/agora/base/internal/video/VideoSink;)Lio/agora/base/internal/video/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->returnTextureFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->updateTexImage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->tryDeliverTextureFrame()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$600(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isQuitting:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isQuitting:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x4

    .line 35
    invoke-static {p0, v0, p1, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->create(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;I)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x4

    .line 34
    invoke-static {p0, p1, p2, v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->create(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;I)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;I)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
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
    new-instance v5, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {v5, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$1;

    .line 19
    .line 20
    move-object v2, p0

    .line 21
    move v3, p1

    .line 22
    move-object v4, p2

    .line 23
    move v6, p3

    .line 24
    invoke-direct/range {v1 .. v6}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$1;-><init>(Ljava/lang/String;ZLio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {v5, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 32
    .line 33
    return-object p0
.end method

.method private isSmoothCapture()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->smoothCapture:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->frameRate:I

    .line 6
    .line 7
    const/16 v0, 0xf

    .line 8
    .line 9
    if-gt p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method private release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

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
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureBufferPool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 22
    .line 23
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->anyTextureInUse()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isQuitting:Z

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lio/agora/base/internal/video/YuvConverter;->release()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureBufferPool:Lio/agora/base/internal/video/TextureBufferPool;

    .line 39
    .line 40
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->dispose()V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->oesTextureId:I

    .line 44
    .line 45
    filled-new-array {v0}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x1

    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->eglBase:Lio/agora/base/internal/video/EglBase;

    .line 60
    .line 61
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 80
    .line 81
    .line 82
    iput-boolean v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasFrameRate:Z

    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    const-string p0, "Unexpected release."

    .line 86
    .line 87
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    const-string p0, "Wrong thread."

    .line 92
    .line 93
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private returnTextureFrame()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

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

.method private tryDeliverTextureFrame()Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

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
    if-ne v1, v2, :cond_5

    .line 18
    .line 19
    iget-boolean v1, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isQuitting:Z

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-nez v1, :cond_4

    .line 23
    .line 24
    iget-object v1, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget-boolean v1, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v0, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 35
    .line 36
    instance-of v1, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$IVideoCapture;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    check-cast v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$IVideoCapture;

    .line 41
    .line 42
    const/16 v1, 0xa

    .line 43
    .line 44
    invoke-interface {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$IVideoCapture;->onFrameDropped(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    const-string v0, "TSurfaceTextureHelper"

    .line 48
    .line 49
    const-string v1, "frame Dropped texture in use. "

    .line 50
    .line 51
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return v3

    .line 55
    :cond_2
    iput-boolean v3, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 56
    .line 57
    iput-boolean v2, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasPendingTexture:Z

    .line 58
    .line 59
    invoke-direct {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->updateTexImage()V

    .line 60
    .line 61
    .line 62
    const/16 v1, 0x10

    .line 63
    .line 64
    new-array v1, v1, [F

    .line 65
    .line 66
    iget-object v2, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v4

    .line 75
    iget v8, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureWidth:I

    .line 76
    .line 77
    if-eqz v8, :cond_3

    .line 78
    .line 79
    iget v9, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->textureHeight:I

    .line 80
    .line 81
    if-eqz v9, :cond_3

    .line 82
    .line 83
    new-instance v6, Lio/agora/base/TextureBuffer;

    .line 84
    .line 85
    iget-object v7, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 86
    .line 87
    sget-object v10, Lio/agora/base/VideoFrame$TextureBuffer$Type;->OES:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 88
    .line 89
    iget v11, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->oesTextureId:I

    .line 90
    .line 91
    invoke-static {v1}, Lio/agora/base/internal/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 92
    .line 93
    .line 94
    move-result-object v12

    .line 95
    iget-object v13, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 96
    .line 97
    iget-object v14, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->yuvConverter:Lio/agora/base/internal/video/YuvConverter;

    .line 98
    .line 99
    new-instance v15, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$16;

    .line 100
    .line 101
    invoke-direct {v15, v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$16;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 102
    .line 103
    .line 104
    const/16 v16, 0x0

    .line 105
    .line 106
    invoke-direct/range {v6 .. v16}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;Z)V

    .line 107
    .line 108
    .line 109
    new-instance v1, Lio/agora/base/VideoFrame;

    .line 110
    .line 111
    iget v2, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->frameRotation:I

    .line 112
    .line 113
    invoke-direct {v1, v6, v2, v4, v5}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJ)V

    .line 114
    .line 115
    .line 116
    iget-object v0, v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 117
    .line 118
    invoke-interface {v0, v1}, Lio/agora/base/internal/video/VideoSink;->onFrame(Lio/agora/base/VideoFrame;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Lio/agora/base/VideoFrame;->release()V

    .line 122
    .line 123
    .line 124
    return v3

    .line 125
    :cond_3
    const-string v0, "Texture size has not been set."

    .line 126
    .line 127
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :goto_0
    const/4 v0, 0x0

    .line 131
    return v0

    .line 132
    :cond_4
    :goto_1
    return v2

    .line 133
    :cond_5
    const-string v0, "Wrong thread."

    .line 134
    .line 135
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0
.end method

.method private updateTexImage()V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    :try_start_1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

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
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, "TSurfaceTextureHelper"

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "failed to updateTexImage. "

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 1
    const-string v0, "TSurfaceTextureHelper"

    .line 2
    .line 3
    const-string v1, "dispose()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$15;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$15;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public executeSmoothCapture(I)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->stopScheduledService()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 10
    .line 11
    iget-object v2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledExecutorRunnable:Ljava/lang/Runnable;

    .line 12
    .line 13
    int-to-long v5, p1

    .line 14
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    const-wide/16 v3, 0x0

    .line 17
    .line 18
    invoke-interface/range {v1 .. v7}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOesTextureInUse()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isOesTextureInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public setFrameRate(I)V
    .locals 9

    .line 1
    if-lez p1, :cond_8

    .line 2
    .line 3
    iput p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->frameRate:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->hasFrameRate:Z

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "setFrameRate frameRate:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " smoothCapture: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->smoothCapture:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "TSurfaceTextureHelper"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->isSmoothCapture()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    add-int/lit8 v0, p1, 0x3

    .line 46
    .line 47
    int-to-double v3, v0

    .line 48
    int-to-double v5, p1

    .line 49
    const-wide v7, 0x3ff1126e978d4fdfL    # 1.067

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    mul-double/2addr v5, v7

    .line 55
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(DD)D

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    double-to-float v0, v3

    .line 60
    div-float/2addr v2, v0

    .line 61
    float-to-int v0, v2

    .line 62
    iput v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 63
    .line 64
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 65
    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    int-to-float v2, p1

    .line 69
    invoke-virtual {v0, v2}, Lio/agora/base/internal/video/VideoDecimator;->setTargetFramerate(F)I

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    int-to-float p1, p1

    .line 77
    invoke-virtual {v0, p1}, Lio/agora/base/internal/video/VideoDecimator;->setTargetFramerate(F)I

    .line 78
    .line 79
    .line 80
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v0, "scheduledRunnable notifyIntervalInMS:"

    .line 83
    .line 84
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v1, p1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->executeSmoothCapture(I)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    add-int/lit8 p1, p1, 0x3

    .line 106
    .line 107
    const/4 v0, 0x5

    .line 108
    if-lt p1, v0, :cond_3

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    move v0, p1

    .line 112
    :goto_0
    const/16 v1, 0xf

    .line 113
    .line 114
    if-lt p1, v1, :cond_4

    .line 115
    .line 116
    move v0, v1

    .line 117
    :cond_4
    const/16 v1, 0x1e

    .line 118
    .line 119
    if-lt p1, v1, :cond_5

    .line 120
    .line 121
    move v0, v1

    .line 122
    :cond_5
    int-to-float v0, v0

    .line 123
    div-float/2addr v2, v0

    .line 124
    float-to-int v1, v2

    .line 125
    iput v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 126
    .line 127
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 128
    .line 129
    if-eqz v1, :cond_6

    .line 130
    .line 131
    int-to-float p1, p1

    .line 132
    invoke-virtual {v1, p1}, Lio/agora/base/internal/video/VideoDecimator;->setTargetFramerate(F)I

    .line 133
    .line 134
    .line 135
    :cond_6
    iget-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 136
    .line 137
    if-eqz p1, :cond_7

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Lio/agora/base/internal/video/VideoDecimator;->setTargetFramerate(F)I

    .line 140
    .line 141
    .line 142
    :cond_7
    iget-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 143
    .line 144
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerRunnable:Ljava/lang/Runnable;

    .line 145
    .line 146
    iget p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 147
    .line 148
    int-to-long v1, p0

    .line 149
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_8
    const-string p0, "invalid frame rate"

    .line 154
    .line 155
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public setFrameRotation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$13;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$13;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)V

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "setTextureSize textureWidth: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " textureHeight: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "TSurfaceTextureHelper"

    .line 28
    .line 29
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 38
    .line 39
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1, p2}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const-string p0, "Texture height must be positive, but was "

    .line 49
    .line 50
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const-string p0, "Texture width must be positive, but was "

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public startListening(Lio/agora/base/internal/video/VideoSink;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->listener:Lio/agora/base/internal/video/VideoSink;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->pendingListener:Lio/agora/base/internal/video/VideoSink;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->notifyIntervalInMS:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->pendingListener:Lio/agora/base/internal/video/VideoSink;

    .line 14
    .line 15
    iget-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "frame rate not set"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-string p0, "SurfaceTextureHelper listener has already been set."

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public stopListening()V
    .locals 2

    .line 1
    const-string v0, "TSurfaceTextureHelper"

    .line 2
    .line 3
    const-string v1, "stopListening()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->stopScheduledService()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->systemGenerateRunnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 19
    .line 20
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->supplementRunnable:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->proxyHandler:Landroid/os/Handler;

    .line 26
    .line 27
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerRunnable:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 33
    .line 34
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->videoDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 40
    .line 41
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->reset()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->auxiliaryDecimator:Lio/agora/base/internal/video/VideoDecimator;

    .line 45
    .line 46
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->reset()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 50
    .line 51
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$11;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$11;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public stopScheduledService()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledService:Ljava/util/concurrent/ScheduledExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    iput-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->scheduledService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 14
    .line 15
    const-string p0, "TSurfaceTextureHelper"

    .line 16
    .line 17
    const-string v0, "shutdownNow error."

    .line 18
    .line 19
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public textureCopy(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 2

    .line 1
    invoke-interface {p1}, Lio/agora/base/VideoFrame$TextureBuffer;->getTextureId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->oesTextureId:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$10;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$10;-><init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Lio/agora/base/VideoFrame$TextureBuffer;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lio/agora/base/VideoFrame$TextureBuffer;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string p0, "textureCopy called with unexpected textureId"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public textureToYuv(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/VideoFrame$I420Buffer;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-interface {p1}, Lio/agora/base/VideoFrame$Buffer;->toI420()Lio/agora/base/VideoFrame$I420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
