.class public Ll/j6v;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;",
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
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getCurrentTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->currentTime:J

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getEndTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->endTime:J

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getDefaultIcon()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->defaultIcon:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getPoolType()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->poolType:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getBuff()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buff:Z

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getBuffIcon()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffIcon:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getBuffText()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->buffText:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;->getTip()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->tip:Ljava/lang/String;

    .line 52
    .line 53
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voice.campaign.funFair.bottomEntrance"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/j6v;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/j6v;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceFunFairEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
