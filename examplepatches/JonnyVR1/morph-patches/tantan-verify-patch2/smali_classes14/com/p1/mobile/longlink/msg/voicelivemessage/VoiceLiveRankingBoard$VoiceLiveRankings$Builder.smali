.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingsOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->D()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

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

.method public synthetic constructor <init>(Ll/c4o0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllRankings(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-object p0
.end method

.method public addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    return-object p0
.end method

.method public addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-object p0
.end method

.method public addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAction()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMsgType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRankingTime()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRankings()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTitle()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAction()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getAction()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getActionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getActionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMsgType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getMsgType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMsgTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getMsgTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRankingTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankingTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRankingsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankingsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getRankingsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankingsList()Ljava/util/List;

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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTitleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public removeRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAction(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setActionValue(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMsgType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMsgTypeValue(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRankingTime(J)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-object p0
.end method

.method public setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->C(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
