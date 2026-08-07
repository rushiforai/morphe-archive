.class public Ll/kav;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getIsCrazyNow()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->isCrazyNow:Z

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getCrazyIcon()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->crazyIcon:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getCurrentTime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getEndTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getDefaultIcon()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->defaultIcon:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;->getPoolType()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->poolType:Ljava/lang/String;

    .line 40
    .line 41
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voice.campaign.luckyParadise.bottomEntrance"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kav;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kav;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$LuckyParadiseEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
