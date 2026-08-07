.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

.field public e:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u1k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->onDestroy()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->onDestroy()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i(Ll/b2k0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/n1k0;->g(Ll/b2k0;)Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    neg-int v0, v0

    .line 11
    int-to-float v0, v0

    .line 12
    const/4 v1, 0x2

    .line 13
    new-array v2, v1, [F

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    aput v4, v2, v3

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    aput v0, v2, v5

    .line 21
    .line 22
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 23
    .line 24
    invoke-static {p1, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-wide/16 v6, 0x12c

    .line 29
    .line 30
    invoke-virtual {p1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 34
    .line 35
    invoke-static {}, Ll/bnl0;->y0()I

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    int-to-float v8, v8

    .line 40
    new-array v9, v1, [F

    .line 41
    .line 42
    aput v8, v9, v3

    .line 43
    .line 44
    aput v4, v9, v5

    .line 45
    .line 46
    invoke-static {v2, v0, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 54
    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    invoke-virtual {v2, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    new-array v1, v1, [Landroid/animation/Animator;

    .line 70
    .line 71
    aput-object p1, v1, v3

    .line 72
    .line 73
    aput-object v0, v1, v5

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e:Landroid/animation/AnimatorSet;

    .line 94
    .line 95
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView$a;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;

    .line 14
    .line 15
    return-void
.end method
