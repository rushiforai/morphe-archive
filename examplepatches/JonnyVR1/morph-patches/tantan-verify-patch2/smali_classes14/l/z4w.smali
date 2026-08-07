.class public Ll/z4w;
.super Ll/q4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;",
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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "message.single.update"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_CANCEL_MSG:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 44
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;

    invoke-virtual {p0, p1, p2, p3}, Ll/z4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageContent;->new_()Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 6
    .line 7
    const-string p2, "message"

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;->getMsgId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$RevokeChatMsg;->getOtherUserId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iput-object p2, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 38
    .line 39
    const-string p1, "conversation"

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IdBoxed;->type:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method
