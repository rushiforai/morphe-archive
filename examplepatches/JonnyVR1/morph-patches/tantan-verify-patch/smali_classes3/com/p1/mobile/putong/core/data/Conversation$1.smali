.class Lcom/p1/mobile/putong/core/data/Conversation$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Conversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Conversation;)I
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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const/16 v1, 0x34

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const/16 v1, 0x35

    .line 47
    .line 48
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr p0, v0

    .line 53
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/16 v1, 0x36

    .line 58
    .line 59
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_3
    const/16 v0, 0x37

    .line 65
    .line 66
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 67
    .line 68
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    const/16 v0, 0x38

    .line 74
    .line 75
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 76
    .line 77
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    const/16 v1, 0x39

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 98
    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    const/16 v1, 0x3a

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_5
    const/16 v0, 0x3b

    .line 113
    .line 114
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 122
    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const/16 v2, 0x3c

    .line 132
    .line 133
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_6
    const/16 v0, 0x3d

    .line 139
    .line 140
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 141
    .line 142
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    add-int/2addr p0, v0

    .line 147
    const/16 v0, 0x3e

    .line 148
    .line 149
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 150
    .line 151
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    add-int/2addr p0, v0

    .line 156
    const/16 v0, 0x3f

    .line 157
    .line 158
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 159
    .line 160
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 166
    .line 167
    if-eqz v0, :cond_7

    .line 168
    .line 169
    const/16 v1, 0x40

    .line 170
    .line 171
    sget-object v2, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    add-int/2addr p0, v0

    .line 178
    :cond_7
    const/16 v0, 0x41

    .line 179
    .line 180
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 181
    .line 182
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 188
    .line 189
    if-eqz v0, :cond_8

    .line 190
    .line 191
    const/16 v1, 0x42

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
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v0, :cond_9

    .line 205
    .line 206
    const/16 v1, 0x43

    .line 207
    .line 208
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    add-int/2addr p0, v0

    .line 213
    :cond_9
    const/16 v0, 0x44

    .line 214
    .line 215
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 216
    .line 217
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    add-int/2addr p0, v0

    .line 222
    const/16 v0, 0x45

    .line 223
    .line 224
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 225
    .line 226
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    add-int/2addr p0, v0

    .line 231
    const/16 v0, 0x46

    .line 232
    .line 233
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 234
    .line 235
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    add-int/2addr p0, v0

    .line 240
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 241
    .line 242
    if-eqz v0, :cond_a

    .line 243
    .line 244
    const/16 v1, 0x47

    .line 245
    .line 246
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    add-int/2addr p0, v0

    .line 251
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 252
    .line 253
    if-eqz v0, :cond_b

    .line 254
    .line 255
    const/16 v1, 0x48

    .line 256
    .line 257
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    add-int/2addr p0, v0

    .line 266
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 267
    .line 268
    if-eqz v0, :cond_c

    .line 269
    .line 270
    const/16 v1, 0x49

    .line 271
    .line 272
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    add-int/2addr p0, v0

    .line 277
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 278
    .line 279
    if-eqz v0, :cond_d

    .line 280
    .line 281
    const/16 v1, 0x4a

    .line 282
    .line 283
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    add-int/2addr p0, v0

    .line 292
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 293
    .line 294
    if-eqz v0, :cond_e

    .line 295
    .line 296
    const/16 v1, 0x4b

    .line 297
    .line 298
    sget-object v2, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    .line 300
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    add-int/2addr p0, v0

    .line 305
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 306
    .line 307
    if-eqz v0, :cond_f

    .line 308
    .line 309
    const/16 v1, 0x4c

    .line 310
    .line 311
    sget-object v2, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    add-int/2addr p0, v0

    .line 318
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 319
    .line 320
    if-eqz v0, :cond_10

    .line 321
    .line 322
    const/16 v1, 0x4d

    .line 323
    .line 324
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    add-int/2addr p0, v0

    .line 329
    :cond_10
    const/16 v0, 0x4e

    .line 330
    .line 331
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 332
    .line 333
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    add-int/2addr p0, v0

    .line 338
    const/16 v0, 0x4f

    .line 339
    .line 340
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 341
    .line 342
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    add-int/2addr p0, v0

    .line 347
    const/16 v0, 0x50

    .line 348
    .line 349
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 350
    .line 351
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    add-int/2addr p0, v0

    .line 356
    const/16 v0, 0x51

    .line 357
    .line 358
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 359
    .line 360
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 361
    .line 362
    .line 363
    move-result v0

    .line 364
    add-int/2addr p0, v0

    .line 365
    const/16 v0, 0x52

    .line 366
    .line 367
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 368
    .line 369
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    add-int/2addr p0, v0

    .line 374
    const/16 v0, 0x53

    .line 375
    .line 376
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 377
    .line 378
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    add-int/2addr p0, v0

    .line 383
    const/16 v0, 0x54

    .line 384
    .line 385
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 386
    .line 387
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    add-int/2addr p0, v0

    .line 392
    const/16 v0, 0x55

    .line 393
    .line 394
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 395
    .line 396
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    add-int/2addr p0, v0

    .line 401
    const/16 v0, 0x56

    .line 402
    .line 403
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 404
    .line 405
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    add-int/2addr p0, v0

    .line 410
    const/16 v0, 0x57

    .line 411
    .line 412
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 413
    .line 414
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    add-int/2addr p0, v0

    .line 419
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 420
    .line 421
    if-eqz v0, :cond_11

    .line 422
    .line 423
    const/16 v1, 0x58

    .line 424
    .line 425
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 426
    .line 427
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 428
    .line 429
    .line 430
    move-result v0

    .line 431
    add-int/2addr p0, v0

    .line 432
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 433
    .line 434
    if-eqz v0, :cond_12

    .line 435
    .line 436
    const/16 v1, 0x59

    .line 437
    .line 438
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    add-int/2addr p0, v0

    .line 443
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 444
    .line 445
    if-eqz v0, :cond_13

    .line 446
    .line 447
    const/16 v1, 0x5a

    .line 448
    .line 449
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 450
    .line 451
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    add-int/2addr p0, v0

    .line 456
    :cond_13
    const/16 v0, 0x5b

    .line 457
    .line 458
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 459
    .line 460
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    add-int/2addr p0, v0

    .line 465
    const/16 v0, 0x5c

    .line 466
    .line 467
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 468
    .line 469
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 470
    .line 471
    .line 472
    move-result v0

    .line 473
    add-int/2addr p0, v0

    .line 474
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 475
    .line 476
    if-eqz v0, :cond_14

    .line 477
    .line 478
    const/16 v1, 0x5d

    .line 479
    .line 480
    sget-object v2, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 481
    .line 482
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 483
    .line 484
    .line 485
    move-result v0

    .line 486
    add-int/2addr p0, v0

    .line 487
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 488
    .line 489
    if-eqz v0, :cond_15

    .line 490
    .line 491
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 496
    .line 497
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 498
    .line 499
    .line 500
    move-result-object v1

    .line 501
    const/16 v2, 0x5e

    .line 502
    .line 503
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 504
    .line 505
    .line 506
    move-result v0

    .line 507
    add-int/2addr p0, v0

    .line 508
    :cond_15
    const/16 v0, 0x5f

    .line 509
    .line 510
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 511
    .line 512
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    add-int/2addr p0, v0

    .line 517
    const/16 v0, 0x60

    .line 518
    .line 519
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 520
    .line 521
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 522
    .line 523
    .line 524
    move-result v0

    .line 525
    add-int/2addr p0, v0

    .line 526
    const/16 v0, 0x61

    .line 527
    .line 528
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 529
    .line 530
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 531
    .line 532
    .line 533
    move-result v0

    .line 534
    add-int/2addr p0, v0

    .line 535
    const/16 v0, 0x62

    .line 536
    .line 537
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 538
    .line 539
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    add-int/2addr p0, v0

    .line 544
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 545
    .line 546
    if-eqz v0, :cond_16

    .line 547
    .line 548
    const/16 v1, 0x63

    .line 549
    .line 550
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 551
    .line 552
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 553
    .line 554
    .line 555
    move-result v0

    .line 556
    add-int/2addr p0, v0

    .line 557
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 558
    .line 559
    if-eqz v0, :cond_17

    .line 560
    .line 561
    const/16 v1, 0x64

    .line 562
    .line 563
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 564
    .line 565
    .line 566
    move-result v0

    .line 567
    add-int/2addr p0, v0

    .line 568
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 569
    .line 570
    if-eqz v0, :cond_18

    .line 571
    .line 572
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 573
    .line 574
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 575
    .line 576
    .line 577
    move-result-object v1

    .line 578
    const/16 v2, 0x65

    .line 579
    .line 580
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 581
    .line 582
    .line 583
    move-result v0

    .line 584
    add-int/2addr p0, v0

    .line 585
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 586
    .line 587
    if-eqz v0, :cond_19

    .line 588
    .line 589
    const/16 v1, 0x66

    .line 590
    .line 591
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 592
    .line 593
    .line 594
    move-result v0

    .line 595
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 596
    .line 597
    .line 598
    move-result v0

    .line 599
    add-int/2addr p0, v0

    .line 600
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 601
    .line 602
    if-eqz v0, :cond_1a

    .line 603
    .line 604
    const/16 v1, 0x67

    .line 605
    .line 606
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 607
    .line 608
    .line 609
    move-result v0

    .line 610
    add-int/2addr p0, v0

    .line 611
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 612
    .line 613
    if-eqz v0, :cond_1b

    .line 614
    .line 615
    const/16 v1, 0x68

    .line 616
    .line 617
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 618
    .line 619
    .line 620
    move-result v0

    .line 621
    add-int/2addr p0, v0

    .line 622
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 623
    .line 624
    if-eqz v0, :cond_1c

    .line 625
    .line 626
    const/16 v1, 0x69

    .line 627
    .line 628
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 629
    .line 630
    .line 631
    move-result v0

    .line 632
    add-int/2addr p0, v0

    .line 633
    :cond_1c
    const/16 v0, 0x6a

    .line 634
    .line 635
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 636
    .line 637
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 638
    .line 639
    .line 640
    move-result v0

    .line 641
    add-int/2addr p0, v0

    .line 642
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 643
    .line 644
    if-eqz v0, :cond_1d

    .line 645
    .line 646
    const/16 v1, 0x6b

    .line 647
    .line 648
    sget-object v2, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 649
    .line 650
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 651
    .line 652
    .line 653
    move-result v0

    .line 654
    add-int/2addr p0, v0

    .line 655
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 656
    .line 657
    if-eqz v0, :cond_1e

    .line 658
    .line 659
    const/16 v1, 0x6c

    .line 660
    .line 661
    sget-object v2, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 662
    .line 663
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 664
    .line 665
    .line 666
    move-result v0

    .line 667
    add-int/2addr p0, v0

    .line 668
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 669
    .line 670
    if-eqz v0, :cond_1f

    .line 671
    .line 672
    const/16 v1, 0x6d

    .line 673
    .line 674
    sget-object v2, Lcom/p1/mobile/putong/core/data/StickStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 675
    .line 676
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    add-int/2addr p0, v0

    .line 681
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 682
    .line 683
    if-eqz v0, :cond_20

    .line 684
    .line 685
    const/16 v1, 0x6e

    .line 686
    .line 687
    sget-object v2, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 688
    .line 689
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 690
    .line 691
    .line 692
    move-result v0

    .line 693
    add-int/2addr p0, v0

    .line 694
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 695
    .line 696
    if-eqz v0, :cond_21

    .line 697
    .line 698
    const/16 v1, 0x6f

    .line 699
    .line 700
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 701
    .line 702
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 703
    .line 704
    .line 705
    move-result v0

    .line 706
    add-int/2addr p0, v0

    .line 707
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 708
    .line 709
    if-eqz v0, :cond_22

    .line 710
    .line 711
    sget-object v1, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 712
    .line 713
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 714
    .line 715
    .line 716
    move-result-object v1

    .line 717
    const/16 v2, 0x70

    .line 718
    .line 719
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 720
    .line 721
    .line 722
    move-result v0

    .line 723
    add-int/2addr p0, v0

    .line 724
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 725
    .line 726
    if-eqz v0, :cond_23

    .line 727
    .line 728
    const/16 v1, 0x71

    .line 729
    .line 730
    sget-object v2, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 731
    .line 732
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 733
    .line 734
    .line 735
    move-result v0

    .line 736
    add-int/2addr p0, v0

    .line 737
    :cond_23
    const/16 v0, 0x72

    .line 738
    .line 739
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 740
    .line 741
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 742
    .line 743
    .line 744
    move-result v0

    .line 745
    add-int/2addr p0, v0

    .line 746
    const/16 v0, 0x73

    .line 747
    .line 748
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 749
    .line 750
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 751
    .line 752
    .line 753
    move-result v0

    .line 754
    add-int/2addr p0, v0

    .line 755
    const/16 v0, 0x74

    .line 756
    .line 757
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 758
    .line 759
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 760
    .line 761
    .line 762
    move-result v0

    .line 763
    add-int/2addr p0, v0

    .line 764
    const/16 v0, 0x75

    .line 765
    .line 766
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 767
    .line 768
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 769
    .line 770
    .line 771
    move-result v0

    .line 772
    add-int/2addr p0, v0

    .line 773
    const/16 v0, 0x76

    .line 774
    .line 775
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 776
    .line 777
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 778
    .line 779
    .line 780
    move-result v0

    .line 781
    add-int/2addr p0, v0

    .line 782
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 783
    .line 784
    if-eqz v0, :cond_24

    .line 785
    .line 786
    const/16 v1, 0x77

    .line 787
    .line 788
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    add-int/2addr p0, v0

    .line 793
    :cond_24
    const/16 v0, 0x78

    .line 794
    .line 795
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 796
    .line 797
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 798
    .line 799
    .line 800
    move-result v0

    .line 801
    add-int/2addr p0, v0

    .line 802
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 803
    .line 804
    if-eqz v0, :cond_25

    .line 805
    .line 806
    const/16 v1, 0x79

    .line 807
    .line 808
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 809
    .line 810
    .line 811
    move-result v0

    .line 812
    add-int/2addr p0, v0

    .line 813
    :cond_25
    const/16 v0, 0x7a

    .line 814
    .line 815
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 816
    .line 817
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 818
    .line 819
    .line 820
    move-result v0

    .line 821
    add-int/2addr p0, v0

    .line 822
    const/16 v0, 0x7b

    .line 823
    .line 824
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 825
    .line 826
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 827
    .line 828
    .line 829
    move-result v0

    .line 830
    add-int/2addr p0, v0

    .line 831
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 832
    .line 833
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 834
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Conversation$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Conversation;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

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
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 15
    .line 16
    .line 17
    move-result v8

    .line 18
    const-string v9, ""

    .line 19
    .line 20
    sparse-switch v8, :sswitch_data_0

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 44
    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 62
    .line 63
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 64
    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 82
    .line 83
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 84
    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    if-eqz v4, :cond_3

    .line 88
    .line 89
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 90
    .line 91
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 102
    .line 103
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 104
    .line 105
    if-nez p1, :cond_4

    .line 106
    .line 107
    if-eqz v5, :cond_4

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 122
    .line 123
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 124
    .line 125
    if-nez p1, :cond_5

    .line 126
    .line 127
    if-eqz v6, :cond_5

    .line 128
    .line 129
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 134
    .line 135
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 136
    .line 137
    if-nez p1, :cond_6

    .line 138
    .line 139
    if-eqz v7, :cond_6

    .line 140
    .line 141
    sget-object p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 142
    .line 143
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 154
    .line 155
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 156
    .line 157
    if-nez p1, :cond_7

    .line 158
    .line 159
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 160
    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 162
    .line 163
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_8

    .line 166
    .line 167
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 168
    .line 169
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 170
    .line 171
    if-nez p1, :cond_9

    .line 172
    .line 173
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 174
    .line 175
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 180
    .line 181
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 182
    .line 183
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 184
    .line 185
    if-nez p1, :cond_a

    .line 186
    .line 187
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 188
    .line 189
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 194
    .line 195
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 196
    .line 197
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 198
    .line 199
    if-nez p1, :cond_b

    .line 200
    .line 201
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 208
    .line 209
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 210
    .line 211
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 212
    .line 213
    if-nez p1, :cond_c

    .line 214
    .line 215
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 216
    .line 217
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 222
    .line 223
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 224
    .line 225
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 226
    .line 227
    if-nez p1, :cond_d

    .line 228
    .line 229
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 234
    .line 235
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 236
    .line 237
    if-nez p1, :cond_e

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 244
    .line 245
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 246
    .line 247
    if-nez p1, :cond_f

    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 254
    .line 255
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 256
    .line 257
    if-nez p1, :cond_10

    .line 258
    .line 259
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 260
    .line 261
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 262
    .line 263
    if-nez p1, :cond_11

    .line 264
    .line 265
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 270
    .line 271
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 272
    .line 273
    if-nez p1, :cond_12

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->new_()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 280
    .line 281
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 282
    .line 283
    if-nez p1, :cond_13

    .line 284
    .line 285
    new-instance p1, Ljava/util/ArrayList;

    .line 286
    .line 287
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .line 289
    .line 290
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 291
    .line 292
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 293
    .line 294
    if-nez p1, :cond_14

    .line 295
    .line 296
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 301
    .line 302
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 303
    .line 304
    if-nez p1, :cond_15

    .line 305
    .line 306
    sget-object p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 307
    .line 308
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    check-cast p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 313
    .line 314
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 315
    .line 316
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 317
    .line 318
    if-nez p1, :cond_16

    .line 319
    .line 320
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 321
    .line 322
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 323
    .line 324
    if-nez p1, :cond_17

    .line 325
    .line 326
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 327
    .line 328
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 329
    .line 330
    if-nez p1, :cond_30

    .line 331
    .line 332
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 333
    .line 334
    return-object p0

    .line 335
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 336
    .line 337
    .line 338
    move-result v8

    .line 339
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 340
    .line 341
    goto/16 :goto_0

    .line 342
    .line 343
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 344
    .line 345
    .line 346
    move-result v8

    .line 347
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v8

    .line 355
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 356
    .line 357
    goto/16 :goto_0

    .line 358
    .line 359
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 360
    .line 361
    .line 362
    move-result-wide v8

    .line 363
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 364
    .line 365
    goto/16 :goto_0

    .line 366
    .line 367
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v8

    .line 371
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 372
    .line 373
    goto/16 :goto_0

    .line 374
    .line 375
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 376
    .line 377
    .line 378
    move-result-wide v8

    .line 379
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 380
    .line 381
    goto/16 :goto_0

    .line 382
    .line 383
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 384
    .line 385
    .line 386
    move-result-wide v8

    .line 387
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 392
    .line 393
    .line 394
    move-result v8

    .line 395
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 396
    .line 397
    goto/16 :goto_0

    .line 398
    .line 399
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 400
    .line 401
    .line 402
    move-result v8

    .line 403
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 408
    .line 409
    .line 410
    move-result v8

    .line 411
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 412
    .line 413
    goto/16 :goto_0

    .line 414
    .line 415
    :sswitch_a
    sget-object v8, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 416
    .line 417
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    move-result-object v8

    .line 421
    check-cast v8, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 422
    .line 423
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 424
    .line 425
    goto/16 :goto_0

    .line 426
    .line 427
    :sswitch_b
    sget-object v8, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 428
    .line 429
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 430
    .line 431
    .line 432
    move-result-object v8

    .line 433
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v8

    .line 437
    check-cast v8, Ljava/util/List;

    .line 438
    .line 439
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 440
    .line 441
    goto/16 :goto_0

    .line 442
    .line 443
    :sswitch_c
    sget-object v8, Lcom/p1/mobile/putong/core/data/ConversationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 444
    .line 445
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v8

    .line 449
    check-cast v8, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 450
    .line 451
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 452
    .line 453
    goto/16 :goto_0

    .line 454
    .line 455
    :sswitch_d
    sget-object v8, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 456
    .line 457
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object v8

    .line 461
    check-cast v8, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 462
    .line 463
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 464
    .line 465
    goto/16 :goto_0

    .line 466
    .line 467
    :sswitch_e
    sget-object v8, Lcom/p1/mobile/putong/core/data/StickStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 468
    .line 469
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object v8

    .line 473
    check-cast v8, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 474
    .line 475
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 476
    .line 477
    goto/16 :goto_0

    .line 478
    .line 479
    :sswitch_f
    sget-object v8, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 480
    .line 481
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v8

    .line 485
    check-cast v8, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 486
    .line 487
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 488
    .line 489
    goto/16 :goto_0

    .line 490
    .line 491
    :sswitch_10
    sget-object v8, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 492
    .line 493
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object v8

    .line 497
    check-cast v8, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 498
    .line 499
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 500
    .line 501
    goto/16 :goto_0

    .line 502
    .line 503
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 504
    .line 505
    .line 506
    move-result v8

    .line 507
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 508
    .line 509
    goto/16 :goto_0

    .line 510
    .line 511
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v8

    .line 515
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 516
    .line 517
    goto/16 :goto_0

    .line 518
    .line 519
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v8

    .line 523
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 524
    .line 525
    goto/16 :goto_0

    .line 526
    .line 527
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v8

    .line 531
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 532
    .line 533
    goto/16 :goto_0

    .line 534
    .line 535
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 536
    .line 537
    .line 538
    move-result v7

    .line 539
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 540
    .line 541
    .line 542
    move-result-object v7

    .line 543
    goto/16 :goto_0

    .line 544
    .line 545
    :sswitch_16
    sget-object v8, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 546
    .line 547
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 548
    .line 549
    .line 550
    move-result-object v8

    .line 551
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object v8

    .line 555
    check-cast v8, Ljava/util/List;

    .line 556
    .line 557
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 558
    .line 559
    goto/16 :goto_0

    .line 560
    .line 561
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object v8

    .line 565
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 566
    .line 567
    goto/16 :goto_0

    .line 568
    .line 569
    :sswitch_18
    sget-object v8, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 570
    .line 571
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 572
    .line 573
    .line 574
    move-result-object v8

    .line 575
    check-cast v8, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 576
    .line 577
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 578
    .line 579
    goto/16 :goto_0

    .line 580
    .line 581
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 582
    .line 583
    .line 584
    move-result v8

    .line 585
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 590
    .line 591
    .line 592
    move-result v8

    .line 593
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 594
    .line 595
    goto/16 :goto_0

    .line 596
    .line 597
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 598
    .line 599
    .line 600
    move-result-wide v8

    .line 601
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 602
    .line 603
    goto/16 :goto_0

    .line 604
    .line 605
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 606
    .line 607
    .line 608
    move-result v8

    .line 609
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 610
    .line 611
    goto/16 :goto_0

    .line 612
    .line 613
    :sswitch_1d
    sget-object v6, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 614
    .line 615
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 616
    .line 617
    .line 618
    move-result-object v6

    .line 619
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    move-result-object v6

    .line 623
    check-cast v6, Ljava/util/List;

    .line 624
    .line 625
    goto/16 :goto_0

    .line 626
    .line 627
    :sswitch_1e
    sget-object v8, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 628
    .line 629
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v8

    .line 633
    check-cast v8, Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 634
    .line 635
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 636
    .line 637
    goto/16 :goto_0

    .line 638
    .line 639
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 640
    .line 641
    .line 642
    move-result-wide v8

    .line 643
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 644
    .line 645
    goto/16 :goto_0

    .line 646
    .line 647
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 648
    .line 649
    .line 650
    move-result v8

    .line 651
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 652
    .line 653
    goto/16 :goto_0

    .line 654
    .line 655
    :sswitch_21
    sget-object v8, Lcom/p1/mobile/putong/core/data/ConversationProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 656
    .line 657
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object v8

    .line 661
    check-cast v8, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 662
    .line 663
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 664
    .line 665
    goto/16 :goto_0

    .line 666
    .line 667
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 668
    .line 669
    .line 670
    move-result-object v8

    .line 671
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 672
    .line 673
    goto/16 :goto_0

    .line 674
    .line 675
    :sswitch_23
    sget-object v8, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 676
    .line 677
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 678
    .line 679
    .line 680
    move-result-object v8

    .line 681
    check-cast v8, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 682
    .line 683
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 684
    .line 685
    goto/16 :goto_0

    .line 686
    .line 687
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 688
    .line 689
    .line 690
    move-result v8

    .line 691
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 692
    .line 693
    goto/16 :goto_0

    .line 694
    .line 695
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 696
    .line 697
    .line 698
    move-result-wide v8

    .line 699
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 700
    .line 701
    goto/16 :goto_0

    .line 702
    .line 703
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 704
    .line 705
    .line 706
    move-result v8

    .line 707
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 708
    .line 709
    goto/16 :goto_0

    .line 710
    .line 711
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 712
    .line 713
    .line 714
    move-result v8

    .line 715
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 716
    .line 717
    goto/16 :goto_0

    .line 718
    .line 719
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 720
    .line 721
    .line 722
    move-result-wide v8

    .line 723
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 724
    .line 725
    goto/16 :goto_0

    .line 726
    .line 727
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 728
    .line 729
    .line 730
    move-result-wide v8

    .line 731
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 732
    .line 733
    goto/16 :goto_0

    .line 734
    .line 735
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 736
    .line 737
    .line 738
    move-result-wide v8

    .line 739
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 740
    .line 741
    goto/16 :goto_0

    .line 742
    .line 743
    :sswitch_2b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 744
    .line 745
    .line 746
    move-result v8

    .line 747
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 748
    .line 749
    goto/16 :goto_0

    .line 750
    .line 751
    :sswitch_2c
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 752
    .line 753
    .line 754
    move-result-wide v8

    .line 755
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 756
    .line 757
    goto/16 :goto_0

    .line 758
    .line 759
    :sswitch_2d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 760
    .line 761
    .line 762
    move-result v8

    .line 763
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 764
    .line 765
    goto/16 :goto_0

    .line 766
    .line 767
    :sswitch_2e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 768
    .line 769
    .line 770
    move-result-object v8

    .line 771
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 772
    .line 773
    goto/16 :goto_0

    .line 774
    .line 775
    :sswitch_2f
    sget-object v8, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 776
    .line 777
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 778
    .line 779
    .line 780
    move-result-object v8

    .line 781
    check-cast v8, Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 782
    .line 783
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 784
    .line 785
    goto/16 :goto_0

    .line 786
    .line 787
    :sswitch_30
    sget-object v8, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 788
    .line 789
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 790
    .line 791
    .line 792
    move-result-object v8

    .line 793
    check-cast v8, Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 794
    .line 795
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 796
    .line 797
    goto/16 :goto_0

    .line 798
    .line 799
    :sswitch_31
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 800
    .line 801
    .line 802
    move-result v5

    .line 803
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 804
    .line 805
    .line 806
    move-result-object v5

    .line 807
    goto/16 :goto_0

    .line 808
    .line 809
    :sswitch_32
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 810
    .line 811
    .line 812
    move-result-object v8

    .line 813
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 814
    .line 815
    goto/16 :goto_0

    .line 816
    .line 817
    :sswitch_33
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 818
    .line 819
    .line 820
    move-result v4

    .line 821
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 822
    .line 823
    .line 824
    move-result-object v4

    .line 825
    goto/16 :goto_0

    .line 826
    .line 827
    :sswitch_34
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 828
    .line 829
    .line 830
    move-result-object v8

    .line 831
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 832
    .line 833
    goto/16 :goto_0

    .line 834
    .line 835
    :sswitch_35
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 836
    .line 837
    .line 838
    move-result-wide v8

    .line 839
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 840
    .line 841
    goto/16 :goto_0

    .line 842
    .line 843
    :sswitch_36
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 844
    .line 845
    .line 846
    move-result-wide v8

    .line 847
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 848
    .line 849
    goto/16 :goto_0

    .line 850
    .line 851
    :sswitch_37
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 852
    .line 853
    .line 854
    move-result v8

    .line 855
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 856
    .line 857
    goto/16 :goto_0

    .line 858
    .line 859
    :sswitch_38
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 860
    .line 861
    .line 862
    move-result-object v8

    .line 863
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 864
    .line 865
    goto/16 :goto_0

    .line 866
    .line 867
    :sswitch_39
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 868
    .line 869
    .line 870
    move-result v3

    .line 871
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 872
    .line 873
    .line 874
    move-result-object v3

    .line 875
    goto/16 :goto_0

    .line 876
    .line 877
    :sswitch_3a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 878
    .line 879
    .line 880
    move-result-wide v8

    .line 881
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 882
    .line 883
    goto/16 :goto_0

    .line 884
    .line 885
    :sswitch_3b
    sget-object v8, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 886
    .line 887
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 888
    .line 889
    .line 890
    move-result-object v8

    .line 891
    check-cast v8, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 892
    .line 893
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 894
    .line 895
    goto/16 :goto_0

    .line 896
    .line 897
    :sswitch_3c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 898
    .line 899
    .line 900
    move-result v8

    .line 901
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 902
    .line 903
    goto/16 :goto_0

    .line 904
    .line 905
    :sswitch_3d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 906
    .line 907
    .line 908
    move-result v8

    .line 909
    iput v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 910
    .line 911
    goto/16 :goto_0

    .line 912
    .line 913
    :sswitch_3e
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 914
    .line 915
    .line 916
    move-result-wide v8

    .line 917
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 918
    .line 919
    goto/16 :goto_0

    .line 920
    .line 921
    :sswitch_3f
    sget-object v8, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 922
    .line 923
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 924
    .line 925
    .line 926
    move-result-object v8

    .line 927
    invoke-virtual {p1, v8}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object v8

    .line 931
    check-cast v8, Ljava/util/List;

    .line 932
    .line 933
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 934
    .line 935
    goto/16 :goto_0

    .line 936
    .line 937
    :sswitch_40
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 938
    .line 939
    .line 940
    move-result-wide v8

    .line 941
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 942
    .line 943
    goto/16 :goto_0

    .line 944
    .line 945
    :sswitch_41
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 946
    .line 947
    .line 948
    move-result v2

    .line 949
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 950
    .line 951
    .line 952
    move-result-object v2

    .line 953
    goto/16 :goto_0

    .line 954
    .line 955
    :sswitch_42
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 956
    .line 957
    .line 958
    move-result v1

    .line 959
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 960
    .line 961
    .line 962
    move-result-object v1

    .line 963
    goto/16 :goto_0

    .line 964
    .line 965
    :sswitch_43
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 966
    .line 967
    .line 968
    move-result-wide v8

    .line 969
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 970
    .line 971
    goto/16 :goto_0

    .line 972
    .line 973
    :sswitch_44
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 974
    .line 975
    .line 976
    move-result-wide v8

    .line 977
    iput-wide v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 978
    .line 979
    goto/16 :goto_0

    .line 980
    .line 981
    :sswitch_45
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 982
    .line 983
    .line 984
    move-result-object v8

    .line 985
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 986
    .line 987
    goto/16 :goto_0

    .line 988
    .line 989
    :sswitch_46
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 990
    .line 991
    .line 992
    move-result-object v8

    .line 993
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 994
    .line 995
    goto/16 :goto_0

    .line 996
    .line 997
    :sswitch_47
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 998
    .line 999
    .line 1000
    move-result v8

    .line 1001
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1002
    .line 1003
    .line 1004
    move-result-object v8

    .line 1005
    iput-object v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 1006
    .line 1007
    goto/16 :goto_0

    .line 1008
    .line 1009
    :sswitch_48
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 1010
    .line 1011
    .line 1012
    move-result v8

    .line 1013
    iput-boolean v8, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 1014
    .line 1015
    goto/16 :goto_0

    .line 1016
    .line 1017
    :sswitch_49
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v8

    .line 1021
    iput-object v8, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1022
    .line 1023
    goto/16 :goto_0

    .line 1024
    .line 1025
    :sswitch_4a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 1026
    .line 1027
    .line 1028
    move-result-wide v8

    .line 1029
    iput-wide v8, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 1030
    .line 1031
    goto/16 :goto_0

    .line 1032
    .line 1033
    :sswitch_4b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 1034
    .line 1035
    if-nez p1, :cond_18

    .line 1036
    .line 1037
    if-eqz v1, :cond_18

    .line 1038
    .line 1039
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1040
    .line 1041
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 1042
    .line 1043
    .line 1044
    move-result v1

    .line 1045
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1046
    .line 1047
    .line 1048
    move-result-object p1

    .line 1049
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 1050
    .line 1051
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 1052
    .line 1053
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1054
    .line 1055
    if-nez p1, :cond_19

    .line 1056
    .line 1057
    if-eqz v2, :cond_19

    .line 1058
    .line 1059
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1060
    .line 1061
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1062
    .line 1063
    .line 1064
    move-result v1

    .line 1065
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1066
    .line 1067
    .line 1068
    move-result-object p1

    .line 1069
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1070
    .line 1071
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1072
    .line 1073
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1074
    .line 1075
    if-nez p1, :cond_1a

    .line 1076
    .line 1077
    if-eqz v3, :cond_1a

    .line 1078
    .line 1079
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1080
    .line 1081
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1082
    .line 1083
    .line 1084
    move-result v1

    .line 1085
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1086
    .line 1087
    .line 1088
    move-result-object p1

    .line 1089
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1090
    .line 1091
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1092
    .line 1093
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1094
    .line 1095
    if-nez p1, :cond_1b

    .line 1096
    .line 1097
    if-eqz v4, :cond_1b

    .line 1098
    .line 1099
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1100
    .line 1101
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 1102
    .line 1103
    .line 1104
    move-result v1

    .line 1105
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1106
    .line 1107
    .line 1108
    move-result-object p1

    .line 1109
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1110
    .line 1111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1112
    .line 1113
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1114
    .line 1115
    if-nez p1, :cond_1c

    .line 1116
    .line 1117
    if-eqz v5, :cond_1c

    .line 1118
    .line 1119
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1120
    .line 1121
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 1122
    .line 1123
    .line 1124
    move-result v1

    .line 1125
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1126
    .line 1127
    .line 1128
    move-result-object p1

    .line 1129
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1130
    .line 1131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1132
    .line 1133
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1134
    .line 1135
    if-nez p1, :cond_1d

    .line 1136
    .line 1137
    if-eqz v6, :cond_1d

    .line 1138
    .line 1139
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 1140
    .line 1141
    .line 1142
    move-result-object p1

    .line 1143
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1144
    .line 1145
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1146
    .line 1147
    if-nez p1, :cond_1e

    .line 1148
    .line 1149
    if-eqz v7, :cond_1e

    .line 1150
    .line 1151
    sget-object p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1152
    .line 1153
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 1154
    .line 1155
    .line 1156
    move-result v1

    .line 1157
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1158
    .line 1159
    .line 1160
    move-result-object p1

    .line 1161
    check-cast p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1162
    .line 1163
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1164
    .line 1165
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 1166
    .line 1167
    if-nez p1, :cond_1f

    .line 1168
    .line 1169
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1170
    .line 1171
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 1172
    .line 1173
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 1174
    .line 1175
    if-nez p1, :cond_20

    .line 1176
    .line 1177
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 1178
    .line 1179
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1180
    .line 1181
    if-nez p1, :cond_21

    .line 1182
    .line 1183
    sget-object p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1184
    .line 1185
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1186
    .line 1187
    .line 1188
    move-result-object p1

    .line 1189
    check-cast p1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1190
    .line 1191
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1192
    .line 1193
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1194
    .line 1195
    if-nez p1, :cond_22

    .line 1196
    .line 1197
    sget-object p1, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1198
    .line 1199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1200
    .line 1201
    .line 1202
    move-result-object p1

    .line 1203
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1204
    .line 1205
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 1206
    .line 1207
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1208
    .line 1209
    if-nez p1, :cond_23

    .line 1210
    .line 1211
    sget-object p1, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1212
    .line 1213
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1214
    .line 1215
    .line 1216
    move-result-object p1

    .line 1217
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1218
    .line 1219
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 1220
    .line 1221
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1222
    .line 1223
    if-nez p1, :cond_24

    .line 1224
    .line 1225
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1226
    .line 1227
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1228
    .line 1229
    .line 1230
    move-result-object p1

    .line 1231
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1232
    .line 1233
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 1234
    .line 1235
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1236
    .line 1237
    if-nez p1, :cond_25

    .line 1238
    .line 1239
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1240
    .line 1241
    .line 1242
    move-result-object p1

    .line 1243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1244
    .line 1245
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1246
    .line 1247
    if-nez p1, :cond_26

    .line 1248
    .line 1249
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1250
    .line 1251
    .line 1252
    move-result-object p1

    .line 1253
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 1254
    .line 1255
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1256
    .line 1257
    if-nez p1, :cond_27

    .line 1258
    .line 1259
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1260
    .line 1261
    .line 1262
    move-result-object p1

    .line 1263
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1264
    .line 1265
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 1266
    .line 1267
    if-nez p1, :cond_28

    .line 1268
    .line 1269
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 1270
    .line 1271
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 1272
    .line 1273
    if-nez p1, :cond_29

    .line 1274
    .line 1275
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 1276
    .line 1277
    .line 1278
    move-result-object p1

    .line 1279
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 1280
    .line 1281
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 1282
    .line 1283
    if-nez p1, :cond_2a

    .line 1284
    .line 1285
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->new_()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 1286
    .line 1287
    .line 1288
    move-result-object p1

    .line 1289
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 1290
    .line 1291
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1292
    .line 1293
    if-nez p1, :cond_2b

    .line 1294
    .line 1295
    new-instance p1, Ljava/util/ArrayList;

    .line 1296
    .line 1297
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1298
    .line 1299
    .line 1300
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1301
    .line 1302
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1303
    .line 1304
    if-nez p1, :cond_2c

    .line 1305
    .line 1306
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1307
    .line 1308
    .line 1309
    move-result-object p1

    .line 1310
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1311
    .line 1312
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1313
    .line 1314
    if-nez p1, :cond_2d

    .line 1315
    .line 1316
    sget-object p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1317
    .line 1318
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1319
    .line 1320
    .line 1321
    move-result-object p1

    .line 1322
    check-cast p1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1323
    .line 1324
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 1325
    .line 1326
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 1327
    .line 1328
    if-nez p1, :cond_2e

    .line 1329
    .line 1330
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 1331
    .line 1332
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 1333
    .line 1334
    if-nez p1, :cond_2f

    .line 1335
    .line 1336
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 1337
    .line 1338
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 1339
    .line 1340
    if-nez p1, :cond_30

    .line 1341
    .line 1342
    iput-object v9, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 1343
    .line 1344
    :cond_30
    return-object p0

    .line 1345
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_4b
        0x8 -> :sswitch_4a
        0x12 -> :sswitch_49
        0x198 -> :sswitch_48
        0x1a0 -> :sswitch_47
        0x1aa -> :sswitch_46
        0x1b2 -> :sswitch_45
        0x1b9 -> :sswitch_44
        0x1c1 -> :sswitch_43
        0x1c8 -> :sswitch_42
        0x1d0 -> :sswitch_41
        0x1d9 -> :sswitch_40
        0x1e2 -> :sswitch_3f
        0x1e9 -> :sswitch_3e
        0x1f0 -> :sswitch_3d
        0x1f8 -> :sswitch_3c
        0x202 -> :sswitch_3b
        0x209 -> :sswitch_3a
        0x210 -> :sswitch_39
        0x21a -> :sswitch_38
        0x220 -> :sswitch_37
        0x229 -> :sswitch_36
        0x231 -> :sswitch_35
        0x23a -> :sswitch_34
        0x240 -> :sswitch_33
        0x24a -> :sswitch_32
        0x250 -> :sswitch_31
        0x25a -> :sswitch_30
        0x262 -> :sswitch_2f
        0x26a -> :sswitch_2e
        0x270 -> :sswitch_2d
        0x279 -> :sswitch_2c
        0x280 -> :sswitch_2b
        0x288 -> :sswitch_2a
        0x291 -> :sswitch_29
        0x299 -> :sswitch_28
        0x2a0 -> :sswitch_27
        0x2a8 -> :sswitch_26
        0x2b1 -> :sswitch_25
        0x2b8 -> :sswitch_24
        0x2c2 -> :sswitch_23
        0x2ca -> :sswitch_22
        0x2d2 -> :sswitch_21
        0x2d8 -> :sswitch_20
        0x2e1 -> :sswitch_1f
        0x2ea -> :sswitch_1e
        0x2f2 -> :sswitch_1d
        0x2f8 -> :sswitch_1c
        0x301 -> :sswitch_1b
        0x308 -> :sswitch_1a
        0x310 -> :sswitch_19
        0x31a -> :sswitch_18
        0x322 -> :sswitch_17
        0x32a -> :sswitch_16
        0x330 -> :sswitch_15
        0x33a -> :sswitch_14
        0x342 -> :sswitch_13
        0x34a -> :sswitch_12
        0x350 -> :sswitch_11
        0x35a -> :sswitch_10
        0x362 -> :sswitch_f
        0x36a -> :sswitch_e
        0x372 -> :sswitch_d
        0x37a -> :sswitch_c
        0x382 -> :sswitch_b
        0x38a -> :sswitch_a
        0x390 -> :sswitch_9
        0x398 -> :sswitch_8
        0x3a0 -> :sswitch_7
        0x3a9 -> :sswitch_6
        0x3b1 -> :sswitch_5
        0x3ba -> :sswitch_4
        0x3c1 -> :sswitch_3
        0x3ca -> :sswitch_2
        0x3d0 -> :sswitch_1
        0x3d8 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1345
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Conversation$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x34

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/16 v0, 0x35

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    const/16 v0, 0x36

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    const/16 p0, 0x37

    .line 54
    .line 55
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 56
    .line 57
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0x38

    .line 61
    .line 62
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 63
    .line 64
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 68
    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    const/16 v0, 0x39

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 78
    .line 79
    .line 80
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 81
    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    const/16 v0, 0x3a

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 91
    .line 92
    .line 93
    :cond_5
    const/16 p0, 0x3b

    .line 94
    .line 95
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 96
    .line 97
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 101
    .line 102
    if-eqz p0, :cond_6

    .line 103
    .line 104
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const/16 v1, 0x3c

    .line 111
    .line 112
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_6
    const/16 p0, 0x3d

    .line 116
    .line 117
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 118
    .line 119
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 120
    .line 121
    .line 122
    const/16 p0, 0x3e

    .line 123
    .line 124
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 125
    .line 126
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 127
    .line 128
    .line 129
    const/16 p0, 0x3f

    .line 130
    .line 131
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 132
    .line 133
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 137
    .line 138
    if-eqz p0, :cond_7

    .line 139
    .line 140
    const/16 v0, 0x40

    .line 141
    .line 142
    sget-object v1, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 145
    .line 146
    .line 147
    :cond_7
    const/16 p0, 0x41

    .line 148
    .line 149
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 150
    .line 151
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 155
    .line 156
    if-eqz p0, :cond_8

    .line 157
    .line 158
    const/16 v0, 0x42

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 165
    .line 166
    .line 167
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz p0, :cond_9

    .line 170
    .line 171
    const/16 v0, 0x43

    .line 172
    .line 173
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_9
    const/16 p0, 0x44

    .line 177
    .line 178
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 179
    .line 180
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 181
    .line 182
    .line 183
    const/16 p0, 0x45

    .line 184
    .line 185
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 186
    .line 187
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 188
    .line 189
    .line 190
    const/16 p0, 0x46

    .line 191
    .line 192
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 193
    .line 194
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 198
    .line 199
    if-eqz p0, :cond_a

    .line 200
    .line 201
    const/16 v0, 0x47

    .line 202
    .line 203
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 207
    .line 208
    if-eqz p0, :cond_b

    .line 209
    .line 210
    const/16 v0, 0x48

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 217
    .line 218
    .line 219
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 220
    .line 221
    if-eqz p0, :cond_c

    .line 222
    .line 223
    const/16 v0, 0x49

    .line 224
    .line 225
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 226
    .line 227
    .line 228
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 229
    .line 230
    if-eqz p0, :cond_d

    .line 231
    .line 232
    const/16 v0, 0x4a

    .line 233
    .line 234
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 239
    .line 240
    .line 241
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 242
    .line 243
    if-eqz p0, :cond_e

    .line 244
    .line 245
    const/16 v0, 0x4b

    .line 246
    .line 247
    sget-object v1, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 250
    .line 251
    .line 252
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 253
    .line 254
    if-eqz p0, :cond_f

    .line 255
    .line 256
    const/16 v0, 0x4c

    .line 257
    .line 258
    sget-object v1, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 259
    .line 260
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 261
    .line 262
    .line 263
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 264
    .line 265
    if-eqz p0, :cond_10

    .line 266
    .line 267
    const/16 v0, 0x4d

    .line 268
    .line 269
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 270
    .line 271
    .line 272
    :cond_10
    const/16 p0, 0x4e

    .line 273
    .line 274
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 275
    .line 276
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 277
    .line 278
    .line 279
    const/16 p0, 0x4f

    .line 280
    .line 281
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 282
    .line 283
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 284
    .line 285
    .line 286
    const/16 p0, 0x50

    .line 287
    .line 288
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 289
    .line 290
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 291
    .line 292
    .line 293
    const/16 p0, 0x51

    .line 294
    .line 295
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 296
    .line 297
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 298
    .line 299
    .line 300
    const/16 p0, 0x52

    .line 301
    .line 302
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 303
    .line 304
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 305
    .line 306
    .line 307
    const/16 p0, 0x53

    .line 308
    .line 309
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 310
    .line 311
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 312
    .line 313
    .line 314
    const/16 p0, 0x54

    .line 315
    .line 316
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 317
    .line 318
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 319
    .line 320
    .line 321
    const/16 p0, 0x55

    .line 322
    .line 323
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 324
    .line 325
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 326
    .line 327
    .line 328
    const/16 p0, 0x56

    .line 329
    .line 330
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 331
    .line 332
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 333
    .line 334
    .line 335
    const/16 p0, 0x57

    .line 336
    .line 337
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 338
    .line 339
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 340
    .line 341
    .line 342
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 343
    .line 344
    if-eqz p0, :cond_11

    .line 345
    .line 346
    const/16 v0, 0x58

    .line 347
    .line 348
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 349
    .line 350
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 351
    .line 352
    .line 353
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 354
    .line 355
    if-eqz p0, :cond_12

    .line 356
    .line 357
    const/16 v0, 0x59

    .line 358
    .line 359
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 360
    .line 361
    .line 362
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 363
    .line 364
    if-eqz p0, :cond_13

    .line 365
    .line 366
    const/16 v0, 0x5a

    .line 367
    .line 368
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    .line 370
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 371
    .line 372
    .line 373
    :cond_13
    const/16 p0, 0x5b

    .line 374
    .line 375
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 376
    .line 377
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 378
    .line 379
    .line 380
    const/16 p0, 0x5c

    .line 381
    .line 382
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 383
    .line 384
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 385
    .line 386
    .line 387
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 388
    .line 389
    if-eqz p0, :cond_14

    .line 390
    .line 391
    const/16 v0, 0x5d

    .line 392
    .line 393
    sget-object v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 394
    .line 395
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 396
    .line 397
    .line 398
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 399
    .line 400
    if-eqz p0, :cond_15

    .line 401
    .line 402
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 407
    .line 408
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    const/16 v1, 0x5e

    .line 413
    .line 414
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 415
    .line 416
    .line 417
    :cond_15
    const/16 p0, 0x5f

    .line 418
    .line 419
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 420
    .line 421
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 422
    .line 423
    .line 424
    const/16 p0, 0x60

    .line 425
    .line 426
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 427
    .line 428
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 429
    .line 430
    .line 431
    const/16 p0, 0x61

    .line 432
    .line 433
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 434
    .line 435
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 436
    .line 437
    .line 438
    const/16 p0, 0x62

    .line 439
    .line 440
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 441
    .line 442
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 443
    .line 444
    .line 445
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 446
    .line 447
    if-eqz p0, :cond_16

    .line 448
    .line 449
    const/16 v0, 0x63

    .line 450
    .line 451
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 452
    .line 453
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 454
    .line 455
    .line 456
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 457
    .line 458
    if-eqz p0, :cond_17

    .line 459
    .line 460
    const/16 v0, 0x64

    .line 461
    .line 462
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 463
    .line 464
    .line 465
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 466
    .line 467
    if-eqz p0, :cond_18

    .line 468
    .line 469
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 470
    .line 471
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    const/16 v1, 0x65

    .line 476
    .line 477
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 478
    .line 479
    .line 480
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 481
    .line 482
    if-eqz p0, :cond_19

    .line 483
    .line 484
    const/16 v0, 0x66

    .line 485
    .line 486
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 487
    .line 488
    .line 489
    move-result p0

    .line 490
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 491
    .line 492
    .line 493
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 494
    .line 495
    if-eqz p0, :cond_1a

    .line 496
    .line 497
    const/16 v0, 0x67

    .line 498
    .line 499
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 500
    .line 501
    .line 502
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 503
    .line 504
    if-eqz p0, :cond_1b

    .line 505
    .line 506
    const/16 v0, 0x68

    .line 507
    .line 508
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 509
    .line 510
    .line 511
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 512
    .line 513
    if-eqz p0, :cond_1c

    .line 514
    .line 515
    const/16 v0, 0x69

    .line 516
    .line 517
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 518
    .line 519
    .line 520
    :cond_1c
    const/16 p0, 0x6a

    .line 521
    .line 522
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 523
    .line 524
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 525
    .line 526
    .line 527
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 528
    .line 529
    if-eqz p0, :cond_1d

    .line 530
    .line 531
    const/16 v0, 0x6b

    .line 532
    .line 533
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 534
    .line 535
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 536
    .line 537
    .line 538
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 539
    .line 540
    if-eqz p0, :cond_1e

    .line 541
    .line 542
    const/16 v0, 0x6c

    .line 543
    .line 544
    sget-object v1, Lcom/p1/mobile/putong/core/data/NotificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 545
    .line 546
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 547
    .line 548
    .line 549
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 550
    .line 551
    if-eqz p0, :cond_1f

    .line 552
    .line 553
    const/16 v0, 0x6d

    .line 554
    .line 555
    sget-object v1, Lcom/p1/mobile/putong/core/data/StickStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 556
    .line 557
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 558
    .line 559
    .line 560
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 561
    .line 562
    if-eqz p0, :cond_20

    .line 563
    .line 564
    const/16 v0, 0x6e

    .line 565
    .line 566
    sget-object v1, Lcom/p1/mobile/putong/data/ConversationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 567
    .line 568
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 569
    .line 570
    .line 571
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 572
    .line 573
    if-eqz p0, :cond_21

    .line 574
    .line 575
    const/16 v0, 0x6f

    .line 576
    .line 577
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 578
    .line 579
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 580
    .line 581
    .line 582
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 583
    .line 584
    if-eqz p0, :cond_22

    .line 585
    .line 586
    sget-object v0, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 587
    .line 588
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 589
    .line 590
    .line 591
    move-result-object v0

    .line 592
    const/16 v1, 0x70

    .line 593
    .line 594
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 595
    .line 596
    .line 597
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 598
    .line 599
    if-eqz p0, :cond_23

    .line 600
    .line 601
    const/16 v0, 0x71

    .line 602
    .line 603
    sget-object v1, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 604
    .line 605
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 606
    .line 607
    .line 608
    :cond_23
    const/16 p0, 0x72

    .line 609
    .line 610
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 611
    .line 612
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 613
    .line 614
    .line 615
    const/16 p0, 0x73

    .line 616
    .line 617
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 618
    .line 619
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 620
    .line 621
    .line 622
    const/16 p0, 0x74

    .line 623
    .line 624
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 625
    .line 626
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 627
    .line 628
    .line 629
    const/16 p0, 0x75

    .line 630
    .line 631
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 632
    .line 633
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 634
    .line 635
    .line 636
    const/16 p0, 0x76

    .line 637
    .line 638
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 639
    .line 640
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 641
    .line 642
    .line 643
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 644
    .line 645
    if-eqz p0, :cond_24

    .line 646
    .line 647
    const/16 v0, 0x77

    .line 648
    .line 649
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 650
    .line 651
    .line 652
    :cond_24
    const/16 p0, 0x78

    .line 653
    .line 654
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 655
    .line 656
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 657
    .line 658
    .line 659
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 660
    .line 661
    if-eqz p0, :cond_25

    .line 662
    .line 663
    const/16 v0, 0x79

    .line 664
    .line 665
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 666
    .line 667
    .line 668
    :cond_25
    const/16 p0, 0x7a

    .line 669
    .line 670
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 671
    .line 672
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 673
    .line 674
    .line 675
    const/16 p0, 0x7b

    .line 676
    .line 677
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 678
    .line 679
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 680
    .line 681
    .line 682
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 683
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$1;->serialize(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
