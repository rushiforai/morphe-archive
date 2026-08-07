.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->k()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllVoterNumbers(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addVoterNumbers(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCandidateMask()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNumber()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVoterNumbers()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCandidateMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getCandidateMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNumber()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getVoterNumbers(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getVoterNumbers(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getVoterNumbersCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getVoterNumbersCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getVoterNumbersList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getVoterNumbersList()Ljava/util/List;

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

.method public hasCandidateMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->hasCandidateMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeCandidateMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCandidateMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setCandidateMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVoterNumbers(II)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;II)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
