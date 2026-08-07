.class public final Ll/oxy0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static final b:Ljava/util/HashMap;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "MediaCodecUtil.class"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "^\\D?(\\d+)$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/oxy0;->a:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    new-instance v0, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/oxy0;->b:Ljava/util/HashMap;

    .line 15
    .line 16
    return-void
.end method

.method public static a(Ll/sqr0;)Landroid/util/Pair;
    .locals 34
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x400

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/16 v3, 0x800

    .line 10
    .line 11
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/16 v5, 0x80

    .line 16
    .line 17
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const/16 v7, 0x100

    .line 22
    .line 23
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    const/16 v9, 0x200

    .line 28
    .line 29
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    const/16 v11, 0x20

    .line 34
    .line 35
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v12

    .line 39
    const/16 v13, 0x40

    .line 40
    .line 41
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v14

    .line 45
    const/16 v15, 0x1000

    .line 46
    .line 47
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v16

    .line 51
    const/16 v1, 0x8

    .line 52
    .line 53
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v18

    .line 57
    const/16 v3, 0x10

    .line 58
    .line 59
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v19

    .line 63
    const/4 v5, 0x4

    .line 64
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v20

    .line 68
    const/4 v7, 0x2

    .line 69
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v21

    .line 73
    const/4 v9, 0x1

    .line 74
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v22

    .line 78
    iget-object v11, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 79
    .line 80
    const/16 v23, 0x0

    .line 81
    .line 82
    if-nez v11, :cond_0

    .line 83
    .line 84
    return-object v23

    .line 85
    :cond_0
    const-string v13, "\\."

    .line 86
    .line 87
    invoke-virtual {v11, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    iget-object v13, v0, Ll/sqr0;->l:Ljava/lang/String;

    .line 92
    .line 93
    const-string v15, "video/dolby-vision"

    .line 94
    .line 95
    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    const/4 v15, 0x3

    .line 100
    const-string v1, "MediaCodecUtil"

    .line 101
    .line 102
    if-eqz v13, :cond_a

    .line 103
    .line 104
    iget-object v0, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 105
    .line 106
    array-length v3, v11

    .line 107
    const-string v5, "Ignoring malformed Dolby Vision codec string: "

    .line 108
    .line 109
    if-ge v3, v15, :cond_1

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-object v23

    .line 123
    :cond_1
    sget-object v3, Ll/oxy0;->a:Ljava/util/regex/Pattern;

    .line 124
    .line 125
    aget-object v13, v11, v9

    .line 126
    .line 127
    invoke-virtual {v3, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    .line 132
    .line 133
    .line 134
    move-result v13

    .line 135
    if-nez v13, :cond_2

    .line 136
    .line 137
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v23

    .line 149
    :cond_2
    invoke-virtual {v3, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v3, "01"

    .line 154
    .line 155
    const-string v5, "02"

    .line 156
    .line 157
    const-string v9, "03"

    .line 158
    .line 159
    const-string v13, "04"

    .line 160
    .line 161
    const-string v15, "05"

    .line 162
    .line 163
    move/from16 v24, v7

    .line 164
    .line 165
    const-string v7, "06"

    .line 166
    .line 167
    move-object/from16 v25, v2

    .line 168
    .line 169
    const-string v2, "07"

    .line 170
    .line 171
    move-object/from16 v26, v4

    .line 172
    .line 173
    const-string v4, "08"

    .line 174
    .line 175
    move-object/from16 v27, v6

    .line 176
    .line 177
    const-string v6, "09"

    .line 178
    .line 179
    if-nez v0, :cond_5

    .line 180
    .line 181
    :cond_3
    :goto_0
    move-object/from16 v28, v8

    .line 182
    .line 183
    :cond_4
    move-object/from16 v8, v23

    .line 184
    .line 185
    goto/16 :goto_1

    .line 186
    .line 187
    :cond_5
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v17

    .line 191
    packed-switch v17, :pswitch_data_0

    .line 192
    .line 193
    .line 194
    goto :goto_0

    .line 195
    :pswitch_0
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v17

    .line 199
    if-eqz v17, :cond_3

    .line 200
    .line 201
    move-object/from16 v28, v8

    .line 202
    .line 203
    move-object v8, v10

    .line 204
    goto/16 :goto_1

    .line 205
    .line 206
    :pswitch_1
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v17

    .line 210
    if-eqz v17, :cond_3

    .line 211
    .line 212
    move-object/from16 v28, v8

    .line 213
    .line 214
    goto/16 :goto_1

    .line 215
    .line 216
    :pswitch_2
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v17

    .line 220
    if-eqz v17, :cond_3

    .line 221
    .line 222
    move-object/from16 v28, v8

    .line 223
    .line 224
    move-object/from16 v8, v27

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :pswitch_3
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v17

    .line 231
    if-eqz v17, :cond_3

    .line 232
    .line 233
    move-object/from16 v28, v8

    .line 234
    .line 235
    move-object v8, v14

    .line 236
    goto :goto_1

    .line 237
    :pswitch_4
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v17

    .line 241
    if-eqz v17, :cond_3

    .line 242
    .line 243
    move-object/from16 v28, v8

    .line 244
    .line 245
    move-object v8, v12

    .line 246
    goto :goto_1

    .line 247
    :pswitch_5
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v17

    .line 251
    if-eqz v17, :cond_3

    .line 252
    .line 253
    move-object/from16 v28, v8

    .line 254
    .line 255
    move-object/from16 v8, v19

    .line 256
    .line 257
    goto :goto_1

    .line 258
    :pswitch_6
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v17

    .line 262
    if-eqz v17, :cond_3

    .line 263
    .line 264
    move-object/from16 v28, v8

    .line 265
    .line 266
    move-object/from16 v8, v18

    .line 267
    .line 268
    goto :goto_1

    .line 269
    :pswitch_7
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v17

    .line 273
    if-eqz v17, :cond_3

    .line 274
    .line 275
    move-object/from16 v28, v8

    .line 276
    .line 277
    move-object/from16 v8, v20

    .line 278
    .line 279
    goto :goto_1

    .line 280
    :pswitch_8
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result v17

    .line 284
    if-eqz v17, :cond_3

    .line 285
    .line 286
    move-object/from16 v28, v8

    .line 287
    .line 288
    move-object/from16 v8, v21

    .line 289
    .line 290
    goto :goto_1

    .line 291
    :pswitch_9
    move-object/from16 v28, v8

    .line 292
    .line 293
    const-string v8, "00"

    .line 294
    .line 295
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v8

    .line 299
    if-eqz v8, :cond_4

    .line 300
    .line 301
    move-object/from16 v8, v22

    .line 302
    .line 303
    :goto_1
    if-nez v8, :cond_6

    .line 304
    .line 305
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    const-string v2, "Unknown Dolby Vision profile string: "

    .line 310
    .line 311
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    return-object v23

    .line 319
    :cond_6
    aget-object v0, v11, v24

    .line 320
    .line 321
    if-nez v0, :cond_8

    .line 322
    .line 323
    :cond_7
    :goto_2
    move-object/from16 v2, v23

    .line 324
    .line 325
    goto/16 :goto_3

    .line 326
    .line 327
    :cond_8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 328
    .line 329
    .line 330
    move-result v11

    .line 331
    packed-switch v11, :pswitch_data_1

    .line 332
    .line 333
    .line 334
    packed-switch v11, :pswitch_data_2

    .line 335
    .line 336
    .line 337
    goto :goto_2

    .line 338
    :pswitch_a
    const-string v2, "13"

    .line 339
    .line 340
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result v2

    .line 344
    if-eqz v2, :cond_7

    .line 345
    .line 346
    move-object/from16 v2, v16

    .line 347
    .line 348
    goto/16 :goto_3

    .line 349
    .line 350
    :pswitch_b
    const-string v2, "12"

    .line 351
    .line 352
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    if-eqz v2, :cond_7

    .line 357
    .line 358
    move-object/from16 v2, v26

    .line 359
    .line 360
    goto/16 :goto_3

    .line 361
    .line 362
    :pswitch_c
    const-string v2, "11"

    .line 363
    .line 364
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    if-eqz v2, :cond_7

    .line 369
    .line 370
    move-object/from16 v2, v25

    .line 371
    .line 372
    goto/16 :goto_3

    .line 373
    .line 374
    :pswitch_d
    const-string v2, "10"

    .line 375
    .line 376
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    if-eqz v2, :cond_7

    .line 381
    .line 382
    move-object v2, v10

    .line 383
    goto :goto_3

    .line 384
    :pswitch_e
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    if-eqz v2, :cond_7

    .line 389
    .line 390
    move-object/from16 v2, v28

    .line 391
    .line 392
    goto :goto_3

    .line 393
    :pswitch_f
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result v2

    .line 397
    if-eqz v2, :cond_7

    .line 398
    .line 399
    move-object/from16 v2, v27

    .line 400
    .line 401
    goto :goto_3

    .line 402
    :pswitch_10
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    if-eqz v2, :cond_7

    .line 407
    .line 408
    move-object v2, v14

    .line 409
    goto :goto_3

    .line 410
    :pswitch_11
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-eqz v2, :cond_7

    .line 415
    .line 416
    move-object v2, v12

    .line 417
    goto :goto_3

    .line 418
    :pswitch_12
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    move-result v2

    .line 422
    if-eqz v2, :cond_7

    .line 423
    .line 424
    move-object/from16 v2, v19

    .line 425
    .line 426
    goto :goto_3

    .line 427
    :pswitch_13
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    move-result v2

    .line 431
    if-eqz v2, :cond_7

    .line 432
    .line 433
    move-object/from16 v2, v18

    .line 434
    .line 435
    goto :goto_3

    .line 436
    :pswitch_14
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v2

    .line 440
    if-eqz v2, :cond_7

    .line 441
    .line 442
    move-object/from16 v2, v20

    .line 443
    .line 444
    goto :goto_3

    .line 445
    :pswitch_15
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v2

    .line 449
    if-eqz v2, :cond_7

    .line 450
    .line 451
    move-object/from16 v2, v21

    .line 452
    .line 453
    goto :goto_3

    .line 454
    :pswitch_16
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    if-eqz v2, :cond_7

    .line 459
    .line 460
    move-object/from16 v2, v22

    .line 461
    .line 462
    :goto_3
    if-nez v2, :cond_9

    .line 463
    .line 464
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    const-string v2, "Unknown Dolby Vision level string: "

    .line 469
    .line 470
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    return-object v23

    .line 478
    :cond_9
    new-instance v0, Landroid/util/Pair;

    .line 479
    .line 480
    invoke-direct {v0, v8, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 481
    .line 482
    .line 483
    return-object v0

    .line 484
    :cond_a
    move-object/from16 v25, v2

    .line 485
    .line 486
    move-object/from16 v26, v4

    .line 487
    .line 488
    move-object/from16 v27, v6

    .line 489
    .line 490
    move/from16 v24, v7

    .line 491
    .line 492
    move-object/from16 v28, v8

    .line 493
    .line 494
    const/4 v2, 0x0

    .line 495
    aget-object v4, v11, v2

    .line 496
    .line 497
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 498
    .line 499
    .line 500
    move-result v6

    .line 501
    const/16 v7, 0xa

    .line 502
    .line 503
    const/high16 v29, 0x10000

    .line 504
    .line 505
    const v30, 0x8000

    .line 506
    .line 507
    .line 508
    const/16 v8, 0x14

    .line 509
    .line 510
    const/16 v31, 0x2000

    .line 511
    .line 512
    const/16 v32, 0x4000

    .line 513
    .line 514
    const/4 v13, 0x6

    .line 515
    move/from16 v33, v2

    .line 516
    .line 517
    const/4 v2, -0x1

    .line 518
    sparse-switch v6, :sswitch_data_0

    .line 519
    .line 520
    .line 521
    goto/16 :goto_11

    .line 522
    .line 523
    :sswitch_0
    const-string v6, "vp09"

    .line 524
    .line 525
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 526
    .line 527
    .line 528
    move-result v4

    .line 529
    if-eqz v4, :cond_3b

    .line 530
    .line 531
    iget-object v0, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 532
    .line 533
    array-length v4, v11

    .line 534
    const-string v6, "Ignoring malformed VP9 codec string: "

    .line 535
    .line 536
    if-ge v4, v15, :cond_b

    .line 537
    .line 538
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    return-object v23

    .line 550
    :cond_b
    :try_start_0
    aget-object v4, v11, v9

    .line 551
    .line 552
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 553
    .line 554
    .line 555
    move-result v4

    .line 556
    aget-object v10, v11, v24

    .line 557
    .line 558
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 559
    .line 560
    .line 561
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    if-eqz v4, :cond_f

    .line 563
    .line 564
    if-eq v4, v9, :cond_e

    .line 565
    .line 566
    move/from16 v6, v24

    .line 567
    .line 568
    if-eq v4, v6, :cond_d

    .line 569
    .line 570
    if-eq v4, v15, :cond_c

    .line 571
    .line 572
    move v6, v2

    .line 573
    goto :goto_4

    .line 574
    :cond_c
    const/16 v6, 0x8

    .line 575
    .line 576
    goto :goto_4

    .line 577
    :cond_d
    move v6, v5

    .line 578
    goto :goto_4

    .line 579
    :cond_e
    const/4 v6, 0x2

    .line 580
    goto :goto_4

    .line 581
    :cond_f
    move v6, v9

    .line 582
    :goto_4
    if-ne v6, v2, :cond_10

    .line 583
    .line 584
    new-instance v0, Ljava/lang/StringBuilder;

    .line 585
    .line 586
    const-string v2, "Unknown VP9 profile: "

    .line 587
    .line 588
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v0

    .line 598
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    .line 600
    .line 601
    return-object v23

    .line 602
    :cond_10
    if-eq v0, v7, :cond_19

    .line 603
    .line 604
    const/16 v4, 0xb

    .line 605
    .line 606
    if-eq v0, v4, :cond_18

    .line 607
    .line 608
    if-eq v0, v8, :cond_17

    .line 609
    .line 610
    const/16 v4, 0x15

    .line 611
    .line 612
    if-eq v0, v4, :cond_16

    .line 613
    .line 614
    const/16 v4, 0x1e

    .line 615
    .line 616
    if-eq v0, v4, :cond_1a

    .line 617
    .line 618
    const/16 v3, 0x1f

    .line 619
    .line 620
    if-eq v0, v3, :cond_15

    .line 621
    .line 622
    const/16 v3, 0x28

    .line 623
    .line 624
    if-eq v0, v3, :cond_14

    .line 625
    .line 626
    const/16 v3, 0x29

    .line 627
    .line 628
    if-eq v0, v3, :cond_13

    .line 629
    .line 630
    const/16 v3, 0x32

    .line 631
    .line 632
    if-eq v0, v3, :cond_12

    .line 633
    .line 634
    const/16 v3, 0x33

    .line 635
    .line 636
    if-eq v0, v3, :cond_11

    .line 637
    .line 638
    packed-switch v0, :pswitch_data_3

    .line 639
    .line 640
    .line 641
    move v3, v2

    .line 642
    goto :goto_5

    .line 643
    :pswitch_17
    move/from16 v3, v31

    .line 644
    .line 645
    goto :goto_5

    .line 646
    :pswitch_18
    const/16 v3, 0x1000

    .line 647
    .line 648
    goto :goto_5

    .line 649
    :pswitch_19
    const/16 v3, 0x800

    .line 650
    .line 651
    goto :goto_5

    .line 652
    :cond_11
    const/16 v3, 0x200

    .line 653
    .line 654
    goto :goto_5

    .line 655
    :cond_12
    const/16 v3, 0x100

    .line 656
    .line 657
    goto :goto_5

    .line 658
    :cond_13
    const/16 v3, 0x80

    .line 659
    .line 660
    goto :goto_5

    .line 661
    :cond_14
    const/16 v3, 0x40

    .line 662
    .line 663
    goto :goto_5

    .line 664
    :cond_15
    const/16 v3, 0x20

    .line 665
    .line 666
    goto :goto_5

    .line 667
    :cond_16
    const/16 v3, 0x8

    .line 668
    .line 669
    goto :goto_5

    .line 670
    :cond_17
    move v3, v5

    .line 671
    goto :goto_5

    .line 672
    :cond_18
    const/4 v3, 0x2

    .line 673
    goto :goto_5

    .line 674
    :cond_19
    move v3, v9

    .line 675
    :cond_1a
    :goto_5
    if-ne v3, v2, :cond_1b

    .line 676
    .line 677
    new-instance v2, Ljava/lang/StringBuilder;

    .line 678
    .line 679
    const-string v3, "Unknown VP9 level: "

    .line 680
    .line 681
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    move-result-object v0

    .line 691
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    .line 693
    .line 694
    return-object v23

    .line 695
    :cond_1b
    new-instance v0, Landroid/util/Pair;

    .line 696
    .line 697
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 698
    .line 699
    .line 700
    move-result-object v1

    .line 701
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 706
    .line 707
    .line 708
    return-object v0

    .line 709
    :catch_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 710
    .line 711
    .line 712
    move-result-object v0

    .line 713
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 714
    .line 715
    .line 716
    move-result-object v0

    .line 717
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    .line 719
    .line 720
    goto/16 :goto_11

    .line 721
    .line 722
    :sswitch_1
    const-string v6, "mp4a"

    .line 723
    .line 724
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 725
    .line 726
    .line 727
    move-result v4

    .line 728
    if-eqz v4, :cond_3b

    .line 729
    .line 730
    iget-object v0, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 731
    .line 732
    array-length v4, v11

    .line 733
    const-string v6, "Ignoring malformed MP4A codec string: "

    .line 734
    .line 735
    if-eq v4, v15, :cond_1c

    .line 736
    .line 737
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    move-result-object v0

    .line 741
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v0

    .line 745
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    .line 747
    .line 748
    return-object v23

    .line 749
    :cond_1c
    :try_start_1
    aget-object v4, v11, v9

    .line 750
    .line 751
    invoke-static {v4, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 752
    .line 753
    .line 754
    move-result v3

    .line 755
    invoke-static {v3}, Ll/a8t0;->d(I)Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v3

    .line 759
    const-string v4, "audio/mp4a-latm"

    .line 760
    .line 761
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 762
    .line 763
    .line 764
    move-result v3

    .line 765
    if-eqz v3, :cond_1f

    .line 766
    .line 767
    const/16 v24, 0x2

    .line 768
    .line 769
    aget-object v3, v11, v24

    .line 770
    .line 771
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 772
    .line 773
    .line 774
    move-result v3

    .line 775
    const/16 v4, 0x11

    .line 776
    .line 777
    if-eq v3, v4, :cond_1d

    .line 778
    .line 779
    if-eq v3, v8, :cond_1e

    .line 780
    .line 781
    const/16 v4, 0x17

    .line 782
    .line 783
    if-eq v3, v4, :cond_1d

    .line 784
    .line 785
    const/16 v4, 0x1d

    .line 786
    .line 787
    if-eq v3, v4, :cond_1d

    .line 788
    .line 789
    const/16 v4, 0x27

    .line 790
    .line 791
    if-eq v3, v4, :cond_1d

    .line 792
    .line 793
    const/16 v4, 0x2a

    .line 794
    .line 795
    if-eq v3, v4, :cond_1d

    .line 796
    .line 797
    packed-switch v3, :pswitch_data_4

    .line 798
    .line 799
    .line 800
    move v5, v2

    .line 801
    goto :goto_6

    .line 802
    :pswitch_1a
    move v5, v13

    .line 803
    goto :goto_6

    .line 804
    :pswitch_1b
    const/4 v5, 0x5

    .line 805
    goto :goto_6

    .line 806
    :pswitch_1c
    move v5, v15

    .line 807
    goto :goto_6

    .line 808
    :pswitch_1d
    const/4 v5, 0x2

    .line 809
    goto :goto_6

    .line 810
    :pswitch_1e
    move v5, v9

    .line 811
    goto :goto_6

    .line 812
    :cond_1d
    move v5, v4

    .line 813
    goto :goto_6

    .line 814
    :cond_1e
    move v5, v8

    .line 815
    :goto_6
    :pswitch_1f
    if-eq v5, v2, :cond_1f

    .line 816
    .line 817
    new-instance v2, Landroid/util/Pair;

    .line 818
    .line 819
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 820
    .line 821
    .line 822
    move-result-object v3

    .line 823
    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 824
    .line 825
    .line 826
    move-result-object v4

    .line 827
    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 828
    .line 829
    .line 830
    return-object v2

    .line 831
    :cond_1f
    return-object v23

    .line 832
    :catch_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 833
    .line 834
    .line 835
    move-result-object v0

    .line 836
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 837
    .line 838
    .line 839
    move-result-object v0

    .line 840
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    .line 842
    .line 843
    goto/16 :goto_11

    .line 844
    .line 845
    :sswitch_2
    const-string v2, "hvc1"

    .line 846
    .line 847
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 848
    .line 849
    .line 850
    move-result v2

    .line 851
    if-eqz v2, :cond_3b

    .line 852
    .line 853
    goto :goto_7

    .line 854
    :sswitch_3
    const-string v2, "hev1"

    .line 855
    .line 856
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 857
    .line 858
    .line 859
    move-result v2

    .line 860
    if-eqz v2, :cond_3b

    .line 861
    .line 862
    :goto_7
    iget-object v2, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 863
    .line 864
    iget-object v0, v0, Ll/sqr0;->x:Ll/wwy0;

    .line 865
    .line 866
    array-length v3, v11

    .line 867
    const-string v4, "Ignoring malformed HEVC codec string: "

    .line 868
    .line 869
    if-ge v3, v5, :cond_20

    .line 870
    .line 871
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 876
    .line 877
    .line 878
    move-result-object v0

    .line 879
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    .line 881
    .line 882
    return-object v23

    .line 883
    :cond_20
    sget-object v3, Ll/oxy0;->a:Ljava/util/regex/Pattern;

    .line 884
    .line 885
    aget-object v5, v11, v9

    .line 886
    .line 887
    invoke-virtual {v3, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 888
    .line 889
    .line 890
    move-result-object v3

    .line 891
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    .line 892
    .line 893
    .line 894
    move-result v5

    .line 895
    if-nez v5, :cond_21

    .line 896
    .line 897
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 898
    .line 899
    .line 900
    move-result-object v0

    .line 901
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 902
    .line 903
    .line 904
    move-result-object v0

    .line 905
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 906
    .line 907
    .line 908
    return-object v23

    .line 909
    :cond_21
    invoke-virtual {v3, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 910
    .line 911
    .line 912
    move-result-object v2

    .line 913
    const-string v3, "1"

    .line 914
    .line 915
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 916
    .line 917
    .line 918
    move-result v3

    .line 919
    if-eqz v3, :cond_22

    .line 920
    .line 921
    move/from16 v24, v9

    .line 922
    .line 923
    goto :goto_8

    .line 924
    :cond_22
    const-string v3, "2"

    .line 925
    .line 926
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 927
    .line 928
    .line 929
    move-result v3

    .line 930
    if-eqz v3, :cond_27

    .line 931
    .line 932
    if-eqz v0, :cond_23

    .line 933
    .line 934
    iget v0, v0, Ll/wwy0;->c:I

    .line 935
    .line 936
    if-ne v0, v13, :cond_23

    .line 937
    .line 938
    const/16 v24, 0x1000

    .line 939
    .line 940
    goto :goto_8

    .line 941
    :cond_23
    const/16 v24, 0x2

    .line 942
    .line 943
    :goto_8
    aget-object v0, v11, v15

    .line 944
    .line 945
    if-nez v0, :cond_25

    .line 946
    .line 947
    :cond_24
    :goto_9
    move-object/from16 v2, v23

    .line 948
    .line 949
    goto/16 :goto_a

    .line 950
    .line 951
    :cond_25
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 952
    .line 953
    .line 954
    move-result v2

    .line 955
    sparse-switch v2, :sswitch_data_1

    .line 956
    .line 957
    .line 958
    goto :goto_9

    .line 959
    :sswitch_4
    const-string v2, "L186"

    .line 960
    .line 961
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 962
    .line 963
    .line 964
    move-result v2

    .line 965
    if-eqz v2, :cond_24

    .line 966
    .line 967
    const/high16 v2, 0x1000000

    .line 968
    .line 969
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 970
    .line 971
    .line 972
    move-result-object v2

    .line 973
    goto/16 :goto_a

    .line 974
    .line 975
    :sswitch_5
    const-string v2, "L183"

    .line 976
    .line 977
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 978
    .line 979
    .line 980
    move-result v2

    .line 981
    if-eqz v2, :cond_24

    .line 982
    .line 983
    const/high16 v2, 0x400000

    .line 984
    .line 985
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 986
    .line 987
    .line 988
    move-result-object v2

    .line 989
    goto/16 :goto_a

    .line 990
    .line 991
    :sswitch_6
    const-string v2, "L180"

    .line 992
    .line 993
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 994
    .line 995
    .line 996
    move-result v2

    .line 997
    if-eqz v2, :cond_24

    .line 998
    .line 999
    const/high16 v2, 0x100000

    .line 1000
    .line 1001
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1002
    .line 1003
    .line 1004
    move-result-object v2

    .line 1005
    goto/16 :goto_a

    .line 1006
    .line 1007
    :sswitch_7
    const-string v2, "L156"

    .line 1008
    .line 1009
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1010
    .line 1011
    .line 1012
    move-result v2

    .line 1013
    if-eqz v2, :cond_24

    .line 1014
    .line 1015
    const/high16 v2, 0x40000

    .line 1016
    .line 1017
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v2

    .line 1021
    goto/16 :goto_a

    .line 1022
    .line 1023
    :sswitch_8
    const-string v2, "L153"

    .line 1024
    .line 1025
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1026
    .line 1027
    .line 1028
    move-result v2

    .line 1029
    if-eqz v2, :cond_24

    .line 1030
    .line 1031
    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v2

    .line 1035
    goto/16 :goto_a

    .line 1036
    .line 1037
    :sswitch_9
    const-string v2, "L150"

    .line 1038
    .line 1039
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1040
    .line 1041
    .line 1042
    move-result v2

    .line 1043
    if-eqz v2, :cond_24

    .line 1044
    .line 1045
    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1046
    .line 1047
    .line 1048
    move-result-object v2

    .line 1049
    goto/16 :goto_a

    .line 1050
    .line 1051
    :sswitch_a
    const-string v2, "L123"

    .line 1052
    .line 1053
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1054
    .line 1055
    .line 1056
    move-result v2

    .line 1057
    if-eqz v2, :cond_24

    .line 1058
    .line 1059
    move-object/from16 v2, v16

    .line 1060
    .line 1061
    goto/16 :goto_a

    .line 1062
    .line 1063
    :sswitch_b
    const-string v2, "L120"

    .line 1064
    .line 1065
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1066
    .line 1067
    .line 1068
    move-result v2

    .line 1069
    if-eqz v2, :cond_24

    .line 1070
    .line 1071
    move-object/from16 v2, v25

    .line 1072
    .line 1073
    goto/16 :goto_a

    .line 1074
    .line 1075
    :sswitch_c
    const-string v2, "H186"

    .line 1076
    .line 1077
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1078
    .line 1079
    .line 1080
    move-result v2

    .line 1081
    if-eqz v2, :cond_24

    .line 1082
    .line 1083
    const/high16 v2, 0x2000000

    .line 1084
    .line 1085
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v2

    .line 1089
    goto/16 :goto_a

    .line 1090
    .line 1091
    :sswitch_d
    const-string v2, "H183"

    .line 1092
    .line 1093
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1094
    .line 1095
    .line 1096
    move-result v2

    .line 1097
    if-eqz v2, :cond_24

    .line 1098
    .line 1099
    const/high16 v2, 0x800000

    .line 1100
    .line 1101
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1102
    .line 1103
    .line 1104
    move-result-object v2

    .line 1105
    goto/16 :goto_a

    .line 1106
    .line 1107
    :sswitch_e
    const-string v2, "H180"

    .line 1108
    .line 1109
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1110
    .line 1111
    .line 1112
    move-result v2

    .line 1113
    if-eqz v2, :cond_24

    .line 1114
    .line 1115
    const/high16 v2, 0x200000

    .line 1116
    .line 1117
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v2

    .line 1121
    goto/16 :goto_a

    .line 1122
    .line 1123
    :sswitch_f
    const-string v2, "H156"

    .line 1124
    .line 1125
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1126
    .line 1127
    .line 1128
    move-result v2

    .line 1129
    if-eqz v2, :cond_24

    .line 1130
    .line 1131
    const/high16 v2, 0x80000

    .line 1132
    .line 1133
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1134
    .line 1135
    .line 1136
    move-result-object v2

    .line 1137
    goto/16 :goto_a

    .line 1138
    .line 1139
    :sswitch_10
    const-string v2, "H153"

    .line 1140
    .line 1141
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1142
    .line 1143
    .line 1144
    move-result v2

    .line 1145
    if-eqz v2, :cond_24

    .line 1146
    .line 1147
    const/high16 v2, 0x20000

    .line 1148
    .line 1149
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v2

    .line 1153
    goto/16 :goto_a

    .line 1154
    .line 1155
    :sswitch_11
    const-string v2, "H150"

    .line 1156
    .line 1157
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1158
    .line 1159
    .line 1160
    move-result v2

    .line 1161
    if-eqz v2, :cond_24

    .line 1162
    .line 1163
    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1164
    .line 1165
    .line 1166
    move-result-object v2

    .line 1167
    goto/16 :goto_a

    .line 1168
    .line 1169
    :sswitch_12
    const-string v2, "H123"

    .line 1170
    .line 1171
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1172
    .line 1173
    .line 1174
    move-result v2

    .line 1175
    if-eqz v2, :cond_24

    .line 1176
    .line 1177
    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v2

    .line 1181
    goto/16 :goto_a

    .line 1182
    .line 1183
    :sswitch_13
    const-string v2, "H120"

    .line 1184
    .line 1185
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1186
    .line 1187
    .line 1188
    move-result v2

    .line 1189
    if-eqz v2, :cond_24

    .line 1190
    .line 1191
    move-object/from16 v2, v26

    .line 1192
    .line 1193
    goto/16 :goto_a

    .line 1194
    .line 1195
    :sswitch_14
    const-string v2, "L93"

    .line 1196
    .line 1197
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1198
    .line 1199
    .line 1200
    move-result v2

    .line 1201
    if-eqz v2, :cond_24

    .line 1202
    .line 1203
    move-object/from16 v2, v28

    .line 1204
    .line 1205
    goto/16 :goto_a

    .line 1206
    .line 1207
    :sswitch_15
    const-string v2, "L90"

    .line 1208
    .line 1209
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1210
    .line 1211
    .line 1212
    move-result v2

    .line 1213
    if-eqz v2, :cond_24

    .line 1214
    .line 1215
    move-object v2, v14

    .line 1216
    goto :goto_a

    .line 1217
    :sswitch_16
    const-string v2, "L63"

    .line 1218
    .line 1219
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1220
    .line 1221
    .line 1222
    move-result v2

    .line 1223
    if-eqz v2, :cond_24

    .line 1224
    .line 1225
    move-object/from16 v2, v19

    .line 1226
    .line 1227
    goto :goto_a

    .line 1228
    :sswitch_17
    const-string v2, "L60"

    .line 1229
    .line 1230
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1231
    .line 1232
    .line 1233
    move-result v2

    .line 1234
    if-eqz v2, :cond_24

    .line 1235
    .line 1236
    move-object/from16 v2, v20

    .line 1237
    .line 1238
    goto :goto_a

    .line 1239
    :sswitch_18
    const-string v2, "L30"

    .line 1240
    .line 1241
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1242
    .line 1243
    .line 1244
    move-result v2

    .line 1245
    if-eqz v2, :cond_24

    .line 1246
    .line 1247
    move-object/from16 v2, v22

    .line 1248
    .line 1249
    goto :goto_a

    .line 1250
    :sswitch_19
    const-string v2, "H93"

    .line 1251
    .line 1252
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1253
    .line 1254
    .line 1255
    move-result v2

    .line 1256
    if-eqz v2, :cond_24

    .line 1257
    .line 1258
    move-object v2, v10

    .line 1259
    goto :goto_a

    .line 1260
    :sswitch_1a
    const-string v2, "H90"

    .line 1261
    .line 1262
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1263
    .line 1264
    .line 1265
    move-result v2

    .line 1266
    if-eqz v2, :cond_24

    .line 1267
    .line 1268
    move-object/from16 v2, v27

    .line 1269
    .line 1270
    goto :goto_a

    .line 1271
    :sswitch_1b
    const-string v2, "H63"

    .line 1272
    .line 1273
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1274
    .line 1275
    .line 1276
    move-result v2

    .line 1277
    if-eqz v2, :cond_24

    .line 1278
    .line 1279
    move-object v2, v12

    .line 1280
    goto :goto_a

    .line 1281
    :sswitch_1c
    const-string v2, "H60"

    .line 1282
    .line 1283
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1284
    .line 1285
    .line 1286
    move-result v2

    .line 1287
    if-eqz v2, :cond_24

    .line 1288
    .line 1289
    move-object/from16 v2, v18

    .line 1290
    .line 1291
    goto :goto_a

    .line 1292
    :sswitch_1d
    const-string v2, "H30"

    .line 1293
    .line 1294
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1295
    .line 1296
    .line 1297
    move-result v2

    .line 1298
    if-eqz v2, :cond_24

    .line 1299
    .line 1300
    move-object/from16 v2, v21

    .line 1301
    .line 1302
    :goto_a
    if-nez v2, :cond_26

    .line 1303
    .line 1304
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v0

    .line 1308
    const-string v2, "Unknown HEVC level string: "

    .line 1309
    .line 1310
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1311
    .line 1312
    .line 1313
    move-result-object v0

    .line 1314
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    .line 1316
    .line 1317
    return-object v23

    .line 1318
    :cond_26
    new-instance v0, Landroid/util/Pair;

    .line 1319
    .line 1320
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1321
    .line 1322
    .line 1323
    move-result-object v1

    .line 1324
    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1325
    .line 1326
    .line 1327
    return-object v0

    .line 1328
    :cond_27
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v0

    .line 1332
    const-string v2, "Unknown HEVC profile string: "

    .line 1333
    .line 1334
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v0

    .line 1338
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1339
    .line 1340
    .line 1341
    return-object v23

    .line 1342
    :sswitch_1e
    const-string v6, "avc2"

    .line 1343
    .line 1344
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1345
    .line 1346
    .line 1347
    move-result v4

    .line 1348
    if-eqz v4, :cond_3b

    .line 1349
    .line 1350
    goto :goto_b

    .line 1351
    :sswitch_1f
    const-string v6, "avc1"

    .line 1352
    .line 1353
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1354
    .line 1355
    .line 1356
    move-result v4

    .line 1357
    if-eqz v4, :cond_3b

    .line 1358
    .line 1359
    :goto_b
    iget-object v0, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 1360
    .line 1361
    array-length v4, v11

    .line 1362
    const-string v6, "Ignoring malformed AVC codec string: "

    .line 1363
    .line 1364
    const/4 v7, 0x2

    .line 1365
    if-ge v4, v7, :cond_28

    .line 1366
    .line 1367
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v0

    .line 1371
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1372
    .line 1373
    .line 1374
    move-result-object v0

    .line 1375
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    .line 1377
    .line 1378
    return-object v23

    .line 1379
    :cond_28
    :try_start_2
    aget-object v7, v11, v9

    .line 1380
    .line 1381
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 1382
    .line 1383
    .line 1384
    move-result v7

    .line 1385
    if-ne v7, v13, :cond_29

    .line 1386
    .line 1387
    aget-object v4, v11, v9

    .line 1388
    .line 1389
    move/from16 v7, v33

    .line 1390
    .line 1391
    const/4 v8, 0x2

    .line 1392
    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v4

    .line 1396
    invoke-static {v4, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 1397
    .line 1398
    .line 1399
    move-result v4

    .line 1400
    aget-object v7, v11, v9

    .line 1401
    .line 1402
    invoke-virtual {v7, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 1403
    .line 1404
    .line 1405
    move-result-object v7

    .line 1406
    invoke-static {v7, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 1407
    .line 1408
    .line 1409
    move-result v0

    .line 1410
    goto :goto_c

    .line 1411
    :cond_29
    if-lt v4, v15, :cond_33

    .line 1412
    .line 1413
    aget-object v4, v11, v9

    .line 1414
    .line 1415
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1416
    .line 1417
    .line 1418
    move-result v4

    .line 1419
    const/16 v24, 0x2

    .line 1420
    .line 1421
    aget-object v7, v11, v24

    .line 1422
    .line 1423
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1424
    .line 1425
    .line 1426
    move-result v0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1427
    :goto_c
    const/16 v6, 0x42

    .line 1428
    .line 1429
    if-eq v4, v6, :cond_30

    .line 1430
    .line 1431
    const/16 v6, 0x4d

    .line 1432
    .line 1433
    if-eq v4, v6, :cond_2f

    .line 1434
    .line 1435
    const/16 v6, 0x58

    .line 1436
    .line 1437
    if-eq v4, v6, :cond_2e

    .line 1438
    .line 1439
    const/16 v6, 0x64

    .line 1440
    .line 1441
    if-eq v4, v6, :cond_2d

    .line 1442
    .line 1443
    const/16 v6, 0x6e

    .line 1444
    .line 1445
    if-eq v4, v6, :cond_2c

    .line 1446
    .line 1447
    const/16 v6, 0x7a

    .line 1448
    .line 1449
    if-eq v4, v6, :cond_2b

    .line 1450
    .line 1451
    const/16 v6, 0xf4

    .line 1452
    .line 1453
    if-eq v4, v6, :cond_2a

    .line 1454
    .line 1455
    move v7, v2

    .line 1456
    goto :goto_d

    .line 1457
    :cond_2a
    const/16 v7, 0x40

    .line 1458
    .line 1459
    goto :goto_d

    .line 1460
    :cond_2b
    const/16 v7, 0x20

    .line 1461
    .line 1462
    goto :goto_d

    .line 1463
    :cond_2c
    move v7, v3

    .line 1464
    goto :goto_d

    .line 1465
    :cond_2d
    const/16 v7, 0x8

    .line 1466
    .line 1467
    goto :goto_d

    .line 1468
    :cond_2e
    move v7, v5

    .line 1469
    goto :goto_d

    .line 1470
    :cond_2f
    const/4 v7, 0x2

    .line 1471
    goto :goto_d

    .line 1472
    :cond_30
    move v7, v9

    .line 1473
    :goto_d
    if-ne v7, v2, :cond_31

    .line 1474
    .line 1475
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1476
    .line 1477
    const-string v2, "Unknown AVC profile: "

    .line 1478
    .line 1479
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1480
    .line 1481
    .line 1482
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1483
    .line 1484
    .line 1485
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1486
    .line 1487
    .line 1488
    move-result-object v0

    .line 1489
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1490
    .line 1491
    .line 1492
    return-object v23

    .line 1493
    :cond_31
    packed-switch v0, :pswitch_data_5

    .line 1494
    .line 1495
    .line 1496
    packed-switch v0, :pswitch_data_6

    .line 1497
    .line 1498
    .line 1499
    packed-switch v0, :pswitch_data_7

    .line 1500
    .line 1501
    .line 1502
    packed-switch v0, :pswitch_data_8

    .line 1503
    .line 1504
    .line 1505
    packed-switch v0, :pswitch_data_9

    .line 1506
    .line 1507
    .line 1508
    move v3, v2

    .line 1509
    goto :goto_e

    .line 1510
    :pswitch_20
    move/from16 v3, v29

    .line 1511
    .line 1512
    goto :goto_e

    .line 1513
    :pswitch_21
    move/from16 v3, v30

    .line 1514
    .line 1515
    goto :goto_e

    .line 1516
    :pswitch_22
    move/from16 v3, v32

    .line 1517
    .line 1518
    goto :goto_e

    .line 1519
    :pswitch_23
    move/from16 v3, v31

    .line 1520
    .line 1521
    goto :goto_e

    .line 1522
    :pswitch_24
    const/16 v3, 0x1000

    .line 1523
    .line 1524
    goto :goto_e

    .line 1525
    :pswitch_25
    const/16 v3, 0x800

    .line 1526
    .line 1527
    goto :goto_e

    .line 1528
    :pswitch_26
    const/16 v3, 0x400

    .line 1529
    .line 1530
    goto :goto_e

    .line 1531
    :pswitch_27
    const/16 v3, 0x200

    .line 1532
    .line 1533
    goto :goto_e

    .line 1534
    :pswitch_28
    const/16 v3, 0x100

    .line 1535
    .line 1536
    goto :goto_e

    .line 1537
    :pswitch_29
    const/16 v3, 0x80

    .line 1538
    .line 1539
    goto :goto_e

    .line 1540
    :pswitch_2a
    const/16 v3, 0x40

    .line 1541
    .line 1542
    goto :goto_e

    .line 1543
    :pswitch_2b
    const/16 v3, 0x20

    .line 1544
    .line 1545
    goto :goto_e

    .line 1546
    :pswitch_2c
    const/16 v3, 0x8

    .line 1547
    .line 1548
    goto :goto_e

    .line 1549
    :pswitch_2d
    move v3, v5

    .line 1550
    goto :goto_e

    .line 1551
    :pswitch_2e
    move v3, v9

    .line 1552
    :goto_e
    :pswitch_2f
    if-ne v3, v2, :cond_32

    .line 1553
    .line 1554
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1555
    .line 1556
    const-string v3, "Unknown AVC level: "

    .line 1557
    .line 1558
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1559
    .line 1560
    .line 1561
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1562
    .line 1563
    .line 1564
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1565
    .line 1566
    .line 1567
    move-result-object v0

    .line 1568
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1569
    .line 1570
    .line 1571
    return-object v23

    .line 1572
    :cond_32
    new-instance v0, Landroid/util/Pair;

    .line 1573
    .line 1574
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1575
    .line 1576
    .line 1577
    move-result-object v1

    .line 1578
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1579
    .line 1580
    .line 1581
    move-result-object v2

    .line 1582
    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1583
    .line 1584
    .line 1585
    return-object v0

    .line 1586
    :cond_33
    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1587
    .line 1588
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1589
    .line 1590
    .line 1591
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1592
    .line 1593
    .line 1594
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1595
    .line 1596
    .line 1597
    move-result-object v2

    .line 1598
    invoke-static {v1, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_2

    .line 1599
    .line 1600
    .line 1601
    return-object v23

    .line 1602
    :catch_2
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1603
    .line 1604
    .line 1605
    move-result-object v0

    .line 1606
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1607
    .line 1608
    .line 1609
    move-result-object v0

    .line 1610
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1611
    .line 1612
    .line 1613
    goto/16 :goto_11

    .line 1614
    .line 1615
    :sswitch_20
    const-string v6, "av01"

    .line 1616
    .line 1617
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1618
    .line 1619
    .line 1620
    move-result v4

    .line 1621
    if-eqz v4, :cond_3b

    .line 1622
    .line 1623
    iget-object v4, v0, Ll/sqr0;->i:Ljava/lang/String;

    .line 1624
    .line 1625
    iget-object v0, v0, Ll/sqr0;->x:Ll/wwy0;

    .line 1626
    .line 1627
    array-length v6, v11

    .line 1628
    if-ge v6, v5, :cond_34

    .line 1629
    .line 1630
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1631
    .line 1632
    .line 1633
    move-result-object v0

    .line 1634
    const-string v2, "Ignoring malformed AV1 codec string: "

    .line 1635
    .line 1636
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1637
    .line 1638
    .line 1639
    move-result-object v0

    .line 1640
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1641
    .line 1642
    .line 1643
    return-object v23

    .line 1644
    :cond_34
    :try_start_4
    aget-object v6, v11, v9

    .line 1645
    .line 1646
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1647
    .line 1648
    .line 1649
    move-result v6

    .line 1650
    const/4 v8, 0x2

    .line 1651
    aget-object v10, v11, v8

    .line 1652
    .line 1653
    const/4 v12, 0x0

    .line 1654
    invoke-virtual {v10, v12, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 1655
    .line 1656
    .line 1657
    move-result-object v10

    .line 1658
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1659
    .line 1660
    .line 1661
    move-result v10

    .line 1662
    aget-object v11, v11, v15

    .line 1663
    .line 1664
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1665
    .line 1666
    .line 1667
    move-result v4
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_3

    .line 1668
    if-eqz v6, :cond_35

    .line 1669
    .line 1670
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1671
    .line 1672
    const-string v2, "Unknown AV1 profile: "

    .line 1673
    .line 1674
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1675
    .line 1676
    .line 1677
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1678
    .line 1679
    .line 1680
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1681
    .line 1682
    .line 1683
    move-result-object v0

    .line 1684
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1685
    .line 1686
    .line 1687
    return-object v23

    .line 1688
    :cond_35
    const/16 v6, 0x8

    .line 1689
    .line 1690
    if-eq v4, v6, :cond_39

    .line 1691
    .line 1692
    if-eq v4, v7, :cond_36

    .line 1693
    .line 1694
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1695
    .line 1696
    const-string v2, "Unknown AV1 bit depth: "

    .line 1697
    .line 1698
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1699
    .line 1700
    .line 1701
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1702
    .line 1703
    .line 1704
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1705
    .line 1706
    .line 1707
    move-result-object v0

    .line 1708
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1709
    .line 1710
    .line 1711
    return-object v23

    .line 1712
    :cond_36
    if-eqz v0, :cond_38

    .line 1713
    .line 1714
    iget-object v4, v0, Ll/wwy0;->d:[B

    .line 1715
    .line 1716
    if-nez v4, :cond_37

    .line 1717
    .line 1718
    iget v0, v0, Ll/wwy0;->c:I

    .line 1719
    .line 1720
    const/4 v4, 0x7

    .line 1721
    if-eq v0, v4, :cond_37

    .line 1722
    .line 1723
    if-ne v0, v13, :cond_38

    .line 1724
    .line 1725
    :cond_37
    const/16 v0, 0x1000

    .line 1726
    .line 1727
    goto :goto_f

    .line 1728
    :cond_38
    move v0, v8

    .line 1729
    goto :goto_f

    .line 1730
    :cond_39
    move v0, v9

    .line 1731
    :goto_f
    packed-switch v10, :pswitch_data_a

    .line 1732
    .line 1733
    .line 1734
    move v3, v2

    .line 1735
    goto :goto_10

    .line 1736
    :pswitch_30
    const/high16 v3, 0x800000

    .line 1737
    .line 1738
    goto :goto_10

    .line 1739
    :pswitch_31
    const/high16 v3, 0x400000

    .line 1740
    .line 1741
    goto :goto_10

    .line 1742
    :pswitch_32
    const/high16 v3, 0x200000

    .line 1743
    .line 1744
    goto :goto_10

    .line 1745
    :pswitch_33
    const/high16 v3, 0x100000

    .line 1746
    .line 1747
    goto :goto_10

    .line 1748
    :pswitch_34
    const/high16 v3, 0x80000

    .line 1749
    .line 1750
    goto :goto_10

    .line 1751
    :pswitch_35
    const/high16 v3, 0x40000

    .line 1752
    .line 1753
    goto :goto_10

    .line 1754
    :pswitch_36
    const/high16 v3, 0x20000

    .line 1755
    .line 1756
    goto :goto_10

    .line 1757
    :pswitch_37
    move/from16 v3, v29

    .line 1758
    .line 1759
    goto :goto_10

    .line 1760
    :pswitch_38
    move/from16 v3, v30

    .line 1761
    .line 1762
    goto :goto_10

    .line 1763
    :pswitch_39
    move/from16 v3, v32

    .line 1764
    .line 1765
    goto :goto_10

    .line 1766
    :pswitch_3a
    move/from16 v3, v31

    .line 1767
    .line 1768
    goto :goto_10

    .line 1769
    :pswitch_3b
    const/16 v3, 0x1000

    .line 1770
    .line 1771
    goto :goto_10

    .line 1772
    :pswitch_3c
    const/16 v3, 0x800

    .line 1773
    .line 1774
    goto :goto_10

    .line 1775
    :pswitch_3d
    const/16 v3, 0x400

    .line 1776
    .line 1777
    goto :goto_10

    .line 1778
    :pswitch_3e
    const/16 v3, 0x200

    .line 1779
    .line 1780
    goto :goto_10

    .line 1781
    :pswitch_3f
    const/16 v3, 0x100

    .line 1782
    .line 1783
    goto :goto_10

    .line 1784
    :pswitch_40
    const/16 v3, 0x80

    .line 1785
    .line 1786
    goto :goto_10

    .line 1787
    :pswitch_41
    const/16 v3, 0x40

    .line 1788
    .line 1789
    goto :goto_10

    .line 1790
    :pswitch_42
    const/16 v3, 0x20

    .line 1791
    .line 1792
    goto :goto_10

    .line 1793
    :pswitch_43
    move v3, v6

    .line 1794
    goto :goto_10

    .line 1795
    :pswitch_44
    move v3, v5

    .line 1796
    goto :goto_10

    .line 1797
    :pswitch_45
    move v3, v8

    .line 1798
    goto :goto_10

    .line 1799
    :pswitch_46
    move v3, v9

    .line 1800
    :goto_10
    :pswitch_47
    if-ne v3, v2, :cond_3a

    .line 1801
    .line 1802
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1803
    .line 1804
    const-string v2, "Unknown AV1 level: "

    .line 1805
    .line 1806
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1807
    .line 1808
    .line 1809
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1810
    .line 1811
    .line 1812
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1813
    .line 1814
    .line 1815
    move-result-object v0

    .line 1816
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1817
    .line 1818
    .line 1819
    return-object v23

    .line 1820
    :cond_3a
    new-instance v1, Landroid/util/Pair;

    .line 1821
    .line 1822
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1823
    .line 1824
    .line 1825
    move-result-object v0

    .line 1826
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1827
    .line 1828
    .line 1829
    move-result-object v2

    .line 1830
    invoke-direct {v1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1831
    .line 1832
    .line 1833
    return-object v1

    .line 1834
    :catch_3
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 1835
    .line 1836
    .line 1837
    move-result-object v0

    .line 1838
    const-string v2, "Ignoring malformed AV1 codec string: "

    .line 1839
    .line 1840
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1841
    .line 1842
    .line 1843
    move-result-object v0

    .line 1844
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1845
    .line 1846
    .line 1847
    :cond_3b
    :goto_11
    return-object v23

    .line 1848
    nop

    .line 1849
    :pswitch_data_0
    .packed-switch 0x600
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

    .line 1850
    .line 1851
    .line 1852
    .line 1853
    .line 1854
    .line 1855
    .line 1856
    .line 1857
    .line 1858
    .line 1859
    .line 1860
    .line 1861
    .line 1862
    .line 1863
    .line 1864
    .line 1865
    .line 1866
    .line 1867
    .line 1868
    .line 1869
    .line 1870
    .line 1871
    .line 1872
    .line 1873
    :pswitch_data_1
    .packed-switch 0x601
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch

    .line 1874
    .line 1875
    .line 1876
    .line 1877
    .line 1878
    .line 1879
    .line 1880
    .line 1881
    .line 1882
    .line 1883
    .line 1884
    .line 1885
    .line 1886
    .line 1887
    .line 1888
    .line 1889
    .line 1890
    .line 1891
    .line 1892
    .line 1893
    .line 1894
    .line 1895
    :pswitch_data_2
    .packed-switch 0x61f
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    .line 1896
    .line 1897
    .line 1898
    .line 1899
    .line 1900
    .line 1901
    .line 1902
    .line 1903
    .line 1904
    .line 1905
    .line 1906
    .line 1907
    :sswitch_data_0
    .sparse-switch
        0x2dd8f6 -> :sswitch_20
        0x2ddf23 -> :sswitch_1f
        0x2ddf24 -> :sswitch_1e
        0x30d038 -> :sswitch_3
        0x310dbc -> :sswitch_2
        0x333790 -> :sswitch_1
        0x374e43 -> :sswitch_0
    .end sparse-switch

    .line 1908
    .line 1909
    .line 1910
    .line 1911
    .line 1912
    .line 1913
    .line 1914
    .line 1915
    .line 1916
    .line 1917
    .line 1918
    .line 1919
    .line 1920
    .line 1921
    .line 1922
    .line 1923
    .line 1924
    .line 1925
    .line 1926
    .line 1927
    .line 1928
    .line 1929
    .line 1930
    .line 1931
    .line 1932
    .line 1933
    .line 1934
    .line 1935
    .line 1936
    .line 1937
    :pswitch_data_3
    .packed-switch 0x3c
        :pswitch_19
        :pswitch_18
        :pswitch_17
    .end packed-switch

    .line 1938
    .line 1939
    .line 1940
    .line 1941
    .line 1942
    .line 1943
    .line 1944
    .line 1945
    .line 1946
    .line 1947
    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1f
        :pswitch_1b
        :pswitch_1a
    .end packed-switch

    .line 1948
    .line 1949
    .line 1950
    .line 1951
    .line 1952
    .line 1953
    .line 1954
    .line 1955
    .line 1956
    .line 1957
    .line 1958
    .line 1959
    .line 1960
    .line 1961
    .line 1962
    .line 1963
    :sswitch_data_1
    .sparse-switch
        0x114a5 -> :sswitch_1d
        0x11502 -> :sswitch_1c
        0x11505 -> :sswitch_1b
        0x1155f -> :sswitch_1a
        0x11562 -> :sswitch_19
        0x123a9 -> :sswitch_18
        0x12406 -> :sswitch_17
        0x12409 -> :sswitch_16
        0x12463 -> :sswitch_15
        0x12466 -> :sswitch_14
        0x2178e7 -> :sswitch_13
        0x2178ea -> :sswitch_12
        0x217944 -> :sswitch_11
        0x217947 -> :sswitch_10
        0x21794a -> :sswitch_f
        0x2179a1 -> :sswitch_e
        0x2179a4 -> :sswitch_d
        0x2179a7 -> :sswitch_c
        0x234a63 -> :sswitch_b
        0x234a66 -> :sswitch_a
        0x234ac0 -> :sswitch_9
        0x234ac3 -> :sswitch_8
        0x234ac6 -> :sswitch_7
        0x234b1d -> :sswitch_6
        0x234b20 -> :sswitch_5
        0x234b23 -> :sswitch_4
    .end sparse-switch

    .line 1964
    .line 1965
    .line 1966
    .line 1967
    .line 1968
    .line 1969
    .line 1970
    .line 1971
    .line 1972
    .line 1973
    .line 1974
    .line 1975
    .line 1976
    .line 1977
    .line 1978
    .line 1979
    .line 1980
    .line 1981
    .line 1982
    .line 1983
    .line 1984
    .line 1985
    .line 1986
    .line 1987
    .line 1988
    .line 1989
    .line 1990
    .line 1991
    .line 1992
    .line 1993
    .line 1994
    .line 1995
    .line 1996
    .line 1997
    .line 1998
    .line 1999
    .line 2000
    .line 2001
    .line 2002
    .line 2003
    .line 2004
    .line 2005
    .line 2006
    .line 2007
    .line 2008
    .line 2009
    .line 2010
    .line 2011
    .line 2012
    .line 2013
    .line 2014
    .line 2015
    .line 2016
    .line 2017
    .line 2018
    .line 2019
    .line 2020
    .line 2021
    .line 2022
    .line 2023
    .line 2024
    .line 2025
    .line 2026
    .line 2027
    .line 2028
    .line 2029
    .line 2030
    .line 2031
    .line 2032
    .line 2033
    .line 2034
    .line 2035
    .line 2036
    .line 2037
    .line 2038
    .line 2039
    .line 2040
    .line 2041
    .line 2042
    .line 2043
    .line 2044
    .line 2045
    .line 2046
    .line 2047
    .line 2048
    .line 2049
    .line 2050
    .line 2051
    .line 2052
    .line 2053
    .line 2054
    .line 2055
    .line 2056
    .line 2057
    .line 2058
    .line 2059
    .line 2060
    .line 2061
    .line 2062
    .line 2063
    .line 2064
    .line 2065
    .line 2066
    .line 2067
    .line 2068
    .line 2069
    :pswitch_data_5
    .packed-switch 0xa
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2f
    .end packed-switch

    .line 2070
    .line 2071
    .line 2072
    .line 2073
    .line 2074
    .line 2075
    .line 2076
    .line 2077
    .line 2078
    .line 2079
    .line 2080
    .line 2081
    :pswitch_data_6
    .packed-switch 0x14
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
    .end packed-switch

    .line 2082
    .line 2083
    .line 2084
    .line 2085
    .line 2086
    .line 2087
    .line 2088
    .line 2089
    .line 2090
    .line 2091
    :pswitch_data_7
    .packed-switch 0x1e
        :pswitch_28
        :pswitch_27
        :pswitch_26
    .end packed-switch

    .line 2092
    .line 2093
    .line 2094
    .line 2095
    .line 2096
    .line 2097
    .line 2098
    .line 2099
    .line 2100
    .line 2101
    :pswitch_data_8
    .packed-switch 0x28
        :pswitch_25
        :pswitch_24
        :pswitch_23
    .end packed-switch

    .line 2102
    .line 2103
    .line 2104
    .line 2105
    .line 2106
    .line 2107
    .line 2108
    .line 2109
    .line 2110
    .line 2111
    :pswitch_data_9
    .packed-switch 0x32
        :pswitch_22
        :pswitch_21
        :pswitch_20
    .end packed-switch

    .line 2112
    .line 2113
    .line 2114
    .line 2115
    .line 2116
    .line 2117
    .line 2118
    .line 2119
    .line 2120
    .line 2121
    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_47
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
    .end packed-switch
.end method

.method public static b()Ll/hwy0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    const-string v0, "audio/raw"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1, v1}, Ll/oxy0;->e(Ljava/lang/String;ZZ)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/hwy0;

    .line 21
    .line 22
    return-object v0
.end method

.method public static c(Ll/sqr0;)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "audio/eac3-joc"

    .line 2
    .line 3
    iget-object v1, p0, Ll/sqr0;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "audio/eac3"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/sqr0;->l:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "video/dolby-vision"

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-static {p0}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const/16 v0, 0x10

    .line 39
    .line 40
    if-eq p0, v0, :cond_2

    .line 41
    .line 42
    const/16 v0, 0x100

    .line 43
    .line 44
    if-ne p0, v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/16 v0, 0x200

    .line 48
    .line 49
    if-ne p0, v0, :cond_3

    .line 50
    .line 51
    const-string p0, "video/avc"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    :goto_0
    const-string p0, "video/hevc"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public static d(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/oxy0;->c(Ll/sqr0;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p0, p2, p3}, Ll/oxy0;->e(Ljava/lang/String;ZZ)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static declared-synchronized e(Ljava/lang/String;ZZ)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "MediaCodecList API didn\'t list secure decoder for: "

    .line 8
    .line 9
    const-class v4, Ll/oxy0;

    .line 10
    .line 11
    monitor-enter v4

    .line 12
    :try_start_0
    new-instance v5, Ll/hxy0;

    .line 13
    .line 14
    invoke-direct {v5, v0, v1, v2}, Ll/hxy0;-><init>(Ljava/lang/String;ZZ)V

    .line 15
    .line 16
    .line 17
    sget-object v6, Ll/oxy0;->b:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    check-cast v7, Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    if-eqz v7, :cond_0

    .line 26
    .line 27
    monitor-exit v4

    .line 28
    return-object v7

    .line 29
    :cond_0
    :try_start_1
    sget v7, Ll/mpw0;->a:I

    .line 30
    .line 31
    new-instance v7, Ll/mxy0;

    .line 32
    .line 33
    invoke-direct {v7, v1, v2}, Ll/mxy0;-><init>(ZZ)V

    .line 34
    .line 35
    .line 36
    invoke-static {v5, v7}, Ll/oxy0;->h(Ll/hxy0;Ll/jxy0;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v7, 0x0

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    sget v1, Ll/mpw0;->a:I

    .line 50
    .line 51
    const/16 v8, 0x17

    .line 52
    .line 53
    if-gt v1, v8, :cond_1

    .line 54
    .line 55
    new-instance v1, Ll/lxy0;

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-direct {v1, v2}, Ll/lxy0;-><init>(Ll/kxy0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v5, v1}, Ll/oxy0;->h(Ll/hxy0;Ll/jxy0;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ll/hwy0;

    .line 76
    .line 77
    iget-object v1, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 78
    .line 79
    new-instance v8, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, ". Assuming: "

    .line 88
    .line 89
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v3, "MediaCodecUtil"

    .line 100
    .line 101
    invoke-static {v3, v1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :catchall_0
    move-exception v0

    .line 106
    goto/16 :goto_1

    .line 107
    .line 108
    :cond_1
    :goto_0
    const-string v1, "audio/raw"

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    const/4 v1, 0x1

    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    sget v0, Ll/mpw0;->a:I

    .line 118
    .line 119
    const/16 v3, 0x1a

    .line 120
    .line 121
    if-ge v0, v3, :cond_2

    .line 122
    .line 123
    sget-object v0, Ll/mpw0;->b:Ljava/lang/String;

    .line 124
    .line 125
    const-string v3, "R9"

    .line 126
    .line 127
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-ne v0, v1, :cond_2

    .line 138
    .line 139
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Ll/hwy0;

    .line 144
    .line 145
    iget-object v0, v0, Ll/hwy0;->a:Ljava/lang/String;

    .line 146
    .line 147
    const-string v3, "OMX.MTK.AUDIO.DECODER.RAW"

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_2

    .line 154
    .line 155
    const-string v8, "OMX.google.raw.decoder"

    .line 156
    .line 157
    const-string v9, "audio/raw"

    .line 158
    .line 159
    const-string v10, "audio/raw"

    .line 160
    .line 161
    const/4 v15, 0x0

    .line 162
    const/16 v16, 0x0

    .line 163
    .line 164
    const/4 v11, 0x0

    .line 165
    const/4 v12, 0x0

    .line 166
    const/4 v13, 0x1

    .line 167
    const/4 v14, 0x0

    .line 168
    invoke-static/range {v8 .. v16}, Ll/hwy0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZ)Ll/hwy0;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    :cond_2
    sget-object v0, Ll/fxy0;->a:Ll/fxy0;

    .line 176
    .line 177
    invoke-static {v2, v0}, Ll/oxy0;->i(Ljava/util/List;Ll/nxy0;)V

    .line 178
    .line 179
    .line 180
    :cond_3
    sget v0, Ll/mpw0;->a:I

    .line 181
    .line 182
    const/16 v3, 0x20

    .line 183
    .line 184
    if-ge v0, v3, :cond_4

    .line 185
    .line 186
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-le v0, v1, :cond_4

    .line 191
    .line 192
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Ll/hwy0;

    .line 197
    .line 198
    iget-object v0, v0, Ll/hwy0;->a:Ljava/lang/String;

    .line 199
    .line 200
    const-string v1, "OMX.qti.audio.decoder.flac"

    .line 201
    .line 202
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_4

    .line 207
    .line 208
    invoke-interface {v2, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Ll/hwy0;

    .line 213
    .line 214
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    :cond_4
    invoke-static {v2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzj(Ljava/util/Collection;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v6, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 222
    .line 223
    .line 224
    monitor-exit v4

    .line 225
    return-object v0

    .line 226
    :goto_1
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 227
    throw v0
.end method

.method public static f(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "#2.sampleMimeType"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p2, p3}, Ll/oxy0;->e(Ljava/lang/String;ZZ)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, p2, p3}, Ll/oxy0;->d(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/mqw0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/mqw0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/mqw0;->i(Ljava/lang/Iterable;)Ll/mqw0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/mqw0;->i(Ljava/lang/Iterable;)Ll/mqw0;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static g(Ljava/util/List;Ll/sqr0;)Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/gxy0;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/gxy0;-><init>(Ll/sqr0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/oxy0;->i(Ljava/util/List;Ll/nxy0;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static h(Ll/hxy0;Ll/jxy0;)Ljava/util/ArrayList;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v3, "secure-playback"

    .line 6
    .line 7
    const-string v4, "tunneled-playback"

    .line 8
    .line 9
    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v8, v1, Ll/hxy0;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v2}, Ll/jxy0;->zza()I

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    invoke-interface {v2}, Ll/jxy0;->zze()Z

    .line 21
    .line 22
    .line 23
    move-result v16

    .line 24
    const/16 v17, 0x0

    .line 25
    .line 26
    move/from16 v9, v17

    .line 27
    .line 28
    :goto_0
    if-ge v9, v7, :cond_1a

    .line 29
    .line 30
    invoke-interface {v2, v9}, Ll/jxy0;->e(I)Landroid/media/MediaCodecInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v10, Ll/mpw0;->a:I

    .line 35
    .line 36
    const/16 v11, 0x1d

    .line 37
    .line 38
    if-lt v10, v11, :cond_0

    .line 39
    .line 40
    invoke-static {v0}, Ll/qrx;->a(Landroid/media/MediaCodecInfo;)Z

    .line 41
    .line 42
    .line 43
    move-result v12

    .line 44
    if-eqz v12, :cond_0

    .line 45
    .line 46
    move/from16 v20, v7

    .line 47
    .line 48
    move v5, v9

    .line 49
    goto/16 :goto_f

    .line 50
    .line 51
    :cond_0
    move v12, v7

    .line 52
    goto :goto_1

    .line 53
    :catch_0
    move-exception v0

    .line 54
    goto/16 :goto_11

    .line 55
    .line 56
    :goto_1
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 61
    .line 62
    .line 63
    move-result v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    if-nez v13, :cond_1

    .line 65
    .line 66
    const-string v13, ".secure"

    .line 67
    .line 68
    if-nez v16, :cond_2

    .line 69
    .line 70
    :try_start_1
    invoke-virtual {v7, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v14

    .line 74
    if-nez v14, :cond_1

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_1
    :goto_2
    move v5, v9

    .line 78
    move/from16 v20, v12

    .line 79
    .line 80
    goto/16 :goto_f

    .line 81
    .line 82
    :cond_2
    :goto_3
    const/16 v14, 0x18

    .line 83
    .line 84
    if-ge v10, v14, :cond_4

    .line 85
    .line 86
    const-string v14, "OMX.SEC.aac.dec"

    .line 87
    .line 88
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v14

    .line 92
    if-nez v14, :cond_3

    .line 93
    .line 94
    const-string v14, "OMX.Exynos.AAC.Decoder"

    .line 95
    .line 96
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    if-eqz v14, :cond_4

    .line 101
    .line 102
    :cond_3
    const-string v14, "samsung"

    .line 103
    .line 104
    sget-object v15, Ll/mpw0;->c:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v14

    .line 110
    if-eqz v14, :cond_4

    .line 111
    .line 112
    sget-object v14, Ll/mpw0;->b:Ljava/lang/String;

    .line 113
    .line 114
    const-string v15, "zeroflte"

    .line 115
    .line 116
    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v15

    .line 120
    if-nez v15, :cond_1

    .line 121
    .line 122
    const-string v15, "zerolte"

    .line 123
    .line 124
    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v15

    .line 128
    if-nez v15, :cond_1

    .line 129
    .line 130
    const-string v15, "zenlte"

    .line 131
    .line 132
    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v15

    .line 136
    if-nez v15, :cond_1

    .line 137
    .line 138
    const-string v15, "SC-05G"

    .line 139
    .line 140
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v15

    .line 144
    if-nez v15, :cond_1

    .line 145
    .line 146
    const-string v15, "marinelteatt"

    .line 147
    .line 148
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v15

    .line 152
    if-nez v15, :cond_1

    .line 153
    .line 154
    const-string v15, "404SC"

    .line 155
    .line 156
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v15

    .line 160
    if-nez v15, :cond_1

    .line 161
    .line 162
    const-string v15, "SC-04G"

    .line 163
    .line 164
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v15

    .line 168
    if-nez v15, :cond_1

    .line 169
    .line 170
    const-string v15, "SCV31"

    .line 171
    .line 172
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    if-nez v14, :cond_1

    .line 177
    .line 178
    :cond_4
    const/16 v14, 0x17

    .line 179
    .line 180
    if-gt v10, v14, :cond_5

    .line 181
    .line 182
    const-string v10, "audio/eac3-joc"

    .line 183
    .line 184
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v10

    .line 188
    if-eqz v10, :cond_5

    .line 189
    .line 190
    const-string v10, "OMX.MTK.AUDIO.DECODER.DSPAC3"

    .line 191
    .line 192
    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v10

    .line 196
    if-nez v10, :cond_1

    .line 197
    .line 198
    :cond_5
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v10

    .line 202
    array-length v15, v10

    .line 203
    move/from16 v14, v17

    .line 204
    .line 205
    :goto_4
    if-ge v14, v15, :cond_7

    .line 206
    .line 207
    aget-object v5, v10, v14

    .line 208
    .line 209
    invoke-virtual {v5, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v18

    .line 213
    if-eqz v18, :cond_6

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_6
    add-int/lit8 v14, v14, 0x1

    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_7
    const-string v5, "video/dolby-vision"

    .line 220
    .line 221
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    if-eqz v5, :cond_b

    .line 226
    .line 227
    const-string v5, "OMX.MS.HEVCDV.Decoder"

    .line 228
    .line 229
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    if-eqz v5, :cond_8

    .line 234
    .line 235
    const-string v5, "video/hevcdv"

    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_8
    const-string v5, "OMX.RTK.video.decoder"

    .line 239
    .line 240
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    if-nez v5, :cond_a

    .line 245
    .line 246
    const-string v5, "OMX.realtek.video.decoder.tunneled"

    .line 247
    .line 248
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    if-eqz v5, :cond_9

    .line 253
    .line 254
    goto :goto_5

    .line 255
    :cond_9
    const/4 v5, 0x0

    .line 256
    goto :goto_6

    .line 257
    :cond_a
    :goto_5
    const-string v5, "video/dv_hevc"

    .line 258
    .line 259
    goto :goto_6

    .line 260
    :cond_b
    const-string v5, "audio/alac"

    .line 261
    .line 262
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    if-eqz v5, :cond_c

    .line 267
    .line 268
    const-string v5, "OMX.lge.alac.decoder"

    .line 269
    .line 270
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v5

    .line 274
    if-eqz v5, :cond_c

    .line 275
    .line 276
    const-string v5, "audio/x-lg-alac"

    .line 277
    .line 278
    goto :goto_6

    .line 279
    :cond_c
    const-string v5, "audio/flac"

    .line 280
    .line 281
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v5

    .line 285
    if-eqz v5, :cond_d

    .line 286
    .line 287
    const-string v5, "OMX.lge.flac.decoder"

    .line 288
    .line 289
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v5

    .line 293
    if-eqz v5, :cond_d

    .line 294
    .line 295
    const-string v5, "audio/x-lg-flac"

    .line 296
    .line 297
    goto :goto_6

    .line 298
    :cond_d
    const-string v5, "audio/ac3"

    .line 299
    .line 300
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v5

    .line 304
    if-eqz v5, :cond_9

    .line 305
    .line 306
    const-string v5, "OMX.lge.ac3.decoder"

    .line 307
    .line 308
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result v5

    .line 312
    if-eqz v5, :cond_9

    .line 313
    .line 314
    const-string v5, "audio/lg-ac3"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 315
    .line 316
    :goto_6
    if-eqz v5, :cond_1

    .line 317
    .line 318
    :try_start_2
    invoke-virtual {v0, v5}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 319
    .line 320
    .line 321
    move-result-object v10

    .line 322
    invoke-interface {v2, v4, v5, v10}, Ll/jxy0;->a(Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    .line 323
    .line 324
    .line 325
    move-result v14

    .line 326
    invoke-interface {v2, v4, v5, v10}, Ll/jxy0;->b(Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    .line 327
    .line 328
    .line 329
    move-result v15

    .line 330
    iget-boolean v11, v1, Ll/hxy0;->c:Z

    .line 331
    .line 332
    if-nez v11, :cond_e

    .line 333
    .line 334
    if-nez v15, :cond_1

    .line 335
    .line 336
    goto :goto_7

    .line 337
    :cond_e
    if-nez v14, :cond_f

    .line 338
    .line 339
    goto/16 :goto_2

    .line 340
    .line 341
    :cond_f
    :goto_7
    invoke-interface {v2, v3, v5, v10}, Ll/jxy0;->a(Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    .line 342
    .line 343
    .line 344
    move-result v11

    .line 345
    invoke-interface {v2, v3, v5, v10}, Ll/jxy0;->b(Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z

    .line 346
    .line 347
    .line 348
    move-result v14

    .line 349
    iget-boolean v15, v1, Ll/hxy0;->b:Z

    .line 350
    .line 351
    const/16 v19, 0x1

    .line 352
    .line 353
    if-nez v15, :cond_10

    .line 354
    .line 355
    if-nez v14, :cond_1

    .line 356
    .line 357
    goto :goto_8

    .line 358
    :cond_10
    if-eqz v11, :cond_1

    .line 359
    .line 360
    move/from16 v11, v19

    .line 361
    .line 362
    :goto_8
    sget v14, Ll/mpw0;->a:I

    .line 363
    .line 364
    const/16 v15, 0x1d

    .line 365
    .line 366
    if-lt v14, v15, :cond_11

    .line 367
    .line 368
    invoke-static {v0}, Ll/prx;->a(Landroid/media/MediaCodecInfo;)Z

    .line 369
    .line 370
    .line 371
    move-result v15

    .line 372
    move/from16 v20, v12

    .line 373
    .line 374
    goto :goto_a

    .line 375
    :catch_1
    move-exception v0

    .line 376
    move v1, v9

    .line 377
    move-object v9, v5

    .line 378
    move v5, v1

    .line 379
    move-object/from16 v22, v7

    .line 380
    .line 381
    move/from16 v20, v12

    .line 382
    .line 383
    :goto_9
    const/16 v1, 0x17

    .line 384
    .line 385
    goto/16 :goto_e

    .line 386
    .line 387
    :cond_11
    invoke-static {v0, v8}, Ll/oxy0;->j(Landroid/media/MediaCodecInfo;Ljava/lang/String;)Z

    .line 388
    .line 389
    .line 390
    move-result v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 391
    move/from16 v20, v12

    .line 392
    .line 393
    if-nez v15, :cond_12

    .line 394
    .line 395
    move/from16 v15, v19

    .line 396
    .line 397
    goto :goto_a

    .line 398
    :cond_12
    move/from16 v15, v17

    .line 399
    .line 400
    :goto_a
    :try_start_3
    invoke-static {v0, v8}, Ll/oxy0;->j(Landroid/media/MediaCodecInfo;Ljava/lang/String;)Z

    .line 401
    .line 402
    .line 403
    move-result v12

    .line 404
    move-object/from16 v21, v0

    .line 405
    .line 406
    const/16 v0, 0x1d

    .line 407
    .line 408
    if-lt v14, v0, :cond_13

    .line 409
    .line 410
    invoke-static/range {v21 .. v21}, Ll/orx;->a(Landroid/media/MediaCodecInfo;)Z

    .line 411
    .line 412
    .line 413
    move-result v19

    .line 414
    goto :goto_b

    .line 415
    :catch_2
    move-exception v0

    .line 416
    move v1, v9

    .line 417
    move-object v9, v5

    .line 418
    move v5, v1

    .line 419
    move-object/from16 v22, v7

    .line 420
    .line 421
    goto :goto_9

    .line 422
    :cond_13
    invoke-virtual/range {v21 .. v21}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-static {v0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    const-string v14, "omx.google."

    .line 431
    .line 432
    invoke-virtual {v0, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 433
    .line 434
    .line 435
    move-result v14

    .line 436
    if-nez v14, :cond_14

    .line 437
    .line 438
    const-string v14, "c2.android."

    .line 439
    .line 440
    invoke-virtual {v0, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 441
    .line 442
    .line 443
    move-result v14

    .line 444
    if-nez v14, :cond_14

    .line 445
    .line 446
    const-string v14, "c2.google."

    .line 447
    .line 448
    invoke-virtual {v0, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    if-nez v0, :cond_14

    .line 453
    .line 454
    goto :goto_b

    .line 455
    :cond_14
    move/from16 v19, v17

    .line 456
    .line 457
    :goto_b
    if-eqz v16, :cond_15

    .line 458
    .line 459
    iget-boolean v0, v1, Ll/hxy0;->b:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 460
    .line 461
    if-eq v0, v11, :cond_16

    .line 462
    .line 463
    :cond_15
    if-nez v16, :cond_17

    .line 464
    .line 465
    :try_start_4
    iget-boolean v0, v1, Ll/hxy0;->b:Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 466
    .line 467
    if-nez v0, :cond_17

    .line 468
    .line 469
    :cond_16
    const/4 v14, 0x0

    .line 470
    move v11, v15

    .line 471
    const/4 v15, 0x0

    .line 472
    move v1, v9

    .line 473
    move-object v9, v5

    .line 474
    move v5, v1

    .line 475
    move/from16 v13, v19

    .line 476
    .line 477
    const/16 v1, 0x17

    .line 478
    .line 479
    :try_start_5
    invoke-static/range {v7 .. v15}, Ll/hwy0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZ)Ll/hwy0;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 484
    .line 485
    .line 486
    goto/16 :goto_f

    .line 487
    .line 488
    :catch_3
    move-exception v0

    .line 489
    :goto_c
    move-object/from16 v22, v7

    .line 490
    .line 491
    goto :goto_e

    .line 492
    :cond_17
    move v0, v9

    .line 493
    move-object v9, v5

    .line 494
    move v5, v0

    .line 495
    move/from16 v0, v19

    .line 496
    .line 497
    const/16 v1, 0x17

    .line 498
    .line 499
    move/from16 v19, v11

    .line 500
    .line 501
    move v11, v15

    .line 502
    goto :goto_d

    .line 503
    :catch_4
    move-exception v0

    .line 504
    move v1, v9

    .line 505
    move-object v9, v5

    .line 506
    move v5, v1

    .line 507
    const/16 v1, 0x17

    .line 508
    .line 509
    goto :goto_c

    .line 510
    :goto_d
    if-nez v16, :cond_19

    .line 511
    .line 512
    if-eqz v19, :cond_19

    .line 513
    .line 514
    new-instance v14, Ljava/lang/StringBuilder;

    .line 515
    .line 516
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 517
    .line 518
    .line 519
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    .line 521
    .line 522
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v13
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 529
    const/4 v14, 0x0

    .line 530
    const/4 v15, 0x1

    .line 531
    move-object/from16 v22, v7

    .line 532
    .line 533
    move-object v7, v13

    .line 534
    move v13, v0

    .line 535
    :try_start_6
    invoke-static/range {v7 .. v15}, Ll/hwy0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;ZZZZZ)Ll/hwy0;

    .line 536
    .line 537
    .line 538
    move-result-object v0

    .line 539
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 540
    .line 541
    .line 542
    goto :goto_10

    .line 543
    :catch_5
    move-exception v0

    .line 544
    :goto_e
    :try_start_7
    sget v7, Ll/mpw0;->a:I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 545
    .line 546
    const-string v10, "MediaCodecUtil"

    .line 547
    .line 548
    if-gt v7, v1, :cond_18

    .line 549
    .line 550
    :try_start_8
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 551
    .line 552
    .line 553
    move-result v1

    .line 554
    if-nez v1, :cond_18

    .line 555
    .line 556
    new-instance v0, Ljava/lang/StringBuilder;

    .line 557
    .line 558
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 559
    .line 560
    .line 561
    const-string v1, "Skipping codec "

    .line 562
    .line 563
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    move-object/from16 v7, v22

    .line 567
    .line 568
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    const-string v1, " (failed to query capabilities)"

    .line 572
    .line 573
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    invoke-static {v10, v0}, Ll/y4w0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    goto :goto_f

    .line 584
    :cond_18
    move-object/from16 v7, v22

    .line 585
    .line 586
    new-instance v1, Ljava/lang/StringBuilder;

    .line 587
    .line 588
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 589
    .line 590
    .line 591
    const-string v2, "Failed to query codec "

    .line 592
    .line 593
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    const-string v2, " ("

    .line 600
    .line 601
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    .line 606
    .line 607
    const-string v2, ")"

    .line 608
    .line 609
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v1

    .line 616
    invoke-static {v10, v1}, Ll/y4w0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 620
    :cond_19
    :goto_f
    add-int/lit8 v9, v5, 0x1

    .line 621
    .line 622
    move-object/from16 v1, p0

    .line 623
    .line 624
    move/from16 v7, v20

    .line 625
    .line 626
    goto/16 :goto_0

    .line 627
    .line 628
    :cond_1a
    :goto_10
    return-object v6

    .line 629
    :goto_11
    new-instance v1, Lcom/google/android/gms/internal/ads/zzth;

    .line 630
    .line 631
    const/4 v2, 0x0

    .line 632
    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/ads/zzth;-><init>(Ljava/lang/Throwable;Ll/ixy0;)V

    .line 633
    .line 634
    .line 635
    throw v1
.end method

.method public static i(Ljava/util/List;Ll/nxy0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/exy0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/exy0;-><init>(Ll/nxy0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static j(Landroid/media/MediaCodecInfo;Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyk;->a(Landroid/media/MediaCodecInfo;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {p1}, Ll/a8t0;->g(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "arc."

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    const-string p1, "omx.google."

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_6

    .line 45
    .line 46
    const-string p1, "omx.ffmpeg."

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_6

    .line 53
    .line 54
    const-string p1, "omx.sec."

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    const-string p1, ".sw."

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    return v0

    .line 72
    :cond_4
    :goto_0
    const-string p1, "omx.qcom.video.decoder.hevcswvdec"

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_6

    .line 79
    .line 80
    const-string p1, "c2.android."

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_6

    .line 87
    .line 88
    const-string p1, "c2.google."

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_6

    .line 95
    .line 96
    const-string p1, "omx."

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_5

    .line 103
    .line 104
    const-string p1, "c2."

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_5

    .line 111
    .line 112
    return v0

    .line 113
    :cond_5
    return v1

    .line 114
    :cond_6
    return v0
.end method
