.class public final Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetailOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetailOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->s()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

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

.method public synthetic constructor <init>(Ll/d3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllOtherUserItemCards(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->a(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllUserItemCards(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->b(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->c(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->d(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-object p0
.end method

.method public addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->e(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->f(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->g(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->h(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-object p0
.end method

.method public addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->i(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->j(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearOtherUserItemCards()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->k(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserItemCards()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->l(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getOtherUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getOtherUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getOtherUserItemCardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getOtherUserItemCardsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOtherUserItemCardsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getOtherUserItemCardsList()Ljava/util/List;

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

.method public getUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserItemCardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getUserItemCardsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUserItemCardsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getUserItemCardsList()Ljava/util/List;

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

.method public removeOtherUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->m(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->n(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->o(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->p(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->q(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-object p0
.end method

.method public setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->r(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
