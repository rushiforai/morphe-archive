.class public final Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->M()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

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

.method public synthetic constructor <init>(Ll/c2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllAtUserInfos(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAtUserInfos(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)V

    return-object p0
.end method

.method public addAtUserInfos(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)V

    return-object p0
.end method

.method public addAtUserInfos(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->d(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)V

    return-object p0
.end method

.method public addAtUserInfos(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAtUserInfos()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearColorfulMode()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGroupControl()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGroupType()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearImageUrl()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMask()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMaskMode()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSenderCityID()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSharedVoiceRoomID()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->n(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTraceInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->o(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserMask()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->p(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAtUserInfos(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getAtUserInfos(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAtUserInfosCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getAtUserInfosCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAtUserInfosList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getAtUserInfosList()Ljava/util/List;

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

.method public getColorfulMode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getColorfulMode()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGroupControl()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getGroupControl()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGroupType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getGroupType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGroupTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getGroupTypeBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getImageUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getImageUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getImageUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getImageUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMask()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getMask()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMaskMode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getMaskMode()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getSenderCityID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getSenderCityID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSenderCityIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getSenderCityIDBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSharedVoiceRoomID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getSharedVoiceRoomID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSharedVoiceRoomIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getSharedVoiceRoomIDBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTraceInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getTraceInfo()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTraceInfoBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getTraceInfoBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->hasMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasUserMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->hasUserMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeMask(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->q(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->r(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeAtUserInfos(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->s(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAtUserInfos(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->t(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;)V

    return-object p0
.end method

.method public setAtUserInfos(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->u(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setColorfulMode(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->v(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGroupControl(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->w(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGroupType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->x(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGroupTypeBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->y(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setImageUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->z(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setImageUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->A(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->B(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask$Builder;)V

    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->C(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Mask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMaskMode(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->D(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSenderCityID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->E(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSenderCityIDBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->F(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSharedVoiceRoomID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->G(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSharedVoiceRoomIDBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->H(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTraceInfo(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->I(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTraceInfoBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->J(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->K(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->L(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
