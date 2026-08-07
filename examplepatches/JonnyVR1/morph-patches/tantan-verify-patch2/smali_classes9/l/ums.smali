.class public final synthetic Ll/ums;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;)I

    move-result p0

    return p0
.end method
