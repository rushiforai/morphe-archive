.class Lcom/p1/mobile/putong/data/UserLiveLabel$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserLiveLabel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserLiveLabel;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveLabel;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

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
    const/4 v0, 0x7

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_7

    .line 84
    .line 85
    const/16 v1, 0x9

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_8

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v0, :cond_9

    .line 106
    .line 107
    const/16 v1, 0xb

    .line 108
    .line 109
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 115
    .line 116
    if-eqz v0, :cond_a

    .line 117
    .line 118
    const/16 v1, 0xc

    .line 119
    .line 120
    sget-object v2, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_b

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 139
    .line 140
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveLabel;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveLabel$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveLabel;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserLiveLabel;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 76
    .line 77
    if-nez p1, :cond_a

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->new_()Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 84
    .line 85
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_16

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 90
    .line 91
    return-object p0

    .line 92
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_b

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

    .line 200
    .line 201
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 202
    .line 203
    if-nez p1, :cond_c

    .line 204
    .line 205
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

    .line 206
    .line 207
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 208
    .line 209
    if-nez p1, :cond_d

    .line 210
    .line 211
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 212
    .line 213
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p1, :cond_e

    .line 216
    .line 217
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 218
    .line 219
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 220
    .line 221
    if-nez p1, :cond_f

    .line 222
    .line 223
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

    .line 224
    .line 225
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 226
    .line 227
    if-nez p1, :cond_10

    .line 228
    .line 229
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 230
    .line 231
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 232
    .line 233
    if-nez p1, :cond_11

    .line 234
    .line 235
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 236
    .line 237
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_12

    .line 240
    .line 241
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 242
    .line 243
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 244
    .line 245
    if-nez p1, :cond_13

    .line 246
    .line 247
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 248
    .line 249
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 250
    .line 251
    if-nez p1, :cond_14

    .line 252
    .line 253
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 254
    .line 255
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 256
    .line 257
    if-nez p1, :cond_15

    .line 258
    .line 259
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->new_()Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 264
    .line 265
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_16

    .line 268
    .line 269
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 270
    .line 271
    :cond_16
    return-object p0

    .line 272
    nop

    .line 273
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x38 -> :sswitch_6
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

    .line 273
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveLabel$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveLabel;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserLiveLabel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->mainTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->subTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->buttonTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

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
    const/4 p0, 0x7

    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const/16 v0, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p0, :cond_8

    .line 76
    .line 77
    const/16 v0, 0xa

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_9

    .line 85
    .line 86
    const/16 v0, 0xb

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;

    .line 92
    .line 93
    if-eqz p0, :cond_a

    .line 94
    .line 95
    const/16 v0, 0xc

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/data/LiveMultiCallInfoInLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveLabel;->schema:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p0, :cond_b

    .line 105
    .line 106
    const/16 p1, 0xd

    .line 107
    .line 108
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveLabel;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserLiveLabel$1;->serialize(Lcom/p1/mobile/putong/data/UserLiveLabel;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
