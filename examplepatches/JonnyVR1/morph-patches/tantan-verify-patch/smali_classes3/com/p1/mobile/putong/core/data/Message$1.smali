.class Lcom/p1/mobile/putong/core/data/Message$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Message;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Message;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    const/16 v0, 0x33

    .line 19
    .line 20
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    const/16 v0, 0x34

    .line 28
    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/16 v0, 0x35

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/2addr p0, v0

    .line 45
    const/16 v0, 0x36

    .line 46
    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/16 v0, 0x37

    .line 55
    .line 56
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    add-int/2addr p0, v0

    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    const/16 v1, 0x38

    .line 68
    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/16 v2, 0x39

    .line 85
    .line 86
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    const/16 v1, 0x3a

    .line 96
    .line 97
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    const/16 v1, 0x3b

    .line 107
    .line 108
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 114
    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    const/16 v1, 0x3c

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    const/16 v1, 0x3d

    .line 133
    .line 134
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    const/16 v1, 0x3e

    .line 144
    .line 145
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz v0, :cond_8

    .line 153
    .line 154
    const/16 v1, 0x3f

    .line 155
    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 162
    .line 163
    if-eqz v0, :cond_9

    .line 164
    .line 165
    const/16 v1, 0x40

    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    add-int/2addr p0, v0

    .line 174
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 175
    .line 176
    if-eqz v0, :cond_a

    .line 177
    .line 178
    const/16 v1, 0x41

    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v0, :cond_b

    .line 192
    .line 193
    const/16 v1, 0x42

    .line 194
    .line 195
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 201
    .line 202
    if-eqz v0, :cond_c

    .line 203
    .line 204
    const/16 v1, 0x43

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    add-int/2addr p0, v0

    .line 215
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 216
    .line 217
    if-eqz v0, :cond_d

    .line 218
    .line 219
    const/16 v1, 0x44

    .line 220
    .line 221
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 227
    .line 228
    if-eqz v0, :cond_e

    .line 229
    .line 230
    const/16 v1, 0x45

    .line 231
    .line 232
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    add-int/2addr p0, v0

    .line 237
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 238
    .line 239
    if-eqz v0, :cond_f

    .line 240
    .line 241
    const/16 v1, 0x46

    .line 242
    .line 243
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageAccessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 244
    .line 245
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    add-int/2addr p0, v0

    .line 250
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 251
    .line 252
    if-eqz v0, :cond_10

    .line 253
    .line 254
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    const/16 v2, 0x47

    .line 261
    .line 262
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    add-int/2addr p0, v0

    .line 267
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 268
    .line 269
    if-eqz v0, :cond_11

    .line 270
    .line 271
    const/16 v1, 0x48

    .line 272
    .line 273
    sget-object v2, Lcom/p1/mobile/putong/core/data/CallRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 274
    .line 275
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz v0, :cond_12

    .line 283
    .line 284
    const/16 v1, 0x49

    .line 285
    .line 286
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    add-int/2addr p0, v0

    .line 291
    :cond_12
    const/16 v0, 0x4a

    .line 292
    .line 293
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 294
    .line 295
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    add-int/2addr p0, v0

    .line 300
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 301
    .line 302
    if-eqz v0, :cond_13

    .line 303
    .line 304
    const/16 v1, 0x4b

    .line 305
    .line 306
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    add-int/2addr p0, v0

    .line 315
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 316
    .line 317
    if-eqz v0, :cond_14

    .line 318
    .line 319
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 320
    .line 321
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    const/16 v2, 0x4c

    .line 326
    .line 327
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    add-int/2addr p0, v0

    .line 332
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 333
    .line 334
    if-eqz v0, :cond_15

    .line 335
    .line 336
    const/16 v1, 0x4d

    .line 337
    .line 338
    sget-object v2, Lcom/p1/mobile/putong/core/data/Letter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 339
    .line 340
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    add-int/2addr p0, v0

    .line 345
    :cond_15
    const/16 v0, 0x4e

    .line 346
    .line 347
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 348
    .line 349
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    add-int/2addr p0, v0

    .line 354
    const/16 v0, 0x4f

    .line 355
    .line 356
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 357
    .line 358
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    add-int/2addr p0, v0

    .line 363
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 364
    .line 365
    if-eqz v0, :cond_16

    .line 366
    .line 367
    const/16 v1, 0x50

    .line 368
    .line 369
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    add-int/2addr p0, v0

    .line 374
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 375
    .line 376
    if-eqz v0, :cond_17

    .line 377
    .line 378
    const/16 v1, 0x51

    .line 379
    .line 380
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 381
    .line 382
    .line 383
    move-result v0

    .line 384
    add-int/2addr p0, v0

    .line 385
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 386
    .line 387
    if-eqz v0, :cond_18

    .line 388
    .line 389
    const/16 v1, 0x52

    .line 390
    .line 391
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    add-int/2addr p0, v0

    .line 400
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 401
    .line 402
    if-eqz v0, :cond_19

    .line 403
    .line 404
    const/16 v1, 0x53

    .line 405
    .line 406
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    add-int/2addr p0, v0

    .line 415
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 416
    .line 417
    if-eqz v0, :cond_1a

    .line 418
    .line 419
    const/16 v1, 0x54

    .line 420
    .line 421
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 422
    .line 423
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    add-int/2addr p0, v0

    .line 428
    :cond_1a
    const/16 v0, 0x55

    .line 429
    .line 430
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 431
    .line 432
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    add-int/2addr p0, v0

    .line 437
    const/16 v0, 0x56

    .line 438
    .line 439
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 440
    .line 441
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    add-int/2addr p0, v0

    .line 446
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 447
    .line 448
    if-eqz v0, :cond_1b

    .line 449
    .line 450
    const/16 v1, 0x57

    .line 451
    .line 452
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    add-int/2addr p0, v0

    .line 457
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 458
    .line 459
    if-eqz v0, :cond_1c

    .line 460
    .line 461
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 466
    .line 467
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 468
    .line 469
    .line 470
    move-result-object v1

    .line 471
    const/16 v2, 0x58

    .line 472
    .line 473
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    add-int/2addr p0, v0

    .line 478
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 479
    .line 480
    if-eqz v0, :cond_1d

    .line 481
    .line 482
    const/16 v1, 0x59

    .line 483
    .line 484
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 485
    .line 486
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    add-int/2addr p0, v0

    .line 491
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 492
    .line 493
    if-eqz v0, :cond_1e

    .line 494
    .line 495
    const/16 v1, 0x5a

    .line 496
    .line 497
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 498
    .line 499
    .line 500
    move-result v0

    .line 501
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    add-int/2addr p0, v0

    .line 506
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 507
    .line 508
    if-eqz v0, :cond_1f

    .line 509
    .line 510
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 511
    .line 512
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 513
    .line 514
    .line 515
    move-result-object v1

    .line 516
    const/16 v2, 0x5b

    .line 517
    .line 518
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 519
    .line 520
    .line 521
    move-result v0

    .line 522
    add-int/2addr p0, v0

    .line 523
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 524
    .line 525
    if-eqz v0, :cond_20

    .line 526
    .line 527
    const/16 v1, 0x5c

    .line 528
    .line 529
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 530
    .line 531
    .line 532
    move-result v0

    .line 533
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 534
    .line 535
    .line 536
    move-result v0

    .line 537
    add-int/2addr p0, v0

    .line 538
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 539
    .line 540
    if-eqz v0, :cond_21

    .line 541
    .line 542
    const/16 v1, 0x5d

    .line 543
    .line 544
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 545
    .line 546
    .line 547
    move-result v0

    .line 548
    add-int/2addr p0, v0

    .line 549
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 550
    .line 551
    if-eqz v0, :cond_22

    .line 552
    .line 553
    const/16 v1, 0x5e

    .line 554
    .line 555
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 556
    .line 557
    .line 558
    move-result v0

    .line 559
    add-int/2addr p0, v0

    .line 560
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 561
    .line 562
    if-eqz v0, :cond_23

    .line 563
    .line 564
    const/16 v1, 0x5f

    .line 565
    .line 566
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    add-int/2addr p0, v0

    .line 571
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 572
    .line 573
    if-eqz v0, :cond_24

    .line 574
    .line 575
    const/16 v1, 0x60

    .line 576
    .line 577
    sget-object v2, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 578
    .line 579
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 580
    .line 581
    .line 582
    move-result v0

    .line 583
    add-int/2addr p0, v0

    .line 584
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 585
    .line 586
    if-eqz v0, :cond_25

    .line 587
    .line 588
    const/16 v1, 0x61

    .line 589
    .line 590
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 591
    .line 592
    .line 593
    move-result v0

    .line 594
    add-int/2addr p0, v0

    .line 595
    :cond_25
    const/16 v0, 0x62

    .line 596
    .line 597
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 598
    .line 599
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 600
    .line 601
    .line 602
    move-result v0

    .line 603
    add-int/2addr p0, v0

    .line 604
    const/16 v0, 0x63

    .line 605
    .line 606
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 607
    .line 608
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 609
    .line 610
    .line 611
    move-result v0

    .line 612
    add-int/2addr p0, v0

    .line 613
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 614
    .line 615
    if-eqz v0, :cond_26

    .line 616
    .line 617
    const/16 v1, 0x64

    .line 618
    .line 619
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageExtData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 620
    .line 621
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 622
    .line 623
    .line 624
    move-result v0

    .line 625
    add-int/2addr p0, v0

    .line 626
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 627
    .line 628
    if-eqz v0, :cond_27

    .line 629
    .line 630
    const/16 v1, 0x65

    .line 631
    .line 632
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 633
    .line 634
    .line 635
    move-result v0

    .line 636
    add-int/2addr p0, v0

    .line 637
    :cond_27
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 638
    .line 639
    if-eqz v0, :cond_28

    .line 640
    .line 641
    const/16 v1, 0x66

    .line 642
    .line 643
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 644
    .line 645
    .line 646
    move-result v0

    .line 647
    add-int/2addr p0, v0

    .line 648
    :cond_28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 649
    .line 650
    if-eqz v0, :cond_29

    .line 651
    .line 652
    const/16 v1, 0x67

    .line 653
    .line 654
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 655
    .line 656
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 657
    .line 658
    .line 659
    move-result v0

    .line 660
    add-int/2addr p0, v0

    .line 661
    :cond_29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 662
    .line 663
    if-eqz v0, :cond_2a

    .line 664
    .line 665
    const/16 v1, 0x68

    .line 666
    .line 667
    sget-object v2, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 668
    .line 669
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 670
    .line 671
    .line 672
    move-result v0

    .line 673
    add-int/2addr p0, v0

    .line 674
    :cond_2a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 675
    .line 676
    if-eqz v0, :cond_2b

    .line 677
    .line 678
    const/16 v1, 0x69

    .line 679
    .line 680
    sget-object v2, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 681
    .line 682
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 683
    .line 684
    .line 685
    move-result v0

    .line 686
    add-int/2addr p0, v0

    .line 687
    :cond_2b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 688
    .line 689
    if-eqz v0, :cond_2c

    .line 690
    .line 691
    const/16 v1, 0x6a

    .line 692
    .line 693
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 694
    .line 695
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 696
    .line 697
    .line 698
    move-result v0

    .line 699
    add-int/2addr p0, v0

    .line 700
    :cond_2c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 701
    .line 702
    if-eqz v0, :cond_2d

    .line 703
    .line 704
    const/16 v1, 0x6b

    .line 705
    .line 706
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 707
    .line 708
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 709
    .line 710
    .line 711
    move-result v0

    .line 712
    add-int/2addr p0, v0

    .line 713
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 714
    .line 715
    if-eqz v0, :cond_2e

    .line 716
    .line 717
    sget-object v1, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 718
    .line 719
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 720
    .line 721
    .line 722
    move-result-object v1

    .line 723
    const/16 v2, 0x6c

    .line 724
    .line 725
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 726
    .line 727
    .line 728
    move-result v0

    .line 729
    add-int/2addr p0, v0

    .line 730
    :cond_2e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 731
    .line 732
    if-eqz v0, :cond_2f

    .line 733
    .line 734
    const/16 v1, 0x6d

    .line 735
    .line 736
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 737
    .line 738
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 739
    .line 740
    .line 741
    move-result v0

    .line 742
    add-int/2addr p0, v0

    .line 743
    :cond_2f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 744
    .line 745
    if-eqz v0, :cond_30

    .line 746
    .line 747
    const/16 v1, 0x6e

    .line 748
    .line 749
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 750
    .line 751
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 752
    .line 753
    .line 754
    move-result v0

    .line 755
    add-int/2addr p0, v0

    .line 756
    :cond_30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 757
    .line 758
    if-eqz v0, :cond_31

    .line 759
    .line 760
    const/16 v1, 0x6f

    .line 761
    .line 762
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 763
    .line 764
    .line 765
    move-result v0

    .line 766
    add-int/2addr p0, v0

    .line 767
    :cond_31
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 768
    .line 769
    if-eqz v0, :cond_32

    .line 770
    .line 771
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 772
    .line 773
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 774
    .line 775
    .line 776
    move-result-object v1

    .line 777
    const/16 v2, 0x70

    .line 778
    .line 779
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    add-int/2addr p0, v0

    .line 784
    :cond_32
    const/16 v0, 0x71

    .line 785
    .line 786
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 787
    .line 788
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    add-int/2addr p0, v0

    .line 793
    const/16 v0, 0x72

    .line 794
    .line 795
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 796
    .line 797
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 798
    .line 799
    .line 800
    move-result v0

    .line 801
    add-int/2addr p0, v0

    .line 802
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 803
    .line 804
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 805
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Message$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Message;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

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
    move-object v7, v6

    .line 14
    move-object v8, v7

    .line 15
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 16
    .line 17
    .line 18
    move-result v9

    .line 19
    const-string v10, ""

    .line 20
    .line 21
    sparse-switch v9, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 65
    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    if-eqz v3, :cond_2

    .line 69
    .line 70
    sget-object p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    if-eqz v4, :cond_3

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 103
    .line 104
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 105
    .line 106
    if-nez p1, :cond_4

    .line 107
    .line 108
    if-eqz v5, :cond_4

    .line 109
    .line 110
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 121
    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 123
    .line 124
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 125
    .line 126
    if-nez p1, :cond_5

    .line 127
    .line 128
    if-eqz v6, :cond_5

    .line 129
    .line 130
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 135
    .line 136
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 137
    .line 138
    if-nez p1, :cond_6

    .line 139
    .line 140
    if-eqz v7, :cond_6

    .line 141
    .line 142
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 143
    .line 144
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 153
    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 155
    .line 156
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 157
    .line 158
    if-nez p1, :cond_7

    .line 159
    .line 160
    if-eqz v8, :cond_7

    .line 161
    .line 162
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 163
    .line 164
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 173
    .line 174
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 175
    .line 176
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_8

    .line 179
    .line 180
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 181
    .line 182
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 183
    .line 184
    if-nez p1, :cond_9

    .line 185
    .line 186
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 187
    .line 188
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 189
    .line 190
    if-nez p1, :cond_a

    .line 191
    .line 192
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 193
    .line 194
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 195
    .line 196
    if-nez p1, :cond_b

    .line 197
    .line 198
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 199
    .line 200
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 201
    .line 202
    if-nez p1, :cond_c

    .line 203
    .line 204
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 211
    .line 212
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 213
    .line 214
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 215
    .line 216
    if-nez p1, :cond_d

    .line 217
    .line 218
    sget-object p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 219
    .line 220
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    check-cast p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 225
    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 227
    .line 228
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 229
    .line 230
    if-nez p1, :cond_e

    .line 231
    .line 232
    new-instance p1, Ljava/util/ArrayList;

    .line 233
    .line 234
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .line 236
    .line 237
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 238
    .line 239
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 240
    .line 241
    if-nez p1, :cond_f

    .line 242
    .line 243
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommentInfo;->new_()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 248
    .line 249
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 250
    .line 251
    if-nez p1, :cond_10

    .line 252
    .line 253
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 254
    .line 255
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 256
    .line 257
    if-nez p1, :cond_11

    .line 258
    .line 259
    new-instance p1, Ljava/util/ArrayList;

    .line 260
    .line 261
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .line 263
    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 265
    .line 266
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 267
    .line 268
    if-nez p1, :cond_12

    .line 269
    .line 270
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 271
    .line 272
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 273
    .line 274
    if-nez p1, :cond_13

    .line 275
    .line 276
    new-instance p1, Ljava/util/ArrayList;

    .line 277
    .line 278
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 279
    .line 280
    .line 281
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 282
    .line 283
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 284
    .line 285
    if-nez p1, :cond_14

    .line 286
    .line 287
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageSetting;->new_()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 292
    .line 293
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 294
    .line 295
    if-nez p1, :cond_15

    .line 296
    .line 297
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 298
    .line 299
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 304
    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 306
    .line 307
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 308
    .line 309
    if-nez p1, :cond_16

    .line 310
    .line 311
    new-instance p1, Ljava/util/ArrayList;

    .line 312
    .line 313
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 314
    .line 315
    .line 316
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 317
    .line 318
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 319
    .line 320
    if-nez p1, :cond_17

    .line 321
    .line 322
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 323
    .line 324
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 329
    .line 330
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 331
    .line 332
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 333
    .line 334
    if-nez p1, :cond_18

    .line 335
    .line 336
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 337
    .line 338
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 339
    .line 340
    if-nez p1, :cond_19

    .line 341
    .line 342
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 343
    .line 344
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 345
    .line 346
    if-nez p1, :cond_1a

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AudioText;->new_()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 353
    .line 354
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 355
    .line 356
    if-nez p1, :cond_1b

    .line 357
    .line 358
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 359
    .line 360
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 361
    .line 362
    if-nez p1, :cond_1c

    .line 363
    .line 364
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 365
    .line 366
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 367
    .line 368
    if-nez p1, :cond_1d

    .line 369
    .line 370
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 371
    .line 372
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 373
    .line 374
    if-nez p1, :cond_3c

    .line 375
    .line 376
    new-instance p1, Ljava/util/ArrayList;

    .line 377
    .line 378
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .line 380
    .line 381
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 382
    .line 383
    return-object p0

    .line 384
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 385
    .line 386
    .line 387
    move-result v9

    .line 388
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 389
    .line 390
    goto/16 :goto_0

    .line 391
    .line 392
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 393
    .line 394
    .line 395
    move-result v9

    .line 396
    iput v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 397
    .line 398
    goto/16 :goto_0

    .line 399
    .line 400
    :sswitch_2
    sget-object v9, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 401
    .line 402
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 403
    .line 404
    .line 405
    move-result-object v9

    .line 406
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v9

    .line 410
    check-cast v9, Ljava/util/List;

    .line 411
    .line 412
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 413
    .line 414
    goto/16 :goto_0

    .line 415
    .line 416
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v9

    .line 420
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 421
    .line 422
    goto/16 :goto_0

    .line 423
    .line 424
    :sswitch_4
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 425
    .line 426
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v9

    .line 430
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 431
    .line 432
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_5
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 437
    .line 438
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v9

    .line 442
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 443
    .line 444
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 445
    .line 446
    goto/16 :goto_0

    .line 447
    .line 448
    :sswitch_6
    sget-object v9, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 449
    .line 450
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 451
    .line 452
    .line 453
    move-result-object v9

    .line 454
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object v9

    .line 458
    check-cast v9, Ljava/util/List;

    .line 459
    .line 460
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_7
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 465
    .line 466
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v9

    .line 470
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 471
    .line 472
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 473
    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :sswitch_8
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 477
    .line 478
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object v9

    .line 482
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 483
    .line 484
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 485
    .line 486
    goto/16 :goto_0

    .line 487
    .line 488
    :sswitch_9
    sget-object v9, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 489
    .line 490
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v9

    .line 494
    check-cast v9, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 495
    .line 496
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 497
    .line 498
    goto/16 :goto_0

    .line 499
    .line 500
    :sswitch_a
    sget-object v9, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 501
    .line 502
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v9

    .line 506
    check-cast v9, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 507
    .line 508
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 509
    .line 510
    goto/16 :goto_0

    .line 511
    .line 512
    :sswitch_b
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 513
    .line 514
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v9

    .line 518
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 519
    .line 520
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 521
    .line 522
    goto/16 :goto_0

    .line 523
    .line 524
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v9

    .line 528
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 529
    .line 530
    goto/16 :goto_0

    .line 531
    .line 532
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v9

    .line 536
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 537
    .line 538
    goto/16 :goto_0

    .line 539
    .line 540
    :sswitch_e
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageExtData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 541
    .line 542
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v9

    .line 546
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 547
    .line 548
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 549
    .line 550
    goto/16 :goto_0

    .line 551
    .line 552
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 553
    .line 554
    .line 555
    move-result v9

    .line 556
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 557
    .line 558
    goto/16 :goto_0

    .line 559
    .line 560
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 561
    .line 562
    .line 563
    move-result v9

    .line 564
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 565
    .line 566
    goto/16 :goto_0

    .line 567
    .line 568
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v9

    .line 572
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_12
    sget-object v9, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 577
    .line 578
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object v9

    .line 582
    check-cast v9, Lcom/p1/mobile/putong/core/data/AudioText;

    .line 583
    .line 584
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 585
    .line 586
    goto/16 :goto_0

    .line 587
    .line 588
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 589
    .line 590
    .line 591
    move-result-object v9

    .line 592
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 593
    .line 594
    goto/16 :goto_0

    .line 595
    .line 596
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 597
    .line 598
    .line 599
    move-result-object v9

    .line 600
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v9

    .line 608
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 609
    .line 610
    goto/16 :goto_0

    .line 611
    .line 612
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 613
    .line 614
    .line 615
    move-result v8

    .line 616
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 617
    .line 618
    .line 619
    move-result-object v8

    .line 620
    goto/16 :goto_0

    .line 621
    .line 622
    :sswitch_17
    sget-object v9, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 623
    .line 624
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 625
    .line 626
    .line 627
    move-result-object v9

    .line 628
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 629
    .line 630
    .line 631
    move-result-object v9

    .line 632
    check-cast v9, Ljava/util/List;

    .line 633
    .line 634
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 635
    .line 636
    goto/16 :goto_0

    .line 637
    .line 638
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 639
    .line 640
    .line 641
    move-result v7

    .line 642
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 643
    .line 644
    .line 645
    move-result-object v7

    .line 646
    goto/16 :goto_0

    .line 647
    .line 648
    :sswitch_19
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 649
    .line 650
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    move-result-object v9

    .line 654
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 655
    .line 656
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_1a
    sget-object v6, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 661
    .line 662
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 663
    .line 664
    .line 665
    move-result-object v6

    .line 666
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object v6

    .line 670
    check-cast v6, Ljava/util/List;

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v9

    .line 678
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 679
    .line 680
    goto/16 :goto_0

    .line 681
    .line 682
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 683
    .line 684
    .line 685
    move-result v9

    .line 686
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 687
    .line 688
    goto/16 :goto_0

    .line 689
    .line 690
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 691
    .line 692
    .line 693
    move-result v9

    .line 694
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 695
    .line 696
    goto/16 :goto_0

    .line 697
    .line 698
    :sswitch_1e
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 699
    .line 700
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 701
    .line 702
    .line 703
    move-result-object v9

    .line 704
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 705
    .line 706
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 707
    .line 708
    goto/16 :goto_0

    .line 709
    .line 710
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 711
    .line 712
    .line 713
    move-result v5

    .line 714
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 715
    .line 716
    .line 717
    move-result-object v5

    .line 718
    goto/16 :goto_0

    .line 719
    .line 720
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 721
    .line 722
    .line 723
    move-result v4

    .line 724
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 725
    .line 726
    .line 727
    move-result-object v4

    .line 728
    goto/16 :goto_0

    .line 729
    .line 730
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object v9

    .line 734
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 735
    .line 736
    goto/16 :goto_0

    .line 737
    .line 738
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 739
    .line 740
    .line 741
    move-result-object v9

    .line 742
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 743
    .line 744
    goto/16 :goto_0

    .line 745
    .line 746
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 747
    .line 748
    .line 749
    move-result v9

    .line 750
    iput v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 751
    .line 752
    goto/16 :goto_0

    .line 753
    .line 754
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 755
    .line 756
    .line 757
    move-result v9

    .line 758
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 759
    .line 760
    goto/16 :goto_0

    .line 761
    .line 762
    :sswitch_25
    sget-object v9, Lcom/p1/mobile/putong/core/data/Letter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 763
    .line 764
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 765
    .line 766
    .line 767
    move-result-object v9

    .line 768
    check-cast v9, Lcom/p1/mobile/putong/core/data/Letter;

    .line 769
    .line 770
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 771
    .line 772
    goto/16 :goto_0

    .line 773
    .line 774
    :sswitch_26
    sget-object v9, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 775
    .line 776
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 777
    .line 778
    .line 779
    move-result-object v9

    .line 780
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 781
    .line 782
    .line 783
    move-result-object v9

    .line 784
    check-cast v9, Ljava/util/List;

    .line 785
    .line 786
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 787
    .line 788
    goto/16 :goto_0

    .line 789
    .line 790
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 791
    .line 792
    .line 793
    move-result v3

    .line 794
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 795
    .line 796
    .line 797
    move-result-object v3

    .line 798
    goto/16 :goto_0

    .line 799
    .line 800
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 801
    .line 802
    .line 803
    move-result v9

    .line 804
    iput v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 805
    .line 806
    goto/16 :goto_0

    .line 807
    .line 808
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 809
    .line 810
    .line 811
    move-result-object v9

    .line 812
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 813
    .line 814
    goto/16 :goto_0

    .line 815
    .line 816
    :sswitch_2a
    sget-object v9, Lcom/p1/mobile/putong/core/data/CallRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 817
    .line 818
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 819
    .line 820
    .line 821
    move-result-object v9

    .line 822
    check-cast v9, Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 823
    .line 824
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 825
    .line 826
    goto/16 :goto_0

    .line 827
    .line 828
    :sswitch_2b
    sget-object v9, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 829
    .line 830
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 831
    .line 832
    .line 833
    move-result-object v9

    .line 834
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 835
    .line 836
    .line 837
    move-result-object v9

    .line 838
    check-cast v9, Ljava/util/List;

    .line 839
    .line 840
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 841
    .line 842
    goto/16 :goto_0

    .line 843
    .line 844
    :sswitch_2c
    sget-object v9, Lcom/p1/mobile/putong/core/data/MessageAccessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 845
    .line 846
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 847
    .line 848
    .line 849
    move-result-object v9

    .line 850
    check-cast v9, Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 851
    .line 852
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 853
    .line 854
    goto/16 :goto_0

    .line 855
    .line 856
    :sswitch_2d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 857
    .line 858
    .line 859
    move-result-object v9

    .line 860
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 861
    .line 862
    goto/16 :goto_0

    .line 863
    .line 864
    :sswitch_2e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 865
    .line 866
    .line 867
    move-result-object v9

    .line 868
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 869
    .line 870
    goto/16 :goto_0

    .line 871
    .line 872
    :sswitch_2f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 873
    .line 874
    .line 875
    move-result v2

    .line 876
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 877
    .line 878
    .line 879
    move-result-object v2

    .line 880
    goto/16 :goto_0

    .line 881
    .line 882
    :sswitch_30
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 883
    .line 884
    .line 885
    move-result-object v9

    .line 886
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 887
    .line 888
    goto/16 :goto_0

    .line 889
    .line 890
    :sswitch_31
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 891
    .line 892
    .line 893
    move-result v9

    .line 894
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 895
    .line 896
    .line 897
    move-result-object v9

    .line 898
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 899
    .line 900
    goto/16 :goto_0

    .line 901
    .line 902
    :sswitch_32
    sget-object v9, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 903
    .line 904
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 905
    .line 906
    .line 907
    move-result-object v9

    .line 908
    check-cast v9, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 909
    .line 910
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 911
    .line 912
    goto/16 :goto_0

    .line 913
    .line 914
    :sswitch_33
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object v9

    .line 918
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 919
    .line 920
    goto/16 :goto_0

    .line 921
    .line 922
    :sswitch_34
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 923
    .line 924
    .line 925
    move-result-object v9

    .line 926
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 927
    .line 928
    goto/16 :goto_0

    .line 929
    .line 930
    :sswitch_35
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 931
    .line 932
    .line 933
    move-result-object v9

    .line 934
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 935
    .line 936
    goto/16 :goto_0

    .line 937
    .line 938
    :sswitch_36
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 939
    .line 940
    .line 941
    move-result v1

    .line 942
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 943
    .line 944
    .line 945
    move-result-object v1

    .line 946
    goto/16 :goto_0

    .line 947
    .line 948
    :sswitch_37
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 949
    .line 950
    .line 951
    move-result-object v9

    .line 952
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 953
    .line 954
    goto/16 :goto_0

    .line 955
    .line 956
    :sswitch_38
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 957
    .line 958
    .line 959
    move-result-object v9

    .line 960
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 961
    .line 962
    goto/16 :goto_0

    .line 963
    .line 964
    :sswitch_39
    sget-object v9, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 965
    .line 966
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 967
    .line 968
    .line 969
    move-result-object v9

    .line 970
    invoke-virtual {p1, v9}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 971
    .line 972
    .line 973
    move-result-object v9

    .line 974
    check-cast v9, Ljava/util/List;

    .line 975
    .line 976
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 977
    .line 978
    goto/16 :goto_0

    .line 979
    .line 980
    :sswitch_3a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 981
    .line 982
    .line 983
    move-result-object v9

    .line 984
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 985
    .line 986
    goto/16 :goto_0

    .line 987
    .line 988
    :sswitch_3b
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 989
    .line 990
    .line 991
    move-result-wide v9

    .line 992
    iput-wide v9, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 993
    .line 994
    goto/16 :goto_0

    .line 995
    .line 996
    :sswitch_3c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 997
    .line 998
    .line 999
    move-result v9

    .line 1000
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 1001
    .line 1002
    goto/16 :goto_0

    .line 1003
    .line 1004
    :sswitch_3d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 1005
    .line 1006
    .line 1007
    move-result v9

    .line 1008
    iput-boolean v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 1009
    .line 1010
    goto/16 :goto_0

    .line 1011
    .line 1012
    :sswitch_3e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 1013
    .line 1014
    .line 1015
    move-result v9

    .line 1016
    iput v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 1017
    .line 1018
    goto/16 :goto_0

    .line 1019
    .line 1020
    :sswitch_3f
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 1021
    .line 1022
    .line 1023
    move-result-wide v9

    .line 1024
    iput-wide v9, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 1025
    .line 1026
    goto/16 :goto_0

    .line 1027
    .line 1028
    :sswitch_40
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v9

    .line 1032
    iput-object v9, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1033
    .line 1034
    goto/16 :goto_0

    .line 1035
    .line 1036
    :sswitch_41
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 1037
    .line 1038
    .line 1039
    move-result-wide v9

    .line 1040
    iput-wide v9, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 1041
    .line 1042
    goto/16 :goto_0

    .line 1043
    .line 1044
    :sswitch_42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 1045
    .line 1046
    if-nez p1, :cond_1e

    .line 1047
    .line 1048
    if-eqz v1, :cond_1e

    .line 1049
    .line 1050
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1051
    .line 1052
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 1053
    .line 1054
    .line 1055
    move-result v1

    .line 1056
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1057
    .line 1058
    .line 1059
    move-result-object p1

    .line 1060
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 1061
    .line 1062
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 1063
    .line 1064
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1065
    .line 1066
    if-nez p1, :cond_1f

    .line 1067
    .line 1068
    if-eqz v2, :cond_1f

    .line 1069
    .line 1070
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1071
    .line 1072
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1073
    .line 1074
    .line 1075
    move-result v1

    .line 1076
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1077
    .line 1078
    .line 1079
    move-result-object p1

    .line 1080
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1081
    .line 1082
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1083
    .line 1084
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1085
    .line 1086
    if-nez p1, :cond_20

    .line 1087
    .line 1088
    if-eqz v3, :cond_20

    .line 1089
    .line 1090
    sget-object p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1091
    .line 1092
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1093
    .line 1094
    .line 1095
    move-result v1

    .line 1096
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1097
    .line 1098
    .line 1099
    move-result-object p1

    .line 1100
    check-cast p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1101
    .line 1102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1103
    .line 1104
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1105
    .line 1106
    if-nez p1, :cond_21

    .line 1107
    .line 1108
    if-eqz v4, :cond_21

    .line 1109
    .line 1110
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1111
    .line 1112
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1113
    .line 1114
    .line 1115
    move-result v1

    .line 1116
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1117
    .line 1118
    .line 1119
    move-result-object p1

    .line 1120
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1121
    .line 1122
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1123
    .line 1124
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1125
    .line 1126
    if-nez p1, :cond_22

    .line 1127
    .line 1128
    if-eqz v5, :cond_22

    .line 1129
    .line 1130
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1131
    .line 1132
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 1133
    .line 1134
    .line 1135
    move-result v1

    .line 1136
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1137
    .line 1138
    .line 1139
    move-result-object p1

    .line 1140
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1141
    .line 1142
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1143
    .line 1144
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1145
    .line 1146
    if-nez p1, :cond_23

    .line 1147
    .line 1148
    if-eqz v6, :cond_23

    .line 1149
    .line 1150
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 1151
    .line 1152
    .line 1153
    move-result-object p1

    .line 1154
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1155
    .line 1156
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1157
    .line 1158
    if-nez p1, :cond_24

    .line 1159
    .line 1160
    if-eqz v7, :cond_24

    .line 1161
    .line 1162
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1163
    .line 1164
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 1165
    .line 1166
    .line 1167
    move-result v1

    .line 1168
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1169
    .line 1170
    .line 1171
    move-result-object p1

    .line 1172
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1173
    .line 1174
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1175
    .line 1176
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1177
    .line 1178
    if-nez p1, :cond_25

    .line 1179
    .line 1180
    if-eqz v8, :cond_25

    .line 1181
    .line 1182
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1183
    .line 1184
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 1185
    .line 1186
    .line 1187
    move-result v1

    .line 1188
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1189
    .line 1190
    .line 1191
    move-result-object p1

    .line 1192
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1193
    .line 1194
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1195
    .line 1196
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 1197
    .line 1198
    if-nez p1, :cond_26

    .line 1199
    .line 1200
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 1201
    .line 1202
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 1203
    .line 1204
    if-nez p1, :cond_27

    .line 1205
    .line 1206
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 1207
    .line 1208
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 1209
    .line 1210
    if-nez p1, :cond_28

    .line 1211
    .line 1212
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 1213
    .line 1214
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1215
    .line 1216
    if-nez p1, :cond_29

    .line 1217
    .line 1218
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1219
    .line 1220
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1221
    .line 1222
    if-nez p1, :cond_2a

    .line 1223
    .line 1224
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1225
    .line 1226
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1227
    .line 1228
    .line 1229
    move-result-object p1

    .line 1230
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1231
    .line 1232
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1233
    .line 1234
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1235
    .line 1236
    if-nez p1, :cond_2b

    .line 1237
    .line 1238
    sget-object p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1239
    .line 1240
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1241
    .line 1242
    .line 1243
    move-result-object p1

    .line 1244
    check-cast p1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1245
    .line 1246
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1247
    .line 1248
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 1249
    .line 1250
    if-nez p1, :cond_2c

    .line 1251
    .line 1252
    new-instance p1, Ljava/util/ArrayList;

    .line 1253
    .line 1254
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1255
    .line 1256
    .line 1257
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 1258
    .line 1259
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1260
    .line 1261
    if-nez p1, :cond_2d

    .line 1262
    .line 1263
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommentInfo;->new_()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1264
    .line 1265
    .line 1266
    move-result-object p1

    .line 1267
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1268
    .line 1269
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 1270
    .line 1271
    if-nez p1, :cond_2e

    .line 1272
    .line 1273
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 1274
    .line 1275
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 1276
    .line 1277
    if-nez p1, :cond_2f

    .line 1278
    .line 1279
    new-instance p1, Ljava/util/ArrayList;

    .line 1280
    .line 1281
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1282
    .line 1283
    .line 1284
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 1285
    .line 1286
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 1287
    .line 1288
    if-nez p1, :cond_30

    .line 1289
    .line 1290
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 1291
    .line 1292
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1293
    .line 1294
    if-nez p1, :cond_31

    .line 1295
    .line 1296
    new-instance p1, Ljava/util/ArrayList;

    .line 1297
    .line 1298
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1299
    .line 1300
    .line 1301
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1302
    .line 1303
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1304
    .line 1305
    if-nez p1, :cond_32

    .line 1306
    .line 1307
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageSetting;->new_()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1308
    .line 1309
    .line 1310
    move-result-object p1

    .line 1311
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1312
    .line 1313
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1314
    .line 1315
    if-nez p1, :cond_33

    .line 1316
    .line 1317
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1318
    .line 1319
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1320
    .line 1321
    .line 1322
    move-result-object p1

    .line 1323
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1324
    .line 1325
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1326
    .line 1327
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 1328
    .line 1329
    if-nez p1, :cond_34

    .line 1330
    .line 1331
    new-instance p1, Ljava/util/ArrayList;

    .line 1332
    .line 1333
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1334
    .line 1335
    .line 1336
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 1337
    .line 1338
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1339
    .line 1340
    if-nez p1, :cond_35

    .line 1341
    .line 1342
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1343
    .line 1344
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1345
    .line 1346
    .line 1347
    move-result-object p1

    .line 1348
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1349
    .line 1350
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1351
    .line 1352
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 1353
    .line 1354
    if-nez p1, :cond_36

    .line 1355
    .line 1356
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 1357
    .line 1358
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 1359
    .line 1360
    if-nez p1, :cond_37

    .line 1361
    .line 1362
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 1363
    .line 1364
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1365
    .line 1366
    if-nez p1, :cond_38

    .line 1367
    .line 1368
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AudioText;->new_()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1369
    .line 1370
    .line 1371
    move-result-object p1

    .line 1372
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1373
    .line 1374
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 1375
    .line 1376
    if-nez p1, :cond_39

    .line 1377
    .line 1378
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 1379
    .line 1380
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 1381
    .line 1382
    if-nez p1, :cond_3a

    .line 1383
    .line 1384
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 1385
    .line 1386
    :cond_3a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 1387
    .line 1388
    if-nez p1, :cond_3b

    .line 1389
    .line 1390
    iput-object v10, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 1391
    .line 1392
    :cond_3b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 1393
    .line 1394
    if-nez p1, :cond_3c

    .line 1395
    .line 1396
    new-instance p1, Ljava/util/ArrayList;

    .line 1397
    .line 1398
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1399
    .line 1400
    .line 1401
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 1402
    .line 1403
    :cond_3c
    return-object p0

    .line 1404
    nop

    .line 1405
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_42
        0x8 -> :sswitch_41
        0x12 -> :sswitch_40
        0x198 -> :sswitch_3f
        0x1a0 -> :sswitch_3e
        0x1a8 -> :sswitch_3d
        0x1b0 -> :sswitch_3c
        0x1b9 -> :sswitch_3b
        0x1c2 -> :sswitch_3a
        0x1ca -> :sswitch_39
        0x1d2 -> :sswitch_38
        0x1da -> :sswitch_37
        0x1e0 -> :sswitch_36
        0x1ea -> :sswitch_35
        0x1f2 -> :sswitch_34
        0x1fa -> :sswitch_33
        0x202 -> :sswitch_32
        0x208 -> :sswitch_31
        0x212 -> :sswitch_30
        0x218 -> :sswitch_2f
        0x222 -> :sswitch_2e
        0x22a -> :sswitch_2d
        0x232 -> :sswitch_2c
        0x23a -> :sswitch_2b
        0x242 -> :sswitch_2a
        0x24a -> :sswitch_29
        0x250 -> :sswitch_28
        0x258 -> :sswitch_27
        0x262 -> :sswitch_26
        0x26a -> :sswitch_25
        0x270 -> :sswitch_24
        0x278 -> :sswitch_23
        0x282 -> :sswitch_22
        0x28a -> :sswitch_21
        0x290 -> :sswitch_20
        0x298 -> :sswitch_1f
        0x2a2 -> :sswitch_1e
        0x2a8 -> :sswitch_1d
        0x2b0 -> :sswitch_1c
        0x2ba -> :sswitch_1b
        0x2c2 -> :sswitch_1a
        0x2ca -> :sswitch_19
        0x2d0 -> :sswitch_18
        0x2da -> :sswitch_17
        0x2e0 -> :sswitch_16
        0x2ea -> :sswitch_15
        0x2f2 -> :sswitch_14
        0x2fa -> :sswitch_13
        0x302 -> :sswitch_12
        0x30a -> :sswitch_11
        0x310 -> :sswitch_10
        0x318 -> :sswitch_f
        0x322 -> :sswitch_e
        0x32a -> :sswitch_d
        0x332 -> :sswitch_c
        0x33a -> :sswitch_b
        0x342 -> :sswitch_a
        0x34a -> :sswitch_9
        0x352 -> :sswitch_8
        0x35a -> :sswitch_7
        0x362 -> :sswitch_6
        0x36a -> :sswitch_5
        0x372 -> :sswitch_4
        0x37a -> :sswitch_3
        0x382 -> :sswitch_2
        0x388 -> :sswitch_1
        0x390 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1405
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Message$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Message;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/16 p0, 0x33

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x34

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x35

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x36

    .line 37
    .line 38
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x37

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    const/16 v0, 0x38

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const/16 v1, 0x39

    .line 70
    .line 71
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_3

    .line 77
    .line 78
    const/16 v0, 0x3a

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    const/16 v0, 0x3b

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 93
    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    const/16 v0, 0x3c

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 103
    .line 104
    .line 105
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_6

    .line 108
    .line 109
    const/16 v0, 0x3d

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const/16 v0, 0x3e

    .line 119
    .line 120
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const/16 v0, 0x3f

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    const/16 v0, 0x40

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 144
    .line 145
    if-eqz p0, :cond_a

    .line 146
    .line 147
    const/16 v0, 0x41

    .line 148
    .line 149
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 154
    .line 155
    .line 156
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz p0, :cond_b

    .line 159
    .line 160
    const/16 v0, 0x42

    .line 161
    .line 162
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 166
    .line 167
    if-eqz p0, :cond_c

    .line 168
    .line 169
    const/16 v0, 0x43

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 176
    .line 177
    .line 178
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz p0, :cond_d

    .line 181
    .line 182
    const/16 v0, 0x44

    .line 183
    .line 184
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz p0, :cond_e

    .line 190
    .line 191
    const/16 v0, 0x45

    .line 192
    .line 193
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 197
    .line 198
    if-eqz p0, :cond_f

    .line 199
    .line 200
    const/16 v0, 0x46

    .line 201
    .line 202
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageAccessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 205
    .line 206
    .line 207
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 208
    .line 209
    if-eqz p0, :cond_10

    .line 210
    .line 211
    sget-object v0, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    const/16 v1, 0x47

    .line 218
    .line 219
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 220
    .line 221
    .line 222
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 223
    .line 224
    if-eqz p0, :cond_11

    .line 225
    .line 226
    const/16 v0, 0x48

    .line 227
    .line 228
    sget-object v1, Lcom/p1/mobile/putong/core/data/CallRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 231
    .line 232
    .line 233
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz p0, :cond_12

    .line 236
    .line 237
    const/16 v0, 0x49

    .line 238
    .line 239
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :cond_12
    const/16 p0, 0x4a

    .line 243
    .line 244
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 245
    .line 246
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 250
    .line 251
    if-eqz p0, :cond_13

    .line 252
    .line 253
    const/16 v0, 0x4b

    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 260
    .line 261
    .line 262
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 263
    .line 264
    if-eqz p0, :cond_14

    .line 265
    .line 266
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    const/16 v1, 0x4c

    .line 273
    .line 274
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 275
    .line 276
    .line 277
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 278
    .line 279
    if-eqz p0, :cond_15

    .line 280
    .line 281
    const/16 v0, 0x4d

    .line 282
    .line 283
    sget-object v1, Lcom/p1/mobile/putong/core/data/Letter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 284
    .line 285
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 286
    .line 287
    .line 288
    :cond_15
    const/16 p0, 0x4e

    .line 289
    .line 290
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 291
    .line 292
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 293
    .line 294
    .line 295
    const/16 p0, 0x4f

    .line 296
    .line 297
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 298
    .line 299
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 300
    .line 301
    .line 302
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 303
    .line 304
    if-eqz p0, :cond_16

    .line 305
    .line 306
    const/16 v0, 0x50

    .line 307
    .line 308
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 309
    .line 310
    .line 311
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 312
    .line 313
    if-eqz p0, :cond_17

    .line 314
    .line 315
    const/16 v0, 0x51

    .line 316
    .line 317
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 318
    .line 319
    .line 320
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 321
    .line 322
    if-eqz p0, :cond_18

    .line 323
    .line 324
    const/16 v0, 0x52

    .line 325
    .line 326
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 327
    .line 328
    .line 329
    move-result p0

    .line 330
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 331
    .line 332
    .line 333
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 334
    .line 335
    if-eqz p0, :cond_19

    .line 336
    .line 337
    const/16 v0, 0x53

    .line 338
    .line 339
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 340
    .line 341
    .line 342
    move-result p0

    .line 343
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 344
    .line 345
    .line 346
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 347
    .line 348
    if-eqz p0, :cond_1a

    .line 349
    .line 350
    const/16 v0, 0x54

    .line 351
    .line 352
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 353
    .line 354
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 355
    .line 356
    .line 357
    :cond_1a
    const/16 p0, 0x55

    .line 358
    .line 359
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 360
    .line 361
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 362
    .line 363
    .line 364
    const/16 p0, 0x56

    .line 365
    .line 366
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 367
    .line 368
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 369
    .line 370
    .line 371
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 372
    .line 373
    if-eqz p0, :cond_1b

    .line 374
    .line 375
    const/16 v0, 0x57

    .line 376
    .line 377
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 378
    .line 379
    .line 380
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 381
    .line 382
    if-eqz p0, :cond_1c

    .line 383
    .line 384
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 389
    .line 390
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    const/16 v1, 0x58

    .line 395
    .line 396
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 397
    .line 398
    .line 399
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 400
    .line 401
    if-eqz p0, :cond_1d

    .line 402
    .line 403
    const/16 v0, 0x59

    .line 404
    .line 405
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 406
    .line 407
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 408
    .line 409
    .line 410
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 411
    .line 412
    if-eqz p0, :cond_1e

    .line 413
    .line 414
    const/16 v0, 0x5a

    .line 415
    .line 416
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 417
    .line 418
    .line 419
    move-result p0

    .line 420
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 421
    .line 422
    .line 423
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 424
    .line 425
    if-eqz p0, :cond_1f

    .line 426
    .line 427
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 428
    .line 429
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    const/16 v1, 0x5b

    .line 434
    .line 435
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 436
    .line 437
    .line 438
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 439
    .line 440
    if-eqz p0, :cond_20

    .line 441
    .line 442
    const/16 v0, 0x5c

    .line 443
    .line 444
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 445
    .line 446
    .line 447
    move-result p0

    .line 448
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 449
    .line 450
    .line 451
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 452
    .line 453
    if-eqz p0, :cond_21

    .line 454
    .line 455
    const/16 v0, 0x5d

    .line 456
    .line 457
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 458
    .line 459
    .line 460
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 461
    .line 462
    if-eqz p0, :cond_22

    .line 463
    .line 464
    const/16 v0, 0x5e

    .line 465
    .line 466
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 470
    .line 471
    if-eqz p0, :cond_23

    .line 472
    .line 473
    const/16 v0, 0x5f

    .line 474
    .line 475
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 476
    .line 477
    .line 478
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 479
    .line 480
    if-eqz p0, :cond_24

    .line 481
    .line 482
    const/16 v0, 0x60

    .line 483
    .line 484
    sget-object v1, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 485
    .line 486
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 487
    .line 488
    .line 489
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 490
    .line 491
    if-eqz p0, :cond_25

    .line 492
    .line 493
    const/16 v0, 0x61

    .line 494
    .line 495
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 496
    .line 497
    .line 498
    :cond_25
    const/16 p0, 0x62

    .line 499
    .line 500
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 501
    .line 502
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 503
    .line 504
    .line 505
    const/16 p0, 0x63

    .line 506
    .line 507
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 508
    .line 509
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 510
    .line 511
    .line 512
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 513
    .line 514
    if-eqz p0, :cond_26

    .line 515
    .line 516
    const/16 v0, 0x64

    .line 517
    .line 518
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 519
    .line 520
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 521
    .line 522
    .line 523
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 524
    .line 525
    if-eqz p0, :cond_27

    .line 526
    .line 527
    const/16 v0, 0x65

    .line 528
    .line 529
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 530
    .line 531
    .line 532
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 533
    .line 534
    if-eqz p0, :cond_28

    .line 535
    .line 536
    const/16 v0, 0x66

    .line 537
    .line 538
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 539
    .line 540
    .line 541
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 542
    .line 543
    if-eqz p0, :cond_29

    .line 544
    .line 545
    const/16 v0, 0x67

    .line 546
    .line 547
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 548
    .line 549
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 550
    .line 551
    .line 552
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 553
    .line 554
    if-eqz p0, :cond_2a

    .line 555
    .line 556
    const/16 v0, 0x68

    .line 557
    .line 558
    sget-object v1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 559
    .line 560
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 561
    .line 562
    .line 563
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 564
    .line 565
    if-eqz p0, :cond_2b

    .line 566
    .line 567
    const/16 v0, 0x69

    .line 568
    .line 569
    sget-object v1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 570
    .line 571
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 572
    .line 573
    .line 574
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 575
    .line 576
    if-eqz p0, :cond_2c

    .line 577
    .line 578
    const/16 v0, 0x6a

    .line 579
    .line 580
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 581
    .line 582
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 583
    .line 584
    .line 585
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 586
    .line 587
    if-eqz p0, :cond_2d

    .line 588
    .line 589
    const/16 v0, 0x6b

    .line 590
    .line 591
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 592
    .line 593
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 594
    .line 595
    .line 596
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 597
    .line 598
    if-eqz p0, :cond_2e

    .line 599
    .line 600
    sget-object v0, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 601
    .line 602
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    const/16 v1, 0x6c

    .line 607
    .line 608
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 609
    .line 610
    .line 611
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 612
    .line 613
    if-eqz p0, :cond_2f

    .line 614
    .line 615
    const/16 v0, 0x6d

    .line 616
    .line 617
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageChannel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 618
    .line 619
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 620
    .line 621
    .line 622
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 623
    .line 624
    if-eqz p0, :cond_30

    .line 625
    .line 626
    const/16 v0, 0x6e

    .line 627
    .line 628
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 629
    .line 630
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 631
    .line 632
    .line 633
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 634
    .line 635
    if-eqz p0, :cond_31

    .line 636
    .line 637
    const/16 v0, 0x6f

    .line 638
    .line 639
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 640
    .line 641
    .line 642
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 643
    .line 644
    if-eqz p0, :cond_32

    .line 645
    .line 646
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 647
    .line 648
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    const/16 v1, 0x70

    .line 653
    .line 654
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 655
    .line 656
    .line 657
    :cond_32
    const/16 p0, 0x71

    .line 658
    .line 659
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 660
    .line 661
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 662
    .line 663
    .line 664
    const/16 p0, 0x72

    .line 665
    .line 666
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 667
    .line 668
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 669
    .line 670
    .line 671
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 672
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Message$1;->serialize(Lcom/p1/mobile/putong/core/data/Message;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
