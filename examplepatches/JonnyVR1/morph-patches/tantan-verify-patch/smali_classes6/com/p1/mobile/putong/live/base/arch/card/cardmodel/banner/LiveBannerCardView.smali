.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;
.super Lcom/p1/mobile/putong/live/base/view/RatioLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field private autoScrollSub:Ll/kcg0;

.field private cardContext:Ll/hk4;

.field private cardData:Ll/xwr;

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

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;Ll/xwr$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->i(Ll/xwr$a;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->k(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->l(Ljava/lang/Long;)V

    return-void
.end method

.method private h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->f()Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardData:Ll/xwr;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/xwr;->localAutoScroll:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->p()V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardContext:Ll/hk4;

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
    const-wide/16 v1, 0x8

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
    new-instance v1, Ll/ywr;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/ywr;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/zwr;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/zwr;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/axr;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/axr;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public final f()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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

.method public final synthetic i(Ll/xwr$a;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/xwr$a;->a()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/xwr$a;->c()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->q()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->autoScrollSub:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public n(Ll/hk4;Ll/xwr;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardData:Ll/xwr;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 12
    .line 13
    sget v0, Ll/jdc0;->T:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardContext:Ll/hk4;

    .line 24
    .line 25
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;

    .line 26
    .line 27
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;-><init>(Ll/xwr;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/bxr;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/bxr;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->v(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setPageShowListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->q()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ll/xwr;->b()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    const/4 v1, 0x2

    .line 68
    if-ge p1, v1, :cond_0

    .line 69
    .line 70
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    const/4 p1, 0x1

    .line 75
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->indicator:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 81
    .line 82
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->o()V

    .line 86
    .line 87
    .line 88
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
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->o()V

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

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardData:Ll/xwr;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xwr;->b()Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardData:Ll/xwr;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/xwr;->b()Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->cardData:Ll/xwr;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/xwr;->b()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveBannerCardView;->viewPager:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    check-cast p0, Ll/xwr$a;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xwr$a;->c()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

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
