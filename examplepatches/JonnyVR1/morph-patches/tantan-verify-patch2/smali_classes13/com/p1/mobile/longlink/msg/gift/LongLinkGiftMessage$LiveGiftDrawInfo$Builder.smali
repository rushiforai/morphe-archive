.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->n()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

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

.method public synthetic constructor <init>(Ll/o2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllCoordinates(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCoordinates(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)V

    return-object p0
.end method

.method public addCoordinates(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)V

    return-object p0
.end method

.method public addCoordinates(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)V

    return-object p0
.end method

.method public addCoordinates(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCoordinates()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLength()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWidth()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCoordinates(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getCoordinates(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCoordinatesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getCoordinatesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCoordinatesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getCoordinatesList()Ljava/util/List;

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

.method public getLength()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getLength()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getWidth()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getWidth()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public removeCoordinates(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCoordinates(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate$Builder;)V

    return-object p0
.end method

.method public setCoordinates(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLength(F)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWidth(F)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
