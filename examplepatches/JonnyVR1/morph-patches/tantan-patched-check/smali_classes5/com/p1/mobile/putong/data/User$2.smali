.class Lcom/p1/mobile/putong/data/User$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/User;",
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
    const-class p0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User$2;->newInstance()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
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
    const-string p0, "hierarchy"

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
    const/16 v2, 0x4b

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
    const/16 v2, 0x4a

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "banStatus"

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
    const/16 v2, 0x49

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "fanbaseHierarchy"

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
    const/16 v2, 0x48

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "finishedStages"

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
    const/16 v2, 0x47

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "localLikeIdentifiers"

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
    const/16 v2, 0x46

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "fakeStatus"

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
    const/16 v2, 0x45

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "activityUser"

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
    const/16 v2, 0x44

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "displayAudit"

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
    const/16 v2, 0x43

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "deleted"

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
    const/16 v2, 0x42

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "voiceLiveState"

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
    const/16 v2, 0x41

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "settings"

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
    const/16 v2, 0x40

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "matePlanUser"

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
    const/16 v2, 0x3f

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "memberships"

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
    const/16 v2, 0x3e

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "signupStage"

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
    const/16 v2, 0x3d

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "publicId"

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
    const/16 v2, 0x3c

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "verifications"

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
    const/16 v2, 0x3b

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "goPlaceTimestamp"

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
    const/16 v2, 0x3a

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "anonymousLike"

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
    const/16 v2, 0x39

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "liveState"

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
    const/16 v2, 0x38

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "richListTracker"

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
    const/16 v2, 0x37

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "diamondVIPExpiresTime"

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
    const/16 v2, 0x36

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "matePlanAdUser"

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
    const/16 v2, 0x35

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "peepership"

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
    const/16 v2, 0x34

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "popLevel"

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
    const/16 v2, 0x33

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "receivedLetter"

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
    const/16 v2, 0x32

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "abGroups"

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
    const/16 v2, 0x31

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "avatarFrame"

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
    const/16 v2, 0x30

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "inactivated"

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
    const/16 v2, 0x2f

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "picksExpiredTimestamp"

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
    const/16 v2, 0x2e

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "sendLetterTimestamp"

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
    const/16 v2, 0x2d

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "privateAnswersUpdatedTime"

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
    const/16 v2, 0x2c

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "sendLetter"

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
    const/16 v2, 0x2b

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "ussTracker"

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
    const/16 v2, 0x2a

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "voice"

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
    const/16 v2, 0x29

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "state"

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
    const/16 v2, 0x28

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string p0, "medal"

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
    const/16 v2, 0x27

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string p0, "ideal"

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
    const/16 v2, 0x26

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string p0, "aiTag"

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
    const/16 v2, 0x25

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string p0, "regionTag"

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
    const/16 v2, 0x24

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string p0, "localSeeReminderType"

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
    const/16 v2, 0x23

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string p0, "richListPosition"

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
    const/16 v2, 0x22

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string p0, "liveRevenueCampaignVip"

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
    const/16 v2, 0x21

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string p0, "name"

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
    const/16 v2, 0x20

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_2c
    const-string p0, "age"

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
    const/16 v2, 0x1f

    .line 643
    .line 644
    goto/16 :goto_0

    .line 645
    .line 646
    :sswitch_2d
    const-string p0, "id"

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
    const/16 v2, 0x1e

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_2e
    const-string p0, "soul-settings"

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
    const/16 v2, 0x1d

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_2f
    const-string p0, "ussTags"

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
    const/16 v2, 0x1c

    .line 685
    .line 686
    goto/16 :goto_0

    .line 687
    .line 688
    :sswitch_30
    const-string p0, "profile"

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
    goto/16 :goto_0

    .line 697
    .line 698
    :cond_30
    const/16 v2, 0x1b

    .line 699
    .line 700
    goto/16 :goto_0

    .line 701
    .line 702
    :sswitch_31
    const-string p0, "createdTime"

    .line 703
    .line 704
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result p0

    .line 708
    if-nez p0, :cond_31

    .line 709
    .line 710
    goto/16 :goto_0

    .line 711
    .line 712
    :cond_31
    const/16 v2, 0x1a

    .line 713
    .line 714
    goto/16 :goto_0

    .line 715
    .line 716
    :sswitch_32
    const-string p0, "signupTime"

    .line 717
    .line 718
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 719
    .line 720
    .line 721
    move-result p0

    .line 722
    if-nez p0, :cond_32

    .line 723
    .line 724
    goto/16 :goto_0

    .line 725
    .line 726
    :cond_32
    const/16 v2, 0x19

    .line 727
    .line 728
    goto/16 :goto_0

    .line 729
    .line 730
    :sswitch_33
    const-string p0, "pictures"

    .line 731
    .line 732
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 733
    .line 734
    .line 735
    move-result p0

    .line 736
    if-nez p0, :cond_33

    .line 737
    .line 738
    goto/16 :goto_0

    .line 739
    .line 740
    :cond_33
    const/16 v2, 0x18

    .line 741
    .line 742
    goto/16 :goto_0

    .line 743
    .line 744
    :sswitch_34
    const-string p0, "picksTag"

    .line 745
    .line 746
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 747
    .line 748
    .line 749
    move-result p0

    .line 750
    if-nez p0, :cond_34

    .line 751
    .line 752
    goto/16 :goto_0

    .line 753
    .line 754
    :cond_34
    const/16 v2, 0x17

    .line 755
    .line 756
    goto/16 :goto_0

    .line 757
    .line 758
    :sswitch_35
    const-string p0, "nameStatus"

    .line 759
    .line 760
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 761
    .line 762
    .line 763
    move-result p0

    .line 764
    if-nez p0, :cond_35

    .line 765
    .line 766
    goto/16 :goto_0

    .line 767
    .line 768
    :cond_35
    const/16 v2, 0x16

    .line 769
    .line 770
    goto/16 :goto_0

    .line 771
    .line 772
    :sswitch_36
    const-string p0, "localLetterUnRead"

    .line 773
    .line 774
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 775
    .line 776
    .line 777
    move-result p0

    .line 778
    if-nez p0, :cond_36

    .line 779
    .line 780
    goto/16 :goto_0

    .line 781
    .line 782
    :cond_36
    const/16 v2, 0x15

    .line 783
    .line 784
    goto/16 :goto_0

    .line 785
    .line 786
    :sswitch_37
    const-string p0, "realName"

    .line 787
    .line 788
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 789
    .line 790
    .line 791
    move-result p0

    .line 792
    if-nez p0, :cond_37

    .line 793
    .line 794
    goto/16 :goto_0

    .line 795
    .line 796
    :cond_37
    const/16 v2, 0x14

    .line 797
    .line 798
    goto/16 :goto_0

    .line 799
    .line 800
    :sswitch_38
    const-string p0, "status"

    .line 801
    .line 802
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 803
    .line 804
    .line 805
    move-result p0

    .line 806
    if-nez p0, :cond_38

    .line 807
    .line 808
    goto/16 :goto_0

    .line 809
    .line 810
    :cond_38
    const/16 v2, 0x13

    .line 811
    .line 812
    goto/16 :goto_0

    .line 813
    .line 814
    :sswitch_39
    const-string p0, "source"

    .line 815
    .line 816
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 817
    .line 818
    .line 819
    move-result p0

    .line 820
    if-nez p0, :cond_39

    .line 821
    .line 822
    goto/16 :goto_0

    .line 823
    .line 824
    :cond_39
    const/16 v2, 0x12

    .line 825
    .line 826
    goto/16 :goto_0

    .line 827
    .line 828
    :sswitch_3a
    const-string p0, "picksSwipable"

    .line 829
    .line 830
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 831
    .line 832
    .line 833
    move-result p0

    .line 834
    if-nez p0, :cond_3a

    .line 835
    .line 836
    goto/16 :goto_0

    .line 837
    .line 838
    :cond_3a
    const/16 v2, 0x11

    .line 839
    .line 840
    goto/16 :goto_0

    .line 841
    .line 842
    :sswitch_3b
    const-string p0, "anchorHierarchy"

    .line 843
    .line 844
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 845
    .line 846
    .line 847
    move-result p0

    .line 848
    if-nez p0, :cond_3b

    .line 849
    .line 850
    goto/16 :goto_0

    .line 851
    .line 852
    :cond_3b
    const/16 v2, 0x10

    .line 853
    .line 854
    goto/16 :goto_0

    .line 855
    .line 856
    :sswitch_3c
    const-string p0, "localLatestReceivedMessageTime"

    .line 857
    .line 858
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 859
    .line 860
    .line 861
    move-result p0

    .line 862
    if-nez p0, :cond_3c

    .line 863
    .line 864
    goto/16 :goto_0

    .line 865
    .line 866
    :cond_3c
    const/16 v2, 0xf

    .line 867
    .line 868
    goto/16 :goto_0

    .line 869
    .line 870
    :sswitch_3d
    const-string p0, "privateAnswers"

    .line 871
    .line 872
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 873
    .line 874
    .line 875
    move-result p0

    .line 876
    if-nez p0, :cond_3d

    .line 877
    .line 878
    goto/16 :goto_0

    .line 879
    .line 880
    :cond_3d
    const/16 v2, 0xe

    .line 881
    .line 882
    goto/16 :goto_0

    .line 883
    .line 884
    :sswitch_3e
    const-string p0, "totalRewardPoint"

    .line 885
    .line 886
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 887
    .line 888
    .line 889
    move-result p0

    .line 890
    if-nez p0, :cond_3e

    .line 891
    .line 892
    goto/16 :goto_0

    .line 893
    .line 894
    :cond_3e
    const/16 v2, 0xd

    .line 895
    .line 896
    goto/16 :goto_0

    .line 897
    .line 898
    :sswitch_3f
    const-string p0, "isLord"

    .line 899
    .line 900
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 901
    .line 902
    .line 903
    move-result p0

    .line 904
    if-nez p0, :cond_3f

    .line 905
    .line 906
    goto/16 :goto_0

    .line 907
    .line 908
    :cond_3f
    const/16 v2, 0xc

    .line 909
    .line 910
    goto/16 :goto_0

    .line 911
    .line 912
    :sswitch_40
    const-string p0, "gender"

    .line 913
    .line 914
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 915
    .line 916
    .line 917
    move-result p0

    .line 918
    if-nez p0, :cond_40

    .line 919
    .line 920
    goto/16 :goto_0

    .line 921
    .line 922
    :cond_40
    const/16 v2, 0xb

    .line 923
    .line 924
    goto/16 :goto_0

    .line 925
    .line 926
    :sswitch_41
    const-string p0, "specialEffect"

    .line 927
    .line 928
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 929
    .line 930
    .line 931
    move-result p0

    .line 932
    if-nez p0, :cond_41

    .line 933
    .line 934
    goto/16 :goto_0

    .line 935
    .line 936
    :cond_41
    const/16 v2, 0xa

    .line 937
    .line 938
    goto/16 :goto_0

    .line 939
    .line 940
    :sswitch_42
    const-string p0, "membership"

    .line 941
    .line 942
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 943
    .line 944
    .line 945
    move-result p0

    .line 946
    if-nez p0, :cond_42

    .line 947
    .line 948
    goto/16 :goto_0

    .line 949
    .line 950
    :cond_42
    const/16 v2, 0x9

    .line 951
    .line 952
    goto/16 :goto_0

    .line 953
    .line 954
    :sswitch_43
    const-string p0, "credit"

    .line 955
    .line 956
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 957
    .line 958
    .line 959
    move-result p0

    .line 960
    if-nez p0, :cond_43

    .line 961
    .line 962
    goto/16 :goto_0

    .line 963
    .line 964
    :cond_43
    const/16 v2, 0x8

    .line 965
    .line 966
    goto/16 :goto_0

    .line 967
    .line 968
    :sswitch_44
    const-string p0, "picksTracker"

    .line 969
    .line 970
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 971
    .line 972
    .line 973
    move-result p0

    .line 974
    if-nez p0, :cond_44

    .line 975
    .line 976
    goto :goto_0

    .line 977
    :cond_44
    const/4 v2, 0x7

    .line 978
    goto :goto_0

    .line 979
    :sswitch_45
    const-string p0, "abroad"

    .line 980
    .line 981
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 982
    .line 983
    .line 984
    move-result p0

    .line 985
    if-nez p0, :cond_45

    .line 986
    .line 987
    goto :goto_0

    .line 988
    :cond_45
    const/4 v2, 0x6

    .line 989
    goto :goto_0

    .line 990
    :sswitch_46
    const-string p0, "receivedLetterTimestamp"

    .line 991
    .line 992
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 993
    .line 994
    .line 995
    move-result p0

    .line 996
    if-nez p0, :cond_46

    .line 997
    .line 998
    goto :goto_0

    .line 999
    :cond_46
    const/4 v2, 0x5

    .line 1000
    goto :goto_0

    .line 1001
    :sswitch_47
    const-string p0, "description"

    .line 1002
    .line 1003
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1004
    .line 1005
    .line 1006
    move-result p0

    .line 1007
    if-nez p0, :cond_47

    .line 1008
    .line 1009
    goto :goto_0

    .line 1010
    :cond_47
    const/4 v2, 0x4

    .line 1011
    goto :goto_0

    .line 1012
    :sswitch_48
    const-string p0, "picksTagType"

    .line 1013
    .line 1014
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1015
    .line 1016
    .line 1017
    move-result p0

    .line 1018
    if-nez p0, :cond_48

    .line 1019
    .line 1020
    goto :goto_0

    .line 1021
    :cond_48
    const/4 v2, 0x3

    .line 1022
    goto :goto_0

    .line 1023
    :sswitch_49
    const-string p0, "popularity"

    .line 1024
    .line 1025
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1026
    .line 1027
    .line 1028
    move-result p0

    .line 1029
    if-nez p0, :cond_49

    .line 1030
    .line 1031
    goto :goto_0

    .line 1032
    :cond_49
    const/4 v2, 0x2

    .line 1033
    goto :goto_0

    .line 1034
    :sswitch_4a
    const-string p0, "richListType"

    .line 1035
    .line 1036
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1037
    .line 1038
    .line 1039
    move-result p0

    .line 1040
    if-nez p0, :cond_4a

    .line 1041
    .line 1042
    goto :goto_0

    .line 1043
    :cond_4a
    move v2, v1

    .line 1044
    goto :goto_0

    .line 1045
    :sswitch_4b
    const-string p0, "aiOrderPicture"

    .line 1046
    .line 1047
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1048
    .line 1049
    .line 1050
    move-result p0

    .line 1051
    if-nez p0, :cond_4b

    .line 1052
    .line 1053
    goto :goto_0

    .line 1054
    :cond_4b
    move v2, v0

    .line 1055
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 1056
    .line 1057
    .line 1058
    return v0

    .line 1059
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1060
    .line 1061
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1062
    .line 1063
    .line 1064
    move-result-object p0

    .line 1065
    check-cast p0, Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 1066
    .line 1067
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 1068
    .line 1069
    return v1

    .line 1070
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/Location;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1071
    .line 1072
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1073
    .line 1074
    .line 1075
    move-result-object p0

    .line 1076
    check-cast p0, Lcom/p1/mobile/putong/data/Location;

    .line 1077
    .line 1078
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1079
    .line 1080
    return v1

    .line 1081
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/BanStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1082
    .line 1083
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1084
    .line 1085
    .line 1086
    move-result-object p0

    .line 1087
    check-cast p0, Lcom/p1/mobile/putong/data/BanStatus;

    .line 1088
    .line 1089
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 1090
    .line 1091
    return v1

    .line 1092
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1093
    .line 1094
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1095
    .line 1096
    .line 1097
    move-result-object p0

    .line 1098
    check-cast p0, Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 1099
    .line 1100
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 1101
    .line 1102
    return v1

    .line 1103
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/StepSignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1104
    .line 1105
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1106
    .line 1107
    .line 1108
    move-result-object p0

    .line 1109
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 1110
    .line 1111
    return v1

    .line 1112
    :pswitch_5
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1113
    .line 1114
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1115
    .line 1116
    .line 1117
    move-result-object p0

    .line 1118
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 1119
    .line 1120
    return v1

    .line 1121
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/StatusesItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1122
    .line 1123
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1124
    .line 1125
    .line 1126
    move-result-object p0

    .line 1127
    check-cast p0, Lcom/p1/mobile/putong/data/StatusesItem;

    .line 1128
    .line 1129
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 1130
    .line 1131
    return v1

    .line 1132
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/ActivityUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1133
    .line 1134
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1135
    .line 1136
    .line 1137
    move-result-object p0

    .line 1138
    check-cast p0, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 1139
    .line 1140
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 1141
    .line 1142
    return v1

    .line 1143
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1144
    .line 1145
    .line 1146
    move-result p0

    .line 1147
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 1148
    .line 1149
    return v1

    .line 1150
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1151
    .line 1152
    .line 1153
    move-result p0

    .line 1154
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 1155
    .line 1156
    return v1

    .line 1157
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1158
    .line 1159
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1160
    .line 1161
    .line 1162
    move-result-object p0

    .line 1163
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 1164
    .line 1165
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 1166
    .line 1167
    return v1

    .line 1168
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/Settings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1169
    .line 1170
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1171
    .line 1172
    .line 1173
    move-result-object p0

    .line 1174
    check-cast p0, Lcom/p1/mobile/putong/data/Settings;

    .line 1175
    .line 1176
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 1177
    .line 1178
    return v1

    .line 1179
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1180
    .line 1181
    .line 1182
    move-result p0

    .line 1183
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 1184
    .line 1185
    return v1

    .line 1186
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1187
    .line 1188
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1189
    .line 1190
    .line 1191
    move-result-object p0

    .line 1192
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 1193
    .line 1194
    return v1

    .line 1195
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1196
    .line 1197
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1198
    .line 1199
    .line 1200
    move-result-object p0

    .line 1201
    check-cast p0, Lcom/p1/mobile/putong/data/SignupStage;

    .line 1202
    .line 1203
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 1204
    .line 1205
    return v1

    .line 1206
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1207
    .line 1208
    .line 1209
    move-result-object p0

    .line 1210
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 1211
    .line 1212
    return v1

    .line 1213
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/PicVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1214
    .line 1215
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1216
    .line 1217
    .line 1218
    move-result-object p0

    .line 1219
    check-cast p0, Lcom/p1/mobile/putong/data/PicVerification;

    .line 1220
    .line 1221
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 1222
    .line 1223
    return v1

    .line 1224
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1225
    .line 1226
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1227
    .line 1228
    .line 1229
    move-result-object p0

    .line 1230
    check-cast p0, Ljava/lang/Double;

    .line 1231
    .line 1232
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 1233
    .line 1234
    .line 1235
    move-result-wide p2

    .line 1236
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 1237
    .line 1238
    return v1

    .line 1239
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1240
    .line 1241
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1242
    .line 1243
    .line 1244
    move-result-object p0

    .line 1245
    check-cast p0, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 1246
    .line 1247
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 1248
    .line 1249
    return v1

    .line 1250
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/UserLiveState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1251
    .line 1252
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1253
    .line 1254
    .line 1255
    move-result-object p0

    .line 1256
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveState;

    .line 1257
    .line 1258
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 1259
    .line 1260
    return v1

    .line 1261
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1262
    .line 1263
    .line 1264
    move-result-object p0

    .line 1265
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 1266
    .line 1267
    return v1

    .line 1268
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1269
    .line 1270
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1271
    .line 1272
    .line 1273
    move-result-object p0

    .line 1274
    check-cast p0, Ljava/lang/Double;

    .line 1275
    .line 1276
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 1277
    .line 1278
    .line 1279
    move-result-wide p2

    .line 1280
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 1281
    .line 1282
    return v1

    .line 1283
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1284
    .line 1285
    .line 1286
    move-result p0

    .line 1287
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 1288
    .line 1289
    return v1

    .line 1290
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1291
    .line 1292
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1293
    .line 1294
    .line 1295
    move-result-object p0

    .line 1296
    check-cast p0, Lcom/p1/mobile/putong/data/Membership;

    .line 1297
    .line 1298
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 1299
    .line 1300
    return v1

    .line 1301
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1302
    .line 1303
    .line 1304
    move-result p0

    .line 1305
    iput p0, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 1306
    .line 1307
    return v1

    .line 1308
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1309
    .line 1310
    .line 1311
    move-result-object p0

    .line 1312
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 1313
    .line 1314
    return v1

    .line 1315
    :pswitch_1a
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1316
    .line 1317
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1318
    .line 1319
    .line 1320
    move-result-object p0

    .line 1321
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 1322
    .line 1323
    return v1

    .line 1324
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/AvatarFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1325
    .line 1326
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1327
    .line 1328
    .line 1329
    move-result-object p0

    .line 1330
    check-cast p0, Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 1331
    .line 1332
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 1333
    .line 1334
    return v1

    .line 1335
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1336
    .line 1337
    .line 1338
    move-result p0

    .line 1339
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 1340
    .line 1341
    return v1

    .line 1342
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1343
    .line 1344
    .line 1345
    move-result-wide p2

    .line 1346
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 1347
    .line 1348
    return v1

    .line 1349
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1350
    .line 1351
    .line 1352
    move-result-wide p2

    .line 1353
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 1354
    .line 1355
    return v1

    .line 1356
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1357
    .line 1358
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1359
    .line 1360
    .line 1361
    move-result-object p0

    .line 1362
    check-cast p0, Ljava/lang/Double;

    .line 1363
    .line 1364
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 1365
    .line 1366
    .line 1367
    move-result-wide p2

    .line 1368
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 1369
    .line 1370
    return v1

    .line 1371
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1372
    .line 1373
    .line 1374
    move-result-object p0

    .line 1375
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 1376
    .line 1377
    return v1

    .line 1378
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1379
    .line 1380
    .line 1381
    move-result-object p0

    .line 1382
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 1383
    .line 1384
    return v1

    .line 1385
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/data/AudioSignature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1386
    .line 1387
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1388
    .line 1389
    .line 1390
    move-result-object p0

    .line 1391
    check-cast p0, Lcom/p1/mobile/putong/data/AudioSignature;

    .line 1392
    .line 1393
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 1394
    .line 1395
    return v1

    .line 1396
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/data/UserState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1397
    .line 1398
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1399
    .line 1400
    .line 1401
    move-result-object p0

    .line 1402
    check-cast p0, Lcom/p1/mobile/putong/data/UserState;

    .line 1403
    .line 1404
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 1405
    .line 1406
    return v1

    .line 1407
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/data/UserMedalWrapper;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1408
    .line 1409
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1410
    .line 1411
    .line 1412
    move-result-object p0

    .line 1413
    check-cast p0, Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 1414
    .line 1415
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 1416
    .line 1417
    return v1

    .line 1418
    :pswitch_25
    sget-object p0, Lcom/p1/mobile/putong/data/UserIdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1419
    .line 1420
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1421
    .line 1422
    .line 1423
    move-result-object p0

    .line 1424
    check-cast p0, Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 1425
    .line 1426
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 1427
    .line 1428
    return v1

    .line 1429
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1430
    .line 1431
    .line 1432
    move-result-object p0

    .line 1433
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 1434
    .line 1435
    return v1

    .line 1436
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1437
    .line 1438
    .line 1439
    move-result-object p0

    .line 1440
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 1441
    .line 1442
    return v1

    .line 1443
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1444
    .line 1445
    .line 1446
    move-result-object p0

    .line 1447
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 1448
    .line 1449
    return v1

    .line 1450
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1451
    .line 1452
    .line 1453
    move-result p0

    .line 1454
    iput p0, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 1455
    .line 1456
    return v1

    .line 1457
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1458
    .line 1459
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1460
    .line 1461
    .line 1462
    move-result-object p0

    .line 1463
    check-cast p0, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 1464
    .line 1465
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 1466
    .line 1467
    return v1

    .line 1468
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1469
    .line 1470
    .line 1471
    move-result-object p0

    .line 1472
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 1473
    .line 1474
    return v1

    .line 1475
    :pswitch_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 1476
    .line 1477
    .line 1478
    move-result-object p0

    .line 1479
    sget-object p2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1480
    .line 1481
    if-ne p0, p2, :cond_4c

    .line 1482
    .line 1483
    const/4 p0, 0x0

    .line 1484
    goto :goto_1

    .line 1485
    :cond_4c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1486
    .line 1487
    .line 1488
    move-result p0

    .line 1489
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1490
    .line 1491
    .line 1492
    move-result-object p0

    .line 1493
    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 1494
    .line 1495
    return v1

    .line 1496
    :pswitch_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1497
    .line 1498
    .line 1499
    move-result-object p0

    .line 1500
    iput-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1501
    .line 1502
    return v0

    .line 1503
    :pswitch_2e
    sget-object p0, Lcom/p1/mobile/putong/data/UserSoulSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1504
    .line 1505
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1506
    .line 1507
    .line 1508
    move-result-object p0

    .line 1509
    check-cast p0, Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 1510
    .line 1511
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 1512
    .line 1513
    return v1

    .line 1514
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/data/UssTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1515
    .line 1516
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1517
    .line 1518
    .line 1519
    move-result-object p0

    .line 1520
    check-cast p0, Lcom/p1/mobile/putong/data/UssTags;

    .line 1521
    .line 1522
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 1523
    .line 1524
    return v1

    .line 1525
    :pswitch_30
    sget-object p0, Lcom/p1/mobile/putong/data/Profile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1526
    .line 1527
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1528
    .line 1529
    .line 1530
    move-result-object p0

    .line 1531
    check-cast p0, Lcom/p1/mobile/putong/data/Profile;

    .line 1532
    .line 1533
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1534
    .line 1535
    return v1

    .line 1536
    :pswitch_31
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1537
    .line 1538
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1539
    .line 1540
    .line 1541
    move-result-object p0

    .line 1542
    check-cast p0, Ljava/lang/Double;

    .line 1543
    .line 1544
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 1545
    .line 1546
    .line 1547
    move-result-wide p2

    .line 1548
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 1549
    .line 1550
    return v1

    .line 1551
    :pswitch_32
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1552
    .line 1553
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1554
    .line 1555
    .line 1556
    move-result-object p0

    .line 1557
    check-cast p0, Ljava/lang/Double;

    .line 1558
    .line 1559
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 1560
    .line 1561
    .line 1562
    move-result-wide p2

    .line 1563
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 1564
    .line 1565
    return v1

    .line 1566
    :pswitch_33
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1567
    .line 1568
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1569
    .line 1570
    .line 1571
    move-result-object p0

    .line 1572
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 1573
    .line 1574
    return v1

    .line 1575
    :pswitch_34
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1576
    .line 1577
    .line 1578
    move-result-object p0

    .line 1579
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 1580
    .line 1581
    return v1

    .line 1582
    :pswitch_35
    sget-object p0, Lcom/p1/mobile/putong/data/StatusesItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1583
    .line 1584
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1585
    .line 1586
    .line 1587
    move-result-object p0

    .line 1588
    check-cast p0, Lcom/p1/mobile/putong/data/StatusesItem;

    .line 1589
    .line 1590
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 1591
    .line 1592
    return v1

    .line 1593
    :pswitch_36
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1594
    .line 1595
    .line 1596
    move-result p0

    .line 1597
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 1598
    .line 1599
    return v1

    .line 1600
    :pswitch_37
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1601
    .line 1602
    .line 1603
    move-result-object p0

    .line 1604
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 1605
    .line 1606
    return v1

    .line 1607
    :pswitch_38
    sget-object p0, Lcom/p1/mobile/putong/data/UserStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1608
    .line 1609
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1610
    .line 1611
    .line 1612
    move-result-object p0

    .line 1613
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 1614
    .line 1615
    return v1

    .line 1616
    :pswitch_39
    sget-object p0, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1617
    .line 1618
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1619
    .line 1620
    .line 1621
    move-result-object p0

    .line 1622
    check-cast p0, Lcom/p1/mobile/putong/data/UserSource;

    .line 1623
    .line 1624
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 1625
    .line 1626
    return v1

    .line 1627
    :pswitch_3a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1628
    .line 1629
    .line 1630
    move-result p0

    .line 1631
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 1632
    .line 1633
    return v1

    .line 1634
    :pswitch_3b
    sget-object p0, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1635
    .line 1636
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1637
    .line 1638
    .line 1639
    move-result-object p0

    .line 1640
    check-cast p0, Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 1641
    .line 1642
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 1643
    .line 1644
    return v1

    .line 1645
    :pswitch_3c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1646
    .line 1647
    .line 1648
    move-result-wide p2

    .line 1649
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 1650
    .line 1651
    return v1

    .line 1652
    :pswitch_3d
    sget-object p0, Lcom/p1/mobile/putong/data/PrivateAnswer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1653
    .line 1654
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1655
    .line 1656
    .line 1657
    move-result-object p0

    .line 1658
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 1659
    .line 1660
    return v1

    .line 1661
    :pswitch_3e
    sget-object p0, Lcom/p1/mobile/putong/data/TotalRewardPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1662
    .line 1663
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1664
    .line 1665
    .line 1666
    move-result-object p0

    .line 1667
    check-cast p0, Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 1668
    .line 1669
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 1670
    .line 1671
    return v1

    .line 1672
    :pswitch_3f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1673
    .line 1674
    .line 1675
    move-result p0

    .line 1676
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 1677
    .line 1678
    return v1

    .line 1679
    :pswitch_40
    sget-object p0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1680
    .line 1681
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1682
    .line 1683
    .line 1684
    move-result-object p0

    .line 1685
    check-cast p0, Lcom/p1/mobile/putong/data/Gender;

    .line 1686
    .line 1687
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 1688
    .line 1689
    return v1

    .line 1690
    :pswitch_41
    sget-object p0, Lcom/p1/mobile/putong/data/SpecialEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1691
    .line 1692
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1693
    .line 1694
    .line 1695
    move-result-object p0

    .line 1696
    check-cast p0, Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 1697
    .line 1698
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 1699
    .line 1700
    return v1

    .line 1701
    :pswitch_42
    sget-object p0, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1702
    .line 1703
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1704
    .line 1705
    .line 1706
    move-result-object p0

    .line 1707
    check-cast p0, Lcom/p1/mobile/putong/data/Membership;

    .line 1708
    .line 1709
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 1710
    .line 1711
    return v1

    .line 1712
    :pswitch_43
    sget-object p0, Lcom/p1/mobile/putong/data/UserCreditData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1713
    .line 1714
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1715
    .line 1716
    .line 1717
    move-result-object p0

    .line 1718
    check-cast p0, Lcom/p1/mobile/putong/data/UserCreditData;

    .line 1719
    .line 1720
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 1721
    .line 1722
    return v1

    .line 1723
    :pswitch_44
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1724
    .line 1725
    .line 1726
    move-result-object p0

    .line 1727
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 1728
    .line 1729
    return v1

    .line 1730
    :pswitch_45
    sget-object p0, Lcom/p1/mobile/putong/data/UserAbroad;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1731
    .line 1732
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 1733
    .line 1734
    .line 1735
    move-result-object p0

    .line 1736
    check-cast p0, Lcom/p1/mobile/putong/data/UserAbroad;

    .line 1737
    .line 1738
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 1739
    .line 1740
    return v1

    .line 1741
    :pswitch_46
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 1742
    .line 1743
    .line 1744
    move-result-wide p2

    .line 1745
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 1746
    .line 1747
    return v1

    .line 1748
    :pswitch_47
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1749
    .line 1750
    .line 1751
    move-result-object p0

    .line 1752
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 1753
    .line 1754
    return v1

    .line 1755
    :pswitch_48
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1756
    .line 1757
    .line 1758
    move-result p0

    .line 1759
    iput p0, p1, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 1760
    .line 1761
    return v1

    .line 1762
    :pswitch_49
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1763
    .line 1764
    .line 1765
    move-result-wide p2

    .line 1766
    double-to-float p0, p2

    .line 1767
    iput p0, p1, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 1768
    .line 1769
    return v1

    .line 1770
    :pswitch_4a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1771
    .line 1772
    .line 1773
    move-result-object p0

    .line 1774
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 1775
    .line 1776
    return v1

    .line 1777
    :pswitch_4b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1778
    .line 1779
    .line 1780
    move-result p0

    .line 1781
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 1782
    .line 1783
    return v1

    .line 1784
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7ad061e8 -> :sswitch_4b
        -0x78d39a0c -> :sswitch_4a
        -0x789df4cb -> :sswitch_49
        -0x6e6d0ade -> :sswitch_48
        -0x66ca7c04 -> :sswitch_47
        -0x5fdae091 -> :sswitch_46
        -0x54df6d3f -> :sswitch_45
        -0x51b8999a -> :sswitch_44
        -0x509a5507 -> :sswitch_43
        -0x4fe2782a -> :sswitch_42
        -0x4dba4856 -> :sswitch_41
        -0x4a7a0d3f -> :sswitch_40
        -0x465a5cc1 -> :sswitch_3f
        -0x448aea43 -> :sswitch_3e
        -0x43f47e8e -> :sswitch_3d
        -0x4304195f -> :sswitch_3c
        -0x3c56d500 -> :sswitch_3b
        -0x36633f09 -> :sswitch_3a
        -0x356f97e5 -> :sswitch_39
        -0x3532300e -> :sswitch_38
        -0x3347b6b7 -> :sswitch_37
        -0x2d0dd160 -> :sswitch_36
        -0x2c9b1da3 -> :sswitch_35
        -0x2c04ea38 -> :sswitch_34
        -0x2b84bccb -> :sswitch_33
        -0x1e7113fb -> :sswitch_32
        -0x1d336e2b -> :sswitch_31
        -0x12717657 -> :sswitch_30
        -0x80d64b2 -> :sswitch_2f
        -0x411b543 -> :sswitch_2e
        0xd1b -> :sswitch_2d
        0x178ff -> :sswitch_2c
        0x337a8b -> :sswitch_2b
        0x267793d -> :sswitch_2a
        0x2ea82e3 -> :sswitch_29
        0x3be1bd4 -> :sswitch_28
        0x46e4c06 -> :sswitch_27
        0x587ea52 -> :sswitch_26
        0x5f6a055 -> :sswitch_25
        0x62f6ef7 -> :sswitch_24
        0x68ac491 -> :sswitch_23
        0x6b2e132 -> :sswitch_22
        0xe0f27e3 -> :sswitch_21
        0x102419ce -> :sswitch_20
        0x11f8fd56 -> :sswitch_1f
        0x123c56e8 -> :sswitch_1e
        0x152a8003 -> :sswitch_1d
        0x158ab64c -> :sswitch_1c
        0x164ce794 -> :sswitch_1b
        0x1c177555 -> :sswitch_1a
        0x1d494d67 -> :sswitch_19
        0x25d4c3b3 -> :sswitch_18
        0x3287b1c9 -> :sswitch_17
        0x3573f7fc -> :sswitch_16
        0x36f2de38 -> :sswitch_15
        0x3ae7ce3e -> :sswitch_14
        0x3b7ad705 -> :sswitch_13
        0x41de99a4 -> :sswitch_12
        0x46decad7 -> :sswitch_11
        0x4934edb8 -> :sswitch_10
        0x4d1ac564 -> :sswitch_f
        0x504550c6 -> :sswitch_e
        0x5393735d -> :sswitch_d
        0x54cdc4b9 -> :sswitch_c
        0x5582bc23 -> :sswitch_b
        0x573f4df3 -> :sswitch_a
        0x5c6a3019 -> :sswitch_9
        0x5ea0bc39 -> :sswitch_8
        0x6116337a -> :sswitch_7
        0x6156ffa7 -> :sswitch_6
        0x6363c1e8 -> :sswitch_5
        0x6501ac47 -> :sswitch_4
        0x6b411231 -> :sswitch_3
        0x6da4b0e1 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7e129235 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
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

    .line 1785
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/User$2;->parseField(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
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
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string v0, "hierarchy"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v3, 0x4b

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "location"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v3, 0x4a

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "banStatus"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v3, 0x49

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "fanbaseHierarchy"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v3, 0x48

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "finishedStages"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v3, 0x47

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "localLikeIdentifiers"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v3, 0x46

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "fakeStatus"

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v3, 0x45

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "activityUser"

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v3, 0x44

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "displayAudit"

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v3, 0x43

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "deleted"

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v3, 0x42

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "voiceLiveState"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v3, 0x41

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "settings"

    .line 171
    .line 172
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v3, 0x40

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "matePlanUser"

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v3, 0x3f

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "memberships"

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v3, 0x3e

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string v0, "signupStage"

    .line 213
    .line 214
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v3, 0x3d

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string v0, "publicId"

    .line 227
    .line 228
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_f

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v3, 0x3c

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string v0, "verifications"

    .line 241
    .line 242
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v3, 0x3b

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string v0, "goPlaceTimestamp"

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-nez v0, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v3, 0x3a

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string v0, "anonymousLike"

    .line 269
    .line 270
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v3, 0x39

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string v0, "liveState"

    .line 283
    .line 284
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-nez v0, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v3, 0x38

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string v0, "richListTracker"

    .line 297
    .line 298
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    if-nez v0, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v3, 0x37

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string v0, "diamondVIPExpiresTime"

    .line 311
    .line 312
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-nez v0, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v3, 0x36

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string v0, "matePlanAdUser"

    .line 325
    .line 326
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    if-nez v0, :cond_16

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :cond_16
    const/16 v3, 0x35

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string v0, "peepership"

    .line 339
    .line 340
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-nez v0, :cond_17

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_17
    const/16 v3, 0x34

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string v0, "popLevel"

    .line 353
    .line 354
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-nez v0, :cond_18

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :cond_18
    const/16 v3, 0x33

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string v0, "receivedLetter"

    .line 367
    .line 368
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    if-nez v0, :cond_19

    .line 373
    .line 374
    goto/16 :goto_0

    .line 375
    .line 376
    :cond_19
    const/16 v3, 0x32

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string v0, "abGroups"

    .line 381
    .line 382
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-nez v0, :cond_1a

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :cond_1a
    const/16 v3, 0x31

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string v0, "avatarFrame"

    .line 395
    .line 396
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    if-nez v0, :cond_1b

    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :cond_1b
    const/16 v3, 0x30

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string v0, "inactivated"

    .line 409
    .line 410
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-nez v0, :cond_1c

    .line 415
    .line 416
    goto/16 :goto_0

    .line 417
    .line 418
    :cond_1c
    const/16 v3, 0x2f

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string v0, "picksExpiredTimestamp"

    .line 423
    .line 424
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    if-nez v0, :cond_1d

    .line 429
    .line 430
    goto/16 :goto_0

    .line 431
    .line 432
    :cond_1d
    const/16 v3, 0x2e

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string v0, "sendLetterTimestamp"

    .line 437
    .line 438
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    if-nez v0, :cond_1e

    .line 443
    .line 444
    goto/16 :goto_0

    .line 445
    .line 446
    :cond_1e
    const/16 v3, 0x2d

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string v0, "privateAnswersUpdatedTime"

    .line 451
    .line 452
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    if-nez v0, :cond_1f

    .line 457
    .line 458
    goto/16 :goto_0

    .line 459
    .line 460
    :cond_1f
    const/16 v3, 0x2c

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string v0, "sendLetter"

    .line 465
    .line 466
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    if-nez v0, :cond_20

    .line 471
    .line 472
    goto/16 :goto_0

    .line 473
    .line 474
    :cond_20
    const/16 v3, 0x2b

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string v0, "ussTracker"

    .line 479
    .line 480
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    move-result v0

    .line 484
    if-nez v0, :cond_21

    .line 485
    .line 486
    goto/16 :goto_0

    .line 487
    .line 488
    :cond_21
    const/16 v3, 0x2a

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string v0, "voice"

    .line 493
    .line 494
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    if-nez v0, :cond_22

    .line 499
    .line 500
    goto/16 :goto_0

    .line 501
    .line 502
    :cond_22
    const/16 v3, 0x29

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string v0, "state"

    .line 507
    .line 508
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    move-result v0

    .line 512
    if-nez v0, :cond_23

    .line 513
    .line 514
    goto/16 :goto_0

    .line 515
    .line 516
    :cond_23
    const/16 v3, 0x28

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string v0, "medal"

    .line 521
    .line 522
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    if-nez v0, :cond_24

    .line 527
    .line 528
    goto/16 :goto_0

    .line 529
    .line 530
    :cond_24
    const/16 v3, 0x27

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string v0, "ideal"

    .line 535
    .line 536
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    move-result v0

    .line 540
    if-nez v0, :cond_25

    .line 541
    .line 542
    goto/16 :goto_0

    .line 543
    .line 544
    :cond_25
    const/16 v3, 0x26

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string v0, "aiTag"

    .line 549
    .line 550
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    move-result v0

    .line 554
    if-nez v0, :cond_26

    .line 555
    .line 556
    goto/16 :goto_0

    .line 557
    .line 558
    :cond_26
    const/16 v3, 0x25

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string v0, "regionTag"

    .line 563
    .line 564
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    move-result v0

    .line 568
    if-nez v0, :cond_27

    .line 569
    .line 570
    goto/16 :goto_0

    .line 571
    .line 572
    :cond_27
    const/16 v3, 0x24

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string v0, "localSeeReminderType"

    .line 577
    .line 578
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 579
    .line 580
    .line 581
    move-result v0

    .line 582
    if-nez v0, :cond_28

    .line 583
    .line 584
    goto/16 :goto_0

    .line 585
    .line 586
    :cond_28
    const/16 v3, 0x23

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string v0, "richListPosition"

    .line 591
    .line 592
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    move-result v0

    .line 596
    if-nez v0, :cond_29

    .line 597
    .line 598
    goto/16 :goto_0

    .line 599
    .line 600
    :cond_29
    const/16 v3, 0x22

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string v0, "liveRevenueCampaignVip"

    .line 605
    .line 606
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    move-result v0

    .line 610
    if-nez v0, :cond_2a

    .line 611
    .line 612
    goto/16 :goto_0

    .line 613
    .line 614
    :cond_2a
    const/16 v3, 0x21

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string v0, "name"

    .line 619
    .line 620
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    move-result v0

    .line 624
    if-nez v0, :cond_2b

    .line 625
    .line 626
    goto/16 :goto_0

    .line 627
    .line 628
    :cond_2b
    const/16 v3, 0x20

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_2c
    const-string v0, "age"

    .line 633
    .line 634
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 635
    .line 636
    .line 637
    move-result v0

    .line 638
    if-nez v0, :cond_2c

    .line 639
    .line 640
    goto/16 :goto_0

    .line 641
    .line 642
    :cond_2c
    const/16 v3, 0x1f

    .line 643
    .line 644
    goto/16 :goto_0

    .line 645
    .line 646
    :sswitch_2d
    const-string v0, "id"

    .line 647
    .line 648
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    move-result v0

    .line 652
    if-nez v0, :cond_2d

    .line 653
    .line 654
    goto/16 :goto_0

    .line 655
    .line 656
    :cond_2d
    const/16 v3, 0x1e

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_2e
    const-string v0, "soul-settings"

    .line 661
    .line 662
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    move-result v0

    .line 666
    if-nez v0, :cond_2e

    .line 667
    .line 668
    goto/16 :goto_0

    .line 669
    .line 670
    :cond_2e
    const/16 v3, 0x1d

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_2f
    const-string v0, "ussTags"

    .line 675
    .line 676
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    if-nez v0, :cond_2f

    .line 681
    .line 682
    goto/16 :goto_0

    .line 683
    .line 684
    :cond_2f
    const/16 v3, 0x1c

    .line 685
    .line 686
    goto/16 :goto_0

    .line 687
    .line 688
    :sswitch_30
    const-string v0, "profile"

    .line 689
    .line 690
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 691
    .line 692
    .line 693
    move-result v0

    .line 694
    if-nez v0, :cond_30

    .line 695
    .line 696
    goto/16 :goto_0

    .line 697
    .line 698
    :cond_30
    const/16 v3, 0x1b

    .line 699
    .line 700
    goto/16 :goto_0

    .line 701
    .line 702
    :sswitch_31
    const-string v0, "createdTime"

    .line 703
    .line 704
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    if-nez v0, :cond_31

    .line 709
    .line 710
    goto/16 :goto_0

    .line 711
    .line 712
    :cond_31
    const/16 v3, 0x1a

    .line 713
    .line 714
    goto/16 :goto_0

    .line 715
    .line 716
    :sswitch_32
    const-string v0, "signupTime"

    .line 717
    .line 718
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 719
    .line 720
    .line 721
    move-result v0

    .line 722
    if-nez v0, :cond_32

    .line 723
    .line 724
    goto/16 :goto_0

    .line 725
    .line 726
    :cond_32
    const/16 v3, 0x19

    .line 727
    .line 728
    goto/16 :goto_0

    .line 729
    .line 730
    :sswitch_33
    const-string v0, "pictures"

    .line 731
    .line 732
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 733
    .line 734
    .line 735
    move-result v0

    .line 736
    if-nez v0, :cond_33

    .line 737
    .line 738
    goto/16 :goto_0

    .line 739
    .line 740
    :cond_33
    const/16 v3, 0x18

    .line 741
    .line 742
    goto/16 :goto_0

    .line 743
    .line 744
    :sswitch_34
    const-string v0, "picksTag"

    .line 745
    .line 746
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 747
    .line 748
    .line 749
    move-result v0

    .line 750
    if-nez v0, :cond_34

    .line 751
    .line 752
    goto/16 :goto_0

    .line 753
    .line 754
    :cond_34
    const/16 v3, 0x17

    .line 755
    .line 756
    goto/16 :goto_0

    .line 757
    .line 758
    :sswitch_35
    const-string v0, "nameStatus"

    .line 759
    .line 760
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 761
    .line 762
    .line 763
    move-result v0

    .line 764
    if-nez v0, :cond_35

    .line 765
    .line 766
    goto/16 :goto_0

    .line 767
    .line 768
    :cond_35
    const/16 v3, 0x16

    .line 769
    .line 770
    goto/16 :goto_0

    .line 771
    .line 772
    :sswitch_36
    const-string v0, "localLetterUnRead"

    .line 773
    .line 774
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 775
    .line 776
    .line 777
    move-result v0

    .line 778
    if-nez v0, :cond_36

    .line 779
    .line 780
    goto/16 :goto_0

    .line 781
    .line 782
    :cond_36
    const/16 v3, 0x15

    .line 783
    .line 784
    goto/16 :goto_0

    .line 785
    .line 786
    :sswitch_37
    const-string v0, "realName"

    .line 787
    .line 788
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    if-nez v0, :cond_37

    .line 793
    .line 794
    goto/16 :goto_0

    .line 795
    .line 796
    :cond_37
    const/16 v3, 0x14

    .line 797
    .line 798
    goto/16 :goto_0

    .line 799
    .line 800
    :sswitch_38
    const-string v0, "status"

    .line 801
    .line 802
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 803
    .line 804
    .line 805
    move-result v0

    .line 806
    if-nez v0, :cond_38

    .line 807
    .line 808
    goto/16 :goto_0

    .line 809
    .line 810
    :cond_38
    const/16 v3, 0x13

    .line 811
    .line 812
    goto/16 :goto_0

    .line 813
    .line 814
    :sswitch_39
    const-string v0, "source"

    .line 815
    .line 816
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 817
    .line 818
    .line 819
    move-result v0

    .line 820
    if-nez v0, :cond_39

    .line 821
    .line 822
    goto/16 :goto_0

    .line 823
    .line 824
    :cond_39
    const/16 v3, 0x12

    .line 825
    .line 826
    goto/16 :goto_0

    .line 827
    .line 828
    :sswitch_3a
    const-string v0, "picksSwipable"

    .line 829
    .line 830
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 831
    .line 832
    .line 833
    move-result v0

    .line 834
    if-nez v0, :cond_3a

    .line 835
    .line 836
    goto/16 :goto_0

    .line 837
    .line 838
    :cond_3a
    const/16 v3, 0x11

    .line 839
    .line 840
    goto/16 :goto_0

    .line 841
    .line 842
    :sswitch_3b
    const-string v0, "anchorHierarchy"

    .line 843
    .line 844
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 845
    .line 846
    .line 847
    move-result v0

    .line 848
    if-nez v0, :cond_3b

    .line 849
    .line 850
    goto/16 :goto_0

    .line 851
    .line 852
    :cond_3b
    const/16 v3, 0x10

    .line 853
    .line 854
    goto/16 :goto_0

    .line 855
    .line 856
    :sswitch_3c
    const-string v0, "localLatestReceivedMessageTime"

    .line 857
    .line 858
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 859
    .line 860
    .line 861
    move-result v0

    .line 862
    if-nez v0, :cond_3c

    .line 863
    .line 864
    goto/16 :goto_0

    .line 865
    .line 866
    :cond_3c
    const/16 v3, 0xf

    .line 867
    .line 868
    goto/16 :goto_0

    .line 869
    .line 870
    :sswitch_3d
    const-string v0, "privateAnswers"

    .line 871
    .line 872
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 873
    .line 874
    .line 875
    move-result v0

    .line 876
    if-nez v0, :cond_3d

    .line 877
    .line 878
    goto/16 :goto_0

    .line 879
    .line 880
    :cond_3d
    const/16 v3, 0xe

    .line 881
    .line 882
    goto/16 :goto_0

    .line 883
    .line 884
    :sswitch_3e
    const-string v0, "totalRewardPoint"

    .line 885
    .line 886
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 887
    .line 888
    .line 889
    move-result v0

    .line 890
    if-nez v0, :cond_3e

    .line 891
    .line 892
    goto/16 :goto_0

    .line 893
    .line 894
    :cond_3e
    const/16 v3, 0xd

    .line 895
    .line 896
    goto/16 :goto_0

    .line 897
    .line 898
    :sswitch_3f
    const-string v0, "isLord"

    .line 899
    .line 900
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 901
    .line 902
    .line 903
    move-result v0

    .line 904
    if-nez v0, :cond_3f

    .line 905
    .line 906
    goto/16 :goto_0

    .line 907
    .line 908
    :cond_3f
    const/16 v3, 0xc

    .line 909
    .line 910
    goto/16 :goto_0

    .line 911
    .line 912
    :sswitch_40
    const-string v0, "gender"

    .line 913
    .line 914
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 915
    .line 916
    .line 917
    move-result v0

    .line 918
    if-nez v0, :cond_40

    .line 919
    .line 920
    goto/16 :goto_0

    .line 921
    .line 922
    :cond_40
    const/16 v3, 0xb

    .line 923
    .line 924
    goto/16 :goto_0

    .line 925
    .line 926
    :sswitch_41
    const-string v0, "specialEffect"

    .line 927
    .line 928
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 929
    .line 930
    .line 931
    move-result v0

    .line 932
    if-nez v0, :cond_41

    .line 933
    .line 934
    goto/16 :goto_0

    .line 935
    .line 936
    :cond_41
    const/16 v3, 0xa

    .line 937
    .line 938
    goto/16 :goto_0

    .line 939
    .line 940
    :sswitch_42
    const-string v0, "membership"

    .line 941
    .line 942
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 943
    .line 944
    .line 945
    move-result v0

    .line 946
    if-nez v0, :cond_42

    .line 947
    .line 948
    goto/16 :goto_0

    .line 949
    .line 950
    :cond_42
    const/16 v3, 0x9

    .line 951
    .line 952
    goto/16 :goto_0

    .line 953
    .line 954
    :sswitch_43
    const-string v0, "credit"

    .line 955
    .line 956
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 957
    .line 958
    .line 959
    move-result v0

    .line 960
    if-nez v0, :cond_43

    .line 961
    .line 962
    goto/16 :goto_0

    .line 963
    .line 964
    :cond_43
    const/16 v3, 0x8

    .line 965
    .line 966
    goto/16 :goto_0

    .line 967
    .line 968
    :sswitch_44
    const-string v0, "picksTracker"

    .line 969
    .line 970
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 971
    .line 972
    .line 973
    move-result v0

    .line 974
    if-nez v0, :cond_44

    .line 975
    .line 976
    goto :goto_0

    .line 977
    :cond_44
    const/4 v3, 0x7

    .line 978
    goto :goto_0

    .line 979
    :sswitch_45
    const-string v0, "abroad"

    .line 980
    .line 981
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 982
    .line 983
    .line 984
    move-result v0

    .line 985
    if-nez v0, :cond_45

    .line 986
    .line 987
    goto :goto_0

    .line 988
    :cond_45
    const/4 v3, 0x6

    .line 989
    goto :goto_0

    .line 990
    :sswitch_46
    const-string v0, "receivedLetterTimestamp"

    .line 991
    .line 992
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 993
    .line 994
    .line 995
    move-result v0

    .line 996
    if-nez v0, :cond_46

    .line 997
    .line 998
    goto :goto_0

    .line 999
    :cond_46
    const/4 v3, 0x5

    .line 1000
    goto :goto_0

    .line 1001
    :sswitch_47
    const-string v0, "description"

    .line 1002
    .line 1003
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1004
    .line 1005
    .line 1006
    move-result v0

    .line 1007
    if-nez v0, :cond_47

    .line 1008
    .line 1009
    goto :goto_0

    .line 1010
    :cond_47
    const/4 v3, 0x4

    .line 1011
    goto :goto_0

    .line 1012
    :sswitch_48
    const-string v0, "picksTagType"

    .line 1013
    .line 1014
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1015
    .line 1016
    .line 1017
    move-result v0

    .line 1018
    if-nez v0, :cond_48

    .line 1019
    .line 1020
    goto :goto_0

    .line 1021
    :cond_48
    const/4 v3, 0x3

    .line 1022
    goto :goto_0

    .line 1023
    :sswitch_49
    const-string v0, "popularity"

    .line 1024
    .line 1025
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1026
    .line 1027
    .line 1028
    move-result v0

    .line 1029
    if-nez v0, :cond_49

    .line 1030
    .line 1031
    goto :goto_0

    .line 1032
    :cond_49
    const/4 v3, 0x2

    .line 1033
    goto :goto_0

    .line 1034
    :sswitch_4a
    const-string v0, "richListType"

    .line 1035
    .line 1036
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1037
    .line 1038
    .line 1039
    move-result v0

    .line 1040
    if-nez v0, :cond_4a

    .line 1041
    .line 1042
    goto :goto_0

    .line 1043
    :cond_4a
    move v3, v2

    .line 1044
    goto :goto_0

    .line 1045
    :sswitch_4b
    const-string v0, "aiOrderPicture"

    .line 1046
    .line 1047
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1048
    .line 1049
    .line 1050
    move-result v0

    .line 1051
    if-nez v0, :cond_4b

    .line 1052
    .line 1053
    goto :goto_0

    .line 1054
    :cond_4b
    move v3, v1

    .line 1055
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 1056
    .line 1057
    .line 1058
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 1059
    .line 1060
    .line 1061
    move-result p0

    .line 1062
    return p0

    .line 1063
    :pswitch_0
    return v2

    .line 1064
    :pswitch_1
    return v1

    .line 1065
    :pswitch_2
    return v2

    .line 1066
    nop

    .line 1067
    :sswitch_data_0
    .sparse-switch
        -0x7ad061e8 -> :sswitch_4b
        -0x78d39a0c -> :sswitch_4a
        -0x789df4cb -> :sswitch_49
        -0x6e6d0ade -> :sswitch_48
        -0x66ca7c04 -> :sswitch_47
        -0x5fdae091 -> :sswitch_46
        -0x54df6d3f -> :sswitch_45
        -0x51b8999a -> :sswitch_44
        -0x509a5507 -> :sswitch_43
        -0x4fe2782a -> :sswitch_42
        -0x4dba4856 -> :sswitch_41
        -0x4a7a0d3f -> :sswitch_40
        -0x465a5cc1 -> :sswitch_3f
        -0x448aea43 -> :sswitch_3e
        -0x43f47e8e -> :sswitch_3d
        -0x4304195f -> :sswitch_3c
        -0x3c56d500 -> :sswitch_3b
        -0x36633f09 -> :sswitch_3a
        -0x356f97e5 -> :sswitch_39
        -0x3532300e -> :sswitch_38
        -0x3347b6b7 -> :sswitch_37
        -0x2d0dd160 -> :sswitch_36
        -0x2c9b1da3 -> :sswitch_35
        -0x2c04ea38 -> :sswitch_34
        -0x2b84bccb -> :sswitch_33
        -0x1e7113fb -> :sswitch_32
        -0x1d336e2b -> :sswitch_31
        -0x12717657 -> :sswitch_30
        -0x80d64b2 -> :sswitch_2f
        -0x411b543 -> :sswitch_2e
        0xd1b -> :sswitch_2d
        0x178ff -> :sswitch_2c
        0x337a8b -> :sswitch_2b
        0x267793d -> :sswitch_2a
        0x2ea82e3 -> :sswitch_29
        0x3be1bd4 -> :sswitch_28
        0x46e4c06 -> :sswitch_27
        0x587ea52 -> :sswitch_26
        0x5f6a055 -> :sswitch_25
        0x62f6ef7 -> :sswitch_24
        0x68ac491 -> :sswitch_23
        0x6b2e132 -> :sswitch_22
        0xe0f27e3 -> :sswitch_21
        0x102419ce -> :sswitch_20
        0x11f8fd56 -> :sswitch_1f
        0x123c56e8 -> :sswitch_1e
        0x152a8003 -> :sswitch_1d
        0x158ab64c -> :sswitch_1c
        0x164ce794 -> :sswitch_1b
        0x1c177555 -> :sswitch_1a
        0x1d494d67 -> :sswitch_19
        0x25d4c3b3 -> :sswitch_18
        0x3287b1c9 -> :sswitch_17
        0x3573f7fc -> :sswitch_16
        0x36f2de38 -> :sswitch_15
        0x3ae7ce3e -> :sswitch_14
        0x3b7ad705 -> :sswitch_13
        0x41de99a4 -> :sswitch_12
        0x46decad7 -> :sswitch_11
        0x4934edb8 -> :sswitch_10
        0x4d1ac564 -> :sswitch_f
        0x504550c6 -> :sswitch_e
        0x5393735d -> :sswitch_d
        0x54cdc4b9 -> :sswitch_c
        0x5582bc23 -> :sswitch_b
        0x573f4df3 -> :sswitch_a
        0x5c6a3019 -> :sswitch_9
        0x5ea0bc39 -> :sswitch_8
        0x6116337a -> :sswitch_7
        0x6156ffa7 -> :sswitch_6
        0x6363c1e8 -> :sswitch_5
        0x6501ac47 -> :sswitch_4
        0x6b411231 -> :sswitch_3
        0x6da4b0e1 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x7e129235 -> :sswitch_0
    .end sparse-switch

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
    .line 1096
    .line 1097
    .line 1098
    .line 1099
    .line 1100
    .line 1101
    .line 1102
    .line 1103
    .line 1104
    .line 1105
    .line 1106
    .line 1107
    .line 1108
    .line 1109
    .line 1110
    .line 1111
    .line 1112
    .line 1113
    .line 1114
    .line 1115
    .line 1116
    .line 1117
    .line 1118
    .line 1119
    .line 1120
    .line 1121
    .line 1122
    .line 1123
    .line 1124
    .line 1125
    .line 1126
    .line 1127
    .line 1128
    .line 1129
    .line 1130
    .line 1131
    .line 1132
    .line 1133
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
    .line 1279
    .line 1280
    .line 1281
    .line 1282
    .line 1283
    .line 1284
    .line 1285
    .line 1286
    .line 1287
    .line 1288
    .line 1289
    .line 1290
    .line 1291
    .line 1292
    .line 1293
    .line 1294
    .line 1295
    .line 1296
    .line 1297
    .line 1298
    .line 1299
    .line 1300
    .line 1301
    .line 1302
    .line 1303
    .line 1304
    .line 1305
    .line 1306
    .line 1307
    .line 1308
    .line 1309
    .line 1310
    .line 1311
    .line 1312
    .line 1313
    .line 1314
    .line 1315
    .line 1316
    .line 1317
    .line 1318
    .line 1319
    .line 1320
    .line 1321
    .line 1322
    .line 1323
    .line 1324
    .line 1325
    .line 1326
    .line 1327
    .line 1328
    .line 1329
    .line 1330
    .line 1331
    .line 1332
    .line 1333
    .line 1334
    .line 1335
    .line 1336
    .line 1337
    .line 1338
    .line 1339
    .line 1340
    .line 1341
    .line 1342
    .line 1343
    .line 1344
    .line 1345
    .line 1346
    .line 1347
    .line 1348
    .line 1349
    .line 1350
    .line 1351
    .line 1352
    .line 1353
    .line 1354
    .line 1355
    .line 1356
    .line 1357
    .line 1358
    .line 1359
    .line 1360
    .line 1361
    .line 1362
    .line 1363
    .line 1364
    .line 1365
    .line 1366
    .line 1367
    .line 1368
    .line 1369
    .line 1370
    .line 1371
    .line 1372
    .line 1373
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
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

    .line 1067
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/User$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/User;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    const-string p0, "location"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/data/Location;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 32
    .line 33
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string v1, "description"

    .line 41
    .line 42
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "age"

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    const-string p0, "pictures"

    .line 63
    .line 64
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 70
    .line 71
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_5
    const-string p0, "createdTime"

    .line 75
    .line 76
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 80
    .line 81
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 82
    .line 83
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    const-string v1, "profile"

    .line 95
    .line 96
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/Profile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 100
    .line 101
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 102
    .line 103
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 104
    .line 105
    .line 106
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v1, :cond_7

    .line 109
    .line 110
    const-string v1, "status"

    .line 111
    .line 112
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 116
    .line 117
    sget-object v2, Lcom/p1/mobile/putong/data/UserStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 118
    .line 119
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 123
    .line 124
    if-eqz v1, :cond_8

    .line 125
    .line 126
    const-string v1, "settings"

    .line 127
    .line 128
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/data/Settings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 132
    .line 133
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 134
    .line 135
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 136
    .line 137
    .line 138
    :cond_8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 139
    .line 140
    if-eqz v1, :cond_9

    .line 141
    .line 142
    const-string v1, "gender"

    .line 143
    .line 144
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 148
    .line 149
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 150
    .line 151
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 152
    .line 153
    .line 154
    :cond_9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 155
    .line 156
    if-eqz v1, :cond_a

    .line 157
    .line 158
    const-string v1, "membership"

    .line 159
    .line 160
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 164
    .line 165
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 166
    .line 167
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 168
    .line 169
    .line 170
    :cond_a
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 171
    .line 172
    if-eqz v1, :cond_b

    .line 173
    .line 174
    const-string v1, "source"

    .line 175
    .line 176
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    sget-object v1, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 180
    .line 181
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 182
    .line 183
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 184
    .line 185
    .line 186
    :cond_b
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz v1, :cond_c

    .line 189
    .line 190
    const-string v2, "realName"

    .line 191
    .line 192
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    :cond_c
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 196
    .line 197
    if-eqz v1, :cond_d

    .line 198
    .line 199
    const-string v1, "memberships"

    .line 200
    .line 201
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 205
    .line 206
    sget-object v2, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 207
    .line 208
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 209
    .line 210
    .line 211
    :cond_d
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 212
    .line 213
    if-eqz v1, :cond_e

    .line 214
    .line 215
    const-string v1, "state"

    .line 216
    .line 217
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    sget-object v1, Lcom/p1/mobile/putong/data/UserState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 221
    .line 222
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 223
    .line 224
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 225
    .line 226
    .line 227
    :cond_e
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 228
    .line 229
    if-eqz v1, :cond_f

    .line 230
    .line 231
    const-string v1, "verifications"

    .line 232
    .line 233
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    sget-object v1, Lcom/p1/mobile/putong/data/PicVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 237
    .line 238
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 239
    .line 240
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 241
    .line 242
    .line 243
    :cond_f
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 244
    .line 245
    if-eqz v1, :cond_10

    .line 246
    .line 247
    const-string v1, "abGroups"

    .line 248
    .line 249
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 253
    .line 254
    sget-object v2, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 255
    .line 256
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 257
    .line 258
    .line 259
    :cond_10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 260
    .line 261
    if-eqz v1, :cond_11

    .line 262
    .line 263
    const-string v1, "privateAnswers"

    .line 264
    .line 265
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 269
    .line 270
    sget-object v2, Lcom/p1/mobile/putong/data/PrivateAnswer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 271
    .line 272
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 273
    .line 274
    .line 275
    :cond_11
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 276
    .line 277
    if-eqz v1, :cond_12

    .line 278
    .line 279
    const-string v1, "peepership"

    .line 280
    .line 281
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 285
    .line 286
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 287
    .line 288
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 289
    .line 290
    .line 291
    :cond_12
    const-string v1, "picksExpiredTimestamp"

    .line 292
    .line 293
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 294
    .line 295
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 296
    .line 297
    .line 298
    const-string v1, "picksSwipable"

    .line 299
    .line 300
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 301
    .line 302
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 303
    .line 304
    .line 305
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 306
    .line 307
    if-eqz v1, :cond_13

    .line 308
    .line 309
    const-string v2, "picksTag"

    .line 310
    .line 311
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    :cond_13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 315
    .line 316
    if-eqz v1, :cond_14

    .line 317
    .line 318
    const-string v1, "credit"

    .line 319
    .line 320
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    sget-object v1, Lcom/p1/mobile/putong/data/UserCreditData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 324
    .line 325
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 326
    .line 327
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 328
    .line 329
    .line 330
    :cond_14
    const-string v1, "picksTagType"

    .line 331
    .line 332
    iget v2, p1, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 333
    .line 334
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 335
    .line 336
    .line 337
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 338
    .line 339
    if-eqz v1, :cond_15

    .line 340
    .line 341
    const-string v2, "picksTracker"

    .line 342
    .line 343
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    :cond_15
    const-string v1, "goPlaceTimestamp"

    .line 347
    .line 348
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 352
    .line 353
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 358
    .line 359
    .line 360
    const-string v1, "isLord"

    .line 361
    .line 362
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 363
    .line 364
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 365
    .line 366
    .line 367
    const-string v1, "privateAnswersUpdatedTime"

    .line 368
    .line 369
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 373
    .line 374
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 379
    .line 380
    .line 381
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 382
    .line 383
    if-eqz v1, :cond_16

    .line 384
    .line 385
    const-string v2, "sendLetter"

    .line 386
    .line 387
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    :cond_16
    const-string v1, "sendLetterTimestamp"

    .line 391
    .line 392
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 393
    .line 394
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 395
    .line 396
    .line 397
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 398
    .line 399
    if-eqz v1, :cond_17

    .line 400
    .line 401
    const-string v2, "receivedLetter"

    .line 402
    .line 403
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    :cond_17
    const-string v1, "receivedLetterTimestamp"

    .line 407
    .line 408
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 409
    .line 410
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 411
    .line 412
    .line 413
    const-string v1, "localLetterUnRead"

    .line 414
    .line 415
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 416
    .line 417
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 418
    .line 419
    .line 420
    const-string v1, "popLevel"

    .line 421
    .line 422
    iget v2, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 423
    .line 424
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 425
    .line 426
    .line 427
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 428
    .line 429
    if-eqz v1, :cond_18

    .line 430
    .line 431
    const-string v1, "voice"

    .line 432
    .line 433
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    sget-object v1, Lcom/p1/mobile/putong/data/AudioSignature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 437
    .line 438
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 439
    .line 440
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 441
    .line 442
    .line 443
    :cond_18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 444
    .line 445
    if-eqz v1, :cond_19

    .line 446
    .line 447
    const-string v1, "liveState"

    .line 448
    .line 449
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 453
    .line 454
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 455
    .line 456
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 457
    .line 458
    .line 459
    :cond_19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 460
    .line 461
    if-eqz v1, :cond_1a

    .line 462
    .line 463
    const-string v1, "ussTags"

    .line 464
    .line 465
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    sget-object v1, Lcom/p1/mobile/putong/data/UssTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 469
    .line 470
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 471
    .line 472
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 473
    .line 474
    .line 475
    :cond_1a
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 476
    .line 477
    if-eqz v1, :cond_1b

    .line 478
    .line 479
    const-string v1, "abroad"

    .line 480
    .line 481
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    sget-object v1, Lcom/p1/mobile/putong/data/UserAbroad;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 485
    .line 486
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 487
    .line 488
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 489
    .line 490
    .line 491
    :cond_1b
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 492
    .line 493
    if-eqz v1, :cond_1c

    .line 494
    .line 495
    const-string v1, "fakeStatus"

    .line 496
    .line 497
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    sget-object v1, Lcom/p1/mobile/putong/data/StatusesItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 501
    .line 502
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 503
    .line 504
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 505
    .line 506
    .line 507
    :cond_1c
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 508
    .line 509
    if-eqz v1, :cond_1d

    .line 510
    .line 511
    const-string v1, "nameStatus"

    .line 512
    .line 513
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    sget-object v1, Lcom/p1/mobile/putong/data/StatusesItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 517
    .line 518
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 519
    .line 520
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 521
    .line 522
    .line 523
    :cond_1d
    const-string v1, "displayAudit"

    .line 524
    .line 525
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 526
    .line 527
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 528
    .line 529
    .line 530
    const-string v1, "aiOrderPicture"

    .line 531
    .line 532
    iget-boolean v2, p1, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 533
    .line 534
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 535
    .line 536
    .line 537
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 538
    .line 539
    if-eqz v1, :cond_1e

    .line 540
    .line 541
    const-string v1, "medal"

    .line 542
    .line 543
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    sget-object v1, Lcom/p1/mobile/putong/data/UserMedalWrapper;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 547
    .line 548
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 549
    .line 550
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 551
    .line 552
    .line 553
    :cond_1e
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 554
    .line 555
    if-eqz v1, :cond_1f

    .line 556
    .line 557
    const-string v1, "signupStage"

    .line 558
    .line 559
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 560
    .line 561
    .line 562
    sget-object v1, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 563
    .line 564
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 565
    .line 566
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 567
    .line 568
    .line 569
    :cond_1f
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 570
    .line 571
    if-eqz v1, :cond_20

    .line 572
    .line 573
    const-string v2, "publicId"

    .line 574
    .line 575
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    :cond_20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 579
    .line 580
    if-eqz v1, :cond_21

    .line 581
    .line 582
    const-string v1, "soul-settings"

    .line 583
    .line 584
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    sget-object v1, Lcom/p1/mobile/putong/data/UserSoulSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 588
    .line 589
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 590
    .line 591
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 592
    .line 593
    .line 594
    :cond_21
    const-string v1, "richListPosition"

    .line 595
    .line 596
    iget v2, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 597
    .line 598
    invoke-virtual {p2, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 599
    .line 600
    .line 601
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 602
    .line 603
    if-eqz v1, :cond_22

    .line 604
    .line 605
    const-string v2, "richListTracker"

    .line 606
    .line 607
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    .line 609
    .line 610
    :cond_22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 611
    .line 612
    if-eqz v1, :cond_23

    .line 613
    .line 614
    const-string v2, "richListType"

    .line 615
    .line 616
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    :cond_23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 620
    .line 621
    if-eqz v1, :cond_24

    .line 622
    .line 623
    const-string v1, "liveRevenueCampaignVip"

    .line 624
    .line 625
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 626
    .line 627
    .line 628
    sget-object v1, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 629
    .line 630
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 631
    .line 632
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 633
    .line 634
    .line 635
    :cond_24
    const-string v1, "diamondVIPExpiresTime"

    .line 636
    .line 637
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 638
    .line 639
    .line 640
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 641
    .line 642
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 643
    .line 644
    .line 645
    move-result-object v1

    .line 646
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 647
    .line 648
    .line 649
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 650
    .line 651
    if-eqz v1, :cond_25

    .line 652
    .line 653
    const-string v2, "aiTag"

    .line 654
    .line 655
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    .line 657
    .line 658
    :cond_25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 659
    .line 660
    if-eqz v1, :cond_26

    .line 661
    .line 662
    const-string v1, "totalRewardPoint"

    .line 663
    .line 664
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 665
    .line 666
    .line 667
    sget-object v1, Lcom/p1/mobile/putong/data/TotalRewardPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 668
    .line 669
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 670
    .line 671
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 672
    .line 673
    .line 674
    :cond_26
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 675
    .line 676
    if-eqz v1, :cond_27

    .line 677
    .line 678
    const-string v2, "ussTracker"

    .line 679
    .line 680
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    .line 682
    .line 683
    :cond_27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 684
    .line 685
    if-eqz v1, :cond_28

    .line 686
    .line 687
    const-string v1, "anchorHierarchy"

    .line 688
    .line 689
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 690
    .line 691
    .line 692
    sget-object v1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 693
    .line 694
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 695
    .line 696
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 697
    .line 698
    .line 699
    :cond_28
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 700
    .line 701
    if-eqz v1, :cond_29

    .line 702
    .line 703
    const-string v1, "fanbaseHierarchy"

    .line 704
    .line 705
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 706
    .line 707
    .line 708
    sget-object v1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 709
    .line 710
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 711
    .line 712
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 713
    .line 714
    .line 715
    :cond_29
    const-string v1, "localLatestReceivedMessageTime"

    .line 716
    .line 717
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 718
    .line 719
    invoke-virtual {p2, v1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 720
    .line 721
    .line 722
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 723
    .line 724
    if-eqz v1, :cond_2a

    .line 725
    .line 726
    const-string v1, "avatarFrame"

    .line 727
    .line 728
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 729
    .line 730
    .line 731
    sget-object v1, Lcom/p1/mobile/putong/data/AvatarFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 732
    .line 733
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 734
    .line 735
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 736
    .line 737
    .line 738
    :cond_2a
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 739
    .line 740
    if-eqz v1, :cond_2b

    .line 741
    .line 742
    const-string v1, "hierarchy"

    .line 743
    .line 744
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 745
    .line 746
    .line 747
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 748
    .line 749
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 750
    .line 751
    invoke-virtual {v1, v2, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 752
    .line 753
    .line 754
    :cond_2b
    const-string v1, "signupTime"

    .line 755
    .line 756
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 757
    .line 758
    .line 759
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 760
    .line 761
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 766
    .line 767
    .line 768
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 769
    .line 770
    if-eqz p0, :cond_2c

    .line 771
    .line 772
    const-string p0, "banStatus"

    .line 773
    .line 774
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 775
    .line 776
    .line 777
    sget-object p0, Lcom/p1/mobile/putong/data/BanStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 778
    .line 779
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 780
    .line 781
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 782
    .line 783
    .line 784
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 785
    .line 786
    if-eqz p0, :cond_2d

    .line 787
    .line 788
    const-string p0, "anonymousLike"

    .line 789
    .line 790
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 791
    .line 792
    .line 793
    sget-object p0, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 794
    .line 795
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 796
    .line 797
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 798
    .line 799
    .line 800
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 801
    .line 802
    if-eqz p0, :cond_2e

    .line 803
    .line 804
    const-string p0, "finishedStages"

    .line 805
    .line 806
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 807
    .line 808
    .line 809
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 810
    .line 811
    sget-object v1, Lcom/p1/mobile/putong/data/StepSignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 812
    .line 813
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 814
    .line 815
    .line 816
    :cond_2e
    const-string p0, "inactivated"

    .line 817
    .line 818
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 819
    .line 820
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 821
    .line 822
    .line 823
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 824
    .line 825
    if-eqz p0, :cond_2f

    .line 826
    .line 827
    const-string p0, "activityUser"

    .line 828
    .line 829
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 830
    .line 831
    .line 832
    sget-object p0, Lcom/p1/mobile/putong/data/ActivityUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 833
    .line 834
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 835
    .line 836
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 837
    .line 838
    .line 839
    :cond_2f
    const-string p0, "matePlanUser"

    .line 840
    .line 841
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 842
    .line 843
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 844
    .line 845
    .line 846
    const-string p0, "matePlanAdUser"

    .line 847
    .line 848
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 849
    .line 850
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 851
    .line 852
    .line 853
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 854
    .line 855
    if-eqz p0, :cond_30

    .line 856
    .line 857
    const-string v1, "regionTag"

    .line 858
    .line 859
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    .line 861
    .line 862
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 863
    .line 864
    if-eqz p0, :cond_31

    .line 865
    .line 866
    const-string p0, "localLikeIdentifiers"

    .line 867
    .line 868
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 869
    .line 870
    .line 871
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 872
    .line 873
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 874
    .line 875
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 876
    .line 877
    .line 878
    :cond_31
    const-string p0, "deleted"

    .line 879
    .line 880
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 881
    .line 882
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 883
    .line 884
    .line 885
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 886
    .line 887
    if-eqz p0, :cond_32

    .line 888
    .line 889
    const-string p0, "voiceLiveState"

    .line 890
    .line 891
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 892
    .line 893
    .line 894
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveState;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 895
    .line 896
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 897
    .line 898
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 899
    .line 900
    .line 901
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 902
    .line 903
    if-eqz p0, :cond_33

    .line 904
    .line 905
    const-string v1, "localSeeReminderType"

    .line 906
    .line 907
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 908
    .line 909
    .line 910
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 911
    .line 912
    if-eqz p0, :cond_34

    .line 913
    .line 914
    const-string p0, "specialEffect"

    .line 915
    .line 916
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 917
    .line 918
    .line 919
    sget-object p0, Lcom/p1/mobile/putong/data/SpecialEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 920
    .line 921
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 922
    .line 923
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 924
    .line 925
    .line 926
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 927
    .line 928
    if-eqz p0, :cond_35

    .line 929
    .line 930
    const-string p0, "ideal"

    .line 931
    .line 932
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 933
    .line 934
    .line 935
    sget-object p0, Lcom/p1/mobile/putong/data/UserIdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 936
    .line 937
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 938
    .line 939
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 940
    .line 941
    .line 942
    :cond_35
    const-string p0, "popularity"

    .line 943
    .line 944
    iget p1, p1, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 945
    .line 946
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 947
    .line 948
    .line 949
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 950
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$2;->serializeFields(Lcom/p1/mobile/putong/data/User;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
