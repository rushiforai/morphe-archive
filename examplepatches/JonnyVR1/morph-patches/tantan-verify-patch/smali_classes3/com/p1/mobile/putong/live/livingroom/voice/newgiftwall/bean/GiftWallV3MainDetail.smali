.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# instance fields
.field public currentTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "currentTime"
    .end annotation
.end field

.field public level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "level"
    .end annotation
.end field

.field public ownedGiftCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ownedGiftCount"
    .end annotation
.end field

.field public rulePageSchema:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "rulePageSchema"
    .end annotation
.end field

.field public showWeekStarHale:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "showWeekStarHale"
    .end annotation
.end field

.field public tabs:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tabs"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftTab;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "title"
    .end annotation
.end field

.field public totalGiftCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "totalGiftCount"
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user"
    .end annotation
.end field

.field public weekStarGiftTab:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "weekStarGiftTab"
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
