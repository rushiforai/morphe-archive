.class public Ll/if3;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;",
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
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 2
    .line 3
    const-string p3, "breaking_leader_board"

    .line 4
    .line 5
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;->getUserID()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->setContent(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getId()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getId()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p3, v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getFieldsList()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p3, p2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->addAllFields(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    move-object v5, p2

    .line 42
    check-cast v5, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    const/4 v4, 0x0

    .line 46
    move-object v0, p0

    .line 47
    move-object v1, p1

    .line 48
    invoke-virtual/range {v0 .. v5}, Ll/mq2;->n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.gift.breakingLeaderboard"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/if3;->z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic w(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/if3;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/if3;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p2, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveBreakingLeaderboard;->getRoomID()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Ll/mq2;->c:Ll/zod;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method
