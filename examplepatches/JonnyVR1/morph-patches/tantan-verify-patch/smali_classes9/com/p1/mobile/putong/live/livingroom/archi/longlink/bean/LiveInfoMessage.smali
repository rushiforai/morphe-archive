.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public callRewardPoint:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;"
        }
    .end annotation
.end field

.field public memberCount:D

.field public multiCallRewardPoint:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;"
        }
    .end annotation
.end field

.field public rewardPoint:D

.field public type:Ljava/lang/String;

.field public updateField:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;


# direct methods
.method public constructor <init>(Ljava/lang/String;DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->type:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->memberCount:D

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->rewardPoint:D

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public isAllChange()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->updateField:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isRewardChange()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->updateField:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public setCallRewardPoint(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->callRewardPoint:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMultiCallRewardPoint(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->multiCallRewardPoint:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setUpdateFile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->updateField:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;

    .line 2
    .line 3
    return-object p0
.end method
