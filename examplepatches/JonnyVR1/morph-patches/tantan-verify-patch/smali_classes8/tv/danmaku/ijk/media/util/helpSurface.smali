.class public Ltv/danmaku/ijk/media/util/helpSurface;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field a:[I

.field b:[I

.field c:[I

.field d:[I

.field e:[Ljavax/microedition/khronos/egl/EGLConfig;

.field f:[I

.field private g:Ljavax/microedition/khronos/egl/EGL10;

.field private h:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private i:Ljavax/microedition/khronos/egl/EGLContext;

.field private j:Ljavax/microedition/khronos/egl/EGLSurface;

.field private k:Ljavax/microedition/khronos/egl/EGLSurface;

.field private l:Landroid/graphics/SurfaceTexture;

.field private m:Landroid/view/Surface;

.field private n:[I

.field private o:[I

.field private p:I

.field private q:I

.field private r:I

.field private s:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private t:Z

.field u:I

.field v:J


# direct methods
.method public constructor <init>(Landroid/view/SurfaceHolder;II)V
    .locals 5

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3057

    const/16 v1, 0x280

    const/16 v2, 0x3056

    const/16 v3, 0x160

    const/16 v4, 0x3038

    .line 114
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->a:[I

    const/16 v0, 0xb

    .line 115
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->b:[I

    .line 116
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->c:[I

    const/16 v0, 0x3098

    const/4 v1, 0x2

    .line 117
    filled-new-array {v0, v1, v4}, [I

    move-result-object v0

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->d:[I

    const/4 v0, 0x0

    .line 118
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 119
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 120
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 121
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 122
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 123
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 124
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    const/4 v0, 0x1

    .line 125
    new-array v1, v0, [I

    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->n:[I

    .line 126
    new-array v1, v0, [I

    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->o:[I

    const/4 v1, 0x0

    .line 127
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 128
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    const-wide/16 v1, -0x1

    .line 129
    iput-wide v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->v:J

    .line 130
    iput p2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->q:I

    .line 131
    iput p3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->r:I

    .line 132
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->t:Z

    .line 133
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/util/helpSurface;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    invoke-direct {p0}, Ltv/danmaku/ijk/media/util/helpSurface;->f()V

    .line 135
    invoke-direct {p0}, Ltv/danmaku/ijk/media/util/helpSurface;->i()V

    return-void

    .line 136
    :catch_0
    const-string p0, "helpSurface"

    const-string p1, "eglSetup exception"

    invoke-static {p0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    nop

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

.method public constructor <init>(Landroid/view/SurfaceHolder;J)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3057

    .line 5
    .line 6
    const/16 v1, 0x280

    .line 7
    .line 8
    const/16 v2, 0x3056

    .line 9
    .line 10
    const/16 v3, 0x160

    .line 11
    .line 12
    const/16 v4, 0x3038

    .line 13
    .line 14
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->a:[I

    .line 19
    .line 20
    const/16 v0, 0xb

    .line 21
    .line 22
    new-array v1, v0, [I

    .line 23
    .line 24
    fill-array-data v1, :array_0

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->b:[I

    .line 28
    .line 29
    new-array v0, v0, [I

    .line 30
    .line 31
    fill-array-data v0, :array_1

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->c:[I

    .line 35
    .line 36
    const/16 v0, 0x3098

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    filled-new-array {v0, v1, v4}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->d:[I

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 47
    .line 48
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 49
    .line 50
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 51
    .line 52
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 53
    .line 54
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 55
    .line 56
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 57
    .line 58
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 59
    .line 60
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 61
    .line 62
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 63
    .line 64
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    new-array v1, v0, [I

    .line 68
    .line 69
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->n:[I

    .line 70
    .line 71
    new-array v0, v0, [I

    .line 72
    .line 73
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->o:[I

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    iput v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 77
    .line 78
    const/16 v1, 0x10

    .line 79
    .line 80
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->q:I

    .line 81
    .line 82
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->r:I

    .line 83
    .line 84
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->t:Z

    .line 85
    .line 86
    iput v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    .line 87
    .line 88
    const-wide/16 v0, -0x1

    .line 89
    .line 90
    iput-wide v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->v:J

    .line 91
    .line 92
    :try_start_0
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/util/helpSurface;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .line 94
    .line 95
    invoke-direct {p0}, Ltv/danmaku/ijk/media/util/helpSurface;->f()V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0}, Ltv/danmaku/ijk/media/util/helpSurface;->i()V

    .line 99
    .line 100
    .line 101
    iput-wide p2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->v:J

    .line 102
    .line 103
    return-void

    .line 104
    :catch_0
    const-string p0, "helpSurface"

    .line 105
    .line 106
    const-string p1, "eglSetup exception"

    .line 107
    .line 108
    invoke-static {p0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    nop

    .line 113
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

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
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

.method private a(Ljava/lang/String;)V
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

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
    const-string v1, "helpSurface"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method private b(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 14
    .line 15
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, -0x1

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 22
    .line 23
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 30
    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 32
    .line 33
    invoke-interface {v1, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-array v0, v1, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 48
    .line 49
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    new-array v0, v1, [I

    .line 56
    .line 57
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 58
    .line 59
    :cond_3
    iget-object v4, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 60
    .line 61
    if-eqz p1, :cond_4

    .line 62
    .line 63
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 64
    .line 65
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->c:[I

    .line 66
    .line 67
    iget-object v7, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 68
    .line 69
    const/4 v8, 0x1

    .line 70
    iget-object v9, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 71
    .line 72
    invoke-interface/range {v4 .. v9}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 82
    .line 83
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->b:[I

    .line 84
    .line 85
    iget-object v7, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 86
    .line 87
    const/4 v8, 0x1

    .line 88
    iget-object v9, p0, Ltv/danmaku/ijk/media/util/helpSurface;->f:[I

    .line 89
    .line 90
    invoke-interface/range {v4 .. v9}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_5

    .line 95
    .line 96
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 97
    .line 98
    return-void

    .line 99
    :cond_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 100
    .line 101
    const/4 v4, 0x0

    .line 102
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 103
    .line 104
    if-ne v0, v5, :cond_6

    .line 105
    .line 106
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 107
    .line 108
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 109
    .line 110
    iget-object v7, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 111
    .line 112
    aget-object v7, v7, v4

    .line 113
    .line 114
    iget-object v8, p0, Ltv/danmaku/ijk/media/util/helpSurface;->d:[I

    .line 115
    .line 116
    invoke-interface {v0, v6, v7, v5, v8}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 121
    .line 122
    const-string v0, "eglCreateContext"

    .line 123
    .line 124
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/util/helpSurface;->a(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 132
    .line 133
    return-void

    .line 134
    :cond_6
    const-string v0, "helpSurface"

    .line 135
    .line 136
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 137
    .line 138
    if-eqz p1, :cond_9

    .line 139
    .line 140
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 141
    .line 142
    if-eq v1, v5, :cond_7

    .line 143
    .line 144
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 145
    .line 146
    iget-object v7, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 147
    .line 148
    invoke-interface {v6, v7, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 149
    .line 150
    .line 151
    iput-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 152
    .line 153
    :cond_7
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 154
    .line 155
    if-ne v1, v5, :cond_8

    .line 156
    .line 157
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 158
    .line 159
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 160
    .line 161
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 162
    .line 163
    aget-object v6, v6, v4

    .line 164
    .line 165
    invoke-interface {v1, v5, v6, p1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 170
    .line 171
    const-string p1, "eglCreateWindowSurface"

    .line 172
    .line 173
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/util/helpSurface;->a(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 177
    .line 178
    if-nez p1, :cond_8

    .line 179
    .line 180
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    return-void

    .line 183
    :catch_0
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 184
    .line 185
    const-string p0, "eglCreateWindowSurface fail"

    .line 186
    .line 187
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 192
    .line 193
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 194
    .line 195
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 196
    .line 197
    const/16 v3, 0x3056

    .line 198
    .line 199
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->o:[I

    .line 200
    .line 201
    invoke-interface {p1, v1, v2, v3, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 205
    .line 206
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 207
    .line 208
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 209
    .line 210
    const/16 v3, 0x3057

    .line 211
    .line 212
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->n:[I

    .line 213
    .line 214
    invoke-interface {p1, v1, v2, v3, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 215
    .line 216
    .line 217
    new-instance p1, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    const-string v1, "mEGLSurface width = "

    .line 220
    .line 221
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->n:[I

    .line 225
    .line 226
    aget v1, v1, v4

    .line 227
    .line 228
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v1, ";mEGLSurface hight ="

    .line 232
    .line 233
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->o:[I

    .line 237
    .line 238
    aget p0, p0, v4

    .line 239
    .line 240
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_9
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->a:[I

    .line 252
    .line 253
    aget v2, p1, v1

    .line 254
    .line 255
    iget v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->q:I

    .line 256
    .line 257
    const/4 v7, 0x3

    .line 258
    if-ne v2, v6, :cond_a

    .line 259
    .line 260
    aget p1, p1, v7

    .line 261
    .line 262
    iget v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->r:I

    .line 263
    .line 264
    if-eq p1, v2, :cond_b

    .line 265
    .line 266
    :cond_a
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 267
    .line 268
    if-eq p1, v5, :cond_b

    .line 269
    .line 270
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 271
    .line 272
    iget-object v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 273
    .line 274
    invoke-interface {v2, v6, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 275
    .line 276
    .line 277
    iput-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 278
    .line 279
    :cond_b
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 280
    .line 281
    if-ne p1, v5, :cond_c

    .line 282
    .line 283
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->a:[I

    .line 284
    .line 285
    iget v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->q:I

    .line 286
    .line 287
    aput v2, p1, v1

    .line 288
    .line 289
    iget v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->r:I

    .line 290
    .line 291
    aput v1, p1, v7

    .line 292
    .line 293
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 294
    .line 295
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 296
    .line 297
    iget-object v5, p0, Ltv/danmaku/ijk/media/util/helpSurface;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 298
    .line 299
    aget-object v4, v5, v4

    .line 300
    .line 301
    invoke-interface {v1, v2, v4, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 306
    .line 307
    const-string p1, "eglCreatePbufferSurface"

    .line 308
    .line 309
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/util/helpSurface;->a(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 313
    .line 314
    if-nez p1, :cond_c

    .line 315
    .line 316
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 317
    .line 318
    return-void

    .line 319
    :catch_1
    iput v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 320
    .line 321
    const-string p0, "eglCreatePbufferSurface fail"

    .line 322
    .line 323
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :cond_c
    :goto_0
    const/16 p0, 0xb71

    .line 328
    .line 329
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 330
    .line 331
    .line 332
    const/16 p0, 0xb44

    .line 333
    .line 334
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 335
    .line 336
    .line 337
    return-void
.end method

.method private f()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string v0, "before makeCurrent"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/util/helpSurface;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 15
    .line 16
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 17
    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->o:[I

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
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->n:[I

    .line 28
    .line 29
    aget v2, v2, v3

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 34
    .line 35
    iget-object v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 36
    .line 37
    iget-object v4, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

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
    iput v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v0, v1, v2

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    .line 11
    .line 12
    const v1, 0x8d65

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x2801

    .line 19
    .line 20
    const v2, 0x46180400    # 9729.0f

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x2800

    .line 27
    .line 28
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 29
    .line 30
    .line 31
    const/16 v0, 0x2802

    .line 32
    .line 33
    const v2, 0x812f

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 37
    .line 38
    .line 39
    const/16 v0, 0x2803

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 42
    .line 43
    .line 44
    :try_start_0
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 45
    .line 46
    iget v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    .line 47
    .line 48
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->l:Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->l:Landroid/graphics/SurfaceTexture;

    .line 57
    .line 58
    iget v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->q:I

    .line 59
    .line 60
    iget v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->r:I

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Landroid/view/Surface;

    .line 66
    .line 67
    iget-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->l:Landroid/graphics/SurfaceTexture;

    .line 68
    .line 69
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->m:Landroid/view/Surface;
    :try_end_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    return-void

    .line 75
    :catch_0
    const/4 v0, -0x1

    .line 76
    iput v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->p:I

    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method public c()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->m:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->l:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized g()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->m:Landroid/view/Surface;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->m:Landroid/view/Surface;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 20
    .line 21
    iget-object v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 22
    .line 23
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 27
    .line 28
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 29
    .line 30
    iget-object v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 31
    .line 32
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 36
    .line 37
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 50
    .line 51
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 52
    .line 53
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 54
    .line 55
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 56
    .line 57
    invoke-interface {v0, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 61
    .line 62
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 63
    .line 64
    iget-object v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 65
    .line 66
    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 70
    .line 71
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 72
    .line 73
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 74
    .line 75
    .line 76
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 77
    .line 78
    :cond_2
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 79
    .line 80
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->h:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 81
    .line 82
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 83
    .line 84
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 85
    .line 86
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 87
    .line 88
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->j:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 89
    .line 90
    iput-object v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 91
    .line 92
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->g:Ljavax/microedition/khronos/egl/EGL10;

    .line 93
    .line 94
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->m:Landroid/view/Surface;

    .line 95
    .line 96
    iput-object v1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->l:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .line 98
    monitor-exit p0

    .line 99
    return-void

    .line 100
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    throw v0
.end method

.method public h(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/util/helpSurface;->s:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 8

    .line 1
    const-string v0, "new frame available"

    .line 2
    .line 3
    const-string v1, "helpSurface"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/util/helpSurface;->s:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/util/helpSurface;->t:Z

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-wide v3, p0, Ltv/danmaku/ijk/media/util/helpSurface;->v:J

    .line 17
    .line 18
    iget v6, p0, Ltv/danmaku/ijk/media/util/helpSurface;->u:I

    .line 19
    .line 20
    const/4 v7, 0x0

    .line 21
    move-object v5, p1

    .line 22
    invoke-virtual/range {v2 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i1(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :catch_0
    const-string p0, "onFrameAvailable error"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void
.end method
