.class Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;-><init>()V

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
    const-string v1, ""

    .line 11
    .line 12
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_e

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 125
    .line 126
    if-nez p1, :cond_a

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 129
    .line 130
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 131
    .line 132
    if-nez p1, :cond_b

    .line 133
    .line 134
    sget-object p1, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 143
    .line 144
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 145
    .line 146
    if-nez p1, :cond_c

    .line 147
    .line 148
    sget-object p1, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 157
    .line 158
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_d

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 163
    .line 164
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_e

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 169
    .line 170
    :cond_e
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->content:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->status:Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->feedback:Lcom/p1/mobile/putong/core/data/AIMessageFeedback;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/AIMessageFeedback;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->response_uuid:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->scene:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 p1, 0x5

    .line 42
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
