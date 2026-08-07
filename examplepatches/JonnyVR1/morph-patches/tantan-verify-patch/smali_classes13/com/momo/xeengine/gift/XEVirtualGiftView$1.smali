.class Lcom/momo/xeengine/gift/XEVirtualGiftView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/game/XEGameViewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/gift/XEVirtualGiftView;->setupVirtualGameView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/XEVirtualGiftView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEngineDynamicLinkLibraryDownloadProcess(ID)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEGameViewCallback;->onEngineDynamicLinkLibraryDownloadProcess(ID)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onRenderSizeChanged(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/game/XEGameViewCallback;->onRenderSizeChanged(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onRenderViewCreate(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onStart(Lcom/momo/xeengine/IXEngine;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStart(Lcom/momo/xeengine/IXEngine;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onStartFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/gift/XEVirtualGiftView$1;->this$0:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->access$000(Lcom/momo/xeengine/gift/XEVirtualGiftView;)Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
