.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsgOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->o()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

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

.method public synthetic constructor <init>(Ll/j2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMessage()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->a(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSenderId()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->b(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->c(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->d(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTs()Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->e(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getMessageBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSenderId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getSenderId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSenderIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getSenderIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTicker()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getTicker()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTickerBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getTickerBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getTitleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTs()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->getTs()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->f(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMessageBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->g(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSenderId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->h(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSenderIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->i(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTicker(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->j(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTickerBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->k(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->l(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTitleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->m(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTs(J)Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;->n(Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsg;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
