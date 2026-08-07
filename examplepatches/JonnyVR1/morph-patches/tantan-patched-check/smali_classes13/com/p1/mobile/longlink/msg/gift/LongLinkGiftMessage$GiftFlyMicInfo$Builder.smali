.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->s()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllDynamicEffectExtends(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearDynamicEffectExtends()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEndEffectIcon()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearReceiveUserId()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStartEffectIcon()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDynamicEffectExtendsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getDynamicEffectExtendsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDynamicEffectExtendsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getDynamicEffectExtendsList()Ljava/util/List;

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

.method public getEndEffectIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getEndEffectIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEndEffectIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getEndEffectIconBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReceiveUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getReceiveUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReceiveUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getReceiveUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartEffectIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getStartEffectIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartEffectIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->getStartEffectIconBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public setDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndEffectIcon(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEndEffectIconBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReceiveUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReceiveUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartEffectIcon(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStartEffectIconBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;->r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftFlyMicInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
