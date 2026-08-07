.class public Ll/a2k0;
.super Ll/i1k0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i1k0<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;Ljava/lang/String;Ll/o1k0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Ll/i1k0;-><init>(Ll/o1k0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a2k0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a2k0;->d:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->v6:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a2k0;->g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2k0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2k0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a2k0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->isEquipped()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerItemView;->o0(Ll/a2k0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
