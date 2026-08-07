.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->d0()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAnchorUserId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnchorUserName()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearHangupReason()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIntendPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearInviteId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIsAway()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMutedByAnchor()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMutedByUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearOpState()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSource()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearState()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserName()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserRecvRewardPoint()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserSendRewardPoint()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnchorUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHangupReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHangupReasonBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReasonBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIntendPosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getIntendPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getInviteId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getInviteIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIsAway()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getIsAway()Z

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMutedByAnchor()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getMutedByAnchor()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMutedByUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getMutedByUser()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOpState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpState()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getOpStateBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpStateBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSourceBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getState()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStateBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getStateBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserRecvRewardPoint()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserRecvRewardPoint()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getUserSendRewardPoint()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserSendRewardPoint()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public hasAnchorUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hasAnchorUserProfile()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hasUserProfile()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorUserName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-object p0
.end method

.method public setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHangupReason(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHangupReasonBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIntendPosition(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setInviteId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setInviteIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIsAway(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMutedByAnchor(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMutedByUser(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOpState(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOpStateBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->P(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPosition(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->Q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSource(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->R(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->S(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setState(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->T(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStateBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->U(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->X(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->Y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->Z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-object p0
.end method

.method public setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->a0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserRecvRewardPoint(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->b0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserSendRewardPoint(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->c0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
