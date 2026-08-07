.class public final synthetic Ll/bdt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView$a;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bdt;->a:Ll/y20;

    iput-object p2, p0, Ll/bdt;->b:Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bdt;->a:Ll/y20;

    iget-object p0, p0, Ll/bdt;->b:Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->q(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;I)V

    return-void
.end method
