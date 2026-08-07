.class Lcom/p1/mobile/putong/data/SettingGroups$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SettingGroups;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/SettingGroups;",
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
    const-class p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SettingGroups$2;->newInstance()Lcom/p1/mobile/putong/data/SettingGroups;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/SettingGroups;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
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
    const-string p0, "diamondVIPPrivateMatch"

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
    const/16 v2, 0x24

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "adsMaterialRouter"

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
    const/16 v2, 0x23

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "svipSearch"

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
    const/16 v2, 0x22

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "soulmate"

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
    const/16 v2, 0x21

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "soulchat"

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
    const/16 v2, 0x20

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "subscription"

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
    const/16 v2, 0x1f

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "svipPrivacy"

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
    const/16 v2, 0x1e

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "marriage"

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
    const/16 v2, 0x1d

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "upvip"

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
    const/16 v2, 0x1c

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "spvip"

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
    const/16 v2, 0x1b

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "share"

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
    const/16 v2, 0x1a

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "cityC"

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
    const/16 v2, 0x19

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "boost"

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
    const/16 v2, 0x18

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "type"

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
    const/16 v2, 0x17

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "svip"

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
    const/16 v2, 0x16

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "pvip"

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
    const/16 v2, 0x15

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "push"

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
    const/16 v2, 0x14

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "live"

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
    const/16 v2, 0x13

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "fvip"

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
    const/16 v2, 0x12

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "fake"

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
    const/16 v2, 0x11

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "see"

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
    const/16 v2, 0x10

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "pet"

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
    const/16 v2, 0xf

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "momentLevel"

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
    const/16 v2, 0xe

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "profile"

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
    const/16 v2, 0xd

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "privacy"

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
    const/16 v2, 0xc

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "diamondVIP"

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
    const/16 v2, 0xb

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "decoration"

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
    const/16 v2, 0xa

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "search"

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
    const/16 v2, 0x9

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "tttribe"

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
    const/16 v2, 0x8

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "comDiamond"

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
    goto :goto_0

    .line 431
    :cond_1d
    const/4 v2, 0x7

    .line 432
    goto :goto_0

    .line 433
    :sswitch_1e
    const-string p0, "noPush"

    .line 434
    .line 435
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result p0

    .line 439
    if-nez p0, :cond_1e

    .line 440
    .line 441
    goto :goto_0

    .line 442
    :cond_1e
    const/4 v2, 0x6

    .line 443
    goto :goto_0

    .line 444
    :sswitch_1f
    const-string p0, "moment"

    .line 445
    .line 446
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 447
    .line 448
    .line 449
    move-result p0

    .line 450
    if-nez p0, :cond_1f

    .line 451
    .line 452
    goto :goto_0

    .line 453
    :cond_1f
    const/4 v2, 0x5

    .line 454
    goto :goto_0

    .line 455
    :sswitch_20
    const-string p0, "characterEvaluate"

    .line 456
    .line 457
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 458
    .line 459
    .line 460
    move-result p0

    .line 461
    if-nez p0, :cond_20

    .line 462
    .line 463
    goto :goto_0

    .line 464
    :cond_20
    const/4 v2, 0x4

    .line 465
    goto :goto_0

    .line 466
    :sswitch_21
    const-string p0, "growth"

    .line 467
    .line 468
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    move-result p0

    .line 472
    if-nez p0, :cond_21

    .line 473
    .line 474
    goto :goto_0

    .line 475
    :cond_21
    const/4 v2, 0x3

    .line 476
    goto :goto_0

    .line 477
    :sswitch_22
    const-string p0, "gender"

    .line 478
    .line 479
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 480
    .line 481
    .line 482
    move-result p0

    .line 483
    if-nez p0, :cond_22

    .line 484
    .line 485
    goto :goto_0

    .line 486
    :cond_22
    const/4 v2, 0x2

    .line 487
    goto :goto_0

    .line 488
    :sswitch_23
    const-string p0, "vipSearch"

    .line 489
    .line 490
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    move-result p0

    .line 494
    if-nez p0, :cond_23

    .line 495
    .line 496
    goto :goto_0

    .line 497
    :cond_23
    move v2, v1

    .line 498
    goto :goto_0

    .line 499
    :sswitch_24
    const-string p0, "quickchatchat"

    .line 500
    .line 501
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    move-result p0

    .line 505
    if-nez p0, :cond_24

    .line 506
    .line 507
    goto :goto_0

    .line 508
    :cond_24
    move v2, v0

    .line 509
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 510
    .line 511
    .line 512
    return v0

    .line 513
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 514
    .line 515
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    check-cast p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 520
    .line 521
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 522
    .line 523
    return v1

    .line 524
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 525
    .line 526
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object p0

    .line 530
    check-cast p0, Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 531
    .line 532
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 533
    .line 534
    return v1

    .line 535
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/SvipSearch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 536
    .line 537
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    move-result-object p0

    .line 541
    check-cast p0, Lcom/p1/mobile/putong/data/SvipSearch;

    .line 542
    .line 543
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 544
    .line 545
    return v1

    .line 546
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/SoulMatchGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 547
    .line 548
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 549
    .line 550
    .line 551
    move-result-object p0

    .line 552
    check-cast p0, Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 553
    .line 554
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 555
    .line 556
    return v1

    .line 557
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/ChatSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 558
    .line 559
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object p0

    .line 563
    check-cast p0, Lcom/p1/mobile/putong/data/ChatSetting;

    .line 564
    .line 565
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 566
    .line 567
    return v1

    .line 568
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 569
    .line 570
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object p0

    .line 574
    check-cast p0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 575
    .line 576
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 577
    .line 578
    return v1

    .line 579
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 580
    .line 581
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 582
    .line 583
    .line 584
    move-result-object p0

    .line 585
    check-cast p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 586
    .line 587
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 588
    .line 589
    return v1

    .line 590
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/MarrySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 591
    .line 592
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    move-result-object p0

    .line 596
    check-cast p0, Lcom/p1/mobile/putong/data/MarrySettings;

    .line 597
    .line 598
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 599
    .line 600
    return v1

    .line 601
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/UserUpVipSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 602
    .line 603
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 604
    .line 605
    .line 606
    move-result-object p0

    .line 607
    check-cast p0, Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 608
    .line 609
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 610
    .line 611
    return v1

    .line 612
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/SpVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 613
    .line 614
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object p0

    .line 618
    check-cast p0, Lcom/p1/mobile/putong/data/SpVip;

    .line 619
    .line 620
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 621
    .line 622
    return v1

    .line 623
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/ShareSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 624
    .line 625
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object p0

    .line 629
    check-cast p0, Lcom/p1/mobile/putong/data/ShareSetting;

    .line 630
    .line 631
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 632
    .line 633
    return v1

    .line 634
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/CityC;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 635
    .line 636
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 637
    .line 638
    .line 639
    move-result-object p0

    .line 640
    check-cast p0, Lcom/p1/mobile/putong/data/CityC;

    .line 641
    .line 642
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 643
    .line 644
    return v1

    .line 645
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/UserBoostSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 646
    .line 647
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 648
    .line 649
    .line 650
    move-result-object p0

    .line 651
    check-cast p0, Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 652
    .line 653
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 654
    .line 655
    return v1

    .line 656
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object p0

    .line 660
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 661
    .line 662
    return v1

    .line 663
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/UserSVIPSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 664
    .line 665
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 666
    .line 667
    .line 668
    move-result-object p0

    .line 669
    check-cast p0, Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 670
    .line 671
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 672
    .line 673
    return v1

    .line 674
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/PlatinumSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 675
    .line 676
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 677
    .line 678
    .line 679
    move-result-object p0

    .line 680
    check-cast p0, Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 681
    .line 682
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 683
    .line 684
    return v1

    .line 685
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/UserPushSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 686
    .line 687
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 688
    .line 689
    .line 690
    move-result-object p0

    .line 691
    check-cast p0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 692
    .line 693
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 694
    .line 695
    return v1

    .line 696
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 697
    .line 698
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 699
    .line 700
    .line 701
    move-result-object p0

    .line 702
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 703
    .line 704
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 705
    .line 706
    return v1

    .line 707
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/data/FemaleVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 708
    .line 709
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 710
    .line 711
    .line 712
    move-result-object p0

    .line 713
    check-cast p0, Lcom/p1/mobile/putong/data/FemaleVip;

    .line 714
    .line 715
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 716
    .line 717
    return v1

    .line 718
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 719
    .line 720
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 721
    .line 722
    .line 723
    move-result-object p0

    .line 724
    check-cast p0, Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 725
    .line 726
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 727
    .line 728
    return v1

    .line 729
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/SeeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 730
    .line 731
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 732
    .line 733
    .line 734
    move-result-object p0

    .line 735
    check-cast p0, Lcom/p1/mobile/putong/data/SeeSettings;

    .line 736
    .line 737
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 738
    .line 739
    return v1

    .line 740
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/Pet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 741
    .line 742
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 743
    .line 744
    .line 745
    move-result-object p0

    .line 746
    check-cast p0, Lcom/p1/mobile/putong/data/Pet;

    .line 747
    .line 748
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 749
    .line 750
    return v1

    .line 751
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/data/MomentLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 752
    .line 753
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 754
    .line 755
    .line 756
    move-result-object p0

    .line 757
    check-cast p0, Lcom/p1/mobile/putong/data/MomentLevel;

    .line 758
    .line 759
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 760
    .line 761
    return v1

    .line 762
    :pswitch_17
    sget-object p0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 763
    .line 764
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 765
    .line 766
    .line 767
    move-result-object p0

    .line 768
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 769
    .line 770
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 771
    .line 772
    return v1

    .line 773
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 774
    .line 775
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 776
    .line 777
    .line 778
    move-result-object p0

    .line 779
    check-cast p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 780
    .line 781
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 782
    .line 783
    return v1

    .line 784
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 785
    .line 786
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 787
    .line 788
    .line 789
    move-result-object p0

    .line 790
    check-cast p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 791
    .line 792
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 793
    .line 794
    return v1

    .line 795
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/data/DecorationSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 796
    .line 797
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 798
    .line 799
    .line 800
    move-result-object p0

    .line 801
    check-cast p0, Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 802
    .line 803
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 804
    .line 805
    return v1

    .line 806
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/UserSearchSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 807
    .line 808
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 809
    .line 810
    .line 811
    move-result-object p0

    .line 812
    check-cast p0, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 813
    .line 814
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 815
    .line 816
    return v1

    .line 817
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/data/TribeSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 818
    .line 819
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 820
    .line 821
    .line 822
    move-result-object p0

    .line 823
    check-cast p0, Lcom/p1/mobile/putong/data/TribeSetting;

    .line 824
    .line 825
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 826
    .line 827
    return v1

    .line 828
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/data/ComDiamond;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 829
    .line 830
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 831
    .line 832
    .line 833
    move-result-object p0

    .line 834
    check-cast p0, Lcom/p1/mobile/putong/data/ComDiamond;

    .line 835
    .line 836
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 837
    .line 838
    return v1

    .line 839
    :pswitch_1e
    sget-object p0, Lcom/p1/mobile/putong/data/NotificationSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 840
    .line 841
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 842
    .line 843
    .line 844
    move-result-object p0

    .line 845
    check-cast p0, Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 846
    .line 847
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 848
    .line 849
    return v1

    .line 850
    :pswitch_1f
    sget-object p0, Lcom/p1/mobile/putong/data/UserMomentSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 851
    .line 852
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 853
    .line 854
    .line 855
    move-result-object p0

    .line 856
    check-cast p0, Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 857
    .line 858
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 859
    .line 860
    return v1

    .line 861
    :pswitch_20
    sget-object p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 862
    .line 863
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 864
    .line 865
    .line 866
    move-result-object p0

    .line 867
    check-cast p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 868
    .line 869
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 870
    .line 871
    return v1

    .line 872
    :pswitch_21
    sget-object p0, Lcom/p1/mobile/putong/data/GrowthSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 873
    .line 874
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 875
    .line 876
    .line 877
    move-result-object p0

    .line 878
    check-cast p0, Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 879
    .line 880
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 881
    .line 882
    return v1

    .line 883
    :pswitch_22
    sget-object p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 884
    .line 885
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 886
    .line 887
    .line 888
    move-result-object p0

    .line 889
    check-cast p0, Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 890
    .line 891
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 892
    .line 893
    return v1

    .line 894
    :pswitch_23
    sget-object p0, Lcom/p1/mobile/putong/data/VipSearchSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 895
    .line 896
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 897
    .line 898
    .line 899
    move-result-object p0

    .line 900
    check-cast p0, Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 901
    .line 902
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 903
    .line 904
    return v1

    .line 905
    :pswitch_24
    sget-object p0, Lcom/p1/mobile/putong/data/ChatSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 906
    .line 907
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 908
    .line 909
    .line 910
    move-result-object p0

    .line 911
    check-cast p0, Lcom/p1/mobile/putong/data/ChatSetting;

    .line 912
    .line 913
    iput-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 914
    .line 915
    return v1

    .line 916
    nop

    .line 917
    :sswitch_data_0
    .sparse-switch
        -0x5b775c63 -> :sswitch_24
        -0x55002fdb -> :sswitch_23
        -0x4a7a0d3f -> :sswitch_22
        -0x49c21e39 -> :sswitch_21
        -0x443a6d1e -> :sswitch_20
        -0x3fb07e00 -> :sswitch_1f
        -0x3e089785 -> :sswitch_1e
        -0x3d2e4b6d -> :sswitch_1d
        -0x3b22ef52 -> :sswitch_1c
        -0x36059a58 -> :sswitch_1b
        -0x30524750 -> :sswitch_1a
        -0x1d3e45d7 -> :sswitch_19
        -0x12bedc78 -> :sswitch_18
        -0x12717657 -> :sswitch_17
        -0xc8f969c -> :sswitch_16
        0x1b11f -> :sswitch_15
        0x1bc53 -> :sswitch_14
        0x2fd755 -> :sswitch_13
        0x3025f7 -> :sswitch_12
        0x32b0ec -> :sswitch_11
        0x34af1a -> :sswitch_10
        0x34b1ad -> :sswitch_f
        0x360eca -> :sswitch_e
        0x368f3a -> :sswitch_d
        0x59923a3 -> :sswitch_c
        0x5a49438 -> :sswitch_b
        0x6854fdf -> :sswitch_a
        0x68940a0 -> :sswitch_9
        0x6a56fa2 -> :sswitch_8
        0xf1cb0ca -> :sswitch_7
        0xfa5555e -> :sswitch_6
        0x1456591d -> :sswitch_5
        0x67c257cb -> :sswitch_4
        0x67c6cb78 -> :sswitch_3
        0x67fda112 -> :sswitch_2
        0x6d768020 -> :sswitch_1
        0x7365d6cb -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 917
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/SettingGroups$2;->parseField(Lcom/p1/mobile/putong/data/SettingGroups;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/SettingGroups;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
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
    const-string v0, "diamondVIPPrivateMatch"

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
    const/16 v2, 0x24

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "adsMaterialRouter"

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
    const/16 v2, 0x23

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "svipSearch"

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
    const/16 v2, 0x22

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "soulmate"

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
    const/16 v2, 0x21

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "soulchat"

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
    const/16 v2, 0x20

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "subscription"

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
    const/16 v2, 0x1f

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "svipPrivacy"

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
    const/16 v2, 0x1e

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "marriage"

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
    const/16 v2, 0x1d

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "upvip"

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
    const/16 v2, 0x1c

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "spvip"

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
    const/16 v2, 0x1b

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "share"

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
    const/16 v2, 0x1a

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "cityC"

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
    const/16 v2, 0x19

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "boost"

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
    const/16 v2, 0x18

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "type"

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
    const/16 v2, 0x17

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "svip"

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
    const/16 v2, 0x16

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "pvip"

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
    const/16 v2, 0x15

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "push"

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
    const/16 v2, 0x14

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "live"

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
    const/16 v2, 0x13

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "fvip"

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
    const/16 v2, 0x12

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "fake"

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
    const/16 v2, 0x11

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "see"

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
    const/16 v2, 0x10

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "pet"

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
    const/16 v2, 0xf

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "momentLevel"

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
    const/16 v2, 0xe

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "profile"

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
    const/16 v2, 0xd

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "privacy"

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
    const/16 v2, 0xc

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "diamondVIP"

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
    const/16 v2, 0xb

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_1a
    const-string v0, "decoration"

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
    const/16 v2, 0xa

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_1b
    const-string v0, "search"

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
    const/16 v2, 0x9

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_1c
    const-string v0, "tttribe"

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
    const/16 v2, 0x8

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_1d
    const-string v0, "comDiamond"

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
    goto :goto_0

    .line 430
    :cond_1d
    const/4 v2, 0x7

    .line 431
    goto :goto_0

    .line 432
    :sswitch_1e
    const-string v0, "noPush"

    .line 433
    .line 434
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-nez v0, :cond_1e

    .line 439
    .line 440
    goto :goto_0

    .line 441
    :cond_1e
    const/4 v2, 0x6

    .line 442
    goto :goto_0

    .line 443
    :sswitch_1f
    const-string v0, "moment"

    .line 444
    .line 445
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v0

    .line 449
    if-nez v0, :cond_1f

    .line 450
    .line 451
    goto :goto_0

    .line 452
    :cond_1f
    const/4 v2, 0x5

    .line 453
    goto :goto_0

    .line 454
    :sswitch_20
    const-string v0, "characterEvaluate"

    .line 455
    .line 456
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_20

    .line 461
    .line 462
    goto :goto_0

    .line 463
    :cond_20
    const/4 v2, 0x4

    .line 464
    goto :goto_0

    .line 465
    :sswitch_21
    const-string v0, "growth"

    .line 466
    .line 467
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-result v0

    .line 471
    if-nez v0, :cond_21

    .line 472
    .line 473
    goto :goto_0

    .line 474
    :cond_21
    const/4 v2, 0x3

    .line 475
    goto :goto_0

    .line 476
    :sswitch_22
    const-string v0, "gender"

    .line 477
    .line 478
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-nez v0, :cond_22

    .line 483
    .line 484
    goto :goto_0

    .line 485
    :cond_22
    const/4 v2, 0x2

    .line 486
    goto :goto_0

    .line 487
    :sswitch_23
    const-string v0, "vipSearch"

    .line 488
    .line 489
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    if-nez v0, :cond_23

    .line 494
    .line 495
    goto :goto_0

    .line 496
    :cond_23
    move v2, v1

    .line 497
    goto :goto_0

    .line 498
    :sswitch_24
    const-string v0, "quickchatchat"

    .line 499
    .line 500
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-nez v0, :cond_24

    .line 505
    .line 506
    goto :goto_0

    .line 507
    :cond_24
    const/4 v2, 0x0

    .line 508
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 509
    .line 510
    .line 511
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 512
    .line 513
    .line 514
    move-result p0

    .line 515
    return p0

    .line 516
    :pswitch_0
    return v1

    .line 517
    :sswitch_data_0
    .sparse-switch
        -0x5b775c63 -> :sswitch_24
        -0x55002fdb -> :sswitch_23
        -0x4a7a0d3f -> :sswitch_22
        -0x49c21e39 -> :sswitch_21
        -0x443a6d1e -> :sswitch_20
        -0x3fb07e00 -> :sswitch_1f
        -0x3e089785 -> :sswitch_1e
        -0x3d2e4b6d -> :sswitch_1d
        -0x3b22ef52 -> :sswitch_1c
        -0x36059a58 -> :sswitch_1b
        -0x30524750 -> :sswitch_1a
        -0x1d3e45d7 -> :sswitch_19
        -0x12bedc78 -> :sswitch_18
        -0x12717657 -> :sswitch_17
        -0xc8f969c -> :sswitch_16
        0x1b11f -> :sswitch_15
        0x1bc53 -> :sswitch_14
        0x2fd755 -> :sswitch_13
        0x3025f7 -> :sswitch_12
        0x32b0ec -> :sswitch_11
        0x34af1a -> :sswitch_10
        0x34b1ad -> :sswitch_f
        0x360eca -> :sswitch_e
        0x368f3a -> :sswitch_d
        0x59923a3 -> :sswitch_c
        0x5a49438 -> :sswitch_b
        0x6854fdf -> :sswitch_a
        0x68940a0 -> :sswitch_9
        0x6a56fa2 -> :sswitch_8
        0xf1cb0ca -> :sswitch_7
        0xfa5555e -> :sswitch_6
        0x1456591d -> :sswitch_5
        0x67c257cb -> :sswitch_4
        0x67c6cb78 -> :sswitch_3
        0x67fda112 -> :sswitch_2
        0x6d768020 -> :sswitch_1
        0x7365d6cb -> :sswitch_0
    .end sparse-switch

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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 517
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/SettingGroups$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/SettingGroups;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "type"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "boost"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/data/UserBoostSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "live"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string p0, "privacy"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 55
    .line 56
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "push"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/data/UserPushSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 71
    .line 72
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const-string p0, "search"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/data/UserSearchSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 87
    .line 88
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string p0, "subscription"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 103
    .line 104
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string p0, "fake"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/data/UserFakeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 119
    .line 120
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string p0, "svip"

    .line 128
    .line 129
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/data/UserSVIPSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 135
    .line 136
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const-string p0, "svipPrivacy"

    .line 144
    .line 145
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 149
    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 151
    .line 152
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string p0, "see"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/data/SeeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 167
    .line 168
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "diamondVIP"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 183
    .line 184
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 188
    .line 189
    if-eqz p0, :cond_c

    .line 190
    .line 191
    const-string p0, "diamondVIPPrivateMatch"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 197
    .line 198
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 199
    .line 200
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 201
    .line 202
    .line 203
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 204
    .line 205
    if-eqz p0, :cond_d

    .line 206
    .line 207
    const-string p0, "soulchat"

    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    sget-object p0, Lcom/p1/mobile/putong/data/ChatSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    .line 214
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 215
    .line 216
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 217
    .line 218
    .line 219
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 220
    .line 221
    if-eqz p0, :cond_e

    .line 222
    .line 223
    const-string p0, "quickchatchat"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sget-object p0, Lcom/p1/mobile/putong/data/ChatSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 229
    .line 230
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 231
    .line 232
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 233
    .line 234
    .line 235
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 236
    .line 237
    if-eqz p0, :cond_f

    .line 238
    .line 239
    const-string p0, "soulmate"

    .line 240
    .line 241
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    sget-object p0, Lcom/p1/mobile/putong/data/SoulMatchGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 245
    .line 246
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 247
    .line 248
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 249
    .line 250
    .line 251
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 252
    .line 253
    if-eqz p0, :cond_10

    .line 254
    .line 255
    const-string p0, "share"

    .line 256
    .line 257
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    sget-object p0, Lcom/p1/mobile/putong/data/ShareSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    .line 262
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 263
    .line 264
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 265
    .line 266
    .line 267
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 268
    .line 269
    if-eqz p0, :cond_11

    .line 270
    .line 271
    const-string p0, "decoration"

    .line 272
    .line 273
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    sget-object p0, Lcom/p1/mobile/putong/data/DecorationSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 277
    .line 278
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 279
    .line 280
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 281
    .line 282
    .line 283
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 284
    .line 285
    if-eqz p0, :cond_12

    .line 286
    .line 287
    const-string p0, "comDiamond"

    .line 288
    .line 289
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    sget-object p0, Lcom/p1/mobile/putong/data/ComDiamond;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 293
    .line 294
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 295
    .line 296
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 297
    .line 298
    .line 299
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 300
    .line 301
    if-eqz p0, :cond_13

    .line 302
    .line 303
    const-string p0, "characterEvaluate"

    .line 304
    .line 305
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    sget-object p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 309
    .line 310
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 311
    .line 312
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 313
    .line 314
    .line 315
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 316
    .line 317
    if-eqz p0, :cond_14

    .line 318
    .line 319
    const-string p0, "pet"

    .line 320
    .line 321
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    sget-object p0, Lcom/p1/mobile/putong/data/Pet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 325
    .line 326
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 327
    .line 328
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 329
    .line 330
    .line 331
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 332
    .line 333
    if-eqz p0, :cond_15

    .line 334
    .line 335
    const-string p0, "momentLevel"

    .line 336
    .line 337
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    sget-object p0, Lcom/p1/mobile/putong/data/MomentLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 341
    .line 342
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 343
    .line 344
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 345
    .line 346
    .line 347
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 348
    .line 349
    if-eqz p0, :cond_16

    .line 350
    .line 351
    const-string p0, "vipSearch"

    .line 352
    .line 353
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    sget-object p0, Lcom/p1/mobile/putong/data/VipSearchSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    .line 358
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 359
    .line 360
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 361
    .line 362
    .line 363
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 364
    .line 365
    if-eqz p0, :cond_17

    .line 366
    .line 367
    const-string p0, "moment"

    .line 368
    .line 369
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    sget-object p0, Lcom/p1/mobile/putong/data/UserMomentSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 373
    .line 374
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 375
    .line 376
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 377
    .line 378
    .line 379
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 380
    .line 381
    if-eqz p0, :cond_18

    .line 382
    .line 383
    const-string p0, "profile"

    .line 384
    .line 385
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    sget-object p0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 389
    .line 390
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 391
    .line 392
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 393
    .line 394
    .line 395
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 396
    .line 397
    if-eqz p0, :cond_19

    .line 398
    .line 399
    const-string p0, "pvip"

    .line 400
    .line 401
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    sget-object p0, Lcom/p1/mobile/putong/data/PlatinumSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 405
    .line 406
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 407
    .line 408
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 409
    .line 410
    .line 411
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 412
    .line 413
    if-eqz p0, :cond_1a

    .line 414
    .line 415
    const-string p0, "marriage"

    .line 416
    .line 417
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    sget-object p0, Lcom/p1/mobile/putong/data/MarrySettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 421
    .line 422
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 423
    .line 424
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 425
    .line 426
    .line 427
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 428
    .line 429
    if-eqz p0, :cond_1b

    .line 430
    .line 431
    const-string p0, "cityC"

    .line 432
    .line 433
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    sget-object p0, Lcom/p1/mobile/putong/data/CityC;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 437
    .line 438
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 439
    .line 440
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 441
    .line 442
    .line 443
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 444
    .line 445
    if-eqz p0, :cond_1c

    .line 446
    .line 447
    const-string p0, "spvip"

    .line 448
    .line 449
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    sget-object p0, Lcom/p1/mobile/putong/data/SpVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 453
    .line 454
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 455
    .line 456
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 457
    .line 458
    .line 459
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 460
    .line 461
    if-eqz p0, :cond_1d

    .line 462
    .line 463
    const-string p0, "growth"

    .line 464
    .line 465
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    sget-object p0, Lcom/p1/mobile/putong/data/GrowthSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 469
    .line 470
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 471
    .line 472
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 473
    .line 474
    .line 475
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 476
    .line 477
    if-eqz p0, :cond_1e

    .line 478
    .line 479
    const-string p0, "fvip"

    .line 480
    .line 481
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    sget-object p0, Lcom/p1/mobile/putong/data/FemaleVip;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 485
    .line 486
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 487
    .line 488
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 489
    .line 490
    .line 491
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 492
    .line 493
    if-eqz p0, :cond_1f

    .line 494
    .line 495
    const-string p0, "svipSearch"

    .line 496
    .line 497
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    sget-object p0, Lcom/p1/mobile/putong/data/SvipSearch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 501
    .line 502
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 503
    .line 504
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 505
    .line 506
    .line 507
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 508
    .line 509
    if-eqz p0, :cond_20

    .line 510
    .line 511
    const-string p0, "noPush"

    .line 512
    .line 513
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    sget-object p0, Lcom/p1/mobile/putong/data/NotificationSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 517
    .line 518
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 519
    .line 520
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 521
    .line 522
    .line 523
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 524
    .line 525
    if-eqz p0, :cond_21

    .line 526
    .line 527
    const-string p0, "adsMaterialRouter"

    .line 528
    .line 529
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    sget-object p0, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 533
    .line 534
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 535
    .line 536
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 537
    .line 538
    .line 539
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 540
    .line 541
    if-eqz p0, :cond_22

    .line 542
    .line 543
    const-string p0, "upvip"

    .line 544
    .line 545
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    sget-object p0, Lcom/p1/mobile/putong/data/UserUpVipSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 549
    .line 550
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 551
    .line 552
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 553
    .line 554
    .line 555
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 556
    .line 557
    if-eqz p0, :cond_23

    .line 558
    .line 559
    const-string p0, "gender"

    .line 560
    .line 561
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    sget-object p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 565
    .line 566
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 567
    .line 568
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 569
    .line 570
    .line 571
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 572
    .line 573
    if-eqz p0, :cond_24

    .line 574
    .line 575
    const-string p0, "tttribe"

    .line 576
    .line 577
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    sget-object p0, Lcom/p1/mobile/putong/data/TribeSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 581
    .line 582
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 583
    .line 584
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 585
    .line 586
    .line 587
    :cond_24
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 588
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SettingGroups$2;->serializeFields(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
