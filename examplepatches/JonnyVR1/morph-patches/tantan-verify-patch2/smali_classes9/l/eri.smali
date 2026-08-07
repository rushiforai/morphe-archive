.class public final synthetic Ll/eri;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/fri;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/fri;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eri;->a:Ll/fri;

    iput-object p2, p0, Ll/eri;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

    iput-object p3, p0, Ll/eri;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eri;->a:Ll/fri;

    iget-object v1, p0, Ll/eri;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

    iget-object p0, p0, Ll/eri;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    invoke-static {v0, v1, p0}, Ll/fri;->O3(Ll/fri;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V

    return-void
.end method
