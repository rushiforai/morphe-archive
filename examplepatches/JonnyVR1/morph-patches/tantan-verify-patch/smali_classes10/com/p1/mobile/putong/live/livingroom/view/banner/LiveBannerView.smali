.class public Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field public a:Ll/kcg0;

.field public b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

.field public c:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

.field public d:Ll/ner;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/yec0;->n:I

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->h(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->g(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

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

.method private synthetic g(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->e()Z

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

.method private synthetic h(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->m()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->d:Ll/ner;

    .line 2
    .line 3
    const-wide/16 v1, 0x4

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
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

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
    new-instance v1, Ll/dxr;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/dxr;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/exr;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/exr;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/fxr;

    .line 42
    .line 43
    invoke-direct {v2}, Ll/fxr;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->a:Ll/kcg0;

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Ll/ner;Ljava/util/List;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->d:Ll/ner;

    .line 2
    .line 3
    sget p1, Ll/mdc0;->A4:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 12
    .line 13
    sget p1, Ll/mdc0;->J2:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->c:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 22
    .line 23
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-direct {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;-><init>(Ljava/util/List;Z)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/gxr;

    .line 30
    .line 31
    invoke-direct {v1, p3}, Ll/gxr;-><init>(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->v(Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 38
    .line 39
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setAdapter(Ll/cf60;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->setPageShowListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->c:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 57
    .line 58
    const/4 p3, 0x0

    .line 59
    const/4 v1, 0x2

    .line 60
    if-ge p1, v1, :cond_0

    .line 61
    .line 62
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->c:Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;

    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LoopViewPagerIndicator;->e(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->l()V

    .line 77
    .line 78
    .line 79
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
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->l()V

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
