.class Lcom/momo/xeengine/game/XEGameView$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;


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
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->access$300(Lcom/momo/xeengine/game/XEGameView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->access$400(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "\u52a8\u6001\u5e93\u4e0b\u8f7d\u9519\u8bef:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onProcess(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->access$400(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/momo/xeengine/game/XEGameView;->access$200(Lcom/momo/xeengine/game/XEGameView;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView$3;->this$0:Lcom/momo/xeengine/game/XEGameView;

    .line 16
    .line 17
    new-instance v1, Lcom/momo/xeengine/game/a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/momo/xeengine/game/a;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {v1}, Lcom/momo/xeengine/game/XEGameView;->access$300(Lcom/momo/xeengine/game/XEGameView;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
