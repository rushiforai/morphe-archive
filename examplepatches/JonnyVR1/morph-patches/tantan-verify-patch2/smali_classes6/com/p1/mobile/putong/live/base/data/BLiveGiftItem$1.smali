.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
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
    const-string p0, "longPressText"

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
    const/16 v2, 0x37

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "animationType"

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
    const/16 v2, 0x36

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
    const/16 v2, 0x35

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "localTag"

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
    const/16 v2, 0x34

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "luckyPrizeGiftInfos"

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
    const/16 v2, 0x33

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "tagTextColor"

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
    const/16 v2, 0x32

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "startRightTagColor"

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
    const/16 v2, 0x31

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "localRightTag"

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
    const/16 v2, 0x30

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "longPressGotoWidth"

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
    const/16 v2, 0x2f

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "videoType"

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
    const/16 v2, 0x2e

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "mobileVibration"

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
    const/16 v2, 0x2d

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "diamondPrice"

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
    const/16 v2, 0x2c

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "nextValidTime"

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
    const/16 v2, 0x2b

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "giftType"

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
    const/16 v2, 0x2a

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "hidePrice"

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
    const/16 v2, 0x29

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "giftLevel"

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
    const/16 v2, 0x28

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "combosDuration"

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
    const/16 v2, 0x27

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "showAnimRules"

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
    const/16 v2, 0x26

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "version"

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
    const/16 v2, 0x25

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "longPressGotoHeight"

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
    const/16 v2, 0x24

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "longPressGotoLocation"

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
    const/16 v2, 0x23

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "interactStatus"

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
    const/16 v2, 0x22

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "giftSource"

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
    const/16 v2, 0x21

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "hdUrl"

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
    const/16 v2, 0x20

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "name"

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
    const/16 v2, 0x1f

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "gear"

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
    const/16 v2, 0x1e

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "url"

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
    const/16 v2, 0x1d

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "tag"

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
    const/16 v2, 0x1c

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "id"

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
    const/16 v2, 0x1b

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "trayDuration"

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
    const/16 v2, 0x1a

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "generationDuration"

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
    const/16 v2, 0x19

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "expiredTime"

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
    const/16 v2, 0x18

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "discounts"

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
    const/16 v2, 0x17

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "expiredTimeText"

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
    const/16 v2, 0x16

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "fastGiftNum"

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
    const/16 v2, 0x15

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "dynamicUrl"

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
    goto/16 :goto_0

    .line 515
    .line 516
    :cond_23
    const/16 v2, 0x14

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string p0, "longPressGotoUrl"

    .line 521
    .line 522
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result p0

    .line 526
    if-nez p0, :cond_24

    .line 527
    .line 528
    goto/16 :goto_0

    .line 529
    .line 530
    :cond_24
    const/16 v2, 0x13

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string p0, "unitPrice"

    .line 535
    .line 536
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    move-result p0

    .line 540
    if-nez p0, :cond_25

    .line 541
    .line 542
    goto/16 :goto_0

    .line 543
    .line 544
    :cond_25
    const/16 v2, 0x12

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string p0, "createdTime"

    .line 549
    .line 550
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    move-result p0

    .line 554
    if-nez p0, :cond_26

    .line 555
    .line 556
    goto/16 :goto_0

    .line 557
    .line 558
    :cond_26
    const/16 v2, 0x11

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string p0, "rightTagTextColor"

    .line 563
    .line 564
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    move-result p0

    .line 568
    if-nez p0, :cond_27

    .line 569
    .line 570
    goto/16 :goto_0

    .line 571
    .line 572
    :cond_27
    const/16 v2, 0x10

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string p0, "startTagColor"

    .line 577
    .line 578
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 579
    .line 580
    .line 581
    move-result p0

    .line 582
    if-nez p0, :cond_28

    .line 583
    .line 584
    goto/16 :goto_0

    .line 585
    .line 586
    :cond_28
    const/16 v2, 0xf

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string p0, "showOutside"

    .line 591
    .line 592
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    move-result p0

    .line 596
    if-nez p0, :cond_29

    .line 597
    .line 598
    goto/16 :goto_0

    .line 599
    .line 600
    :cond_29
    const/16 v2, 0xe

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string p0, "nameStatus"

    .line 605
    .line 606
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    move-result p0

    .line 610
    if-nez p0, :cond_2a

    .line 611
    .line 612
    goto/16 :goto_0

    .line 613
    .line 614
    :cond_2a
    const/16 v2, 0xd

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string p0, "status"

    .line 619
    .line 620
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    move-result p0

    .line 624
    if-nez p0, :cond_2b

    .line 625
    .line 626
    goto/16 :goto_0

    .line 627
    .line 628
    :cond_2b
    const/16 v2, 0xc

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_2c
    const-string p0, "remain"

    .line 633
    .line 634
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 635
    .line 636
    .line 637
    move-result p0

    .line 638
    if-nez p0, :cond_2c

    .line 639
    .line 640
    goto/16 :goto_0

    .line 641
    .line 642
    :cond_2c
    const/16 v2, 0xb

    .line 643
    .line 644
    goto/16 :goto_0

    .line 645
    .line 646
    :sswitch_2d
    const-string p0, "labels"

    .line 647
    .line 648
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    move-result p0

    .line 652
    if-nez p0, :cond_2d

    .line 653
    .line 654
    goto/16 :goto_0

    .line 655
    .line 656
    :cond_2d
    const/16 v2, 0xa

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_2e
    const-string p0, "localName"

    .line 661
    .line 662
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    move-result p0

    .line 666
    if-nez p0, :cond_2e

    .line 667
    .line 668
    goto/16 :goto_0

    .line 669
    .line 670
    :cond_2e
    const/16 v2, 0x9

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_2f
    const-string p0, "purchasePrice"

    .line 675
    .line 676
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 677
    .line 678
    .line 679
    move-result p0

    .line 680
    if-nez p0, :cond_2f

    .line 681
    .line 682
    goto/16 :goto_0

    .line 683
    .line 684
    :cond_2f
    const/16 v2, 0x8

    .line 685
    .line 686
    goto/16 :goto_0

    .line 687
    .line 688
    :sswitch_30
    const-string p0, "rightTag"

    .line 689
    .line 690
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 691
    .line 692
    .line 693
    move-result p0

    .line 694
    if-nez p0, :cond_30

    .line 695
    .line 696
    goto :goto_0

    .line 697
    :cond_30
    const/4 v2, 0x7

    .line 698
    goto :goto_0

    .line 699
    :sswitch_31
    const-string p0, "minWealthHierarchy"

    .line 700
    .line 701
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 702
    .line 703
    .line 704
    move-result p0

    .line 705
    if-nez p0, :cond_31

    .line 706
    .line 707
    goto :goto_0

    .line 708
    :cond_31
    const/4 v2, 0x6

    .line 709
    goto :goto_0

    .line 710
    :sswitch_32
    const-string p0, "flyMicInfo"

    .line 711
    .line 712
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 713
    .line 714
    .line 715
    move-result p0

    .line 716
    if-nez p0, :cond_32

    .line 717
    .line 718
    goto :goto_0

    .line 719
    :cond_32
    const/4 v2, 0x5

    .line 720
    goto :goto_0

    .line 721
    :sswitch_33
    const-string p0, "interactRules"

    .line 722
    .line 723
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 724
    .line 725
    .line 726
    move-result p0

    .line 727
    if-nez p0, :cond_33

    .line 728
    .line 729
    goto :goto_0

    .line 730
    :cond_33
    const/4 v2, 0x4

    .line 731
    goto :goto_0

    .line 732
    :sswitch_34
    const-string p0, "slotGiftInfo"

    .line 733
    .line 734
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 735
    .line 736
    .line 737
    move-result p0

    .line 738
    if-nez p0, :cond_34

    .line 739
    .line 740
    goto :goto_0

    .line 741
    :cond_34
    const/4 v2, 0x3

    .line 742
    goto :goto_0

    .line 743
    :sswitch_35
    const-string p0, "liveResourceId"

    .line 744
    .line 745
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 746
    .line 747
    .line 748
    move-result p0

    .line 749
    if-nez p0, :cond_35

    .line 750
    .line 751
    goto :goto_0

    .line 752
    :cond_35
    const/4 v2, 0x2

    .line 753
    goto :goto_0

    .line 754
    :sswitch_36
    const-string p0, "endRightTagColor"

    .line 755
    .line 756
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 757
    .line 758
    .line 759
    move-result p0

    .line 760
    if-nez p0, :cond_36

    .line 761
    .line 762
    goto :goto_0

    .line 763
    :cond_36
    move v2, v1

    .line 764
    goto :goto_0

    .line 765
    :sswitch_37
    const-string p0, "subtitle"

    .line 766
    .line 767
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 768
    .line 769
    .line 770
    move-result p0

    .line 771
    if-nez p0, :cond_37

    .line 772
    .line 773
    goto :goto_0

    .line 774
    :cond_37
    move v2, v0

    .line 775
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 776
    .line 777
    .line 778
    return v0

    .line 779
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 780
    .line 781
    .line 782
    move-result-object p0

    .line 783
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 784
    .line 785
    return v1

    .line 786
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 787
    .line 788
    .line 789
    move-result-object p0

    .line 790
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 791
    .line 792
    return v1

    .line 793
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object p0

    .line 797
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 798
    .line 799
    return v1

    .line 800
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 801
    .line 802
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    move-result-object p0

    .line 806
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;

    .line 807
    .line 808
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 809
    .line 810
    return v1

    .line 811
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 812
    .line 813
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 814
    .line 815
    .line 816
    move-result-object p0

    .line 817
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 818
    .line 819
    return v1

    .line 820
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 821
    .line 822
    .line 823
    move-result-object p0

    .line 824
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 825
    .line 826
    return v1

    .line 827
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 828
    .line 829
    .line 830
    move-result-object p0

    .line 831
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 832
    .line 833
    return v1

    .line 834
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 835
    .line 836
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 837
    .line 838
    .line 839
    move-result-object p0

    .line 840
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;

    .line 841
    .line 842
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 843
    .line 844
    return v1

    .line 845
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 846
    .line 847
    .line 848
    move-result-wide p2

    .line 849
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 850
    .line 851
    return v1

    .line 852
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 853
    .line 854
    .line 855
    move-result p0

    .line 856
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 857
    .line 858
    return v1

    .line 859
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 860
    .line 861
    .line 862
    move-result p0

    .line 863
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 864
    .line 865
    return v1

    .line 866
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 867
    .line 868
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 869
    .line 870
    .line 871
    move-result-object p0

    .line 872
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 873
    .line 874
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 875
    .line 876
    return v1

    .line 877
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 878
    .line 879
    .line 880
    move-result-wide p2

    .line 881
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 882
    .line 883
    return v1

    .line 884
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 885
    .line 886
    .line 887
    move-result-object p0

    .line 888
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 889
    .line 890
    return v1

    .line 891
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 892
    .line 893
    .line 894
    move-result p0

    .line 895
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 896
    .line 897
    return v1

    .line 898
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 899
    .line 900
    .line 901
    move-result p0

    .line 902
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 903
    .line 904
    return v1

    .line 905
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 906
    .line 907
    .line 908
    move-result-wide p2

    .line 909
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 910
    .line 911
    return v1

    .line 912
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 913
    .line 914
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 915
    .line 916
    .line 917
    move-result-object p0

    .line 918
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 919
    .line 920
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 921
    .line 922
    return v1

    .line 923
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 924
    .line 925
    .line 926
    move-result-wide p2

    .line 927
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 928
    .line 929
    return v1

    .line 930
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 931
    .line 932
    .line 933
    move-result-wide p2

    .line 934
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 935
    .line 936
    return v1

    .line 937
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 938
    .line 939
    .line 940
    move-result p0

    .line 941
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 942
    .line 943
    return v1

    .line 944
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 945
    .line 946
    .line 947
    move-result-object p0

    .line 948
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 949
    .line 950
    return v1

    .line 951
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 952
    .line 953
    .line 954
    move-result p0

    .line 955
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 956
    .line 957
    return v1

    .line 958
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 959
    .line 960
    .line 961
    move-result-object p0

    .line 962
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 963
    .line 964
    return v1

    .line 965
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 966
    .line 967
    .line 968
    move-result-object p0

    .line 969
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 970
    .line 971
    return v1

    .line 972
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 973
    .line 974
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 975
    .line 976
    .line 977
    move-result-object p0

    .line 978
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 979
    .line 980
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 981
    .line 982
    return v1

    .line 983
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 984
    .line 985
    .line 986
    move-result-object p0

    .line 987
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 988
    .line 989
    return v1

    .line 990
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 991
    .line 992
    .line 993
    move-result-object p0

    .line 994
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 995
    .line 996
    return v1

    .line 997
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 998
    .line 999
    .line 1000
    move-result p0

    .line 1001
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 1002
    .line 1003
    return v0

    .line 1004
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1005
    .line 1006
    .line 1007
    move-result-wide p2

    .line 1008
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 1009
    .line 1010
    return v1

    .line 1011
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1012
    .line 1013
    .line 1014
    move-result-wide p2

    .line 1015
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 1016
    .line 1017
    return v1

    .line 1018
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1019
    .line 1020
    .line 1021
    move-result-wide p2

    .line 1022
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 1023
    .line 1024
    return v1

    .line 1025
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1026
    .line 1027
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1028
    .line 1029
    .line 1030
    move-result-object p0

    .line 1031
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 1032
    .line 1033
    return v1

    .line 1034
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1035
    .line 1036
    .line 1037
    move-result-object p0

    .line 1038
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 1039
    .line 1040
    return v1

    .line 1041
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1042
    .line 1043
    .line 1044
    move-result p0

    .line 1045
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 1046
    .line 1047
    return v1

    .line 1048
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1049
    .line 1050
    .line 1051
    move-result-object p0

    .line 1052
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 1053
    .line 1054
    return v1

    .line 1055
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1056
    .line 1057
    .line 1058
    move-result-object p0

    .line 1059
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 1060
    .line 1061
    return v1

    .line 1062
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1063
    .line 1064
    .line 1065
    move-result-wide p2

    .line 1066
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 1067
    .line 1068
    return v1

    .line 1069
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1070
    .line 1071
    .line 1072
    move-result-wide p2

    .line 1073
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 1074
    .line 1075
    return v1

    .line 1076
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1077
    .line 1078
    .line 1079
    move-result-object p0

    .line 1080
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 1081
    .line 1082
    return v1

    .line 1083
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1084
    .line 1085
    .line 1086
    move-result-object p0

    .line 1087
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 1088
    .line 1089
    return v1

    .line 1090
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1091
    .line 1092
    .line 1093
    move-result p0

    .line 1094
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 1095
    .line 1096
    return v1

    .line 1097
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1098
    .line 1099
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1100
    .line 1101
    .line 1102
    move-result-object p0

    .line 1103
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 1104
    .line 1105
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 1106
    .line 1107
    return v1

    .line 1108
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1109
    .line 1110
    .line 1111
    move-result-object p0

    .line 1112
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 1113
    .line 1114
    return v1

    .line 1115
    :pswitch_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1116
    .line 1117
    .line 1118
    move-result p0

    .line 1119
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 1120
    .line 1121
    return v1

    .line 1122
    :pswitch_2d
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1123
    .line 1124
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1125
    .line 1126
    .line 1127
    move-result-object p0

    .line 1128
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 1129
    .line 1130
    return v1

    .line 1131
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1132
    .line 1133
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1134
    .line 1135
    .line 1136
    move-result-object p0

    .line 1137
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;

    .line 1138
    .line 1139
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 1140
    .line 1141
    return v1

    .line 1142
    :pswitch_2f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1143
    .line 1144
    .line 1145
    move-result-wide p2

    .line 1146
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 1147
    .line 1148
    return v1

    .line 1149
    :pswitch_30
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1150
    .line 1151
    .line 1152
    move-result-object p0

    .line 1153
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 1154
    .line 1155
    return v1

    .line 1156
    :pswitch_31
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1157
    .line 1158
    .line 1159
    move-result p0

    .line 1160
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 1161
    .line 1162
    return v1

    .line 1163
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1164
    .line 1165
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1166
    .line 1167
    .line 1168
    move-result-object p0

    .line 1169
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 1170
    .line 1171
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 1172
    .line 1173
    return v1

    .line 1174
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1175
    .line 1176
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1177
    .line 1178
    .line 1179
    move-result-object p0

    .line 1180
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 1181
    .line 1182
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 1183
    .line 1184
    return v1

    .line 1185
    :pswitch_34
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1186
    .line 1187
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1188
    .line 1189
    .line 1190
    move-result-object p0

    .line 1191
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 1192
    .line 1193
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 1194
    .line 1195
    return v1

    .line 1196
    :pswitch_35
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1197
    .line 1198
    .line 1199
    move-result-object p0

    .line 1200
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 1201
    .line 1202
    return v1

    .line 1203
    :pswitch_36
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1204
    .line 1205
    .line 1206
    move-result-object p0

    .line 1207
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 1208
    .line 1209
    return v1

    .line 1210
    :pswitch_37
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1211
    .line 1212
    .line 1213
    move-result-object p0

    .line 1214
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 1215
    .line 1216
    return v1

    .line 1217
    :sswitch_data_0
    .sparse-switch
        -0x7ad0b3e8 -> :sswitch_37
        -0x731162f6 -> :sswitch_36
        -0x71f7a82b -> :sswitch_35
        -0x696765e4 -> :sswitch_34
        -0x62d1cb9f -> :sswitch_33
        -0x626d485e -> :sswitch_32
        -0x5be4cbaa -> :sswitch_31
        -0x55990022 -> :sswitch_30
        -0x4fbc4b38 -> :sswitch_2f
        -0x47d8df6a -> :sswitch_2e
        -0x422fa001 -> :sswitch_2d
        -0x37b53d94 -> :sswitch_2c
        -0x3532300e -> :sswitch_2b
        -0x2c9b1da3 -> :sswitch_2a
        -0x2ac9f418 -> :sswitch_29
        -0x27802995 -> :sswitch_28
        -0x203ab808 -> :sswitch_27
        -0x1d336e2b -> :sswitch_26
        -0x1cfac5db -> :sswitch_25
        -0x113a601b -> :sswitch_24
        -0x11036f50 -> :sswitch_23
        -0xb6c23c6 -> :sswitch_22
        -0x9b40c21 -> :sswitch_21
        -0x739ccae -> :sswitch_20
        -0x583ac6e -> :sswitch_1f
        -0x4f73d34 -> :sswitch_1e
        -0x45e7116 -> :sswitch_1d
        0xd1b -> :sswitch_1c
        0x1bf9a -> :sswitch_1b
        0x1c56f -> :sswitch_1a
        0x30598f -> :sswitch_19
        0x337a8b -> :sswitch_18
        0x5e84ed3 -> :sswitch_17
        0x99e196b -> :sswitch_16
        0xa3a51c8 -> :sswitch_15
        0xe3fdeff -> :sswitch_14
        0x10e41af1 -> :sswitch_13
        0x14f51cd8 -> :sswitch_12
        0x1b9e8ae9 -> :sswitch_11
        0x1d793d59 -> :sswitch_10
        0x20f08034 -> :sswitch_f
        0x320ddd27 -> :sswitch_e
        0x32a0548a -> :sswitch_d
        0x37242f36 -> :sswitch_c
        0x38fa5455 -> :sswitch_b
        0x4ba21810 -> :sswitch_a
        0x4f736255 -> :sswitch_9
        0x53f542bc -> :sswitch_8
        0x54b2a869 -> :sswitch_7
        0x667294e3 -> :sswitch_6
        0x68c07bbc -> :sswitch_5
        0x6ea3274b -> :sswitch_4
        0x714bac2f -> :sswitch_3
        0x754b11e4 -> :sswitch_2
        0x7911bcde -> :sswitch_1
        0x7a5668f4 -> :sswitch_0
    .end sparse-switch

    .line 1218
    .line 1219
    .line 1220
    .line 1221
    .line 1222
    .line 1223
    .line 1224
    .line 1225
    .line 1226
    .line 1227
    .line 1228
    .line 1229
    .line 1230
    .line 1231
    .line 1232
    .line 1233
    .line 1234
    .line 1235
    .line 1236
    .line 1237
    .line 1238
    .line 1239
    .line 1240
    .line 1241
    .line 1242
    .line 1243
    .line 1244
    .line 1245
    .line 1246
    .line 1247
    .line 1248
    .line 1249
    .line 1250
    .line 1251
    .line 1252
    .line 1253
    .line 1254
    .line 1255
    .line 1256
    .line 1257
    .line 1258
    .line 1259
    .line 1260
    .line 1261
    .line 1262
    .line 1263
    .line 1264
    .line 1265
    .line 1266
    .line 1267
    .line 1268
    .line 1269
    .line 1270
    .line 1271
    .line 1272
    .line 1273
    .line 1274
    .line 1275
    .line 1276
    .line 1277
    .line 1278
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
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

    .line 1217
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V
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
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string v0, "giftType"

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "name"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "localName"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string v1, "url"

    .line 48
    .line 49
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    const-string p0, "unitPrice"

    .line 53
    .line 54
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 55
    .line 56
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 57
    .line 58
    .line 59
    const-string p0, "purchasePrice"

    .line 60
    .line 61
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 62
    .line 63
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string v1, "status"

    .line 71
    .line 72
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const-string v1, "tag"

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 85
    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    const-string p0, "localTag"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 96
    .line 97
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 98
    .line 99
    .line 100
    :cond_6
    const-string p0, "giftLevel"

    .line 101
    .line 102
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 103
    .line 104
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    const-string p0, "combosDuration"

    .line 108
    .line 109
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 110
    .line 111
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 112
    .line 113
    .line 114
    const-string p0, "fastGiftNum"

    .line 115
    .line 116
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 117
    .line 118
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    const-string p0, "version"

    .line 122
    .line 123
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 124
    .line 125
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_7

    .line 131
    .line 132
    const-string v1, "startTagColor"

    .line 133
    .line 134
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz p0, :cond_8

    .line 140
    .line 141
    const-string v1, "endTagColor"

    .line 142
    .line 143
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string v1, "tagTextColor"

    .line 151
    .line 152
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    const-string p0, "trayDuration"

    .line 156
    .line 157
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 158
    .line 159
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 160
    .line 161
    .line 162
    const-string p0, "giftSource"

    .line 163
    .line 164
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 165
    .line 166
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 167
    .line 168
    .line 169
    const-string p0, "remain"

    .line 170
    .line 171
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 172
    .line 173
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 174
    .line 175
    .line 176
    const-string p0, "expiredTime"

    .line 177
    .line 178
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 179
    .line 180
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 181
    .line 182
    .line 183
    const-string p0, "mobileVibration"

    .line 184
    .line 185
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 186
    .line 187
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 188
    .line 189
    .line 190
    const-string p0, "nextValidTime"

    .line 191
    .line 192
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 193
    .line 194
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 195
    .line 196
    .line 197
    const-string p0, "showOutside"

    .line 198
    .line 199
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 200
    .line 201
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 202
    .line 203
    .line 204
    const-string p0, "generationDuration"

    .line 205
    .line 206
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 207
    .line 208
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 209
    .line 210
    .line 211
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 212
    .line 213
    if-eqz p0, :cond_a

    .line 214
    .line 215
    const-string v1, "longPressText"

    .line 216
    .line 217
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 221
    .line 222
    if-eqz p0, :cond_b

    .line 223
    .line 224
    const-string v1, "longPressGotoUrl"

    .line 225
    .line 226
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_b
    const-string p0, "minWealthHierarchy"

    .line 230
    .line 231
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 232
    .line 233
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 234
    .line 235
    .line 236
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 237
    .line 238
    if-eqz p0, :cond_c

    .line 239
    .line 240
    const-string p0, "luckyPrizeGiftInfos"

    .line 241
    .line 242
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 246
    .line 247
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 248
    .line 249
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 250
    .line 251
    .line 252
    :cond_c
    const-string p0, "longPressGotoLocation"

    .line 253
    .line 254
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 255
    .line 256
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 257
    .line 258
    .line 259
    const-string p0, "longPressGotoHeight"

    .line 260
    .line 261
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 262
    .line 263
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 264
    .line 265
    .line 266
    const-string p0, "longPressGotoWidth"

    .line 267
    .line 268
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 269
    .line 270
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 271
    .line 272
    .line 273
    const-string p0, "createdTime"

    .line 274
    .line 275
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 276
    .line 277
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 278
    .line 279
    .line 280
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz p0, :cond_d

    .line 283
    .line 284
    const-string v1, "liveResourceId"

    .line 285
    .line 286
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 290
    .line 291
    if-eqz p0, :cond_e

    .line 292
    .line 293
    const-string v1, "interactStatus"

    .line 294
    .line 295
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 299
    .line 300
    if-eqz p0, :cond_f

    .line 301
    .line 302
    const-string p0, "interactRules"

    .line 303
    .line 304
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 308
    .line 309
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 310
    .line 311
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 312
    .line 313
    .line 314
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 315
    .line 316
    if-eqz p0, :cond_10

    .line 317
    .line 318
    const-string v1, "subtitle"

    .line 319
    .line 320
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 324
    .line 325
    if-eqz p0, :cond_11

    .line 326
    .line 327
    const-string v1, "expiredTimeText"

    .line 328
    .line 329
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 333
    .line 334
    if-eqz p0, :cond_12

    .line 335
    .line 336
    const-string v1, "animationType"

    .line 337
    .line 338
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 342
    .line 343
    if-eqz p0, :cond_13

    .line 344
    .line 345
    const-string p0, "labels"

    .line 346
    .line 347
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 351
    .line 352
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 353
    .line 354
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 355
    .line 356
    .line 357
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 358
    .line 359
    if-eqz p0, :cond_14

    .line 360
    .line 361
    const-string p0, "showAnimRules"

    .line 362
    .line 363
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 367
    .line 368
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 369
    .line 370
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 371
    .line 372
    .line 373
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 374
    .line 375
    if-eqz p0, :cond_15

    .line 376
    .line 377
    const-string p0, "slotGiftInfo"

    .line 378
    .line 379
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    .line 384
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 385
    .line 386
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 387
    .line 388
    .line 389
    :cond_15
    const-string p0, "videoType"

    .line 390
    .line 391
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 392
    .line 393
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 394
    .line 395
    .line 396
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 397
    .line 398
    if-eqz p0, :cond_16

    .line 399
    .line 400
    const-string v1, "hdUrl"

    .line 401
    .line 402
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 406
    .line 407
    if-eqz p0, :cond_17

    .line 408
    .line 409
    const-string p0, "gear"

    .line 410
    .line 411
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 415
    .line 416
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 417
    .line 418
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 419
    .line 420
    .line 421
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 422
    .line 423
    if-eqz p0, :cond_18

    .line 424
    .line 425
    const-string p0, "discounts"

    .line 426
    .line 427
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 431
    .line 432
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 433
    .line 434
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 435
    .line 436
    .line 437
    :cond_18
    const-string p0, "hidePrice"

    .line 438
    .line 439
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 440
    .line 441
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 442
    .line 443
    .line 444
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 445
    .line 446
    if-eqz p0, :cond_19

    .line 447
    .line 448
    const-string p0, "nameStatus"

    .line 449
    .line 450
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 454
    .line 455
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 456
    .line 457
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 458
    .line 459
    .line 460
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 461
    .line 462
    if-eqz p0, :cond_1a

    .line 463
    .line 464
    const-string v1, "dynamicUrl"

    .line 465
    .line 466
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 470
    .line 471
    if-eqz p0, :cond_1b

    .line 472
    .line 473
    const-string v1, "rightTag"

    .line 474
    .line 475
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 479
    .line 480
    if-eqz p0, :cond_1c

    .line 481
    .line 482
    const-string p0, "localRightTag"

    .line 483
    .line 484
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    sget-object p0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 488
    .line 489
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 490
    .line 491
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 492
    .line 493
    .line 494
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 495
    .line 496
    if-eqz p0, :cond_1d

    .line 497
    .line 498
    const-string v1, "startRightTagColor"

    .line 499
    .line 500
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 504
    .line 505
    if-eqz p0, :cond_1e

    .line 506
    .line 507
    const-string v1, "endRightTagColor"

    .line 508
    .line 509
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 513
    .line 514
    if-eqz p0, :cond_1f

    .line 515
    .line 516
    const-string v1, "rightTagTextColor"

    .line 517
    .line 518
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    .line 520
    .line 521
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 522
    .line 523
    if-eqz p0, :cond_20

    .line 524
    .line 525
    const-string p0, "diamondPrice"

    .line 526
    .line 527
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 531
    .line 532
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 533
    .line 534
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 535
    .line 536
    .line 537
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 538
    .line 539
    if-eqz p0, :cond_21

    .line 540
    .line 541
    const-string p0, "flyMicInfo"

    .line 542
    .line 543
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 547
    .line 548
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 549
    .line 550
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 551
    .line 552
    .line 553
    :cond_21
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 554
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
