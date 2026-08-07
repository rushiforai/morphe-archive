.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChangeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->j()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearLiveId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearReason()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getReason()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getReasonBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->getStatusBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReason(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setReasonBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->g(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->h(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatusBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;->i(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatLiveChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
