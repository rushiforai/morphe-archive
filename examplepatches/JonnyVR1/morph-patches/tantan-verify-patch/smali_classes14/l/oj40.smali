.class public Ll/oj40;
.super Ll/g2w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/g2w<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;",
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

.method public static i()Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "quickchat.bell"

    .line 2
    .line 3
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v0, "quickchat.bell-greet"

    .line 8
    .line 9
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v0, "quickchat.speed-push"

    .line 14
    .line 15
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v0, "quickchat.speed-match"

    .line 20
    .line 21
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v0, "quickchat.speed-delete"

    .line 26
    .line 27
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const-string v0, "quickchat_state.push"

    .line 32
    .line 33
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    const-string v0, "quickchat_state.match"

    .line 38
    .line 39
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    const-string v0, "quickchat.oneside"

    .line 44
    .line 45
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    const-string v0, "quickchat.oneside-delete"

    .line 50
    .line 51
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    const-string v0, "quickchat.bubble.chatroom"

    .line 56
    .line 57
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v10

    .line 61
    const-string v0, "voicechat.broadcast"

    .line 62
    .line 63
    invoke-static {v0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    filled-new-array/range {v1 .. v11}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    return-object v0
.end method

.method public static j()V
    .locals 5

    .line 1
    invoke-static {}, Ll/oj40;->i()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/pf60;

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    new-instance v4, Ll/oj40$a;

    .line 23
    .line 24
    invoke-direct {v4, v2}, Ll/oj40$a;-><init>(Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/api/WebSocketManager;->e0(Ll/exl;)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string p0, "quickchat.broadcast"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uss.quickchat.broadcast"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_COMMON:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 148
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-virtual {p0, p1, p2, p3}, Ll/oj40;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V

    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 2

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
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOtherUserId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 15
    .line 16
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAuth()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getUrl()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 31
    .line 32
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getGender()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 39
    .line 40
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAge()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 47
    .line 48
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 55
    .line 56
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag1()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 63
    .line 64
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag2()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 71
    .line 72
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag3()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 77
    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 79
    .line 80
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getQueryToken()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 85
    .line 86
    const/4 p0, 0x1

    .line 87
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 90
    .line 91
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTopic()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 96
    .line 97
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 98
    .line 99
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOpeningRemark()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 106
    .line 107
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getPoolID()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 114
    .line 115
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getBirthday()J

    .line 116
    .line 117
    .line 118
    move-result-wide v0

    .line 119
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 120
    .line 121
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 122
    .line 123
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getBroadcastID()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    iput-object p3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 128
    .line 129
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 130
    .line 131
    iget-object p1, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string p2, "radioType"

    .line 138
    .line 139
    const-string p3, ""

    .line 140
    .line 141
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessageCustomOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 146
    .line 147
    return-void
.end method
