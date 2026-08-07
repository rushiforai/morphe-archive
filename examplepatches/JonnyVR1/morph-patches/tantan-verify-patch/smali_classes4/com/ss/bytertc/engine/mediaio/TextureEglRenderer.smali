.class public Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;
.super Lcom/ss/bytertc/base/media/EglRenderer;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "TextureEglRenderer"


# instance fields
.field private final mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

.field private mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private final mSurfaceTextureListenerLock:Ljava/lang/Object;

.field private volatile mTextureViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/TextureView;",
            ">;"
        }
    .end annotation
.end field

.field private final mainHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance p1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mainHandler:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 29
    .line 30
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    .line 32
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    .line 37
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic i(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Landroid/view/TextureView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/base/media/EglRenderer;->createEglSurface(Landroid/graphics/SurfaceTexture;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;->onCreated()V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic j(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Lcom/bytedance/realx/video/VideoFrame;Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V
    .locals 4

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private postOnMainThreadAndLock(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v0, Ll/hti0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/hti0;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
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
.method public bind(Landroid/view/TextureView;Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    const-string v0, "TextureEglRenderer"

    .line 20
    .line 21
    const-string v1, "bind"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    iput-object p2, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 34
    .line 35
    new-instance p2, Ll/jti0;

    .line 36
    .line 37
    invoke-direct {p2, p0, p1}, Ll/jti0;-><init>(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Landroid/view/TextureView;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p2}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const-string p0, "Called bind functions multiple times!!!!!!"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    const-string p0, "TextureEglRenderer has not init!!!!!!"

    .line 51
    .line 52
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "TextureEglRenderer"

    .line 12
    .line 13
    const-string v1, "init"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/EglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "TextureEglRenderer has already init!!!!!!"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/view/TextureView;

    .line 29
    .line 30
    if-eqz p1, :cond_3

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    instance-of v0, v0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->retain()V

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/iti0;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1, v0}, Ll/iti0;-><init>(Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;Lcom/bytedance/realx/video/VideoFrame;Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->getLatch()Ljava/util/concurrent/CountDownLatch;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, v1, p1}, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->postOnMainThreadAndLock(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_3

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->release()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    const-string v0, "TextureEglRenderer"

    .line 5
    .line 6
    const-string v1, "onSurfaceTextureAvailable"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/EglRenderer;->createEglSurface(Landroid/graphics/SurfaceTexture;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;->onCreated()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 22
    .line 23
    monitor-enter v0

    .line 24
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-interface {p0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    const-string v0, "TextureEglRenderer"

    .line 5
    .line 6
    const-string v1, "onSurfaceTextureDestroyed"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/bah0;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Ll/bah0;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lcom/ss/bytertc/base/media/EglRenderer;->releaseEglSurface(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    sget v2, Lcom/ss/bytertc/base/media/EglRenderer;->mDestroyTimeoutMs:I

    .line 26
    .line 27
    if-gtz v2, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/bytedance/realx/base/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    int-to-long v2, v2

    .line 34
    invoke-static {v0, v2, v3}, Lcom/bytedance/realx/base/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceLifecycleCallback:Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;->onDestroy()V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 45
    .line 46
    monitor-enter v0

    .line 47
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    invoke-interface {p0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    :goto_1
    monitor-exit v0

    .line 58
    return v1

    .line 59
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    const-string v0, "TextureEglRenderer"

    .line 2
    .line 3
    const-string v1, "onSurfaceTextureSizeChanged"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V

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
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/view/TextureView$SurfaceTextureListener;->onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasInitAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    const-string v0, "TextureEglRenderer"

    .line 12
    .line 13
    const-string v3, "release"

    .line 14
    .line 15
    invoke-static {v0, v3}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0}, Lcom/ss/bytertc/base/media/EglRenderer;->release()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mHasBindAtomic:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mTextureViewRef:Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroid/view/TextureView;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void

    .line 45
    :cond_1
    const-string p0, "TextureEglRenderer has not init or already released!!!!!"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListenerLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/TextureEglRenderer;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

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
