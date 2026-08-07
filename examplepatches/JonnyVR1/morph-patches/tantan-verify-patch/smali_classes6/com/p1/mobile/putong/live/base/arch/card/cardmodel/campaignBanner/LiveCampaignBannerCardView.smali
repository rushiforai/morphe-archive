.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;
.super Lcom/p1/mobile/putong/live/base/view/RatioLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field private autoScrollSub:Ll/kcg0;

.field private cardContext:Ll/hk4;

.field private cardData:Ll/o3s;

.field private indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

.field private viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RatioLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/RatioLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/RatioLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;Ll/o3s$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->i(Ll/o3s$a;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->k(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->l(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private f()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    const v2, 0x3dcccccd    # 0.1f

    .line 21
    .line 22
    .line 23
    cmpl-float p0, p0, v2

    .line 24
    .line 25
    if-ltz p0, :cond_1

    .line 26
    .line 27
    return v0

    .line 28
    :cond_1
    :goto_0
    return v1
.end method

.method private g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorCount()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    rem-int/2addr v0, v1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->l0(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method private h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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

.method private synthetic k(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->f()Z

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

.method private synthetic l(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardData:Ll/o3s;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/o3s;->localAutoScroll:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->p()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method private p()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardContext:Ll/hk4;

    .line 2
    .line 3
    iget-object v0, v0, Ll/hk4;->lp:Ll/ner;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-wide/16 v1, 0x6

    .line 9
    .line 10
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/j3s;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/j3s;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/k3s;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/k3s;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/l3s;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/l3s;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 60
    .line 61
    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardData:Ll/o3s;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/o3s;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    add-int/2addr v0, v1

    .line 20
    if-lt v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardData:Ll/o3s;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/o3s;->a()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-le v0, v1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardData:Ll/o3s;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/o3s;->a()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/o3s$a;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/o3s$a;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public final synthetic i(Ll/o3s$a;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/o3s$a;->a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/o3s$a;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->q()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public n(Ll/hk4;Ll/o3s;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardData:Ll/o3s;

    .line 2
    .line 3
    sget v0, Ll/jdc0;->u0:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 12
    .line 13
    const/high16 v1, 0x41200000    # 10.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 20
    .line 21
    .line 22
    sget v0, Ll/jdc0;->T:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->cardContext:Ll/hk4;

    .line 33
    .line 34
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;

    .line 35
    .line 36
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;-><init>(Ll/o3s;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/m3s;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/m3s;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;->v(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a$a;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setPageShowListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->q()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, Ll/o3s;->a()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    const/4 v1, 0x2

    .line 77
    if-ge p1, v1, :cond_0

    .line 78
    .line 79
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    const/4 p1, 0x1

    .line 84
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 88
    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 90
    .line 91
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->o()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/LiveCampaignBannerCardView;->o()V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    return-void
.end method
