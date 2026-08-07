.class public Ll/knm0;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;",
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
.method public A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

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
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const/4 v3, 0x0

    .line 31
    move-object v0, p0

    .line 32
    move-object v1, p1

    .line 33
    invoke-virtual/range {v0 .. v5}, Ll/mq2;->n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    move-object v0, p0

    .line 39
    move-object v1, p1

    .line 40
    invoke-super {v0, v1, p2, p3}, Ll/mq2;->x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive.followship.apply"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/knm0;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/knm0;->A(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveFollowShipApplyMessage;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
