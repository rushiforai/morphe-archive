.class Lcom/p1/mobile/putong/core/data/ConversationProperty$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationProperty;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationProperty;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/TacitTest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlChatSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    const/16 v1, 0x8

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveScript;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    sget-object v2, Lcom/p1/mobile/putong/core/data/BoostInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 126
    .line 127
    if-eqz v0, :cond_a

    .line 128
    .line 129
    const/16 v1, 0xb

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/core/data/LikedMeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    const/16 v1, 0xc

    .line 143
    .line 144
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 152
    .line 153
    if-eqz v0, :cond_c

    .line 154
    .line 155
    const/16 v1, 0xd

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 165
    .line 166
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationProperty$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationProperty;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationProperty;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;->new_()Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->new_()Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;->new_()Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->new_()Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 52
    .line 53
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 54
    .line 55
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;->new_()Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 62
    .line 63
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TacitTest;->new_()Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 72
    .line 73
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 74
    .line 75
    if-nez p1, :cond_6

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlChatSource;->new_()Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 82
    .line 83
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 84
    .line 85
    if-nez p1, :cond_7

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->new_()Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 92
    .line 93
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveScript;->new_()Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 102
    .line 103
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 104
    .line 105
    if-nez p1, :cond_9

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostInfo;->new_()Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 112
    .line 113
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 114
    .line 115
    if-nez p1, :cond_a

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LikedMeInfo;->new_()Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 122
    .line 123
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 124
    .line 125
    if-nez p1, :cond_16

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationTag;->new_()Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 132
    .line 133
    return-object p0

    .line 134
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 141
    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 153
    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikedMeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 165
    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveScript;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 189
    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 201
    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlChatSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/TacitTest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 225
    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 249
    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 261
    .line 262
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 273
    .line 274
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 285
    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 291
    .line 292
    if-nez p1, :cond_b

    .line 293
    .line 294
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;->new_()Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 299
    .line 300
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 301
    .line 302
    if-nez p1, :cond_c

    .line 303
    .line 304
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->new_()Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 309
    .line 310
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 311
    .line 312
    if-nez p1, :cond_d

    .line 313
    .line 314
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;->new_()Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 319
    .line 320
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 321
    .line 322
    if-nez p1, :cond_e

    .line 323
    .line 324
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->new_()Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 329
    .line 330
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 331
    .line 332
    if-nez p1, :cond_f

    .line 333
    .line 334
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;->new_()Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 339
    .line 340
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 341
    .line 342
    if-nez p1, :cond_10

    .line 343
    .line 344
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TacitTest;->new_()Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 349
    .line 350
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 351
    .line 352
    if-nez p1, :cond_11

    .line 353
    .line 354
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlChatSource;->new_()Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 359
    .line 360
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 361
    .line 362
    if-nez p1, :cond_12

    .line 363
    .line 364
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->new_()Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 369
    .line 370
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 371
    .line 372
    if-nez p1, :cond_13

    .line 373
    .line 374
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LoveScript;->new_()Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 379
    .line 380
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 381
    .line 382
    if-nez p1, :cond_14

    .line 383
    .line 384
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostInfo;->new_()Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 389
    .line 390
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 391
    .line 392
    if-nez p1, :cond_15

    .line 393
    .line 394
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LikedMeInfo;->new_()Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 399
    .line 400
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 401
    .line 402
    if-nez p1, :cond_16

    .line 403
    .line 404
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationTag;->new_()Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 409
    .line 410
    :cond_16
    return-object p0

    .line 411
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 411
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationProperty$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationProperty;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationProperty;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->liveVIP:Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationLiveVipInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->iceBreaking:Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationIceBreaking;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->soulmatch2:Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationSoulMatch2;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTest;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/TacitTest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_chat_source:Lcom/p1/mobile/putong/core/data/IntlChatSource;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlChatSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->intl_love_buzz:Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    const/16 v0, 0x9

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveScript;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->boost:Lcom/p1/mobile/putong/core/data/BoostInfo;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->likedMe:Lcom/p1/mobile/putong/core/data/LikedMeInfo;

    .line 105
    .line 106
    if-eqz p0, :cond_a

    .line 107
    .line 108
    const/16 v0, 0xb

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/core/data/LikedMeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 116
    .line 117
    if-eqz p0, :cond_b

    .line 118
    .line 119
    const/16 v0, 0xc

    .line 120
    .line 121
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 124
    .line 125
    .line 126
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 127
    .line 128
    if-eqz p0, :cond_c

    .line 129
    .line 130
    const/16 p1, 0xd

    .line 131
    .line 132
    sget-object v0, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 135
    .line 136
    .line 137
    :cond_c
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationProperty$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationProperty;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
