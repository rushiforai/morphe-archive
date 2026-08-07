.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$HeadlineOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$HeadlineOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->O()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllGrabGiftRecords(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-object p0
.end method

.method public addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-object p0
.end method

.method public addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-object p0
.end method

.method public addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGrabGiftRecords()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLeftTime()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPrice()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearText()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVersion()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGrabGiftRecords(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGrabGiftRecords(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGrabGiftRecordsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGrabGiftRecordsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGrabGiftRecordsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGrabGiftRecordsList()Ljava/util/List;

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

.method public getLeftTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getLeftTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPrice()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getPrice()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatus()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getStatus()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVersion()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getVersion()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public hasAnchor()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->hasAnchor()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasAudience()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->hasAudience()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasGiftRecord()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->hasGiftRecord()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasLiveStatus()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->hasLiveStatus()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasResource()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->hasResource()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->s(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->t(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->u(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeGrabGiftRecords(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->v(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->w(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V

    return-object p0
.end method

.method public setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->x(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V

    return-object p0
.end method

.method public setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->A(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-object p0
.end method

.method public setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-object p0
.end method

.method public setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->D(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLeftTime(J)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->E(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->F(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;)V

    return-object p0
.end method

.method public setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->G(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPrice(J)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->H(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->I(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;)V

    return-object p0
.end method

.method public setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->J(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Z)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->K(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->L(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->M(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVersion(J)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->N(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
