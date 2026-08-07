.class public final synthetic Ll/r1k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p2k0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;


# direct methods
.method public synthetic constructor <init>(Ll/p2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r1k0;->a:Ll/p2k0;

    iput-object p2, p0, Ll/r1k0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r1k0;->a:Ll/p2k0;

    iget-object p0, p0, Ll/r1k0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->i0(Ll/p2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Landroid/view/View;)V

    return-void
.end method
