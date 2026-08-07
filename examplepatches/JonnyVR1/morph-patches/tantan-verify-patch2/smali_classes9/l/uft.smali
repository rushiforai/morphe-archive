.class public Ll/uft;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 7

    .line 1
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/zod;->d()Ll/m500;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p3, v0}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    new-instance v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 24
    .line 25
    invoke-direct {v6}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getJumpScheme()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->scheme:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p3, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;->setName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p3, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;->setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    move-object v3, p3

    .line 67
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    move-object v0, p0

    .line 75
    move-object v1, p1

    .line 76
    invoke-virtual/range {v0 .. v6}, Ll/mq2;->o(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getIsAggregate()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    const-string p1, "join_red_packet"

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLiveMessageType(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getIsAggregate()Z

    .line 92
    .line 93
    .line 94
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.redpacket.joinLotteryGiftRedPacket"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/uft;->z(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/uft;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "no_care"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p2}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
