.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversationOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->g()Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

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

.method public synthetic constructor <init>(Ll/i2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAction()Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->a(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearOtherUserId()Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->b(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getAction()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getActionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getActionBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getOtherUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getOtherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getOtherUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getOtherUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setAction(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->c(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setActionBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->d(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOtherUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->e(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->f(Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
