.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdateOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdateOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->H()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllLeaderboards(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLeaderboards(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)V

    return-object p0
.end method

.method public addLeaderboards(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V

    return-object p0
.end method

.method public addLeaderboards(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)V

    return-object p0
.end method

.method public addLeaderboards(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAuctionId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCurrentTime()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIsChoosingPledgeRelation()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLeaderboardGap()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLeaderboards()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLevel()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPanelBgId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUpdateType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWorth()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWorthBubble()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWorthBubbleLevel()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;)V

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getAuctionId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getAuctionIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCurrentTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getCurrentTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getIsChoosingPledgeRelation()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getIsChoosingPledgeRelation()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLeaderboardGap()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getLeaderboardGap()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getLeaderboards(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getLeaderboards(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLeaderboardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getLeaderboardsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLeaderboardsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getLeaderboardsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getLevel()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getLevel()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getPanelBgId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getPanelBgId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPanelBgIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getPanelBgIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getUpdateType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getUpdateTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getWorth()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getWorth()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getWorthBubble()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getWorthBubble()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWorthBubbleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getWorthBubbleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWorthBubbleLevel()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->getWorthBubbleLevel()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public removeLeaderboards(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAuctionId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAuctionIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCurrentTime(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIsChoosingPledgeRelation(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLeaderboardGap(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLeaderboards(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;)V

    return-object p0
.end method

.method public setLeaderboards(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLevel(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPanelBgId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPanelBgIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateTypeValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWorth(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWorthBubble(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWorthBubbleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWorthBubbleLevel(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;->G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdate;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
