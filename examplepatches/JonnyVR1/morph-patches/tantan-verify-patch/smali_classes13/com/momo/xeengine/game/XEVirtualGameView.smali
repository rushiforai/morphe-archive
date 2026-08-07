.class public Lcom/momo/xeengine/game/XEVirtualGameView;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;,
        Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;
    }
.end annotation


# static fields
.field public static FRAME_NO_LIMIT:I


# instance fields
.field private callback:Lcom/momo/xeengine/game/XEGameViewCallback;

.field private enableClearBackground:Z

.field private mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

.field private final mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

.field private mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

.field private paused:Z

.field private preferredFramesPerSecond:I

.field private renderHeight:I

.field private renderWidth:I

.field private targetSurface:Landroid/view/Surface;

.field private touchEnable:Z

.field private viewSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->enableClearBackground:Z

    .line 11
    .line 12
    const/16 v2, 0x1e

    .line 13
    .line 14
    iput v2, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->preferredFramesPerSecond:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->touchEnable:Z

    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 24
    .line 25
    iput v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderWidth:I

    .line 26
    .line 27
    iput v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderHeight:I

    .line 28
    .line 29
    new-instance v1, Lcom/momo/xeengine/game/XEVirtualGameView$1;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/momo/xeengine/game/XEVirtualGameView$1;-><init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 39
    .line 40
    iput p2, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderWidth:I

    .line 41
    .line 42
    iput p3, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderHeight:I

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/game/XEVirtualGameView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/game/GameEngine;->setOnBackground(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->callOnPause()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xeengine/game/XEVirtualGameView;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/xeengine/game/XEVirtualGameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/xeengine/game/XEVirtualGameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/xeengine/game/XEVirtualGameView;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEVirtualGameView;->onNativeWindowCreate(Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/momo/xeengine/game/XEVirtualGameView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lcom/momo/xeengine/game/XEVirtualGameView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/momo/xeengine/game/XEVirtualGameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->preferredFramesPerSecond:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$900(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/game/XEVirtualGameView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/game/GameEngine;->setOnBackground(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->callOnResume()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private onNativeWindowCreate(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;-><init>(Lcom/momo/xeengine/game/XEVirtualGameView;Lcom/momo/xeengine/game/XEVirtualGameView$1;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 12
    .line 13
    new-instance v0, Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;-><init>(Ljava/lang/Object;Lcom/momo/xeengine/game/IXRender;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 21
    .line 22
    invoke-virtual {v0, p2, p3}, Lcom/momo/xeengine/game/XEngineRenderThread;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEngineRenderThread;->resetNativeWindow(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getPreferredFramesPerSecond()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->preferredFramesPerSecond:I

    .line 2
    .line 3
    return p0
.end method

.method public handleTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->touchEnable:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 13
    .line 14
    if-nez p0, :cond_2

    .line 15
    .line 16
    return v1

    .line 17
    :cond_2
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_3

    .line 22
    .line 23
    return v1

    .line 24
    :cond_3
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-nez p0, :cond_4

    .line 29
    .line 30
    return v1

    .line 31
    :cond_4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-interface {p0, p1, v0, v0}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchEvent(Landroid/view/MotionEvent;FF)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public isEnableClearBackground()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->enableClearBackground:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPaused()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 2
    .line 3
    return p0
.end method

.method public pause()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/xlq0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/xlq0;-><init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->paused:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/ylq0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ylq0;-><init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setCallback(Lcom/momo/xeengine/game/IXGameView$Callback;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 11
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    :cond_0
    return-void
.end method

.method public setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setEnableClearBackground(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->enableClearBackground:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPreferredFramesPerSecond(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->preferredFramesPerSecond:I

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "preferredFramesPerSecond must >= 0"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setSafeArea(FFFF)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;-><init>(FFFF)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 7
    .line 8
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    if-nez p1, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 24
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    if-eqz p0, :cond_1

    .line 25
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/game/XEngineRenderThread;->resetNativeWindow(Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setSurface(Landroid/view/Surface;II)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 4
    .line 5
    iput p2, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderWidth:I

    .line 6
    .line 7
    iput p3, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderHeight:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/game/XEngineRenderThread;->resetNativeWindow(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    const-string p0, "Surface\u4e0d\u80fd\u4e3anull"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setTouchEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->touchEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->targetSurface:Landroid/view/Surface;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p0, "Surface\u672a\u8bbe\u7f6e"

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 16
    .line 17
    if-nez v1, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/momo/xeengine/somanager/XEngineSOManager;->check(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;->onSuccess()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void

    .line 33
    :cond_2
    const-string p0, "\u6e38\u620f\u6b63\u5728\u8fd0\u884c \u65e0\u6cd5\u518d\u6b21\u542f\u52a8"

    .line 34
    .line 35
    invoke-interface {v0, p0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_3
    const-string p0, "\u672a\u8bbe\u7f6e\u56de\u8c03\uff0c\u6e38\u620f\u542f\u52a8\u5931\u8d25"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->requestStop()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 10
    .line 11
    :cond_0
    iput-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mRender:Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;

    .line 12
    .line 13
    return-void
.end method

.method public updateRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->renderHeight:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/game/XEngineRenderThread;->onSizeChanged(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
