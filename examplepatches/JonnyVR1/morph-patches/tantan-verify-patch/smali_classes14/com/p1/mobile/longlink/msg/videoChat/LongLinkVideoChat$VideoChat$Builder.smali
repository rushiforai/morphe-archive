.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->u0()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

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

.method public synthetic constructor <init>(Ll/z3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllPlayers(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-object p0
.end method

.method public addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    return-object p0
.end method

.method public addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-object p0
.end method

.method public addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnchorCallId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnchorId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->g(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCalled()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->h(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCategory()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->i(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCreatedTime()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->j(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndTipMessage()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->k(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndType()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->l(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndedTime()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->m(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearErrorMessage()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->n(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGiftId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->o(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->p(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLastStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->q(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLeaveUserId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->r(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->s(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPlayers()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->t(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPunishMessage()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->u(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->v(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRtcProvider()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->w(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSource()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->x(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStartedTime()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->y(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->z(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTtc()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->A(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUpdatedTime()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->B(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->C(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnchorCallId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorCallIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCalled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCalled()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCategory()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCategory()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCategoryValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCategoryValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCreatedTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCreatedTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getEndTipMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndTipMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessageBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndType()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndType()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getEndedTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndedTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getErrorMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getErrorMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getErrorMessageBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGiftId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGiftIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftIdBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLastStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLastStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLastStatusValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLastStatusValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLeaveUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLeaveUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLeaveUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLeaveUserIdBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPlayers(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPlayers(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPlayersCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPlayersCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getPlayersList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPlayersList()Ljava/util/List;

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

.method public getPunishMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPunishMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPunishMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPunishMessageBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRtcProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProvider()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRtcProviderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProviderBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSource()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSourceBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartedTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getStartedTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatusValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getStatusValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getTtc()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getTtc()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getUpdatedTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUpdatedTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removePlayers(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorCallId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->E(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorCallIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->F(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->G(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchorIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->H(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCalled(Z)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->I(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCategory(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->J(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCategoryValue(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->K(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCreatedTime(J)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->L(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndTipMessage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->M(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndTipMessageBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->N(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndType(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->O(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndTypeValue(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->P(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndedTime(J)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->Q(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setErrorMessage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->R(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setErrorMessageBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->S(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGiftId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->T(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGiftIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->U(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->V(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->W(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLastStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->X(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLastStatusValue(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->Y(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLeaveUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->Z(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLeaveUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->a0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->b0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->c0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->d0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-object p0
.end method

.method public setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->e0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPunishMessage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->f0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPunishMessageBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->g0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->h0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->i0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcProvider(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->j0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRtcProviderBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->k0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSource(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->l0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->m0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartedTime(J)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->n0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->o0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatusValue(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->p0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTtc(J)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->q0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdatedTime(J)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->r0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->s0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->t0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
