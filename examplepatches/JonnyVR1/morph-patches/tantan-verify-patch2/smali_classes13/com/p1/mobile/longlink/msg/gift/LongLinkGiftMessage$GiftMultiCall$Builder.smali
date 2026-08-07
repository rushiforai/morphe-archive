.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCallOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCallOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCallId()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearReceiveGiftRole()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCallId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getCallId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCallIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getCallIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReceiveGiftRole()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getReceiveGiftRole()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasReceiveGiftRole()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->hasReceiveGiftRole()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeReceiveGiftRole(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCallId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCallIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReceiveGiftRole(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole$Builder;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole$Builder;)V

    return-object p0
.end method

.method public setReceiveGiftRole(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
