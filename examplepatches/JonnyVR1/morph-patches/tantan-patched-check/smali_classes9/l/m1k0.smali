.class public final synthetic Ll/m1k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

.field public final synthetic b:Ll/b2k0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/b2k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m1k0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    iput-object p2, p0, Ll/m1k0;->b:Ll/b2k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m1k0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    iget-object p0, p0, Ll/m1k0;->b:Ll/b2k0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    invoke-static {v0, p0, p1}, Ll/n1k0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/b2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)Ll/a2k0;

    move-result-object p0

    return-object p0
.end method
