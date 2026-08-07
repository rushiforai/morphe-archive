.class public Ll/uil;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;",
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
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 7

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 6
    .line 7
    invoke-direct {v6}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;->getTopLiveId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->liveId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;->getRoomId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iput-object p3, v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->roomId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getId()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getId()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    invoke-virtual {p2, p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getFieldsList()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p2, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->addAllFields(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    move-object v5, p1

    .line 55
    check-cast v5, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 56
    .line 57
    const-string v1, ""

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    const/4 v4, 0x0

    .line 61
    move-object v0, p0

    .line 62
    invoke-virtual/range {v0 .. v6}, Ll/mq2;->o(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.gift.preHourLeaderboardsTopChat"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/uil;->z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/uil;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$PreHourLeaderboardsTopChat;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
