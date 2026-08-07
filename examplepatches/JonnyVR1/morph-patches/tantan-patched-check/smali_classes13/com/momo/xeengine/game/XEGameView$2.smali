.class Lcom/momo/xeengine/game/XEGameView$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/game/XEGameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/game/XEGameView;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/xeengine/game/XEGameView;->access$100(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->access$100(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p3, p4}, Lcom/momo/xeengine/game/XEngineRenderThread;->onSizeChanged(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, v0, v0}, Lcom/momo/xeengine/game/XEGameView;->access$000(Lcom/momo/xeengine/game/XEGameView;Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/xeengine/game/XEGameView;->access$100(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$2;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->access$100(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEngineRenderThread;->destroyNativeWindow()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
