.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n(Ll/pf60;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x1

    .line 8
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 12
    .line 13
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->m:Z

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->l(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->h(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->k(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton$a;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
