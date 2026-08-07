.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChangeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->h()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearReason()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVideoChat()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->getReason()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReasonBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->getReasonBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVideoChat()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->getVideoChat()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasVideoChat()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->hasVideoChat()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeVideoChat(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReason(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReasonBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVideoChat(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;)V

    return-object p0
.end method

.method public setVideoChat(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->g(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
