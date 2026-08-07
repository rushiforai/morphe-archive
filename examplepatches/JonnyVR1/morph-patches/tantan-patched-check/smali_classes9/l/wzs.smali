.class public Ll/wzs;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "no_care"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getLiveId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p2, v0, p1}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMemberCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-double v2, p0

    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getRewardPoint()J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    long-to-double v4, p0

    .line 13
    const-string v1, "liveinfo"

    .line 14
    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;-><init>(Ljava/lang/String;DD)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getCallRewardPointsList()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->setCallRewardPoint(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMultiCallRewardPointsList()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->setMultiCallRewardPoint(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getUpdateField()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->setUpdateFile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.live.info"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wzs;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wzs;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
