.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->k()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/v3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearGift()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSender()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearShowSeconds()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getGift()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->getGift()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSender()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->getSender()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getShowSeconds()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->getShowSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public hasGift()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->hasGift()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasSender()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->hasSender()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeGift(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeSender(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGift(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;)V

    return-object p0
.end method

.method public setGift(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSender(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender$Builder;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender$Builder;)V

    return-object p0
.end method

.method public setSender(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketSender;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setShowSeconds(J)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;->j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketAnimationMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
