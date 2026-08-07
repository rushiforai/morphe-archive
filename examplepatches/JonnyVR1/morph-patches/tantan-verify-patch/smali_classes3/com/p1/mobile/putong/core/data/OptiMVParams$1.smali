.class Lcom/p1/mobile/putong/core/data/OptiMVParams$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/OptiMVParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/OptiMVParams;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/OptiMVParams;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

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
    const/16 v0, 0xa

    .line 93
    .line 94
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0xb

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xc

    .line 117
    .line 118
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz v0, :cond_a

    .line 126
    .line 127
    const/16 v1, 0xd

    .line 128
    .line 129
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    add-int/2addr p0, v0

    .line 134
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v0, :cond_b

    .line 137
    .line 138
    const/16 v1, 0xe

    .line 139
    .line 140
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v0, :cond_c

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
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v0, :cond_d

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
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v0, :cond_e

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
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v0, :cond_f

    .line 181
    .line 182
    const/16 v1, 0x12

    .line 183
    .line 184
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_f
    const/16 v0, 0x13

    .line 190
    .line 191
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 192
    .line 193
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    const/16 v0, 0x14

    .line 199
    .line 200
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 201
    .line 202
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v0, :cond_10

    .line 210
    .line 211
    const/16 v1, 0x15

    .line 212
    .line 213
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    add-int/2addr p0, v0

    .line 218
    :cond_10
    const/16 v0, 0x16

    .line 219
    .line 220
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 221
    .line 222
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    add-int/2addr p0, v0

    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 228
    .line 229
    if-eqz v0, :cond_11

    .line 230
    .line 231
    const/16 v1, 0x17

    .line 232
    .line 233
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    add-int/2addr p0, v0

    .line 238
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v0, :cond_12

    .line 241
    .line 242
    const/16 v1, 0x18

    .line 243
    .line 244
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    add-int/2addr p0, v0

    .line 249
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 250
    .line 251
    if-eqz v0, :cond_13

    .line 252
    .line 253
    const/16 v1, 0x19

    .line 254
    .line 255
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    add-int/2addr p0, v0

    .line 260
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 261
    .line 262
    if-eqz v0, :cond_14

    .line 263
    .line 264
    const/16 v1, 0x1a

    .line 265
    .line 266
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    add-int/2addr p0, v0

    .line 271
    :cond_14
    const/16 v0, 0x1b

    .line 272
    .line 273
    iget v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 274
    .line 275
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    const/16 v0, 0x1c

    .line 281
    .line 282
    iget v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 283
    .line 284
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    add-int/2addr p0, v0

    .line 289
    const/16 v0, 0x1d

    .line 290
    .line 291
    iget v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 292
    .line 293
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    add-int/2addr p0, v0

    .line 298
    const/16 v0, 0x1e

    .line 299
    .line 300
    iget v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 301
    .line 302
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    add-int/2addr p0, v0

    .line 307
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 308
    .line 309
    if-eqz v0, :cond_15

    .line 310
    .line 311
    const/16 v1, 0x1f

    .line 312
    .line 313
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    add-int/2addr p0, v0

    .line 318
    :cond_15
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 319
    .line 320
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 321
    check-cast p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/OptiMVParams$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/OptiMVParams;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/OptiMVParams;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_a

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 80
    .line 81
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_b

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 86
    .line 87
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_c

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 92
    .line 93
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_d

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 98
    .line 99
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_e

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 104
    .line 105
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_f

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 110
    .line 111
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_10

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 116
    .line 117
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 118
    .line 119
    if-nez p1, :cond_11

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 122
    .line 123
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_12

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 128
    .line 129
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_13

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 134
    .line 135
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 136
    .line 137
    if-nez p1, :cond_14

    .line 138
    .line 139
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 140
    .line 141
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 142
    .line 143
    if-nez p1, :cond_2a

    .line 144
    .line 145
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 146
    .line 147
    return-object p0

    .line 148
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    iput v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 257
    .line 258
    goto/16 :goto_0

    .line 259
    .line 260
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 313
    .line 314
    goto/16 :goto_0

    .line 315
    .line 316
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 329
    .line 330
    goto/16 :goto_0

    .line 331
    .line 332
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 337
    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 353
    .line 354
    goto/16 :goto_0

    .line 355
    .line 356
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 361
    .line 362
    goto/16 :goto_0

    .line 363
    .line 364
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 369
    .line 370
    goto/16 :goto_0

    .line 371
    .line 372
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 373
    .line 374
    .line 375
    move-result-wide v0

    .line 376
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 385
    .line 386
    goto/16 :goto_0

    .line 387
    .line 388
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 393
    .line 394
    goto/16 :goto_0

    .line 395
    .line 396
    :sswitch_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 397
    .line 398
    if-nez p1, :cond_15

    .line 399
    .line 400
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 401
    .line 402
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 403
    .line 404
    if-nez p1, :cond_16

    .line 405
    .line 406
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 407
    .line 408
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 409
    .line 410
    if-nez p1, :cond_17

    .line 411
    .line 412
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 413
    .line 414
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 415
    .line 416
    if-nez p1, :cond_18

    .line 417
    .line 418
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 419
    .line 420
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 421
    .line 422
    if-nez p1, :cond_19

    .line 423
    .line 424
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 425
    .line 426
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 427
    .line 428
    if-nez p1, :cond_1a

    .line 429
    .line 430
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 431
    .line 432
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 433
    .line 434
    if-nez p1, :cond_1b

    .line 435
    .line 436
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 437
    .line 438
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 439
    .line 440
    if-nez p1, :cond_1c

    .line 441
    .line 442
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 443
    .line 444
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 445
    .line 446
    if-nez p1, :cond_1d

    .line 447
    .line 448
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 449
    .line 450
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 451
    .line 452
    if-nez p1, :cond_1e

    .line 453
    .line 454
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 455
    .line 456
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 457
    .line 458
    if-nez p1, :cond_1f

    .line 459
    .line 460
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 461
    .line 462
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 463
    .line 464
    if-nez p1, :cond_20

    .line 465
    .line 466
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 467
    .line 468
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 469
    .line 470
    if-nez p1, :cond_21

    .line 471
    .line 472
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 473
    .line 474
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 475
    .line 476
    if-nez p1, :cond_22

    .line 477
    .line 478
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 479
    .line 480
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 481
    .line 482
    if-nez p1, :cond_23

    .line 483
    .line 484
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 485
    .line 486
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 487
    .line 488
    if-nez p1, :cond_24

    .line 489
    .line 490
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 491
    .line 492
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 493
    .line 494
    if-nez p1, :cond_25

    .line 495
    .line 496
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 497
    .line 498
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 499
    .line 500
    if-nez p1, :cond_26

    .line 501
    .line 502
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 503
    .line 504
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 505
    .line 506
    if-nez p1, :cond_27

    .line 507
    .line 508
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 509
    .line 510
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 511
    .line 512
    if-nez p1, :cond_28

    .line 513
    .line 514
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 515
    .line 516
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 517
    .line 518
    if-nez p1, :cond_29

    .line 519
    .line 520
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 521
    .line 522
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 523
    .line 524
    if-nez p1, :cond_2a

    .line 525
    .line 526
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 527
    .line 528
    :cond_2a
    return-object p0

    .line 529
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1f
        0xa -> :sswitch_1e
        0x12 -> :sswitch_1d
        0x19 -> :sswitch_1c
        0x22 -> :sswitch_1b
        0x2a -> :sswitch_1a
        0x32 -> :sswitch_19
        0x3a -> :sswitch_18
        0x42 -> :sswitch_17
        0x4a -> :sswitch_16
        0x50 -> :sswitch_15
        0x5a -> :sswitch_14
        0x62 -> :sswitch_13
        0x6a -> :sswitch_12
        0x72 -> :sswitch_11
        0x7a -> :sswitch_10
        0x82 -> :sswitch_f
        0x8a -> :sswitch_e
        0x92 -> :sswitch_d
        0x98 -> :sswitch_c
        0xa0 -> :sswitch_b
        0xaa -> :sswitch_a
        0xb0 -> :sswitch_9
        0xba -> :sswitch_8
        0xc2 -> :sswitch_7
        0xca -> :sswitch_6
        0xd2 -> :sswitch_5
        0xd8 -> :sswitch_4
        0xe0 -> :sswitch_3
        0xe8 -> :sswitch_2
        0xf0 -> :sswitch_1
        0xfa -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 529
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/OptiMVParams$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/OptiMVParams;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/OptiMVParams;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

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
    const/16 p0, 0xa

    .line 74
    .line 75
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const/16 v0, 0xb

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_9

    .line 92
    .line 93
    const/16 v0, 0xc

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_a

    .line 101
    .line 102
    const/16 v0, 0xd

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_b

    .line 110
    .line 111
    const/16 v0, 0xe

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_c

    .line 119
    .line 120
    const/16 v0, 0xf

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz p0, :cond_d

    .line 128
    .line 129
    const/16 v0, 0x10

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_e

    .line 137
    .line 138
    const/16 v0, 0x11

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz p0, :cond_f

    .line 146
    .line 147
    const/16 v0, 0x12

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_f
    const/16 p0, 0x13

    .line 153
    .line 154
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 155
    .line 156
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 157
    .line 158
    .line 159
    const/16 p0, 0x14

    .line 160
    .line 161
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 162
    .line 163
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 167
    .line 168
    if-eqz p0, :cond_10

    .line 169
    .line 170
    const/16 v0, 0x15

    .line 171
    .line 172
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    :cond_10
    const/16 p0, 0x16

    .line 176
    .line 177
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 178
    .line 179
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 180
    .line 181
    .line 182
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz p0, :cond_11

    .line 185
    .line 186
    const/16 v0, 0x17

    .line 187
    .line 188
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz p0, :cond_12

    .line 194
    .line 195
    const/16 v0, 0x18

    .line 196
    .line 197
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz p0, :cond_13

    .line 203
    .line 204
    const/16 v0, 0x19

    .line 205
    .line 206
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 210
    .line 211
    if-eqz p0, :cond_14

    .line 212
    .line 213
    const/16 v0, 0x1a

    .line 214
    .line 215
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :cond_14
    const/16 p0, 0x1b

    .line 219
    .line 220
    iget v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 221
    .line 222
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 223
    .line 224
    .line 225
    const/16 p0, 0x1c

    .line 226
    .line 227
    iget v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 228
    .line 229
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 230
    .line 231
    .line 232
    const/16 p0, 0x1d

    .line 233
    .line 234
    iget v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 235
    .line 236
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 237
    .line 238
    .line 239
    const/16 p0, 0x1e

    .line 240
    .line 241
    iget v0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 242
    .line 243
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 244
    .line 245
    .line 246
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 247
    .line 248
    if-eqz p0, :cond_15

    .line 249
    .line 250
    const/16 p1, 0x1f

    .line 251
    .line 252
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_15
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 256
    check-cast p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/OptiMVParams$1;->serialize(Lcom/p1/mobile/putong/core/data/OptiMVParams;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
