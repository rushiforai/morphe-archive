.class public final synthetic Ll/f2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2k0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2k0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    check-cast p1, Ll/a2k0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftPagerView;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;Ll/a2k0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
