.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;
    }
.end annotation


# instance fields
.field public gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gift"
    .end annotation
.end field

.field public grabRankGiftNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "grabRankGiftNum"
    .end annotation
.end field

.field public grabRankPrice:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "grabRankPrice"
    .end annotation
.end field

.field public leaderboardThreshold:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "leaderboardThreshold"
    .end annotation
.end field

.field public leaderboards:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "leaderboards"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public meUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "meUser"
    .end annotation
.end field

.field public myLeaderboard:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "myLeaderboard"
    .end annotation
.end field

.field public top1Rewards:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "top1Rewards"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;",
            ">;"
        }
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user"
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
