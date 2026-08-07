.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public e:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public i:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;

.field public n:Ll/a2k0;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

.field public p:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private n0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->E1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/hre;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->shadowId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->e:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->shadowId:Ljava/lang/String;

    .line 31
    .line 32
    const/16 v1, 0x59d8

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/n1k0;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {p0, v0, v1, v2, v2}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n:Ll/a2k0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isEquipped()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isUnLocked()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n0()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->l0()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->k0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d2k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n:Ll/a2k0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isEquipped()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isUnLocked()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->j0()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final j0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final k0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->j:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    new-array v2, v1, [F

    .line 9
    .line 10
    fill-array-data v2, :array_0

    .line 11
    .line 12
    .line 13
    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v2, 0x5dc

    .line 20
    .line 21
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    const/4 v4, -0x1

    .line 25
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 26
    .line 27
    .line 28
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->j:Lv/VDraweeView;

    .line 29
    .line 30
    new-array v1, v1, [F

    .line 31
    .line 32
    fill-array-data v1, :array_1

    .line 33
    .line 34
    .line 35
    sget-object v6, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {v5, v6, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    .line 47
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    const/4 v3, 0x2

    .line 55
    new-array v3, v3, [Landroid/animation/Animator;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    aput-object v0, v3, v4

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    aput-object v1, v3, v0

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->q0()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f83d70a    # 1.03f
        0x3f800000    # 1.0f
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f83d70a    # 1.03f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final l0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->E1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/hre;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->meteorId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->i:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->meteorId:Ljava/lang/String;

    .line 31
    .line 32
    const/16 v1, 0x59d8

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/n1k0;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 44
    .line 45
    const/4 v1, -0x1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {p0, v0, v1, v2, v2}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final m0(Ll/a2k0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->name:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    const/high16 v1, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->g:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/high16 v2, 0x42ca0000    # 101.0f

    .line 25
    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    cmpl-float v0, v0, v2

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->g:Landroid/widget/TextView;

    .line 34
    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    const/high16 v0, 0x41300000    # 11.0f

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->g:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public o0(Ll/a2k0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n:Ll/a2k0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->getTargetRedLevel()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->f:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->status:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->getStatusBgCardUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v2, "context_livingAct"

    .line 26
    .line 27
    invoke-static {v2, v1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->j:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->hdUrl:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->m0(Ll/a2k0;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->k:Landroid/widget/TextView;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->purchasePrice:I

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->l:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->expiredTime:I

    .line 66
    .line 67
    if-lez v1, :cond_0

    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/4 v1, 0x0

    .line 72
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->l:Landroid/widget/TextView;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->expiredTime:I

    .line 82
    .line 83
    int-to-long v1, v1

    .line 84
    invoke-static {v1, v2}, Ll/kdu;->T(J)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->c(Ll/a2k0;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->j0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public r0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->p0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->i0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n:Ll/a2k0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "equipped"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "unlocked"

    .line 13
    .line 14
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->status:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->n:Ll/a2k0;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftSelectButton;->c(Ll/a2k0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
