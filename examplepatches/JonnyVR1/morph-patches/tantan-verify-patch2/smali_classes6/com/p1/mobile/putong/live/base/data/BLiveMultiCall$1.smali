.class Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "maxCallNum"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x17

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "ownerMultiCallOrder"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v2, 0x16

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "userAvatar"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v2, 0x15

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "refreshPushStreamUrl"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v2, 0x14

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "isLeadRole"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v2, 0x13

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "position"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v2, 0x12

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "state"

    .line 101
    .line 102
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v2, 0x11

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "category"

    .line 115
    .line 116
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-nez p0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v2, 0x10

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "type"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v2, 0xf

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "role"

    .line 143
    .line 144
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-nez p0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v2, 0xe

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "id"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v2, 0xd

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "receivedRewardPoint"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-nez p0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v2, 0xc

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "ownerUserId"

    .line 185
    .line 186
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-nez p0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v2, 0xb

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "userName"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-nez p0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v2, 0xa

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "ownerRoomId"

    .line 213
    .line 214
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v2, 0x9

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "ownerLiveId"

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-nez p0, :cond_f

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v2, 0x8

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "pushRemainCount"

    .line 241
    .line 242
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-nez p0, :cond_10

    .line 247
    .line 248
    goto :goto_0

    .line 249
    :cond_10
    const/4 v2, 0x7

    .line 250
    goto :goto_0

    .line 251
    :sswitch_11
    const-string p0, "userId"

    .line 252
    .line 253
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-nez p0, :cond_11

    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_11
    const/4 v2, 0x6

    .line 261
    goto :goto_0

    .line 262
    :sswitch_12
    const-string p0, "source"

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    if-nez p0, :cond_12

    .line 269
    .line 270
    goto :goto_0

    .line 271
    :cond_12
    const/4 v2, 0x5

    .line 272
    goto :goto_0

    .line 273
    :sswitch_13
    const-string p0, "roomId"

    .line 274
    .line 275
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    if-nez p0, :cond_13

    .line 280
    .line 281
    goto :goto_0

    .line 282
    :cond_13
    const/4 v2, 0x4

    .line 283
    goto :goto_0

    .line 284
    :sswitch_14
    const-string p0, "liveId"

    .line 285
    .line 286
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result p0

    .line 290
    if-nez p0, :cond_14

    .line 291
    .line 292
    goto :goto_0

    .line 293
    :cond_14
    const/4 v2, 0x3

    .line 294
    goto :goto_0

    .line 295
    :sswitch_15
    const-string p0, "isAway"

    .line 296
    .line 297
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    if-nez p0, :cond_15

    .line 302
    .line 303
    goto :goto_0

    .line 304
    :cond_15
    const/4 v2, 0x2

    .line 305
    goto :goto_0

    .line 306
    :sswitch_16
    const-string p0, "showSeconds"

    .line 307
    .line 308
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    if-nez p0, :cond_16

    .line 313
    .line 314
    goto :goto_0

    .line 315
    :cond_16
    move v2, v1

    .line 316
    goto :goto_0

    .line 317
    :sswitch_17
    const-string p0, "mutedByUserIds"

    .line 318
    .line 319
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    if-nez p0, :cond_17

    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_17
    move v2, v0

    .line 327
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 328
    .line 329
    .line 330
    return v0

    .line 331
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 332
    .line 333
    .line 334
    move-result p0

    .line 335
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->maxCallNum:I

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 343
    .line 344
    return v1

    .line 345
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userAvatar:Ljava/lang/String;

    .line 350
    .line 351
    return v1

    .line 352
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->refreshPushStreamUrl:Ljava/lang/String;

    .line 357
    .line 358
    return v1

    .line 359
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 360
    .line 361
    .line 362
    move-result p0

    .line 363
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isLeadRole:Z

    .line 364
    .line 365
    return v1

    .line 366
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 367
    .line 368
    .line 369
    move-result p0

    .line 370
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 371
    .line 372
    return v1

    .line 373
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 378
    .line 379
    return v1

    .line 380
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->category:Ljava/lang/String;

    .line 385
    .line 386
    return v1

    .line 387
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object p0

    .line 391
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->type:Ljava/lang/String;

    .line 392
    .line 393
    return v1

    .line 394
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->role:Ljava/lang/String;

    .line 399
    .line 400
    return v1

    .line 401
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 406
    .line 407
    return v0

    .line 408
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 409
    .line 410
    .line 411
    move-result-wide p2

    .line 412
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 413
    .line 414
    return v1

    .line 415
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerUserId:Ljava/lang/String;

    .line 420
    .line 421
    return v1

    .line 422
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userName:Ljava/lang/String;

    .line 427
    .line 428
    return v1

    .line 429
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerRoomId:Ljava/lang/String;

    .line 434
    .line 435
    return v1

    .line 436
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 441
    .line 442
    return v1

    .line 443
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 444
    .line 445
    .line 446
    move-result-wide p2

    .line 447
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->pushRemainCount:J

    .line 448
    .line 449
    return v1

    .line 450
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object p0

    .line 454
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 455
    .line 456
    return v1

    .line 457
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object p0

    .line 461
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->source:Ljava/lang/String;

    .line 462
    .line 463
    return v1

    .line 464
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object p0

    .line 475
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 476
    .line 477
    return v1

    .line 478
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 479
    .line 480
    .line 481
    move-result p0

    .line 482
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 483
    .line 484
    return v1

    .line 485
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 486
    .line 487
    .line 488
    move-result-wide p2

    .line 489
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->showSeconds:J

    .line 490
    .line 491
    return v1

    .line 492
    :pswitch_17
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 493
    .line 494
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 495
    .line 496
    .line 497
    move-result-object p0

    .line 498
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->mutedByUserIds:Ljava/util/List;

    .line 499
    .line 500
    return v1

    .line 501
    :sswitch_data_0
    .sparse-switch
        -0x7dbf8295 -> :sswitch_17
        -0x736fdf3e -> :sswitch_16
        -0x465f40c8 -> :sswitch_15
        -0x41b5d0d9 -> :sswitch_14
        -0x372740aa -> :sswitch_13
        -0x356f97e5 -> :sswitch_12
        -0x31d4d1ba -> :sswitch_11
        -0x2ee55977 -> :sswitch_10
        -0x1b3f0446 -> :sswitch_f
        -0x10b07417 -> :sswitch_e
        -0xfe5030a -> :sswitch_d
        -0xb5e0527 -> :sswitch_c
        -0x1e24d00 -> :sswitch_b
        0xd1b -> :sswitch_a
        0x358076 -> :sswitch_9
        0x368f3a -> :sswitch_8
        0x302bcfe -> :sswitch_7
        0x68ac491 -> :sswitch_6
        0x2c929929 -> :sswitch_5
        0x2dba2d3c -> :sswitch_4
        0x389cf4ba -> :sswitch_3
        0x40435504 -> :sswitch_2
        0x4a6f8bea -> :sswitch_1
        0x66ac0e44 -> :sswitch_0
    .end sparse-switch

    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 501
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerUserId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "ownerUserId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerRoomId:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "ownerRoomId"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "ownerLiveId"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    const-string v0, "ownerMultiCallOrder"

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const-string v0, "userId"

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userName:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const-string v0, "userName"

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userAvatar:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p0, :cond_8

    .line 76
    .line 77
    const-string v0, "userAvatar"

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->role:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_9

    .line 85
    .line 86
    const-string v0, "role"

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz p0, :cond_a

    .line 94
    .line 95
    const-string v0, "roomId"

    .line 96
    .line 97
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz p0, :cond_b

    .line 103
    .line 104
    const-string v0, "liveId"

    .line 105
    .line 106
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->category:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_c

    .line 112
    .line 113
    const-string v0, "category"

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->source:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_d

    .line 121
    .line 122
    const-string v0, "source"

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_d
    const-string p0, "position"

    .line 128
    .line 129
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 130
    .line 131
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_e

    .line 137
    .line 138
    const-string v0, "state"

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_e
    const-string p0, "receivedRewardPoint"

    .line 144
    .line 145
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 148
    .line 149
    .line 150
    const-string p0, "isAway"

    .line 151
    .line 152
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 153
    .line 154
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->mutedByUserIds:Ljava/util/List;

    .line 158
    .line 159
    if-eqz p0, :cond_f

    .line 160
    .line 161
    const-string p0, "mutedByUserIds"

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->mutedByUserIds:Ljava/util/List;

    .line 167
    .line 168
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 169
    .line 170
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 171
    .line 172
    .line 173
    :cond_f
    const-string p0, "showSeconds"

    .line 174
    .line 175
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->showSeconds:J

    .line 176
    .line 177
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 178
    .line 179
    .line 180
    const-string p0, "pushRemainCount"

    .line 181
    .line 182
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->pushRemainCount:J

    .line 183
    .line 184
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 185
    .line 186
    .line 187
    const-string p0, "isLeadRole"

    .line 188
    .line 189
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isLeadRole:Z

    .line 190
    .line 191
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 192
    .line 193
    .line 194
    const-string p0, "maxCallNum"

    .line 195
    .line 196
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->maxCallNum:I

    .line 197
    .line 198
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->refreshPushStreamUrl:Ljava/lang/String;

    .line 202
    .line 203
    if-eqz p0, :cond_10

    .line 204
    .line 205
    const-string p1, "refreshPushStreamUrl"

    .line 206
    .line 207
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_10
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
