.class Lcom/p1/mobile/putong/data/Relationship$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Relationship;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Relationship;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Relationship;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x2

    .line 31
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    const/4 v0, 0x3

    .line 37
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/4 v2, 0x5

    .line 65
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_3
    const/4 v0, 0x6

    .line 71
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 72
    .line 73
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    const/4 v1, 0x7

    .line 83
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_4
    const/16 v0, 0x8

    .line 89
    .line 90
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 91
    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    const/16 v1, 0x9

    .line 102
    .line 103
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    const/16 v1, 0xa

    .line 113
    .line 114
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 120
    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    const/16 v1, 0xb

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    add-int/2addr p0, v0

    .line 134
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 135
    .line 136
    if-eqz v0, :cond_8

    .line 137
    .line 138
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const/16 v2, 0xc

    .line 149
    .line 150
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 156
    .line 157
    if-eqz v0, :cond_9

    .line 158
    .line 159
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const/16 v2, 0xd

    .line 170
    .line 171
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-int/2addr p0, v0

    .line 176
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 177
    .line 178
    if-eqz v0, :cond_a

    .line 179
    .line 180
    const/16 v1, 0xe

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
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 188
    .line 189
    if-eqz v0, :cond_b

    .line 190
    .line 191
    const/16 v1, 0xf

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    add-int/2addr p0, v0

    .line 202
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 203
    .line 204
    if-eqz v0, :cond_c

    .line 205
    .line 206
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const/16 v2, 0x10

    .line 213
    .line 214
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    add-int/2addr p0, v0

    .line 219
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 220
    .line 221
    if-eqz v0, :cond_d

    .line 222
    .line 223
    const/16 v1, 0x11

    .line 224
    .line 225
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 226
    .line 227
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    add-int/2addr p0, v0

    .line 232
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 233
    .line 234
    if-eqz v0, :cond_e

    .line 235
    .line 236
    const/16 v1, 0x12

    .line 237
    .line 238
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    add-int/2addr p0, v0

    .line 243
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 244
    .line 245
    if-eqz v0, :cond_f

    .line 246
    .line 247
    const/16 v1, 0x13

    .line 248
    .line 249
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    add-int/2addr p0, v0

    .line 254
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 255
    .line 256
    if-eqz v0, :cond_10

    .line 257
    .line 258
    const/16 v1, 0x14

    .line 259
    .line 260
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    add-int/2addr p0, v0

    .line 265
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz v0, :cond_11

    .line 268
    .line 269
    const/16 v1, 0x15

    .line 270
    .line 271
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    add-int/2addr p0, v0

    .line 276
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 277
    .line 278
    if-eqz v0, :cond_12

    .line 279
    .line 280
    const/16 v1, 0x16

    .line 281
    .line 282
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 283
    .line 284
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    add-int/2addr p0, v0

    .line 289
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 290
    .line 291
    if-eqz v0, :cond_13

    .line 292
    .line 293
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    const/16 v2, 0x17

    .line 300
    .line 301
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    add-int/2addr p0, v0

    .line 306
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 307
    .line 308
    if-eqz v0, :cond_14

    .line 309
    .line 310
    const/16 v1, 0x18

    .line 311
    .line 312
    sget-object v2, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 313
    .line 314
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    add-int/2addr p0, v0

    .line 319
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 320
    .line 321
    if-eqz v0, :cond_15

    .line 322
    .line 323
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 324
    .line 325
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    const/16 v2, 0x19

    .line 330
    .line 331
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    add-int/2addr p0, v0

    .line 336
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 337
    .line 338
    if-eqz v0, :cond_16

    .line 339
    .line 340
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 341
    .line 342
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    const/16 v2, 0x1a

    .line 347
    .line 348
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    add-int/2addr p0, v0

    .line 353
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 354
    .line 355
    if-eqz v0, :cond_17

    .line 356
    .line 357
    const/16 v1, 0x1b

    .line 358
    .line 359
    sget-object v2, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 360
    .line 361
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 362
    .line 363
    .line 364
    move-result v0

    .line 365
    add-int/2addr p0, v0

    .line 366
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 367
    .line 368
    if-eqz v0, :cond_18

    .line 369
    .line 370
    const/16 v1, 0x1c

    .line 371
    .line 372
    sget-object v2, Lcom/p1/mobile/putong/data/DclExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 373
    .line 374
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    add-int/2addr p0, v0

    .line 379
    :cond_18
    const/16 v0, 0x1d

    .line 380
    .line 381
    iget v1, p1, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 382
    .line 383
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    add-int/2addr p0, v0

    .line 388
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 389
    .line 390
    if-eqz v0, :cond_19

    .line 391
    .line 392
    const/16 v1, 0x1e

    .line 393
    .line 394
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    add-int/2addr p0, v0

    .line 399
    :cond_19
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 400
    .line 401
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 402
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Relationship$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Relationship;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    move-object v3, v2

    .line 10
    move-object v4, v3

    .line 11
    move-object v5, v4

    .line 12
    move-object v6, v5

    .line 13
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    const-string v8, ""

    .line 18
    .line 19
    sparse-switch v7, :sswitch_data_0

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 73
    .line 74
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 75
    .line 76
    if-nez p1, :cond_3

    .line 77
    .line 78
    if-eqz v4, :cond_3

    .line 79
    .line 80
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 85
    .line 86
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    if-eqz v5, :cond_4

    .line 91
    .line 92
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 97
    .line 98
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 99
    .line 100
    if-nez p1, :cond_5

    .line 101
    .line 102
    if-eqz v6, :cond_5

    .line 103
    .line 104
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 105
    .line 106
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 117
    .line 118
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 119
    .line 120
    if-nez p1, :cond_6

    .line 121
    .line 122
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 131
    .line 132
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 133
    .line 134
    if-nez p1, :cond_7

    .line 135
    .line 136
    new-instance p1, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 142
    .line 143
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 144
    .line 145
    if-nez p1, :cond_8

    .line 146
    .line 147
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 148
    .line 149
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 150
    .line 151
    if-nez p1, :cond_9

    .line 152
    .line 153
    new-instance p1, Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .line 157
    .line 158
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 159
    .line 160
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_a

    .line 163
    .line 164
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 165
    .line 166
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 167
    .line 168
    if-nez p1, :cond_b

    .line 169
    .line 170
    new-instance p1, Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .line 174
    .line 175
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 176
    .line 177
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 178
    .line 179
    if-nez p1, :cond_c

    .line 180
    .line 181
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 182
    .line 183
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 188
    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 190
    .line 191
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 192
    .line 193
    if-nez p1, :cond_d

    .line 194
    .line 195
    new-instance p1, Ljava/util/ArrayList;

    .line 196
    .line 197
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .line 199
    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 201
    .line 202
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 203
    .line 204
    if-nez p1, :cond_e

    .line 205
    .line 206
    new-instance p1, Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .line 210
    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 212
    .line 213
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p1, :cond_f

    .line 216
    .line 217
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 218
    .line 219
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 220
    .line 221
    if-nez p1, :cond_10

    .line 222
    .line 223
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 224
    .line 225
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 226
    .line 227
    if-nez p1, :cond_11

    .line 228
    .line 229
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 230
    .line 231
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 236
    .line 237
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 238
    .line 239
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 240
    .line 241
    if-nez p1, :cond_12

    .line 242
    .line 243
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 244
    .line 245
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 246
    .line 247
    if-nez p1, :cond_13

    .line 248
    .line 249
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 250
    .line 251
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 252
    .line 253
    if-nez p1, :cond_14

    .line 254
    .line 255
    invoke-static {}, Lcom/p1/mobile/putong/data/DclExtensions;->new_()Lcom/p1/mobile/putong/data/DclExtensions;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 260
    .line 261
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 262
    .line 263
    if-nez p1, :cond_2a

    .line 264
    .line 265
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 266
    .line 267
    return-object p0

    .line 268
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    iput v7, p0, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :sswitch_2
    sget-object v7, Lcom/p1/mobile/putong/data/DclExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 285
    .line 286
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    check-cast v7, Lcom/p1/mobile/putong/data/DclExtensions;

    .line 291
    .line 292
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_3
    sget-object v7, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 297
    .line 298
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v7

    .line 302
    check-cast v7, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 303
    .line 304
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :sswitch_4
    sget-object v7, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 309
    .line 310
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 311
    .line 312
    .line 313
    move-result-object v7

    .line 314
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v7

    .line 318
    check-cast v7, Ljava/util/List;

    .line 319
    .line 320
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_5
    sget-object v7, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 325
    .line 326
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    .line 329
    move-result-object v7

    .line 330
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v7

    .line 334
    check-cast v7, Ljava/util/List;

    .line 335
    .line 336
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 337
    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :sswitch_6
    sget-object v7, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 341
    .line 342
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object v7

    .line 346
    check-cast v7, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 347
    .line 348
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_7
    sget-object v7, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 353
    .line 354
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 355
    .line 356
    .line 357
    move-result-object v7

    .line 358
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v7

    .line 362
    check-cast v7, Ljava/util/List;

    .line 363
    .line 364
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 365
    .line 366
    goto/16 :goto_0

    .line 367
    .line 368
    :sswitch_8
    sget-object v7, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 369
    .line 370
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v7

    .line 374
    check-cast v7, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 375
    .line 376
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v7

    .line 384
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 385
    .line 386
    goto/16 :goto_0

    .line 387
    .line 388
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v7

    .line 392
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 393
    .line 394
    goto/16 :goto_0

    .line 395
    .line 396
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v7

    .line 400
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v7

    .line 408
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 409
    .line 410
    goto/16 :goto_0

    .line 411
    .line 412
    :sswitch_d
    sget-object v7, Lcom/p1/mobile/putong/data/RelationshipExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    .line 414
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object v7

    .line 418
    check-cast v7, Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 419
    .line 420
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 421
    .line 422
    goto/16 :goto_0

    .line 423
    .line 424
    :sswitch_e
    sget-object v7, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 425
    .line 426
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 427
    .line 428
    .line 429
    move-result-object v7

    .line 430
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v7

    .line 434
    check-cast v7, Ljava/util/List;

    .line 435
    .line 436
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 437
    .line 438
    goto/16 :goto_0

    .line 439
    .line 440
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 441
    .line 442
    .line 443
    move-result v6

    .line 444
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 445
    .line 446
    .line 447
    move-result-object v6

    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v7

    .line 454
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 455
    .line 456
    goto/16 :goto_0

    .line 457
    .line 458
    :sswitch_11
    sget-object v5, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 459
    .line 460
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 461
    .line 462
    .line 463
    move-result-object v5

    .line 464
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v5

    .line 468
    check-cast v5, Ljava/util/List;

    .line 469
    .line 470
    goto/16 :goto_0

    .line 471
    .line 472
    :sswitch_12
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 473
    .line 474
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 475
    .line 476
    .line 477
    move-result-object v4

    .line 478
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    check-cast v4, Ljava/util/List;

    .line 483
    .line 484
    goto/16 :goto_0

    .line 485
    .line 486
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 487
    .line 488
    .line 489
    move-result v3

    .line 490
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    goto/16 :goto_0

    .line 495
    .line 496
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v7

    .line 500
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 501
    .line 502
    goto/16 :goto_0

    .line 503
    .line 504
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v7

    .line 508
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 509
    .line 510
    goto/16 :goto_0

    .line 511
    .line 512
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 513
    .line 514
    .line 515
    move-result v7

    .line 516
    iput-boolean v7, p0, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object v7

    .line 524
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 525
    .line 526
    goto/16 :goto_0

    .line 527
    .line 528
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 529
    .line 530
    .line 531
    move-result-wide v7

    .line 532
    iput-wide v7, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 533
    .line 534
    goto/16 :goto_0

    .line 535
    .line 536
    :sswitch_19
    sget-object v7, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 537
    .line 538
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 539
    .line 540
    .line 541
    move-result-object v7

    .line 542
    invoke-virtual {p1, v7}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v7

    .line 546
    check-cast v7, Ljava/util/List;

    .line 547
    .line 548
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 549
    .line 550
    goto/16 :goto_0

    .line 551
    .line 552
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v7

    .line 556
    iput-object v7, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 557
    .line 558
    goto/16 :goto_0

    .line 559
    .line 560
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 561
    .line 562
    .line 563
    move-result-wide v7

    .line 564
    iput-wide v7, p0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 565
    .line 566
    goto/16 :goto_0

    .line 567
    .line 568
    :sswitch_1c
    sget-object v2, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 569
    .line 570
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 575
    .line 576
    .line 577
    move-result-object v2

    .line 578
    check-cast v2, Ljava/util/List;

    .line 579
    .line 580
    goto/16 :goto_0

    .line 581
    .line 582
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 583
    .line 584
    .line 585
    move-result v1

    .line 586
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    goto/16 :goto_0

    .line 591
    .line 592
    :sswitch_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 593
    .line 594
    if-nez p1, :cond_15

    .line 595
    .line 596
    if-eqz v1, :cond_15

    .line 597
    .line 598
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 599
    .line 600
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 601
    .line 602
    .line 603
    move-result v1

    .line 604
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 609
    .line 610
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 611
    .line 612
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 613
    .line 614
    if-nez p1, :cond_16

    .line 615
    .line 616
    if-eqz v2, :cond_16

    .line 617
    .line 618
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 619
    .line 620
    .line 621
    move-result-object p1

    .line 622
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 623
    .line 624
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 625
    .line 626
    if-nez p1, :cond_17

    .line 627
    .line 628
    if-eqz v3, :cond_17

    .line 629
    .line 630
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 631
    .line 632
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 633
    .line 634
    .line 635
    move-result v1

    .line 636
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 637
    .line 638
    .line 639
    move-result-object p1

    .line 640
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 641
    .line 642
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 643
    .line 644
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 645
    .line 646
    if-nez p1, :cond_18

    .line 647
    .line 648
    if-eqz v4, :cond_18

    .line 649
    .line 650
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 651
    .line 652
    .line 653
    move-result-object p1

    .line 654
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 655
    .line 656
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 657
    .line 658
    if-nez p1, :cond_19

    .line 659
    .line 660
    if-eqz v5, :cond_19

    .line 661
    .line 662
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 663
    .line 664
    .line 665
    move-result-object p1

    .line 666
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 667
    .line 668
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 669
    .line 670
    if-nez p1, :cond_1a

    .line 671
    .line 672
    if-eqz v6, :cond_1a

    .line 673
    .line 674
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 675
    .line 676
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 677
    .line 678
    .line 679
    move-result v1

    .line 680
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 681
    .line 682
    .line 683
    move-result-object p1

    .line 684
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 685
    .line 686
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 687
    .line 688
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 689
    .line 690
    if-nez p1, :cond_1b

    .line 691
    .line 692
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 693
    .line 694
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 695
    .line 696
    .line 697
    move-result-object p1

    .line 698
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 699
    .line 700
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 701
    .line 702
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 703
    .line 704
    if-nez p1, :cond_1c

    .line 705
    .line 706
    new-instance p1, Ljava/util/ArrayList;

    .line 707
    .line 708
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 709
    .line 710
    .line 711
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 712
    .line 713
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 714
    .line 715
    if-nez p1, :cond_1d

    .line 716
    .line 717
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 718
    .line 719
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 720
    .line 721
    if-nez p1, :cond_1e

    .line 722
    .line 723
    new-instance p1, Ljava/util/ArrayList;

    .line 724
    .line 725
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 726
    .line 727
    .line 728
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 729
    .line 730
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 731
    .line 732
    if-nez p1, :cond_1f

    .line 733
    .line 734
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 735
    .line 736
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 737
    .line 738
    if-nez p1, :cond_20

    .line 739
    .line 740
    new-instance p1, Ljava/util/ArrayList;

    .line 741
    .line 742
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 743
    .line 744
    .line 745
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 746
    .line 747
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 748
    .line 749
    if-nez p1, :cond_21

    .line 750
    .line 751
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 752
    .line 753
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 754
    .line 755
    .line 756
    move-result-object p1

    .line 757
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 758
    .line 759
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 760
    .line 761
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 762
    .line 763
    if-nez p1, :cond_22

    .line 764
    .line 765
    new-instance p1, Ljava/util/ArrayList;

    .line 766
    .line 767
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 768
    .line 769
    .line 770
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 771
    .line 772
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 773
    .line 774
    if-nez p1, :cond_23

    .line 775
    .line 776
    new-instance p1, Ljava/util/ArrayList;

    .line 777
    .line 778
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 779
    .line 780
    .line 781
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 782
    .line 783
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 784
    .line 785
    if-nez p1, :cond_24

    .line 786
    .line 787
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 788
    .line 789
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 790
    .line 791
    if-nez p1, :cond_25

    .line 792
    .line 793
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 794
    .line 795
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 796
    .line 797
    if-nez p1, :cond_26

    .line 798
    .line 799
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 800
    .line 801
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 802
    .line 803
    .line 804
    move-result-object p1

    .line 805
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 806
    .line 807
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 808
    .line 809
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 810
    .line 811
    if-nez p1, :cond_27

    .line 812
    .line 813
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 814
    .line 815
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 816
    .line 817
    if-nez p1, :cond_28

    .line 818
    .line 819
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 820
    .line 821
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 822
    .line 823
    if-nez p1, :cond_29

    .line 824
    .line 825
    invoke-static {}, Lcom/p1/mobile/putong/data/DclExtensions;->new_()Lcom/p1/mobile/putong/data/DclExtensions;

    .line 826
    .line 827
    .line 828
    move-result-object p1

    .line 829
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 830
    .line 831
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 832
    .line 833
    if-nez p1, :cond_2a

    .line 834
    .line 835
    iput-object v8, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 836
    .line 837
    :cond_2a
    return-object p0

    .line 838
    nop

    .line 839
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1e
        0x8 -> :sswitch_1d
        0x12 -> :sswitch_1c
        0x19 -> :sswitch_1b
        0x22 -> :sswitch_1a
        0x2a -> :sswitch_19
        0x31 -> :sswitch_18
        0x3a -> :sswitch_17
        0x40 -> :sswitch_16
        0x4a -> :sswitch_15
        0x52 -> :sswitch_14
        0x58 -> :sswitch_13
        0x62 -> :sswitch_12
        0x6a -> :sswitch_11
        0x72 -> :sswitch_10
        0x78 -> :sswitch_f
        0x82 -> :sswitch_e
        0x8a -> :sswitch_d
        0x92 -> :sswitch_c
        0x9a -> :sswitch_b
        0xa2 -> :sswitch_a
        0xaa -> :sswitch_9
        0xb2 -> :sswitch_8
        0xba -> :sswitch_7
        0xc2 -> :sswitch_6
        0xca -> :sswitch_5
        0xd2 -> :sswitch_4
        0xda -> :sswitch_3
        0xe2 -> :sswitch_2
        0xe8 -> :sswitch_1
        0xf2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 839
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Relationship$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Relationship;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x3

    .line 32
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x5

    .line 56
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    const/4 p0, 0x6

    .line 60
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x7

    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    const/16 p0, 0x8

    .line 74
    .line 75
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_6

    .line 92
    .line 93
    const/16 v0, 0xa

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 99
    .line 100
    if-eqz p0, :cond_7

    .line 101
    .line 102
    const/16 v0, 0xb

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 109
    .line 110
    .line 111
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 112
    .line 113
    if-eqz p0, :cond_8

    .line 114
    .line 115
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const/16 v1, 0xc

    .line 126
    .line 127
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 131
    .line 132
    if-eqz p0, :cond_9

    .line 133
    .line 134
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    const/16 v1, 0xd

    .line 145
    .line 146
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 147
    .line 148
    .line 149
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz p0, :cond_a

    .line 152
    .line 153
    const/16 v0, 0xe

    .line 154
    .line 155
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 159
    .line 160
    if-eqz p0, :cond_b

    .line 161
    .line 162
    const/16 v0, 0xf

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 169
    .line 170
    .line 171
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 172
    .line 173
    if-eqz p0, :cond_c

    .line 174
    .line 175
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const/16 v1, 0x10

    .line 182
    .line 183
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 184
    .line 185
    .line 186
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 187
    .line 188
    if-eqz p0, :cond_d

    .line 189
    .line 190
    const/16 v0, 0x11

    .line 191
    .line 192
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 195
    .line 196
    .line 197
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 198
    .line 199
    if-eqz p0, :cond_e

    .line 200
    .line 201
    const/16 v0, 0x12

    .line 202
    .line 203
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 207
    .line 208
    if-eqz p0, :cond_f

    .line 209
    .line 210
    const/16 v0, 0x13

    .line 211
    .line 212
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 213
    .line 214
    .line 215
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 216
    .line 217
    if-eqz p0, :cond_10

    .line 218
    .line 219
    const/16 v0, 0x14

    .line 220
    .line 221
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 225
    .line 226
    if-eqz p0, :cond_11

    .line 227
    .line 228
    const/16 v0, 0x15

    .line 229
    .line 230
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 231
    .line 232
    .line 233
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 234
    .line 235
    if-eqz p0, :cond_12

    .line 236
    .line 237
    const/16 v0, 0x16

    .line 238
    .line 239
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 240
    .line 241
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 242
    .line 243
    .line 244
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 245
    .line 246
    if-eqz p0, :cond_13

    .line 247
    .line 248
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 249
    .line 250
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    const/16 v1, 0x17

    .line 255
    .line 256
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 257
    .line 258
    .line 259
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 260
    .line 261
    if-eqz p0, :cond_14

    .line 262
    .line 263
    const/16 v0, 0x18

    .line 264
    .line 265
    sget-object v1, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 266
    .line 267
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 268
    .line 269
    .line 270
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 271
    .line 272
    if-eqz p0, :cond_15

    .line 273
    .line 274
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 275
    .line 276
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const/16 v1, 0x19

    .line 281
    .line 282
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 283
    .line 284
    .line 285
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 286
    .line 287
    if-eqz p0, :cond_16

    .line 288
    .line 289
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    const/16 v1, 0x1a

    .line 296
    .line 297
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 298
    .line 299
    .line 300
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 301
    .line 302
    if-eqz p0, :cond_17

    .line 303
    .line 304
    const/16 v0, 0x1b

    .line 305
    .line 306
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 307
    .line 308
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 309
    .line 310
    .line 311
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 312
    .line 313
    if-eqz p0, :cond_18

    .line 314
    .line 315
    const/16 v0, 0x1c

    .line 316
    .line 317
    sget-object v1, Lcom/p1/mobile/putong/data/DclExtensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 320
    .line 321
    .line 322
    :cond_18
    const/16 p0, 0x1d

    .line 323
    .line 324
    iget v0, p1, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 325
    .line 326
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 327
    .line 328
    .line 329
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 330
    .line 331
    if-eqz p0, :cond_19

    .line 332
    .line 333
    const/16 p1, 0x1e

    .line 334
    .line 335
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 336
    .line 337
    .line 338
    :cond_19
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Relationship$1;->serialize(Lcom/p1/mobile/putong/data/Relationship;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
