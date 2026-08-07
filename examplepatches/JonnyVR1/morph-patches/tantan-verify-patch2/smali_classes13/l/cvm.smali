.class public Ll/cvm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/opengl/EGLDisplay;

.field public b:Landroid/opengl/EGLContext;

.field public c:Landroid/opengl/EGLSurface;

.field public d:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/cvm;->d:Landroid/view/Surface;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cvm;->b()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    const/16 v0, 0x3000

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-nez p0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    const-string p0, "EGL error encountered (see log)"

    .line 16
    .line 17
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final b()V
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
    iput-object v1, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    if-eq v1, v2, :cond_4

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v3, v2, [I

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-static {v1, v3, v0, v3, v4}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    const/16 v1, 0xb

    .line 23
    .line 24
    new-array v6, v1, [I

    .line 25
    .line 26
    fill-array-data v6, :array_0

    .line 27
    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    new-array v8, v10, [Landroid/opengl/EGLConfig;

    .line 31
    .line 32
    new-array v11, v4, [I

    .line 33
    .line 34
    iget-object v5, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    const/4 v12, 0x0

    .line 38
    const/4 v7, 0x0

    .line 39
    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    const/16 v1, 0x3098

    .line 46
    .line 47
    const/16 v3, 0x3038

    .line 48
    .line 49
    filled-new-array {v1, v2, v3}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 54
    .line 55
    aget-object v4, v8, v0

    .line 56
    .line 57
    sget-object v5, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 58
    .line 59
    invoke-static {v2, v4, v5, v1, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 64
    .line 65
    const-string v1, "eglCreateContext"

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ll/cvm;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 71
    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    filled-new-array {v3}, [I

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v2, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 79
    .line 80
    aget-object v3, v8, v0

    .line 81
    .line 82
    iget-object v4, p0, Ll/cvm;->d:Landroid/view/Surface;

    .line 83
    .line 84
    invoke-static {v2, v3, v4, v1, v0}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 89
    .line 90
    const-string v0, "eglCreateWindowSurface"

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/cvm;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 96
    .line 97
    if-eqz p0, :cond_0

    .line 98
    .line 99
    return-void

    .line 100
    :cond_0
    const-string p0, "surface was null"

    .line 101
    .line 102
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    const-string p0, "null context"

    .line 107
    .line 108
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    const-string p0, "unable to find RGB888+recordable ES2 EGL config"

    .line 113
    .line 114
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    const/4 v0, 0x0

    .line 119
    iput-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 120
    .line 121
    const-string p0, "unable to initialize EGL14"

    .line 122
    .line 123
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    const-string p0, "unable to get EGL14 display"

    .line 128
    .line 129
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3040
        0x4
        0x3142
        0x1
        0x3038
    .end array-data
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 6
    .line 7
    invoke-static {v0, v1, v1, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "eglMakeCurrent failed"

    .line 15
    .line 16
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 14
    .line 15
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 16
    .line 17
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 18
    .line 19
    invoke-static {v0, v1, v1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 23
    .line 24
    iget-object v1, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cvm;->d:Landroid/view/Surface;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 43
    .line 44
    iput-object v0, p0, Ll/cvm;->b:Landroid/opengl/EGLContext;

    .line 45
    .line 46
    iput-object v0, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 47
    .line 48
    iput-object v0, p0, Ll/cvm;->d:Landroid/view/Surface;

    .line 49
    .line 50
    return-void
.end method

.method public e(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cvm;->a:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cvm;->c:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
