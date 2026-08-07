.class Lcom/momo/xeengine/game/XEVirtualGameView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/game/XEVirtualGameView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/game/XEVirtualGameView;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/game/XEVirtualGameView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

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

.method public onProcess(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEGameViewCallback;->onEngineDynamicLinkLibraryDownloadProcess(ID)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onSuccess()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$000(Lcom/momo/xeengine/game/XEVirtualGameView;)Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$000(Lcom/momo/xeengine/game/XEVirtualGameView;)Landroid/view/Surface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$100(Lcom/momo/xeengine/game/XEVirtualGameView;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object p0, p0, Lcom/momo/xeengine/game/XEVirtualGameView$1;->this$0:Lcom/momo/xeengine/game/XEVirtualGameView;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$200(Lcom/momo/xeengine/game/XEVirtualGameView;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {v1, v0, v2, p0}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$300(Lcom/momo/xeengine/game/XEVirtualGameView;Ljava/lang/Object;II)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {v1}, Lcom/momo/xeengine/game/XEVirtualGameView;->access$400(Lcom/momo/xeengine/game/XEVirtualGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "Surface\u672a\u8bbe\u7f6e"

    .line 36
    .line 37
    invoke-interface {p0, v0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
