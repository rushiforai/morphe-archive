.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/view/View;

.field public h:Lv/VPager;

.field public i:Ll/z1k0;

.field public j:I

.field public k:I

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a2k0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->j:I

    .line 6
    .line 7
    const/4 p1, -0x1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->k:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->j:I

    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->k:I

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;Ll/a2k0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->q0(I)V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->j:I

    return p0
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->k:I

    return p0
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->j:I

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->k:I

    return-void
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->s0()V

    return-void
.end method


# virtual methods
.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h2k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    instance-of v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->onDestroy()V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v1, 0x435a0000    # 218.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr v0, v1

    .line 18
    div-int/lit8 v0, v0, 0x2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v1, v0, v2, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 27
    .line 28
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 37
    .line 38
    const/high16 v1, 0x41f00000    # 30.0f

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    neg-int v1, v1

    .line 45
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->d:Lv/VDraweeView;

    .line 49
    .line 50
    sget-object v0, Ll/zft;->d:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "context_livingAct"

    .line 53
    .line 54
    invoke-static {v1, p0, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/f2k0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/f2k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ltz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    instance-of v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->s0(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string p0, "equipped"

    .line 32
    .line 33
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->status:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final synthetic q0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->u0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final r0(IZ)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->i:Ll/z1k0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p1k0;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->u0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final s0()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->r0(IZ)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->k:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->r0(IZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public t0(Ll/b2k0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->i:Ll/z1k0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/z1k0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/z1k0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->i:Ll/z1k0;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 13
    .line 14
    new-instance v1, Ll/s2k0;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/s2k0;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->X(ZLandroidx/viewpager/widget/ViewPager$k;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->i:Ll/z1k0;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->f:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/b2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->storeName:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/n1k0;->d(Ll/b2k0;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->l:Ljava/util/List;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->i:Ll/z1k0;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->l:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/p1k0;->q(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1}, Ll/n1k0;->f(Ll/b2k0;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 70
    .line 71
    new-instance v1, Ll/g2k0;

    .line 72
    .line 73
    invoke-direct {v1, p0, p1}, Ll/g2k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final u0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->r0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/e2k0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/e2k0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ltz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h:Lv/VPager;

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/i0k;->a(Landroidx/viewpager/widget/ViewPager;I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    instance-of v2, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->s0(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->l:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ll/a2k0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "unlocked"

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->status:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->v0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
