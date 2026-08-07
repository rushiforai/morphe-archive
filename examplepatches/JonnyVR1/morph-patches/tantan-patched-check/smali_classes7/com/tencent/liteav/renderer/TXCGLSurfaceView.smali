.class public Lcom/tencent/liteav/renderer/TXCGLSurfaceView;
.super Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Landroid/opengl/GLSurfaceView$Renderer;
.implements Lcom/tencent/liteav/basic/c/m;


# instance fields
.field private A:Lcom/tencent/liteav/basic/c/o;

.field private B:I

.field private C:I

.field private D:Z

.field private E:Z

.field private F:Lcom/tencent/liteav/basic/c/n;

.field private G:J

.field private H:[B

.field private I:J

.field private J:I

.field private K:I

.field private final L:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private g:Landroid/graphics/SurfaceTexture;

.field private h:Ljavax/microedition/khronos/egl/EGLContext;

.field private i:Lcom/tencent/liteav/basic/c/h;

.field private j:[I

.field private k:[F

.field private l:I

.field private m:Z

.field private n:F

.field private o:F

.field private p:I

.field private q:J

.field private r:J

.field private s:I

.field private t:Z

.field private u:Z

.field private v:Ljava/lang/Object;

.field private w:Landroid/os/Handler;

.field private x:I

.field private y:I

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x10

    .line 5
    .line 6
    new-array p1, p1, [F

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->l:I

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->n:F

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->o:F

    .line 20
    .line 21
    const/16 v0, 0x14

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    .line 24
    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .line 27
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 28
    .line 29
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    .line 30
    .line 31
    const/16 v2, 0x3000

    .line 32
    .line 33
    iput v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    .line 37
    .line 38
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 39
    .line 40
    new-instance v3, Ljava/lang/Object;

    .line 41
    .line 42
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->v:Ljava/lang/Object;

    .line 46
    .line 47
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->x:I

    .line 48
    .line 49
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->y:I

    .line 50
    .line 51
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    iput-object v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    .line 55
    .line 56
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->B:I

    .line 57
    .line 58
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->C:I

    .line 59
    .line 60
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->D:Z

    .line 61
    .line 62
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->E:Z

    .line 63
    .line 64
    iput-object v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->H:[B

    .line 65
    .line 66
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->I:J

    .line 67
    .line 68
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->J:I

    .line 69
    .line 70
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 71
    .line 72
    new-instance p1, Ljava/util/LinkedList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    .line 78
    .line 79
    const/4 p1, 0x2

    .line 80
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setEGLContextClientVersion(I)V

    .line 81
    .line 82
    .line 83
    const/16 v5, 0x10

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    const/16 v2, 0x8

    .line 89
    .line 90
    const/16 v3, 0x8

    .line 91
    .line 92
    const/16 v4, 0x8

    .line 93
    .line 94
    move-object v0, p0

    .line 95
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a(IIIIII)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 102
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x10

    .line 103
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    const/4 p1, 0x0

    .line 104
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->l:I

    .line 105
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    const/high16 p2, 0x3f800000    # 1.0f

    .line 106
    iput p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->n:F

    .line 107
    iput p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->o:F

    const/16 p2, 0x14

    .line 108
    iput p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    const-wide/16 v0, 0x0

    .line 109
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 110
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    const/16 p2, 0x3000

    .line 111
    iput p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    const/4 p2, 0x1

    .line 112
    iput-boolean p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    .line 113
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 114
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->v:Ljava/lang/Object;

    .line 115
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->x:I

    .line 116
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->y:I

    .line 117
    iput-boolean p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    const/4 v2, 0x0

    .line 118
    iput-object v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    .line 119
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->B:I

    .line 120
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->C:I

    .line 121
    iput-boolean p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->D:Z

    .line 122
    iput-boolean p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->E:Z

    .line 123
    iput-object v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->H:[B

    .line 124
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->I:J

    .line 125
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->J:I

    .line 126
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 127
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    const/4 p1, 0x2

    .line 128
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setEGLContextClientVersion(I)V

    const/16 v5, 0x10

    const/4 v6, 0x0

    const/16 v1, 0x8

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/16 v4, 0x8

    move-object v0, p0

    .line 129
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a(IIIIII)V

    .line 130
    invoke-virtual {v0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;)I
    .locals 0

    .line 272
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)I
    .locals 0

    .line 268
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;J)J
    .locals 0

    .line 269
    iput-wide p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    return-wide p1
.end method

.method private a(II)V
    .locals 12

    .line 303
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    if-eqz v0, :cond_5

    .line 304
    iget v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->x:I

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->y:I

    if-eqz v2, :cond_4

    if-gt v0, v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    if-lt v2, v0, :cond_1

    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v0

    :goto_1
    if-lt v2, v0, :cond_2

    goto :goto_2

    :cond_2
    move v0, v2

    :goto_2
    if-eqz v3, :cond_3

    move v7, v0

    move v8, v4

    goto :goto_3

    :cond_3
    move v8, v0

    move v7, v4

    :goto_3
    mul-int v0, v7, v8

    mul-int/lit8 v0, v0, 0x4

    .line 305
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 306
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 307
    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v9, 0x1908

    const/16 v10, 0x1401

    move v5, p1

    move v6, p2

    .line 308
    invoke-static/range {v5 .. v11}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 309
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    if-eqz p1, :cond_4

    .line 310
    new-instance p2, Ljava/lang/Thread;

    new-instance v5, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;

    move-object v6, p0

    move v9, v7

    move v10, v8

    move-object v7, v11

    move-object v11, p1

    move-object v8, v0

    invoke-direct/range {v5 .. v11}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$5;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;IILcom/tencent/liteav/basic/c/o;)V

    invoke-direct {p2, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 311
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    goto :goto_4

    :cond_4
    move-object v6, p0

    :goto_4
    const/4 p0, 0x0

    .line 312
    iput-object p0, v6, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    .line 313
    iput-boolean v1, v6, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    :cond_5
    return-void
.end method

.method private a(J)V
    .locals 0

    .line 324
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private a(Ljava/util/Queue;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)Z"
        }
    .end annotation

    .line 297
    monitor-enter p1

    .line 298
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    monitor-exit p1

    return v0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 299
    :cond_0
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 300
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_1

    return v0

    .line 301
    :cond_1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0

    .line 302
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private a(IIII)[I
    .locals 3

    int-to-float p0, p2

    int-to-float v0, p1

    div-float v1, p0, v0

    int-to-float p4, p4

    int-to-float p3, p3

    div-float/2addr p4, p3

    cmpl-float p3, v1, p4

    const/4 v1, 0x0

    if-lez p3, :cond_0

    mul-float/2addr v0, p4

    float-to-int p0, v0

    sub-int/2addr p2, p0

    .line 278
    div-int/lit8 p2, p2, 0x2

    move v2, p2

    move p2, p0

    move p0, v2

    goto :goto_0

    :cond_0
    div-float/2addr p0, p4

    float-to-int p0, p0

    sub-int/2addr p1, p0

    .line 279
    div-int/lit8 p1, p1, 0x2

    move v2, p1

    move p1, p0

    move p0, v1

    move v1, v2

    .line 280
    :goto_0
    filled-new-array {p1, p2, v1, p0}, [I

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)I
    .locals 0

    .line 43
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->B:I

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;J)J
    .locals 0

    .line 42
    iput-wide p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    return-wide p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)I
    .locals 0

    .line 31
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->C:I

    return p1
.end method

.method private g()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->E:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->w:Landroid/os/Handler;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroid/os/HandlerThread;

    .line 14
    .line 15
    const-string v1, "VideoCaptureThread"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->w:Landroid/os/Handler;

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->w:Landroid/os/Handler;

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    if-eqz v1, :cond_2

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-virtual {v1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    const/4 v0, 0x0

    .line 293
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b(Z)V

    return-void
.end method

.method public a(IZ)V
    .locals 3

    .line 281
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    const/4 v0, 0x1

    if-gtz p1, :cond_0

    .line 282
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    goto :goto_0

    :cond_0
    const/16 v1, 0x3c

    if-le p1, v1, :cond_1

    .line 283
    iput v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 284
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    const/4 p1, 0x0

    .line 285
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    .line 286
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->J:I

    const-wide/16 v1, 0x0

    .line 287
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->I:J

    .line 288
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 289
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b(Z)V

    .line 290
    iput-boolean p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->E:Z

    .line 291
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->G:J

    .line 292
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g()V

    return-void
.end method

.method public a(IZIIIZ)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p3

    .line 4
    .line 5
    move/from16 v4, p5

    .line 6
    .line 7
    move/from16 v2, p6

    .line 8
    .line 9
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 10
    .line 11
    if-nez v3, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    monitor-enter p0

    .line 15
    :try_start_0
    iget-boolean v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 16
    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto/16 :goto_11

    .line 23
    .line 24
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    const/16 v10, 0x4100

    .line 26
    .line 27
    invoke-static {v10}, Landroid/opengl/GLES20;->glClear(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    iget v6, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->B:I

    .line 39
    .line 40
    const/4 v7, 0x2

    .line 41
    const/16 v8, 0x10e

    .line 42
    .line 43
    const/16 v9, 0x5a

    .line 44
    .line 45
    const/4 v11, 0x1

    .line 46
    const/4 v12, 0x0

    .line 47
    if-nez v6, :cond_3

    .line 48
    .line 49
    :cond_2
    move v13, v12

    .line 50
    move v14, v13

    .line 51
    goto :goto_4

    .line 52
    :cond_3
    if-ne v6, v11, :cond_2

    .line 53
    .line 54
    rsub-int v6, v0, 0x2d0

    .line 55
    .line 56
    rem-int/lit16 v6, v6, 0x168

    .line 57
    .line 58
    if-eq v6, v9, :cond_5

    .line 59
    .line 60
    if-ne v6, v8, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    move v6, v12

    .line 64
    goto :goto_1

    .line 65
    :cond_5
    :goto_0
    move v6, v11

    .line 66
    :goto_1
    if-eqz v6, :cond_6

    .line 67
    .line 68
    move v13, v4

    .line 69
    goto :goto_2

    .line 70
    :cond_6
    move/from16 v13, p4

    .line 71
    .line 72
    :goto_2
    if-eqz v6, :cond_7

    .line 73
    .line 74
    move/from16 v6, p4

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_7
    move v6, v4

    .line 78
    :goto_3
    invoke-direct {v1, v3, v5, v13, v6}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(IIII)[I

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    aget v5, v3, v12

    .line 83
    .line 84
    aget v6, v3, v11

    .line 85
    .line 86
    aget v13, v3, v7

    .line 87
    .line 88
    const/4 v14, 0x3

    .line 89
    aget v3, v3, v14

    .line 90
    .line 91
    move v14, v13

    .line 92
    move v13, v3

    .line 93
    move v3, v5

    .line 94
    move v5, v6

    .line 95
    :goto_4
    iput v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->x:I

    .line 96
    .line 97
    iput v5, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->y:I

    .line 98
    .line 99
    invoke-static {v14, v13, v3, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 100
    .line 101
    .line 102
    iget v6, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->C:I

    .line 103
    .line 104
    if-ne v6, v11, :cond_8

    .line 105
    .line 106
    if-nez v2, :cond_9

    .line 107
    .line 108
    :goto_5
    xor-int/lit8 v6, p2, 0x1

    .line 109
    .line 110
    goto :goto_6

    .line 111
    :cond_8
    if-ne v6, v7, :cond_9

    .line 112
    .line 113
    if-eqz v2, :cond_9

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_9
    move/from16 v6, p2

    .line 117
    .line 118
    :goto_6
    if-eqz v5, :cond_a

    .line 119
    .line 120
    int-to-float v7, v3

    .line 121
    move/from16 v16, v10

    .line 122
    .line 123
    int-to-float v10, v5

    .line 124
    div-float/2addr v7, v10

    .line 125
    goto :goto_7

    .line 126
    :cond_a
    move/from16 v16, v10

    .line 127
    .line 128
    const/high16 v7, 0x3f800000    # 1.0f

    .line 129
    .line 130
    :goto_7
    move/from16 v10, p4

    .line 131
    .line 132
    if-eqz v4, :cond_b

    .line 133
    .line 134
    int-to-float v15, v10

    .line 135
    int-to-float v11, v4

    .line 136
    div-float/2addr v15, v11

    .line 137
    goto :goto_8

    .line 138
    :cond_b
    const/high16 v15, 0x3f800000    # 1.0f

    .line 139
    .line 140
    :goto_8
    iget-boolean v11, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    .line 141
    .line 142
    if-ne v11, v6, :cond_c

    .line 143
    .line 144
    iget v11, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->l:I

    .line 145
    .line 146
    if-ne v11, v0, :cond_c

    .line 147
    .line 148
    iget v11, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->n:F

    .line 149
    .line 150
    cmpl-float v11, v11, v7

    .line 151
    .line 152
    if-nez v11, :cond_c

    .line 153
    .line 154
    iget v11, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->o:F

    .line 155
    .line 156
    cmpl-float v11, v11, v15

    .line 157
    .line 158
    if-nez v11, :cond_c

    .line 159
    .line 160
    iget-boolean v11, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->D:Z

    .line 161
    .line 162
    if-eq v11, v2, :cond_14

    .line 163
    .line 164
    :cond_c
    iput-boolean v6, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    .line 165
    .line 166
    iput v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->l:I

    .line 167
    .line 168
    iput v7, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->n:F

    .line 169
    .line 170
    iput v15, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->o:F

    .line 171
    .line 172
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->D:Z

    .line 173
    .line 174
    rsub-int v0, v0, 0x2d0

    .line 175
    .line 176
    rem-int/lit16 v0, v0, 0x168

    .line 177
    .line 178
    if-eq v0, v9, :cond_e

    .line 179
    .line 180
    if-ne v0, v8, :cond_d

    .line 181
    .line 182
    goto :goto_9

    .line 183
    :cond_d
    move v11, v12

    .line 184
    goto :goto_a

    .line 185
    :cond_e
    :goto_9
    const/4 v11, 0x1

    .line 186
    :goto_a
    if-eqz v11, :cond_f

    .line 187
    .line 188
    move v2, v5

    .line 189
    goto :goto_b

    .line 190
    :cond_f
    move v2, v3

    .line 191
    :goto_b
    if-eqz v11, :cond_10

    .line 192
    .line 193
    goto :goto_c

    .line 194
    :cond_10
    move v3, v5

    .line 195
    :goto_c
    iget-object v5, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 196
    .line 197
    sget-object v6, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 198
    .line 199
    const/4 v7, 0x1

    .line 200
    invoke-static {v6, v12, v7}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    int-to-float v2, v2

    .line 205
    int-to-float v3, v3

    .line 206
    div-float v7, v2, v3

    .line 207
    .line 208
    if-eqz v11, :cond_11

    .line 209
    .line 210
    move v8, v12

    .line 211
    goto :goto_d

    .line 212
    :cond_11
    iget-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    .line 213
    .line 214
    move v8, v2

    .line 215
    :goto_d
    if-eqz v11, :cond_12

    .line 216
    .line 217
    iget-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->m:Z

    .line 218
    .line 219
    move v9, v2

    .line 220
    :goto_e
    move-object v2, v5

    .line 221
    move v3, v10

    .line 222
    move v5, v0

    .line 223
    goto :goto_f

    .line 224
    :cond_12
    move v9, v12

    .line 225
    goto :goto_e

    .line 226
    :goto_f
    invoke-virtual/range {v2 .. v9}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 227
    .line 228
    .line 229
    iget-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 230
    .line 231
    if-eqz v11, :cond_13

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->g()V

    .line 234
    .line 235
    .line 236
    goto :goto_10

    .line 237
    :cond_13
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->h()V

    .line 238
    .line 239
    .line 240
    :cond_14
    :goto_10
    const v0, 0x8d40

    .line 241
    .line 242
    .line 243
    invoke-static {v0, v12}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 244
    .line 245
    .line 246
    const/4 v0, 0x0

    .line 247
    const/high16 v2, 0x3f800000    # 1.0f

    .line 248
    .line 249
    invoke-static {v0, v0, v0, v2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 250
    .line 251
    .line 252
    invoke-static/range {v16 .. v16}, Landroid/opengl/GLES20;->glClear(I)V

    .line 253
    .line 254
    .line 255
    iget-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 256
    .line 257
    move/from16 v2, p1

    .line 258
    .line 259
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 260
    .line 261
    .line 262
    invoke-direct {v1, v14, v13}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(II)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :goto_11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 267
    throw v0
.end method

.method public a(Lcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 270
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->A:Lcom/tencent/liteav/basic/c/o;

    const/4 p1, 0x1

    .line 271
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->z:Z

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    monitor-enter v0

    .line 295
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 296
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Z)V
    .locals 1

    const/4 v0, 0x1

    .line 314
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    if-eqz p1, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    .line 315
    invoke-static {v0, v0, v0, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0x4000

    .line 316
    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 317
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->e()I

    move-result p1

    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    .line 318
    :cond_0
    monitor-enter p0

    .line 319
    :try_start_0
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 320
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 321
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    if-eqz p1, :cond_1

    .line 322
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 323
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a([B)V
    .locals 0

    .line 273
    monitor-enter p0

    .line 274
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->H:[B

    const/4 p1, 0x0

    .line 275
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    const/4 p1, 0x1

    .line 276
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 277
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onSurfaceDestroyed-->enter with mSurfaceTextureListener:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->F:Lcom/tencent/liteav/basic/c/n;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TXCGLSurfaceView"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->F:Lcom/tencent/liteav/basic/c/n;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Lcom/tencent/liteav/basic/c/n;->b(Landroid/graphics/SurfaceTexture;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public b(Ljava/lang/Runnable;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    monitor-enter v0

    .line 45
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 46
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public c()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    .line 2
    .line 3
    const/16 v1, 0x3000

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "background capture swapbuffer error : "

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TXCGLSurfaceView"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->s:I

    .line 29
    .line 30
    return p0
.end method

.method public getGLContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->w:Landroid/os/Handler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/os/Looper;->quitSafely()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->w:Landroid/os/Handler;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 13

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->L:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(Ljava/util/Queue;)Z

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    move v0, p1

    .line 8
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    .line 13
    .line 14
    const-wide/16 v5, 0x0

    .line 15
    .line 16
    cmp-long v5, v3, v5

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    cmp-long v3, v1, v3

    .line 21
    .line 22
    if-gez v3, :cond_1

    .line 23
    .line 24
    :cond_0
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    .line 25
    .line 26
    :cond_1
    iget-wide v3, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    .line 27
    .line 28
    sub-long v5, v1, v3

    .line 29
    .line 30
    iget-wide v7, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 31
    .line 32
    const-wide/16 v9, 0x3e8

    .line 33
    .line 34
    mul-long/2addr v7, v9

    .line 35
    iget v11, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->p:I

    .line 36
    .line 37
    int-to-long v11, v11

    .line 38
    div-long/2addr v7, v11

    .line 39
    cmp-long v5, v5, v7

    .line 40
    .line 41
    const/4 v6, 0x0

    .line 42
    if-gez v5, :cond_2

    .line 43
    .line 44
    const-wide/16 v0, 0xf

    .line 45
    .line 46
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(J)V

    .line 47
    .line 48
    .line 49
    move v0, v6

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    sub-long/2addr v1, v3

    .line 52
    cmp-long v1, v1, v9

    .line 53
    .line 54
    const-wide/16 v2, 0x1

    .line 55
    .line 56
    if-lez v1, :cond_3

    .line 57
    .line 58
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    iput-wide v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->r:J

    .line 65
    .line 66
    move v1, p1

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    move v1, v6

    .line 69
    :goto_1
    iget-boolean v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    .line 70
    .line 71
    if-eqz v4, :cond_4

    .line 72
    .line 73
    goto/16 :goto_7

    .line 74
    .line 75
    :cond_4
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :try_start_1
    iget-boolean v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    if-nez v4, :cond_5

    .line 80
    .line 81
    move v1, p1

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->H:[B

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    iput-object v5, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->H:[B

    .line 88
    .line 89
    iget-object v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 90
    .line 91
    if-eqz v4, :cond_6

    .line 92
    .line 93
    invoke-virtual {v4}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 94
    .line 95
    .line 96
    iget-object v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 97
    .line 98
    iget-object v5, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    .line 99
    .line 100
    invoke-virtual {v4, v5}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :catchall_0
    move-exception p1

    .line 105
    goto/16 :goto_8

    .line 106
    .line 107
    :cond_6
    :goto_2
    move-object v5, v0

    .line 108
    goto :goto_3

    .line 109
    :cond_7
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 110
    .line 111
    if-eqz v0, :cond_8

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 117
    .line 118
    iget-object v4, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    .line 119
    .line 120
    invoke-virtual {v0, v4}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 121
    .line 122
    .line 123
    :cond_8
    :goto_3
    if-nez v1, :cond_9

    .line 124
    .line 125
    iget-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 126
    .line 127
    add-long/2addr v0, v2

    .line 128
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_9
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->q:J

    .line 132
    .line 133
    :goto_4
    iput-boolean v6, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 134
    .line 135
    move v0, v6

    .line 136
    move v1, v0

    .line 137
    :goto_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    if-ne p1, v1, :cond_a

    .line 139
    .line 140
    if-ne p1, v0, :cond_e

    .line 141
    .line 142
    const-wide/16 v0, 0x5

    .line 143
    .line 144
    :try_start_2
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a(J)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 149
    .line 150
    .line 151
    move-result-wide v0

    .line 152
    long-to-double v2, v0

    .line 153
    iget-wide v7, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->I:J

    .line 154
    .line 155
    long-to-double v9, v7

    .line 156
    const-wide v11, 0x408f400000000000L    # 1000.0

    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    add-double/2addr v9, v11

    .line 162
    cmpl-double v2, v2, v9

    .line 163
    .line 164
    if-lez v2, :cond_b

    .line 165
    .line 166
    iget v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 167
    .line 168
    int-to-double v2, v2

    .line 169
    mul-double/2addr v2, v11

    .line 170
    sub-long v7, v0, v7

    .line 171
    .line 172
    long-to-double v7, v7

    .line 173
    div-double/2addr v2, v7

    .line 174
    double-to-int v2, v2

    .line 175
    add-int/2addr v2, p1

    .line 176
    iput v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->J:I

    .line 177
    .line 178
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->I:J

    .line 179
    .line 180
    iput v6, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 181
    .line 182
    :cond_b
    iget v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 183
    .line 184
    add-int/2addr v0, p1

    .line 185
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->K:I

    .line 186
    .line 187
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->F:Lcom/tencent/liteav/basic/c/n;

    .line 188
    .line 189
    if-eqz p1, :cond_d

    .line 190
    .line 191
    if-eqz v5, :cond_c

    .line 192
    .line 193
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    .line 194
    .line 195
    invoke-interface {p1, v5, v0}, Lcom/tencent/liteav/basic/c/n;->a([B[F)V

    .line 196
    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_c
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->j:[I

    .line 200
    .line 201
    aget v0, v0, v6

    .line 202
    .line 203
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->k:[F

    .line 204
    .line 205
    invoke-interface {p1, v0, v1}, Lcom/tencent/liteav/basic/c/n;->a(I[F)I

    .line 206
    .line 207
    .line 208
    :cond_d
    :goto_6
    monitor-enter p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 209
    :try_start_3
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 210
    .line 211
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 212
    if-nez p1, :cond_e

    .line 213
    .line 214
    :try_start_4
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->e()I

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    const/16 v0, 0x3000

    .line 219
    .line 220
    if-eq p1, v0, :cond_e

    .line 221
    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 223
    .line 224
    .line 225
    move-result-wide v0

    .line 226
    iget-wide v2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->G:J

    .line 227
    .line 228
    sub-long/2addr v0, v2

    .line 229
    const-wide/16 v2, 0x7d0

    .line 230
    .line 231
    cmp-long v0, v0, v2

    .line 232
    .line 233
    if-lez v0, :cond_e

    .line 234
    .line 235
    const-string v0, "TXCGLSurfaceView"

    .line 236
    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v2, "background capture swapBuffer error : "

    .line 243
    .line 244
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 258
    .line 259
    .line 260
    move-result-wide v0

    .line 261
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->G:J

    .line 262
    .line 263
    new-instance v0, Landroid/os/Bundle;

    .line 264
    .line 265
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 266
    .line 267
    .line 268
    const-string v1, "EVT_PARAM1"

    .line 269
    .line 270
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 271
    .line 272
    .line 273
    const-string p1, "EVT_ID"

    .line 274
    .line 275
    const/16 v1, 0x83e

    .line 276
    .line 277
    invoke-virtual {v0, p1, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 278
    .line 279
    .line 280
    const-string p1, "EVT_TIME"

    .line 281
    .line 282
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 283
    .line 284
    .line 285
    move-result-wide v2

    .line 286
    invoke-virtual {v0, p1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 287
    .line 288
    .line 289
    const-string p1, "EVT_MSG"

    .line 290
    .line 291
    const-string v2, "Failed to render video"

    .line 292
    .line 293
    invoke-virtual {v0, p1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 294
    .line 295
    .line 296
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a:Ljava/lang/ref/WeakReference;

    .line 297
    .line 298
    invoke-static {p0, v1, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 299
    .line 300
    .line 301
    :cond_e
    :goto_7
    return-void

    .line 302
    :catchall_1
    move-exception p1

    .line 303
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 304
    :try_start_6
    throw p1
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 305
    :goto_8
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 306
    :try_start_8
    throw p1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 307
    :catch_0
    move-exception p0

    .line 308
    const-string p1, "TXCGLSurfaceView"

    .line 309
    .line 310
    const-string v0, "onDrawFrame failed"

    .line 311
    .line 312
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->t:Z

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    const/4 p1, 0x1

    .line 6
    :try_start_0
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->u:Z

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p1
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2

    .line 1
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljavax/microedition/khronos/egl/EGL10;

    .line 6
    .line 7
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    new-array p1, p1, [I

    .line 15
    .line 16
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->j:[I

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/liteav/basic/c/j;->b()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    const/4 v0, 0x0

    .line 23
    aput p2, p1, v0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->j:[I

    .line 26
    .line 27
    aget p1, p1, v0

    .line 28
    .line 29
    if-gtz p1, :cond_0

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->j:[I

    .line 33
    .line 34
    const-string p0, "TXCGLSurfaceView"

    .line 35
    .line 36
    const-string p1, "create oes texture error!! at glsurfaceview"

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    new-instance p1, Landroid/graphics/SurfaceTexture;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->j:[I

    .line 45
    .line 46
    aget p2, p2, v0

    .line 47
    .line 48
    invoke-direct {p1, p2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g()V

    .line 54
    .line 55
    .line 56
    new-instance p1, Lcom/tencent/liteav/basic/c/h;

    .line 57
    .line 58
    invoke-direct {p1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->i:Lcom/tencent/liteav/basic/c/h;

    .line 71
    .line 72
    sget-object p2, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 73
    .line 74
    sget-object v1, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 75
    .line 76
    invoke-static {v1, v0, v0}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, p2, v0}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->F:Lcom/tencent/liteav/basic/c/n;

    .line 84
    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->g:Landroid/graphics/SurfaceTexture;

    .line 88
    .line 89
    invoke-interface {p1, p0}, Lcom/tencent/liteav/basic/c/n;->a(Landroid/graphics/SurfaceTexture;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    return-void
.end method

.method public setFPS(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$1;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setNotifyListener(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public setRendMirror(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$3;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRendMode(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$2;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->b(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRunInBackground(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string p1, "TXCGLSurfaceView"

    .line 5
    .line 6
    const-string v0, "background capture enter background"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c:Z

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p1

    .line 19
    :cond_0
    new-instance p1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$4;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView$4;-><init>(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->b(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setSurfaceTextureListener(Lcom/tencent/liteav/basic/c/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->F:Lcom/tencent/liteav/basic/c/n;

    .line 2
    .line 3
    return-void
.end method
