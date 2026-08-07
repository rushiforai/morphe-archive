.class Ltech/sud/runtime/component/c/d$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field a:Ljavax/microedition/khronos/egl/EGL10;

.field b:Ljavax/microedition/khronos/egl/EGLDisplay;

.field c:Ljavax/microedition/khronos/egl/EGLSurface;

.field d:Ljavax/microedition/khronos/egl/EGLConfig;

.field e:Ljavax/microedition/khronos/egl/EGLContext;

.field private f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/c/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/c/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 0

    .line 170
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result p0

    invoke-static {p1, p0}, Ltech/sud/runtime/component/c/d$e;->a(Ljava/lang/String;I)V

    return-void
.end method

.method public static a(Ljava/lang/String;I)V
    .locals 2

    .line 171
    invoke-static {p0, p1}, Ltech/sud/runtime/component/c/d$e;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    .line 172
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "throwEglException tid="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "EglHelper"

    invoke-static {v0, p1}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 174
    invoke-static {p1, p2}, Ltech/sud/runtime/component/c/d$e;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static b(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " failed: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ltech/sud/runtime/component/c/d;->a(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private g()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iget-object v2, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 12
    .line 13
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 14
    .line 15
    invoke-interface {v0, v2, v1, v1, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ltech/sud/runtime/component/c/d;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->d(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iget-object v2, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 35
    .line 36
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 37
    .line 38
    invoke-interface {v0, v1, v2, v3}, Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 43
    .line 44
    :cond_1
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "start() tid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "EglHelper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 35
    .line 36
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 43
    .line 44
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 45
    .line 46
    if-eq v0, v2, :cond_4

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    new-array v2, v2, [I

    .line 50
    .line 51
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 52
    .line 53
    invoke-interface {v3, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ltech/sud/runtime/component/c/d;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    if-nez v0, :cond_0

    .line 69
    .line 70
    iput-object v2, p0, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 71
    .line 72
    iput-object v2, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->b(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v4, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 80
    .line 81
    iget-object v5, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 82
    .line 83
    invoke-interface {v3, v4, v5}, Landroid/opengl/GLSurfaceView$EGLConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    iput-object v3, p0, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 88
    .line 89
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->c(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 94
    .line 95
    iget-object v4, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 96
    .line 97
    iget-object v5, p0, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 98
    .line 99
    invoke-interface {v0, v3, v4, v5}, Landroid/opengl/GLSurfaceView$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 104
    .line 105
    :goto_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 106
    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 110
    .line 111
    if-ne v0, v3, :cond_2

    .line 112
    .line 113
    :cond_1
    iput-object v2, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 114
    .line 115
    const-string v0, "createContext"

    .line 116
    .line 117
    invoke-direct {p0, v0}, Ltech/sud/runtime/component/c/d$e;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v3, "createContext "

    .line 123
    .line 124
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v3, " tid="

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    .line 142
    .line 143
    .line 144
    move-result-wide v3

    .line 145
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iput-object v2, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    const-string p0, "eglInitialize failed"

    .line 159
    .line 160
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_4
    const-string p0, "eglGetDisplay failed"

    .line 165
    .line 166
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public b()Z
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "createSurface()  tid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "EglHelper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v0, :cond_7

    .line 32
    .line 33
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 34
    .line 35
    if-eqz v0, :cond_6

    .line 36
    .line 37
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 38
    .line 39
    if-eqz v0, :cond_5

    .line 40
    .line 41
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d$e;->g()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ltech/sud/runtime/component/c/d;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->d(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-object v4, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 59
    .line 60
    iget-object v5, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 61
    .line 62
    iget-object v6, p0, Ltech/sud/runtime/component/c/d$e;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v3, v4, v5, v6, v0}, Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    const/4 v0, 0x0

    .line 76
    iput-object v0, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 77
    .line 78
    :goto_0
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 83
    .line 84
    if-ne v0, v3, :cond_1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    iget-object v1, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 88
    .line 89
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 90
    .line 91
    iget-object v4, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 92
    .line 93
    invoke-interface {v1, v3, v0, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_2

    .line 98
    .line 99
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 100
    .line 101
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    const-string v0, "EGLHelper"

    .line 106
    .line 107
    const-string v1, "eglMakeCurrent"

    .line 108
    .line 109
    invoke-static {v0, v1, p0}, Ltech/sud/runtime/component/c/d$e;->a(Ljava/lang/String;Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    return v2

    .line 113
    :cond_2
    const/4 p0, 0x1

    .line 114
    return p0

    .line 115
    :cond_3
    :goto_1
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 116
    .line 117
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    const/16 v0, 0x300b

    .line 122
    .line 123
    if-ne p0, v0, :cond_4

    .line 124
    .line 125
    const-string p0, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    .line 126
    .line 127
    invoke-static {v1, p0}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_4
    return v2

    .line 131
    :cond_5
    const-string p0, "mEglConfig not initialized"

    .line 132
    .line 133
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return v2

    .line 137
    :cond_6
    const-string p0, "eglDisplay not initialized"

    .line 138
    .line 139
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return v2

    .line 143
    :cond_7
    const-string p0, "egl not initialized"

    .line 144
    .line 145
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return v2
.end method

.method public c()Ljavax/microedition/khronos/opengles/GL;
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ltech/sud/runtime/component/c/d;

    .line 14
    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->e(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->e(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1, v0}, Landroid/opengl/GLSurfaceView$GLWrapper;->wrap(Ljavax/microedition/khronos/opengles/GL;)Ljavax/microedition/khronos/opengles/GL;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->f(Ltech/sud/runtime/component/c/d;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    and-int/lit8 v1, v1, 0x3

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->f(Ltech/sud/runtime/component/c/d;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x1

    .line 44
    and-int/2addr v1, v2

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 v2, 0x0

    .line 49
    :goto_0
    invoke-static {p0}, Ltech/sud/runtime/component/c/d;->f(Ltech/sud/runtime/component/c/d;)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    and-int/lit8 p0, p0, 0x2

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    new-instance p0, Ltech/sud/runtime/component/c/d$h;

    .line 58
    .line 59
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d$h;-><init>()V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    const/4 p0, 0x0

    .line 64
    :goto_1
    invoke-static {v0, v2, p0}, Landroid/opengl/GLDebugHelper;->wrap(Ljavax/microedition/khronos/opengles/GL;ILjava/io/Writer;)Ljavax/microedition/khronos/opengles/GL;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_3
    return-object v0
.end method

.method public d()I
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 4
    .line 5
    iget-object v2, p0, Ltech/sud/runtime/component/c/d$e;->c:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 14
    .line 15
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/16 p0, 0x3000

    .line 21
    .line 22
    return p0
.end method

.method public e()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "destroySurface()  tid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "EglHelper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Ltech/sud/runtime/component/c/d$e;->g()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public f()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "finish() tid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "EglHelper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->f:Ljava/lang/ref/WeakReference;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ltech/sud/runtime/component/c/d;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {v0}, Ltech/sud/runtime/component/c/d;->c(Ltech/sud/runtime/component/c/d;)Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 48
    .line 49
    iget-object v3, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 50
    .line 51
    iget-object v4, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 52
    .line 53
    invoke-interface {v0, v2, v3, v4}, Landroid/opengl/GLSurfaceView$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iput-object v1, p0, Ltech/sud/runtime/component/c/d$e;->e:Ljavax/microedition/khronos/egl/EGLContext;

    .line 57
    .line 58
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v2, p0, Ltech/sud/runtime/component/c/d$e;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 63
    .line 64
    invoke-interface {v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Ltech/sud/runtime/component/c/d$e;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 68
    .line 69
    :cond_2
    return-void
.end method
