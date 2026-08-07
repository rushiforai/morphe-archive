.class Lcom/p1/mobile/putong/feed/data/VoiceLive$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/VoiceLive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/VoiceLive;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/data/StreamUrl;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    const/4 v0, 0x5

    .line 49
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 50
    .line 51
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/4 v0, 0x6

    .line 57
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    const/4 v0, 0x7

    .line 65
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/16 v2, 0xa

    .line 109
    .line 110
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 116
    .line 117
    if-eqz v0, :cond_7

    .line 118
    .line 119
    sget-object v1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    const/16 v2, 0xb

    .line 126
    .line 127
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_7
    const/16 v0, 0xc

    .line 133
    .line 134
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 135
    .line 136
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 142
    .line 143
    if-eqz v0, :cond_8

    .line 144
    .line 145
    const/16 v1, 0xd

    .line 146
    .line 147
    sget-object v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v0, :cond_9

    .line 157
    .line 158
    const/16 v1, 0xe

    .line 159
    .line 160
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    const/16 v1, 0xf

    .line 170
    .line 171
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-int/2addr p0, v0

    .line 176
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 177
    .line 178
    if-eqz v0, :cond_b

    .line 179
    .line 180
    const/16 v1, 0x10

    .line 181
    .line 182
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 188
    .line 189
    if-eqz v0, :cond_c

    .line 190
    .line 191
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    const/16 v2, 0x11

    .line 198
    .line 199
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    add-int/2addr p0, v0

    .line 204
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 205
    .line 206
    if-eqz v0, :cond_d

    .line 207
    .line 208
    const/16 v1, 0x12

    .line 209
    .line 210
    sget-object v2, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    add-int/2addr p0, v0

    .line 217
    :cond_d
    const/16 v0, 0x13

    .line 218
    .line 219
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 220
    .line 221
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    const/16 v0, 0x14

    .line 227
    .line 228
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 229
    .line 230
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    add-int/2addr p0, v0

    .line 235
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 236
    .line 237
    if-eqz v0, :cond_e

    .line 238
    .line 239
    const/16 v1, 0x15

    .line 240
    .line 241
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 242
    .line 243
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    add-int/2addr p0, v0

    .line 248
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 249
    .line 250
    if-eqz v0, :cond_f

    .line 251
    .line 252
    const/16 v1, 0x16

    .line 253
    .line 254
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 255
    .line 256
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    add-int/2addr p0, v0

    .line 261
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 262
    .line 263
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 264
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/VoiceLive$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/VoiceLive;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 52
    .line 53
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 54
    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamUrl;->new_()Lcom/p1/mobile/putong/data/StreamUrl;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 86
    .line 87
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 92
    .line 93
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 94
    .line 95
    if-nez p1, :cond_7

    .line 96
    .line 97
    new-instance p1, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 103
    .line 104
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 105
    .line 106
    if-nez p1, :cond_8

    .line 107
    .line 108
    new-instance p1, Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 114
    .line 115
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 116
    .line 117
    if-nez p1, :cond_9

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->new_()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 124
    .line 125
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 126
    .line 127
    if-nez p1, :cond_a

    .line 128
    .line 129
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 130
    .line 131
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 132
    .line 133
    if-nez p1, :cond_b

    .line 134
    .line 135
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 136
    .line 137
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 138
    .line 139
    if-nez p1, :cond_c

    .line 140
    .line 141
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 142
    .line 143
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 144
    .line 145
    if-nez p1, :cond_d

    .line 146
    .line 147
    new-instance p1, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 153
    .line 154
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 155
    .line 156
    if-nez p1, :cond_e

    .line 157
    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->new_()Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 163
    .line 164
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 165
    .line 166
    if-nez p1, :cond_1e

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->new_()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 173
    .line 174
    return-object p0

    .line 175
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Lcom/p1/mobile/putong/data/LiveState;

    .line 182
    .line 183
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 194
    .line 195
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 200
    .line 201
    .line 202
    move-result-wide v2

    .line 203
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 208
    .line 209
    .line 210
    move-result-wide v2

    .line 211
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    check-cast v2, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 222
    .line 223
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_5
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    check-cast v2, Ljava/util/List;

    .line 238
    .line 239
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 256
    .line 257
    goto/16 :goto_0

    .line 258
    .line 259
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_9
    sget-object v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    check-cast v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 274
    .line 275
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 280
    .line 281
    .line 282
    move-result-wide v2

    .line 283
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 284
    .line 285
    goto/16 :goto_0

    .line 286
    .line 287
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 288
    .line 289
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    check-cast v2, Ljava/util/List;

    .line 298
    .line 299
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :sswitch_c
    sget-object v2, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 304
    .line 305
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    check-cast v2, Ljava/util/List;

    .line 314
    .line 315
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 338
    .line 339
    .line 340
    move-result-wide v2

    .line 341
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 346
    .line 347
    .line 348
    move-result-wide v2

    .line 349
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 350
    .line 351
    goto/16 :goto_0

    .line 352
    .line 353
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 354
    .line 355
    .line 356
    move-result-wide v2

    .line 357
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :sswitch_12
    sget-object v2, Lcom/p1/mobile/putong/data/StreamUrl;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 362
    .line 363
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    check-cast v2, Lcom/p1/mobile/putong/data/StreamUrl;

    .line 368
    .line 369
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 370
    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :sswitch_13
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 374
    .line 375
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    check-cast v2, Lcom/p1/mobile/putong/data/Owner;

    .line 380
    .line 381
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 382
    .line 383
    goto/16 :goto_0

    .line 384
    .line 385
    :sswitch_14
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 386
    .line 387
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v2

    .line 391
    check-cast v2, Lcom/p1/mobile/putong/data/Owner;

    .line 392
    .line 393
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 394
    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v2

    .line 401
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 402
    .line 403
    goto/16 :goto_0

    .line 404
    .line 405
    :sswitch_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 406
    .line 407
    if-nez p1, :cond_f

    .line 408
    .line 409
    if-eqz v1, :cond_f

    .line 410
    .line 411
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 412
    .line 413
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 422
    .line 423
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 424
    .line 425
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 426
    .line 427
    if-nez p1, :cond_10

    .line 428
    .line 429
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 430
    .line 431
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 432
    .line 433
    if-nez p1, :cond_11

    .line 434
    .line 435
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 440
    .line 441
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 442
    .line 443
    if-nez p1, :cond_12

    .line 444
    .line 445
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 446
    .line 447
    .line 448
    move-result-object p1

    .line 449
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 450
    .line 451
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 452
    .line 453
    if-nez p1, :cond_13

    .line 454
    .line 455
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamUrl;->new_()Lcom/p1/mobile/putong/data/StreamUrl;

    .line 456
    .line 457
    .line 458
    move-result-object p1

    .line 459
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 460
    .line 461
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 462
    .line 463
    if-nez p1, :cond_14

    .line 464
    .line 465
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 466
    .line 467
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 468
    .line 469
    .line 470
    move-result-object p1

    .line 471
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 472
    .line 473
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 474
    .line 475
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 476
    .line 477
    if-nez p1, :cond_15

    .line 478
    .line 479
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 480
    .line 481
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 482
    .line 483
    if-nez p1, :cond_16

    .line 484
    .line 485
    new-instance p1, Ljava/util/ArrayList;

    .line 486
    .line 487
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .line 489
    .line 490
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 491
    .line 492
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 493
    .line 494
    if-nez p1, :cond_17

    .line 495
    .line 496
    new-instance p1, Ljava/util/ArrayList;

    .line 497
    .line 498
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 499
    .line 500
    .line 501
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 502
    .line 503
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 504
    .line 505
    if-nez p1, :cond_18

    .line 506
    .line 507
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->new_()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 508
    .line 509
    .line 510
    move-result-object p1

    .line 511
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 512
    .line 513
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 514
    .line 515
    if-nez p1, :cond_19

    .line 516
    .line 517
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 518
    .line 519
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 520
    .line 521
    if-nez p1, :cond_1a

    .line 522
    .line 523
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 524
    .line 525
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 526
    .line 527
    if-nez p1, :cond_1b

    .line 528
    .line 529
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 530
    .line 531
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 532
    .line 533
    if-nez p1, :cond_1c

    .line 534
    .line 535
    new-instance p1, Ljava/util/ArrayList;

    .line 536
    .line 537
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 538
    .line 539
    .line 540
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 541
    .line 542
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 543
    .line 544
    if-nez p1, :cond_1d

    .line 545
    .line 546
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->new_()Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 551
    .line 552
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 553
    .line 554
    if-nez p1, :cond_1e

    .line 555
    .line 556
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->new_()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 557
    .line 558
    .line 559
    move-result-object p1

    .line 560
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 561
    .line 562
    :cond_1e
    return-object p0

    .line 563
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_16
        0xa -> :sswitch_15
        0x12 -> :sswitch_14
        0x1a -> :sswitch_13
        0x22 -> :sswitch_12
        0x29 -> :sswitch_11
        0x31 -> :sswitch_10
        0x39 -> :sswitch_f
        0x40 -> :sswitch_e
        0x4a -> :sswitch_d
        0x52 -> :sswitch_c
        0x5a -> :sswitch_b
        0x61 -> :sswitch_a
        0x6a -> :sswitch_9
        0x72 -> :sswitch_8
        0x7a -> :sswitch_7
        0x82 -> :sswitch_6
        0x8a -> :sswitch_5
        0x92 -> :sswitch_4
        0x99 -> :sswitch_3
        0xa1 -> :sswitch_2
        0xaa -> :sswitch_1
        0xb2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 563
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/VoiceLive$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/VoiceLive;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/VoiceLive;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/StreamUrl;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    const/4 p0, 0x5

    .line 40
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x7

    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    const/16 v0, 0x9

    .line 75
    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_6

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v1, 0xa

    .line 90
    .line 91
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 95
    .line 96
    if-eqz p0, :cond_7

    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const/16 v1, 0xb

    .line 105
    .line 106
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 107
    .line 108
    .line 109
    :cond_7
    const/16 p0, 0xc

    .line 110
    .line 111
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 112
    .line 113
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const/16 v0, 0xd

    .line 121
    .line 122
    sget-object v1, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 125
    .line 126
    .line 127
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_9

    .line 130
    .line 131
    const/16 v0, 0xe

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p0, :cond_a

    .line 139
    .line 140
    const/16 v0, 0xf

    .line 141
    .line 142
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz p0, :cond_b

    .line 148
    .line 149
    const/16 v0, 0x10

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 155
    .line 156
    if-eqz p0, :cond_c

    .line 157
    .line 158
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    const/16 v1, 0x11

    .line 165
    .line 166
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 167
    .line 168
    .line 169
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 170
    .line 171
    if-eqz p0, :cond_d

    .line 172
    .line 173
    const/16 v0, 0x12

    .line 174
    .line 175
    sget-object v1, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 178
    .line 179
    .line 180
    :cond_d
    const/16 p0, 0x13

    .line 181
    .line 182
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 183
    .line 184
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 185
    .line 186
    .line 187
    const/16 p0, 0x14

    .line 188
    .line 189
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 190
    .line 191
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 195
    .line 196
    if-eqz p0, :cond_e

    .line 197
    .line 198
    const/16 v0, 0x15

    .line 199
    .line 200
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 201
    .line 202
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 203
    .line 204
    .line 205
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 206
    .line 207
    if-eqz p0, :cond_f

    .line 208
    .line 209
    const/16 p1, 0x16

    .line 210
    .line 211
    sget-object v0, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 214
    .line 215
    .line 216
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/VoiceLive$1;->serialize(Lcom/p1/mobile/putong/feed/data/VoiceLive;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
