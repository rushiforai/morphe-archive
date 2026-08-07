.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t2k0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->f()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->onDestroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(Ll/b2k0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->i(Ll/b2k0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->t0(Ll/b2k0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftEquipContainerView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
