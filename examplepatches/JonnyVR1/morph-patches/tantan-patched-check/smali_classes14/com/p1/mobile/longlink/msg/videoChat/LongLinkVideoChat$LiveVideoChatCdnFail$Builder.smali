.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFailOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFailOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->g()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearChatId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNewPushUrl()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getChatId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getChatId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getChatIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getChatIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNewPushUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getNewPushUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNewPushUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->getNewPushUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setChatId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setChatIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewPushUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewPushUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;->f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatCdnFail;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
