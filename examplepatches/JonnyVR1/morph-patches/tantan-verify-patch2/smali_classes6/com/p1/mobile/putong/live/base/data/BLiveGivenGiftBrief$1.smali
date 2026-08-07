.class Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
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
    const-string p0, "isNamed"

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
    const/16 v2, 0x2a

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "canShowPreviewText"

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
    const/16 v2, 0x29

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "endTagColor"

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
    const/16 v2, 0x28

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "lotteryGiftId"

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
    const/16 v2, 0x27

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "nextGearCnt"

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
    const/16 v2, 0x26

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "isFirstGivenGift"

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
    const/16 v2, 0x25

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "isAnimationWithStarCombo"

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
    const/16 v2, 0x24

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "comboId"

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
    const/16 v2, 0x23

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "nextValidTime"

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
    const/16 v2, 0x22

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "videoEffectExtras"

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
    const/16 v2, 0x21

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "giftBottomTag"

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
    const/16 v2, 0x20

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "canStay"

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
    const/16 v2, 0x1f

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "enableComboEffect"

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
    const/16 v2, 0x1e

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "giftSetInfo"

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
    const/16 v2, 0x1d

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "interactStatus"

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
    const/16 v2, 0x1c

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "giftSource"

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
    const/16 v2, 0x1b

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "fpUrl"

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
    const/16 v2, 0x1a

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "tray"

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
    const/16 v2, 0x19

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "step"

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
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v2, 0x18

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "tag"

    .line 283
    .line 284
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    if-nez p0, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v2, 0x17

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "num"

    .line 297
    .line 298
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    if-nez p0, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v2, 0x16

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "id"

    .line 311
    .line 312
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v2, 0x15

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "expiredTime"

    .line 325
    .line 326
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result p0

    .line 330
    if-nez p0, :cond_16

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :cond_16
    const/16 v2, 0x14

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "discounts"

    .line 339
    .line 340
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    if-nez p0, :cond_17

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_17
    const/16 v2, 0x13

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "expiredTimeText"

    .line 353
    .line 354
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    if-nez p0, :cond_18

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :cond_18
    const/16 v2, 0x12

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "gearPercent"

    .line 367
    .line 368
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result p0

    .line 372
    if-nez p0, :cond_19

    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_19
    const/16 v2, 0x11

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "userName"

    .line 381
    .line 382
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result p0

    .line 386
    if-nez p0, :cond_1a

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :cond_1a
    const/16 v2, 0x10

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "stickFacePositionType"

    .line 395
    .line 396
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    if-nez p0, :cond_1b

    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :cond_1b
    const/16 v2, 0xf

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "avatarTag"

    .line 409
    .line 410
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result p0

    .line 414
    if-nez p0, :cond_1c

    .line 415
    .line 416
    goto/16 :goto_0

    .line 417
    .line 418
    :cond_1c
    const/16 v2, 0xe

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "startTagColor"

    .line 423
    .line 424
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result p0

    .line 428
    if-nez p0, :cond_1d

    .line 429
    .line 430
    goto/16 :goto_0

    .line 431
    .line 432
    :cond_1d
    const/16 v2, 0xd

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "luckyPrizeGiftInfoGiftItemId"

    .line 437
    .line 438
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result p0

    .line 442
    if-nez p0, :cond_1e

    .line 443
    .line 444
    goto/16 :goto_0

    .line 445
    .line 446
    :cond_1e
    const/16 v2, 0xc

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "gearPercentInfo"

    .line 451
    .line 452
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result p0

    .line 456
    if-nez p0, :cond_1f

    .line 457
    .line 458
    goto/16 :goto_0

    .line 459
    .line 460
    :cond_1f
    const/16 v2, 0xb

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "remain"

    .line 465
    .line 466
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    move-result p0

    .line 470
    if-nez p0, :cond_20

    .line 471
    .line 472
    goto/16 :goto_0

    .line 473
    .line 474
    :cond_20
    const/16 v2, 0xa

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "canResetGearPercent"

    .line 479
    .line 480
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result p0

    .line 484
    if-nez p0, :cond_21

    .line 485
    .line 486
    goto/16 :goto_0

    .line 487
    .line 488
    :cond_21
    const/16 v2, 0x9

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "canShowGearPercent"

    .line 493
    .line 494
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 495
    .line 496
    .line 497
    move-result p0

    .line 498
    if-nez p0, :cond_22

    .line 499
    .line 500
    goto/16 :goto_0

    .line 501
    .line 502
    :cond_22
    const/16 v2, 0x8

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "isGear"

    .line 507
    .line 508
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    move-result p0

    .line 512
    if-nez p0, :cond_23

    .line 513
    .line 514
    goto :goto_0

    .line 515
    :cond_23
    const/4 v2, 0x7

    .line 516
    goto :goto_0

    .line 517
    :sswitch_24
    const-string p0, "previewText"

    .line 518
    .line 519
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 520
    .line 521
    .line 522
    move-result p0

    .line 523
    if-nez p0, :cond_24

    .line 524
    .line 525
    goto :goto_0

    .line 526
    :cond_24
    const/4 v2, 0x6

    .line 527
    goto :goto_0

    .line 528
    :sswitch_25
    const-string p0, "combos"

    .line 529
    .line 530
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 531
    .line 532
    .line 533
    move-result p0

    .line 534
    if-nez p0, :cond_25

    .line 535
    .line 536
    goto :goto_0

    .line 537
    :cond_25
    const/4 v2, 0x5

    .line 538
    goto :goto_0

    .line 539
    :sswitch_26
    const-string p0, "canBoomGearPercent"

    .line 540
    .line 541
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 542
    .line 543
    .line 544
    move-result p0

    .line 545
    if-nez p0, :cond_26

    .line 546
    .line 547
    goto :goto_0

    .line 548
    :cond_26
    const/4 v2, 0x4

    .line 549
    goto :goto_0

    .line 550
    :sswitch_27
    const-string p0, "threshold"

    .line 551
    .line 552
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    move-result p0

    .line 556
    if-nez p0, :cond_27

    .line 557
    .line 558
    goto :goto_0

    .line 559
    :cond_27
    const/4 v2, 0x3

    .line 560
    goto :goto_0

    .line 561
    :sswitch_28
    const-string p0, "flyMicInfo"

    .line 562
    .line 563
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    move-result p0

    .line 567
    if-nez p0, :cond_28

    .line 568
    .line 569
    goto :goto_0

    .line 570
    :cond_28
    const/4 v2, 0x2

    .line 571
    goto :goto_0

    .line 572
    :sswitch_29
    const-string p0, "interactRules"

    .line 573
    .line 574
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 575
    .line 576
    .line 577
    move-result p0

    .line 578
    if-nez p0, :cond_29

    .line 579
    .line 580
    goto :goto_0

    .line 581
    :cond_29
    move v2, v1

    .line 582
    goto :goto_0

    .line 583
    :sswitch_2a
    const-string p0, "isDailyPaymentExceeded"

    .line 584
    .line 585
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result p0

    .line 589
    if-nez p0, :cond_2a

    .line 590
    .line 591
    goto :goto_0

    .line 592
    :cond_2a
    move v2, v0

    .line 593
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 594
    .line 595
    .line 596
    return v0

    .line 597
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 598
    .line 599
    .line 600
    move-result p0

    .line 601
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 602
    .line 603
    return v1

    .line 604
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 605
    .line 606
    .line 607
    move-result p0

    .line 608
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 609
    .line 610
    return v1

    .line 611
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 616
    .line 617
    return v1

    .line 618
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 619
    .line 620
    .line 621
    move-result p0

    .line 622
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 623
    .line 624
    return v1

    .line 625
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 626
    .line 627
    .line 628
    move-result p0

    .line 629
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 630
    .line 631
    return v1

    .line 632
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 633
    .line 634
    .line 635
    move-result p0

    .line 636
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 637
    .line 638
    return v1

    .line 639
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 640
    .line 641
    .line 642
    move-result p0

    .line 643
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 644
    .line 645
    return v1

    .line 646
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object p0

    .line 650
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 651
    .line 652
    return v1

    .line 653
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 654
    .line 655
    .line 656
    move-result-wide p2

    .line 657
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 658
    .line 659
    return v1

    .line 660
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 661
    .line 662
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 663
    .line 664
    .line 665
    move-result-object p0

    .line 666
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 667
    .line 668
    return v1

    .line 669
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object p0

    .line 673
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 674
    .line 675
    return v1

    .line 676
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 677
    .line 678
    .line 679
    move-result p0

    .line 680
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 681
    .line 682
    return v1

    .line 683
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 684
    .line 685
    .line 686
    move-result p0

    .line 687
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 688
    .line 689
    return v1

    .line 690
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 691
    .line 692
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 693
    .line 694
    .line 695
    move-result-object p0

    .line 696
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 697
    .line 698
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 699
    .line 700
    return v1

    .line 701
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 702
    .line 703
    .line 704
    move-result-object p0

    .line 705
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 706
    .line 707
    return v1

    .line 708
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 709
    .line 710
    .line 711
    move-result p0

    .line 712
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 713
    .line 714
    return v1

    .line 715
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 716
    .line 717
    .line 718
    move-result-object p0

    .line 719
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 720
    .line 721
    return v1

    .line 722
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 723
    .line 724
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    move-result-object p0

    .line 728
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 729
    .line 730
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 731
    .line 732
    return v1

    .line 733
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 734
    .line 735
    .line 736
    move-result-wide p2

    .line 737
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 738
    .line 739
    return v1

    .line 740
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    move-result-object p0

    .line 744
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 745
    .line 746
    return v1

    .line 747
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 748
    .line 749
    .line 750
    move-result p0

    .line 751
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 752
    .line 753
    return v1

    .line 754
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 755
    .line 756
    .line 757
    move-result p0

    .line 758
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 759
    .line 760
    return v0

    .line 761
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 762
    .line 763
    .line 764
    move-result-wide p2

    .line 765
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 766
    .line 767
    return v1

    .line 768
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 769
    .line 770
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 771
    .line 772
    .line 773
    move-result-object p0

    .line 774
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 775
    .line 776
    return v1

    .line 777
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 778
    .line 779
    .line 780
    move-result-object p0

    .line 781
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 782
    .line 783
    return v1

    .line 784
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 785
    .line 786
    .line 787
    move-result-wide p2

    .line 788
    double-to-float p0, p2

    .line 789
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 790
    .line 791
    return v1

    .line 792
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object p0

    .line 796
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 797
    .line 798
    return v1

    .line 799
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 800
    .line 801
    .line 802
    move-result p0

    .line 803
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 804
    .line 805
    return v1

    .line 806
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 807
    .line 808
    .line 809
    move-result-object p0

    .line 810
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 811
    .line 812
    return v1

    .line 813
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 814
    .line 815
    .line 816
    move-result-object p0

    .line 817
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 818
    .line 819
    return v1

    .line 820
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 821
    .line 822
    .line 823
    move-result p0

    .line 824
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 825
    .line 826
    return v1

    .line 827
    :pswitch_1f
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 828
    .line 829
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 830
    .line 831
    .line 832
    move-result-object p0

    .line 833
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 834
    .line 835
    return v1

    .line 836
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 837
    .line 838
    .line 839
    move-result p0

    .line 840
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 841
    .line 842
    return v1

    .line 843
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 844
    .line 845
    .line 846
    move-result p0

    .line 847
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 848
    .line 849
    return v1

    .line 850
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 851
    .line 852
    .line 853
    move-result p0

    .line 854
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 855
    .line 856
    return v1

    .line 857
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 858
    .line 859
    .line 860
    move-result p0

    .line 861
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 862
    .line 863
    return v1

    .line 864
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 865
    .line 866
    .line 867
    move-result-object p0

    .line 868
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 869
    .line 870
    return v1

    .line 871
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 872
    .line 873
    .line 874
    move-result p0

    .line 875
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 876
    .line 877
    return v1

    .line 878
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 879
    .line 880
    .line 881
    move-result p0

    .line 882
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 883
    .line 884
    return v1

    .line 885
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 886
    .line 887
    .line 888
    move-result-wide p2

    .line 889
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 890
    .line 891
    return v1

    .line 892
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 893
    .line 894
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 895
    .line 896
    .line 897
    move-result-object p0

    .line 898
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 899
    .line 900
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 901
    .line 902
    return v1

    .line 903
    :pswitch_29
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 904
    .line 905
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 906
    .line 907
    .line 908
    move-result-object p0

    .line 909
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 910
    .line 911
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 912
    .line 913
    return v1

    .line 914
    :pswitch_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 915
    .line 916
    .line 917
    move-result p0

    .line 918
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 919
    .line 920
    return v1

    .line 921
    :sswitch_data_0
    .sparse-switch
        -0x65300f96 -> :sswitch_2a
        -0x62d1cb9f -> :sswitch_29
        -0x626d485e -> :sswitch_28
        -0x5c1e1b95 -> :sswitch_27
        -0x5bffd225 -> :sswitch_26
        -0x50c0ff5b -> :sswitch_25
        -0x4cf686eb -> :sswitch_24
        -0x465cca27 -> :sswitch_23
        -0x448dd177 -> :sswitch_22
        -0x3a5fd529 -> :sswitch_21
        -0x37b53d94 -> :sswitch_20
        -0x33675e7c -> :sswitch_1f
        -0x32e25ada -> :sswitch_1e
        -0x27802995 -> :sswitch_1d
        -0x198ca47f -> :sswitch_1c
        -0x13589450 -> :sswitch_1b
        -0xfe5030a -> :sswitch_1a
        -0xc0d6c4a -> :sswitch_19
        -0x9b40c21 -> :sswitch_18
        -0x739ccae -> :sswitch_17
        -0x583ac6e -> :sswitch_16
        0xd1b -> :sswitch_15
        0x1ab86 -> :sswitch_14
        0x1bf9a -> :sswitch_13
        0x3606cc -> :sswitch_12
        0x367336 -> :sswitch_11
        0x5d19445 -> :sswitch_10
        0x99e196b -> :sswitch_f
        0xa3a51c8 -> :sswitch_e
        0x18f40ce0 -> :sswitch_d
        0x1f81f73c -> :sswitch_c
        0x20c49249 -> :sswitch_b
        0x2bd6061f -> :sswitch_a
        0x2f60eb6f -> :sswitch_9
        0x37242f36 -> :sswitch_8
        0x38a10f49 -> :sswitch_7
        0x47c554dc -> :sswitch_6
        0x48e5a947 -> :sswitch_5
        0x4b1a76e7 -> :sswitch_4
        0x5f6d4f14 -> :sswitch_3
        0x754b11e4 -> :sswitch_2
        0x7a8913e8 -> :sswitch_1
        0x7b24842f -> :sswitch_0
    .end sparse-switch

    .line 922
    .line 923
    .line 924
    .line 925
    .line 926
    .line 927
    .line 928
    .line 929
    .line 930
    .line 931
    .line 932
    .line 933
    .line 934
    .line 935
    .line 936
    .line 937
    .line 938
    .line 939
    .line 940
    .line 941
    .line 942
    .line 943
    .line 944
    .line 945
    .line 946
    .line 947
    .line 948
    .line 949
    .line 950
    .line 951
    .line 952
    .line 953
    .line 954
    .line 955
    .line 956
    .line 957
    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    .line 972
    .line 973
    .line 974
    .line 975
    .line 976
    .line 977
    .line 978
    .line 979
    .line 980
    .line 981
    .line 982
    .line 983
    .line 984
    .line 985
    .line 986
    .line 987
    .line 988
    .line 989
    .line 990
    .line 991
    .line 992
    .line 993
    .line 994
    .line 995
    .line 996
    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    .line 1002
    .line 1003
    .line 1004
    .line 1005
    .line 1006
    .line 1007
    .line 1008
    .line 1009
    .line 1010
    .line 1011
    .line 1012
    .line 1013
    .line 1014
    .line 1015
    .line 1016
    .line 1017
    .line 1018
    .line 1019
    .line 1020
    .line 1021
    .line 1022
    .line 1023
    .line 1024
    .line 1025
    .line 1026
    .line 1027
    .line 1028
    .line 1029
    .line 1030
    .line 1031
    .line 1032
    .line 1033
    .line 1034
    .line 1035
    .line 1036
    .line 1037
    .line 1038
    .line 1039
    .line 1040
    .line 1041
    .line 1042
    .line 1043
    .line 1044
    .line 1045
    .line 1046
    .line 1047
    .line 1048
    .line 1049
    .line 1050
    .line 1051
    .line 1052
    .line 1053
    .line 1054
    .line 1055
    .line 1056
    .line 1057
    .line 1058
    .line 1059
    .line 1060
    .line 1061
    .line 1062
    .line 1063
    .line 1064
    .line 1065
    .line 1066
    .line 1067
    .line 1068
    .line 1069
    .line 1070
    .line 1071
    .line 1072
    .line 1073
    .line 1074
    .line 1075
    .line 1076
    .line 1077
    .line 1078
    .line 1079
    .line 1080
    .line 1081
    .line 1082
    .line 1083
    .line 1084
    .line 1085
    .line 1086
    .line 1087
    .line 1088
    .line 1089
    .line 1090
    .line 1091
    .line 1092
    .line 1093
    .line 1094
    .line 1095
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
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

    .line 921
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "id"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "num"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string v0, "fpUrl"

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string v0, "userName"

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string v0, "comboId"

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    const-string p0, "combos"

    .line 43
    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    const-string p0, "stickFacePositionType"

    .line 50
    .line 51
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 52
    .line 53
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    const-string p0, "remain"

    .line 57
    .line 58
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 59
    .line 60
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    const-string p0, "expiredTime"

    .line 64
    .line 65
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 66
    .line 67
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 68
    .line 69
    .line 70
    const-string p0, "isFirstGivenGift"

    .line 71
    .line 72
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 73
    .line 74
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 75
    .line 76
    .line 77
    const-string p0, "nextValidTime"

    .line 78
    .line 79
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 80
    .line 81
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 82
    .line 83
    .line 84
    const-string p0, "luckyPrizeGiftInfoGiftItemId"

    .line 85
    .line 86
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 87
    .line 88
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    const-string p0, "giftSource"

    .line 92
    .line 93
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_3

    .line 101
    .line 102
    const-string v0, "interactStatus"

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 108
    .line 109
    const/4 v0, 0x1

    .line 110
    if-eqz p0, :cond_4

    .line 111
    .line 112
    const-string p0, "interactRules"

    .line 113
    .line 114
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 120
    .line 121
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 122
    .line 123
    .line 124
    :cond_4
    const-string p0, "enableComboEffect"

    .line 125
    .line 126
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 127
    .line 128
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_5

    .line 134
    .line 135
    const-string v1, "expiredTimeText"

    .line 136
    .line 137
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 141
    .line 142
    if-eqz p0, :cond_6

    .line 143
    .line 144
    const-string p0, "videoEffectExtras"

    .line 145
    .line 146
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 150
    .line 151
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 152
    .line 153
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 154
    .line 155
    .line 156
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 157
    .line 158
    if-eqz p0, :cond_7

    .line 159
    .line 160
    const-string p0, "giftSetInfo"

    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 166
    .line 167
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 168
    .line 169
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 170
    .line 171
    .line 172
    :cond_7
    const-string p0, "isGear"

    .line 173
    .line 174
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 175
    .line 176
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 177
    .line 178
    .line 179
    const-string p0, "canShowPreviewText"

    .line 180
    .line 181
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 182
    .line 183
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz p0, :cond_8

    .line 189
    .line 190
    const-string v1, "previewText"

    .line 191
    .line 192
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    :cond_8
    const-string p0, "gearPercent"

    .line 196
    .line 197
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 198
    .line 199
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 200
    .line 201
    .line 202
    const-string p0, "canShowGearPercent"

    .line 203
    .line 204
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 205
    .line 206
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 207
    .line 208
    .line 209
    const-string p0, "threshold"

    .line 210
    .line 211
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 212
    .line 213
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 214
    .line 215
    .line 216
    const-string p0, "step"

    .line 217
    .line 218
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 219
    .line 220
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 221
    .line 222
    .line 223
    const-string p0, "canBoomGearPercent"

    .line 224
    .line 225
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 226
    .line 227
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 231
    .line 232
    if-eqz p0, :cond_9

    .line 233
    .line 234
    const-string p0, "gearPercentInfo"

    .line 235
    .line 236
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 240
    .line 241
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 242
    .line 243
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 244
    .line 245
    .line 246
    :cond_9
    const-string p0, "isAnimationWithStarCombo"

    .line 247
    .line 248
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 249
    .line 250
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 251
    .line 252
    .line 253
    const-string p0, "canResetGearPercent"

    .line 254
    .line 255
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 256
    .line 257
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 258
    .line 259
    .line 260
    const-string p0, "nextGearCnt"

    .line 261
    .line 262
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 263
    .line 264
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 265
    .line 266
    .line 267
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 268
    .line 269
    if-eqz p0, :cond_a

    .line 270
    .line 271
    const-string v1, "tag"

    .line 272
    .line 273
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 277
    .line 278
    if-eqz p0, :cond_b

    .line 279
    .line 280
    const-string p0, "discounts"

    .line 281
    .line 282
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 286
    .line 287
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 288
    .line 289
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 290
    .line 291
    .line 292
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 293
    .line 294
    if-eqz p0, :cond_c

    .line 295
    .line 296
    const-string v1, "startTagColor"

    .line 297
    .line 298
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 302
    .line 303
    if-eqz p0, :cond_d

    .line 304
    .line 305
    const-string v1, "endTagColor"

    .line 306
    .line 307
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    :cond_d
    const-string p0, "canStay"

    .line 311
    .line 312
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 313
    .line 314
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 315
    .line 316
    .line 317
    const-string p0, "isDailyPaymentExceeded"

    .line 318
    .line 319
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 320
    .line 321
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 322
    .line 323
    .line 324
    const-string p0, "isNamed"

    .line 325
    .line 326
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 327
    .line 328
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 329
    .line 330
    .line 331
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 332
    .line 333
    if-eqz p0, :cond_e

    .line 334
    .line 335
    const-string p0, "tray"

    .line 336
    .line 337
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 341
    .line 342
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 343
    .line 344
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 345
    .line 346
    .line 347
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 348
    .line 349
    if-eqz p0, :cond_f

    .line 350
    .line 351
    const-string p0, "flyMicInfo"

    .line 352
    .line 353
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    .line 358
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 359
    .line 360
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 361
    .line 362
    .line 363
    :cond_f
    const-string p0, "lotteryGiftId"

    .line 364
    .line 365
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 366
    .line 367
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 368
    .line 369
    .line 370
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 371
    .line 372
    if-eqz p0, :cond_10

    .line 373
    .line 374
    const-string v0, "avatarTag"

    .line 375
    .line 376
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 380
    .line 381
    if-eqz p0, :cond_11

    .line 382
    .line 383
    const-string p1, "giftBottomTag"

    .line 384
    .line 385
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
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

    .line 389
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
