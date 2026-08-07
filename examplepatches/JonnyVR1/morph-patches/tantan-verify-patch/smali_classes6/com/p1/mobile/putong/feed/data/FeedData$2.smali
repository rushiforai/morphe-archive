.class Lcom/p1/mobile/putong/feed/data/FeedData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/FeedData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/FeedData;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/FeedData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/FeedData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedData$2;->newInstance()Lcom/p1/mobile/putong/feed/data/FeedData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/FeedData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/FeedData;",
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
    const-string p0, "activities"

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
    const/16 v2, 0x36

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "location"

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
    const/16 v2, 0x35

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "momentExtras"

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
    const/16 v2, 0x34

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "momentLevelCounters"

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
    const/16 v2, 0x33

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "literatures"

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
    const/16 v2, 0x32

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "voiceLiveMomentFeeds"

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
    const/16 v2, 0x31

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "followships"

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
    const/16 v2, 0x30

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "stickers"

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
    const/16 v2, 0x2f

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "voiceLiveGames"

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
    const/16 v2, 0x2e

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "popWindows"

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
    const/16 v2, 0x2d

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "moments"

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
    const/16 v2, 0x2c

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "literaturesComments"

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
    const/16 v2, 0x2b

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "momentLevelGuides"

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
    const/16 v2, 0x2a

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "topicOperations"

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
    const/16 v2, 0x29

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "liveSchemas"

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
    const/16 v2, 0x28

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "fakeUserStates"

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
    const/16 v2, 0x27

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "cameraCategories"

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
    const/16 v2, 0x26

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "liveLabels"

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
    const/16 v2, 0x25

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "liveCircleMomentExtInfos"

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
    const/16 v2, 0x24

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "guideStatePostConfig"

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
    const/16 v2, 0x23

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "musicCategories"

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
    const/16 v2, 0x22

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "momentSettings"

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
    const/16 v2, 0x21

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "myMeetFeeds"

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
    const/16 v2, 0x20

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "cameraStickers"

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
    const/16 v2, 0x1f

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "momentVoiceLiveInfos"

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
    const/16 v2, 0x1e

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "paginationWithTopic"

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
    const/16 v2, 0x1d

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "liveGroupCircleMomentBanners"

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
    const/16 v2, 0x1c

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "rooms"

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
    const/16 v2, 0x1b

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "dynamic_moments"

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
    const/16 v2, 0x1a

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "meets"

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
    const/16 v2, 0x19

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "masks"

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
    const/16 v2, 0x18

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "lives"

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
    const/16 v2, 0x17

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "feeds"

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
    const/16 v2, 0x16

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "extra"

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
    const/16 v2, 0x15

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "board"

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
    const/16 v2, 0x14

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "nearbyWindow"

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
    const/16 v2, 0x13

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string p0, "liveRecommendCards"

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
    const/16 v2, 0x12

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string p0, "messages"

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
    const/16 v2, 0x11

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string p0, "comments"

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
    const/16 v2, 0x10

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string p0, "momentPopWindows"

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
    const/16 v2, 0xf

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string p0, "states"

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
    const/16 v2, 0xe

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string p0, "musics"

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
    const/16 v2, 0xd

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string p0, "groups"

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
    const/16 v2, 0xc

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string p0, "frames"

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
    const/16 v2, 0xb

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_2c
    const-string p0, "greetingPermissions"

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
    const/16 v2, 0xa

    .line 643
    .line 644
    goto/16 :goto_0

    .line 645
    .line 646
    :sswitch_2d
    const-string p0, "detect"

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
    const/16 v2, 0x9

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_2e
    const-string p0, "sourceCatCount"

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
    const/16 v2, 0x8

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_2f
    const-string p0, "voiceRooms"

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
    goto :goto_0

    .line 683
    :cond_2f
    const/4 v2, 0x7

    .line 684
    goto :goto_0

    .line 685
    :sswitch_30
    const-string p0, "voiceLives"

    .line 686
    .line 687
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    move-result p0

    .line 691
    if-nez p0, :cond_30

    .line 692
    .line 693
    goto :goto_0

    .line 694
    :cond_30
    const/4 v2, 0x6

    .line 695
    goto :goto_0

    .line 696
    :sswitch_31
    const-string p0, "notifyUsers"

    .line 697
    .line 698
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 699
    .line 700
    .line 701
    move-result p0

    .line 702
    if-nez p0, :cond_31

    .line 703
    .line 704
    goto :goto_0

    .line 705
    :cond_31
    const/4 v2, 0x5

    .line 706
    goto :goto_0

    .line 707
    :sswitch_32
    const-string p0, "voiceLiveStates"

    .line 708
    .line 709
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 710
    .line 711
    .line 712
    move-result p0

    .line 713
    if-nez p0, :cond_32

    .line 714
    .line 715
    goto :goto_0

    .line 716
    :cond_32
    const/4 v2, 0x4

    .line 717
    goto :goto_0

    .line 718
    :sswitch_33
    const-string p0, "momentViewer"

    .line 719
    .line 720
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 721
    .line 722
    .line 723
    move-result p0

    .line 724
    if-nez p0, :cond_33

    .line 725
    .line 726
    goto :goto_0

    .line 727
    :cond_33
    const/4 v2, 0x3

    .line 728
    goto :goto_0

    .line 729
    :sswitch_34
    const-string p0, "momentTopics"

    .line 730
    .line 731
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 732
    .line 733
    .line 734
    move-result p0

    .line 735
    if-nez p0, :cond_34

    .line 736
    .line 737
    goto :goto_0

    .line 738
    :cond_34
    const/4 v2, 0x2

    .line 739
    goto :goto_0

    .line 740
    :sswitch_35
    const-string p0, "cameraFilters"

    .line 741
    .line 742
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 743
    .line 744
    .line 745
    move-result p0

    .line 746
    if-nez p0, :cond_35

    .line 747
    .line 748
    goto :goto_0

    .line 749
    :cond_35
    move v2, v1

    .line 750
    goto :goto_0

    .line 751
    :sswitch_36
    const-string p0, "topicCategories"

    .line 752
    .line 753
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 754
    .line 755
    .line 756
    move-result p0

    .line 757
    if-nez p0, :cond_36

    .line 758
    .line 759
    goto :goto_0

    .line 760
    :cond_36
    move v2, v0

    .line 761
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 762
    .line 763
    .line 764
    return v0

    .line 765
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 766
    .line 767
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 768
    .line 769
    .line 770
    move-result-object p0

    .line 771
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 772
    .line 773
    return v1

    .line 774
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PoiLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 775
    .line 776
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 777
    .line 778
    .line 779
    move-result-object p0

    .line 780
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 781
    .line 782
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 783
    .line 784
    return v1

    .line 785
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 786
    .line 787
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 788
    .line 789
    .line 790
    move-result-object p0

    .line 791
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 792
    .line 793
    return v1

    .line 794
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 795
    .line 796
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 797
    .line 798
    .line 799
    move-result-object p0

    .line 800
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 801
    .line 802
    return v1

    .line 803
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 804
    .line 805
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 806
    .line 807
    .line 808
    move-result-object p0

    .line 809
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 810
    .line 811
    return v1

    .line 812
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 813
    .line 814
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 815
    .line 816
    .line 817
    move-result-object p0

    .line 818
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 819
    .line 820
    return v1

    .line 821
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/Followship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 822
    .line 823
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 824
    .line 825
    .line 826
    move-result-object p0

    .line 827
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 828
    .line 829
    return v1

    .line 830
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/StickerInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 831
    .line 832
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 833
    .line 834
    .line 835
    move-result-object p0

    .line 836
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 837
    .line 838
    return v1

    .line 839
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 840
    .line 841
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 842
    .line 843
    .line 844
    move-result-object p0

    .line 845
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 846
    .line 847
    return v1

    .line 848
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 849
    .line 850
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 851
    .line 852
    .line 853
    move-result-object p0

    .line 854
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 855
    .line 856
    return v1

    .line 857
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 858
    .line 859
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 860
    .line 861
    .line 862
    move-result-object p0

    .line 863
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 864
    .line 865
    return v1

    .line 866
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 867
    .line 868
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 869
    .line 870
    .line 871
    move-result-object p0

    .line 872
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 873
    .line 874
    return v1

    .line 875
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 876
    .line 877
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 878
    .line 879
    .line 880
    move-result-object p0

    .line 881
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 882
    .line 883
    return v1

    .line 884
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 885
    .line 886
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 887
    .line 888
    .line 889
    move-result-object p0

    .line 890
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 891
    .line 892
    return v1

    .line 893
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 894
    .line 895
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 896
    .line 897
    .line 898
    move-result-object p0

    .line 899
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 900
    .line 901
    return v1

    .line 902
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 903
    .line 904
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 905
    .line 906
    .line 907
    move-result-object p0

    .line 908
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 909
    .line 910
    return v1

    .line 911
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 912
    .line 913
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 914
    .line 915
    .line 916
    move-result-object p0

    .line 917
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 918
    .line 919
    return v1

    .line 920
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 921
    .line 922
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 923
    .line 924
    .line 925
    move-result-object p0

    .line 926
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 927
    .line 928
    return v1

    .line 929
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 930
    .line 931
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 932
    .line 933
    .line 934
    move-result-object p0

    .line 935
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 936
    .line 937
    return v1

    .line 938
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 939
    .line 940
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 941
    .line 942
    .line 943
    move-result-object p0

    .line 944
    check-cast p0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 945
    .line 946
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 947
    .line 948
    return v1

    .line 949
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 950
    .line 951
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 952
    .line 953
    .line 954
    move-result-object p0

    .line 955
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 956
    .line 957
    return v1

    .line 958
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 959
    .line 960
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 961
    .line 962
    .line 963
    move-result-object p0

    .line 964
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 965
    .line 966
    return v1

    .line 967
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 968
    .line 969
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 970
    .line 971
    .line 972
    move-result-object p0

    .line 973
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 974
    .line 975
    return v1

    .line 976
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 977
    .line 978
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 979
    .line 980
    .line 981
    move-result-object p0

    .line 982
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 983
    .line 984
    return v1

    .line 985
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 986
    .line 987
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 988
    .line 989
    .line 990
    move-result-object p0

    .line 991
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 992
    .line 993
    return v1

    .line 994
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 995
    .line 996
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 997
    .line 998
    .line 999
    move-result-object p0

    .line 1000
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 1001
    .line 1002
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 1003
    .line 1004
    return v1

    .line 1005
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1006
    .line 1007
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1008
    .line 1009
    .line 1010
    move-result-object p0

    .line 1011
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 1012
    .line 1013
    return v1

    .line 1014
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/Room;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1015
    .line 1016
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1017
    .line 1018
    .line 1019
    move-result-object p0

    .line 1020
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 1021
    .line 1022
    return v1

    .line 1023
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1024
    .line 1025
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1026
    .line 1027
    .line 1028
    move-result-object p0

    .line 1029
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 1030
    .line 1031
    return v1

    .line 1032
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Meet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1033
    .line 1034
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1035
    .line 1036
    .line 1037
    move-result-object p0

    .line 1038
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 1039
    .line 1040
    return v1

    .line 1041
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/data/LiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1042
    .line 1043
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1044
    .line 1045
    .line 1046
    move-result-object p0

    .line 1047
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 1048
    .line 1049
    return v1

    .line 1050
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1051
    .line 1052
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1053
    .line 1054
    .line 1055
    move-result-object p0

    .line 1056
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 1057
    .line 1058
    return v1

    .line 1059
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1060
    .line 1061
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1062
    .line 1063
    .line 1064
    move-result-object p0

    .line 1065
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 1066
    .line 1067
    return v1

    .line 1068
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Extra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1069
    .line 1070
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1071
    .line 1072
    .line 1073
    move-result-object p0

    .line 1074
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1075
    .line 1076
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1077
    .line 1078
    return v1

    .line 1079
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/feed/data/RankingBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1080
    .line 1081
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1082
    .line 1083
    .line 1084
    move-result-object p0

    .line 1085
    check-cast p0, Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 1086
    .line 1087
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 1088
    .line 1089
    return v1

    .line 1090
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1091
    .line 1092
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1093
    .line 1094
    .line 1095
    move-result-object p0

    .line 1096
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 1097
    .line 1098
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 1099
    .line 1100
    return v1

    .line 1101
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1102
    .line 1103
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1104
    .line 1105
    .line 1106
    move-result-object p0

    .line 1107
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 1108
    .line 1109
    return v1

    .line 1110
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1111
    .line 1112
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1113
    .line 1114
    .line 1115
    move-result-object p0

    .line 1116
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 1117
    .line 1118
    return v1

    .line 1119
    :pswitch_26
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1120
    .line 1121
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1122
    .line 1123
    .line 1124
    move-result-object p0

    .line 1125
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 1126
    .line 1127
    return v1

    .line 1128
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1129
    .line 1130
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1131
    .line 1132
    .line 1133
    move-result-object p0

    .line 1134
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 1135
    .line 1136
    return v1

    .line 1137
    :pswitch_28
    sget-object p0, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1138
    .line 1139
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1140
    .line 1141
    .line 1142
    move-result-object p0

    .line 1143
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 1144
    .line 1145
    return v1

    .line 1146
    :pswitch_29
    sget-object p0, Lcom/p1/mobile/putong/data/Music;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1147
    .line 1148
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1149
    .line 1150
    .line 1151
    move-result-object p0

    .line 1152
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 1153
    .line 1154
    return v1

    .line 1155
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Group;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1156
    .line 1157
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1158
    .line 1159
    .line 1160
    move-result-object p0

    .line 1161
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 1162
    .line 1163
    return v1

    .line 1164
    :pswitch_2b
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Frame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1165
    .line 1166
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1167
    .line 1168
    .line 1169
    move-result-object p0

    .line 1170
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 1171
    .line 1172
    return v1

    .line 1173
    :pswitch_2c
    sget-object p0, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1174
    .line 1175
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1176
    .line 1177
    .line 1178
    move-result-object p0

    .line 1179
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 1180
    .line 1181
    return v1

    .line 1182
    :pswitch_2d
    sget-object p0, Lcom/p1/mobile/putong/feed/data/DetectInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1183
    .line 1184
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1185
    .line 1186
    .line 1187
    move-result-object p0

    .line 1188
    check-cast p0, Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 1189
    .line 1190
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 1191
    .line 1192
    return v1

    .line 1193
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1194
    .line 1195
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1196
    .line 1197
    .line 1198
    move-result-object p0

    .line 1199
    check-cast p0, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 1200
    .line 1201
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 1202
    .line 1203
    return v1

    .line 1204
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1205
    .line 1206
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1207
    .line 1208
    .line 1209
    move-result-object p0

    .line 1210
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 1211
    .line 1212
    return v1

    .line 1213
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1214
    .line 1215
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1216
    .line 1217
    .line 1218
    move-result-object p0

    .line 1219
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 1220
    .line 1221
    return v1

    .line 1222
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1223
    .line 1224
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1225
    .line 1226
    .line 1227
    move-result-object p0

    .line 1228
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 1229
    .line 1230
    return v1

    .line 1231
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1232
    .line 1233
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1234
    .line 1235
    .line 1236
    move-result-object p0

    .line 1237
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 1238
    .line 1239
    return v1

    .line 1240
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1241
    .line 1242
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1243
    .line 1244
    .line 1245
    move-result-object p0

    .line 1246
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1247
    .line 1248
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1249
    .line 1250
    return v1

    .line 1251
    :pswitch_34
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1252
    .line 1253
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1254
    .line 1255
    .line 1256
    move-result-object p0

    .line 1257
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 1258
    .line 1259
    return v1

    .line 1260
    :pswitch_35
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CameraFilter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1261
    .line 1262
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1263
    .line 1264
    .line 1265
    move-result-object p0

    .line 1266
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 1267
    .line 1268
    return v1

    .line 1269
    :pswitch_36
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1270
    .line 1271
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1272
    .line 1273
    .line 1274
    move-result-object p0

    .line 1275
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 1276
    .line 1277
    return v1

    .line 1278
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7faf7f55 -> :sswitch_36
        -0x7f966aea -> :sswitch_35
        -0x773238bc -> :sswitch_34
        -0x7421dfce -> :sswitch_33
        -0x6f558f20 -> :sswitch_32
        -0x686bd3c1 -> :sswitch_31
        -0x5b5b750b -> :sswitch_30
        -0x5b04471a -> :sswitch_2f
        -0x501e27ec -> :sswitch_2e
        -0x4f95d95d -> :sswitch_2d
        -0x4ec41175 -> :sswitch_2c
        -0x4b7d7b5a -> :sswitch_2b
        -0x49c2262c -> :sswitch_2a
        -0x3f592912 -> :sswitch_29
        -0x353231fe -> :sswitch_28
        -0x2cdfa6ee -> :sswitch_27
        -0x23e8220c -> :sswitch_26
        -0x1b8afeb4 -> :sswitch_25
        -0xab393ed -> :sswitch_24
        0x252d74f -> :sswitch_23
        0x598eee6 -> :sswitch_22
        0x5c79410 -> :sswitch_21
        0x5ccce95 -> :sswitch_20
        0x6236d07 -> :sswitch_1f
        0x62dd707 -> :sswitch_1e
        0x62f750c -> :sswitch_1d
        0x64d1673 -> :sswitch_1c
        0x67a9af8 -> :sswitch_1b
        0x6c93dc4 -> :sswitch_1a
        0xf7e8d8f -> :sswitch_19
        0x10fa8907 -> :sswitch_18
        0x1311511b -> :sswitch_17
        0x19541242 -> :sswitch_16
        0x1b0aa243 -> :sswitch_15
        0x220c6621 -> :sswitch_14
        0x227894d7 -> :sswitch_13
        0x26b7de00 -> :sswitch_12
        0x26e29c0b -> :sswitch_11
        0x2888fb21 -> :sswitch_10
        0x292eaee2 -> :sswitch_f
        0x2b7ac466 -> :sswitch_e
        0x3349127b -> :sswitch_d
        0x3776df7b -> :sswitch_c
        0x490bb556 -> :sswitch_b
        0x49a0be73 -> :sswitch_a
        0x4ff97af2 -> :sswitch_9
        0x568dbc23 -> :sswitch_8
        0x5b4c1ed6 -> :sswitch_7
        0x603ed8a6 -> :sswitch_6
        0x62a81457 -> :sswitch_5
        0x6819d542 -> :sswitch_4
        0x6d60937b -> :sswitch_3
        0x6fb5dc83 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7a1b3bed -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 1279
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/FeedData$2;->parseField(Lcom/p1/mobile/putong/feed/data/FeedData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/FeedData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/FeedData;",
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

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "activities"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0x36

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "location"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x35

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "momentExtras"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0x34

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "momentLevelCounters"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x33

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "literatures"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0x32

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "voiceLiveMomentFeeds"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0x31

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "followships"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0x30

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "stickers"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0x2f

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "voiceLiveGames"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0x2e

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "popWindows"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0x2d

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "moments"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    const/16 v2, 0x2c

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "literaturesComments"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_b

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    const/16 v2, 0x2b

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "momentLevelGuides"

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    const/16 v2, 0x2a

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "topicOperations"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_d
    const/16 v2, 0x29

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "liveSchemas"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_e

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_e
    const/16 v2, 0x28

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "fakeUserStates"

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_f

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_f
    const/16 v2, 0x27

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "cameraCategories"

    .line 240
    .line 241
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-nez v0, :cond_10

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_10
    const/16 v2, 0x26

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "liveLabels"

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_11

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_11
    const/16 v2, 0x25

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "liveCircleMomentExtInfos"

    .line 268
    .line 269
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_12

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_12
    const/16 v2, 0x24

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "guideStatePostConfig"

    .line 282
    .line 283
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_13

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_13
    const/16 v2, 0x23

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "musicCategories"

    .line 296
    .line 297
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_14

    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_14
    const/16 v2, 0x22

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "momentSettings"

    .line 310
    .line 311
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_15

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :cond_15
    const/16 v2, 0x21

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "myMeetFeeds"

    .line 324
    .line 325
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-nez v0, :cond_16

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :cond_16
    const/16 v2, 0x20

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "cameraStickers"

    .line 338
    .line 339
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_17

    .line 344
    .line 345
    goto/16 :goto_0

    .line 346
    .line 347
    :cond_17
    const/16 v2, 0x1f

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "momentVoiceLiveInfos"

    .line 352
    .line 353
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-nez v0, :cond_18

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :cond_18
    const/16 v2, 0x1e

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "paginationWithTopic"

    .line 366
    .line 367
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    if-nez v0, :cond_19

    .line 372
    .line 373
    goto/16 :goto_0

    .line 374
    .line 375
    :cond_19
    const/16 v2, 0x1d

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_1a
    const-string v0, "liveGroupCircleMomentBanners"

    .line 380
    .line 381
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-nez v0, :cond_1a

    .line 386
    .line 387
    goto/16 :goto_0

    .line 388
    .line 389
    :cond_1a
    const/16 v2, 0x1c

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_1b
    const-string v0, "rooms"

    .line 394
    .line 395
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-nez v0, :cond_1b

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :cond_1b
    const/16 v2, 0x1b

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_1c
    const-string v0, "dynamic_moments"

    .line 408
    .line 409
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    if-nez v0, :cond_1c

    .line 414
    .line 415
    goto/16 :goto_0

    .line 416
    .line 417
    :cond_1c
    const/16 v2, 0x1a

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_1d
    const-string v0, "meets"

    .line 422
    .line 423
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    if-nez v0, :cond_1d

    .line 428
    .line 429
    goto/16 :goto_0

    .line 430
    .line 431
    :cond_1d
    const/16 v2, 0x19

    .line 432
    .line 433
    goto/16 :goto_0

    .line 434
    .line 435
    :sswitch_1e
    const-string v0, "masks"

    .line 436
    .line 437
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_1e

    .line 442
    .line 443
    goto/16 :goto_0

    .line 444
    .line 445
    :cond_1e
    const/16 v2, 0x18

    .line 446
    .line 447
    goto/16 :goto_0

    .line 448
    .line 449
    :sswitch_1f
    const-string v0, "lives"

    .line 450
    .line 451
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    if-nez v0, :cond_1f

    .line 456
    .line 457
    goto/16 :goto_0

    .line 458
    .line 459
    :cond_1f
    const/16 v2, 0x17

    .line 460
    .line 461
    goto/16 :goto_0

    .line 462
    .line 463
    :sswitch_20
    const-string v0, "feeds"

    .line 464
    .line 465
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-nez v0, :cond_20

    .line 470
    .line 471
    goto/16 :goto_0

    .line 472
    .line 473
    :cond_20
    const/16 v2, 0x16

    .line 474
    .line 475
    goto/16 :goto_0

    .line 476
    .line 477
    :sswitch_21
    const-string v0, "extra"

    .line 478
    .line 479
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-nez v0, :cond_21

    .line 484
    .line 485
    goto/16 :goto_0

    .line 486
    .line 487
    :cond_21
    const/16 v2, 0x15

    .line 488
    .line 489
    goto/16 :goto_0

    .line 490
    .line 491
    :sswitch_22
    const-string v0, "board"

    .line 492
    .line 493
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-nez v0, :cond_22

    .line 498
    .line 499
    goto/16 :goto_0

    .line 500
    .line 501
    :cond_22
    const/16 v2, 0x14

    .line 502
    .line 503
    goto/16 :goto_0

    .line 504
    .line 505
    :sswitch_23
    const-string v0, "nearbyWindow"

    .line 506
    .line 507
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v0

    .line 511
    if-nez v0, :cond_23

    .line 512
    .line 513
    goto/16 :goto_0

    .line 514
    .line 515
    :cond_23
    const/16 v2, 0x13

    .line 516
    .line 517
    goto/16 :goto_0

    .line 518
    .line 519
    :sswitch_24
    const-string v0, "liveRecommendCards"

    .line 520
    .line 521
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 522
    .line 523
    .line 524
    move-result v0

    .line 525
    if-nez v0, :cond_24

    .line 526
    .line 527
    goto/16 :goto_0

    .line 528
    .line 529
    :cond_24
    const/16 v2, 0x12

    .line 530
    .line 531
    goto/16 :goto_0

    .line 532
    .line 533
    :sswitch_25
    const-string v0, "messages"

    .line 534
    .line 535
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 536
    .line 537
    .line 538
    move-result v0

    .line 539
    if-nez v0, :cond_25

    .line 540
    .line 541
    goto/16 :goto_0

    .line 542
    .line 543
    :cond_25
    const/16 v2, 0x11

    .line 544
    .line 545
    goto/16 :goto_0

    .line 546
    .line 547
    :sswitch_26
    const-string v0, "comments"

    .line 548
    .line 549
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    move-result v0

    .line 553
    if-nez v0, :cond_26

    .line 554
    .line 555
    goto/16 :goto_0

    .line 556
    .line 557
    :cond_26
    const/16 v2, 0x10

    .line 558
    .line 559
    goto/16 :goto_0

    .line 560
    .line 561
    :sswitch_27
    const-string v0, "momentPopWindows"

    .line 562
    .line 563
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    move-result v0

    .line 567
    if-nez v0, :cond_27

    .line 568
    .line 569
    goto/16 :goto_0

    .line 570
    .line 571
    :cond_27
    const/16 v2, 0xf

    .line 572
    .line 573
    goto/16 :goto_0

    .line 574
    .line 575
    :sswitch_28
    const-string v0, "states"

    .line 576
    .line 577
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 578
    .line 579
    .line 580
    move-result v0

    .line 581
    if-nez v0, :cond_28

    .line 582
    .line 583
    goto/16 :goto_0

    .line 584
    .line 585
    :cond_28
    const/16 v2, 0xe

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :sswitch_29
    const-string v0, "musics"

    .line 590
    .line 591
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 592
    .line 593
    .line 594
    move-result v0

    .line 595
    if-nez v0, :cond_29

    .line 596
    .line 597
    goto/16 :goto_0

    .line 598
    .line 599
    :cond_29
    const/16 v2, 0xd

    .line 600
    .line 601
    goto/16 :goto_0

    .line 602
    .line 603
    :sswitch_2a
    const-string v0, "groups"

    .line 604
    .line 605
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 606
    .line 607
    .line 608
    move-result v0

    .line 609
    if-nez v0, :cond_2a

    .line 610
    .line 611
    goto/16 :goto_0

    .line 612
    .line 613
    :cond_2a
    const/16 v2, 0xc

    .line 614
    .line 615
    goto/16 :goto_0

    .line 616
    .line 617
    :sswitch_2b
    const-string v0, "frames"

    .line 618
    .line 619
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    move-result v0

    .line 623
    if-nez v0, :cond_2b

    .line 624
    .line 625
    goto/16 :goto_0

    .line 626
    .line 627
    :cond_2b
    const/16 v2, 0xb

    .line 628
    .line 629
    goto/16 :goto_0

    .line 630
    .line 631
    :sswitch_2c
    const-string v0, "greetingPermissions"

    .line 632
    .line 633
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 634
    .line 635
    .line 636
    move-result v0

    .line 637
    if-nez v0, :cond_2c

    .line 638
    .line 639
    goto/16 :goto_0

    .line 640
    .line 641
    :cond_2c
    const/16 v2, 0xa

    .line 642
    .line 643
    goto/16 :goto_0

    .line 644
    .line 645
    :sswitch_2d
    const-string v0, "detect"

    .line 646
    .line 647
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    move-result v0

    .line 651
    if-nez v0, :cond_2d

    .line 652
    .line 653
    goto/16 :goto_0

    .line 654
    .line 655
    :cond_2d
    const/16 v2, 0x9

    .line 656
    .line 657
    goto/16 :goto_0

    .line 658
    .line 659
    :sswitch_2e
    const-string v0, "sourceCatCount"

    .line 660
    .line 661
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 662
    .line 663
    .line 664
    move-result v0

    .line 665
    if-nez v0, :cond_2e

    .line 666
    .line 667
    goto/16 :goto_0

    .line 668
    .line 669
    :cond_2e
    const/16 v2, 0x8

    .line 670
    .line 671
    goto/16 :goto_0

    .line 672
    .line 673
    :sswitch_2f
    const-string v0, "voiceRooms"

    .line 674
    .line 675
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    move-result v0

    .line 679
    if-nez v0, :cond_2f

    .line 680
    .line 681
    goto :goto_0

    .line 682
    :cond_2f
    const/4 v2, 0x7

    .line 683
    goto :goto_0

    .line 684
    :sswitch_30
    const-string v0, "voiceLives"

    .line 685
    .line 686
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 687
    .line 688
    .line 689
    move-result v0

    .line 690
    if-nez v0, :cond_30

    .line 691
    .line 692
    goto :goto_0

    .line 693
    :cond_30
    const/4 v2, 0x6

    .line 694
    goto :goto_0

    .line 695
    :sswitch_31
    const-string v0, "notifyUsers"

    .line 696
    .line 697
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 698
    .line 699
    .line 700
    move-result v0

    .line 701
    if-nez v0, :cond_31

    .line 702
    .line 703
    goto :goto_0

    .line 704
    :cond_31
    const/4 v2, 0x5

    .line 705
    goto :goto_0

    .line 706
    :sswitch_32
    const-string v0, "voiceLiveStates"

    .line 707
    .line 708
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 709
    .line 710
    .line 711
    move-result v0

    .line 712
    if-nez v0, :cond_32

    .line 713
    .line 714
    goto :goto_0

    .line 715
    :cond_32
    const/4 v2, 0x4

    .line 716
    goto :goto_0

    .line 717
    :sswitch_33
    const-string v0, "momentViewer"

    .line 718
    .line 719
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    move-result v0

    .line 723
    if-nez v0, :cond_33

    .line 724
    .line 725
    goto :goto_0

    .line 726
    :cond_33
    const/4 v2, 0x3

    .line 727
    goto :goto_0

    .line 728
    :sswitch_34
    const-string v0, "momentTopics"

    .line 729
    .line 730
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 731
    .line 732
    .line 733
    move-result v0

    .line 734
    if-nez v0, :cond_34

    .line 735
    .line 736
    goto :goto_0

    .line 737
    :cond_34
    const/4 v2, 0x2

    .line 738
    goto :goto_0

    .line 739
    :sswitch_35
    const-string v0, "cameraFilters"

    .line 740
    .line 741
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 742
    .line 743
    .line 744
    move-result v0

    .line 745
    if-nez v0, :cond_35

    .line 746
    .line 747
    goto :goto_0

    .line 748
    :cond_35
    move v2, v1

    .line 749
    goto :goto_0

    .line 750
    :sswitch_36
    const-string v0, "topicCategories"

    .line 751
    .line 752
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 753
    .line 754
    .line 755
    move-result v0

    .line 756
    if-nez v0, :cond_36

    .line 757
    .line 758
    goto :goto_0

    .line 759
    :cond_36
    const/4 v2, 0x0

    .line 760
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 761
    .line 762
    .line 763
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 764
    .line 765
    .line 766
    move-result p0

    .line 767
    return p0

    .line 768
    :pswitch_0
    return v1

    .line 769
    :sswitch_data_0
    .sparse-switch
        -0x7faf7f55 -> :sswitch_36
        -0x7f966aea -> :sswitch_35
        -0x773238bc -> :sswitch_34
        -0x7421dfce -> :sswitch_33
        -0x6f558f20 -> :sswitch_32
        -0x686bd3c1 -> :sswitch_31
        -0x5b5b750b -> :sswitch_30
        -0x5b04471a -> :sswitch_2f
        -0x501e27ec -> :sswitch_2e
        -0x4f95d95d -> :sswitch_2d
        -0x4ec41175 -> :sswitch_2c
        -0x4b7d7b5a -> :sswitch_2b
        -0x49c2262c -> :sswitch_2a
        -0x3f592912 -> :sswitch_29
        -0x353231fe -> :sswitch_28
        -0x2cdfa6ee -> :sswitch_27
        -0x23e8220c -> :sswitch_26
        -0x1b8afeb4 -> :sswitch_25
        -0xab393ed -> :sswitch_24
        0x252d74f -> :sswitch_23
        0x598eee6 -> :sswitch_22
        0x5c79410 -> :sswitch_21
        0x5ccce95 -> :sswitch_20
        0x6236d07 -> :sswitch_1f
        0x62dd707 -> :sswitch_1e
        0x62f750c -> :sswitch_1d
        0x64d1673 -> :sswitch_1c
        0x67a9af8 -> :sswitch_1b
        0x6c93dc4 -> :sswitch_1a
        0xf7e8d8f -> :sswitch_19
        0x10fa8907 -> :sswitch_18
        0x1311511b -> :sswitch_17
        0x19541242 -> :sswitch_16
        0x1b0aa243 -> :sswitch_15
        0x220c6621 -> :sswitch_14
        0x227894d7 -> :sswitch_13
        0x26b7de00 -> :sswitch_12
        0x26e29c0b -> :sswitch_11
        0x2888fb21 -> :sswitch_10
        0x292eaee2 -> :sswitch_f
        0x2b7ac466 -> :sswitch_e
        0x3349127b -> :sswitch_d
        0x3776df7b -> :sswitch_c
        0x490bb556 -> :sswitch_b
        0x49a0be73 -> :sswitch_a
        0x4ff97af2 -> :sswitch_9
        0x568dbc23 -> :sswitch_8
        0x5b4c1ed6 -> :sswitch_7
        0x603ed8a6 -> :sswitch_6
        0x62a81457 -> :sswitch_5
        0x6819d542 -> :sswitch_4
        0x6d60937b -> :sswitch_3
        0x6fb5dc83 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7a1b3bed -> :sswitch_0
    .end sparse-switch

    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    .line 864
    .line 865
    .line 866
    .line 867
    .line 868
    .line 869
    .line 870
    .line 871
    .line 872
    .line 873
    .line 874
    .line 875
    .line 876
    .line 877
    .line 878
    .line 879
    .line 880
    .line 881
    .line 882
    .line 883
    .line 884
    .line 885
    .line 886
    .line 887
    .line 888
    .line 889
    .line 890
    .line 891
    .line 892
    .line 893
    .line 894
    .line 895
    .line 896
    .line 897
    .line 898
    .line 899
    .line 900
    .line 901
    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    .line 907
    .line 908
    .line 909
    .line 910
    .line 911
    .line 912
    .line 913
    .line 914
    .line 915
    .line 916
    .line 917
    .line 918
    .line 919
    .line 920
    .line 921
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 769
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/FeedData$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/FeedData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "cameraFilters"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraFilter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string p0, "cameraStickers"

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string p0, "musicCategories"

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    .line 46
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string p0, "musics"

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/data/Music;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    .line 62
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const-string p0, "cameraCategories"

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 77
    .line 78
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const-string p0, "moments"

    .line 86
    .line 87
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 93
    .line 94
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 98
    .line 99
    if-eqz p0, :cond_6

    .line 100
    .line 101
    const-string p0, "dynamic_moments"

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 109
    .line 110
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 114
    .line 115
    if-eqz p0, :cond_7

    .line 116
    .line 117
    const-string p0, "activities"

    .line 118
    .line 119
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 123
    .line 124
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    .line 126
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 130
    .line 131
    if-eqz p0, :cond_8

    .line 132
    .line 133
    const-string p0, "feeds"

    .line 134
    .line 135
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 139
    .line 140
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 141
    .line 142
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 143
    .line 144
    .line 145
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 146
    .line 147
    if-eqz p0, :cond_9

    .line 148
    .line 149
    const-string p0, "momentTopics"

    .line 150
    .line 151
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 157
    .line 158
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 159
    .line 160
    .line 161
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 162
    .line 163
    if-eqz p0, :cond_a

    .line 164
    .line 165
    const-string p0, "rooms"

    .line 166
    .line 167
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 171
    .line 172
    sget-object v0, Lcom/p1/mobile/putong/data/Room;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 173
    .line 174
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 175
    .line 176
    .line 177
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 178
    .line 179
    if-eqz p0, :cond_b

    .line 180
    .line 181
    const-string p0, "voiceLives"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 187
    .line 188
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 189
    .line 190
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 191
    .line 192
    .line 193
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 194
    .line 195
    if-eqz p0, :cond_c

    .line 196
    .line 197
    const-string p0, "voiceRooms"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 203
    .line 204
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 205
    .line 206
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 207
    .line 208
    .line 209
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 210
    .line 211
    if-eqz p0, :cond_d

    .line 212
    .line 213
    const-string p0, "lives"

    .line 214
    .line 215
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 219
    .line 220
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 221
    .line 222
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 223
    .line 224
    .line 225
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 226
    .line 227
    if-eqz p0, :cond_e

    .line 228
    .line 229
    const-string p0, "followships"

    .line 230
    .line 231
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 235
    .line 236
    sget-object v0, Lcom/p1/mobile/putong/data/Followship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 237
    .line 238
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 239
    .line 240
    .line 241
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 242
    .line 243
    const/4 v0, 0x1

    .line 244
    if-eqz p0, :cond_f

    .line 245
    .line 246
    const-string p0, "extra"

    .line 247
    .line 248
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Extra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 254
    .line 255
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 256
    .line 257
    .line 258
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 259
    .line 260
    if-eqz p0, :cond_10

    .line 261
    .line 262
    const-string p0, "greetingPermissions"

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 268
    .line 269
    sget-object v1, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 270
    .line 271
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 272
    .line 273
    .line 274
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 275
    .line 276
    if-eqz p0, :cond_11

    .line 277
    .line 278
    const-string p0, "liveLabels"

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 284
    .line 285
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 286
    .line 287
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 288
    .line 289
    .line 290
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 291
    .line 292
    if-eqz p0, :cond_12

    .line 293
    .line 294
    const-string p0, "messages"

    .line 295
    .line 296
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 300
    .line 301
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 302
    .line 303
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 304
    .line 305
    .line 306
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 307
    .line 308
    if-eqz p0, :cond_13

    .line 309
    .line 310
    const-string p0, "comments"

    .line 311
    .line 312
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 316
    .line 317
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 318
    .line 319
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 320
    .line 321
    .line 322
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 323
    .line 324
    if-eqz p0, :cond_14

    .line 325
    .line 326
    const-string p0, "voiceLiveGames"

    .line 327
    .line 328
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 332
    .line 333
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 334
    .line 335
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 336
    .line 337
    .line 338
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 339
    .line 340
    if-eqz p0, :cond_15

    .line 341
    .line 342
    const-string p0, "masks"

    .line 343
    .line 344
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 348
    .line 349
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 352
    .line 353
    .line 354
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 355
    .line 356
    if-eqz p0, :cond_16

    .line 357
    .line 358
    const-string p0, "momentSettings"

    .line 359
    .line 360
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 364
    .line 365
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 366
    .line 367
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 368
    .line 369
    .line 370
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 371
    .line 372
    if-eqz p0, :cond_17

    .line 373
    .line 374
    const-string p0, "topicCategories"

    .line 375
    .line 376
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 380
    .line 381
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 382
    .line 383
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 384
    .line 385
    .line 386
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 387
    .line 388
    if-eqz p0, :cond_18

    .line 389
    .line 390
    const-string p0, "voiceLiveMomentFeeds"

    .line 391
    .line 392
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 396
    .line 397
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 398
    .line 399
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 400
    .line 401
    .line 402
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 403
    .line 404
    if-eqz p0, :cond_19

    .line 405
    .line 406
    const-string p0, "topicOperations"

    .line 407
    .line 408
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 412
    .line 413
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 414
    .line 415
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 416
    .line 417
    .line 418
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 419
    .line 420
    if-eqz p0, :cond_1a

    .line 421
    .line 422
    const-string p0, "frames"

    .line 423
    .line 424
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 428
    .line 429
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Frame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 430
    .line 431
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 432
    .line 433
    .line 434
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 435
    .line 436
    if-eqz p0, :cond_1b

    .line 437
    .line 438
    const-string p0, "myMeetFeeds"

    .line 439
    .line 440
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 444
    .line 445
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 446
    .line 447
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 448
    .line 449
    .line 450
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 451
    .line 452
    if-eqz p0, :cond_1c

    .line 453
    .line 454
    const-string p0, "detect"

    .line 455
    .line 456
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    sget-object p0, Lcom/p1/mobile/putong/feed/data/DetectInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    .line 461
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 462
    .line 463
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 464
    .line 465
    .line 466
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 467
    .line 468
    if-eqz p0, :cond_1d

    .line 469
    .line 470
    const-string p0, "board"

    .line 471
    .line 472
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    sget-object p0, Lcom/p1/mobile/putong/feed/data/RankingBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 476
    .line 477
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 478
    .line 479
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 480
    .line 481
    .line 482
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 483
    .line 484
    if-eqz p0, :cond_1e

    .line 485
    .line 486
    const-string p0, "paginationWithTopic"

    .line 487
    .line 488
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    .line 493
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 494
    .line 495
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 496
    .line 497
    .line 498
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 499
    .line 500
    if-eqz p0, :cond_1f

    .line 501
    .line 502
    const-string p0, "momentExtras"

    .line 503
    .line 504
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 508
    .line 509
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 510
    .line 511
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 512
    .line 513
    .line 514
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 515
    .line 516
    if-eqz p0, :cond_20

    .line 517
    .line 518
    const-string p0, "states"

    .line 519
    .line 520
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 524
    .line 525
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 526
    .line 527
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 528
    .line 529
    .line 530
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 531
    .line 532
    if-eqz p0, :cond_21

    .line 533
    .line 534
    const-string p0, "liveRecommendCards"

    .line 535
    .line 536
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 540
    .line 541
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 542
    .line 543
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 544
    .line 545
    .line 546
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 547
    .line 548
    if-eqz p0, :cond_22

    .line 549
    .line 550
    const-string p0, "liveSchemas"

    .line 551
    .line 552
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 556
    .line 557
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 558
    .line 559
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 560
    .line 561
    .line 562
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 563
    .line 564
    if-eqz p0, :cond_23

    .line 565
    .line 566
    const-string p0, "groups"

    .line 567
    .line 568
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 572
    .line 573
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Group;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 574
    .line 575
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 576
    .line 577
    .line 578
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 579
    .line 580
    if-eqz p0, :cond_24

    .line 581
    .line 582
    const-string p0, "momentLevelGuides"

    .line 583
    .line 584
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 588
    .line 589
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 590
    .line 591
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 592
    .line 593
    .line 594
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 595
    .line 596
    if-eqz p0, :cond_25

    .line 597
    .line 598
    const-string p0, "momentLevelCounters"

    .line 599
    .line 600
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 601
    .line 602
    .line 603
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 604
    .line 605
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 606
    .line 607
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 608
    .line 609
    .line 610
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 611
    .line 612
    if-eqz p0, :cond_26

    .line 613
    .line 614
    const-string p0, "literaturesComments"

    .line 615
    .line 616
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 620
    .line 621
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 622
    .line 623
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 624
    .line 625
    .line 626
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 627
    .line 628
    if-eqz p0, :cond_27

    .line 629
    .line 630
    const-string p0, "literatures"

    .line 631
    .line 632
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 633
    .line 634
    .line 635
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 636
    .line 637
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 638
    .line 639
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 640
    .line 641
    .line 642
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 643
    .line 644
    if-eqz p0, :cond_28

    .line 645
    .line 646
    const-string p0, "momentVoiceLiveInfos"

    .line 647
    .line 648
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 649
    .line 650
    .line 651
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 652
    .line 653
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 654
    .line 655
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 656
    .line 657
    .line 658
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 659
    .line 660
    if-eqz p0, :cond_29

    .line 661
    .line 662
    const-string p0, "meets"

    .line 663
    .line 664
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 665
    .line 666
    .line 667
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 668
    .line 669
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Meet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 670
    .line 671
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 672
    .line 673
    .line 674
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 675
    .line 676
    if-eqz p0, :cond_2a

    .line 677
    .line 678
    const-string p0, "sourceCatCount"

    .line 679
    .line 680
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 681
    .line 682
    .line 683
    sget-object p0, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 684
    .line 685
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 686
    .line 687
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 688
    .line 689
    .line 690
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 691
    .line 692
    if-eqz p0, :cond_2b

    .line 693
    .line 694
    const-string p0, "voiceLiveStates"

    .line 695
    .line 696
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 697
    .line 698
    .line 699
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 700
    .line 701
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 702
    .line 703
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 704
    .line 705
    .line 706
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 707
    .line 708
    if-eqz p0, :cond_2c

    .line 709
    .line 710
    const-string p0, "momentViewer"

    .line 711
    .line 712
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 713
    .line 714
    .line 715
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 716
    .line 717
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 718
    .line 719
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 720
    .line 721
    .line 722
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 723
    .line 724
    if-eqz p0, :cond_2d

    .line 725
    .line 726
    const-string p0, "notifyUsers"

    .line 727
    .line 728
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 729
    .line 730
    .line 731
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 732
    .line 733
    sget-object v1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 734
    .line 735
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 736
    .line 737
    .line 738
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 739
    .line 740
    if-eqz p0, :cond_2e

    .line 741
    .line 742
    const-string p0, "fakeUserStates"

    .line 743
    .line 744
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 745
    .line 746
    .line 747
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 748
    .line 749
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 750
    .line 751
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 752
    .line 753
    .line 754
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 755
    .line 756
    if-eqz p0, :cond_2f

    .line 757
    .line 758
    const-string p0, "liveCircleMomentExtInfos"

    .line 759
    .line 760
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 761
    .line 762
    .line 763
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 764
    .line 765
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 766
    .line 767
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 768
    .line 769
    .line 770
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 771
    .line 772
    if-eqz p0, :cond_30

    .line 773
    .line 774
    const-string p0, "liveGroupCircleMomentBanners"

    .line 775
    .line 776
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 777
    .line 778
    .line 779
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 780
    .line 781
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 782
    .line 783
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 784
    .line 785
    .line 786
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 787
    .line 788
    if-eqz p0, :cond_31

    .line 789
    .line 790
    const-string p0, "popWindows"

    .line 791
    .line 792
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 793
    .line 794
    .line 795
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 796
    .line 797
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 798
    .line 799
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 800
    .line 801
    .line 802
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 803
    .line 804
    if-eqz p0, :cond_32

    .line 805
    .line 806
    const-string p0, "location"

    .line 807
    .line 808
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PoiLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 812
    .line 813
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 814
    .line 815
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 816
    .line 817
    .line 818
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 819
    .line 820
    if-eqz p0, :cond_33

    .line 821
    .line 822
    const-string p0, "stickers"

    .line 823
    .line 824
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 825
    .line 826
    .line 827
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 828
    .line 829
    sget-object v1, Lcom/p1/mobile/putong/data/StickerInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 830
    .line 831
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 832
    .line 833
    .line 834
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 835
    .line 836
    if-eqz p0, :cond_34

    .line 837
    .line 838
    const-string p0, "nearbyWindow"

    .line 839
    .line 840
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 841
    .line 842
    .line 843
    sget-object p0, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 844
    .line 845
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 846
    .line 847
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 848
    .line 849
    .line 850
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 851
    .line 852
    if-eqz p0, :cond_35

    .line 853
    .line 854
    const-string p0, "momentPopWindows"

    .line 855
    .line 856
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 857
    .line 858
    .line 859
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 860
    .line 861
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 862
    .line 863
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 864
    .line 865
    .line 866
    :cond_35
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 867
    .line 868
    if-eqz p0, :cond_36

    .line 869
    .line 870
    const-string p0, "guideStatePostConfig"

    .line 871
    .line 872
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 873
    .line 874
    .line 875
    sget-object p0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 876
    .line 877
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 878
    .line 879
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 880
    .line 881
    .line 882
    :cond_36
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 883
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/FeedData$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
