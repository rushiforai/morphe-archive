.class public Ll/ayu;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;",
        ">;"
    }
.end annotation


# static fields
.field private static final SPAN_COUNT:I = 0x3


# instance fields
.field private final cardData:Ll/byu;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/byu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/ayu;->cardData:Ll/byu;

    .line 5
    .line 6
    return-void
.end method

.method public static P(Ll/hk4;Ll/byu;)Ll/ayu;
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
    new-instance v0, Ll/ayu;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/ayu;-><init>(Ll/hk4;Ll/byu;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ayu;->cardData:Ll/byu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/byu;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/uxr;->N(Ll/j80;Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

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
    iget-object v0, p0, Ll/ayu;->cardData:Ll/byu;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/byu;->a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ayu;->cardData:Ll/byu;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/byu;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

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

.method public O(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ayu;->cardData:Ll/byu;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->b(Ll/byu;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ayu;->O(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ayu;->Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
