.class public final synthetic Ll/rd4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rd4;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    iput-object p2, p0, Ll/rd4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rd4;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    iget-object p0, p0, Ll/rd4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
