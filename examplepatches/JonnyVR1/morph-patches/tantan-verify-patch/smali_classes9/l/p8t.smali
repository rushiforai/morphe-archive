.class public Ll/p8t;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
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
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
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
.method public B(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    const/4 v3, 0x0

    .line 15
    move-object v0, p0

    .line 16
    move-object v1, p1

    .line 17
    invoke-virtual/range {v0 .. v5}, Ll/mq2;->n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setMysteryBoxRecord(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 0

    .line 1
    return-object p2
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.campaign.mysteryBoxChatMsg"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p8t;->B(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/p8t;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p8t;->D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
