.class public Ll/dfs;
.super Ll/uxr;
.source "SourceFile"

# interfaces
.implements Ll/gpl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;",
        ">;",
        "Ll/gpl<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/byu;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/byu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/dfs;->a:Ll/byu;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/byu;)Ll/dfs;
    .locals 1

    .line 1
    new-instance v0, Ll/dfs;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dfs;-><init>(Ll/hk4;Ll/byu;)V

    .line 4
    .line 5
    .line 6
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
    iget-object v0, p0, Ll/dfs;->a:Ll/byu;

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
    iget-object p1, p0, Ll/dfs;->a:Ll/byu;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/byu;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/uxr;->L(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dfs;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->i()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/dfs;->a:Ll/byu;

    .line 5
    .line 6
    iget-object p0, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a()F
    .locals 0

    .line 1
    const/high16 p0, 0x42c80000    # 100.0f

    .line 2
    .line 3
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dfs;->a:Ll/byu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public bridge synthetic g(Landroid/view/View;Z)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dfs;->P(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->h:I

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
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dfs;->Q(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dfs;->R(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
