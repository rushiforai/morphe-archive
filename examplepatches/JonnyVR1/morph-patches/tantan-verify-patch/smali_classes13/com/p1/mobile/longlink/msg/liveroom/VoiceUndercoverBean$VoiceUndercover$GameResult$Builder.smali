.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResultOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResultOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->B()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllNormalMasks(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllUndercoverMasks(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addNormalMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public addNormalMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-object p0
.end method

.method public addNormalMasks(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public addNormalMasks(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addUndercoverMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public addUndercoverMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-object p0
.end method

.method public addUndercoverMasks(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public addUndercoverMasks(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNormalMasks()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->k(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNormalWord()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->l(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUndercoverMasks()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->m(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUndercoverWord()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->n(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWinnerRole()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->o(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getNormalMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNormalMasksCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasksCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getNormalMasksList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasksList()Ljava/util/List;

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

.method public getNormalWord()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalWord()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNormalWordBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalWordBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUndercoverMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUndercoverMasksCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasksCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUndercoverMasksList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasksList()Ljava/util/List;

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

.method public getUndercoverWord()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverWord()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUndercoverWordBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverWordBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWinnerRole()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getWinnerRole()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWinnerRoleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getWinnerRoleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeNormalMasks(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->p(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeUndercoverMasks(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNormalMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->r(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setNormalMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->s(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNormalWord(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->t(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNormalWordBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->u(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUndercoverMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->v(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setUndercoverMasks(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->w(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUndercoverWord(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->x(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUndercoverWordBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->y(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWinnerRole(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->z(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWinnerRoleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->A(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
