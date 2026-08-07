.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;",
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
    const-string p0, "endTagColor"

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
    const/16 v2, 0x19

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "startRightTagColor"

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
    const/16 v2, 0x18

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "localRightTag"

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
    const/16 v2, 0x17

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "nextValidTime"

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
    const/16 v2, 0x16

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "showAnimRules"

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
    const/16 v2, 0x15

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "interactStatus"

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
    const/16 v2, 0x14

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "giftSource"

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
    const/16 v2, 0x13

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "hdUrl"

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
    const/16 v2, 0x12

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "tag"

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
    const/16 v2, 0x11

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "id"

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
    const/16 v2, 0x10

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "expiredTime"

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
    const/16 v2, 0xf

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "discounts"

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
    const/16 v2, 0xe

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "expiredTimeText"

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
    const/16 v2, 0xd

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "fastGiftNum"

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
    const/16 v2, 0xc

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "createdTime"

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
    const/16 v2, 0xb

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "rightTagTextColor"

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
    const/16 v2, 0xa

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "startTagColor"

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
    const/16 v2, 0x9

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "showOutside"

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
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v2, 0x8

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "nameStatus"

    .line 269
    .line 270
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    if-nez p0, :cond_12

    .line 275
    .line 276
    goto :goto_0

    .line 277
    :cond_12
    const/4 v2, 0x7

    .line 278
    goto :goto_0

    .line 279
    :sswitch_13
    const-string p0, "remain"

    .line 280
    .line 281
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_13

    .line 286
    .line 287
    goto :goto_0

    .line 288
    :cond_13
    const/4 v2, 0x6

    .line 289
    goto :goto_0

    .line 290
    :sswitch_14
    const-string p0, "labels"

    .line 291
    .line 292
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    if-nez p0, :cond_14

    .line 297
    .line 298
    goto :goto_0

    .line 299
    :cond_14
    const/4 v2, 0x5

    .line 300
    goto :goto_0

    .line 301
    :sswitch_15
    const-string p0, "rightTag"

    .line 302
    .line 303
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-nez p0, :cond_15

    .line 308
    .line 309
    goto :goto_0

    .line 310
    :cond_15
    const/4 v2, 0x4

    .line 311
    goto :goto_0

    .line 312
    :sswitch_16
    const-string p0, "flyMicInfo"

    .line 313
    .line 314
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    if-nez p0, :cond_16

    .line 319
    .line 320
    goto :goto_0

    .line 321
    :cond_16
    const/4 v2, 0x3

    .line 322
    goto :goto_0

    .line 323
    :sswitch_17
    const-string p0, "interactRules"

    .line 324
    .line 325
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result p0

    .line 329
    if-nez p0, :cond_17

    .line 330
    .line 331
    goto :goto_0

    .line 332
    :cond_17
    const/4 v2, 0x2

    .line 333
    goto :goto_0

    .line 334
    :sswitch_18
    const-string p0, "slotGiftInfo"

    .line 335
    .line 336
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    if-nez p0, :cond_18

    .line 341
    .line 342
    goto :goto_0

    .line 343
    :cond_18
    move v2, v1

    .line 344
    goto :goto_0

    .line 345
    :sswitch_19
    const-string p0, "endRightTagColor"

    .line 346
    .line 347
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result p0

    .line 351
    if-nez p0, :cond_19

    .line 352
    .line 353
    goto :goto_0

    .line 354
    :cond_19
    move v2, v0

    .line 355
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 356
    .line 357
    .line 358
    return v0

    .line 359
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 364
    .line 365
    return v1

    .line 366
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 371
    .line 372
    return v1

    .line 373
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 374
    .line 375
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;

    .line 380
    .line 381
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 382
    .line 383
    return v1

    .line 384
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 385
    .line 386
    .line 387
    move-result-wide p2

    .line 388
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 389
    .line 390
    return v1

    .line 391
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 392
    .line 393
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 398
    .line 399
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 400
    .line 401
    return v1

    .line 402
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 407
    .line 408
    return v1

    .line 409
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 410
    .line 411
    .line 412
    move-result p0

    .line 413
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 414
    .line 415
    return v1

    .line 416
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 421
    .line 422
    return v1

    .line 423
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 428
    .line 429
    return v1

    .line 430
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 431
    .line 432
    .line 433
    move-result p0

    .line 434
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 435
    .line 436
    return v0

    .line 437
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 438
    .line 439
    .line 440
    move-result-wide p2

    .line 441
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 442
    .line 443
    return v1

    .line 444
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 445
    .line 446
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 451
    .line 452
    return v1

    .line 453
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 458
    .line 459
    return v1

    .line 460
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 461
    .line 462
    .line 463
    move-result p0

    .line 464
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 465
    .line 466
    return v1

    .line 467
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 468
    .line 469
    .line 470
    move-result-wide p2

    .line 471
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 472
    .line 473
    return v1

    .line 474
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object p0

    .line 478
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 479
    .line 480
    return v1

    .line 481
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object p0

    .line 485
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 486
    .line 487
    return v1

    .line 488
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 489
    .line 490
    .line 491
    move-result p0

    .line 492
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 493
    .line 494
    return v1

    .line 495
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 496
    .line 497
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 502
    .line 503
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 504
    .line 505
    return v1

    .line 506
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 507
    .line 508
    .line 509
    move-result p0

    .line 510
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 511
    .line 512
    return v1

    .line 513
    :pswitch_14
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 514
    .line 515
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 520
    .line 521
    return v1

    .line 522
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object p0

    .line 526
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 527
    .line 528
    return v1

    .line 529
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 530
    .line 531
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object p0

    .line 535
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 536
    .line 537
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 538
    .line 539
    return v1

    .line 540
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 541
    .line 542
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object p0

    .line 546
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 547
    .line 548
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 549
    .line 550
    return v1

    .line 551
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 552
    .line 553
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object p0

    .line 557
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 558
    .line 559
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 560
    .line 561
    return v1

    .line 562
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object p0

    .line 566
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 567
    .line 568
    return v1

    .line 569
    :sswitch_data_0
    .sparse-switch
        -0x731162f6 -> :sswitch_19
        -0x696765e4 -> :sswitch_18
        -0x62d1cb9f -> :sswitch_17
        -0x626d485e -> :sswitch_16
        -0x55990022 -> :sswitch_15
        -0x422fa001 -> :sswitch_14
        -0x37b53d94 -> :sswitch_13
        -0x2c9b1da3 -> :sswitch_12
        -0x2ac9f418 -> :sswitch_11
        -0x27802995 -> :sswitch_10
        -0x203ab808 -> :sswitch_f
        -0x1d336e2b -> :sswitch_e
        -0xb6c23c6 -> :sswitch_d
        -0x9b40c21 -> :sswitch_c
        -0x739ccae -> :sswitch_b
        -0x583ac6e -> :sswitch_a
        0xd1b -> :sswitch_9
        0x1bf9a -> :sswitch_8
        0x5e84ed3 -> :sswitch_7
        0x99e196b -> :sswitch_6
        0xa3a51c8 -> :sswitch_5
        0x1b9e8ae9 -> :sswitch_4
        0x37242f36 -> :sswitch_3
        0x54b2a869 -> :sswitch_2
        0x667294e3 -> :sswitch_1
        0x754b11e4 -> :sswitch_0
    .end sparse-switch

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
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_19
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

    .line 569
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "id"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "fastGiftNum"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "giftSource"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "remain"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string p0, "expiredTime"

    .line 30
    .line 31
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 34
    .line 35
    .line 36
    const-string p0, "nextValidTime"

    .line 37
    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    const-string p0, "showOutside"

    .line 44
    .line 45
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 48
    .line 49
    .line 50
    const-string p0, "createdTime"

    .line 51
    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    const-string v0, "interactStatus"

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    const-string p0, "interactRules"

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 77
    .line 78
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 79
    .line 80
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    const-string v1, "expiredTimeText"

    .line 88
    .line 89
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 93
    .line 94
    if-eqz p0, :cond_3

    .line 95
    .line 96
    const-string p0, "labels"

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 102
    .line 103
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 104
    .line 105
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 109
    .line 110
    if-eqz p0, :cond_4

    .line 111
    .line 112
    const-string p0, "showAnimRules"

    .line 113
    .line 114
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 120
    .line 121
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 122
    .line 123
    .line 124
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 125
    .line 126
    if-eqz p0, :cond_5

    .line 127
    .line 128
    const-string p0, "slotGiftInfo"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 136
    .line 137
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 138
    .line 139
    .line 140
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz p0, :cond_6

    .line 143
    .line 144
    const-string v1, "hdUrl"

    .line 145
    .line 146
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 150
    .line 151
    if-eqz p0, :cond_7

    .line 152
    .line 153
    const-string p0, "discounts"

    .line 154
    .line 155
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 161
    .line 162
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 163
    .line 164
    .line 165
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz p0, :cond_8

    .line 168
    .line 169
    const-string v1, "tag"

    .line 170
    .line 171
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz p0, :cond_9

    .line 177
    .line 178
    const-string v1, "startTagColor"

    .line 179
    .line 180
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz p0, :cond_a

    .line 186
    .line 187
    const-string v1, "endTagColor"

    .line 188
    .line 189
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 193
    .line 194
    if-eqz p0, :cond_b

    .line 195
    .line 196
    const-string p0, "nameStatus"

    .line 197
    .line 198
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 202
    .line 203
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 204
    .line 205
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 206
    .line 207
    .line 208
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 209
    .line 210
    if-eqz p0, :cond_c

    .line 211
    .line 212
    const-string v1, "rightTag"

    .line 213
    .line 214
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 218
    .line 219
    if-eqz p0, :cond_d

    .line 220
    .line 221
    const-string p0, "localRightTag"

    .line 222
    .line 223
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 227
    .line 228
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 229
    .line 230
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 231
    .line 232
    .line 233
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz p0, :cond_e

    .line 236
    .line 237
    const-string v1, "startRightTagColor"

    .line 238
    .line 239
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 243
    .line 244
    if-eqz p0, :cond_f

    .line 245
    .line 246
    const-string v1, "endRightTagColor"

    .line 247
    .line 248
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 252
    .line 253
    if-eqz p0, :cond_10

    .line 254
    .line 255
    const-string v1, "rightTagTextColor"

    .line 256
    .line 257
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 261
    .line 262
    if-eqz p0, :cond_11

    .line 263
    .line 264
    const-string p0, "flyMicInfo"

    .line 265
    .line 266
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 270
    .line 271
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 272
    .line 273
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 274
    .line 275
    .line 276
    :cond_11
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 277
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
