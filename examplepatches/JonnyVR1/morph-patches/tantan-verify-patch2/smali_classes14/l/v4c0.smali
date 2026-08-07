.class public Ll/v4c0;
.super Ll/g2w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/g2w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;",
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
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string p0, "quickchat.match"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chat.conversation.createquickchat"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 18
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;

    invoke-virtual {p0, p1, p2, p3}, Ll/v4c0;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkConversationMessage$CreateConversation;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 4
    .line 5
    new-instance p2, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 6
    .line 7
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/PushMessageContent;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 11
    .line 12
    iput-object p0, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 16
    .line 17
    return-void
.end method
