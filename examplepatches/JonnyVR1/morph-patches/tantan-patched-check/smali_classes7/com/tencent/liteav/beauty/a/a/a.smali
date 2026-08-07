.class public Lcom/tencent/liteav/beauty/a/a/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljavax/microedition/khronos/egl/EGL10;

.field private final b:Ljavax/microedition/khronos/egl/EGLContext;

.field private c:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private d:Ljavax/microedition/khronos/egl/EGLConfig;

.field private e:Ljavax/microedition/khronos/egl/EGLSurface;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 86
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/a/a/a;-><init>(Ljavax/microedition/khronos/egl/EGLConfig;)V

    return-void
.end method

.method public constructor <init>(Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 11
    .line 12
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 19
    .line 20
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 21
    .line 22
    if-eq v0, v1, :cond_2

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    new-array v2, v1, [I

    .line 26
    .line 27
    iget-object v3, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 28
    .line 29
    invoke-interface {v3, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/a;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/a/a/a;->b()Ljavax/microedition/khronos/egl/EGLConfig;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/a;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 45
    .line 46
    :goto_0
    const/16 p1, 0x3098

    .line 47
    .line 48
    const/16 v0, 0x3038

    .line 49
    .line 50
    filled-new-array {p1, v1, v0}, [I

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/tencent/liteav/beauty/a/a/a;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 59
    .line 60
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 61
    .line 62
    invoke-interface {v0, v1, v2, v3, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/a;->b:Ljavax/microedition/khronos/egl/EGLContext;

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const/4 p1, 0x0

    .line 70
    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 71
    .line 72
    const-string p0, "unable to initialize EGL10"

    .line 73
    .line 74
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    throw p0

    .line 79
    :cond_2
    const-string p0, "unable to get EGL10 display"

    .line 80
    .line 81
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    throw p0
.end method

.method private a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

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
    new-instance v0, Ljava/lang/RuntimeException;

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, ": EGL error: 0x"

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method

.method private b()Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 7

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    new-array v3, v0, [I

    .line 4
    .line 5
    fill-array-data v3, :array_0

    .line 6
    .line 7
    .line 8
    const/4 v5, 0x1

    .line 9
    new-array v4, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    new-array v6, v0, [I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 17
    .line 18
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const-string p0, "ImageEglSurface"

    .line 25
    .line 26
    const-string v0, "unable to find RGB8888  EGLConfig"

    .line 27
    .line 28
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    aget-object p0, v4, p0

    .line 35
    .line 36
    return-object p0

    .line 37
    :array_0
    .array-data 4
        0x3033
        0x1
        0x3025
        0x10
        0x3026
        0x0
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3038
    .end array-data
.end method


# virtual methods
.method public a(II)Ljavax/microedition/khronos/egl/EGLSurface;
    .locals 3

    const/16 v0, 0x3056

    const/16 v1, 0x3038

    const/16 v2, 0x3057

    .line 43
    filled-new-array {v2, p1, v0, p2, v1}, [I

    move-result-object p1

    .line 44
    iget-object p2, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {p2, v0, v1, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/beauty/a/a/a;->e:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 45
    const-string p1, "eglCreatePbufferSurface"

    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/a/a/a;->a(Ljava/lang/String;)V

    .line 46
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/a;->e:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz p0, :cond_0

    return-object p0

    .line 47
    :cond_0
    const-string p0, "surface was null"

    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a()V
    .locals 4

    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 49
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/tencent/liteav/beauty/a/a/a;->b:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, p0}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    return-void
.end method

.method public a(Ljavax/microedition/khronos/egl/EGLSurface;)V
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, p0, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    return-void
.end method

.method public b(Ljavax/microedition/khronos/egl/EGLSurface;)V
    .locals 3

    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/beauty/a/a/a;->c:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 38
    sget-object v1, Ljavax/microedition/khronos/egl/EGL11;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-ne v0, v1, :cond_0

    .line 39
    const-string v1, "EglCore"

    const-string v2, "NOTE: makeCurrent w/o display"

    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/beauty/a/a/a;->a:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p0, p0, Lcom/tencent/liteav/beauty/a/a/a;->b:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v0, p1, p1, p0}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result p0

    if-eqz p0, :cond_1

    return-void

    .line 41
    :cond_1
    const-string p0, "eglMakeCurrent failed"

    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    return-void
.end method
