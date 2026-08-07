.class public final Lcom/momo/xeengine/gift/XEVirtualGiftView;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private callback:Lcom/momo/xeengine/game/XEGameViewCallback;

.field private final mainHandler:Landroid/os/Handler;

.field private renderHeight:I

.field private renderWidth:I

.field private targetSurface:Landroid/view/Surface;

.field private virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;


# direct methods
.method public constructor <init>(Landroid/view/Surface;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->targetSurface:Landroid/view/Surface;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderWidth:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderHeight:I

    .line 9
    .line 10
    new-instance p1, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->mainHandler:Landroid/os/Handler;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->setupVirtualGameView()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method private setupVirtualGameView()V
    .locals 4

    .line 1
    new-instance v0, Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->targetSurface:Landroid/view/Surface;

    .line 4
    .line 5
    iget v2, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderWidth:I

    .line 6
    .line 7
    iget v3, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderHeight:I

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xeengine/game/XEVirtualGameView;-><init>(Landroid/view/Surface;II)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 13
    .line 14
    new-instance v1, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;-><init>(Lcom/momo/xeengine/gift/XEVirtualGiftView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEVirtualGameView;->setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public getPreferredFramesPerSecond()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->getPreferredFramesPerSecond()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRenderHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getRenderWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getTargetSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->targetSurface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVirtualGameView()Lcom/momo/xeengine/game/XEVirtualGameView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    return-object p0
.end method

.method public handleTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/game/XEVirtualGameView;->handleTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isPaused()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->isPaused()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public pause()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->pause()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->mainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resetSurface(Landroid/view/Surface;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->targetSurface:Landroid/view/Surface;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderWidth:I

    .line 4
    .line 5
    iput p3, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderHeight:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEVirtualGameView;->setSurface(Landroid/view/Surface;II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public resume()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->resume()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setPreferredFramesPerSecond(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/game/XEVirtualGameView;->setPreferredFramesPerSecond(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSafeArea(FFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/game/XEVirtualGameView;->setSafeArea(FFFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->stop()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->renderHeight:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView;->virtualGameView:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/game/XEVirtualGameView;->updateRenderSize(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
