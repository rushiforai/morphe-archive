.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public e:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;)V

    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w1k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->platformPicId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->k0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final k0(Ljava/lang/String;)V
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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/hre;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->e:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/16 v0, 0x59d8

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/n1k0;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView$a;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, -0x1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, p1, p0, v2, v1}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->getTargetRedLevel()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->i:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->hdUrl:Ljava/lang/String;

    .line 8
    .line 9
    const-string v3, "context_livingAct"

    .line 10
    .line 11
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->j:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;->resources:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResourceInfo;->namePicUrl:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "context_single_room"

    .line 21
    .line 22
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->k:Landroid/widget/TextView;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->n:Landroid/widget/TextView;

    .line 33
    .line 34
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->expiredTime:I

    .line 35
    .line 36
    if-lez v2, :cond_0

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v2, 0x0

    .line 41
    :goto_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->n:Landroid/widget/TextView;

    .line 45
    .line 46
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->expiredTime:I

    .line 47
    .line 48
    int-to-long v2, v2

    .line 49
    invoke-static {v2, v3}, Ll/kdu;->T(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->m:Landroid/widget/TextView;

    .line 57
    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->purchasePrice:I

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/v1k0;

    .line 68
    .line 69
    invoke-direct {p1, p0, v0}, Ll/v1k0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftResLevel;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
