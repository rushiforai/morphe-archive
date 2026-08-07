.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public callRewardPoint:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;",
            ">;"
        }
    .end annotation
.end field

.field public rewardPoint:D


# direct methods
.method public constructor <init>(D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;->rewardPoint:D

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public setCallRewardPoint(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/RewardPointMsg;->callRewardPoint:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
