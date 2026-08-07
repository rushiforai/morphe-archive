.class public Ll/cfu;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/triplecard/LiveTriplePanelCardView;",
        ">;"
    }
.end annotation


# instance fields
.field private final cardData:Ll/rbt;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/rbt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/cfu;->cardData:Ll/rbt;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/a4s;)Ll/cfu;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/rbt;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/cfu;

    .line 6
    .line 7
    check-cast p1, Ll/rbt;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/cfu;-><init>(Ll/hk4;Ll/rbt;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfu;->cardData:Ll/rbt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rbt;->c()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public J(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/uxr;->J(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Ll/cfu;->cardData:Ll/rbt;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rbt;->a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/cfu;->cardData:Ll/rbt;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/rbt;->c()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/triplecard/LiveTriplePanelCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cfu;->cardData:Ll/rbt;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/triplecard/LiveTriplePanelCardView;->b(Ll/rbt;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/triplecard/LiveTriplePanelCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cfu;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/triplecard/LiveTriplePanelCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
