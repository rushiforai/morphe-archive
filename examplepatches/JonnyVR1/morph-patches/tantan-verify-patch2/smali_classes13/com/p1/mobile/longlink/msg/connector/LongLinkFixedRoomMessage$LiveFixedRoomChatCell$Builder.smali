.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->m()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

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

.method public synthetic constructor <init>(Ll/n2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCellInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->a(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearChatInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->b(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->c(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCellInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->getCellInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getChatInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->getChatInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->getRoomInfo()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasCellInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->hasCellInfo()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasChatInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->hasChatInfo()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasRoomInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->hasRoomInfo()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeCellInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->d(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeChatInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->e(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeRoomInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->f(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCellInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->g(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;)V

    return-object p0
.end method

.method public setCellInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->h(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setChatInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->i(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;)V

    return-object p0
.end method

.method public setChatInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->j(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->k(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;)V

    return-object p0
.end method

.method public setRoomInfo(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;->l(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCell;Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
