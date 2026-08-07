.class public Ll/dvo0;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;",
        ">;"
    }
.end annotation


# instance fields
.field private final voiceFeedData:Ll/bwp;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/bwp;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/dvo0;->voiceFeedData:Ll/bwp;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/bwp;)Ll/dvo0;
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
    new-instance v0, Ll/dvo0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/dvo0;-><init>(Ll/hk4;Ll/bwp;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
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
    iget-object v0, p0, Ll/dvo0;->voiceFeedData:Ll/bwp;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/bwp;->a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/uxr;->cardContext:Ll/hk4;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/hk4;->b()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v0, p0, Ll/dvo0;->voiceFeedData:Ll/bwp;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/bwp;->f()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/uxr;->L(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Ll/bwp;->e()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/uxr;->L(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dvo0;->voiceFeedData:Ll/bwp;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->r0(Ll/bwp;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/dvo0;->voiceFeedData:Ll/bwp;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bwp;->e()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->j0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->n:I

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dvo0;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dvo0;->Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
