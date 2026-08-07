.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->l(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;)Landroid/widget/ImageView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->f(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;)Landroid/widget/ImageView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;

    .line 8
    .line 9
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->m:Z

    .line 10
    .line 11
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;->g(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOptButton;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
