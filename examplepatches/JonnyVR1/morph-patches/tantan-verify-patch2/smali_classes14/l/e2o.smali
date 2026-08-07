.class public Ll/e2o;
.super Ll/d8o;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
.implements Ll/ztf0;
.implements Ll/d6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d8o<",
        "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;",
        ">;",
        "Landroidx/viewpager/widget/ViewPager$j;",
        "Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;",
        "Ll/ztf0;",
        "Ll/d6m;"
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;

.field public d:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

.field public e:Ll/kcg0;

.field public f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

.field public g:I

.field public h:I

.field public i:Z


# direct methods
.method public constructor <init>(ILcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V
    .locals 1
    .param p2    # Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d8o;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/e2o;->h:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/e2o;->i:Z

    .line 9
    .line 10
    iput-object p2, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 11
    .line 12
    iput-object p3, p0, Ll/e2o;->d:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 13
    .line 14
    iput p1, p0, Ll/e2o;->g:I

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic K(Ll/e2o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2o;->V(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L(Ll/e2o;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2o;->T(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N(Ll/e2o;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2o;->U(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic O(Ll/e2o;Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2o;->S(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e2o;->W()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public Q(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/d2o;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/d2o;-><init>(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v3, "banner_id"

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "banner_type"

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerType:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p0, p0, Ll/e2o;->h:I

    .line 39
    .line 40
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v3, "index"

    .line 45
    .line 46
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v3, "sub_index"

    .line 51
    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v2, p1, p0, v0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "e_live_banner"

    .line 65
    .line 66
    invoke-static {p1, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final R()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {p0, v0}, Ll/ynp0;->u(Landroid/view/View;Z)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/high16 v2, 0x3f000000    # 0.5f

    .line 21
    .line 22
    cmpl-float p0, p0, v2

    .line 23
    .line 24
    if-ltz p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    :goto_0
    return v1
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2o;->Q(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/e2o;->c:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;->t3(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic T(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2o;->d:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 2
    .line 3
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0
.end method

.method public final synthetic U(Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    rem-int/2addr p1, v0

    .line 27
    iget-object p0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->l0(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic V(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final W()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    add-int/2addr v0, v1

    .line 9
    if-lt v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 25
    .line 26
    iget-object v2, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 43
    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->id:Ljava/lang/String;

    .line 45
    .line 46
    const-string v4, "banner_id"

    .line 47
    .line 48
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "banner_type"

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v4, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget p0, p0, Ll/e2o;->h:I

    .line 61
    .line 62
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v4, "index"

    .line 67
    .line 68
    invoke-static {v4, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v4, "sub_index"

    .line 73
    .line 74
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v4, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {v3, v1, p0, v0}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v0, "e_live_banner"

    .line 87
    .line 88
    invoke-static {v0, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;

    .line 5
    .line 6
    iget-object v1, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;-><init>(Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/z1o;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/z1o;-><init>(Ll/e2o;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a;->w(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;->a:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 20
    .line 21
    iput-object v1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setPageShowListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    const/4 v3, 0x2

    .line 48
    if-ge v0, v3, :cond_0

    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    const/4 v0, 0x1

    .line 55
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 59
    .line 60
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 61
    .line 62
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/e2o;->Z()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/e2o;->e:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final Z()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/e2o;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/e2o;->e:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/e2o;->f:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/e2o;->c0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e2o;->c:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;

    .line 2
    .line 3
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

.method public b0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/e2o;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public final c0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2o;->d:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 2
    .line 3
    const-wide/16 v1, 0x8

    .line 4
    .line 5
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/a2o;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/a2o;-><init>(Ll/e2o;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/b2o;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/b2o;-><init>(Ll/e2o;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/c2o;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/c2o;-><init>(Ll/e2o;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Ll/e2o;->e:Ll/kcg0;

    .line 55
    .line 56
    return-void
.end method

.method public getOrder()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2o;->b:Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->rowIndex:I

    .line 4
    .line 5
    return p0
.end method

.method public j(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e2o;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/e2o;->W()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->T:I

    .line 2
    .line 3
    return p0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/e2o;->Z()V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e2o;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2o;->X(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2o;->Y(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareBannerView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
