.class final Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/game/IXRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/game/XEVirtualGameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "MyRender"
.end annotation


# instance fields
.field private engine:Lcom/momo/xeengine/game/GameEngine;

.field preDrawFrameTime:J

.field private renderSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

.field private startCalled:Z

.field final synthetic this$0:Lcom/momo/xeengine/game/XEVirtualGameView;


# direct methods
.method private constructor <init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->preDrawFrameTime:J

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->startCalled:Z

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/xeengine/game/XEVirtualGameView;Lcom/momo/xeengine/game/XEVirtualGameView$1;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;-><init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V

    return-void
.end method

.method public static synthetic access$500(Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method private updateSafeArea()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$900(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v1, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeW:F

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    cmpl-float v1, v2, v1

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget v1, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeH:F

    .line 18
    .line 19
    cmpl-float v1, v2, v1

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->renderSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 25
    .line 26
    if-eq v1, v0, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/momo/xeengine/game/GameEngine;->getWindow()Lcom/momo/xeengine/xnative/IXWindow;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeX:F

    .line 35
    .line 36
    iget v3, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeY:F

    .line 37
    .line 38
    iget v4, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeW:F

    .line 39
    .line 40
    iget v5, v0, Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;->safeH:F

    .line 41
    .line 42
    invoke-interface {v1, v2, v3, v4, v5}, Lcom/momo/xeengine/xnative/IXWindow;->SetSafeArea(FFFF)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->renderSafeArea:Lcom/momo/xeengine/game/XEVirtualGameView$SafeArea;

    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public onBackgroundFrame()V
    .locals 0

    return-void
.end method

.method public onGLDrawFrame(Ljavax/microedition/khronos/egl/EGL10;)Z
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$700(Lcom/momo/xeengine/game/XEVirtualGameView;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->updateSafeArea()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/momo/xeengine/game/GameEngine;->render()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$800(Lcom/momo/xeengine/game/XEVirtualGameView;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sget v2, Lcom/momo/xeengine/game/XEVirtualGameView;->FRAME_NO_LIMIT:I

    .line 30
    .line 31
    if-eq v1, v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/momo/xeengine/game/GameEngine;->getRenderMode()Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget-object v1, Lcom/momo/xeengine/game/GameEngine$RenderMode;->Auto:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 38
    .line 39
    if-ne p1, v1, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    iget-wide v3, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->preDrawFrameTime:J

    .line 46
    .line 47
    sub-long/2addr v1, v3

    .line 48
    iget-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$800(Lcom/momo/xeengine/game/XEVirtualGameView;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/16 v3, 0x3e8

    .line 55
    .line 56
    div-int/2addr v3, p1

    .line 57
    int-to-long v3, v3

    .line 58
    cmp-long p1, v1, v3

    .line 59
    .line 60
    if-gez p1, :cond_1

    .line 61
    .line 62
    sub-long/2addr v3, v1

    .line 63
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    :catch_0
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    iput-wide v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->preDrawFrameTime:J

    .line 71
    .line 72
    :cond_2
    return v0

    .line 73
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method public onGLEnvCreated()V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lcom/momo/xeengine/game/GameEngine;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/game/GameEngine;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v1, v2}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$702(Lcom/momo/xeengine/game/XEVirtualGameView;Z)Z

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 13
    .line 14
    iput-boolean v2, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->startCalled:Z

    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "\u672a\u77e5\u5f02\u5e38"

    .line 35
    .line 36
    invoke-interface {p0, v0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0, v0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    return-void
.end method

.method public onGLEnvCreatedFailed(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onGLEnvRelease()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/game/GameEngine;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    invoke-static {p0, p0, p0, p0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 13
    .line 14
    .line 15
    const/16 p0, 0x4100

    .line 16
    .line 17
    invoke-static {p0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onGLRenderSizeChanged(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->engine:Lcom/momo/xeengine/game/GameEngine;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/momo/xeengine/game/GameEngine;->getWindow()Lcom/momo/xeengine/xnative/IXWindow;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1, p1, p2}, Lcom/momo/xeengine/xnative/IXWindow;->SetSize(II)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, p1, p2}, Lcom/momo/xeengine/game/XEGameViewCallback;->onRenderSizeChanged(II)V

    .line 20
    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->startCalled:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1, v0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStart(Lcom/momo/xeengine/IXEngine;)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$MyRender;->startCalled:Z

    .line 37
    .line 38
    :cond_1
    invoke-virtual {v0}, Lcom/momo/xeengine/game/GameEngine;->getRenderMode()Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object p1, Lcom/momo/xeengine/game/GameEngine$RenderMode;->UserRequest:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 43
    .line 44
    if-ne p0, p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/momo/xeengine/game/GameEngine;->requestRender()V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method
