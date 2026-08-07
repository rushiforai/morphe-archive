.class public Ll/b2k0;
.super Ll/i1k0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i1k0<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/o1k0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/i1k0;-><init>(Ll/o1k0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b2k0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i1k0;->a:Ll/o1k0;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->name:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Ll/i1k0;->b:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->w6:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b2k0;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2k0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftView;->c(Ll/b2k0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
