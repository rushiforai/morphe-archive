.class public Ll/yfs;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;",
        ">;"
    }
.end annotation


# instance fields
.field private final cardData:Ll/zfs;

.field private final compositeSubscription:Ll/ft5;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/zfs;)V
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
    iput-object p1, p0, Ll/yfs;->compositeSubscription:Ll/ft5;

    .line 10
    .line 11
    iput-object p2, p0, Ll/yfs;->cardData:Ll/zfs;

    .line 12
    .line 13
    return-void
.end method

.method public static O(Ll/hk4;Ll/zfs;)Ll/yfs;
    .locals 1

    .line 1
    new-instance v0, Ll/yfs;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/yfs;-><init>(Ll/hk4;Ll/zfs;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfs;->cardData:Ll/zfs;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zfs;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
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
    iget-object v0, p0, Ll/yfs;->cardData:Ll/zfs;

    .line 9
    .line 10
    iget-object v0, v0, Ll/zfs;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/yfs;->cardData:Ll/zfs;

    .line 16
    .line 17
    iget-object p0, p0, Ll/zfs;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yfs;->cardData:Ll/zfs;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->k0(Ll/zfs;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yfs;->compositeSubscription:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->k:I

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yfs;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yfs;->Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
