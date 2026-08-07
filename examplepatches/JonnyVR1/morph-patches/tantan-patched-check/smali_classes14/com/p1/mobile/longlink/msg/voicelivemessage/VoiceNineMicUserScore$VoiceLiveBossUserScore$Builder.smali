.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScoreOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScoreOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->p()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

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

.method public synthetic constructor <init>(Ll/eeo0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllBossUserScore(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-object p0
.end method

.method public addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    return-object p0
.end method

.method public addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-object p0
.end method

.method public addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBossUserScore()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBossUserScore(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getBossUserScore(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBossUserScoreCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getBossUserScoreCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getBossUserScoreList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getBossUserScoreList()Ljava/util/List;

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

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeBossUserScore(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-object p0
.end method

.method public setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
