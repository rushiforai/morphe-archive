.class public Ll/wwr;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;",
        ">;"
    }
.end annotation


# static fields
.field public static final AUTO_SCROLL_TIME:I = 0x8


# instance fields
.field private final cardData:Ll/xwr;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/xwr;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/wwr;->cardData:Ll/xwr;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/xwr;)Ll/wwr;
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
    new-instance v0, Ll/wwr;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/wwr;-><init>(Ll/hk4;Ll/xwr;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public bridge synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wwr;->Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uxr;->cardContext:Ll/hk4;

    .line 5
    .line 6
    iget-object p0, p0, Ll/wwr;->cardData:Ll/xwr;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->n(Ll/hk4;Ll/xwr;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/uxr;->I(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->m()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwr;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->d:I

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wwr;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wwr;->R(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
