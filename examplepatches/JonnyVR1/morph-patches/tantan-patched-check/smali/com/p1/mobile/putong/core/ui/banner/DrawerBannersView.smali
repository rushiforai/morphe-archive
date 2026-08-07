.class public Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;
.super Lv/VCard;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

.field public b:Lv/AspectRatioViewPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

.field public e:Lcom/p1/mobile/putong/data/Banners;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/kcg0;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    const/4 v0, -0x1

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-direct {p0, p1, p2, p3}, Lv/VCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->h:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->n(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/putong/data/Banners;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e:Lcom/p1/mobile/putong/data/Banners;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->f:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->h:I

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->g:Ll/kcg0;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->h:I

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->m()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method private m()Lcom/p1/mobile/android/app/Act;
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


# virtual methods
.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rde;->a(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

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

.method public o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Banners;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e:Lcom/p1/mobile/putong/data/Banners;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-le v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 15
    .line 16
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/BannerScroll;->auto:Z

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/data/BannerScroll;->interval:F

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    cmpl-float v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->g:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->g:Ll/kcg0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->g:Ll/kcg0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 49
    .line 50
    iget-object p2, p2, Lcom/p1/mobile/putong/data/BannerAction;->scroll:Lcom/p1/mobile/putong/data/BannerScroll;

    .line 51
    .line 52
    iget p2, p2, Lcom/p1/mobile/putong/data/BannerScroll;->interval:F

    .line 53
    .line 54
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 55
    .line 56
    mul-float/2addr p2, v0

    .line 57
    float-to-long v2, p2

    .line 58
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    .line 60
    invoke-static {v2, v3, p2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/pde;

    .line 81
    .line 82
    invoke-direct {p2, p0}, Ll/pde;-><init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->g:Ll/kcg0;

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

    .line 96
    .line 97
    new-instance p2, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$a;

    .line 98
    .line 99
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$a;-><init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->e:Lcom/p1/mobile/putong/data/Banners;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BannerContent;->banners:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->c:Lv/VPagerCircleIndicator;

    .line 116
    .line 117
    if-gt p1, v1, :cond_2

    .line 118
    .line 119
    const/4 p1, 0x0

    .line 120
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 130
    .line 131
    .line 132
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;-><init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->c:Lv/VPagerCircleIndicator;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->b:Lv/AspectRatioViewPager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->c:Lv/VPagerCircleIndicator;

    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->m()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/c9c0;->z1:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public setClickAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->f:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;->d:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
