.class Lcom/p1/mobile/putong/feed/data/TopicMoment$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/TopicMoment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicMoment;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_6

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_7
    const/16 v0, 0x9

    .line 86
    .line 87
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_8

    .line 97
    .line 98
    const/16 v1, 0xa

    .line 99
    .line 100
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_8
    const/16 v0, 0xb

    .line 106
    .line 107
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 108
    .line 109
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    const/16 v0, 0xc

    .line 115
    .line 116
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 117
    .line 118
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    const/16 v0, 0xd

    .line 124
    .line 125
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 126
    .line 127
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    const/16 v0, 0xe

    .line 133
    .line 134
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->commentCounter:I

    .line 135
    .line 136
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v0, :cond_9

    .line 144
    .line 145
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/16 v2, 0xf

    .line 152
    .line 153
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v0, :cond_a

    .line 161
    .line 162
    const/16 v1, 0x10

    .line 163
    .line 164
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    add-int/2addr p0, v0

    .line 169
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v0, :cond_b

    .line 172
    .line 173
    const/16 v1, 0x11

    .line 174
    .line 175
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    add-int/2addr p0, v0

    .line 180
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz v0, :cond_c

    .line 183
    .line 184
    const/16 v1, 0x12

    .line 185
    .line 186
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 192
    .line 193
    if-eqz v0, :cond_d

    .line 194
    .line 195
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 196
    .line 197
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    const/16 v2, 0x13

    .line 202
    .line 203
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    add-int/2addr p0, v0

    .line 208
    :cond_d
    const/16 v0, 0x14

    .line 209
    .line 210
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 211
    .line 212
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    add-int/2addr p0, v0

    .line 217
    const/16 v0, 0x15

    .line 218
    .line 219
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserCounter:I

    .line 220
    .line 221
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 227
    .line 228
    if-eqz v0, :cond_e

    .line 229
    .line 230
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    const/16 v2, 0x16

    .line 237
    .line 238
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    add-int/2addr p0, v0

    .line 243
    :cond_e
    const/16 v0, 0x17

    .line 244
    .line 245
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 246
    .line 247
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    add-int/2addr p0, v0

    .line 252
    const/16 v0, 0x18

    .line 253
    .line 254
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 255
    .line 256
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    add-int/2addr p0, v0

    .line 261
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 262
    .line 263
    if-eqz v0, :cond_f

    .line 264
    .line 265
    const/16 v1, 0x19

    .line 266
    .line 267
    sget-object v2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    add-int/2addr p0, v0

    .line 274
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 275
    .line 276
    if-eqz v0, :cond_10

    .line 277
    .line 278
    const/16 v1, 0x1a

    .line 279
    .line 280
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 281
    .line 282
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    add-int/2addr p0, v0

    .line 287
    :cond_10
    const/16 v0, 0x1b

    .line 288
    .line 289
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 290
    .line 291
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    add-int/2addr p0, v0

    .line 296
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 297
    .line 298
    if-eqz v0, :cond_11

    .line 299
    .line 300
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 301
    .line 302
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    const/16 v2, 0x1c

    .line 307
    .line 308
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    add-int/2addr p0, v0

    .line 313
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 314
    .line 315
    if-eqz v0, :cond_12

    .line 316
    .line 317
    const/16 v1, 0x1d

    .line 318
    .line 319
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 320
    .line 321
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    add-int/2addr p0, v0

    .line 326
    :cond_12
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 327
    .line 328
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 329
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicMoment;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 62
    .line 63
    if-nez p1, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_9

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 78
    .line 79
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_a

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 84
    .line 85
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 86
    .line 87
    if-nez p1, :cond_b

    .line 88
    .line 89
    new-instance p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 95
    .line 96
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 97
    .line 98
    if-nez p1, :cond_c

    .line 99
    .line 100
    new-instance p1, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 106
    .line 107
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 108
    .line 109
    if-nez p1, :cond_d

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 116
    .line 117
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 118
    .line 119
    if-nez p1, :cond_1c

    .line 120
    .line 121
    new-instance p1, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 127
    .line 128
    return-object p0

    .line 129
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_1
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Ljava/util/List;

    .line 152
    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 172
    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 184
    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_7
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 206
    .line 207
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ljava/util/List;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserCounter:I

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 238
    .line 239
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, Ljava/util/List;

    .line 248
    .line 249
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    check-cast v0, Ljava/util/List;

    .line 288
    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->commentCounter:I

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 334
    .line 335
    .line 336
    move-result-wide v0

    .line 337
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 338
    .line 339
    goto/16 :goto_0

    .line 340
    .line 341
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 354
    .line 355
    goto/16 :goto_0

    .line 356
    .line 357
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 370
    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 378
    .line 379
    goto/16 :goto_0

    .line 380
    .line 381
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 386
    .line 387
    goto/16 :goto_0

    .line 388
    .line 389
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 390
    .line 391
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    check-cast v0, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 396
    .line 397
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 406
    .line 407
    goto/16 :goto_0

    .line 408
    .line 409
    :sswitch_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 410
    .line 411
    if-nez p1, :cond_e

    .line 412
    .line 413
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 414
    .line 415
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 416
    .line 417
    if-nez p1, :cond_f

    .line 418
    .line 419
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 424
    .line 425
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 426
    .line 427
    if-nez p1, :cond_10

    .line 428
    .line 429
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 430
    .line 431
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 432
    .line 433
    if-nez p1, :cond_11

    .line 434
    .line 435
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 436
    .line 437
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 438
    .line 439
    if-nez p1, :cond_12

    .line 440
    .line 441
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 442
    .line 443
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 444
    .line 445
    if-nez p1, :cond_13

    .line 446
    .line 447
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 448
    .line 449
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 450
    .line 451
    if-nez p1, :cond_14

    .line 452
    .line 453
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 454
    .line 455
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 456
    .line 457
    if-nez p1, :cond_15

    .line 458
    .line 459
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 460
    .line 461
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 462
    .line 463
    if-nez p1, :cond_16

    .line 464
    .line 465
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 466
    .line 467
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 468
    .line 469
    if-nez p1, :cond_17

    .line 470
    .line 471
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 472
    .line 473
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 474
    .line 475
    if-nez p1, :cond_18

    .line 476
    .line 477
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 478
    .line 479
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 480
    .line 481
    if-nez p1, :cond_19

    .line 482
    .line 483
    new-instance p1, Ljava/util/ArrayList;

    .line 484
    .line 485
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 486
    .line 487
    .line 488
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 489
    .line 490
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 491
    .line 492
    if-nez p1, :cond_1a

    .line 493
    .line 494
    new-instance p1, Ljava/util/ArrayList;

    .line 495
    .line 496
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .line 498
    .line 499
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 500
    .line 501
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 502
    .line 503
    if-nez p1, :cond_1b

    .line 504
    .line 505
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 506
    .line 507
    .line 508
    move-result-object p1

    .line 509
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 510
    .line 511
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 512
    .line 513
    if-nez p1, :cond_1c

    .line 514
    .line 515
    new-instance p1, Ljava/util/ArrayList;

    .line 516
    .line 517
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 518
    .line 519
    .line 520
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 521
    .line 522
    :cond_1c
    return-object p0

    .line 523
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1d
        0xa -> :sswitch_1c
        0x12 -> :sswitch_1b
        0x1a -> :sswitch_1a
        0x22 -> :sswitch_19
        0x2a -> :sswitch_18
        0x32 -> :sswitch_17
        0x3a -> :sswitch_16
        0x42 -> :sswitch_15
        0x49 -> :sswitch_14
        0x52 -> :sswitch_13
        0x58 -> :sswitch_12
        0x60 -> :sswitch_11
        0x68 -> :sswitch_10
        0x70 -> :sswitch_f
        0x7a -> :sswitch_e
        0x82 -> :sswitch_d
        0x8a -> :sswitch_c
        0x92 -> :sswitch_b
        0x9a -> :sswitch_a
        0xa0 -> :sswitch_9
        0xa8 -> :sswitch_8
        0xb2 -> :sswitch_7
        0xb8 -> :sswitch_6
        0xc0 -> :sswitch_5
        0xca -> :sswitch_4
        0xd2 -> :sswitch_3
        0xd8 -> :sswitch_2
        0xe2 -> :sswitch_1
        0xea -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 523
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicMoment;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/IdBoxed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_6

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_7

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_7
    const/16 p0, 0x9

    .line 69
    .line 70
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_8

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_8
    const/16 p0, 0xb

    .line 85
    .line 86
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 87
    .line 88
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 89
    .line 90
    .line 91
    const/16 p0, 0xc

    .line 92
    .line 93
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 96
    .line 97
    .line 98
    const/16 p0, 0xd

    .line 99
    .line 100
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 101
    .line 102
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 103
    .line 104
    .line 105
    const/16 p0, 0xe

    .line 106
    .line 107
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->commentCounter:I

    .line 108
    .line 109
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 113
    .line 114
    if-eqz p0, :cond_9

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/16 v1, 0xf

    .line 123
    .line 124
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const/16 v0, 0x10

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    const/16 v0, 0x11

    .line 141
    .line 142
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz p0, :cond_c

    .line 148
    .line 149
    const/16 v0, 0x12

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 155
    .line 156
    if-eqz p0, :cond_d

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
    const/16 v1, 0x13

    .line 165
    .line 166
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 167
    .line 168
    .line 169
    :cond_d
    const/16 p0, 0x14

    .line 170
    .line 171
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 172
    .line 173
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 174
    .line 175
    .line 176
    const/16 p0, 0x15

    .line 177
    .line 178
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserCounter:I

    .line 179
    .line 180
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 184
    .line 185
    if-eqz p0, :cond_e

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
    const/16 v1, 0x16

    .line 194
    .line 195
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 196
    .line 197
    .line 198
    :cond_e
    const/16 p0, 0x17

    .line 199
    .line 200
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 201
    .line 202
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 203
    .line 204
    .line 205
    const/16 p0, 0x18

    .line 206
    .line 207
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 208
    .line 209
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 213
    .line 214
    if-eqz p0, :cond_f

    .line 215
    .line 216
    const/16 v0, 0x19

    .line 217
    .line 218
    sget-object v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 221
    .line 222
    .line 223
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 224
    .line 225
    if-eqz p0, :cond_10

    .line 226
    .line 227
    const/16 v0, 0x1a

    .line 228
    .line 229
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 232
    .line 233
    .line 234
    :cond_10
    const/16 p0, 0x1b

    .line 235
    .line 236
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 237
    .line 238
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 239
    .line 240
    .line 241
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 242
    .line 243
    if-eqz p0, :cond_11

    .line 244
    .line 245
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    const/16 v1, 0x1c

    .line 252
    .line 253
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 254
    .line 255
    .line 256
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 257
    .line 258
    if-eqz p0, :cond_12

    .line 259
    .line 260
    const/16 p1, 0x1d

    .line 261
    .line 262
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 265
    .line 266
    .line 267
    :cond_12
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 268
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment$1;->serialize(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
