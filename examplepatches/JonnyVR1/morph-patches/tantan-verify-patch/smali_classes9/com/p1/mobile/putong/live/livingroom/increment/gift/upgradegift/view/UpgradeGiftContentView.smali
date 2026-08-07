.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lcom/google/android/material/tabs/TabLayout;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/FixedScrollView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

.field public i:Landroid/view/View;

.field public j:Landroid/widget/FrameLayout;

.field public k:Ll/p2k0;

.field public l:Ll/c2k0;

.field public m:Ll/o1k0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->m:Ll/o1k0;

    .line 10
    .line 11
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

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->m:Ll/o1k0;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->m:Ll/o1k0;

    return-void
.end method

.method public static synthetic h0(Ll/p2k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p2k0;->R3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ll/p2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftRule;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftRule;->entrance:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/p2k0;->Z3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;)Ll/p2k0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->k:Ll/p2k0;

    return-object p0
.end method


# virtual methods
.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s1k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/i1k0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->f:Lcom/google/android/material/tabs/TabLayout;

    .line 10
    .line 11
    invoke-virtual {v3, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Ll/i1k0;

    .line 22
    .line 23
    iget-object v4, v4, Ll/i1k0;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 v0, 0x1

    .line 36
    if-le p1, v0, :cond_2

    .line 37
    .line 38
    const/4 v1, -0x1

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->f:Lcom/google/android/material/tabs/TabLayout;

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/p2k0;)V
    .locals 3

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->k:Ll/p2k0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->d:Landroid/view/View;

    .line 4
    .line 5
    new-instance v1, Ll/q1k0;

    .line 6
    .line 7
    invoke-direct {v1, p2}, Ll/q1k0;-><init>(Ll/p2k0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->slotGiftInfos:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->l:Ll/c2k0;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    new-instance v1, Ll/c2k0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/c2k0;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->l:Ll/c2k0;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->f:Lcom/google/android/material/tabs/TabLayout;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->i:Landroid/view/View;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftRule;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftRule;->entrance:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    xor-int/2addr v0, v2

    .line 59
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->i:Landroid/view/View;

    .line 63
    .line 64
    new-instance v1, Ll/r1k0;

    .line 65
    .line 66
    invoke-direct {v1, p2, p1}, Ll/r1k0;-><init>(Ll/p2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->m:Ll/o1k0;

    .line 73
    .line 74
    invoke-static {p1, p2}, Ll/n1k0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/o1k0;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->l:Ll/c2k0;

    .line 79
    .line 80
    invoke-virtual {p2, p1}, Ll/p1k0;->q(Ljava/util/List;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->l0(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->j:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    const/4 p1, 0x0

    .line 89
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->j:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public n0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o0(Ll/a2k0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/UnScrollVPager;

    .line 17
    .line 18
    if-ge v2, v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    instance-of v3, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->b()V

    .line 31
    .line 32
    .line 33
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->f:Lcom/google/android/material/tabs/TabLayout;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/FixedScrollView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/bnl0;->w0()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    const v1, 0x3f333333    # 0.7f

    .line 19
    .line 20
    .line 21
    mul-float/2addr v0, v1

    .line 22
    float-to-int v0, v0

    .line 23
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 24
    .line 25
    return-void
.end method
