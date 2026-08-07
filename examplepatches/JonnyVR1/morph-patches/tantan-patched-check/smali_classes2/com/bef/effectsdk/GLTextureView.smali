.class public Lcom/bef/effectsdk/GLTextureView;
.super Landroid/view/TextureView;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/GLTextureView$GLThreadManager;,
        Lcom/bef/effectsdk/GLTextureView$LogWriter;,
        Lcom/bef/effectsdk/GLTextureView$GLThread;,
        Lcom/bef/effectsdk/GLTextureView$EglHelper;,
        Lcom/bef/effectsdk/GLTextureView$SimpleEGLConfigChooser;,
        Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;,
        Lcom/bef/effectsdk/GLTextureView$BaseConfigChooser;,
        Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;,
        Lcom/bef/effectsdk/GLTextureView$DefaultWindowSurfaceFactory;,
        Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;,
        Lcom/bef/effectsdk/GLTextureView$DefaultContextFactory;,
        Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;,
        Lcom/bef/effectsdk/GLTextureView$GLWrapper;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final LOG_ATTACH_DETACH:Z = true

.field private static final LOG_EGL:Z = true

.field private static final LOG_PAUSE_RESUME:Z = true

.field private static final LOG_RENDERER:Z = true

.field private static final LOG_RENDERER_DRAW_FRAME:Z = true

.field private static final LOG_SURFACE:Z = true

.field private static final LOG_THREADS:Z = true

.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I = 0x0

.field private static final TAG:Ljava/lang/String; = "GLTextureView"

.field private static final sGLThreadManager:Lcom/bef/effectsdk/GLTextureView$GLThreadManager;


# instance fields
.field private mDebugFlags:I

.field private mDetached:Z

.field private mEGLConfigChooser:Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;

.field private mEGLContextClientVersion:I

.field private mEGLContextFactory:Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;

.field private mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

.field private mGLWrapper:Lcom/bef/effectsdk/GLTextureView$GLWrapper;

.field private mPreserveEGLContextOnPause:Z

.field mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

.field private final mThisWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/bef/effectsdk/GLTextureView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/bef/effectsdk/GLTextureView$GLThreadManager;-><init>(Lcom/bef/effectsdk/GLTextureView$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/bef/effectsdk/GLTextureView;->sGLThreadManager:Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->init()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 20
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    .line 21
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->init()V

    return-void
.end method

.method public static synthetic access$1000(Lcom/bef/effectsdk/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/bef/effectsdk/GLTextureView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextClientVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcom/bef/effectsdk/GLTextureView;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextClientVersion:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/bef/effectsdk/GLTextureView;)Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLConfigChooser:Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/bef/effectsdk/GLTextureView;)Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextFactory:Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/bef/effectsdk/GLTextureView;)Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/bef/effectsdk/GLTextureView;)Lcom/bef/effectsdk/GLTextureView$GLWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLWrapper:Lcom/bef/effectsdk/GLTextureView$GLWrapper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/bef/effectsdk/GLTextureView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView;->mDebugFlags:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800()Lcom/bef/effectsdk/GLTextureView$GLThreadManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/GLTextureView;->sGLThreadManager:Lcom/bef/effectsdk/GLTextureView$GLThreadManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$900(Lcom/bef/effectsdk/GLTextureView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bef/effectsdk/GLTextureView;->mPreserveEGLContextOnPause:Z

    .line 2
    .line 3
    return p0
.end method

.method private checkRenderThreadState()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "setRenderer has already been called for this instance."

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private init()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->requestExitAndWait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :goto_1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public getDebugFlags()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView;->mDebugFlags:I

    .line 2
    .line 3
    return p0
.end method

.method public getEGLContextClientVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextClientVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bef/effectsdk/GLTextureView;->mPreserveEGLContextOnPause:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRenderMode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->getRenderMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public on(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->surfaceCreated()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/TextureView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView;->mDetached:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->getRenderMode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v0, v1

    .line 23
    :goto_0
    new-instance v2, Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/bef/effectsdk/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    invoke-direct {v2, v3}, Lcom/bef/effectsdk/GLTextureView$GLThread;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 31
    .line 32
    if-eq v0, v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->setRenderMode(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v0, v1, v2}, Lcom/bef/effectsdk/GLTextureView$GLThread;->onWindowResize(II)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 53
    .line 54
    .line 55
    :cond_2
    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView;->mDetached:Z

    .line 57
    .line 58
    return-void
.end method

.method public onDestroy()V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->requestExitAndWait()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/bef/effectsdk/GLTextureView;->mDetached:Z

    .line 10
    .line 11
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onExitContext()V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->onPause()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResume()V
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/view/TextureView;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->surfaceCreated()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->onResume()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/TextureView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/bef/effectsdk/GLTextureView$GLThread;->onWindowResize(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mPrevSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->surfaceCreated()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->surfaceDestroyed()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3}, Lcom/bef/effectsdk/GLTextureView$GLThread;->onWindowResize(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView;->getRenderMode()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView;->requestRender()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public requestRender()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bef/effectsdk/GLTextureView$GLThread;->requestRender()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/GLTextureView;->mDebugFlags:I

    .line 2
    .line 3
    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 8

    .line 1
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;-><init>(Lcom/bef/effectsdk/GLTextureView;IIIIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/bef/effectsdk/GLTextureView;->setEGLConfigChooser(Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setEGLConfigChooser(Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->checkRenderThreadState()V

    .line 19
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLConfigChooser:Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    .line 17
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$SimpleEGLConfigChooser;

    invoke-direct {v0, p0, p1}, Lcom/bef/effectsdk/GLTextureView$SimpleEGLConfigChooser;-><init>(Lcom/bef/effectsdk/GLTextureView;Z)V

    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->setEGLConfigChooser(Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->checkRenderThreadState()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextClientVersion:I

    .line 5
    .line 6
    return-void
.end method

.method public setEGLContextFactory(Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->checkRenderThreadState()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextFactory:Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;

    .line 5
    .line 6
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->checkRenderThreadState()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;

    .line 5
    .line 6
    return-void
.end method

.method public setGLWrapper(Lcom/bef/effectsdk/GLTextureView$GLWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mGLWrapper:Lcom/bef/effectsdk/GLTextureView$GLWrapper;

    .line 2
    .line 3
    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bef/effectsdk/GLTextureView;->mPreserveEGLContextOnPause:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bef/effectsdk/GLTextureView$GLThread;->setRenderMode(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/GLTextureView;->checkRenderThreadState()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLConfigChooser:Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$SimpleEGLConfigChooser;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-direct {v0, p0, v1}, Lcom/bef/effectsdk/GLTextureView$SimpleEGLConfigChooser;-><init>(Lcom/bef/effectsdk/GLTextureView;Z)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLConfigChooser:Lcom/bef/effectsdk/GLTextureView$EGLConfigChooser;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextFactory:Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$DefaultContextFactory;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Lcom/bef/effectsdk/GLTextureView$DefaultContextFactory;-><init>(Lcom/bef/effectsdk/GLTextureView;Lcom/bef/effectsdk/GLTextureView$1;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLContextFactory:Lcom/bef/effectsdk/GLTextureView$EGLContextFactory;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Lcom/bef/effectsdk/GLTextureView$DefaultWindowSurfaceFactory;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Lcom/bef/effectsdk/GLTextureView$DefaultWindowSurfaceFactory;-><init>(Lcom/bef/effectsdk/GLTextureView$1;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/bef/effectsdk/GLTextureView$EGLWindowSurfaceFactory;

    .line 38
    .line 39
    :cond_2
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    .line 40
    .line 41
    new-instance p1, Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    invoke-direct {p1, v0}, Lcom/bef/effectsdk/GLTextureView$GLThread;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView;->mGLThread:Lcom/bef/effectsdk/GLTextureView$GLThread;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
