.class Lcom/p1/mobile/putong/data/PushMessage$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/PushMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/PushMessage;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/PushMessage;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    const/4 v0, 0x4

    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    const/4 v0, 0x6

    .line 55
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/4 v0, 0x7

    .line 63
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    const/16 v0, 0x9

    .line 80
    .line 81
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    const/16 v1, 0xa

    .line 93
    .line 94
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 100
    .line 101
    if-eqz v0, :cond_5

    .line 102
    .line 103
    const/16 v1, 0xb

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/data/PushMessageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_5
    const/16 v0, 0xc

    .line 113
    .line 114
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 115
    .line 116
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    const/16 v1, 0xd

    .line 126
    .line 127
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 133
    .line 134
    if-eqz v0, :cond_7

    .line 135
    .line 136
    const/16 v1, 0xe

    .line 137
    .line 138
    sget-object v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v0, :cond_8

    .line 148
    .line 149
    const/16 v1, 0xf

    .line 150
    .line 151
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    add-int/2addr p0, v0

    .line 156
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v0, :cond_9

    .line 159
    .line 160
    const/16 v1, 0x10

    .line 161
    .line 162
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    add-int/2addr p0, v0

    .line 167
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->pushName:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v0, :cond_a

    .line 170
    .line 171
    const/16 v1, 0x11

    .line 172
    .line 173
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    add-int/2addr p0, v0

    .line 178
    :cond_a
    const/16 v0, 0x12

    .line 179
    .line 180
    iget v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->longLinkMessageType:I

    .line 181
    .line 182
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    const/16 v0, 0x13

    .line 188
    .line 189
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->isShow:Z

    .line 190
    .line 191
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    add-int/2addr p0, v0

    .line 196
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 197
    .line 198
    if-eqz v0, :cond_b

    .line 199
    .line 200
    const/16 v1, 0x14

    .line 201
    .line 202
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 208
    .line 209
    if-eqz v0, :cond_c

    .line 210
    .line 211
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    const/16 v2, 0x15

    .line 218
    .line 219
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    add-int/2addr p0, v0

    .line 224
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 225
    .line 226
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 227
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PushMessage$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/PushMessage;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PushMessage;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PushMessage;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageContent;->new_()Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 58
    .line 59
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 60
    .line 61
    if-nez p1, :cond_6

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 64
    .line 65
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 66
    .line 67
    if-nez p1, :cond_e

    .line 68
    .line 69
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 72
    .line 73
    return-object p0

    .line 74
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Ljava/util/Map;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->isShow:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->longLinkMessageType:I

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushName:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 152
    .line 153
    .line 154
    move-result-wide v0

    .line 155
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/PushMessageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 166
    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iput v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iput v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    iput v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 252
    .line 253
    if-nez p1, :cond_7

    .line 254
    .line 255
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 256
    .line 257
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 258
    .line 259
    if-nez p1, :cond_8

    .line 260
    .line 261
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 262
    .line 263
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 264
    .line 265
    if-nez p1, :cond_9

    .line 266
    .line 267
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 268
    .line 269
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 270
    .line 271
    if-nez p1, :cond_a

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 274
    .line 275
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 276
    .line 277
    if-nez p1, :cond_b

    .line 278
    .line 279
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageContent;->new_()Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 284
    .line 285
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 286
    .line 287
    if-nez p1, :cond_c

    .line 288
    .line 289
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 294
    .line 295
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 296
    .line 297
    if-nez p1, :cond_d

    .line 298
    .line 299
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 300
    .line 301
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 302
    .line 303
    if-nez p1, :cond_e

    .line 304
    .line 305
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 308
    .line 309
    :cond_e
    return-object p0

    .line 310
    nop

    .line 311
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_15
        0xa -> :sswitch_14
        0x12 -> :sswitch_13
        0x1a -> :sswitch_12
        0x20 -> :sswitch_11
        0x2a -> :sswitch_10
        0x30 -> :sswitch_f
        0x38 -> :sswitch_e
        0x40 -> :sswitch_d
        0x48 -> :sswitch_c
        0x52 -> :sswitch_b
        0x5a -> :sswitch_a
        0x61 -> :sswitch_9
        0x6a -> :sswitch_8
        0x72 -> :sswitch_7
        0x7a -> :sswitch_6
        0x82 -> :sswitch_5
        0x8a -> :sswitch_4
        0x90 -> :sswitch_3
        0x98 -> :sswitch_2
        0xa2 -> :sswitch_1
        0xaa -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 311
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PushMessage$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PushMessage;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/PushMessage;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    const/4 p0, 0x4

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    const/4 p0, 0x6

    .line 44
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x7

    .line 50
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 53
    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0x9

    .line 63
    .line 64
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    const/16 v0, 0xa

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 79
    .line 80
    if-eqz p0, :cond_5

    .line 81
    .line 82
    const/16 v0, 0xb

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/data/PushMessageContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    const/16 p0, 0xc

    .line 90
    .line 91
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 92
    .line 93
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p0, :cond_6

    .line 99
    .line 100
    const/16 v0, 0xd

    .line 101
    .line 102
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 106
    .line 107
    if-eqz p0, :cond_7

    .line 108
    .line 109
    const/16 v0, 0xe

    .line 110
    .line 111
    sget-object v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const/16 v0, 0xf

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz p0, :cond_9

    .line 128
    .line 129
    const/16 v0, 0x10

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->pushName:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    const/16 v0, 0x11

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_a
    const/16 p0, 0x12

    .line 144
    .line 145
    iget v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->longLinkMessageType:I

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 148
    .line 149
    .line 150
    const/16 p0, 0x13

    .line 151
    .line 152
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->isShow:Z

    .line 153
    .line 154
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz p0, :cond_b

    .line 160
    .line 161
    const/16 v0, 0x14

    .line 162
    .line 163
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustomMap:Ljava/util/Map;

    .line 167
    .line 168
    if-eqz p0, :cond_c

    .line 169
    .line 170
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    const/16 v0, 0x15

    .line 177
    .line 178
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 179
    .line 180
    .line 181
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

    .line 182
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessage;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/PushMessage$1;->serialize(Lcom/p1/mobile/putong/data/PushMessage;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
