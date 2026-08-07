.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->F()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

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

.method public synthetic constructor <init>(Ll/c3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllCallRewardPoints(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllMultiCallRewardPoints(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public addCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    return-object p0
.end method

.method public addCallRewardPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public addCallRewardPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addMultiCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public addMultiCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    return-object p0
.end method

.method public addMultiCallRewardPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public addMultiCallRewardPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCallRewardPoints()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMemberCount()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMultiCallRewardPoints()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRewardPoint()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUpdateField()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getCallRewardPointsCount()I

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
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getCallRewardPointsList()Ljava/util/List;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMemberCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMemberCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMultiCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMultiCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMultiCallRewardPointsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMultiCallRewardPointsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMultiCallRewardPointsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getMultiCallRewardPointsList()Ljava/util/List;

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

.method public getRewardPoint()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getRewardPoint()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateField()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getUpdateField()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdateFieldValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->getUpdateFieldValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public removeCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeMultiCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public setCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMemberCount(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMultiCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint$Builder;)V

    return-object p0
.end method

.method public setMultiCallRewardPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallRewardPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRewardPoint(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateField(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UpdateField;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdateFieldValue(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
