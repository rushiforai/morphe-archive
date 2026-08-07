.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private voiceGiftWallBrief:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

.field private voiceGiftWallList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->voiceGiftWallList:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->voiceGiftWallBrief:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getVoiceGiftWallBrief()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->voiceGiftWallBrief:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceGiftWallList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->voiceGiftWallList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
