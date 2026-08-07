.class public Ll/j760;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field public a:Ljavax/microedition/khronos/egl/EGL10;

.field public b:Ljavax/microedition/khronos/egl/EGLDisplay;

.field public c:Ljavax/microedition/khronos/egl/EGLContext;

.field public d:Ljavax/microedition/khronos/egl/EGLSurface;

.field public e:Landroid/graphics/SurfaceTexture;

.field public f:Landroid/view/Surface;

.field public final g:Ljava/lang/Object;

.field public h:Z

.field public i:Ll/vti0;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:F

.field public o:Landroid/os/HandlerThread;

.field public p:Landroid/os/Handler;


# direct methods
.method public constructor <init>(IIIZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/j760;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 6
    .line 7
    iput-object v0, p0, Ll/j760;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 8
    .line 9
    iput-object v0, p0, Ll/j760;->d:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/j760;->g:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/j760;->l:I

    .line 20
    .line 21
    iput v0, p0, Ll/j760;->m:I

    .line 22
    .line 23
    new-instance v0, Landroid/os/HandlerThread;

    .line 24
    .line 25
    const-string v1, "OutputSurface-Thread"

    .line 26
    .line 27
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/j760;->o:Landroid/os/HandlerThread;

    .line 31
    .line 32
    iput p1, p0, Ll/j760;->j:I

    .line 33
    .line 34
    iput p2, p0, Ll/j760;->k:I

    .line 35
    .line 36
    iput p3, p0, Ll/j760;->m:I

    .line 37
    .line 38
    if-eqz p4, :cond_1

    .line 39
    .line 40
    const/high16 p3, 0x40000000    # 2.0f

    .line 41
    .line 42
    if-le p1, p2, :cond_0

    .line 43
    .line 44
    sub-int p2, p1, p2

    .line 45
    .line 46
    int-to-float p2, p2

    .line 47
    div-float/2addr p2, p3

    .line 48
    int-to-float p1, p1

    .line 49
    div-float/2addr p2, p1

    .line 50
    iput p2, p0, Ll/j760;->n:F

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sub-int p1, p2, p1

    .line 54
    .line 55
    int-to-float p1, p1

    .line 56
    div-float/2addr p1, p3

    .line 57
    int-to-float p2, p2

    .line 58
    div-float/2addr p1, p2

    .line 59
    iput p1, p0, Ll/j760;->n:F

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/4 p1, 0x0

    .line 63
    iput p1, p0, Ll/j760;->n:F

    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0}, Ll/j760;->e()V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j760;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Ll/j760;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    :try_start_1
    iget-object v1, p0, Ll/j760;->g:Ljava/lang/Object;

    .line 9
    .line 10
    const-wide/16 v2, 0x1388

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Ll/j760;->h:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 21
    .line 22
    const-string v1, "Surface frame wait timed out"

    .line 23
    .line 24
    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_0
    move-exception p0

    .line 31
    :try_start_2
    new-instance v1, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    throw v1

    .line 37
    :cond_1
    const/4 v1, 0x0

    .line 38
    iput-boolean v1, p0, Ll/j760;->h:Z

    .line 39
    .line 40
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    iget-object v0, p0, Ll/j760;->i:Ll/vti0;

    .line 42
    .line 43
    const-string v1, "before updateTexImage"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/j760;->e:Landroid/graphics/SurfaceTexture;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    throw p0
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j760;->i:Ll/vti0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/j760;->e:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/vti0;->c(Landroid/graphics/SurfaceTexture;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j760;->f:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j760;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/j760;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/j760;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 18
    .line 19
    iget-object v1, p0, Ll/j760;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 20
    .line 21
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 22
    .line 23
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/j760;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 29
    .line 30
    iget-object v1, p0, Ll/j760;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 31
    .line 32
    iget-object v2, p0, Ll/j760;->d:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 33
    .line 34
    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/j760;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 38
    .line 39
    iget-object v1, p0, Ll/j760;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 40
    .line 41
    iget-object v2, p0, Ll/j760;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 42
    .line 43
    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/j760;->f:Landroid/view/Surface;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/j760;->o:Landroid/os/HandlerThread;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Ll/j760;->o:Landroid/os/HandlerThread;

    .line 58
    .line 59
    iput-object v0, p0, Ll/j760;->b:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 60
    .line 61
    iput-object v0, p0, Ll/j760;->c:Ljavax/microedition/khronos/egl/EGLContext;

    .line 62
    .line 63
    iput-object v0, p0, Ll/j760;->d:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 64
    .line 65
    iput-object v0, p0, Ll/j760;->a:Ljavax/microedition/khronos/egl/EGL10;

    .line 66
    .line 67
    iput-object v0, p0, Ll/j760;->i:Ll/vti0;

    .line 68
    .line 69
    iput-object v0, p0, Ll/j760;->f:Landroid/view/Surface;

    .line 70
    .line 71
    iput-object v0, p0, Ll/j760;->e:Landroid/graphics/SurfaceTexture;

    .line 72
    .line 73
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j760;->o:Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/os/Handler;

    .line 7
    .line 8
    iget-object v1, p0, Ll/j760;->o:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/j760;->p:Landroid/os/Handler;

    .line 18
    .line 19
    new-instance v0, Ll/vti0;

    .line 20
    .line 21
    iget v1, p0, Ll/j760;->l:I

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/vti0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/j760;->i:Ll/vti0;

    .line 27
    .line 28
    iget v1, p0, Ll/j760;->k:I

    .line 29
    .line 30
    iget v2, p0, Ll/j760;->j:I

    .line 31
    .line 32
    if-le v1, v2, :cond_0

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    :goto_0
    iget v2, p0, Ll/j760;->n:F

    .line 38
    .line 39
    iget v3, p0, Ll/j760;->m:I

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3}, Ll/vti0;->e(ZFI)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/j760;->i:Ll/vti0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/vti0;->g()V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 50
    .line 51
    iget-object v1, p0, Ll/j760;->i:Ll/vti0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/vti0;->d()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/j760;->e:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    iget-object v1, p0, Ll/j760;->p:Landroid/os/Handler;

    .line 63
    .line 64
    invoke-virtual {v0, p0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Landroid/view/Surface;

    .line 68
    .line 69
    iget-object v1, p0, Ll/j760;->e:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/j760;->f:Landroid/view/Surface;

    .line 75
    .line 76
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/j760;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/j760;->h:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/j760;->h:Z

    .line 10
    .line 11
    iget-object p0, p0, Ll/j760;->g:Ljava/lang/Object;

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
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 21
    .line 22
    const-string v0, "mFrameAvailable already set, frame could be dropped"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0

    .line 28
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method
