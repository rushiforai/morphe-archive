.class public Ltv/danmaku/ijk/media/streamer/MomoSurface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;,
        Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;,
        Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;
    }
.end annotation


# static fields
.field public static t0:I = 0x14


# instance fields
.field private A:Landroid/view/Surface;

.field private B:Landroid/view/Surface;

.field private C:Landroid/view/Surface;

.field private D:Ll/jt2;

.field private E:Ll/suf;

.field private F:Ljava/lang/Object;

.field private G:Ljava/lang/Object;

.field private volatile H:Z

.field private I:Ljava/lang/Object;

.field private J:Ljava/lang/Object;

.field private K:Ltv/danmaku/ijk/media/streamer/TextureRender;

.field private L:I

.field private M:[I

.field private N:[I

.field private O:I

.field private P:I

.field private Q:I

.field private R:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private S:Landroid/graphics/Bitmap;

.field private T:J

.field private volatile U:I

.field private volatile V:I

.field private W:[I

.field private volatile X:Z

.field private volatile Y:Z

.field private volatile Z:Z

.field private final a:Ljava/util/concurrent/locks/Lock;

.field private volatile a0:Z

.field public b:I

.field private volatile b0:Z

.field public c:I

.field private volatile c0:Z

.field public d:Z

.field private volatile d0:Z

.field e:J

.field private volatile e0:Z

.field f:J

.field private volatile f0:Z

.field g:J

.field private volatile g0:I

.field h:J

.field private volatile h0:Z

.field i:[I

.field private i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

.field j:[I

.field private volatile j0:Z

.field k:[I

.field private k0:Ljava/nio/ByteBuffer;

.field l:[I

.field private l0:Ljava/nio/ByteBuffer;

.field m:[Ljavax/microedition/khronos/egl/EGLConfig;

.field private m0:Ljava/nio/ByteBuffer;

.field n:[I

.field private n0:Ljava/nio/ByteBuffer;

.field o:Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;

.field private o0:Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;

.field private p:Ljavax/microedition/khronos/egl/EGL10;

.field private p0:Landroid/graphics/SurfaceTexture;

.field private q:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private q0:I

.field private r:Ljavax/microedition/khronos/egl/EGLContext;

.field private r0:I

.field private s:Ljavax/microedition/khronos/egl/EGLSurface;

.field private s0:Landroid/graphics/Bitmap;

.field private t:Ljavax/microedition/khronos/egl/EGLSurface;

.field private u:Ll/dah0;

.field private v:Ll/dah0;

.field private volatile w:Z

.field private x:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private y:Ljava/lang/Object;

.field private z:Landroid/graphics/SurfaceTexture;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(I)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a:Ljava/util/concurrent/locks/Lock;

    .line 10
    .line 11
    const/16 v0, 0x14

    .line 12
    .line 13
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 14
    .line 15
    const/16 v1, 0x1e

    .line 16
    .line 17
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d:Z

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 25
    .line 26
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 27
    .line 28
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 29
    .line 30
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 31
    .line 32
    const/16 v4, 0x3057

    .line 33
    .line 34
    const/16 v5, 0xc0

    .line 35
    .line 36
    const/16 v6, 0x3056

    .line 37
    .line 38
    const/16 v7, 0x140

    .line 39
    .line 40
    const/16 v8, 0x3038

    .line 41
    .line 42
    filled-new-array {v4, v5, v6, v7, v8}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i:[I

    .line 47
    .line 48
    const/16 v4, 0xb

    .line 49
    .line 50
    new-array v5, v4, [I

    .line 51
    .line 52
    fill-array-data v5, :array_0

    .line 53
    .line 54
    .line 55
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j:[I

    .line 56
    .line 57
    new-array v4, v4, [I

    .line 58
    .line 59
    fill-array-data v4, :array_1

    .line 60
    .line 61
    .line 62
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k:[I

    .line 63
    .line 64
    const/16 v4, 0x3098

    .line 65
    .line 66
    const/4 v5, 0x2

    .line 67
    filled-new-array {v4, v5, v8}, [I

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l:[I

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 75
    .line 76
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 77
    .line 78
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;

    .line 79
    .line 80
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 81
    .line 82
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 83
    .line 84
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 85
    .line 86
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 87
    .line 88
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 89
    .line 90
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 91
    .line 92
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 93
    .line 94
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 98
    .line 99
    new-instance v6, Ljava/util/LinkedList;

    .line 100
    .line 101
    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 105
    .line 106
    new-instance v6, Ljava/lang/Object;

    .line 107
    .line 108
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y:Ljava/lang/Object;

    .line 112
    .line 113
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 114
    .line 115
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;

    .line 116
    .line 117
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 118
    .line 119
    new-instance v6, Ljava/lang/Object;

    .line 120
    .line 121
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 122
    .line 123
    .line 124
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 125
    .line 126
    new-instance v6, Ljava/lang/Object;

    .line 127
    .line 128
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 132
    .line 133
    new-instance v6, Ljava/lang/Object;

    .line 134
    .line 135
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J:Ljava/lang/Object;

    .line 139
    .line 140
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 141
    .line 142
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L:I

    .line 143
    .line 144
    new-array v6, v1, [I

    .line 145
    .line 146
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M:[I

    .line 147
    .line 148
    new-array v6, v1, [I

    .line 149
    .line 150
    iput-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N:[I

    .line 151
    .line 152
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 153
    .line 154
    const/16 v6, 0x160

    .line 155
    .line 156
    iput v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P:I

    .line 157
    .line 158
    const/16 v6, 0x280

    .line 159
    .line 160
    iput v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q:I

    .line 161
    .line 162
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S:Landroid/graphics/Bitmap;

    .line 163
    .line 164
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->T:J

    .line 165
    .line 166
    new-array v2, v1, [I

    .line 167
    .line 168
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W:[I

    .line 169
    .line 170
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 171
    .line 172
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y:Z

    .line 173
    .line 174
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z:Z

    .line 175
    .line 176
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a0:Z

    .line 177
    .line 178
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b0:Z

    .line 179
    .line 180
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c0:Z

    .line 181
    .line 182
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0:Z

    .line 183
    .line 184
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0:Z

    .line 185
    .line 186
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f0:Z

    .line 187
    .line 188
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 189
    .line 190
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 191
    .line 192
    new-instance v0, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 193
    .line 194
    const-string v1, "ijkStrRender"

    .line 195
    .line 196
    invoke-direct {v0, p0, p0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;-><init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 200
    .line 201
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j0:Z

    .line 202
    .line 203
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o0:Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;

    .line 204
    .line 205
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0:Landroid/graphics/SurfaceTexture;

    .line 206
    .line 207
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0:I

    .line 208
    .line 209
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I

    .line 210
    .line 211
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 212
    .line 213
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J:Ljava/lang/Object;

    .line 214
    .line 215
    monitor-enter v0

    .line 216
    :try_start_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 217
    .line 218
    :try_start_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 219
    .line 220
    if-eqz p1, :cond_0

    .line 221
    .line 222
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 223
    .line 224
    .line 225
    goto :goto_0

    .line 226
    :catchall_0
    move-exception p0

    .line 227
    goto :goto_1

    .line 228
    :cond_0
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J:Ljava/lang/Object;

    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 231
    .line 232
    .line 233
    goto :goto_2

    .line 234
    :goto_1
    :try_start_2
    throw p0

    .line 235
    :catchall_1
    move-exception p0

    .line 236
    goto :goto_3

    .line 237
    :catch_0
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 238
    iput-boolean v5, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 239
    .line 240
    return-void

    .line 241
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 242
    throw p0

    .line 243
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3033
        0x1
        0x3040
        0x4
        0x3038
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    :array_1
    .array-data 4
        0x3022
        0x8
        0x3023
        0x8
        0x3024
        0x8
        0x3033
        0x4
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method public static synthetic A(Ltv/danmaku/ijk/media/streamer/MomoSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 2
    .line 3
    return p1
.end method

.method private A0(Ll/oxd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->offerLast(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :catch_0
    move-exception p0

    .line 13
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p0
.end method

.method public static synthetic B(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic C(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j0:Z

    .line 2
    .line 3
    return p0
.end method

.method private D0()V
    .locals 2

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "removeAttachedMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dah0;->d()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0:Z

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public static synthetic E(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ll/jt2;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ll/jt2;)Ll/jt2;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 2
    .line 3
    return-object p1
.end method

.method private F0()V
    .locals 2

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "removeMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dah0;->d()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c0:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public static synthetic G(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic I(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method private J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->B(Ll/jt2;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic K(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic N(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic S(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 3
    .line 4
    invoke-direct {p0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j0(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z0()V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y0()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 22
    .line 23
    :goto_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a1()V

    .line 24
    .line 25
    .line 26
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y:Z

    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    const-string v1, "MomoSurface"

    .line 30
    .line 31
    const-string v2, "activiteSurface_l eglSetup exception"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O0(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private W(Landroid/view/Surface;)V
    .locals 5

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addAttachedMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v1, Ll/dah0;

    .line 14
    .line 15
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x2

    .line 19
    invoke-direct {v1, p1, v4, v2, v3}, Ll/dah0;-><init>(Ljava/lang/Object;ILjavax/microedition/khronos/egl/EGLContext;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b0:Z

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ll/oxd0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->A0(Ll/oxd0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a0(Landroid/view/Surface;)V
    .locals 5

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface_l"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dah0;->d()V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    :goto_0
    new-instance v1, Ll/dah0;

    .line 27
    .line 28
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    invoke-direct {v1, p1, v4, v3, v2}, Ll/dah0;-><init>(Ljava/lang/Object;ILjavax/microedition/khronos/egl/EGLContext;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const/4 p1, 0x1

    .line 38
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 39
    .line 40
    :goto_1
    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a0:Z

    .line 42
    .line 43
    monitor-exit v0

    .line 44
    return-void

    .line 45
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p0
.end method

.method private a1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 6
    .line 7
    new-instance v1, Ll/qv40;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->R:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 13
    .line 14
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/TextureRender;-><init>(Ll/jt2;Lcom/immomo/mediacore/strinf/VideoQuality;I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 20
    .line 21
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->N()V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "textureID="

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 32
    .line 33
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->v()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "MomoSurface"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 50
    .line 51
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->t()Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z:Landroid/graphics/SurfaceTexture;

    .line 56
    .line 57
    new-instance v0, Landroid/view/Surface;

    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z:Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->A:Landroid/view/Surface;
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    return-void

    .line 67
    :catch_0
    const/4 v0, -0x1

    .line 68
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->J:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/MomoSurface;Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a0(Landroid/view/Surface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0(Ljava/lang/String;)V
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x3000

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ": EGL error: 0x"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "MomoSurface"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O0(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->C:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method private g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ll/oxd0;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/oxd0;->f()V

    .line 23
    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_3

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_2
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw p0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/MomoSurface;Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W(Landroid/view/Surface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c0:Z

    .line 2
    .line 3
    return p0
.end method

.method private i0()V
    .locals 13

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z0()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y0()V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, " drawImage codec mEncoderFrameRate:"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ", drop="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "MomoSurface"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 49
    .line 50
    const-wide/16 v4, 0x1

    .line 51
    .line 52
    add-long/2addr v2, v4

    .line 53
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 54
    .line 55
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z

    .line 56
    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 60
    .line 61
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->r()V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 70
    .line 71
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->r()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 75
    .line 76
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 77
    .line 78
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 79
    .line 80
    invoke-interface {v0, v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 81
    .line 82
    .line 83
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 84
    .line 85
    const-wide/16 v8, 0x14

    .line 86
    .line 87
    cmp-long v0, v6, v8

    .line 88
    .line 89
    if-gez v0, :cond_3

    .line 90
    .line 91
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 92
    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 94
    .line 95
    .line 96
    move-result-wide v8

    .line 97
    add-long/2addr v6, v8

    .line 98
    sub-long/2addr v6, v2

    .line 99
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v6

    .line 106
    sub-long/2addr v6, v2

    .line 107
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 108
    .line 109
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 110
    .line 111
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v2, " render to display use:"

    .line 114
    .line 115
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 119
    .line 120
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 121
    .line 122
    div-long/2addr v2, v6

    .line 123
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o0:Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;

    .line 134
    .line 135
    if-eqz v0, :cond_4

    .line 136
    .line 137
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 138
    .line 139
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->u()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-interface {v0, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;->a(I)V

    .line 144
    .line 145
    .line 146
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 147
    .line 148
    .line 149
    move-result-wide v2

    .line 150
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->T:J

    .line 151
    .line 152
    sub-long v6, v2, v6

    .line 153
    .line 154
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 155
    .line 156
    int-to-long v8, v0

    .line 157
    const-wide/16 v10, 0x3e8

    .line 158
    .line 159
    div-long/2addr v10, v8

    .line 160
    cmp-long v0, v6, v10

    .line 161
    .line 162
    if-gez v0, :cond_5

    .line 163
    .line 164
    const/4 v0, 0x1

    .line 165
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 166
    .line 167
    return-void

    .line 168
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 169
    .line 170
    .line 171
    move-result-wide v6

    .line 172
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->T:J

    .line 173
    .line 174
    const/4 v0, 0x0

    .line 175
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 176
    .line 177
    iget-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 178
    .line 179
    add-long/2addr v6, v4

    .line 180
    iput-wide v6, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 181
    .line 182
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 183
    .line 184
    const-string v6, " render to codecSurface use:"

    .line 185
    .line 186
    if-eqz v0, :cond_8

    .line 187
    .line 188
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 189
    .line 190
    .line 191
    move-result-wide v7

    .line 192
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 193
    .line 194
    if-nez v0, :cond_6

    .line 195
    .line 196
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 197
    .line 198
    invoke-virtual {v0}, Ll/dah0;->c()V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 202
    .line 203
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->q()V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->u:Ll/dah0;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/dah0;->e()V

    .line 209
    .line 210
    .line 211
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 217
    .line 218
    .line 219
    move-result-wide v9

    .line 220
    sub-long/2addr v9, v7

    .line 221
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    iget-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 237
    .line 238
    iget-wide v11, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 239
    .line 240
    div-long/2addr v9, v11

    .line 241
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    iget-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 252
    .line 253
    cmp-long v0, v9, v4

    .line 254
    .line 255
    if-nez v0, :cond_7

    .line 256
    .line 257
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 258
    .line 259
    .line 260
    move-result-wide v9

    .line 261
    sub-long/2addr v9, v7

    .line 262
    iput-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 263
    .line 264
    goto :goto_3

    .line 265
    :cond_7
    iget-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 266
    .line 267
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 268
    .line 269
    .line 270
    move-result-wide v11

    .line 271
    add-long/2addr v9, v11

    .line 272
    sub-long/2addr v9, v7

    .line 273
    iput-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 274
    .line 275
    :cond_8
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 276
    .line 277
    if-eqz v0, :cond_b

    .line 278
    .line 279
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 280
    .line 281
    .line 282
    move-result-wide v7

    .line 283
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 284
    .line 285
    if-nez v0, :cond_9

    .line 286
    .line 287
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 288
    .line 289
    invoke-virtual {v0}, Ll/dah0;->c()V

    .line 290
    .line 291
    .line 292
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 293
    .line 294
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->p()V

    .line 295
    .line 296
    .line 297
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->v:Ll/dah0;

    .line 298
    .line 299
    invoke-virtual {v0}, Ll/dah0;->e()V

    .line 300
    .line 301
    .line 302
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 308
    .line 309
    .line 310
    move-result-wide v9

    .line 311
    sub-long/2addr v9, v7

    .line 312
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .line 321
    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    .line 323
    .line 324
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    iget-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 328
    .line 329
    iget-wide v11, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 330
    .line 331
    div-long/2addr v9, v11

    .line 332
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    .line 341
    .line 342
    iget-wide v9, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 343
    .line 344
    cmp-long v0, v9, v4

    .line 345
    .line 346
    if-nez v0, :cond_a

    .line 347
    .line 348
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 349
    .line 350
    .line 351
    move-result-wide v4

    .line 352
    sub-long/2addr v4, v7

    .line 353
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 354
    .line 355
    goto :goto_4

    .line 356
    :cond_a
    iget-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 357
    .line 358
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 359
    .line 360
    .line 361
    move-result-wide v9

    .line 362
    add-long/2addr v4, v9

    .line 363
    sub-long/2addr v4, v7

    .line 364
    iput-wide v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 365
    .line 366
    :cond_b
    :goto_4
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 367
    .line 368
    sput v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t0:I

    .line 369
    .line 370
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 371
    .line 372
    if-eqz v0, :cond_c

    .line 373
    .line 374
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 375
    .line 376
    if-nez v0, :cond_c

    .line 377
    .line 378
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z0()V

    .line 379
    .line 380
    .line 381
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 382
    .line 383
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->s()V

    .line 384
    .line 385
    .line 386
    :cond_c
    new-instance p0, Ljava/lang/StringBuilder;

    .line 387
    .line 388
    const-string v0, " draw and rend  use:"

    .line 389
    .line 390
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 394
    .line 395
    .line 396
    move-result-wide v4

    .line 397
    sub-long/2addr v4, v2

    .line 398
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    .line 407
    .line 408
    return-void
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j0(Ljava/lang/Object;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ljavax/microedition/khronos/egl/EGL10;

    .line 14
    .line 15
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 16
    .line 17
    :cond_0
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 18
    .line 19
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 20
    .line 21
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 22
    .line 23
    if-eq v2, v4, :cond_1

    .line 24
    .line 25
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 26
    .line 27
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    invoke-interface {v5, v6, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 30
    .line 31
    .line 32
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 35
    .line 36
    invoke-interface {v2, v5, v4, v4, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 37
    .line 38
    .line 39
    iput-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 40
    .line 41
    :cond_1
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 42
    .line 43
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    const/4 v7, -0x1

    .line 47
    if-ne v2, v5, :cond_2

    .line 48
    .line 49
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 50
    .line 51
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 52
    .line 53
    invoke-interface {v2, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 58
    .line 59
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 60
    .line 61
    invoke-interface {v5, v2, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 71
    .line 72
    const/4 v5, 0x1

    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    new-array v2, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 76
    .line 77
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 78
    .line 79
    :cond_3
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 80
    .line 81
    if-nez v2, :cond_4

    .line 82
    .line 83
    new-array v2, v5, [I

    .line 84
    .line 85
    iput-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 86
    .line 87
    :cond_4
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 88
    .line 89
    const-string v2, "No configs match configSpec"

    .line 90
    .line 91
    const/4 v14, 0x0

    .line 92
    if-eqz v1, :cond_7

    .line 93
    .line 94
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 95
    .line 96
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k:[I

    .line 97
    .line 98
    const/4 v12, 0x0

    .line 99
    iget-object v13, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 100
    .line 101
    const/4 v11, 0x0

    .line 102
    invoke-interface/range {v8 .. v13}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-nez v8, :cond_5

    .line 107
    .line 108
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_5
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 112
    .line 113
    aget v9, v8, v14

    .line 114
    .line 115
    if-lez v9, :cond_6

    .line 116
    .line 117
    new-array v2, v9, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 118
    .line 119
    iget-object v15, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 120
    .line 121
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 122
    .line 123
    iget-object v11, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k:[I

    .line 124
    .line 125
    move-object/from16 v18, v2

    .line 126
    .line 127
    move-object/from16 v20, v8

    .line 128
    .line 129
    move/from16 v19, v9

    .line 130
    .line 131
    move-object/from16 v16, v10

    .line 132
    .line 133
    move-object/from16 v17, v11

    .line 134
    .line 135
    invoke-interface/range {v15 .. v20}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 136
    .line 137
    .line 138
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 139
    .line 140
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 141
    .line 142
    invoke-virtual {v0, v8, v9, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    goto :goto_0

    .line 147
    :cond_6
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_7
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 152
    .line 153
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j:[I

    .line 154
    .line 155
    const/4 v12, 0x0

    .line 156
    iget-object v13, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 157
    .line 158
    const/4 v11, 0x0

    .line 159
    invoke-interface/range {v8 .. v13}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    if-nez v8, :cond_8

    .line 164
    .line 165
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n:[I

    .line 169
    .line 170
    aget v9, v8, v14

    .line 171
    .line 172
    if-lez v9, :cond_e

    .line 173
    .line 174
    new-array v2, v9, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 175
    .line 176
    iget-object v15, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 177
    .line 178
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 179
    .line 180
    iget-object v11, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j:[I

    .line 181
    .line 182
    move-object/from16 v18, v2

    .line 183
    .line 184
    move-object/from16 v20, v8

    .line 185
    .line 186
    move/from16 v19, v9

    .line 187
    .line 188
    move-object/from16 v16, v10

    .line 189
    .line 190
    move-object/from16 v17, v11

    .line 191
    .line 192
    invoke-interface/range {v15 .. v20}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 193
    .line 194
    .line 195
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 196
    .line 197
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 198
    .line 199
    invoke-virtual {v0, v8, v9, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    :goto_0
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 204
    .line 205
    if-ne v8, v3, :cond_9

    .line 206
    .line 207
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 208
    .line 209
    iget-object v9, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 210
    .line 211
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l:[I

    .line 212
    .line 213
    invoke-interface {v8, v9, v2, v3, v10}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    iput-object v3, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 218
    .line 219
    const-string v3, "eglCreateContext"

    .line 220
    .line 221
    invoke-direct {v0, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 225
    .line 226
    if-nez v3, :cond_9

    .line 227
    .line 228
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 229
    .line 230
    return-void

    .line 231
    :cond_9
    const-string v3, "MomoSurface"

    .line 232
    .line 233
    if-eqz v1, :cond_b

    .line 234
    .line 235
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 236
    .line 237
    if-ne v5, v4, :cond_a

    .line 238
    .line 239
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 240
    .line 241
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 242
    .line 243
    invoke-interface {v4, v5, v2, v1, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iput-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 248
    .line 249
    const-string v1, "eglCreateWindowSurface"

    .line 250
    .line 251
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 255
    .line 256
    if-nez v1, :cond_a

    .line 257
    .line 258
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 259
    .line 260
    return-void

    .line 261
    :cond_a
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 262
    .line 263
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 264
    .line 265
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 266
    .line 267
    const/16 v5, 0x3056

    .line 268
    .line 269
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N:[I

    .line 270
    .line 271
    invoke-interface {v1, v2, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 272
    .line 273
    .line 274
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 275
    .line 276
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 277
    .line 278
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 279
    .line 280
    const/16 v5, 0x3057

    .line 281
    .line 282
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M:[I

    .line 283
    .line 284
    invoke-interface {v1, v2, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 285
    .line 286
    .line 287
    new-instance v1, Ljava/lang/StringBuilder;

    .line 288
    .line 289
    const-string v2, "mEGLSurface width = "

    .line 290
    .line 291
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M:[I

    .line 295
    .line 296
    aget v2, v2, v14

    .line 297
    .line 298
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    const-string v2, ";mEGLSurface hight ="

    .line 302
    .line 303
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N:[I

    .line 307
    .line 308
    aget v0, v0, v14

    .line 309
    .line 310
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {v3, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_b
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 322
    .line 323
    if-eq v1, v4, :cond_c

    .line 324
    .line 325
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 326
    .line 327
    iget-object v8, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 328
    .line 329
    invoke-interface {v6, v8, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 330
    .line 331
    .line 332
    iput-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 333
    .line 334
    :cond_c
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i:[I

    .line 335
    .line 336
    iget v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->P:I

    .line 337
    .line 338
    aput v6, v1, v5

    .line 339
    .line 340
    iget v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Q:I

    .line 341
    .line 342
    const/4 v8, 0x3

    .line 343
    aput v6, v1, v8

    .line 344
    .line 345
    new-instance v1, Ljava/lang/StringBuilder;

    .line 346
    .line 347
    const-string v6, "mEGLDumpSurface width = "

    .line 348
    .line 349
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    iget-object v6, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i:[I

    .line 353
    .line 354
    aget v5, v6, v5

    .line 355
    .line 356
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v5, ";mEGLDumpSurface hight ="

    .line 360
    .line 361
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    iget-object v5, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i:[I

    .line 365
    .line 366
    aget v5, v5, v8

    .line 367
    .line 368
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    invoke-static {v3, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    .line 377
    .line 378
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 379
    .line 380
    if-ne v1, v4, :cond_d

    .line 381
    .line 382
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 383
    .line 384
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 385
    .line 386
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i:[I

    .line 387
    .line 388
    invoke-interface {v1, v3, v2, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    iput-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 393
    .line 394
    const-string v1, "eglCreatePbufferSurface"

    .line 395
    .line 396
    invoke-direct {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 400
    .line 401
    if-nez v1, :cond_d

    .line 402
    .line 403
    iput v7, v0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 404
    .line 405
    :cond_d
    return-void

    .line 406
    :cond_e
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    return-void
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0:Z

    .line 2
    .line 3
    return p0
.end method

.method private k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W:[I

    .line 2
    .line 3
    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W:[I

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    return p5
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Ltv/danmaku/ijk/media/streamer/MomoSurface;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic q(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic s(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic u(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Ltv/danmaku/ijk/media/streamer/TextureRender;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Ltv/danmaku/ijk/media/streamer/MomoSurface;Ltv/danmaku/ijk/media/streamer/TextureRender;)Ltv/danmaku/ijk/media/streamer/TextureRender;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic w(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Ltv/danmaku/ijk/media/streamer/MomoSurface;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0:I

    .line 2
    .line 3
    return p0
.end method

.method private y0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->N:[I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aget v2, v2, v3

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M:[I

    .line 28
    .line 29
    aget v2, v2, v3

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 34
    .line 35
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 36
    .line 37
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 38
    .line 39
    invoke-interface {v2, v3, v0, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static synthetic z(Ltv/danmaku/ijk/media/streamer/MomoSurface;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I

    .line 2
    .line 3
    return p0
.end method

.method private z0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeUnCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e0(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 21
    .line 22
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 23
    .line 24
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 25
    .line 26
    invoke-interface {v2, v3, v0, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized B0()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "MomoSurface"

    .line 3
    .line 4
    const-string v1, "release"

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->j0:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    :try_start_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :catch_0
    :try_start_3
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 31
    .line 32
    .line 33
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i0:Ltv/danmaku/ijk/media/streamer/MomoSurface$RenderThread;

    .line 34
    .line 35
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->A:Landroid/view/Surface;

    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->A:Landroid/view/Surface;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    .line 44
    :catch_1
    :cond_1
    :try_start_4
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-nez v2, :cond_2

    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S:Landroid/graphics/Bitmap;

    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->S:Landroid/graphics/Bitmap;

    .line 60
    .line 61
    :cond_2
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z:Landroid/graphics/SurfaceTexture;

    .line 62
    .line 63
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B:Landroid/view/Surface;

    .line 64
    .line 65
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 66
    .line 67
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0()V

    .line 68
    .line 69
    .line 70
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 71
    .line 72
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 73
    .line 74
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 75
    .line 76
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 77
    .line 78
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 79
    .line 80
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 81
    .line 82
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->t:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 83
    .line 84
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p:Ljavax/microedition/khronos/egl/EGL10;

    .line 85
    .line 86
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 87
    .line 88
    monitor-exit p0

    .line 89
    return-void

    .line 90
    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 91
    throw v0
.end method

.method public C0()V
    .locals 3

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "removeAttachedMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const/4 v1, 0x1

    .line 12
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    :try_start_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 15
    .line 16
    const-wide/16 v1, 0xbb8

    .line 17
    .line 18
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    :try_start_2
    throw p0

    .line 24
    :catchall_1
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :catch_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 29
    throw p0
.end method

.method public E0()V
    .locals 3

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "removeMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const/4 v1, 0x1

    .line 12
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    :try_start_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 15
    .line 16
    const-wide/16 v1, 0xbb8

    .line 17
    .line 18
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    :try_start_2
    throw p0

    .line 24
    :catchall_1
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :catch_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 29
    throw p0
.end method

.method public G0()V
    .locals 3

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->D(Ll/qmq0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    :try_start_1
    throw p0

    .line 25
    :catchall_1
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :catch_0
    :goto_0
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 30
    throw p0
.end method

.method public declared-synchronized H0(Landroid/content/Context;Ll/jt2;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    instance-of v0, p2, Ll/suf;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p2

    .line 13
    check-cast v0, Ll/suf;

    .line 14
    .line 15
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c1(Landroid/content/Context;Ll/jt2;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    throw p1
.end method

.method public declared-synchronized I0(Landroid/content/Context;Ll/jt2;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c1(Landroid/content/Context;Ll/jt2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw p1
.end method

.method public K0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->L:I

    .line 2
    .line 3
    return-void
.end method

.method public L0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I

    .line 6
    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    const/4 v1, 0x0

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0:I

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0:Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0:Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    :cond_4
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->C(I)V

    .line 57
    .line 58
    .line 59
    :cond_5
    return-void
.end method

.method public M0(IZ)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 2
    .line 3
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 4
    .line 5
    const/16 v0, 0x1e

    .line 6
    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 10
    .line 11
    :cond_0
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 12
    .line 13
    if-gtz p1, :cond_1

    .line 14
    .line 15
    const/16 p1, 0x14

    .line 16
    .line 17
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 18
    .line 19
    :cond_1
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h0:Z

    .line 20
    .line 21
    return-void
.end method

.method public N0(Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface$FrameRateUpdateListener;

    .line 2
    .line 3
    return-void
.end method

.method public O0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 2
    .line 3
    return-void
.end method

.method public P0(Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->o0:Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;

    .line 2
    .line 3
    return-void
.end method

.method public Q0(I)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 2
    .line 3
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 4
    .line 5
    const/16 v0, 0x1e

    .line 6
    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 10
    .line 11
    :cond_0
    iget p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 12
    .line 13
    if-gtz p1, :cond_1

    .line 14
    .line 15
    const/16 p1, 0x14

    .line 16
    .line 17
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g0:I

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public R0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->E(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S0(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->F(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T0(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/TextureRender;->G(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized U(Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "activiteSurface"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 6
    .line 7
    const-string v1, "MomoSurface"

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 27
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 28
    .line 29
    if-ne v1, p1, :cond_0

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 v1, 0x1

    .line 34
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y:Z

    .line 35
    .line 36
    :cond_1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->F:Ljava/lang/Object;

    .line 37
    .line 38
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 39
    .line 40
    const-wide/16 v1, 0xbb8

    .line 41
    .line 42
    invoke-virtual {p1, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    :try_start_2
    throw p1

    .line 48
    :catchall_1
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :catch_0
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 51
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 54
    :try_start_4
    throw p1

    .line 55
    :catchall_2
    move-exception p1

    .line 56
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 57
    throw p1
.end method

.method public U0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/TextureRender;->H(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/TextureRender;->I(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W0(JIIIII)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----merge-momo-setSubVideoPos:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v2, "["

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ","

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, "]"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v2, "MomoSurface"

    .line 49
    .line 50
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 62
    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    invoke-virtual/range {p0 .. p7}, Ltv/danmaku/ijk/media/streamer/TextureRender;->J(JIIIII)V

    .line 66
    .line 67
    .line 68
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    array-length p1, v0

    .line 76
    const/4 p2, 0x0

    .line 77
    :goto_0
    if-ge p2, p1, :cond_1

    .line 78
    .line 79
    aget-object p3, v0, p2

    .line 80
    .line 81
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p4

    .line 85
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p4, "("

    .line 89
    .line 90
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p4

    .line 97
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p4, ":"

    .line 101
    .line 102
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p3, ")\n"

    .line 113
    .line 114
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    add-int/lit8 p2, p2, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public X(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->j(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X0(JIIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/streamer/TextureRender;->K(JIIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized Y(Ll/jt2;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->k(Ll/jt2;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 19
    :try_start_4
    throw p1

    .line 20
    :catchall_1
    move-exception p1

    .line 21
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 22
    throw p1
.end method

.method public Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->R:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Landroid/view/Surface;)V
    .locals 3

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B:Landroid/view/Surface;

    .line 12
    .line 13
    if-ne v1, p1, :cond_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->B:Landroid/view/Surface;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->a0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    :try_start_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 25
    .line 26
    const-wide/16 v1, 0xbb8

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_1
    move-exception p0

    .line 33
    :try_start_2
    throw p0

    .line 34
    :catch_0
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    throw p0
.end method

.method public Z0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->L(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 3

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const/4 v1, 0x1

    .line 12
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z

    .line 13
    .line 14
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 15
    .line 16
    new-instance v2, Ltv/danmaku/ijk/media/streamer/MomoSurface$1;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface$1;-><init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->D(Ll/qmq0$a;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_1
    throw p0

    .line 32
    :catchall_1
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    throw p0
.end method

.method public b1(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/TextureRender;->M(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c0(Ll/qmq0$a;)V
    .locals 2

    .line 1
    const-string v0, "MomoSurface"

    .line 2
    .line 3
    const-string v1, "addMediaCodecSurface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ltv/danmaku/ijk/media/streamer/TextureRender;->D(Ll/qmq0$a;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    :try_start_1
    throw p0

    .line 24
    :catchall_1
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :catch_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    throw p0
.end method

.method public c1(Landroid/content/Context;Ll/jt2;)V
    .locals 2

    .line 1
    const-string p1, "MomoSurface"

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "selectFilter"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 21
    .line 22
    if-ne p2, p1, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter p1

    .line 28
    :try_start_0
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->D:Ll/jt2;

    .line 29
    .line 30
    const/4 p2, 0x1

    .line 31
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z:Z

    .line 32
    .line 33
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->I:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    :try_start_1
    throw p0

    .line 41
    :catchall_1
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :catch_0
    :goto_0
    monitor-exit p1

    .line 44
    :goto_1
    return-void

    .line 45
    :goto_2
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 46
    throw p0
.end method

.method public d0(JII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/TextureRender;->l(JII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d1()Ll/oxd0;
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->y:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/oxd0;

    .line 20
    .line 21
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ll/oxd0;

    .line 38
    .line 39
    invoke-virtual {v4}, Ll/oxd0;->f()V

    .line 40
    .line 41
    .line 42
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_2

    .line 48
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->x:Ljava/util/LinkedList;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    move-object v2, v1

    .line 54
    goto :goto_1

    .line 55
    :catch_0
    :try_start_2
    monitor-exit v0

    .line 56
    return-object v2

    .line 57
    :cond_1
    :goto_1
    monitor-exit v0

    .line 58
    return-object v2

    .line 59
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    throw p0
.end method

.method public e1(IIZIIIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r0:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p8}, Ltv/danmaku/ijk/media/streamer/TextureRender;->O(IIZIIIII)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public f0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    .line 1
    array-length v0, p3

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_2

    .line 4
    .line 5
    aget-object v5, p3, v1

    .line 6
    .line 7
    const/16 v6, 0x3025

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    move-object v2, p0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v6, 0x3026

    .line 18
    .line 19
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-ltz p0, :cond_1

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/16 v6, 0x3024

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v6, 0x3023

    .line 36
    .line 37
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/16 v6, 0x3022

    .line 42
    .line 43
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/16 v6, 0x3021

    .line 48
    .line 49
    invoke-direct/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    const/16 v7, 0x8

    .line 54
    .line 55
    if-ne p0, v7, :cond_1

    .line 56
    .line 57
    if-ne p1, v7, :cond_1

    .line 58
    .line 59
    if-ne p2, v7, :cond_1

    .line 60
    .line 61
    if-ne v6, v7, :cond_1

    .line 62
    .line 63
    return-object v5

    .line 64
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    move-object p0, v2

    .line 67
    move-object p1, v3

    .line 68
    move-object p2, v4

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method

.method public f1(IILandroid/graphics/Bitmap;Z)V
    .locals 0

    .line 1
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p4

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    :try_start_0
    monitor-exit p4

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U:I

    .line 11
    .line 12
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V:I

    .line 13
    .line 14
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    const/4 p1, -0x1

    .line 20
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0:I

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 24
    .line 25
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 28
    .line 29
    .line 30
    monitor-exit p4

    .line 31
    return-void

    .line 32
    :goto_0
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public g1(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E:Ll/suf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h0(FFFFZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/streamer/TextureRender;->n(FFFFZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h1(Landroid/graphics/SurfaceTexture;III)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v1, v2, :cond_2

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U:I

    .line 13
    .line 14
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V:I

    .line 15
    .line 16
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->p0:Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->q0:I

    .line 19
    .line 20
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->s0:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    :goto_0
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 42
    .line 43
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 46
    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :cond_2
    :goto_1
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

.method public i1(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/streamer/TextureRender;->T(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j1(Landroid/hardware/Camera;[BIILl/omw;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_8

    .line 2
    .line 3
    if-lez p3, :cond_8

    .line 4
    .line 5
    if-lez p4, :cond_8

    .line 6
    .line 7
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter p1

    .line 17
    :try_start_0
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 18
    .line 19
    if-eq v1, v0, :cond_7

    .line 20
    .line 21
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->K:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U:I

    .line 27
    .line 28
    if-ne v1, p3, :cond_2

    .line 29
    .line 30
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V:I

    .line 31
    .line 32
    if-eq v1, p4, :cond_3

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    :goto_0
    const/4 v1, 0x0

    .line 38
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->n0:Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->m0:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    :cond_3
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U:I

    .line 47
    .line 48
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V:I

    .line 49
    .line 50
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    if-nez v1, :cond_4

    .line 53
    .line 54
    mul-int v1, p3, p4

    .line 55
    .line 56
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    if-nez v1, :cond_5

    .line 65
    .line 66
    mul-int v1, p3, p4

    .line 67
    .line 68
    div-int/lit8 v1, v1, 0x2

    .line 69
    .line 70
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    :cond_5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    const/4 v2, 0x0

    .line 89
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    mul-int/2addr p3, p4

    .line 100
    invoke-virtual {v1, p2, v2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    div-int/lit8 v1, p3, 0x2

    .line 106
    .line 107
    invoke-virtual {p4, p2, p3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->k0:Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->l0:Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    invoke-virtual {p2, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 118
    .line 119
    .line 120
    if-eqz p5, :cond_6

    .line 121
    .line 122
    invoke-virtual {p0, p5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g1(Ll/omw;)V

    .line 123
    .line 124
    .line 125
    :cond_6
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 126
    .line 127
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G:Ljava/lang/Object;

    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 130
    .line 131
    .line 132
    monitor-exit p1

    .line 133
    return-void

    .line 134
    :cond_7
    :goto_1
    monitor-exit p1

    .line 135
    return-void

    .line 136
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    throw p0

    .line 138
    :cond_8
    :goto_3
    const-string p1, "MomoSurface"

    .line 139
    .line 140
    new-instance p5, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v0, "---------updateYUV:"

    .line 143
    .line 144
    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string p3, ","

    .line 151
    .line 152
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string p3, ","

    .line 159
    .line 160
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->H:Z

    .line 164
    .line 165
    invoke-virtual {p5, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p0, ","

    .line 169
    .line 170
    invoke-virtual {p5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public l0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public m0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public n0()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->r:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public o0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public p0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public q0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public r0()J
    .locals 2

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->c:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public s0()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->O:I

    .line 2
    .line 3
    return p0
.end method

.method public t0()I
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f:J

    .line 10
    .line 11
    div-long/2addr v2, v0

    .line 12
    long-to-int p0, v2

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public u0()I
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->g:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-wide v2, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e:J

    .line 10
    .line 11
    div-long/2addr v2, v0

    .line 12
    long-to-int p0, v2

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public v0()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->z:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public w0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public x0()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b:I

    .line 2
    .line 3
    return p0
.end method
