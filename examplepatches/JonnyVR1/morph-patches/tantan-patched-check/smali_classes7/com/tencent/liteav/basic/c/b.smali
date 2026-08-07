.class public Lcom/tencent/liteav/basic/c/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String; = "b"

.field private static l:[I

.field private static m:[I


# instance fields
.field private b:Ljavax/microedition/khronos/egl/EGL10;

.field private c:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private d:Ljavax/microedition/khronos/egl/EGLConfig;

.field private e:Z

.field private f:Ljavax/microedition/khronos/egl/EGLContext;

.field private g:Z

.field private h:Ljavax/microedition/khronos/egl/EGLSurface;

.field private i:I

.field private j:I

.field private k:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/liteav/basic/c/b;->l:[I

    .line 9
    .line 10
    const/16 v0, 0x13

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/tencent/liteav/basic/c/b;->m:[I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        0x3033
        0x1
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x0
        0x3026
        0x0
        0x3040
        0x4
        0x3038
    .end array-data

    :array_1
    .array-data 4
        0x3033
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x0
        0x3026
        0x0
        0x3040
        0x4
        0x3142
        0x1
        0x3038
    .end array-data
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/basic/c/b;->i:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/basic/c/b;->j:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/b;->k:[I

    .line 13
    .line 14
    return-void
.end method

.method public static a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/b;
    .locals 1

    .line 183
    new-instance v0, Lcom/tencent/liteav/basic/c/b;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/b;-><init>()V

    .line 184
    iput p3, v0, Lcom/tencent/liteav/basic/c/b;->i:I

    .line 185
    iput p4, v0, Lcom/tencent/liteav/basic/c/b;->j:I

    .line 186
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tencent/liteav/basic/c/d;
        }
    .end annotation

    const/16 v0, 0x3098

    const/16 v1, 0x3038

    .line 187
    filled-new-array {v0, p3, v1}, [I

    move-result-object p3

    if-nez p4, :cond_0

    .line 188
    sget-object p4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0, p1, p2, p4, p3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p1

    .line 190
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/b;->f()V

    return-object p1
.end method

.method private a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;)Z
    .locals 8

    .line 1
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 8
    .line 9
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->k:[I

    .line 20
    .line 21
    invoke-interface {v1, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v0, 0x1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-array v7, v0, [I

    .line 29
    .line 30
    new-array v5, v0, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 35
    .line 36
    if-nez p3, :cond_0

    .line 37
    .line 38
    sget-object p1, Lcom/tencent/liteav/basic/c/b;->l:[I

    .line 39
    .line 40
    :goto_0
    move-object v4, p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    sget-object p1, Lcom/tencent/liteav/basic/c/b;->m:[I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_1
    const/4 v6, 0x1

    .line 46
    invoke-interface/range {v2 .. v7}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 47
    .line 48
    .line 49
    aget-object p1, v5, v1

    .line 50
    .line 51
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 52
    .line 53
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/b;->e:Z

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 57
    .line 58
    :goto_2
    if-eqz p2, :cond_2

    .line 59
    .line 60
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/b;->g:Z

    .line 61
    .line 62
    :cond_2
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 65
    .line 66
    const/4 v3, 0x2

    .line 67
    invoke-direct {p0, p1, v2, v3, p2}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;
    :try_end_0
    .catch Lcom/tencent/liteav/basic/c/d; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :catch_0
    sget-object p1, Lcom/tencent/liteav/basic/c/b;->a:Ljava/lang/String;

    .line 75
    .line 76
    const-string v2, "failed to create EGLContext of OpenGL ES 2.0, try 3.0"

    .line 77
    .line 78
    invoke-static {p1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :try_start_1
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 84
    .line 85
    const/4 v3, 0x3

    .line 86
    invoke-direct {p0, p1, v2, v3, p2}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;
    :try_end_1
    .catch Lcom/tencent/liteav/basic/c/d; {:try_start_1 .. :try_end_1} :catch_1

    .line 91
    .line 92
    :goto_3
    iget p1, p0, Lcom/tencent/liteav/basic/c/b;->i:I

    .line 93
    .line 94
    iget p2, p0, Lcom/tencent/liteav/basic/c/b;->j:I

    .line 95
    .line 96
    const/16 v2, 0x3038

    .line 97
    .line 98
    const/16 v3, 0x3057

    .line 99
    .line 100
    const/16 v4, 0x3056

    .line 101
    .line 102
    filled-new-array {v3, p1, v4, p2, v2}, [I

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p2, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 107
    .line 108
    if-nez p3, :cond_3

    .line 109
    .line 110
    iget-object p3, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 111
    .line 112
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 113
    .line 114
    invoke-interface {p2, p3, v2, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 122
    .line 123
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 124
    .line 125
    const/4 v3, 0x0

    .line 126
    invoke-interface {p2, p1, v2, p3, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 131
    .line 132
    :goto_4
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 133
    .line 134
    sget-object p2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 135
    .line 136
    if-ne p1, p2, :cond_4

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->e()V

    .line 139
    .line 140
    .line 141
    return v1

    .line 142
    :cond_4
    iget-object p2, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 143
    .line 144
    iget-object p3, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 145
    .line 146
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;

    .line 147
    .line 148
    invoke-interface {p2, p3, p1, p1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_5

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->e()V

    .line 155
    .line 156
    .line 157
    return v1

    .line 158
    :cond_5
    return v0

    .line 159
    :catch_1
    move-exception v0

    .line 160
    move-object p0, v0

    .line 161
    sget-object p1, Lcom/tencent/liteav/basic/c/b;->a:Ljava/lang/String;

    .line 162
    .line 163
    new-instance p2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string p3, "failed to create EGLContext of 3.0. "

    .line 166
    .line 167
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return v1
.end method

.method private f()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tencent/liteav/basic/c/d;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3000

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Lcom/tencent/liteav/basic/c/d;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/tencent/liteav/basic/c/d;-><init>(I)V

    .line 15
    .line 16
    .line 17
    throw v0
.end method


# virtual methods
.method public a()Z
    .locals 3

    .line 181
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v0

    .line 182
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->e()V

    return v0
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 4
    .line 5
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 19
    .line 20
    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 30
    .line 31
    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->e()V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/b;->h:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/b;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 48
    .line 49
    return-void
.end method

.method public d()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/b;->f:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/b;->b:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3000

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/liteav/basic/c/b;->a:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "EGL error: 0x"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
