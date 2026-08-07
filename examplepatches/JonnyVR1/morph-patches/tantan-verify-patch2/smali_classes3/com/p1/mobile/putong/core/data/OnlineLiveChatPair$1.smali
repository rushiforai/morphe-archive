.class Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 84
    .line 85
    if-eqz v0, :cond_8

    .line 86
    .line 87
    const/16 v1, 0x9

    .line 88
    .line 89
    sget-object v2, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v0, :cond_9

    .line 99
    .line 100
    const/16 v1, 0xa

    .line 101
    .line 102
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 108
    .line 109
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 110
    check-cast p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 72
    .line 73
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_12

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 78
    .line 79
    return-object p0

    .line 80
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_9

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

    .line 162
    .line 163
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_a

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 168
    .line 169
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_b

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 174
    .line 175
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_c

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 180
    .line 181
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 182
    .line 183
    if-nez p1, :cond_d

    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 186
    .line 187
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 188
    .line 189
    if-nez p1, :cond_e

    .line 190
    .line 191
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 192
    .line 193
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_f

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 198
    .line 199
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_10

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 204
    .line 205
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 206
    .line 207
    if-nez p1, :cond_11

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 214
    .line 215
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_12

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 220
    .line 221
    :cond_12
    return-object p0

    .line 222
    nop

    .line 223
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 223
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveId:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->name:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->avatar:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->text:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->voiceRoomTopicId:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->anchorId:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->liveState:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->multiCallInfo:Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;

    .line 67
    .line 68
    if-eqz p0, :cond_8

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 75
    .line 76
    .line 77
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->schema:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz p0, :cond_9

    .line 80
    .line 81
    const/16 p1, 0xa

    .line 82
    .line 83
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_9
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair$1;->serialize(Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
