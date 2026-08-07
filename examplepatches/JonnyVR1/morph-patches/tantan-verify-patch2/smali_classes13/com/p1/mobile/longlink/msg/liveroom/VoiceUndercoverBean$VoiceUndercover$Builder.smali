.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercoverOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercoverOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->T()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

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

.method public synthetic constructor <init>(Ll/g5p0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllCurrentPlayers(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllVotes(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCurrentPlayers(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)V

    return-object p0
.end method

.method public addCurrentPlayers(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)V

    return-object p0
.end method

.method public addCurrentPlayers(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)V

    return-object p0
.end method

.method public addCurrentPlayers(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addVotes(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)V

    return-object p0
.end method

.method public addVotes(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    return-object p0
.end method

.method public addVotes(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)V

    return-object p0
.end method

.method public addVotes(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCountDownSeconds()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->k(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCurrentPlayers()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->l(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->m(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->n(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->o(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRemainSeconds()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->p(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearToast()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->r(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->s(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVotes()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->t(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWord()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->u(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCountDownSeconds()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCountDownSeconds()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCurrentPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCurrentPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCurrentPlayersCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCurrentPlayersCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCurrentPlayersList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCurrentPlayersList()Ljava/util/List;

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

.method public getGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRemainSeconds()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getRemainSeconds()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getStatusBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToast()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getToast()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToastBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getToastBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVotes(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVotes(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVotesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVotesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getVotesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVotesList()Ljava/util/List;

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

.method public getWord()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getWord()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWordBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getWordBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasGameResult()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->hasGameResult()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasVoteResult()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->hasVoteResult()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeGameResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->v(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeVoteResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->w(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeCurrentPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->x(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeVotes(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->y(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCountDownSeconds(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->z(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCurrentPlayers(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->A(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player$Builder;)V

    return-object p0
.end method

.method public setCurrentPlayers(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGameResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->C(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;)V

    return-object p0
.end method

.method public setGameResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->D(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->E(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->F(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->G(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->H(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRemainSeconds(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->I(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->J(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatusBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->K(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToast(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToastBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->M(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVoteResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->N(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult$Builder;)V

    return-object p0
.end method

.method public setVoteResult(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVotes(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->P(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;)V

    return-object p0
.end method

.method public setVotes(ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->Q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;ILcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWord(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->R(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWordBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->S(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
