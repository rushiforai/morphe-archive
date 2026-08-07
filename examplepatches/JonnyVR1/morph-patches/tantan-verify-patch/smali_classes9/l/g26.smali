.class public Ll/g26;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;",
        "Ljava/util/List<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;>;",
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
.method public B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;->GiftList:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 6
    .line 7
    if-ne p0, p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;->Refresh:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 14
    .line 15
    if-ne p0, p3, :cond_0

    .line 16
    .line 17
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 18
    .line 19
    const-string p2, "re_request_room_gift_list"

    .line 20
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;->FirstRechargeCampaign:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 30
    .line 31
    if-ne p0, p3, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;->Complete:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 38
    .line 39
    if-ne p0, p3, :cond_1

    .line 40
    .line 41
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 42
    .line 43
    const-string p2, "complete_first_recharge"

    .line 44
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;->FirstRechargeStimulus:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 54
    .line 55
    if-ne p0, p3, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;->Complete:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 62
    .line 63
    if-ne p0, p2, :cond_2

    .line 64
    .line 65
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 66
    .line 67
    const-string p2, "complete_first_recharge_stimulus"

    .line 68
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_2
    const/4 p0, 0x0

    .line 74
    return-object p0
.end method

.method public D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;->LiveCampaign:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;->Refresh:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;

    .line 14
    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getLiveCampaignsList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getLiveCampaignsList()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;->CampaignEntrance:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;

    .line 37
    .line 38
    if-ne p0, p1, :cond_1

    .line 39
    .line 40
    new-instance p0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.notice.contentUpdate"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/g26;->B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/g26;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/g26;->D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNotice;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
