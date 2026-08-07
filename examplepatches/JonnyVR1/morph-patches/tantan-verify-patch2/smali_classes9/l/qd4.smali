.class public final synthetic Ll/qd4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qd4;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qd4;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
