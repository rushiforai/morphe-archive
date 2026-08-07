.class public Ll/t4w;
.super Ll/q4w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;",
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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "conversation.single"

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_CHAT_TYPING:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/t4w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkChatTypingMessage$ChatTyping;)V
    .locals 0

    .line 7
    return-void
.end method
