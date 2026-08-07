.class public Ll/dfu;
.super Ll/uxr;
.source "SourceFile"

# interfaces
.implements Ll/d6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;",
        ">;",
        "Ll/d6m;"
    }
.end annotation


# instance fields
.field private final cardData:Ll/efu;

.field private final compositeSubscription:Ll/ft5;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/efu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/dfu;->compositeSubscription:Ll/ft5;

    .line 10
    .line 11
    iput-object p2, p0, Ll/dfu;->cardData:Ll/efu;

    .line 12
    .line 13
    return-void
.end method

.method public static O(Ll/hk4;Ll/efu;)Ll/dfu;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/dfu;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/dfu;-><init>(Ll/hk4;Ll/efu;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/uxr;->J(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dfu;->cardData:Ll/efu;

    .line 5
    .line 6
    iget-object v1, p0, Ll/uxr;->cardContext:Ll/hk4;

    .line 7
    .line 8
    iget-object v1, v1, Ll/hk4;->lp:Ll/ner;

    .line 9
    .line 10
    iget-object p0, p0, Ll/dfu;->compositeSubscription:Ll/ft5;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;->a(Ll/efu;Ll/ner;Ll/ft5;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/dfu;->compositeSubscription:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->i(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dfu;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dfu;->Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
