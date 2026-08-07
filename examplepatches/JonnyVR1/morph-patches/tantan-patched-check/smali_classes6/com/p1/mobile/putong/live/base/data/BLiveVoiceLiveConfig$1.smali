.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;",
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
    const-string p0, "voiceBottomTabMode"

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
    const/16 v2, 0x32

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "intlFlyMicEffectConfig"

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
    const/16 v2, 0x31

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "roomPopRefresh"

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
    const/16 v2, 0x30

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "shareScreenRealNameAuthSwitch"

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
    const/16 v2, 0x2f

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "fixRoomManagerLimit"

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
    const/16 v2, 0x2e

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "ownerCreateRoomNotify"

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
    const/16 v2, 0x2d

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "quickGiftConfig"

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
    const/16 v2, 0x2c

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "showEntrance"

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
    const/16 v2, 0x2b

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "intlVoiceCpConfig"

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
    const/16 v2, 0x2a

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "isHideCreateRoomButton"

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
    const/16 v2, 0x29

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "directLeaveRoomMaxStaySeconds"

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
    const/16 v2, 0x28

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "undercoverMinPlayerCount"

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
    const/16 v2, 0x27

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "memberListRefreshInterval"

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
    const/16 v2, 0x26

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "shareScreenSwitch"

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
    const/16 v2, 0x25

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "voiceLiveHotChatMatchTest"

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
    const/16 v2, 0x24

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "voiceCpConfig"

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
    const/16 v2, 0x23

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "intlVoiceBannerConfig"

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
    const/16 v2, 0x22

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "operateMenu"

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
    const/16 v2, 0x21

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "showAnnouncementEntrance"

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
    const/16 v2, 0x20

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "voiceActivityShowNumber"

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
    const/16 v2, 0x1f

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "showPledgeAuctionNewTag"

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
    const/16 v2, 0x1e

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "audienceOperateMenu"

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
    const/16 v2, 0x1d

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "voiceLiveSparkletReportConfig"

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
    const/16 v2, 0x1c

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "roomAdministratorExplainH5"

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
    const/16 v2, 0x1b

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "shareConfig"

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
    const/16 v2, 0x1a

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "chatEntryRefreshInterval"

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
    const/16 v2, 0x19

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "voiceLiveHotChatMatchTest2"

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
    const/16 v2, 0x18

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "auctionTrickBubble"

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
    const/16 v2, 0x17

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "bindChatGroupPermission"

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
    const/16 v2, 0x16

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "voiceLeaderboard"

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
    const/16 v2, 0x15

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "defaultTabTopicId"

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
    const/16 v2, 0x14

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "smallWindow"

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
    const/16 v2, 0x13

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "voiceLiveActivityMomentTest"

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
    const/16 v2, 0x12

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "voiceLiveActivityMomentShow"

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
    const/16 v2, 0x11

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "chatEntryExp"

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
    const/16 v2, 0x10

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "anchorGrowthEntrySwitch"

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
    const/16 v2, 0xf

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string p0, "startVoiceLive"

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
    const/16 v2, 0xe

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string p0, "updateChatV3"

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
    const/16 v2, 0xd

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string p0, "virtualAvatarSwitch"

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
    const/16 v2, 0xc

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string p0, "voiceRecordConfig"

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
    const/16 v2, 0xb

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string p0, "verificationLevel"

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
    const/16 v2, 0xa

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string p0, "isOverseaChineseMigrated"

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
    const/16 v2, 0x9

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string p0, "feedStyle"

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
    const/16 v2, 0x8

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string p0, "voiceGiftWallConfig"

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
    goto :goto_0

    .line 627
    :cond_2b
    const/4 v2, 0x7

    .line 628
    goto :goto_0

    .line 629
    :sswitch_2c
    const-string p0, "voiceManagerLimit"

    .line 630
    .line 631
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 632
    .line 633
    .line 634
    move-result p0

    .line 635
    if-nez p0, :cond_2c

    .line 636
    .line 637
    goto :goto_0

    .line 638
    :cond_2c
    const/4 v2, 0x6

    .line 639
    goto :goto_0

    .line 640
    :sswitch_2d
    const-string p0, "intlEnterRoomOptimize"

    .line 641
    .line 642
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 643
    .line 644
    .line 645
    move-result p0

    .line 646
    if-nez p0, :cond_2d

    .line 647
    .line 648
    goto :goto_0

    .line 649
    :cond_2d
    const/4 v2, 0x5

    .line 650
    goto :goto_0

    .line 651
    :sswitch_2e
    const-string p0, "showRoomRegion"

    .line 652
    .line 653
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 654
    .line 655
    .line 656
    move-result p0

    .line 657
    if-nez p0, :cond_2e

    .line 658
    .line 659
    goto :goto_0

    .line 660
    :cond_2e
    const/4 v2, 0x4

    .line 661
    goto :goto_0

    .line 662
    :sswitch_2f
    const-string p0, "roomCardTemplateType"

    .line 663
    .line 664
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 665
    .line 666
    .line 667
    move-result p0

    .line 668
    if-nez p0, :cond_2f

    .line 669
    .line 670
    goto :goto_0

    .line 671
    :cond_2f
    const/4 v2, 0x3

    .line 672
    goto :goto_0

    .line 673
    :sswitch_30
    const-string p0, "intlShareConfig"

    .line 674
    .line 675
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    move-result p0

    .line 679
    if-nez p0, :cond_30

    .line 680
    .line 681
    goto :goto_0

    .line 682
    :cond_30
    const/4 v2, 0x2

    .line 683
    goto :goto_0

    .line 684
    :sswitch_31
    const-string p0, "intlVoiceSingGameConfig"

    .line 685
    .line 686
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 687
    .line 688
    .line 689
    move-result p0

    .line 690
    if-nez p0, :cond_31

    .line 691
    .line 692
    goto :goto_0

    .line 693
    :cond_31
    move v2, v1

    .line 694
    goto :goto_0

    .line 695
    :sswitch_32
    const-string p0, "reflectAudioProcessSwitch"

    .line 696
    .line 697
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 698
    .line 699
    .line 700
    move-result p0

    .line 701
    if-nez p0, :cond_32

    .line 702
    .line 703
    goto :goto_0

    .line 704
    :cond_32
    move v2, v0

    .line 705
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 706
    .line 707
    .line 708
    return v0

    .line 709
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 710
    .line 711
    .line 712
    move-result p0

    .line 713
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 714
    .line 715
    return v1

    .line 716
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 717
    .line 718
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 719
    .line 720
    .line 721
    move-result-object p0

    .line 722
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 723
    .line 724
    return v1

    .line 725
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 726
    .line 727
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object p0

    .line 731
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 732
    .line 733
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 734
    .line 735
    return v1

    .line 736
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 737
    .line 738
    .line 739
    move-result p0

    .line 740
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 741
    .line 742
    return v1

    .line 743
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 744
    .line 745
    .line 746
    move-result p0

    .line 747
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 748
    .line 749
    return v1

    .line 750
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 751
    .line 752
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    move-result-object p0

    .line 756
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 757
    .line 758
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 759
    .line 760
    return v1

    .line 761
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 762
    .line 763
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 764
    .line 765
    .line 766
    move-result-object p0

    .line 767
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 768
    .line 769
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 770
    .line 771
    return v1

    .line 772
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 773
    .line 774
    .line 775
    move-result p0

    .line 776
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 777
    .line 778
    return v1

    .line 779
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 780
    .line 781
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 782
    .line 783
    .line 784
    move-result-object p0

    .line 785
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 786
    .line 787
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 788
    .line 789
    return v1

    .line 790
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 791
    .line 792
    .line 793
    move-result p0

    .line 794
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 795
    .line 796
    return v1

    .line 797
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 798
    .line 799
    .line 800
    move-result p0

    .line 801
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 802
    .line 803
    return v1

    .line 804
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 805
    .line 806
    .line 807
    move-result p0

    .line 808
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 809
    .line 810
    return v1

    .line 811
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 812
    .line 813
    .line 814
    move-result p0

    .line 815
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 816
    .line 817
    return v1

    .line 818
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 819
    .line 820
    .line 821
    move-result p0

    .line 822
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 823
    .line 824
    return v1

    .line 825
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 826
    .line 827
    .line 828
    move-result p0

    .line 829
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 830
    .line 831
    return v1

    .line 832
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 833
    .line 834
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 835
    .line 836
    .line 837
    move-result-object p0

    .line 838
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 839
    .line 840
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 841
    .line 842
    return v1

    .line 843
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 844
    .line 845
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 846
    .line 847
    .line 848
    move-result-object p0

    .line 849
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 850
    .line 851
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 852
    .line 853
    return v1

    .line 854
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 855
    .line 856
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 857
    .line 858
    .line 859
    move-result-object p0

    .line 860
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 861
    .line 862
    return v1

    .line 863
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 864
    .line 865
    .line 866
    move-result p0

    .line 867
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 868
    .line 869
    return v1

    .line 870
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 871
    .line 872
    .line 873
    move-result p0

    .line 874
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 875
    .line 876
    return v1

    .line 877
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 878
    .line 879
    .line 880
    move-result p0

    .line 881
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 882
    .line 883
    return v1

    .line 884
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 885
    .line 886
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 887
    .line 888
    .line 889
    move-result-object p0

    .line 890
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 891
    .line 892
    return v1

    .line 893
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 894
    .line 895
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 896
    .line 897
    .line 898
    move-result-object p0

    .line 899
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 900
    .line 901
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 902
    .line 903
    return v1

    .line 904
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 905
    .line 906
    .line 907
    move-result-object p0

    .line 908
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 909
    .line 910
    return v1

    .line 911
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 912
    .line 913
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 914
    .line 915
    .line 916
    move-result-object p0

    .line 917
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 918
    .line 919
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 920
    .line 921
    return v1

    .line 922
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 923
    .line 924
    .line 925
    move-result p0

    .line 926
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 927
    .line 928
    return v1

    .line 929
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 930
    .line 931
    .line 932
    move-result p0

    .line 933
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 934
    .line 935
    return v1

    .line 936
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object p0

    .line 940
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 941
    .line 942
    return v1

    .line 943
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 944
    .line 945
    .line 946
    move-result p0

    .line 947
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 948
    .line 949
    return v1

    .line 950
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 951
    .line 952
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 953
    .line 954
    .line 955
    move-result-object p0

    .line 956
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 957
    .line 958
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 959
    .line 960
    return v1

    .line 961
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 962
    .line 963
    .line 964
    move-result-object p0

    .line 965
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 966
    .line 967
    return v1

    .line 968
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 969
    .line 970
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 971
    .line 972
    .line 973
    move-result-object p0

    .line 974
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 975
    .line 976
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 977
    .line 978
    return v1

    .line 979
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 980
    .line 981
    .line 982
    move-result-object p0

    .line 983
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 984
    .line 985
    return v1

    .line 986
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 987
    .line 988
    .line 989
    move-result-object p0

    .line 990
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 991
    .line 992
    return v1

    .line 993
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 994
    .line 995
    .line 996
    move-result p0

    .line 997
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 998
    .line 999
    return v1

    .line 1000
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1001
    .line 1002
    .line 1003
    move-result p0

    .line 1004
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 1005
    .line 1006
    return v1

    .line 1007
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1008
    .line 1009
    .line 1010
    move-result-object p0

    .line 1011
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 1012
    .line 1013
    return v1

    .line 1014
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1015
    .line 1016
    .line 1017
    move-result p0

    .line 1018
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 1019
    .line 1020
    return v1

    .line 1021
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1022
    .line 1023
    .line 1024
    move-result p0

    .line 1025
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 1026
    .line 1027
    return v1

    .line 1028
    :pswitch_27
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1029
    .line 1030
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1031
    .line 1032
    .line 1033
    move-result-object p0

    .line 1034
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 1035
    .line 1036
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 1037
    .line 1038
    return v1

    .line 1039
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1040
    .line 1041
    .line 1042
    move-result-object p0

    .line 1043
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 1044
    .line 1045
    return v1

    .line 1046
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1047
    .line 1048
    .line 1049
    move-result p0

    .line 1050
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 1051
    .line 1052
    return v1

    .line 1053
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1054
    .line 1055
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1056
    .line 1057
    .line 1058
    move-result-object p0

    .line 1059
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 1060
    .line 1061
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 1062
    .line 1063
    return v1

    .line 1064
    :pswitch_2b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1065
    .line 1066
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1067
    .line 1068
    .line 1069
    move-result-object p0

    .line 1070
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 1071
    .line 1072
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 1073
    .line 1074
    return v1

    .line 1075
    :pswitch_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1076
    .line 1077
    .line 1078
    move-result p0

    .line 1079
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 1080
    .line 1081
    return v1

    .line 1082
    :pswitch_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1083
    .line 1084
    .line 1085
    move-result p0

    .line 1086
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 1087
    .line 1088
    return v1

    .line 1089
    :pswitch_2e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1090
    .line 1091
    .line 1092
    move-result p0

    .line 1093
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 1094
    .line 1095
    return v1

    .line 1096
    :pswitch_2f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1097
    .line 1098
    .line 1099
    move-result-object p0

    .line 1100
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 1101
    .line 1102
    return v1

    .line 1103
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1104
    .line 1105
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1106
    .line 1107
    .line 1108
    move-result-object p0

    .line 1109
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 1110
    .line 1111
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 1112
    .line 1113
    return v1

    .line 1114
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1115
    .line 1116
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1117
    .line 1118
    .line 1119
    move-result-object p0

    .line 1120
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 1121
    .line 1122
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 1123
    .line 1124
    return v1

    .line 1125
    :pswitch_32
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1126
    .line 1127
    .line 1128
    move-result p0

    .line 1129
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 1130
    .line 1131
    return v1

    .line 1132
    nop

    .line 1133
    :sswitch_data_0
    .sparse-switch
        -0x7c2cd016 -> :sswitch_32
        -0x79d33e08 -> :sswitch_31
        -0x79ba4e9c -> :sswitch_30
        -0x74979701 -> :sswitch_2f
        -0x6c44dd74 -> :sswitch_2e
        -0x680e3d0d -> :sswitch_2d
        -0x6414f5a0 -> :sswitch_2c
        -0x633ec732 -> :sswitch_2b
        -0x62a2e54d -> :sswitch_2a
        -0x61919e8b -> :sswitch_29
        -0x5cde91d7 -> :sswitch_28
        -0x59f16abb -> :sswitch_27
        -0x58b78768 -> :sswitch_26
        -0x54092de2 -> :sswitch_25
        -0x51dfb904 -> :sswitch_24
        -0x4d7ca036 -> :sswitch_23
        -0x437f043d -> :sswitch_22
        -0x3a106096 -> :sswitch_21
        -0x3a0ff701 -> :sswitch_20
        -0x2d7fc429 -> :sswitch_1f
        -0x2aa30d8a -> :sswitch_1e
        -0x292e2515 -> :sswitch_1d
        -0x2642f847 -> :sswitch_1c
        -0x23c70884 -> :sswitch_1b
        -0x1c662b5e -> :sswitch_1a
        -0x18c6069a -> :sswitch_19
        -0x17bfe3ff -> :sswitch_18
        -0x65d196e -> :sswitch_17
        -0x3e2aece -> :sswitch_16
        -0x319bba1 -> :sswitch_15
        -0x2960979 -> :sswitch_14
        -0x1375219 -> :sswitch_13
        0x6fb3ba -> :sswitch_12
        0x7733103 -> :sswitch_11
        0x1c379703 -> :sswitch_10
        0x1ceca961 -> :sswitch_f
        0x30a1dd90 -> :sswitch_e
        0x400c303f -> :sswitch_d
        0x41b2bb48 -> :sswitch_c
        0x423ad6bb -> :sswitch_b
        0x448ab48b -> :sswitch_a
        0x46dc1bb5 -> :sswitch_9
        0x4fe27204 -> :sswitch_8
        0x50627cd3 -> :sswitch_7
        0x525d725f -> :sswitch_6
        0x640096f3 -> :sswitch_5
        0x67137abe -> :sswitch_4
        0x6b89c1b0 -> :sswitch_3
        0x7208b285 -> :sswitch_2
        0x743a3c64 -> :sswitch_1
        0x7df2321b -> :sswitch_0
    .end sparse-switch

    .line 1134
    .line 1135
    .line 1136
    .line 1137
    .line 1138
    .line 1139
    .line 1140
    .line 1141
    .line 1142
    .line 1143
    .line 1144
    .line 1145
    .line 1146
    .line 1147
    .line 1148
    .line 1149
    .line 1150
    .line 1151
    .line 1152
    .line 1153
    .line 1154
    .line 1155
    .line 1156
    .line 1157
    .line 1158
    .line 1159
    .line 1160
    .line 1161
    .line 1162
    .line 1163
    .line 1164
    .line 1165
    .line 1166
    .line 1167
    .line 1168
    .line 1169
    .line 1170
    .line 1171
    .line 1172
    .line 1173
    .line 1174
    .line 1175
    .line 1176
    .line 1177
    .line 1178
    .line 1179
    .line 1180
    .line 1181
    .line 1182
    .line 1183
    .line 1184
    .line 1185
    .line 1186
    .line 1187
    .line 1188
    .line 1189
    .line 1190
    .line 1191
    .line 1192
    .line 1193
    .line 1194
    .line 1195
    .line 1196
    .line 1197
    .line 1198
    .line 1199
    .line 1200
    .line 1201
    .line 1202
    .line 1203
    .line 1204
    .line 1205
    .line 1206
    .line 1207
    .line 1208
    .line 1209
    .line 1210
    .line 1211
    .line 1212
    .line 1213
    .line 1214
    .line 1215
    .line 1216
    .line 1217
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

    .line 1133
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "startVoiceLive"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "feedStyle"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v1, "verificationLevel"

    .line 32
    .line 33
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    const-string p0, "voiceActivityShowNumber"

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 39
    .line 40
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string v1, "defaultTabTopicId"

    .line 48
    .line 49
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    const-string p0, "memberListRefreshInterval"

    .line 53
    .line 54
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 55
    .line 56
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "operateMenu"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 69
    .line 70
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    const-string p0, "voiceBottomTabMode"

    .line 76
    .line 77
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 78
    .line 79
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "audienceOperateMenu"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "ownerCreateRoomNotify"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    const-string p0, "showAnnouncementEntrance"

    .line 115
    .line 116
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 117
    .line 118
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    const-string p0, "bindChatGroupPermission"

    .line 122
    .line 123
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 124
    .line 125
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    const-string p0, "updateChatV3"

    .line 129
    .line 130
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 131
    .line 132
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 133
    .line 134
    .line 135
    const-string p0, "voiceManagerLimit"

    .line 136
    .line 137
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 138
    .line 139
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 140
    .line 141
    .line 142
    const-string p0, "undercoverMinPlayerCount"

    .line 143
    .line 144
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 145
    .line 146
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 150
    .line 151
    if-eqz p0, :cond_7

    .line 152
    .line 153
    const-string p0, "voiceLiveSparkletReportConfig"

    .line 154
    .line 155
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 159
    .line 160
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 161
    .line 162
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 163
    .line 164
    .line 165
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 166
    .line 167
    if-eqz p0, :cond_8

    .line 168
    .line 169
    const-string p0, "quickGiftConfig"

    .line 170
    .line 171
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 175
    .line 176
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 177
    .line 178
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 179
    .line 180
    .line 181
    :cond_8
    const-string p0, "voiceLiveHotChatMatchTest"

    .line 182
    .line 183
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 184
    .line 185
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 189
    .line 190
    if-eqz p0, :cond_9

    .line 191
    .line 192
    const-string p0, "voiceRecordConfig"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 198
    .line 199
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 200
    .line 201
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 202
    .line 203
    .line 204
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 205
    .line 206
    if-eqz p0, :cond_a

    .line 207
    .line 208
    const-string v1, "voiceLiveActivityMomentTest"

    .line 209
    .line 210
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz p0, :cond_b

    .line 216
    .line 217
    const-string v1, "voiceLiveActivityMomentShow"

    .line 218
    .line 219
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :cond_b
    const-string p0, "voiceLiveHotChatMatchTest2"

    .line 223
    .line 224
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 225
    .line 226
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 227
    .line 228
    .line 229
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 230
    .line 231
    if-eqz p0, :cond_c

    .line 232
    .line 233
    const-string p0, "voiceLeaderboard"

    .line 234
    .line 235
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 239
    .line 240
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 241
    .line 242
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 243
    .line 244
    .line 245
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 246
    .line 247
    if-eqz p0, :cond_d

    .line 248
    .line 249
    const-string p0, "roomPopRefresh"

    .line 250
    .line 251
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 255
    .line 256
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 257
    .line 258
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 259
    .line 260
    .line 261
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 262
    .line 263
    if-eqz p0, :cond_e

    .line 264
    .line 265
    const-string p0, "voiceCpConfig"

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 271
    .line 272
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 273
    .line 274
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 275
    .line 276
    .line 277
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 278
    .line 279
    if-eqz p0, :cond_f

    .line 280
    .line 281
    const-string v1, "roomAdministratorExplainH5"

    .line 282
    .line 283
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    :cond_f
    const-string p0, "chatEntryRefreshInterval"

    .line 287
    .line 288
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 289
    .line 290
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 291
    .line 292
    .line 293
    const-string p0, "chatEntryExp"

    .line 294
    .line 295
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 296
    .line 297
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 298
    .line 299
    .line 300
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 301
    .line 302
    if-eqz p0, :cond_10

    .line 303
    .line 304
    const-string p0, "intlVoiceBannerConfig"

    .line 305
    .line 306
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 310
    .line 311
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 312
    .line 313
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 314
    .line 315
    .line 316
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 317
    .line 318
    if-eqz p0, :cond_11

    .line 319
    .line 320
    const-string p0, "voiceGiftWallConfig"

    .line 321
    .line 322
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 326
    .line 327
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 328
    .line 329
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 330
    .line 331
    .line 332
    :cond_11
    const-string p0, "virtualAvatarSwitch"

    .line 333
    .line 334
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 335
    .line 336
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 337
    .line 338
    .line 339
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 340
    .line 341
    if-eqz p0, :cond_12

    .line 342
    .line 343
    const-string p0, "smallWindow"

    .line 344
    .line 345
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 349
    .line 350
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 351
    .line 352
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 353
    .line 354
    .line 355
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 356
    .line 357
    if-eqz p0, :cond_13

    .line 358
    .line 359
    const-string p0, "shareConfig"

    .line 360
    .line 361
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 365
    .line 366
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 367
    .line 368
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 369
    .line 370
    .line 371
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 372
    .line 373
    if-eqz p0, :cond_14

    .line 374
    .line 375
    const-string v1, "roomCardTemplateType"

    .line 376
    .line 377
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    :cond_14
    const-string p0, "showRoomRegion"

    .line 381
    .line 382
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 383
    .line 384
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 385
    .line 386
    .line 387
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 388
    .line 389
    if-eqz p0, :cond_15

    .line 390
    .line 391
    const-string p0, "intlShareConfig"

    .line 392
    .line 393
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 397
    .line 398
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 399
    .line 400
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 401
    .line 402
    .line 403
    :cond_15
    const-string p0, "fixRoomManagerLimit"

    .line 404
    .line 405
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 406
    .line 407
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 408
    .line 409
    .line 410
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 411
    .line 412
    if-eqz p0, :cond_16

    .line 413
    .line 414
    const-string p0, "intlVoiceSingGameConfig"

    .line 415
    .line 416
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 420
    .line 421
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 422
    .line 423
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 424
    .line 425
    .line 426
    :cond_16
    const-string p0, "shareScreenSwitch"

    .line 427
    .line 428
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 429
    .line 430
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 431
    .line 432
    .line 433
    const-string p0, "shareScreenRealNameAuthSwitch"

    .line 434
    .line 435
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 436
    .line 437
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 438
    .line 439
    .line 440
    const-string p0, "reflectAudioProcessSwitch"

    .line 441
    .line 442
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 443
    .line 444
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 445
    .line 446
    .line 447
    const-string p0, "directLeaveRoomMaxStaySeconds"

    .line 448
    .line 449
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 450
    .line 451
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 452
    .line 453
    .line 454
    const-string p0, "anchorGrowthEntrySwitch"

    .line 455
    .line 456
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 457
    .line 458
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 459
    .line 460
    .line 461
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 462
    .line 463
    if-eqz p0, :cond_17

    .line 464
    .line 465
    const-string p0, "intlFlyMicEffectConfig"

    .line 466
    .line 467
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 471
    .line 472
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 473
    .line 474
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 475
    .line 476
    .line 477
    :cond_17
    const-string p0, "intlEnterRoomOptimize"

    .line 478
    .line 479
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 480
    .line 481
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 482
    .line 483
    .line 484
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 485
    .line 486
    if-eqz p0, :cond_18

    .line 487
    .line 488
    const-string p0, "intlVoiceCpConfig"

    .line 489
    .line 490
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 494
    .line 495
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 496
    .line 497
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 498
    .line 499
    .line 500
    :cond_18
    const-string p0, "showEntrance"

    .line 501
    .line 502
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 503
    .line 504
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 505
    .line 506
    .line 507
    const-string p0, "isOverseaChineseMigrated"

    .line 508
    .line 509
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 510
    .line 511
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 512
    .line 513
    .line 514
    const-string p0, "isHideCreateRoomButton"

    .line 515
    .line 516
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 517
    .line 518
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 519
    .line 520
    .line 521
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 522
    .line 523
    if-eqz p0, :cond_19

    .line 524
    .line 525
    const-string v0, "auctionTrickBubble"

    .line 526
    .line 527
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    :cond_19
    const-string p0, "showPledgeAuctionNewTag"

    .line 531
    .line 532
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 533
    .line 534
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 535
    .line 536
    .line 537
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 538
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
