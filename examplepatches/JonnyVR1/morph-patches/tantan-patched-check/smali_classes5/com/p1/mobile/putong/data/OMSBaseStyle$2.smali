.class Lcom/p1/mobile/putong/data/OMSBaseStyle$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSBaseStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
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
    const-class p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/OMSBaseStyle;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;->newInstance()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/OMSBaseStyle;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
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
    const-string p0, "marginLeft"

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
    const/16 v2, 0x33

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
    const/16 v2, 0x32

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "alignment"

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
    const/16 v2, 0x31

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "heightType"

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
    const/16 v2, 0x30

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "bgColorsDirection"

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
    const/16 v2, 0x2f

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "stayTime"

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
    const/16 v2, 0x2e

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "marginRight"

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
    const/16 v2, 0x2d

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "checked"

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
    const/16 v2, 0x2c

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "borderWidth"

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
    const/16 v2, 0x2b

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "borderColor"

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
    const/16 v2, 0x2a

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "paddingRight"

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
    const/16 v2, 0x29

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "indicatorBgColor"

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
    const/16 v2, 0x28

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "cornerRadius"

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
    const/16 v2, 0x27

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "maxWidth"

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
    const/16 v2, 0x26

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "leftCapLayoutWidth"

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
    const/16 v2, 0x25

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "paddingBottom"

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
    const/16 v2, 0x24

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "width"

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
    const/16 v2, 0x23

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "ratio"

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
    const/16 v2, 0x22

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "paddingTop"

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
    const/16 v2, 0x21

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "autoSwitchTime"

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
    const/16 v2, 0x20

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "widthType"

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
    const/16 v2, 0x1f

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "minHeight"

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
    const/16 v2, 0x1e

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "canSlide"

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
    const/16 v2, 0x1d

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_17
    const-string p0, "marginBottom"

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
    const/16 v2, 0x1c

    .line 349
    .line 350
    goto/16 :goto_0

    .line 351
    .line 352
    :sswitch_18
    const-string p0, "autoSwitch"

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
    const/16 v2, 0x1b

    .line 363
    .line 364
    goto/16 :goto_0

    .line 365
    .line 366
    :sswitch_19
    const-string p0, "uiType"

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
    const/16 v2, 0x1a

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_1a
    const-string p0, "imageSize"

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
    const/16 v2, 0x19

    .line 391
    .line 392
    goto/16 :goto_0

    .line 393
    .line 394
    :sswitch_1b
    const-string p0, "maxHeight"

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
    const/16 v2, 0x18

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_1c
    const-string p0, "shadowOpacity"

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
    const/16 v2, 0x17

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_1d
    const-string p0, "direction"

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
    const/16 v2, 0x16

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_1e
    const-string p0, "marginTop"

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
    const/16 v2, 0x15

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_1f
    const-string p0, "topCapHeight"

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
    const/16 v2, 0x14

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_20
    const-string p0, "indicatorRadius"

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
    const/16 v2, 0x13

    .line 475
    .line 476
    goto/16 :goto_0

    .line 477
    .line 478
    :sswitch_21
    const-string p0, "height"

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
    const/16 v2, 0x12

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_22
    const-string p0, "numberOfLines"

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
    const/16 v2, 0x11

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_23
    const-string p0, "showIndicator"

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
    const/16 v2, 0x10

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_24
    const-string p0, "minWidth"

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
    const/16 v2, 0xf

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_25
    const-string p0, "blurRadius"

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
    const/16 v2, 0xe

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_26
    const-string p0, "paddingLeft"

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
    const/16 v2, 0xd

    .line 559
    .line 560
    goto/16 :goto_0

    .line 561
    .line 562
    :sswitch_27
    const-string p0, "offsetY"

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
    const/16 v2, 0xc

    .line 573
    .line 574
    goto/16 :goto_0

    .line 575
    .line 576
    :sswitch_28
    const-string p0, "offsetX"

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
    const/16 v2, 0xb

    .line 587
    .line 588
    goto/16 :goto_0

    .line 589
    .line 590
    :sswitch_29
    const-string p0, "indicatorColor"

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
    const/16 v2, 0xa

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_2a
    const-string p0, "distribution"

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
    const/16 v2, 0x9

    .line 615
    .line 616
    goto/16 :goto_0

    .line 617
    .line 618
    :sswitch_2b
    const-string p0, "shadowColor"

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
    const/16 v2, 0x8

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_2c
    const-string p0, "shadowRadius"

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
    goto :goto_0

    .line 641
    :cond_2c
    const/4 v2, 0x7

    .line 642
    goto :goto_0

    .line 643
    :sswitch_2d
    const-string p0, "lineSpacing"

    .line 644
    .line 645
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    move-result p0

    .line 649
    if-nez p0, :cond_2d

    .line 650
    .line 651
    goto :goto_0

    .line 652
    :cond_2d
    const/4 v2, 0x6

    .line 653
    goto :goto_0

    .line 654
    :sswitch_2e
    const-string p0, "topCapLayoutHeight"

    .line 655
    .line 656
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 657
    .line 658
    .line 659
    move-result p0

    .line 660
    if-nez p0, :cond_2e

    .line 661
    .line 662
    goto :goto_0

    .line 663
    :cond_2e
    const/4 v2, 0x5

    .line 664
    goto :goto_0

    .line 665
    :sswitch_2f
    const-string p0, "scaleType"

    .line 666
    .line 667
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result p0

    .line 671
    if-nez p0, :cond_2f

    .line 672
    .line 673
    goto :goto_0

    .line 674
    :cond_2f
    const/4 v2, 0x4

    .line 675
    goto :goto_0

    .line 676
    :sswitch_30
    const-string p0, "blurColor"

    .line 677
    .line 678
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 679
    .line 680
    .line 681
    move-result p0

    .line 682
    if-nez p0, :cond_30

    .line 683
    .line 684
    goto :goto_0

    .line 685
    :cond_30
    const/4 v2, 0x3

    .line 686
    goto :goto_0

    .line 687
    :sswitch_31
    const-string p0, "spacing"

    .line 688
    .line 689
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 690
    .line 691
    .line 692
    move-result p0

    .line 693
    if-nez p0, :cond_31

    .line 694
    .line 695
    goto :goto_0

    .line 696
    :cond_31
    const/4 v2, 0x2

    .line 697
    goto :goto_0

    .line 698
    :sswitch_32
    const-string p0, "bgColors"

    .line 699
    .line 700
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 701
    .line 702
    .line 703
    move-result p0

    .line 704
    if-nez p0, :cond_32

    .line 705
    .line 706
    goto :goto_0

    .line 707
    :cond_32
    move v2, v1

    .line 708
    goto :goto_0

    .line 709
    :sswitch_33
    const-string p0, "leftCapWidth"

    .line 710
    .line 711
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 712
    .line 713
    .line 714
    move-result p0

    .line 715
    if-nez p0, :cond_33

    .line 716
    .line 717
    goto :goto_0

    .line 718
    :cond_33
    move v2, v0

    .line 719
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 720
    .line 721
    .line 722
    return v0

    .line 723
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 724
    .line 725
    .line 726
    move-result-wide p2

    .line 727
    double-to-float p0, p2

    .line 728
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 729
    .line 730
    return v1

    .line 731
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 732
    .line 733
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 734
    .line 735
    .line 736
    move-result-object p0

    .line 737
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 738
    .line 739
    return v1

    .line 740
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 741
    .line 742
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 743
    .line 744
    .line 745
    move-result-object p0

    .line 746
    check-cast p0, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 747
    .line 748
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 749
    .line 750
    return v1

    .line 751
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 752
    .line 753
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 754
    .line 755
    .line 756
    move-result-object p0

    .line 757
    check-cast p0, Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 758
    .line 759
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 760
    .line 761
    return v1

    .line 762
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 763
    .line 764
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 765
    .line 766
    .line 767
    move-result-object p0

    .line 768
    check-cast p0, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 769
    .line 770
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 771
    .line 772
    return v1

    .line 773
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 774
    .line 775
    .line 776
    move-result p0

    .line 777
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 778
    .line 779
    return v1

    .line 780
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 781
    .line 782
    .line 783
    move-result-wide p2

    .line 784
    double-to-float p0, p2

    .line 785
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 786
    .line 787
    return v1

    .line 788
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 789
    .line 790
    .line 791
    move-result p0

    .line 792
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 793
    .line 794
    return v1

    .line 795
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 796
    .line 797
    .line 798
    move-result-wide p2

    .line 799
    double-to-float p0, p2

    .line 800
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 801
    .line 802
    return v1

    .line 803
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 808
    .line 809
    return v1

    .line 810
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 811
    .line 812
    .line 813
    move-result-wide p2

    .line 814
    double-to-float p0, p2

    .line 815
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 816
    .line 817
    return v1

    .line 818
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 819
    .line 820
    .line 821
    move-result-object p0

    .line 822
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 823
    .line 824
    return v1

    .line 825
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 826
    .line 827
    .line 828
    move-result-wide p2

    .line 829
    double-to-float p0, p2

    .line 830
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 831
    .line 832
    return v1

    .line 833
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 834
    .line 835
    .line 836
    move-result-wide p2

    .line 837
    double-to-float p0, p2

    .line 838
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 839
    .line 840
    return v1

    .line 841
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 842
    .line 843
    .line 844
    move-result-wide p2

    .line 845
    double-to-float p0, p2

    .line 846
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 847
    .line 848
    return v1

    .line 849
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 850
    .line 851
    .line 852
    move-result-wide p2

    .line 853
    double-to-float p0, p2

    .line 854
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 855
    .line 856
    return v1

    .line 857
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 858
    .line 859
    .line 860
    move-result-wide p2

    .line 861
    double-to-float p0, p2

    .line 862
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 863
    .line 864
    return v1

    .line 865
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 866
    .line 867
    .line 868
    move-result-wide p2

    .line 869
    double-to-float p0, p2

    .line 870
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 871
    .line 872
    return v1

    .line 873
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 874
    .line 875
    .line 876
    move-result-wide p2

    .line 877
    double-to-float p0, p2

    .line 878
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 879
    .line 880
    return v1

    .line 881
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 882
    .line 883
    .line 884
    move-result p0

    .line 885
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 886
    .line 887
    return v1

    .line 888
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 889
    .line 890
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 891
    .line 892
    .line 893
    move-result-object p0

    .line 894
    check-cast p0, Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 895
    .line 896
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 897
    .line 898
    return v1

    .line 899
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 900
    .line 901
    .line 902
    move-result-wide p2

    .line 903
    double-to-float p0, p2

    .line 904
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 905
    .line 906
    return v1

    .line 907
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 908
    .line 909
    .line 910
    move-result p0

    .line 911
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 912
    .line 913
    return v1

    .line 914
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 915
    .line 916
    .line 917
    move-result-wide p2

    .line 918
    double-to-float p0, p2

    .line 919
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 920
    .line 921
    return v1

    .line 922
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 923
    .line 924
    .line 925
    move-result p0

    .line 926
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 927
    .line 928
    return v1

    .line 929
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 930
    .line 931
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 932
    .line 933
    .line 934
    move-result-object p0

    .line 935
    check-cast p0, Lcom/p1/mobile/putong/data/OMSUIType;

    .line 936
    .line 937
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 938
    .line 939
    return v1

    .line 940
    :pswitch_1a
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 941
    .line 942
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 943
    .line 944
    .line 945
    move-result-object p0

    .line 946
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 947
    .line 948
    return v1

    .line 949
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 950
    .line 951
    .line 952
    move-result-wide p2

    .line 953
    double-to-float p0, p2

    .line 954
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 955
    .line 956
    return v1

    .line 957
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 958
    .line 959
    .line 960
    move-result-wide p2

    .line 961
    double-to-float p0, p2

    .line 962
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 963
    .line 964
    return v1

    .line 965
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 966
    .line 967
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 968
    .line 969
    .line 970
    move-result-object p0

    .line 971
    check-cast p0, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 972
    .line 973
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 974
    .line 975
    return v1

    .line 976
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 977
    .line 978
    .line 979
    move-result-wide p2

    .line 980
    double-to-float p0, p2

    .line 981
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 982
    .line 983
    return v1

    .line 984
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 985
    .line 986
    .line 987
    move-result-wide p2

    .line 988
    double-to-float p0, p2

    .line 989
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 990
    .line 991
    return v1

    .line 992
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 993
    .line 994
    .line 995
    move-result-wide p2

    .line 996
    double-to-float p0, p2

    .line 997
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 998
    .line 999
    return v1

    .line 1000
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1001
    .line 1002
    .line 1003
    move-result-wide p2

    .line 1004
    double-to-float p0, p2

    .line 1005
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 1006
    .line 1007
    return v1

    .line 1008
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 1009
    .line 1010
    .line 1011
    move-result p0

    .line 1012
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 1013
    .line 1014
    return v1

    .line 1015
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 1016
    .line 1017
    .line 1018
    move-result p0

    .line 1019
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 1020
    .line 1021
    return v1

    .line 1022
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1023
    .line 1024
    .line 1025
    move-result-wide p2

    .line 1026
    double-to-float p0, p2

    .line 1027
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 1028
    .line 1029
    return v1

    .line 1030
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1031
    .line 1032
    .line 1033
    move-result-wide p2

    .line 1034
    double-to-float p0, p2

    .line 1035
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 1036
    .line 1037
    return v1

    .line 1038
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1039
    .line 1040
    .line 1041
    move-result-wide p2

    .line 1042
    double-to-float p0, p2

    .line 1043
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 1044
    .line 1045
    return v1

    .line 1046
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1047
    .line 1048
    .line 1049
    move-result-wide p2

    .line 1050
    double-to-float p0, p2

    .line 1051
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 1052
    .line 1053
    return v1

    .line 1054
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1055
    .line 1056
    .line 1057
    move-result-wide p2

    .line 1058
    double-to-float p0, p2

    .line 1059
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 1060
    .line 1061
    return v1

    .line 1062
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1063
    .line 1064
    .line 1065
    move-result-object p0

    .line 1066
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 1067
    .line 1068
    return v1

    .line 1069
    :pswitch_2a
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1070
    .line 1071
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1072
    .line 1073
    .line 1074
    move-result-object p0

    .line 1075
    check-cast p0, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 1076
    .line 1077
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 1078
    .line 1079
    return v1

    .line 1080
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1081
    .line 1082
    .line 1083
    move-result-object p0

    .line 1084
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 1085
    .line 1086
    return v1

    .line 1087
    :pswitch_2c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1088
    .line 1089
    .line 1090
    move-result-wide p2

    .line 1091
    double-to-float p0, p2

    .line 1092
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 1093
    .line 1094
    return v1

    .line 1095
    :pswitch_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1096
    .line 1097
    .line 1098
    move-result-wide p2

    .line 1099
    double-to-float p0, p2

    .line 1100
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 1101
    .line 1102
    return v1

    .line 1103
    :pswitch_2e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1104
    .line 1105
    .line 1106
    move-result-wide p2

    .line 1107
    double-to-float p0, p2

    .line 1108
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 1109
    .line 1110
    return v1

    .line 1111
    :pswitch_2f
    sget-object p0, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1112
    .line 1113
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 1114
    .line 1115
    .line 1116
    move-result-object p0

    .line 1117
    check-cast p0, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 1118
    .line 1119
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 1120
    .line 1121
    return v1

    .line 1122
    :pswitch_30
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 1123
    .line 1124
    .line 1125
    move-result-object p0

    .line 1126
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 1127
    .line 1128
    return v1

    .line 1129
    :pswitch_31
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1130
    .line 1131
    .line 1132
    move-result-wide p2

    .line 1133
    double-to-float p0, p2

    .line 1134
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 1135
    .line 1136
    return v1

    .line 1137
    :pswitch_32
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1138
    .line 1139
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 1140
    .line 1141
    .line 1142
    move-result-object p0

    .line 1143
    iput-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 1144
    .line 1145
    return v1

    .line 1146
    :pswitch_33
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 1147
    .line 1148
    .line 1149
    move-result-wide p2

    .line 1150
    double-to-float p0, p2

    .line 1151
    iput p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 1152
    .line 1153
    return v1

    .line 1154
    nop

    .line 1155
    :sswitch_data_0
    .sparse-switch
        -0x7f4921c5 -> :sswitch_33
        -0x7a8751eb -> :sswitch_32
        -0x77ef1bbd -> :sswitch_31
        -0x7728c8c4 -> :sswitch_30
        -0x6feea85c -> :sswitch_2f
        -0x6b02e432 -> :sswitch_2e
        -0x60dd4e51 -> :sswitch_2d
        -0x609f862e -> :sswitch_2c
        -0x5ec185dd -> :sswitch_2b
        -0x5e37b17c -> :sswitch_2a
        -0x5dec0d6c -> :sswitch_29
        -0x5c4ad1db -> :sswitch_28
        -0x5c4ad1da -> :sswitch_27
        -0x597a2048 -> :sswitch_26
        -0x5520a027 -> :sswitch_25
        -0x5201456c -> :sswitch_24
        -0x50a9f06e -> :sswitch_23
        -0x4f447821 -> :sswitch_22
        -0x48c76ed9 -> :sswitch_21
        -0x46c5f07f -> :sswitch_20
        -0x44a39a3c -> :sswitch_1f
        -0x3e464339 -> :sswitch_1e
        -0x395ff881 -> :sswitch_1d
        -0x38986d35 -> :sswitch_1c
        -0x36017855 -> :sswitch_1b
        -0x34582804 -> :sswitch_1a
        -0x32695812 -> :sswitch_19
        -0x16a8be3d -> :sswitch_18
        -0x113c6e87 -> :sswitch_17
        -0x835d03f -> :sswitch_16
        -0x7f661e7 -> :sswitch_15
        -0x31221e0 -> :sswitch_14
        0x4b26f30 -> :sswitch_13
        0x55f4784 -> :sswitch_12
        0x674500b -> :sswitch_11
        0x6be2dc6 -> :sswitch_10
        0xc0fb19c -> :sswitch_f
        0xd5e7171 -> :sswitch_e
        0x17dd56c2 -> :sswitch_d
        0x22c8f747 -> :sswitch_c
        0x2812d10f -> :sswitch_b
        0x2a8c788b -> :sswitch_a
        0x2b158697 -> :sswitch_9
        0x2c2c84fa -> :sswitch_8
        0x2c3ecfa7 -> :sswitch_7
        0x3a1ea90e -> :sswitch_6
        0x4ed0f8c6 -> :sswitch_5
        0x548380ea -> :sswitch_4
        0x58d5a901 -> :sswitch_3
        0x695fa1e3 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x757a12d5 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 1155
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;->parseField(Lcom/p1/mobile/putong/data/OMSBaseStyle;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/OMSBaseStyle;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
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
    const-string v0, "marginLeft"

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
    const/16 v2, 0x33

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
    const/16 v2, 0x32

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "alignment"

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
    const/16 v2, 0x31

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "heightType"

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
    const/16 v2, 0x30

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "bgColorsDirection"

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
    const/16 v2, 0x2f

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "stayTime"

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
    const/16 v2, 0x2e

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "marginRight"

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
    const/16 v2, 0x2d

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "checked"

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
    const/16 v2, 0x2c

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "borderWidth"

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
    const/16 v2, 0x2b

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "borderColor"

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
    const/16 v2, 0x2a

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "paddingRight"

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
    const/16 v2, 0x29

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "indicatorBgColor"

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
    const/16 v2, 0x28

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "cornerRadius"

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
    const/16 v2, 0x27

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "maxWidth"

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
    const/16 v2, 0x26

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "leftCapLayoutWidth"

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
    const/16 v2, 0x25

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "paddingBottom"

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
    const/16 v2, 0x24

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "width"

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
    const/16 v2, 0x23

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "ratio"

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
    const/16 v2, 0x22

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "paddingTop"

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
    const/16 v2, 0x21

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "autoSwitchTime"

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
    const/16 v2, 0x20

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "widthType"

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
    const/16 v2, 0x1f

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "minHeight"

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
    const/16 v2, 0x1e

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "canSlide"

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
    const/16 v2, 0x1d

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_17
    const-string v0, "marginBottom"

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
    const/16 v2, 0x1c

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_18
    const-string v0, "autoSwitch"

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
    const/16 v2, 0x1b

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_19
    const-string v0, "uiType"

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
    const/16 v2, 0x1a

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_1a
    const-string v0, "imageSize"

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
    const/16 v2, 0x19

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_1b
    const-string v0, "maxHeight"

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
    const/16 v2, 0x18

    .line 404
    .line 405
    goto/16 :goto_0

    .line 406
    .line 407
    :sswitch_1c
    const-string v0, "shadowOpacity"

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
    const/16 v2, 0x17

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_1d
    const-string v0, "direction"

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
    const/16 v2, 0x16

    .line 432
    .line 433
    goto/16 :goto_0

    .line 434
    .line 435
    :sswitch_1e
    const-string v0, "marginTop"

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
    const/16 v2, 0x15

    .line 446
    .line 447
    goto/16 :goto_0

    .line 448
    .line 449
    :sswitch_1f
    const-string v0, "topCapHeight"

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
    const/16 v2, 0x14

    .line 460
    .line 461
    goto/16 :goto_0

    .line 462
    .line 463
    :sswitch_20
    const-string v0, "indicatorRadius"

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
    const/16 v2, 0x13

    .line 474
    .line 475
    goto/16 :goto_0

    .line 476
    .line 477
    :sswitch_21
    const-string v0, "height"

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
    const/16 v2, 0x12

    .line 488
    .line 489
    goto/16 :goto_0

    .line 490
    .line 491
    :sswitch_22
    const-string v0, "numberOfLines"

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
    const/16 v2, 0x11

    .line 502
    .line 503
    goto/16 :goto_0

    .line 504
    .line 505
    :sswitch_23
    const-string v0, "showIndicator"

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
    const/16 v2, 0x10

    .line 516
    .line 517
    goto/16 :goto_0

    .line 518
    .line 519
    :sswitch_24
    const-string v0, "minWidth"

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
    const/16 v2, 0xf

    .line 530
    .line 531
    goto/16 :goto_0

    .line 532
    .line 533
    :sswitch_25
    const-string v0, "blurRadius"

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
    const/16 v2, 0xe

    .line 544
    .line 545
    goto/16 :goto_0

    .line 546
    .line 547
    :sswitch_26
    const-string v0, "paddingLeft"

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
    const/16 v2, 0xd

    .line 558
    .line 559
    goto/16 :goto_0

    .line 560
    .line 561
    :sswitch_27
    const-string v0, "offsetY"

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
    const/16 v2, 0xc

    .line 572
    .line 573
    goto/16 :goto_0

    .line 574
    .line 575
    :sswitch_28
    const-string v0, "offsetX"

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
    const/16 v2, 0xb

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :sswitch_29
    const-string v0, "indicatorColor"

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
    const/16 v2, 0xa

    .line 600
    .line 601
    goto/16 :goto_0

    .line 602
    .line 603
    :sswitch_2a
    const-string v0, "distribution"

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
    const/16 v2, 0x9

    .line 614
    .line 615
    goto/16 :goto_0

    .line 616
    .line 617
    :sswitch_2b
    const-string v0, "shadowColor"

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
    const/16 v2, 0x8

    .line 628
    .line 629
    goto/16 :goto_0

    .line 630
    .line 631
    :sswitch_2c
    const-string v0, "shadowRadius"

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
    goto :goto_0

    .line 640
    :cond_2c
    const/4 v2, 0x7

    .line 641
    goto :goto_0

    .line 642
    :sswitch_2d
    const-string v0, "lineSpacing"

    .line 643
    .line 644
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 645
    .line 646
    .line 647
    move-result v0

    .line 648
    if-nez v0, :cond_2d

    .line 649
    .line 650
    goto :goto_0

    .line 651
    :cond_2d
    const/4 v2, 0x6

    .line 652
    goto :goto_0

    .line 653
    :sswitch_2e
    const-string v0, "topCapLayoutHeight"

    .line 654
    .line 655
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 656
    .line 657
    .line 658
    move-result v0

    .line 659
    if-nez v0, :cond_2e

    .line 660
    .line 661
    goto :goto_0

    .line 662
    :cond_2e
    const/4 v2, 0x5

    .line 663
    goto :goto_0

    .line 664
    :sswitch_2f
    const-string v0, "scaleType"

    .line 665
    .line 666
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    if-nez v0, :cond_2f

    .line 671
    .line 672
    goto :goto_0

    .line 673
    :cond_2f
    const/4 v2, 0x4

    .line 674
    goto :goto_0

    .line 675
    :sswitch_30
    const-string v0, "blurColor"

    .line 676
    .line 677
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 678
    .line 679
    .line 680
    move-result v0

    .line 681
    if-nez v0, :cond_30

    .line 682
    .line 683
    goto :goto_0

    .line 684
    :cond_30
    const/4 v2, 0x3

    .line 685
    goto :goto_0

    .line 686
    :sswitch_31
    const-string v0, "spacing"

    .line 687
    .line 688
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    move-result v0

    .line 692
    if-nez v0, :cond_31

    .line 693
    .line 694
    goto :goto_0

    .line 695
    :cond_31
    const/4 v2, 0x2

    .line 696
    goto :goto_0

    .line 697
    :sswitch_32
    const-string v0, "bgColors"

    .line 698
    .line 699
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 700
    .line 701
    .line 702
    move-result v0

    .line 703
    if-nez v0, :cond_32

    .line 704
    .line 705
    goto :goto_0

    .line 706
    :cond_32
    move v2, v1

    .line 707
    goto :goto_0

    .line 708
    :sswitch_33
    const-string v0, "leftCapWidth"

    .line 709
    .line 710
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    move-result v0

    .line 714
    if-nez v0, :cond_33

    .line 715
    .line 716
    goto :goto_0

    .line 717
    :cond_33
    const/4 v2, 0x0

    .line 718
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 719
    .line 720
    .line 721
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 722
    .line 723
    .line 724
    move-result p0

    .line 725
    return p0

    .line 726
    :pswitch_0
    return v1

    .line 727
    :sswitch_data_0
    .sparse-switch
        -0x7f4921c5 -> :sswitch_33
        -0x7a8751eb -> :sswitch_32
        -0x77ef1bbd -> :sswitch_31
        -0x7728c8c4 -> :sswitch_30
        -0x6feea85c -> :sswitch_2f
        -0x6b02e432 -> :sswitch_2e
        -0x60dd4e51 -> :sswitch_2d
        -0x609f862e -> :sswitch_2c
        -0x5ec185dd -> :sswitch_2b
        -0x5e37b17c -> :sswitch_2a
        -0x5dec0d6c -> :sswitch_29
        -0x5c4ad1db -> :sswitch_28
        -0x5c4ad1da -> :sswitch_27
        -0x597a2048 -> :sswitch_26
        -0x5520a027 -> :sswitch_25
        -0x5201456c -> :sswitch_24
        -0x50a9f06e -> :sswitch_23
        -0x4f447821 -> :sswitch_22
        -0x48c76ed9 -> :sswitch_21
        -0x46c5f07f -> :sswitch_20
        -0x44a39a3c -> :sswitch_1f
        -0x3e464339 -> :sswitch_1e
        -0x395ff881 -> :sswitch_1d
        -0x38986d35 -> :sswitch_1c
        -0x36017855 -> :sswitch_1b
        -0x34582804 -> :sswitch_1a
        -0x32695812 -> :sswitch_19
        -0x16a8be3d -> :sswitch_18
        -0x113c6e87 -> :sswitch_17
        -0x835d03f -> :sswitch_16
        -0x7f661e7 -> :sswitch_15
        -0x31221e0 -> :sswitch_14
        0x4b26f30 -> :sswitch_13
        0x55f4784 -> :sswitch_12
        0x674500b -> :sswitch_11
        0x6be2dc6 -> :sswitch_10
        0xc0fb19c -> :sswitch_f
        0xd5e7171 -> :sswitch_e
        0x17dd56c2 -> :sswitch_d
        0x22c8f747 -> :sswitch_c
        0x2812d10f -> :sswitch_b
        0x2a8c788b -> :sswitch_a
        0x2b158697 -> :sswitch_9
        0x2c2c84fa -> :sswitch_8
        0x2c3ecfa7 -> :sswitch_7
        0x3a1ea90e -> :sswitch_6
        0x4ed0f8c6 -> :sswitch_5
        0x548380ea -> :sswitch_4
        0x58d5a901 -> :sswitch_3
        0x695fa1e3 -> :sswitch_2
        0x714f9fb5 -> :sswitch_1
        0x757a12d5 -> :sswitch_0
    .end sparse-switch

    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 727
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/OMSBaseStyle;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/OMSBaseStyle;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "width"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 6
    .line 7
    .line 8
    const-string p0, "height"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 13
    .line 14
    .line 15
    const-string p0, "minWidth"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    const-string p0, "minHeight"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 27
    .line 28
    .line 29
    const-string p0, "maxWidth"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 34
    .line 35
    .line 36
    const-string p0, "maxHeight"

    .line 37
    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const-string p0, "widthType"

    .line 49
    .line 50
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 56
    .line 57
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    const-string p0, "heightType"

    .line 65
    .line 66
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 70
    .line 71
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 72
    .line 73
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 74
    .line 75
    .line 76
    :cond_1
    const-string p0, "ratio"

    .line 77
    .line 78
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 79
    .line 80
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 81
    .line 82
    .line 83
    const-string p0, "paddingTop"

    .line 84
    .line 85
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 86
    .line 87
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 88
    .line 89
    .line 90
    const-string p0, "paddingLeft"

    .line 91
    .line 92
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 93
    .line 94
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 95
    .line 96
    .line 97
    const-string p0, "paddingBottom"

    .line 98
    .line 99
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 100
    .line 101
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 102
    .line 103
    .line 104
    const-string p0, "paddingRight"

    .line 105
    .line 106
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 107
    .line 108
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 109
    .line 110
    .line 111
    const-string p0, "marginTop"

    .line 112
    .line 113
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 114
    .line 115
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 116
    .line 117
    .line 118
    const-string p0, "marginLeft"

    .line 119
    .line 120
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 121
    .line 122
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 123
    .line 124
    .line 125
    const-string p0, "marginBottom"

    .line 126
    .line 127
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 128
    .line 129
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 130
    .line 131
    .line 132
    const-string p0, "marginRight"

    .line 133
    .line 134
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 135
    .line 136
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 140
    .line 141
    if-eqz p0, :cond_2

    .line 142
    .line 143
    const-string p0, "bgColors"

    .line 144
    .line 145
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 149
    .line 150
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    .line 152
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 153
    .line 154
    .line 155
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 156
    .line 157
    if-eqz p0, :cond_3

    .line 158
    .line 159
    const-string p0, "bgColorsDirection"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 167
    .line 168
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 169
    .line 170
    .line 171
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz p0, :cond_4

    .line 174
    .line 175
    const-string v1, "borderColor"

    .line 176
    .line 177
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :cond_4
    const-string p0, "borderWidth"

    .line 181
    .line 182
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 183
    .line 184
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 185
    .line 186
    .line 187
    const-string p0, "cornerRadius"

    .line 188
    .line 189
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 190
    .line 191
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 195
    .line 196
    if-eqz p0, :cond_5

    .line 197
    .line 198
    const-string p0, "alignment"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 204
    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 206
    .line 207
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 208
    .line 209
    .line 210
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 211
    .line 212
    if-eqz p0, :cond_6

    .line 213
    .line 214
    const-string p0, "location"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 220
    .line 221
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 222
    .line 223
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 224
    .line 225
    .line 226
    :cond_6
    const-string p0, "numberOfLines"

    .line 227
    .line 228
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 229
    .line 230
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 231
    .line 232
    .line 233
    const-string p0, "lineSpacing"

    .line 234
    .line 235
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 236
    .line 237
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 241
    .line 242
    if-eqz p0, :cond_7

    .line 243
    .line 244
    const-string p0, "scaleType"

    .line 245
    .line 246
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    sget-object p0, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 250
    .line 251
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 252
    .line 253
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 254
    .line 255
    .line 256
    :cond_7
    const-string p0, "leftCapWidth"

    .line 257
    .line 258
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 259
    .line 260
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 261
    .line 262
    .line 263
    const-string p0, "topCapHeight"

    .line 264
    .line 265
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 266
    .line 267
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 268
    .line 269
    .line 270
    const-string p0, "leftCapLayoutWidth"

    .line 271
    .line 272
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 273
    .line 274
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 275
    .line 276
    .line 277
    const-string p0, "topCapLayoutHeight"

    .line 278
    .line 279
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 280
    .line 281
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 282
    .line 283
    .line 284
    const-string p0, "spacing"

    .line 285
    .line 286
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 287
    .line 288
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 289
    .line 290
    .line 291
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 292
    .line 293
    if-eqz p0, :cond_8

    .line 294
    .line 295
    const-string p0, "distribution"

    .line 296
    .line 297
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    sget-object p0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 301
    .line 302
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 303
    .line 304
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 305
    .line 306
    .line 307
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 308
    .line 309
    if-eqz p0, :cond_9

    .line 310
    .line 311
    const-string p0, "imageSize"

    .line 312
    .line 313
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 317
    .line 318
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 319
    .line 320
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 321
    .line 322
    .line 323
    :cond_9
    const-string p0, "offsetX"

    .line 324
    .line 325
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 326
    .line 327
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 328
    .line 329
    .line 330
    const-string p0, "offsetY"

    .line 331
    .line 332
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 333
    .line 334
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 335
    .line 336
    .line 337
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 338
    .line 339
    if-eqz p0, :cond_a

    .line 340
    .line 341
    const-string p0, "direction"

    .line 342
    .line 343
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    sget-object p0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 347
    .line 348
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 349
    .line 350
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 351
    .line 352
    .line 353
    :cond_a
    const-string p0, "autoSwitch"

    .line 354
    .line 355
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 356
    .line 357
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 358
    .line 359
    .line 360
    const-string p0, "canSlide"

    .line 361
    .line 362
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 363
    .line 364
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 365
    .line 366
    .line 367
    const-string p0, "stayTime"

    .line 368
    .line 369
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 370
    .line 371
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 372
    .line 373
    .line 374
    const-string p0, "autoSwitchTime"

    .line 375
    .line 376
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 377
    .line 378
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 379
    .line 380
    .line 381
    const-string p0, "showIndicator"

    .line 382
    .line 383
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 384
    .line 385
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 386
    .line 387
    .line 388
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 389
    .line 390
    if-eqz p0, :cond_b

    .line 391
    .line 392
    const-string v1, "indicatorColor"

    .line 393
    .line 394
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 398
    .line 399
    if-eqz p0, :cond_c

    .line 400
    .line 401
    const-string v1, "indicatorBgColor"

    .line 402
    .line 403
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    :cond_c
    const-string p0, "indicatorRadius"

    .line 407
    .line 408
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 409
    .line 410
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 411
    .line 412
    .line 413
    const-string p0, "blurRadius"

    .line 414
    .line 415
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 416
    .line 417
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 418
    .line 419
    .line 420
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 421
    .line 422
    if-eqz p0, :cond_d

    .line 423
    .line 424
    const-string v1, "blurColor"

    .line 425
    .line 426
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 430
    .line 431
    if-eqz p0, :cond_e

    .line 432
    .line 433
    const-string v1, "shadowColor"

    .line 434
    .line 435
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    :cond_e
    const-string p0, "shadowRadius"

    .line 439
    .line 440
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 441
    .line 442
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 443
    .line 444
    .line 445
    const-string p0, "shadowOpacity"

    .line 446
    .line 447
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 448
    .line 449
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 450
    .line 451
    .line 452
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 453
    .line 454
    if-eqz p0, :cond_f

    .line 455
    .line 456
    const-string p0, "uiType"

    .line 457
    .line 458
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 459
    .line 460
    .line 461
    sget-object p0, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 462
    .line 463
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 464
    .line 465
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 466
    .line 467
    .line 468
    :cond_f
    const-string p0, "checked"

    .line 469
    .line 470
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 471
    .line 472
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 473
    .line 474
    .line 475
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 476
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;->serializeFields(Lcom/p1/mobile/putong/data/OMSBaseStyle;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
