.class public final Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->A()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

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

.method public synthetic constructor <init>(Ll/c2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllIds(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllMultiRoomMedals(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllSingleRoomMedals(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addIds(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->d(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addIdsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-object p0
.end method

.method public addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-object p0
.end method

.method public addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIds()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->n(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMultiRoomMedals()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->o(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSingleRoomMedals()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->p(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVersion()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->q(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getIds(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getIds(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getIdsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getIdsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getIdsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getIdsList()Ljava/util/List;

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

.method public getMultiRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getMultiRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMultiRoomMedalsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getMultiRoomMedalsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMultiRoomMedalsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getMultiRoomMedalsList()Ljava/util/List;

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

.method public getSingleRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getSingleRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSingleRoomMedalsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getSingleRoomMedalsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSingleRoomMedalsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getSingleRoomMedalsList()Ljava/util/List;

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

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersionBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeMultiRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->r(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeSingleRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->s(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIds(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->t(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->u(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->v(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->w(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-object p0
.end method

.method public setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->x(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->y(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVersionBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->z(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
