.class public Ll/e2w;
.super Ll/g2w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/g2w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g2w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string p0, "chat.conversation.other_read"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chat.conversation.other_read"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 28
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;

    invoke-virtual {p0, p1, p2, p3}, Ll/e2w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 9
    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;->getOtherUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatServiceMessage$OtherUserReadSocketMessage;->getReadUntilId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 26
    .line 27
    return-void
.end method
