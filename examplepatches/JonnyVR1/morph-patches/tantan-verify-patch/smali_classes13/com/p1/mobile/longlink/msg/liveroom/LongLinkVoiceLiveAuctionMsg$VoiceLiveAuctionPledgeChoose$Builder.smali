.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChooseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChooseOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->j()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

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

.method public synthetic constructor <init>(Ll/f4w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAuctionId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPledgeAName()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPledgeBName()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAuctionId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getAuctionId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAuctionIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getAuctionIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPledgeAName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeAName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPledgeANameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeANameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPledgeBName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeBName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPledgeBNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->getPledgeBNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setAuctionId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAuctionIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPledgeAName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPledgeANameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPledgeBName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPledgeBNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionPledgeChoose;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
