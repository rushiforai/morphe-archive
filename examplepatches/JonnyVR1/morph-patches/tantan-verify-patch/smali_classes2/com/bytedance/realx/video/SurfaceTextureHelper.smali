.class public Lcom/bytedance/realx/video/SurfaceTextureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceTextureHelper"

.field private static TEX_MATRIX:[F


# instance fields
.field private capture2DTexture:Z

.field private final eglBase:Lcom/bytedance/realx/video/EglBase;

.field private enableOutsideControlTextureMemory:Z

.field private final frameBufferId:I

.field private frameRotation:I

.field private frameSyncObject:Ljava/lang/Object;

.field private final glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

.field private final handler:Landroid/os/Handler;

.field private hasPendingTexture:Z

.field private isAvaliable:Z

.field private isQuitting:Z

.field private volatile isTextureInUse:Z

.field private lastBindTimestamp:J

.field private lastDeliverTime:J

.field private listener:Lcom/bytedance/realx/video/VideoSink;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private maxDeliverTimerInternal:I

.field private oesTextureId:I

.field private pendingListener:Lcom/bytedance/realx/video/VideoSink;
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

.field private useAgfx:Z

.field private videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;


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
    sput-object v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 6
    .line 7
    return-void
.end method

.method private constructor <init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZ)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 18
    .line 19
    new-instance v3, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z

    .line 27
    .line 28
    new-instance v3, Lcom/bytedance/realx/video/SurfaceTextureHelper$2;

    .line 29
    .line 30
    invoke-direct {v3, p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper$2;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 31
    .line 32
    .line 33
    iput-object v3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 34
    .line 35
    iput-wide v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastDeliverTime:J

    .line 36
    .line 37
    const/4 v1, -0x1

    .line 38
    iput v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 39
    .line 40
    new-instance v1, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->timedDeliverRunnable:Ljava/lang/Runnable;

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const/4 v3, 0x0

    .line 60
    if-ne v1, v2, :cond_5

    .line 61
    .line 62
    if-nez p5, :cond_4

    .line 63
    .line 64
    iput-object p2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 65
    .line 66
    if-eqz p3, :cond_0

    .line 67
    .line 68
    new-instance p3, Lcom/bytedance/realx/video/TimestampAligner;

    .line 69
    .line 70
    invoke-direct {p3}, Lcom/bytedance/realx/video/TimestampAligner;-><init>()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move-object p3, v3

    .line 75
    :goto_0
    iput-object p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 76
    .line 77
    iput-boolean p4, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 78
    .line 79
    iput-boolean p5, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 80
    .line 81
    if-nez p5, :cond_1

    .line 82
    .line 83
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_PIXEL_BUFFER:Lcom/bytedance/realx/video/EglBase$Config;

    .line 88
    .line 89
    invoke-static {p3, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-static {p1, p3}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 98
    .line 99
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    invoke-interface {p3}, Lcom/bytedance/realx/video/EglBase$Context;->getEgl14Context()Landroid/opengl/EGLContext;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-static {p3}, Lcom/bytedance/realx/video/RXVideoFrameHelper;->createRXVideoFrameHelperOpenGL(Landroid/opengl/EGLContext;)Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    iput-object p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 112
    .line 113
    :try_start_0
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->createDummyPbufferSurface()V

    .line 114
    .line 115
    .line 116
    invoke-interface {p1}, Lcom/bytedance/realx/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :catch_0
    move-exception p1

    .line 121
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 122
    .line 123
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 131
    .line 132
    .line 133
    throw p1

    .line 134
    :cond_1
    iput-object v3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 135
    .line 136
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->bind()V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1}, Lcom/bytedance/realx/video/RXVideoFrameHelper;->createRXVideoFrameHelperOpenGL(Landroid/opengl/EGLContext;)Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 148
    .line 149
    :goto_1
    if-eqz p4, :cond_2

    .line 150
    .line 151
    new-instance p1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 152
    .line 153
    invoke-direct {p1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 157
    .line 158
    const/4 p1, 0x1

    .line 159
    new-array p3, p1, [I

    .line 160
    .line 161
    invoke-static {p1, p3, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 162
    .line 163
    .line 164
    aget p1, p3, v0

    .line 165
    .line 166
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameBufferId:I

    .line 167
    .line 168
    sget-object p1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 169
    .line 170
    invoke-static {p1, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 171
    .line 172
    .line 173
    const/16 p1, 0xde1

    .line 174
    .line 175
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_2
    iput-object v3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 183
    .line 184
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameBufferId:I

    .line 185
    .line 186
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 187
    .line 188
    :goto_2
    const p1, 0x8d65

    .line 189
    .line 190
    .line 191
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 196
    .line 197
    new-instance p1, Landroid/graphics/SurfaceTexture;

    .line 198
    .line 199
    iget p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 200
    .line 201
    invoke-direct {p1, p3}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 202
    .line 203
    .line 204
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 205
    .line 206
    new-instance p3, Ll/yah0;

    .line 207
    .line 208
    invoke-direct {p3, p0}, Ll/yah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 209
    .line 210
    .line 211
    invoke-static {p1, p3, p2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 212
    .line 213
    .line 214
    if-eqz p5, :cond_3

    .line 215
    .line 216
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    .line 217
    .line 218
    .line 219
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 220
    .line 221
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->unbind()V

    .line 222
    .line 223
    .line 224
    :cond_3
    return-void

    .line 225
    :cond_4
    const-string p0, "non agfx package not support SurfaceTextureHelper with AGFX"

    .line 226
    .line 227
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    throw v3

    .line 231
    :cond_5
    const-string p0, "SurfaceTextureHelper must be created on the handler thread"

    .line 232
    .line 233
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    throw v3
.end method

.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZLcom/bytedance/realx/video/SurfaceTextureHelper$1;)V
    .locals 0

    .line 237
    invoke-direct/range {p0 .. p5}, Lcom/bytedance/realx/video/SurfaceTextureHelper;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZ)V

    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->pendingListener:Lcom/bytedance/realx/video/VideoSink;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Lcom/bytedance/realx/video/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->pendingListener:Lcom/bytedance/realx/video/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/bytedance/realx/video/SurfaceTextureHelper;Lcom/bytedance/realx/video/VideoSink;)Lcom/bytedance/realx/video/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->pendingListener:Lcom/bytedance/realx/video/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Lcom/bytedance/realx/video/VideoSink;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/bytedance/realx/video/SurfaceTextureHelper;Lcom/bytedance/realx/video/VideoSink;)Lcom/bytedance/realx/video/VideoSink;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/bytedance/realx/video/SurfaceTextureHelper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/bytedance/realx/video/SurfaceTextureHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/bytedance/realx/video/SurfaceTextureHelper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastDeliverTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$700(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameRotation:I

    .line 2
    .line 3
    return-void
.end method

.method private bind()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->getInstance()Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->bind()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->returnTextureFrame()V

    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-static {p0, p1, v0, v0, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZZ)Lcom/bytedance/realx/video/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Z)Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-static {p0, p1, p2, v0, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZZ)Lcom/bytedance/realx/video/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZZ)Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 8

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
    new-instance v1, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;

    .line 19
    .line 20
    move-object v7, p0

    .line 21
    move-object v2, p1

    .line 22
    move v4, p2

    .line 23
    move v5, p3

    .line 24
    move v6, p4

    .line 25
    invoke-direct/range {v1 .. v7}, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZLjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 33
    .line 34
    return-object p0
.end method

.method public static createWithAGFX(Ljava/lang/String;)Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->createWithAGFX(Ljava/lang/String;Z)Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static createWithAGFX(Ljava/lang/String;Z)Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 0

    .line 7
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic d(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    .line 9
    .line 10
    .line 11
    iput v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->unbind()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-boolean v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isQuitting:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->release()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public static synthetic e(Lcom/bytedance/realx/video/SurfaceTextureHelper;Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    monitor-exit p1

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0

    .line 21
    :cond_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->tryDeliverTextureFrame()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic f(Lcom/bytedance/realx/video/SurfaceTextureHelper;II)V
    .locals 11

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->bind()V

    .line 10
    .line 11
    .line 12
    const v0, 0x84c0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 19
    .line 20
    const/16 v1, 0xde1

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 23
    .line 24
    .line 25
    const/16 v9, 0x1401

    .line 26
    .line 27
    const/4 v10, 0x0

    .line 28
    const/16 v2, 0xde1

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    const/16 v4, 0x1908

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    const/16 v8, 0x1908

    .line 35
    .line 36
    move v5, p1

    .line 37
    move v6, p2

    .line 38
    invoke-static/range {v2 .. v10}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->unbind()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isQuitting:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

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
    if-ne v0, v1, :cond_6

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 18
    .line 19
    if-nez v0, :cond_5

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isQuitting:Z

    .line 22
    .line 23
    if-eqz v0, :cond_5

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->bind()V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    const/4 v2, 0x0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    filled-new-array {v0}, [I

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 39
    .line 40
    .line 41
    iput v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 42
    .line 43
    :cond_0
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 48
    .line 49
    filled-new-array {v0}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameBufferId:I

    .line 57
    .line 58
    filled-new-array {v0}, [I

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlGenericDrawer;->release()V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->unbind()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    invoke-interface {v0}, Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;->release()V

    .line 90
    .line 91
    .line 92
    const/4 v0, 0x0

    .line 93
    iput-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 94
    .line 95
    :cond_3
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 105
    .line 106
    if-eqz p0, :cond_4

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TimestampAligner;->dispose()V

    .line 109
    .line 110
    .line 111
    :cond_4
    return-void

    .line 112
    :cond_5
    const-string p0, "Unexpected release."

    .line 113
    .line 114
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    const-string p0, "Wrong thread."

    .line 119
    .line 120
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private returnTextureFrame()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/pah0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

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
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-ne v0, v2, :cond_7

    .line 18
    .line 19
    iget-boolean v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isQuitting:Z

    .line 20
    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    iget-boolean v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 24
    .line 25
    if-eqz v0, :cond_6

    .line 26
    .line 27
    iget-boolean v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 28
    .line 29
    if-nez v0, :cond_6

    .line 30
    .line 31
    iget-object v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_0
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 38
    .line 39
    const-string v2, "SurfaceTextureHelper"

    .line 40
    .line 41
    if-eqz v0, :cond_5

    .line 42
    .line 43
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    goto/16 :goto_2

    .line 48
    .line 49
    :cond_1
    iget-boolean v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-direct {v1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->bind()V

    .line 54
    .line 55
    .line 56
    const v0, 0x8d65

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->generateTexture(I)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 64
    .line 65
    iget-object v3, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Landroid/graphics/SurfaceTexture;->attachToGLContext(I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    const/4 v3, 0x1

    .line 71
    iput-boolean v3, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    iput-boolean v4, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 75
    .line 76
    :try_start_0
    invoke-virtual {v1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    const/16 v0, 0x10

    .line 80
    .line 81
    new-array v11, v0, [F

    .line 82
    .line 83
    iget-object v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 84
    .line 85
    invoke-virtual {v0, v11}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 86
    .line 87
    .line 88
    iget-object v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    iget-object v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->timestampAligner:Lcom/bytedance/realx/video/TimestampAligner;

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-virtual {v0, v2, v3}, Lcom/bytedance/realx/video/TimestampAligner;->translateTimestamp(J)J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    iput-wide v5, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastDeliverTime:J

    .line 107
    .line 108
    iget-boolean v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 109
    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameBufferId:I

    .line 113
    .line 114
    const v5, 0x8d40

    .line 115
    .line 116
    .line 117
    invoke-static {v5, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 118
    .line 119
    .line 120
    const/16 v0, 0xde1

    .line 121
    .line 122
    iget v6, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 123
    .line 124
    const v7, 0x8ce0

    .line 125
    .line 126
    .line 127
    invoke-static {v5, v7, v0, v6, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 128
    .line 129
    .line 130
    iget-object v12, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 131
    .line 132
    iget v13, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 133
    .line 134
    sget-object v14, Lcom/bytedance/realx/video/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 135
    .line 136
    iget v15, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 137
    .line 138
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 139
    .line 140
    const/16 v17, 0x0

    .line 141
    .line 142
    const/16 v18, 0x0

    .line 143
    .line 144
    move/from16 v19, v15

    .line 145
    .line 146
    move/from16 v20, v0

    .line 147
    .line 148
    move/from16 v16, v0

    .line 149
    .line 150
    invoke-virtual/range {v12 .. v20}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIII)V

    .line 151
    .line 152
    .line 153
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 154
    .line 155
    .line 156
    iget v5, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 157
    .line 158
    iget v6, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 159
    .line 160
    iget v9, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 161
    .line 162
    sget-object v10, Lcom/bytedance/realx/video/RXPixelFormat;->kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 163
    .line 164
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 165
    .line 166
    .line 167
    move-result-object v12

    .line 168
    sget-object v13, Lcom/bytedance/realx/video/RXVideoScaleFilter;->kOpenGLOrigin:Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 169
    .line 170
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameRotation:I

    .line 171
    .line 172
    invoke-static {v0}, Lcom/bytedance/realx/video/RXVideoRotation;->fromId(I)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 173
    .line 174
    .line 175
    move-result-object v14

    .line 176
    new-instance v15, Ll/mah0;

    .line 177
    .line 178
    invoke-direct {v15, v1}, Ll/mah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 179
    .line 180
    .line 181
    move v7, v5

    .line 182
    move v8, v6

    .line 183
    invoke-static/range {v5 .. v15}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->createRXOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    :goto_0
    move-object v5, v0

    .line 188
    goto :goto_1

    .line 189
    :cond_4
    iget v5, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 190
    .line 191
    iget v6, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 192
    .line 193
    iget v9, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 194
    .line 195
    sget-object v10, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 196
    .line 197
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 198
    .line 199
    .line 200
    move-result-object v12

    .line 201
    sget-object v13, Lcom/bytedance/realx/video/RXVideoScaleFilter;->kOpenGLOrigin:Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 202
    .line 203
    iget v0, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameRotation:I

    .line 204
    .line 205
    invoke-static {v0}, Lcom/bytedance/realx/video/RXVideoRotation;->fromId(I)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 206
    .line 207
    .line 208
    move-result-object v14

    .line 209
    new-instance v15, Ll/mah0;

    .line 210
    .line 211
    invoke-direct {v15, v1}, Ll/mah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 212
    .line 213
    .line 214
    move v7, v5

    .line 215
    move v8, v6

    .line 216
    invoke-static/range {v5 .. v15}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->createRXOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    goto :goto_0

    .line 221
    :goto_1
    iget-object v6, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 222
    .line 223
    const/4 v9, 0x0

    .line 224
    sget-object v10, Lcom/bytedance/realx/video/RXColorSpace;->kYCbCrBT601LimitedRange:Lcom/bytedance/realx/video/RXColorSpace;

    .line 225
    .line 226
    move-wide v7, v2

    .line 227
    invoke-static/range {v5 .. v10}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v1, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 232
    .line 233
    invoke-interface {v1, v0}, Lcom/bytedance/realx/video/VideoSink;->onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v5}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 237
    .line 238
    .line 239
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :catch_0
    move-exception v0

    .line 244
    const-string v5, " updateTexImage failure"

    .line 245
    .line 246
    invoke-static {v2, v5, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 247
    .line 248
    .line 249
    iput-boolean v4, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 250
    .line 251
    iput-boolean v3, v1, Lcom/bytedance/realx/video/SurfaceTextureHelper;->hasPendingTexture:Z

    .line 252
    .line 253
    return-void

    .line 254
    :cond_5
    :goto_2
    const-string v0, "Texture size has not been set."

    .line 255
    .line 256
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    :cond_6
    :goto_3
    return-void

    .line 260
    :cond_7
    const-string v0, "Wrong thread."

    .line 261
    .line 262
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method private unbind()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->useAgfx:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->getInstance()Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->unbind()V

    .line 10
    .line 11
    .line 12
    iget-wide v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-wide v4, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 26
    .line 27
    sub-long v4, v0, v4

    .line 28
    .line 29
    const-wide/16 v6, 0x3e8

    .line 30
    .line 31
    cmp-long v4, v4, v6

    .line 32
    .line 33
    if-lez v4, :cond_1

    .line 34
    .line 35
    new-instance v4, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v5, "AGFX bind time: "

    .line 38
    .line 39
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-wide v5, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 43
    .line 44
    sub-long/2addr v0, v5

    .line 45
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "SurfaceTextureHelper"

    .line 53
    .line 54
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iput-wide v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->lastBindTimestamp:J

    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
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
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Ll/sah0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/sah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

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
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTexMatrix()[F
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public isAvaliable()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public isTextureInUse()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isTextureInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public onFrame(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-lez v2, :cond_2

    .line 9
    .line 10
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 11
    .line 12
    if-gtz v2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    iget-object v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 19
    .line 20
    .line 21
    move-result-wide v6

    .line 22
    const/16 v2, 0x10

    .line 23
    .line 24
    new-array v14, v2, [F

    .line 25
    .line 26
    iget-boolean v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->capture2DTexture:Z

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameBufferId:I

    .line 31
    .line 32
    const v4, 0x8d40

    .line 33
    .line 34
    .line 35
    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 36
    .line 37
    .line 38
    const/16 v2, 0xde1

    .line 39
    .line 40
    iget v5, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 41
    .line 42
    const v8, 0x8ce0

    .line 43
    .line 44
    .line 45
    invoke-static {v4, v8, v2, v5, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 46
    .line 47
    .line 48
    iget-object v15, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->glRectDrawer:Lcom/bytedance/realx/video/GlRectDrawer;

    .line 49
    .line 50
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 51
    .line 52
    sget-object v17, Lcom/bytedance/realx/video/SurfaceTextureHelper;->TEX_MATRIX:[F

    .line 53
    .line 54
    iget v5, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 55
    .line 56
    iget v8, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 57
    .line 58
    const/16 v20, 0x0

    .line 59
    .line 60
    const/16 v21, 0x0

    .line 61
    .line 62
    move/from16 v22, v5

    .line 63
    .line 64
    move/from16 v23, v8

    .line 65
    .line 66
    move/from16 v16, v2

    .line 67
    .line 68
    move/from16 v18, v5

    .line 69
    .line 70
    move/from16 v19, v8

    .line 71
    .line 72
    invoke-virtual/range {v15 .. v23}, Lcom/bytedance/realx/video/GlGenericDrawer;->drawOes(I[FIIIIII)V

    .line 73
    .line 74
    .line 75
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 76
    .line 77
    .line 78
    iget v8, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 79
    .line 80
    iget v9, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 81
    .line 82
    iget v12, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->twoDTextureId:I

    .line 83
    .line 84
    sget-object v13, Lcom/bytedance/realx/video/RXPixelFormat;->kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 85
    .line 86
    iget-object v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 87
    .line 88
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase$Context;->getEgl14Context()Landroid/opengl/EGLContext;

    .line 93
    .line 94
    .line 95
    move-result-object v15

    .line 96
    sget-object v16, Lcom/bytedance/realx/video/RXVideoScaleFilter;->kOpenGLOrigin:Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 97
    .line 98
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameRotation:I

    .line 99
    .line 100
    invoke-static {v2}, Lcom/bytedance/realx/video/RXVideoRotation;->fromId(I)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 101
    .line 102
    .line 103
    move-result-object v17

    .line 104
    new-instance v2, Ll/mah0;

    .line 105
    .line 106
    invoke-direct {v2, v0}, Ll/mah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 107
    .line 108
    .line 109
    move v10, v8

    .line 110
    move v11, v9

    .line 111
    move-object/from16 v18, v2

    .line 112
    .line 113
    invoke-static/range {v8 .. v18}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->createRXOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    :goto_0
    move-object v4, v2

    .line 118
    goto :goto_1

    .line 119
    :cond_1
    iget v8, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 120
    .line 121
    iget v9, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 122
    .line 123
    iget v12, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->oesTextureId:I

    .line 124
    .line 125
    sget-object v13, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 126
    .line 127
    iget-object v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->eglBase:Lcom/bytedance/realx/video/EglBase;

    .line 128
    .line 129
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v2}, Lcom/bytedance/realx/video/EglBase$Context;->getEgl14Context()Landroid/opengl/EGLContext;

    .line 134
    .line 135
    .line 136
    move-result-object v15

    .line 137
    sget-object v16, Lcom/bytedance/realx/video/RXVideoScaleFilter;->kOpenGLOrigin:Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 138
    .line 139
    iget v2, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameRotation:I

    .line 140
    .line 141
    invoke-static {v2}, Lcom/bytedance/realx/video/RXVideoRotation;->fromId(I)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 142
    .line 143
    .line 144
    move-result-object v17

    .line 145
    new-instance v2, Ll/mah0;

    .line 146
    .line 147
    invoke-direct {v2, v0}, Ll/mah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 148
    .line 149
    .line 150
    move v10, v8

    .line 151
    move v11, v9

    .line 152
    move-object/from16 v18, v2

    .line 153
    .line 154
    invoke-static/range {v8 .. v18}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->createRXOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    goto :goto_0

    .line 159
    :goto_1
    invoke-virtual {v1, v0}, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->setSurfaceTextureHelper(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->setRenderHelper(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V

    .line 163
    .line 164
    .line 165
    iget-object v5, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->videoFrameHelperOpenGL:Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;

    .line 166
    .line 167
    const/4 v8, 0x0

    .line 168
    sget-object v9, Lcom/bytedance/realx/video/RXColorSpace;->kYCbCrBT601LimitedRange:Lcom/bytedance/realx/video/RXColorSpace;

    .line 169
    .line 170
    invoke-static/range {v4 .. v9}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;Lcom/bytedance/realx/video/RXVideoFrameHelperInterface;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iget-object v0, v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 175
    .line 176
    invoke-interface {v0, v1}, Lcom/bytedance/realx/video/VideoSink;->onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v4}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 180
    .line 181
    .line 182
    invoke-interface {v1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_2
    :goto_2
    invoke-virtual {v1, v3}, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->runTask(Z)I

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public setEnableOutsideControlTextureMemory(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRotation(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/jah0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/jah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;I)V

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
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->maxDeliverTimerInternal:I

    .line 13
    .line 14
    return-void
.end method

.method public setTextureSize(II)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p1, p2, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setTextureSize(IIZ)V

    return-void
.end method

.method public setTextureSize(IIZ)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureWidth:I

    .line 4
    .line 5
    if-ne p1, p3, :cond_0

    .line 6
    .line 7
    iget p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->textureHeight:I

    .line 8
    .line 9
    if-ne p2, p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-lez p1, :cond_2

    .line 13
    .line 14
    if-lez p2, :cond_1

    .line 15
    .line 16
    iget-object p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    invoke-virtual {p3, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v0, Ll/vah0;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p2}, Ll/vah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string p0, "Texture height must be positive, but was "

    .line 33
    .line 34
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const-string p0, "Texture width must be positive, but was "

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public startListening(Lcom/bytedance/realx/video/VideoSink;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->listener:Lcom/bytedance/realx/video/VideoSink;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->pendingListener:Lcom/bytedance/realx/video/VideoSink;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->pendingListener:Lcom/bytedance/realx/video/VideoSink;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->enableOutsideControlTextureMemory:Z

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->timedDeliverRunnable:Ljava/lang/Runnable;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    const-string p0, "SurfaceTextureHelper listener has already been set."

    .line 31
    .line 32
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
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
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setListenerRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    new-instance v1, Ll/gah0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/gah0;-><init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public updateTexImage()V
    .locals 2

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglBase;->lock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v1

    .line 13
    const/4 v0, 0x0

    .line 14
    :try_start_1
    iput-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z

    .line 15
    .line 16
    monitor-exit v1

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0

    .line 21
    :catchall_1
    move-exception p0

    .line 22
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 23
    throw p0
.end method

.method public updateTexImageAndWait(I)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->frameSyncObject:Ljava/lang/Object;

    .line 10
    .line 11
    int-to-long v3, p1

    .line 12
    invoke-virtual {v1, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    :try_start_2
    monitor-exit v0

    .line 20
    return v2

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    const-string p1, "SurfaceTextureHelper"

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v3, "updateTexImage exception: "

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    monitor-exit v0

    .line 51
    return v2

    .line 52
    :cond_1
    sget-object p1, Lcom/bytedance/realx/video/EglBase;->lock:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    :try_start_3
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 58
    .line 59
    .line 60
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 61
    :try_start_4
    iput-boolean v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable:Z

    .line 62
    .line 63
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 64
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :catchall_1
    move-exception p0

    .line 67
    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 68
    :try_start_6
    throw p0

    .line 69
    :goto_0
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 70
    throw p0
.end method
