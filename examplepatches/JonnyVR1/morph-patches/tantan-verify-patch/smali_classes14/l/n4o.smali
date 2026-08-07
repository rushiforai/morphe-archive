.class public Ll/n4o;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:I

.field public c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/view/View;ILcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n4o;->a:Landroid/view/View;

    .line 5
    .line 6
    iput-object p3, p0, Ll/n4o;->c:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-static {p2}, Ll/n4o;->J(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Ll/n4o;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public static J(I)I
    .locals 3

    .line 1
    sget v0, Ll/qa00;->h:I

    .line 2
    .line 3
    if-gtz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p0, v0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v2, p0, 0x1

    .line 16
    .line 17
    mul-int/2addr v2, v0

    .line 18
    sub-int/2addr v1, v2

    .line 19
    div-int/2addr v1, p0

    .line 20
    add-int/2addr v1, v0

    .line 21
    return v1
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/n4o;->b:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Ll/n4o;->b:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    new-array v0, v0, [Landroid/view/View;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aput-object p1, v0, v1

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    sget p0, Ll/qa00;->i:I

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/n4o;->H(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/n4o;->a:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;->b(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n4o;->I(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->X:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n4o;->K(Lcom/p1/mobile/putong/live/external/intl/livesquare/admob/IntlLiveSquareFeedNativeAdView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
