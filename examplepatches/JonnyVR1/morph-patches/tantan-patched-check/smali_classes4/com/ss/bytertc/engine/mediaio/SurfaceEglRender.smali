.class public Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;
.super Lcom/ss/bytertc/base/media/SurfaceEglRenderer;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceEglRender"


# instance fields
.field private mCallback:Landroid/view/SurfaceHolder$Callback;

.field private final mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mSurfaceCallbackLock:Ljava/lang/Object;

.field private mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

.field private final mSurfaceLifecycleCallbackLock:Ljava/lang/Object;

.field private surfaceViewSoftReference:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Landroid/view/SurfaceView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    new-instance p1, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallbackLock:Ljava/lang/Object;

    .line 25
    .line 26
    new-instance p1, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceCallbackLock:Ljava/lang/Object;

    .line 32
    .line 33
    new-instance p1, Ljava/lang/ref/SoftReference;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-direct {p1, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->surfaceViewSoftReference:Ljava/lang/ref/SoftReference;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic i(Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;Landroid/view/SurfaceView;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceCallbackLock:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mCallback:Landroid/view/SurfaceHolder$Callback;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    new-instance v1, Ljava/lang/ref/SoftReference;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->surfaceViewSoftReference:Ljava/lang/ref/SoftReference;

    .line 28
    .line 29
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    int-to-float v1, v1

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    int-to-float p1, p1

    .line 55
    div-float/2addr v1, p1

    .line 56
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/base/media/EglRenderer;->setLayoutAspectRatio(F)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    throw p0
.end method

.method private runOnUIThread(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Landroid/os/Handler;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/SurfaceView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "SurfaceEglRender"

    .line 20
    .line 21
    const-string v1, "bind"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/aah0;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Ll/aah0;-><init>(Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;Landroid/view/SurfaceView;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "Called bind functions multiple times!!!!!!"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string p0, "TextureEglRenderer has not init!!!!!!"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "SurfaceEglRender"

    .line 15
    .line 16
    const-string v1, "init"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "SurfaceEglRender has already init!!!!!!"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const-string v0, "SurfaceEglRender"

    .line 12
    .line 13
    const-string v3, "release"

    .line 14
    .line 15
    invoke-static {v0, v3}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->release()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->surfaceViewSoftReference:Ljava/lang/ref/SoftReference;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/view/SurfaceView;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void

    .line 46
    :cond_1
    const-string p0, "TextureEglRenderer has not init or already released!!!!!"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public setSurfaceHolderCallback(Landroid/view/SurfaceHolder$Callback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceCallbackLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mCallback:Landroid/view/SurfaceHolder$Callback;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public setSurfaceLifecycleLisenter(Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallbackLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 2
    .line 3
    .line 4
    const-string p0, "SurfaceEglRender"

    .line 5
    .line 6
    const-string p1, "surfaceChanged"

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "SurfaceEglRender"

    .line 5
    .line 6
    const-string v0, "surfaceCreated"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallbackLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;->onCreated()V

    .line 19
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
    monitor-exit p1

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/SurfaceEglRenderer;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "SurfaceEglRender"

    .line 5
    .line 6
    const-string v0, "surfaceDestroyed"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallbackLock:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/SurfaceEglRender;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;->onDestroy()V

    .line 19
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
    monitor-exit p1

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
