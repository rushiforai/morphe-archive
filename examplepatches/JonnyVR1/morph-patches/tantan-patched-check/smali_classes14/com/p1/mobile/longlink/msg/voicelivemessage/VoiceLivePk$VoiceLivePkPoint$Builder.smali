.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPointOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPointOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->j()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

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

.method public synthetic constructor <init>(Ll/x3o0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllCallRewardPoints(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCallRewardPoints(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)V

    return-object p0
.end method

.method public addCallRewardPoints(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    return-object p0
.end method

.method public addCallRewardPoints(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)V

    return-object p0
.end method

.method public addCallRewardPoints(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCallRewardPoints()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->getCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCallRewardPointsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->getCallRewardPointsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCallRewardPointsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->getCallRewardPointsList()Ljava/util/List;

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

.method public removeCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCallRewardPoints(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;)V

    return-object p0
.end method

.method public setCallRewardPoints(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;->i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
