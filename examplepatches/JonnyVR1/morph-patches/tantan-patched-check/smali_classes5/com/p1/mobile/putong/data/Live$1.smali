.class Lcom/p1/mobile/putong/data/Live$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Live;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Live;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Live;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->memberCount:D

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_4
    const/16 v0, 0x8

    .line 77
    .line 78
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 79
    .line 80
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 86
    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    const/16 v1, 0x9

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v0, :cond_7

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const/16 v2, 0xb

    .line 122
    .line 123
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 129
    .line 130
    if-eqz v0, :cond_8

    .line 131
    .line 132
    sget-object v1, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    const/16 v2, 0xc

    .line 139
    .line 140
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_8
    const/16 v0, 0xd

    .line 146
    .line 147
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 148
    .line 149
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    const/16 v0, 0xe

    .line 155
    .line 156
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 157
    .line 158
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    add-int/2addr p0, v0

    .line 163
    const/16 v0, 0xf

    .line 164
    .line 165
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 166
    .line 167
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    add-int/2addr p0, v0

    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 173
    .line 174
    if-eqz v0, :cond_9

    .line 175
    .line 176
    const/16 v1, 0x10

    .line 177
    .line 178
    sget-object v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    add-int/2addr p0, v0

    .line 185
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 186
    .line 187
    if-eqz v0, :cond_a

    .line 188
    .line 189
    const/16 v1, 0x11

    .line 190
    .line 191
    sget-object v2, Lcom/p1/mobile/putong/data/RecommendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 199
    .line 200
    if-eqz v0, :cond_b

    .line 201
    .line 202
    const/16 v1, 0x12

    .line 203
    .line 204
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    add-int/2addr p0, v0

    .line 209
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 210
    .line 211
    if-eqz v0, :cond_c

    .line 212
    .line 213
    const/16 v1, 0x13

    .line 214
    .line 215
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    add-int/2addr p0, v0

    .line 222
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 223
    .line 224
    if-eqz v0, :cond_d

    .line 225
    .line 226
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 227
    .line 228
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    const/16 v2, 0x14

    .line 233
    .line 234
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    add-int/2addr p0, v0

    .line 239
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 240
    .line 241
    if-eqz v0, :cond_e

    .line 242
    .line 243
    const/16 v1, 0x15

    .line 244
    .line 245
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    add-int/2addr p0, v0

    .line 250
    :cond_e
    const/16 v0, 0x16

    .line 251
    .line 252
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 253
    .line 254
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    add-int/2addr p0, v0

    .line 259
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 260
    .line 261
    if-eqz v0, :cond_f

    .line 262
    .line 263
    const/16 v1, 0x17

    .line 264
    .line 265
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 266
    .line 267
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    add-int/2addr p0, v0

    .line 272
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 273
    .line 274
    if-eqz v0, :cond_10

    .line 275
    .line 276
    const/16 v1, 0x18

    .line 277
    .line 278
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 279
    .line 280
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    add-int/2addr p0, v0

    .line 285
    :cond_10
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 286
    .line 287
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 288
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Live$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Live;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Live;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Live;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 52
    .line 53
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 86
    .line 87
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 92
    .line 93
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 103
    .line 104
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 114
    .line 115
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 124
    .line 125
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 126
    .line 127
    if-nez p1, :cond_a

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendInfo;->new_()Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 134
    .line 135
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 136
    .line 137
    if-nez p1, :cond_b

    .line 138
    .line 139
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 140
    .line 141
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 142
    .line 143
    if-nez p1, :cond_c

    .line 144
    .line 145
    new-instance p1, Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .line 149
    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 151
    .line 152
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_1a

    .line 155
    .line 156
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 157
    .line 158
    return-object p0

    .line 159
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Lcom/p1/mobile/putong/data/LiveState;

    .line 166
    .line 167
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 178
    .line 179
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_4
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Ljava/util/List;

    .line 210
    .line 211
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 222
    .line 223
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :sswitch_7
    sget-object v2, Lcom/p1/mobile/putong/data/RecommendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 236
    .line 237
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 242
    .line 243
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_8
    sget-object v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    check-cast v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 254
    .line 255
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 256
    .line 257
    goto/16 :goto_0

    .line 258
    .line 259
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 260
    .line 261
    .line 262
    move-result-wide v2

    .line 263
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 268
    .line 269
    .line 270
    move-result-wide v2

    .line 271
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 276
    .line 277
    .line 278
    move-result-wide v2

    .line 279
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 280
    .line 281
    goto/16 :goto_0

    .line 282
    .line 283
    :sswitch_c
    sget-object v2, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 284
    .line 285
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    check-cast v2, Ljava/util/List;

    .line 294
    .line 295
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 296
    .line 297
    goto/16 :goto_0

    .line 298
    .line 299
    :sswitch_d
    sget-object v2, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 300
    .line 301
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    check-cast v2, Ljava/util/List;

    .line 310
    .line 311
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 312
    .line 313
    goto/16 :goto_0

    .line 314
    .line 315
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 334
    .line 335
    .line 336
    move-result-wide v2

    .line 337
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 338
    .line 339
    goto/16 :goto_0

    .line 340
    .line 341
    :sswitch_11
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 342
    .line 343
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 348
    .line 349
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 350
    .line 351
    goto/16 :goto_0

    .line 352
    .line 353
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 354
    .line 355
    .line 356
    move-result-wide v2

    .line 357
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 362
    .line 363
    .line 364
    move-result-wide v2

    .line 365
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 366
    .line 367
    goto/16 :goto_0

    .line 368
    .line 369
    :sswitch_14
    sget-object v2, Lcom/p1/mobile/putong/data/StreamUrl;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v2

    .line 375
    check-cast v2, Lcom/p1/mobile/putong/data/StreamUrl;

    .line 376
    .line 377
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 378
    .line 379
    goto/16 :goto_0

    .line 380
    .line 381
    :sswitch_15
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 382
    .line 383
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    check-cast v2, Lcom/p1/mobile/putong/data/Owner;

    .line 388
    .line 389
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_16
    sget-object v2, Lcom/p1/mobile/putong/data/Owner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 394
    .line 395
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    check-cast v2, Lcom/p1/mobile/putong/data/Owner;

    .line 400
    .line 401
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 402
    .line 403
    goto/16 :goto_0

    .line 404
    .line 405
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 410
    .line 411
    goto/16 :goto_0

    .line 412
    .line 413
    :sswitch_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 414
    .line 415
    if-nez p1, :cond_d

    .line 416
    .line 417
    if-eqz v1, :cond_d

    .line 418
    .line 419
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 420
    .line 421
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 430
    .line 431
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 432
    .line 433
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 434
    .line 435
    if-nez p1, :cond_e

    .line 436
    .line 437
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 438
    .line 439
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 440
    .line 441
    if-nez p1, :cond_f

    .line 442
    .line 443
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 444
    .line 445
    .line 446
    move-result-object p1

    .line 447
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 448
    .line 449
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 450
    .line 451
    if-nez p1, :cond_10

    .line 452
    .line 453
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 458
    .line 459
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 460
    .line 461
    if-nez p1, :cond_11

    .line 462
    .line 463
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamUrl;->new_()Lcom/p1/mobile/putong/data/StreamUrl;

    .line 464
    .line 465
    .line 466
    move-result-object p1

    .line 467
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 468
    .line 469
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 470
    .line 471
    if-nez p1, :cond_12

    .line 472
    .line 473
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 474
    .line 475
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 476
    .line 477
    .line 478
    move-result-object p1

    .line 479
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 480
    .line 481
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 482
    .line 483
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 484
    .line 485
    if-nez p1, :cond_13

    .line 486
    .line 487
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 488
    .line 489
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 490
    .line 491
    if-nez p1, :cond_14

    .line 492
    .line 493
    new-instance p1, Ljava/util/ArrayList;

    .line 494
    .line 495
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 496
    .line 497
    .line 498
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 499
    .line 500
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 501
    .line 502
    if-nez p1, :cond_15

    .line 503
    .line 504
    new-instance p1, Ljava/util/ArrayList;

    .line 505
    .line 506
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 507
    .line 508
    .line 509
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 510
    .line 511
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 512
    .line 513
    if-nez p1, :cond_16

    .line 514
    .line 515
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->new_()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 516
    .line 517
    .line 518
    move-result-object p1

    .line 519
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 520
    .line 521
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 522
    .line 523
    if-nez p1, :cond_17

    .line 524
    .line 525
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendInfo;->new_()Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 526
    .line 527
    .line 528
    move-result-object p1

    .line 529
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 530
    .line 531
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 532
    .line 533
    if-nez p1, :cond_18

    .line 534
    .line 535
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 536
    .line 537
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 538
    .line 539
    if-nez p1, :cond_19

    .line 540
    .line 541
    new-instance p1, Ljava/util/ArrayList;

    .line 542
    .line 543
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 544
    .line 545
    .line 546
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 547
    .line 548
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 549
    .line 550
    if-nez p1, :cond_1a

    .line 551
    .line 552
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 553
    .line 554
    :cond_1a
    return-object p0

    .line 555
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_18
        0xa -> :sswitch_17
        0x12 -> :sswitch_16
        0x1a -> :sswitch_15
        0x22 -> :sswitch_14
        0x29 -> :sswitch_13
        0x31 -> :sswitch_12
        0x3a -> :sswitch_11
        0x41 -> :sswitch_10
        0x48 -> :sswitch_f
        0x52 -> :sswitch_e
        0x5a -> :sswitch_d
        0x62 -> :sswitch_c
        0x69 -> :sswitch_b
        0x70 -> :sswitch_a
        0x79 -> :sswitch_9
        0x82 -> :sswitch_8
        0x8a -> :sswitch_7
        0x92 -> :sswitch_6
        0x9a -> :sswitch_5
        0xa2 -> :sswitch_4
        0xaa -> :sswitch_3
        0xb0 -> :sswitch_2
        0xba -> :sswitch_1
        0xc2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 555
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Live$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Live;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Live;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    const/16 p0, 0x8

    .line 62
    .line 63
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const/16 v0, 0x9

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_6

    .line 84
    .line 85
    const/16 v0, 0xa

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 91
    .line 92
    if-eqz p0, :cond_7

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/data/LiveBasicLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const/16 v1, 0xb

    .line 101
    .line 102
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 103
    .line 104
    .line 105
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 106
    .line 107
    if-eqz p0, :cond_8

    .line 108
    .line 109
    sget-object v0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/16 v1, 0xc

    .line 116
    .line 117
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 118
    .line 119
    .line 120
    :cond_8
    const/16 p0, 0xd

    .line 121
    .line 122
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 123
    .line 124
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 125
    .line 126
    .line 127
    const/16 p0, 0xe

    .line 128
    .line 129
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 130
    .line 131
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 132
    .line 133
    .line 134
    const/16 p0, 0xf

    .line 135
    .line 136
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 137
    .line 138
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 142
    .line 143
    if-eqz p0, :cond_9

    .line 144
    .line 145
    const/16 v0, 0x10

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/data/StreamCdnInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 150
    .line 151
    .line 152
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 153
    .line 154
    if-eqz p0, :cond_a

    .line 155
    .line 156
    const/16 v0, 0x11

    .line 157
    .line 158
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 161
    .line 162
    .line 163
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz p0, :cond_b

    .line 166
    .line 167
    const/16 v0, 0x12

    .line 168
    .line 169
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 173
    .line 174
    if-eqz p0, :cond_c

    .line 175
    .line 176
    const/16 v0, 0x13

    .line 177
    .line 178
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 181
    .line 182
    .line 183
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 184
    .line 185
    if-eqz p0, :cond_d

    .line 186
    .line 187
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    const/16 v1, 0x14

    .line 194
    .line 195
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 196
    .line 197
    .line 198
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 199
    .line 200
    if-eqz p0, :cond_e

    .line 201
    .line 202
    const/16 v0, 0x15

    .line 203
    .line 204
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_e
    const/16 p0, 0x16

    .line 208
    .line 209
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 210
    .line 211
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 215
    .line 216
    if-eqz p0, :cond_f

    .line 217
    .line 218
    const/16 v0, 0x17

    .line 219
    .line 220
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 221
    .line 222
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 223
    .line 224
    .line 225
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 226
    .line 227
    if-eqz p0, :cond_10

    .line 228
    .line 229
    const/16 p1, 0x18

    .line 230
    .line 231
    sget-object v0, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 232
    .line 233
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 234
    .line 235
    .line 236
    :cond_10
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Live$1;->serialize(Lcom/p1/mobile/putong/data/Live;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
