.class public final Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetailOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PkItemCardsDetail"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetailOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

.field public static final OTHERUSERITEMCARDS_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERITEMCARDS_FIELD_NUMBER:I = 0x1


# instance fields
.field private otherUserItemCards_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation
.end field

.field private userItemCards_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addAllOtherUserItemCards(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllOtherUserItemCards(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllUserItemCards(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addAllUserItemCards(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method private clearOtherUserItemCards()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearUserItemCards()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method private ensureOtherUserItemCardsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureUserItemCardsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addOtherUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->addUserItemCards(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->clearOtherUserItemCards()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->clearUserItemCards()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->removeOtherUserItemCards(I)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->removeUserItemCards(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V

    return-void
.end method

.method private removeOtherUserItemCards(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private removeUserItemCards(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    return-object v0
.end method

.method private setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setOtherUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureOtherUserItemCardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setUserItemCards(ILcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->ensureUserItemCardsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/l710;->a()V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->PARSER:Ll/ng60;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1

    .line 44
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->PARSER:Ll/ng60;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 48
    .line 49
    check-cast p3, Lcom/google/protobuf/h;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    :cond_2
    :goto_3
    if-nez p1, :cond_8

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v1, v3, :cond_6

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v1, v3, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    :cond_3
    move p1, v2

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_4

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_5

    .line 81
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 82
    .line 83
    invoke-interface {v1}, Lcom/google/protobuf/l$h;->q()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_5

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 90
    .line 91
    invoke-static {v1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 96
    .line 97
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->parser()Ll/ng60;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 108
    .line 109
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 114
    .line 115
    invoke-interface {v1}, Lcom/google/protobuf/l$h;->q()Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_7

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 122
    .line 123
    invoke-static {v1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 128
    .line 129
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->parser()Ll/ng60;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 140
    .line 141
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :catchall_1
    move-exception p0

    .line 146
    throw p0

    .line 147
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 161
    .line 162
    .line 163
    return-object v0

    .line 164
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return-object v0

    .line 172
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 173
    .line 174
    return-object p0

    .line 175
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 176
    .line 177
    check-cast p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 180
    .line 181
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 182
    .line 183
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 190
    .line 191
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 192
    .line 193
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 198
    .line 199
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 200
    .line 201
    return-object p0

    .line 202
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;

    .line 203
    .line 204
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail$Builder;-><init>(Ll/d3w;)V

    .line 205
    .line 206
    .line 207
    return-object p0

    .line 208
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 209
    .line 210
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 211
    .line 212
    .line 213
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 214
    .line 215
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 216
    .line 217
    .line 218
    return-object v0

    .line 219
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 220
    .line 221
    return-object p0

    .line 222
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 223
    .line 224
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;-><init>()V

    .line 225
    .line 226
    .line 227
    return-object p0

    .line 228
    nop

    .line 229
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getOtherUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 8
    .line 9
    return-object p0
.end method

.method public getOtherUserItemCardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserItemCardsOrBuilder(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getOtherUserItemCardsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v1, v3, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/google/protobuf/q;

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    invoke-static {v4, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/2addr v2, v3

    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-ge v0, v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 44
    .line 45
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/google/protobuf/q;

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    invoke-static {v3, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    add-int/2addr v2, v1

    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    iput v2, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 61
    .line 62
    return v2
.end method

.method public getUserItemCards(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 8
    .line 9
    return-object p0
.end method

.method public getUserItemCardsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserItemCardsOrBuilder(I)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getUserItemCardsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->userItemCards_:Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/google/protobuf/q;

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ge v0, v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->otherUserItemCards_:Lcom/google/protobuf/l$h;

    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/google/protobuf/q;

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    return-void
.end method
