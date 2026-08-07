.class public Ll/u7k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/opengl/EGLConfig;

.field private b:Landroid/opengl/EGLDisplay;

.field private c:Landroid/opengl/EGLContext;

.field private d:Landroid/content/Context;

.field private e:Ll/q7k;

.field private f:D

.field private g:I

.field private final h:Ljava/util/concurrent/ThreadPoolExecutor;


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
    iput-object v0, p0, Ll/u7k;->a:Landroid/opengl/EGLConfig;

    .line 6
    .line 7
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 8
    .line 9
    iput-object v0, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 10
    .line 11
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 12
    .line 13
    iput-object v0, p0, Ll/u7k;->c:Landroid/opengl/EGLContext;

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
    iput-object v1, p0, Ll/u7k;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 34
    .line 35
    iput-object p1, p0, Ll/u7k;->d:Landroid/content/Context;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Ll/u7k;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/u7k;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/u7k;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/u7k;->g:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/u7k;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/u7k;->g:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/u7k;->g:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic d(Ll/u7k;)Ll/q7k;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7k;->e:Ll/q7k;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/u7k;Ll/q7k;)Ll/q7k;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u7k;->e:Ll/q7k;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic f(Ll/u7k;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/u7k;->f:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic g(Ll/u7k;D)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/u7k;->f:D

    .line 2
    .line 3
    add-double/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/u7k;->f:D

    .line 5
    .line 6
    return-wide v0
.end method

.method public static synthetic h(Ll/u7k;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7k;->d:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ll/u7k;D)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/u7k;->p(D)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic j(Ll/u7k;)Ll/r7k;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Ll/u7k;)Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7k;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method private l()V
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
    iput-object v1, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

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
    iget-object v5, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

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
    iput-object v1, p0, Ll/u7k;->a:Landroid/opengl/EGLConfig;

    .line 46
    .line 47
    const/16 v3, 0x3098

    .line 48
    .line 49
    const/16 v4, 0x3038

    .line 50
    .line 51
    filled-new-array {v3, v2, v4}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 56
    .line 57
    sget-object v5, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 58
    .line 59
    invoke-static {v3, v1, v5, v2, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Ll/u7k;->c:Landroid/opengl/EGLContext;

    .line 64
    .line 65
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 66
    .line 67
    if-ne v1, v2, :cond_0

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    new-instance v1, Ll/afj;

    .line 71
    .line 72
    const/16 v2, 0x200

    .line 73
    .line 74
    invoke-direct {v1, v2, v2}, Ll/afj;-><init>(II)V

    .line 75
    .line 76
    .line 77
    iget-object v2, v1, Ll/afj;->d:Ll/afj$a;

    .line 78
    .line 79
    iget v3, v2, Ll/afj$a;->c:I

    .line 80
    .line 81
    const/16 v5, 0x3056

    .line 82
    .line 83
    iget v2, v2, Ll/afj$a;->d:I

    .line 84
    .line 85
    const/16 v6, 0x3057

    .line 86
    .line 87
    filled-new-array {v6, v3, v5, v2, v4}, [I

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iget-object v3, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 92
    .line 93
    iget-object v4, p0, Ll/u7k;->a:Landroid/opengl/EGLConfig;

    .line 94
    .line 95
    invoke-static {v3, v4, v2, v0}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, v1, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 100
    .line 101
    iget-object v1, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 102
    .line 103
    iget-object p0, p0, Ll/u7k;->c:Landroid/opengl/EGLContext;

    .line 104
    .line 105
    invoke-static {v1, v0, v0, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-static {v3, p0}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
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

.method private m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object v1, p0, Ll/u7k;->c:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 6
    .line 7
    .line 8
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    iput-object v0, p0, Ll/u7k;->c:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 13
    .line 14
    iput-object v0, p0, Ll/u7k;->b:Landroid/opengl/EGLDisplay;

    .line 15
    .line 16
    return-void
.end method

.method private n()I
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/u7k;->l()V

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
    invoke-direct {p0}, Ll/u7k;->m()V

    .line 26
    .line 27
    .line 28
    return v0
.end method

.method private p(D)I
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/u7k;->n()I

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

.method private q()I
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/u7k;->n()I

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

.method private r()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Ll/u7k$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/u7k$a;-><init>(Ll/u7k;)V

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
.method public o(Z)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u7k;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cq80;->c(Landroid/content/Context;)I

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
    invoke-direct {p0}, Ll/u7k;->r()V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Ll/u7k;->q()I

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
