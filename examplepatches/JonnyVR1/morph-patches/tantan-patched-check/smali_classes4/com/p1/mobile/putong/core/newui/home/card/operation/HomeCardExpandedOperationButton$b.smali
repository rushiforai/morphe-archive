.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, p2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;)Landroid/widget/ImageView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
