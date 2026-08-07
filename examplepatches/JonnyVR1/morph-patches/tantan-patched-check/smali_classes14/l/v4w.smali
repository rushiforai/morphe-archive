.class public Ll/v4w;
.super Ll/q4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q4w;-><init>()V

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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "conversation.single.delete"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_DELETE_CONVERSATION:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 27
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;

    invoke-virtual {p0, p1, p2, p3}, Ll/v4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;)V
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
    const-string p2, "conversation"

    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getOtherUserId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 19
    .line 20
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$DeleteConversation;->getAction()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method
