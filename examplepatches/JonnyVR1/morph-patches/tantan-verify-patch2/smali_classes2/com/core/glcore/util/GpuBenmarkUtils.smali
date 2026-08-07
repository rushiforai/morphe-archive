.class public Lcom/core/glcore/util/GpuBenmarkUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final GPU_BENMARK_HIGH:I = 0x1

.field public static final GPU_BENMARK_LOWER:I = 0x3

.field public static final GPU_BENMARK_MEDIUM:I = 0x2


# instance fields
.field private eglConfig:Landroid/opengl/EGLConfig;

.field private eglContext:Landroid/opengl/EGLContext;

.field private eglDisplay:Landroid/opengl/EGLDisplay;

.field private gpuBenmark:Lcom/core/glcore/util/GpuBenmark;

.field private i:I

.field private mContext:Landroid/content/Context;

.field private mGpuBenmarkChangeListener:Lcom/core/glcore/util/GpuBenmarkChangeListener;

.field private mGpubenmarkValue:D

.field private final poolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglConfig:Landroid/opengl/EGLConfig;

    .line 6
    .line 7
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 10
    .line 11
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglContext:Landroid/opengl/EGLContext;

    .line 14
    .line 15
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 16
    .line 17
    new-instance v7, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 18
    .line 19
    const/16 v0, 0x80

    .line 20
    .line 21
    invoke-direct {v7, v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    const/4 v3, 0x5

    .line 26
    const-wide/16 v4, 0x1

    .line 27
    .line 28
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->poolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mContext:Landroid/content/Context;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic access$000(Lcom/core/glcore/util/GpuBenmarkUtils;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcom/core/glcore/util/GpuBenmarkUtils;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->i:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$008(Lcom/core/glcore/util/GpuBenmarkUtils;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->i:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->i:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$100(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmark;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->gpuBenmark:Lcom/core/glcore/util/GpuBenmark;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/core/glcore/util/GpuBenmarkUtils;Lcom/core/glcore/util/GpuBenmark;)Lcom/core/glcore/util/GpuBenmark;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->gpuBenmark:Lcom/core/glcore/util/GpuBenmark;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lcom/core/glcore/util/GpuBenmarkUtils;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mGpubenmarkValue:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$218(Lcom/core/glcore/util/GpuBenmarkUtils;D)D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mGpubenmarkValue:D

    .line 2
    .line 3
    add-double/2addr v0, p1

    .line 4
    iput-wide v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mGpubenmarkValue:D

    .line 5
    .line 6
    return-wide v0
.end method

.method public static synthetic access$300(Lcom/core/glcore/util/GpuBenmarkUtils;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/core/glcore/util/GpuBenmarkUtils;D)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/core/glcore/util/GpuBenmarkUtils;->judgeGpuLevel(D)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$500(Lcom/core/glcore/util/GpuBenmarkUtils;)Lcom/core/glcore/util/GpuBenmarkChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mGpuBenmarkChangeListener:Lcom/core/glcore/util/GpuBenmarkChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/core/glcore/util/GpuBenmarkUtils;)Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->poolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method private createGL()V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iput-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    new-array v3, v2, [I

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    invoke-static {v1, v3, v0, v3, v4}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v3, "EGL error "

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0xf

    .line 21
    .line 22
    new-array v6, v1, [I

    .line 23
    .line 24
    fill-array-data v6, :array_0

    .line 25
    .line 26
    .line 27
    new-array v11, v4, [I

    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    new-array v8, v10, [Landroid/opengl/EGLConfig;

    .line 31
    .line 32
    iget-object v5, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 33
    .line 34
    const/4 v9, 0x0

    .line 35
    const/4 v12, 0x0

    .line 36
    const/4 v7, 0x0

    .line 37
    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    aget-object v1, v8, v0

    .line 44
    .line 45
    iput-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglConfig:Landroid/opengl/EGLConfig;

    .line 46
    .line 47
    const/16 v4, 0x3098

    .line 48
    .line 49
    const/16 v5, 0x3038

    .line 50
    .line 51
    filled-new-array {v4, v2, v5}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v4, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 56
    .line 57
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 58
    .line 59
    invoke-static {v4, v1, v6, v2, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglContext:Landroid/opengl/EGLContext;

    .line 64
    .line 65
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 66
    .line 67
    if-eq v1, v2, :cond_0

    .line 68
    .line 69
    new-instance v1, Lcom/core/glcore/util/GLSurface;

    .line 70
    .line 71
    const/16 v2, 0x200

    .line 72
    .line 73
    invoke-direct {v1, v2, v2}, Lcom/core/glcore/util/GLSurface;-><init>(II)V

    .line 74
    .line 75
    .line 76
    iget-object v2, v1, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    .line 77
    .line 78
    iget v3, v2, Lcom/core/glcore/util/GLSurface$Viewport;->width:I

    .line 79
    .line 80
    const/16 v4, 0x3056

    .line 81
    .line 82
    iget v2, v2, Lcom/core/glcore/util/GLSurface$Viewport;->height:I

    .line 83
    .line 84
    const/16 v6, 0x3057

    .line 85
    .line 86
    filled-new-array {v6, v3, v4, v2, v5}, [I

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget-object v3, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 91
    .line 92
    iget-object v4, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglConfig:Landroid/opengl/EGLConfig;

    .line 93
    .line 94
    invoke-static {v3, v4, v2, v0}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, v1, Lcom/core/glcore/util/GLSurface;->eglSurface:Landroid/opengl/EGLSurface;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglContext:Landroid/opengl/EGLContext;

    .line 103
    .line 104
    invoke-static {v1, v0, v0, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    nop

    .line 133
    :array_0
    .array-data 4
        0x3020
        0x20
        0x3021
        0x8
        0x3022
        0x8
        0x3023
        0x8
        0x3024
        0x8
        0x3040
        0x4
        0x3033
        0x4
        0x3038
    .end array-data
.end method

.method private destroyGL()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglContext:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 6
    .line 7
    .line 8
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglContext:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 15
    .line 16
    return-void
.end method

.method private getGLExtensions()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->createGL()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1f03

    .line 5
    .line 6
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const-string v1, " "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    array-length v0, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->destroyGL()V

    .line 26
    .line 27
    .line 28
    return v0
.end method

.method private judgeGpuLevel(D)I
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->getGLExtensions()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-wide/high16 v0, 0x4074000000000000L    # 320.0

    .line 6
    .line 7
    const/16 v2, 0x4d

    .line 8
    .line 9
    if-lt p0, v2, :cond_0

    .line 10
    .line 11
    cmpg-double v3, p1, v0

    .line 12
    .line 13
    if-gtz v3, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/16 v3, 0x46

    .line 18
    .line 19
    if-lt p0, v3, :cond_1

    .line 20
    .line 21
    cmpl-double v0, p1, v0

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    const-wide v0, 0x407f400000000000L    # 500.0

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    cmpg-double p1, p1, v0

    .line 31
    .line 32
    if-lez p1, :cond_2

    .line 33
    .line 34
    :cond_1
    if-lt p0, v2, :cond_3

    .line 35
    .line 36
    :cond_2
    const/4 p0, 0x2

    .line 37
    return p0

    .line 38
    :cond_3
    const/4 p0, 0x3

    .line 39
    return p0
.end method

.method private judgeGpuLevelFast()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->getGLExtensions()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x4d

    .line 6
    .line 7
    if-lt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/16 v1, 0x46

    .line 12
    .line 13
    if-le p0, v1, :cond_1

    .line 14
    .line 15
    if-ge p0, v0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x2

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x3

    .line 20
    return p0
.end method

.method private updata()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Lcom/core/glcore/util/GpuBenmarkUtils$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/core/glcore/util/GpuBenmarkUtils$1;-><init>(Lcom/core/glcore/util/GpuBenmarkUtils;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "live-media-GpuBenmarkUtils"

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getGpuBenmark(Z)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/core/glcore/util/PreferenceUtil;->getGpuBenmarkLevel(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->updata()V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/core/glcore/util/GpuBenmarkUtils;->judgeGpuLevelFast()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    return v0
.end method

.method public setGpuBenmarkChangeListener(Lcom/core/glcore/util/GpuBenmarkChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/GpuBenmarkUtils;->mGpuBenmarkChangeListener:Lcom/core/glcore/util/GpuBenmarkChangeListener;

    .line 2
    .line 3
    return-void
.end method
