.class public Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;
    }
.end annotation


# instance fields
.field public a:Landroidx/cardview/widget/CardView;

.field public b:Lv/AspectRatioViewPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->g:I

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->g:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->g:I

    return-void
.end method

.method private synthetic B(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

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

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->B(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->f:Ll/kcg0;

    return-object p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->g:I

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->act()Lcom/p1/mobile/android/app/Act;

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
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->getCount()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const/4 v0, 0x1

    .line 17
    if-le p2, v0, :cond_2

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->f:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->f:Ll/kcg0;

    .line 28
    .line 29
    invoke-interface {p2}, Ll/kcg0;->isUnsubscribed()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->f:Ll/kcg0;

    .line 36
    .line 37
    invoke-interface {p2}, Ll/kcg0;->unsubscribe()V

    .line 38
    .line 39
    .line 40
    :cond_1
    const-wide/16 v1, 0xbb8

    .line 41
    .line 42
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-static {v1, v2, p2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p2, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Ll/xy50;

    .line 65
    .line 66
    invoke-direct {p2, p0}, Ll/xy50;-><init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->f:Ll/kcg0;

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

    .line 80
    .line 81
    new-instance p2, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;

    .line 82
    .line 83
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;-><init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->e:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->c:Lv/VPagerCircleIndicator;

    .line 96
    .line 97
    if-gt p1, v0, :cond_3

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;-><init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->d:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->c:Lv/VPagerCircleIndicator;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->c:Lv/VPagerCircleIndicator;

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
    sget v1, Ll/c9c0;->z1:I

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
    invoke-static {p0, p1}, Ll/zy50;->a(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
