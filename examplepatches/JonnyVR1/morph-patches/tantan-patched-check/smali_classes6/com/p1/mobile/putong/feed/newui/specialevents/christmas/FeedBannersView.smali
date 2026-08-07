.class public Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

.field public e:Ljava/lang/String;

.field public f:Ll/kcg0;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Material;",
            ">;"
        }
    .end annotation
.end field


# direct methods
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

    .line 16
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f(Landroid/content/Context;Ljava/lang/String;)V

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
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->g:Ljava/util/List;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f(Landroid/content/Context;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 18
    invoke-direct {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->g(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->e()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jqg;->b(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e()Lcom/p1/mobile/android/app/Act;
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

.method public final f(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->j(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c:Lv/VPagerCircleIndicator;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p2, v0, v1}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c:Lv/VPagerCircleIndicator;

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    sget v0, Ll/k9c0;->p0:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p2, p1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c:Lv/VPagerCircleIndicator;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget v0, Ll/k9c0;->v:I

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 71
    .line 72
    const/4 p2, 0x0

    .line 73
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 77
    .line 78
    const/4 p2, 0x2

    .line 79
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 83
    .line 84
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$a;

    .line 85
    .line 86
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, p2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 93
    .line 94
    const/4 p1, 0x1

    .line 95
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic g(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

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

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/util/List;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Material;",
            ">;J)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->e:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->i(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->d:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->getCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-le v0, v2, :cond_1

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    cmp-long v0, p3, v3

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f:Ll/kcg0;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f:Ll/kcg0;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f:Ll/kcg0;

    .line 46
    .line 47
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 48
    .line 49
    .line 50
    :cond_0
    const-wide/16 v3, 0x3e8

    .line 51
    .line 52
    mul-long/2addr p3, v3

    .line 53
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 54
    .line 55
    invoke-static {p3, p4, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p3}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 64
    .line 65
    .line 66
    move-result-object p4

    .line 67
    invoke-virtual {p3, p4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p3, Ll/hqg;

    .line 76
    .line 77
    invoke-direct {p3, p0}, Ll/hqg;-><init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->f:Ll/kcg0;

    .line 89
    .line 90
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c:Lv/VPagerCircleIndicator;

    .line 95
    .line 96
    if-gt p1, v2, :cond_2

    .line 97
    .line 98
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public i(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le v0, p1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p2, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Material;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Material;->resourceID:Ljava/lang/String;

    .line 23
    .line 24
    const-string p1, "activity_id"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_moment_activity_banner"

    .line 35
    .line 36
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b:Lv/VPager;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
