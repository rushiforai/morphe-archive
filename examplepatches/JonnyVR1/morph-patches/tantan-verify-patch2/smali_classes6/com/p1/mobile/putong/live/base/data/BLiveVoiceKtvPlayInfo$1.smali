.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
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
    const-string p0, "showBgSvgaUrl"

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
    const/16 v2, 0x18

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "songCode"

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
    const/16 v2, 0x17

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "bestSingerName"

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
    const/16 v2, 0x16

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "maxLevel"

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
    const/16 v2, 0x15

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "prepareRemainSeconds"

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
    const/16 v2, 0x14

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "title"

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
    const/16 v2, 0x13

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "score"

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
    const/16 v2, 0x12

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "level"

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
    const/16 v2, 0x11

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "cover"

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
    const/16 v2, 0x10

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "mask"

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
    const/16 v2, 0xf

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "durationSecond"

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
    const/16 v2, 0xe

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "lyricType"

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
    const/16 v2, 0xd

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "userId"

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
    const/16 v2, 0xc

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "status"

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
    const/16 v2, 0xb

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "schema"

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
    const/16 v2, 0xa

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "provider"

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
    const/16 v2, 0x9

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "nextLevelGiftUv"

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
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v2, 0x8

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "orderId"

    .line 255
    .line 256
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    if-nez p0, :cond_11

    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_11
    const/4 v2, 0x7

    .line 264
    goto :goto_0

    .line 265
    :sswitch_12
    const-string p0, "giftUv"

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-nez p0, :cond_12

    .line 272
    .line 273
    goto :goto_0

    .line 274
    :cond_12
    const/4 v2, 0x6

    .line 275
    goto :goto_0

    .line 276
    :sswitch_13
    const-string p0, "author"

    .line 277
    .line 278
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    if-nez p0, :cond_13

    .line 283
    .line 284
    goto :goto_0

    .line 285
    :cond_13
    const/4 v2, 0x5

    .line 286
    goto :goto_0

    .line 287
    :sswitch_14
    const-string p0, "lyricUrl"

    .line 288
    .line 289
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-nez p0, :cond_14

    .line 294
    .line 295
    goto :goto_0

    .line 296
    :cond_14
    const/4 v2, 0x4

    .line 297
    goto :goto_0

    .line 298
    :sswitch_15
    const-string p0, "showLevel"

    .line 299
    .line 300
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    if-nez p0, :cond_15

    .line 305
    .line 306
    goto :goto_0

    .line 307
    :cond_15
    const/4 v2, 0x3

    .line 308
    goto :goto_0

    .line 309
    :sswitch_16
    const-string p0, "songUrl"

    .line 310
    .line 311
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result p0

    .line 315
    if-nez p0, :cond_16

    .line 316
    .line 317
    goto :goto_0

    .line 318
    :cond_16
    const/4 v2, 0x2

    .line 319
    goto :goto_0

    .line 320
    :sswitch_17
    const-string p0, "quickGiftInfo"

    .line 321
    .line 322
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    if-nez p0, :cond_17

    .line 327
    .line 328
    goto :goto_0

    .line 329
    :cond_17
    move v2, v1

    .line 330
    goto :goto_0

    .line 331
    :sswitch_18
    const-string p0, "levelTip"

    .line 332
    .line 333
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result p0

    .line 337
    if-nez p0, :cond_18

    .line 338
    .line 339
    goto :goto_0

    .line 340
    :cond_18
    move v2, v0

    .line 341
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 342
    .line 343
    .line 344
    return v0

    .line 345
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 350
    .line 351
    return v1

    .line 352
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 357
    .line 358
    return v1

    .line 359
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 364
    .line 365
    return v1

    .line 366
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 367
    .line 368
    .line 369
    move-result p0

    .line 370
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 371
    .line 372
    return v1

    .line 373
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 374
    .line 375
    .line 376
    move-result-wide p2

    .line 377
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 378
    .line 379
    return v1

    .line 380
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 385
    .line 386
    return v1

    .line 387
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 388
    .line 389
    .line 390
    move-result-wide p2

    .line 391
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 392
    .line 393
    return v1

    .line 394
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 395
    .line 396
    .line 397
    move-result p0

    .line 398
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 399
    .line 400
    return v1

    .line 401
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 406
    .line 407
    return v1

    .line 408
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 409
    .line 410
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 411
    .line 412
    .line 413
    move-result-object p0

    .line 414
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 415
    .line 416
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 417
    .line 418
    return v1

    .line 419
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 420
    .line 421
    .line 422
    move-result-wide p2

    .line 423
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 424
    .line 425
    return v1

    .line 426
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 431
    .line 432
    return v1

    .line 433
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object p0

    .line 437
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 438
    .line 439
    return v1

    .line 440
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 441
    .line 442
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 447
    .line 448
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 449
    .line 450
    return v1

    .line 451
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 456
    .line 457
    return v1

    .line 458
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 463
    .line 464
    return v1

    .line 465
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 466
    .line 467
    .line 468
    move-result p0

    .line 469
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 470
    .line 471
    return v1

    .line 472
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 477
    .line 478
    return v1

    .line 479
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 480
    .line 481
    .line 482
    move-result p0

    .line 483
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 484
    .line 485
    return v1

    .line 486
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object p0

    .line 490
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 491
    .line 492
    return v1

    .line 493
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 498
    .line 499
    return v1

    .line 500
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 501
    .line 502
    .line 503
    move-result p0

    .line 504
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 505
    .line 506
    return v1

    .line 507
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object p0

    .line 511
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 512
    .line 513
    return v1

    .line 514
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 515
    .line 516
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 517
    .line 518
    .line 519
    move-result-object p0

    .line 520
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 521
    .line 522
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 523
    .line 524
    return v1

    .line 525
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object p0

    .line 529
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 530
    .line 531
    return v1

    .line 532
    nop

    .line 533
    :sswitch_data_0
    .sparse-switch
        -0x7f0e3189 -> :sswitch_18
        -0x7ab588f5 -> :sswitch_17
        -0x78eb3be6 -> :sswitch_16
        -0x7284d979 -> :sswitch_15
        -0x63b0a770 -> :sswitch_14
        -0x53d2de75 -> :sswitch_13
        -0x4a45180f -> :sswitch_12
        -0x47f30af7 -> :sswitch_11
        -0x44cc6c5e -> :sswitch_10
        -0x3adbfa0f -> :sswitch_f
        -0x361eca5f -> :sswitch_e
        -0x3532300e -> :sswitch_d
        -0x31d4d1ba -> :sswitch_c
        -0x12649fc7 -> :sswitch_b
        -0x116f00d8 -> :sswitch_a
        0x3306ec -> :sswitch_9
        0x5a753b7 -> :sswitch_8
        0x6219b84 -> :sswitch_7
        0x6833e92 -> :sswitch_6
        0x6942258 -> :sswitch_5
        0xcc294ac -> :sswitch_4
        0x1740c480 -> :sswitch_3
        0x1f10392b -> :sswitch_2
        0x5b7b84a2 -> :sswitch_1
        0x5d6bc730 -> :sswitch_0
    .end sparse-switch

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
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_18
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

    .line 533
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "orderId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "songCode"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "userId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const-string p0, "mask"

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 41
    .line 42
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "title"

    .line 50
    .line 51
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz p0, :cond_5

    .line 57
    .line 58
    const-string v1, "lyricUrl"

    .line 59
    .line 60
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const-string v1, "lyricType"

    .line 68
    .line 69
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    const-string v1, "songUrl"

    .line 77
    .line 78
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_7
    const-string p0, "prepareRemainSeconds"

    .line 82
    .line 83
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 84
    .line 85
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 89
    .line 90
    if-eqz p0, :cond_8

    .line 91
    .line 92
    const-string p0, "status"

    .line 93
    .line 94
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 98
    .line 99
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 100
    .line 101
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 102
    .line 103
    .line 104
    :cond_8
    const-string p0, "durationSecond"

    .line 105
    .line 106
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 107
    .line 108
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    const-string v1, "author"

    .line 116
    .line 117
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_a

    .line 123
    .line 124
    const-string v1, "cover"

    .line 125
    .line 126
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 130
    .line 131
    if-eqz p0, :cond_b

    .line 132
    .line 133
    const-string p0, "quickGiftInfo"

    .line 134
    .line 135
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 139
    .line 140
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 141
    .line 142
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 143
    .line 144
    .line 145
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz p0, :cond_c

    .line 148
    .line 149
    const-string v0, "provider"

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_c
    const-string p0, "level"

    .line 155
    .line 156
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 157
    .line 158
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 159
    .line 160
    .line 161
    const-string p0, "maxLevel"

    .line 162
    .line 163
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 164
    .line 165
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 169
    .line 170
    if-eqz p0, :cond_d

    .line 171
    .line 172
    const-string v0, "levelTip"

    .line 173
    .line 174
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_d
    const-string p0, "score"

    .line 178
    .line 179
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 180
    .line 181
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 182
    .line 183
    .line 184
    const-string p0, "showLevel"

    .line 185
    .line 186
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 187
    .line 188
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 189
    .line 190
    .line 191
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz p0, :cond_e

    .line 194
    .line 195
    const-string v0, "schema"

    .line 196
    .line 197
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_e
    const-string p0, "giftUv"

    .line 201
    .line 202
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 203
    .line 204
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 205
    .line 206
    .line 207
    const-string p0, "nextLevelGiftUv"

    .line 208
    .line 209
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 210
    .line 211
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz p0, :cond_f

    .line 217
    .line 218
    const-string v0, "bestSingerName"

    .line 219
    .line 220
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 224
    .line 225
    if-eqz p0, :cond_10

    .line 226
    .line 227
    const-string p1, "showBgSvgaUrl"

    .line 228
    .line 229
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
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

    .line 233
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
