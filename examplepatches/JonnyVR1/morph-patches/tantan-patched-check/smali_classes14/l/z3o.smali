.class public Ll/z3o;
.super Ll/d8o;
.source "SourceFile"

# interfaces
.implements Ll/d6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d8o<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;",
        ">;",
        "Ll/d6m;"
    }
.end annotation


# instance fields
.field public b:Landroid/view/View;

.field public c:I


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d8o;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z3o;->b:Landroid/view/View;

    .line 5
    .line 6
    iput p2, p0, Ll/z3o;->c:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public K(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/z3o;->b:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;->b(Landroid/view/View;)V

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
    sget p0, Ll/xec0;->W:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/z3o;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z3o;->K(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedBannerAdView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
