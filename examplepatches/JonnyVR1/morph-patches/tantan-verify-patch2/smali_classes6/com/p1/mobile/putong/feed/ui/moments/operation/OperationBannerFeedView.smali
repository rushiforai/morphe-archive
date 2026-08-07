.class public Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;
    }
.end annotation


# instance fields
.field public a:Landroidx/cardview/widget/CardView;

.field public b:Lv/AspectRatioViewPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/kcg0;

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->g:I

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->g:I

    return-void
.end method

.method private synthetic B(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->d:Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    add-int/2addr p1, v1

    .line 29
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->B(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->f:Ll/kcg0;

    return-object p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->g:I

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public C(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->d:Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x1

    .line 10
    if-le p2, v0, :cond_1

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->f:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->f:Ll/kcg0;

    .line 21
    .line 22
    invoke-interface {p2}, Ll/kcg0;->isUnsubscribed()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->f:Ll/kcg0;

    .line 29
    .line 30
    invoke-interface {p2}, Ll/kcg0;->unsubscribe()V

    .line 31
    .line 32
    .line 33
    :cond_0
    const-wide/16 v1, 0xbb8

    .line 34
    .line 35
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 36
    .line 37
    invoke-static {v1, v2, p2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p2, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Ll/uy50;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/uy50;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->f:Ll/kcg0;

    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 73
    .line 74
    new-instance p2, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$a;

    .line 75
    .line 76
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->e:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->c:Lv/VPagerCircleIndicator;

    .line 89
    .line 90
    if-gt p1, v0, :cond_2

    .line 91
    .line 92
    const/4 p1, 0x0

    .line 93
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->d:Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->d:Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView$b;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->c:Lv/VPagerCircleIndicator;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->b:Lv/AspectRatioViewPager;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v0, v1, v2}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->c:Lv/VPagerCircleIndicator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget v1, Ll/k9c0;->V:I

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {v0, p0}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wy50;->a(Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
