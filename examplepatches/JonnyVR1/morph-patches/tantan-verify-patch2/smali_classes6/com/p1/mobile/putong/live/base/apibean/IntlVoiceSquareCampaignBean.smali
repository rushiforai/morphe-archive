.class public Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceSquareCampaignBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceSquareCampaignBean$IntlVoiceSquareCampaignData;
    }
.end annotation


# instance fields
.field public currentTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "currentTime"
    .end annotation
.end field

.field public voiceRecommendPageCampaign:Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceSquareCampaignBean$IntlVoiceSquareCampaignData;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voiceRecommendPageCampaign"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
