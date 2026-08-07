.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayerOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->m()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAvatar()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRole()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserName()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getAvatarBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRole()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getRole()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getRoleBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setAvatar(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRole(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->g(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoleBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->h(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->i(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->j(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->k(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->l(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
