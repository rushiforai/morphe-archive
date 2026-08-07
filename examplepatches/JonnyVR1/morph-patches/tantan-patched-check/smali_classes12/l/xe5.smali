.class public Ll/xe5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xe5$b;,
        Ll/xe5$i;,
        Ll/xe5$j;,
        Ll/xe5$h;,
        Ll/xe5$d;,
        Ll/xe5$g;,
        Ll/xe5$f;,
        Ll/xe5$e;,
        Ll/xe5$c;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;

.field private static volatile b:Ljava/lang/String;

.field private static final c:Ljava/lang/Object;

.field private static final d:Ljava/io/FileFilter;

.field private static e:Z

.field private static f:D

.field private static g:D

.field private static final h:[Ljava/lang/String;

.field private static final i:[Ljava/lang/String;

.field private static final j:Ljava/util/regex/Pattern;

.field private static volatile k:Landroid/net/LocalServerSocket;

.field public static final l:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 28

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    sput-object v1, Ll/xe5;->b:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v1, Ll/xe5;->c:Ljava/lang/Object;

    .line 23
    .line 24
    new-instance v1, Ll/we5;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/we5;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object v1, Ll/xe5;->d:Ljava/io/FileFilter;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    sput-boolean v1, Ll/xe5;->e:Z

    .line 33
    .line 34
    const-wide/16 v1, 0x0

    .line 35
    .line 36
    sput-wide v1, Ll/xe5;->f:D

    .line 37
    .line 38
    sput-wide v1, Ll/xe5;->g:D

    .line 39
    .line 40
    const/16 v1, 0xa

    .line 41
    .line 42
    new-array v1, v1, [B

    .line 43
    .line 44
    fill-array-data v1, :array_1

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v2, 0x4

    .line 52
    new-array v3, v2, [B

    .line 53
    .line 54
    fill-array-data v3, :array_2

    .line 55
    .line 56
    .line 57
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    new-array v4, v2, [B

    .line 62
    .line 63
    fill-array-data v4, :array_3

    .line 64
    .line 65
    .line 66
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const/4 v5, 0x6

    .line 71
    new-array v6, v5, [B

    .line 72
    .line 73
    fill-array-data v6, :array_4

    .line 74
    .line 75
    .line 76
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    const/4 v7, 0x3

    .line 81
    new-array v7, v7, [B

    .line 82
    .line 83
    fill-array-data v7, :array_5

    .line 84
    .line 85
    .line 86
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    filled-new-array {v1, v3, v4, v6, v7}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sput-object v1, Ll/xe5;->h:[Ljava/lang/String;

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    new-array v1, v1, [B

    .line 99
    .line 100
    fill-array-data v1, :array_6

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    new-array v3, v2, [B

    .line 108
    .line 109
    fill-array-data v3, :array_7

    .line 110
    .line 111
    .line 112
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    new-array v4, v2, [B

    .line 117
    .line 118
    fill-array-data v4, :array_8

    .line 119
    .line 120
    .line 121
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    new-array v6, v5, [B

    .line 126
    .line 127
    fill-array-data v6, :array_9

    .line 128
    .line 129
    .line 130
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    filled-new-array {v1, v3, v4, v6}, [Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sput-object v1, Ll/xe5;->i:[Ljava/lang/String;

    .line 139
    .line 140
    const/16 v1, 0x1e

    .line 141
    .line 142
    new-array v1, v1, [B

    .line 143
    .line 144
    fill-array-data v1, :array_a

    .line 145
    .line 146
    .line 147
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sput-object v1, Ll/xe5;->j:Ljava/util/regex/Pattern;

    .line 156
    .line 157
    new-array v1, v2, [B

    .line 158
    .line 159
    fill-array-data v1, :array_b

    .line 160
    .line 161
    .line 162
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    const/4 v1, 0x5

    .line 167
    new-array v3, v1, [B

    .line 168
    .line 169
    fill-array-data v3, :array_c

    .line 170
    .line 171
    .line 172
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    new-array v3, v2, [B

    .line 177
    .line 178
    fill-array-data v3, :array_d

    .line 179
    .line 180
    .line 181
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v8

    .line 185
    new-array v3, v1, [B

    .line 186
    .line 187
    fill-array-data v3, :array_e

    .line 188
    .line 189
    .line 190
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v9

    .line 194
    new-array v3, v2, [B

    .line 195
    .line 196
    fill-array-data v3, :array_f

    .line 197
    .line 198
    .line 199
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v10

    .line 203
    new-array v1, v1, [B

    .line 204
    .line 205
    fill-array-data v1, :array_10

    .line 206
    .line 207
    .line 208
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v11

    .line 212
    new-array v1, v5, [B

    .line 213
    .line 214
    fill-array-data v1, :array_11

    .line 215
    .line 216
    .line 217
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v12

    .line 221
    new-array v1, v2, [B

    .line 222
    .line 223
    fill-array-data v1, :array_12

    .line 224
    .line 225
    .line 226
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v13

    .line 230
    new-array v1, v0, [B

    .line 231
    .line 232
    fill-array-data v1, :array_13

    .line 233
    .line 234
    .line 235
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v14

    .line 239
    new-array v1, v2, [B

    .line 240
    .line 241
    fill-array-data v1, :array_14

    .line 242
    .line 243
    .line 244
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v15

    .line 248
    new-array v1, v2, [B

    .line 249
    .line 250
    fill-array-data v1, :array_15

    .line 251
    .line 252
    .line 253
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v16

    .line 257
    new-array v1, v5, [B

    .line 258
    .line 259
    fill-array-data v1, :array_16

    .line 260
    .line 261
    .line 262
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v17

    .line 266
    new-array v0, v0, [B

    .line 267
    .line 268
    fill-array-data v0, :array_17

    .line 269
    .line 270
    .line 271
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v18

    .line 275
    new-array v0, v5, [B

    .line 276
    .line 277
    fill-array-data v0, :array_18

    .line 278
    .line 279
    .line 280
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v19

    .line 284
    new-array v0, v5, [B

    .line 285
    .line 286
    fill-array-data v0, :array_19

    .line 287
    .line 288
    .line 289
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v20

    .line 293
    const/4 v0, 0x7

    .line 294
    new-array v0, v0, [B

    .line 295
    .line 296
    fill-array-data v0, :array_1a

    .line 297
    .line 298
    .line 299
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v21

    .line 303
    new-array v0, v5, [B

    .line 304
    .line 305
    fill-array-data v0, :array_1b

    .line 306
    .line 307
    .line 308
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v22

    .line 312
    new-array v0, v5, [B

    .line 313
    .line 314
    fill-array-data v0, :array_1c

    .line 315
    .line 316
    .line 317
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v23

    .line 321
    new-array v0, v2, [B

    .line 322
    .line 323
    fill-array-data v0, :array_1d

    .line 324
    .line 325
    .line 326
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v24

    .line 330
    new-array v0, v5, [B

    .line 331
    .line 332
    fill-array-data v0, :array_1e

    .line 333
    .line 334
    .line 335
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v25

    .line 339
    new-array v0, v2, [B

    .line 340
    .line 341
    fill-array-data v0, :array_1f

    .line 342
    .line 343
    .line 344
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v26

    .line 348
    const/16 v0, 0x15

    .line 349
    .line 350
    new-array v0, v0, [B

    .line 351
    .line 352
    fill-array-data v0, :array_20

    .line 353
    .line 354
    .line 355
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v27

    .line 359
    filled-new-array/range {v6 .. v27}, [Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    sput-object v0, Ll/xe5;->l:[Ljava/lang/String;

    .line 364
    .line 365
    return-void

    .line 366
    nop

    .line 367
    :array_0
    .array-data 1
        0x7dt
        0x2bt
        0x75t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
    .end array-data

    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    :array_1
    .array-data 1
        0x58t
        0x1ft
        0x41t
        0x52t
        0x13t
        0x10t
        0x59t
        0x15t
        0x5et
        0x45t
    .end array-data

    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    nop

    .line 385
    :array_2
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
    .end array-data

    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    :array_3
    .array-data 1
        0x46t
        0x4t
        0x5et
        0x4ft
    .end array-data

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    :array_4
    .array-data 1
        0x46t
        0xft
        0x43t
        0x43t
        0x8t
        0x9t
    .end array-data

    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    nop

    .line 405
    :array_5
    .array-data 1
        0x5bt
        0x10t
        0x5ct
    .end array-data

    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    :array_6
    .array-data 1
        0x58t
        0x1ft
        0x41t
        0x52t
        0x13t
        0x10t
        0x59t
        0x15t
        0x5et
        0x45t
    .end array-data

    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    nop

    .line 421
    :array_7
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
    .end array-data

    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    :array_8
    .array-data 1
        0x46t
        0x4t
        0x5et
        0x4ft
    .end array-data

    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    :array_9
    .array-data 1
        0x46t
        0xft
        0x43t
        0x43t
        0x8t
        0x9t
    .end array-data

    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    nop

    .line 441
    :array_a
    .array-data 1
        0x6ct
        0x2t
        0x1at
        0xdt
        0x3dt
        0x15t
        0x1at
        0x3at
        0x46t
        0x4ct
        0x59t
        0x1bt
        0xat
        0x4et
        0x6at
        0x7t
        0x4ct
        0x5ft
        0x71t
        0x4bt
        0x6bt
        0x56t
        0x4ct
        0x1ct
        0x6dt
        0x4dt
        0x18t
        0x6bt
        0x12t
        0x4ct
    .end array-data

    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    nop

    .line 461
    :array_b
    .array-data 1
        0x42t
        0x3t
        0x50t
        0x53t
    .end array-data

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    :array_c
    .array-data 1
        0x47t
        0x14t
        0x58t
        0x43t
        0x4t
    .end array-data

    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    nop

    .line 475
    :array_d
    .array-data 1
        0x5ft
        0x16t
        0x54t
        0x59t
    .end array-data

    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    :array_e
    .array-data 1
        0x56t
        0x9t
        0x41t
        0x52t
        0xft
    .end array-data

    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    nop

    .line 489
    :array_f
    .array-data 1
        0x43t
        0x12t
        0x50t
        0x43t
    .end array-data

    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    :array_10
    .array-data 1
        0x5ct
        0x15t
        0x45t
        0x56t
        0x15t
    .end array-data

    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    nop

    .line 503
    :array_11
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
    .end array-data

    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    nop

    .line 511
    :array_12
    .array-data 1
        0x5ct
        0xft
        0x5ft
        0x5ct
    .end array-data

    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    :array_13
    .array-data 1
        0x42t
        0x3t
        0x50t
        0x53t
        0xdt
        0xft
        0x5et
        0xdt
    .end array-data

    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    :array_14
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x53t
    .end array-data

    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    :array_15
    .array-data 1
        0x42t
        0x3t
        0x52t
        0x41t
    .end array-data

    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    :array_16
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x53t
        0x15t
        0x9t
    .end array-data

    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    nop

    .line 545
    :array_17
    .array-data 1
        0x42t
        0x3t
        0x52t
        0x41t
        0x7t
        0x14t
        0x5ft
        0xbt
    .end array-data

    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    :array_18
    .array-data 1
        0x43t
        0x12t
        0x43t
        0x44t
        0x15t
        0x14t
    .end array-data

    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    nop

    .line 561
    :array_19
    .array-data 1
        0x43t
        0x12t
        0x43t
        0x54t
        0xct
        0x16t
    .end array-data

    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    nop

    .line 569
    :array_1a
    .array-data 1
        0x43t
        0x12t
        0x43t
        0x59t
        0x2t
        0xbt
        0x40t
    .end array-data

    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    :array_1b
    .array-data 1
        0x43t
        0x12t
        0x43t
        0x54t
        0x0t
        0x12t
    .end array-data

    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    nop

    .line 585
    :array_1c
    .array-data 1
        0x40t
        0x12t
        0x43t
        0x56t
        0x2t
        0x3t
    .end array-data

    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    nop

    .line 593
    :array_1d
    .array-data 1
        0x56t
        0x9t
        0x43t
        0x5ct
    .end array-data

    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    :array_1e
    .array-data 1
        0x55t
        0x1et
        0x54t
        0x54t
        0x17t
        0x3t
    .end array-data

    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    nop

    .line 607
    :array_1f
    .array-data 1
        0x5bt
        0xft
        0x5dt
        0x5bt
    .end array-data

    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    :array_20
    .array-data 1
        0x6ft
        0x39t
        0x42t
        0x4et
        0x12t
        0x12t
        0x55t
        0xbt
        0x6et
        0x47t
        0x13t
        0x9t
        0x40t
        0x3t
        0x43t
        0x43t
        0x18t
        0x39t
        0x57t
        0x3t
        0x45t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x3

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-array p0, v0, [B

    .line 9
    .line 10
    fill-array-data p0, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/16 v1, 0x1d

    .line 19
    .line 20
    new-array v1, v1, [B

    .line 21
    .line 22
    fill-array-data v1, :array_1

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x2

    .line 36
    new-array p0, p0, [B

    .line 37
    .line 38
    fill-array-data p0, :array_2

    .line 39
    .line 40
    .line 41
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    const/16 v1, 0x1a

    .line 47
    .line 48
    new-array v1, v1, [B

    .line 49
    .line 50
    fill-array-data v1, :array_3

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x7

    .line 64
    new-array p0, p0, [B

    .line 65
    .line 66
    fill-array-data p0, :array_4

    .line 67
    .line 68
    .line 69
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_2
    new-array p0, v0, [B

    .line 75
    .line 76
    fill-array-data p0, :array_5

    .line 77
    .line 78
    .line 79
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    nop

    .line 85
    :array_0
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x4t
        0x5ct
        0x13t
        0x54t
        0x43t
        0xet
        0x9t
        0x44t
        0xet
        0x6et
        0x5bt
        0x4t
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    nop

    .line 111
    :array_2
    .array-data 1
        0x4t
        0x4dt
    .end array-data

    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    nop

    .line 117
    :array_3
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x4t
        0x5ct
        0x13t
        0x54t
        0x43t
        0xet
        0x9t
        0x44t
        0xet
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    nop

    .line 135
    :array_4
    .array-data 1
        0x2t
        0x48t
        0x49t
        0x18t
        0x52t
        0x48t
        0x48t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :array_5
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data
.end method

.method public static A0(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0xd

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :array_0
    .array-data 1
        0x5dt
        0x9t
        0x52t
        0x5ct
        0x3et
        0xat
        0x5ft
        0x5t
        0x50t
        0x43t
        0x8t
        0x9t
        0x5et
    .end array-data
.end method

.method public static B()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sub-long/2addr v0, v2

    .line 10
    return-wide v0
.end method

.method private static B0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    new-array v0, v0, [B

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    :array_0
    .array-data 1
        0x6ct
        0x2t
        0x1at
    .end array-data
.end method

.method public static C(Landroid/content/Context;)I
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x11

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p0
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return p0

    .line 21
    :catch_0
    const/4 p0, -0x1

    .line 22
    return p0

    :array_0
    .array-data 1
        0x43t
        0x5t
        0x43t
        0x52t
        0x4t
        0x8t
        0x6ft
        0x4t
        0x43t
        0x5et
        0x6t
        0xet
        0x44t
        0x8t
        0x54t
        0x44t
        0x12t
    .end array-data
.end method

.method public static C0(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    return v0

    .line 12
    :cond_1
    const/16 v1, 0x80

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :catch_0
    return v0
.end method

.method public static D()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    :try_start_0
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    array-length v2, v1

    .line 26
    const/4 v3, 0x0

    .line 27
    :goto_0
    if-ge v3, v2, :cond_1

    .line 28
    .line 29
    aget-object v4, v1, v3

    .line 30
    .line 31
    const/4 v5, 0x1

    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 40
    .line 41
    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const/16 v6, 0x7f

    .line 46
    .line 47
    new-array v6, v6, [B

    .line 48
    .line 49
    fill-array-data v6, :array_1

    .line 50
    .line 51
    .line 52
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual {v6, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-eqz v6, :cond_0

    .line 61
    .line 62
    const/4 v6, 0x0

    .line 63
    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    if-eqz v4, :cond_0

    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catch_0
    move-exception v1

    .line 78
    goto :goto_2

    .line 79
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    const/4 v1, 0x7

    .line 83
    new-array v1, v1, [B

    .line 84
    .line 85
    fill-array-data v1, :array_2

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 93
    .line 94
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    const/4 v1, 0x3

    .line 98
    new-array v1, v1, [B

    .line 99
    .line 100
    fill-array-data v1, :array_3

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 108
    .line 109
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return-object v0

    .line 117
    :goto_2
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 118
    .line 119
    const/16 v3, 0x14

    .line 120
    .line 121
    new-array v3, v3, [B

    .line 122
    .line 123
    fill-array-data v3, :array_4

    .line 124
    .line 125
    .line 126
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    nop

    .line 135
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x5et
        0x44t
        0x4ft
        0x24t
        0x45t
        0xft
        0x5dt
        0x53t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_1
    .array-data 1
        0x58t
        0x9t
        0x42t
        0x43t
        0x4dt
        0x46t
        0x45t
        0x15t
        0x54t
        0x45t
        0x4dt
        0x46t
        0x52t
        0x9t
        0x50t
        0x45t
        0x5t
        0x4at
        0x10t
        0x2t
        0x54t
        0x41t
        0x8t
        0x5t
        0x55t
        0x4at
        0x11t
        0x5ft
        0x0t
        0x14t
        0x54t
        0x11t
        0x50t
        0x45t
        0x4t
        0x4at
        0x10t
        0xbt
        0x5et
        0x53t
        0x4t
        0xat
        0x1ct
        0x46t
        0x42t
        0x52t
        0x13t
        0xft
        0x51t
        0xat
        0x1dt
        0x17t
        0x3t
        0x7t
        0x5et
        0x2t
        0x1dt
        0x17t
        0x3t
        0x14t
        0x51t
        0x8t
        0x55t
        0x1bt
        0x41t
        0x2t
        0x59t
        0x15t
        0x41t
        0x5bt
        0x0t
        0x1ft
        0x1ct
        0x46t
        0x5ct
        0x56t
        0xft
        0x13t
        0x56t
        0x7t
        0x52t
        0x43t
        0x14t
        0x14t
        0x55t
        0x14t
        0x1dt
        0x17t
        0x11t
        0x14t
        0x5ft
        0x2t
        0x44t
        0x54t
        0x15t
        0x4at
        0x10t
        0x0t
        0x58t
        0x59t
        0x6t
        0x3t
        0x42t
        0x16t
        0x43t
        0x5et
        0xft
        0x12t
        0x1ct
        0x46t
        0x52t
        0x47t
        0x14t
        0x39t
        0x51t
        0x4t
        0x58t
        0x1bt
        0x41t
        0x5t
        0x40t
        0x13t
        0x6et
        0x56t
        0x3t
        0xft
        0x2t
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    :array_2
    .array-data 1
        0x42t
        0x3t
        0x5dt
        0x52t
        0x0t
        0x15t
        0x55t
    .end array-data

    :array_3
    .array-data 1
        0x43t
        0x2t
        0x5at
    .end array-data

    :array_4
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0x14t
        0xft
        0x5ct
        0x2t
        0x78t
        0x59t
        0x7t
        0x9t
        0xat
        0x46t
    .end array-data
.end method

.method public static D0(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSimState()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data
.end method

.method public static E()I
    .locals 5

    .line 1
    const/16 v0, 0x35

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    .line 14
    .line 15
    new-instance v3, Ljava/io/FileReader;

    .line 16
    .line 17
    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    goto :goto_3

    .line 56
    :catch_1
    move-exception v0

    .line 57
    goto :goto_3

    .line 58
    :goto_1
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    :catchall_1
    move-exception v3

    .line 60
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catchall_2
    move-exception v2

    .line 65
    :try_start_5
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :goto_2
    throw v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 69
    :goto_3
    const/4 v2, 0x3

    .line 70
    new-array v2, v2, [B

    .line 71
    .line 72
    fill-array-data v2, :array_1

    .line 73
    .line 74
    .line 75
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const/16 v4, 0x18

    .line 85
    .line 86
    new-array v4, v4, [B

    .line 87
    .line 88
    fill-array-data v4, :array_2

    .line 89
    .line 90
    .line 91
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    return v1

    .line 109
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x2t
        0x55t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x52t
        0x47t
        0x14t
        0x49t
        0x53t
        0x16t
        0x44t
        0x7t
        0x4et
        0x5t
        0x40t
        0x13t
        0x57t
        0x45t
        0x4t
        0x17t
        0x1ft
        0x5t
        0x41t
        0x42t
        0x8t
        0x8t
        0x56t
        0x9t
        0x6et
        0x5at
        0x0t
        0x1et
        0x6ft
        0x0t
        0x43t
        0x52t
        0x10t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    nop

    .line 141
    :array_1
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_2
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x31t
        0x33t
        0x7dt
        0x7t
        0x49t
        0x71t
        0x13t
        0x3t
        0x41t
        0x2dt
        0x79t
        0x4dt
        0x5bt
        0x46t
    .end array-data
.end method

.method private static E0()Z
    .locals 9

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    const/4 v2, 0x1

    .line 20
    new-array v3, v2, [B

    .line 21
    .line 22
    const/16 v4, 0xa

    .line 23
    .line 24
    aput-byte v4, v3, v1

    .line 25
    .line 26
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v3, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    array-length v4, v0

    .line 40
    move v5, v1

    .line 41
    :goto_0
    if-ge v5, v4, :cond_1

    .line 42
    .line 43
    aget-object v6, v0, v5

    .line 44
    .line 45
    new-instance v7, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/4 v8, 0x3

    .line 54
    new-array v8, v8, [B

    .line 55
    .line 56
    fill-array-data v8, :array_1

    .line 57
    .line 58
    .line 59
    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    new-instance v7, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const/16 v6, 0x9

    .line 82
    .line 83
    new-array v6, v6, [B

    .line 84
    .line 85
    fill-array-data v6, :array_2

    .line 86
    .line 87
    .line 88
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    add-int/lit8 v5, v5, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_3

    .line 114
    .line 115
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/String;

    .line 120
    .line 121
    new-instance v4, Ljava/io/File;

    .line 122
    .line 123
    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_2

    .line 131
    .line 132
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-nez v3, :cond_2

    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/io/File;->canExecute()Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eqz v3, :cond_2

    .line 143
    .line 144
    return v2

    .line 145
    :cond_3
    return v1

    .line 146
    nop

    .line 147
    :array_0
    .array-data 1
        0x60t
        0x27t
        0x65t
        0x7ft
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x44t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    :array_2
    .array-data 1
        0x1ft
        0x2t
        0x50t
        0x52t
        0xct
        0x9t
        0x5et
        0x15t
        0x44t
    .end array-data
.end method

.method public static F()I
    .locals 5

    .line 1
    const/16 v0, 0x35

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    .line 14
    .line 15
    new-instance v3, Ljava/io/FileReader;

    .line 16
    .line 17
    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    goto :goto_3

    .line 56
    :catch_1
    move-exception v0

    .line 57
    goto :goto_3

    .line 58
    :goto_1
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    :catchall_1
    move-exception v3

    .line 60
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catchall_2
    move-exception v2

    .line 65
    :try_start_5
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :goto_2
    throw v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 69
    :goto_3
    const/4 v2, 0x3

    .line 70
    new-array v2, v2, [B

    .line 71
    .line 72
    fill-array-data v2, :array_1

    .line 73
    .line 74
    .line 75
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const/16 v4, 0x18

    .line 85
    .line 86
    new-array v4, v4, [B

    .line 87
    .line 88
    fill-array-data v4, :array_2

    .line 89
    .line 90
    .line 91
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    return v1

    .line 109
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x2t
        0x55t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x52t
        0x47t
        0x14t
        0x49t
        0x53t
        0x16t
        0x44t
        0x7t
        0x4et
        0x5t
        0x40t
        0x13t
        0x57t
        0x45t
        0x4t
        0x17t
        0x1ft
        0x5t
        0x41t
        0x42t
        0x8t
        0x8t
        0x56t
        0x9t
        0x6et
        0x5at
        0x8t
        0x8t
        0x6ft
        0x0t
        0x43t
        0x52t
        0x10t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    nop

    .line 141
    :array_1
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_2
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x31t
        0x33t
        0x7dt
        0xft
        0x5ft
        0x71t
        0x13t
        0x3t
        0x41t
        0x2dt
        0x79t
        0x4dt
        0x5bt
        0x46t
    .end array-data
.end method

.method private static F0()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const/16 v1, 0x19

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    return v0

    .line 22
    nop

    .line 23
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x50t
        0x47t
        0x11t
        0x49t
        0x63t
        0x13t
        0x41t
        0x52t
        0x13t
        0x13t
        0x43t
        0x3t
        0x43t
        0x19t
        0x0t
        0x16t
        0x5bt
    .end array-data
.end method

.method public static G(Landroid/content/Context;)I
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/hardware/camera2/CameraManager;

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    return p0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v1, 0x18

    .line 27
    .line 28
    new-array v1, v1, [B

    .line 29
    .line 30
    fill-array-data v1, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    const/4 p0, -0x1

    .line 41
    return p0

    .line 42
    nop

    .line 43
    :array_0
    .array-data 1
        0x53t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
    .end array-data

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    nop

    .line 51
    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x51t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0x59t
        0x8t
        0x56t
        0x17t
        0x2t
        0x7t
        0x5dt
        0x3t
        0x43t
        0x56t
        0x5bt
        0x46t
    .end array-data
.end method

.method private static declared-synchronized G0(Landroid/telephony/TelephonyManager;Ll/xe5$g;Ll/xe5$d;Ll/xe5$h;Ll/xe5$j;)V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const-class v1, Ll/xe5;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getAllCellInfo()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    move-object v4, v2

    .line 31
    check-cast v4, Landroid/telephony/CellInfo;

    .line 32
    .line 33
    move-object v3, p0

    .line 34
    move-object v5, p1

    .line 35
    move-object v6, p2

    .line 36
    move-object v7, p3

    .line 37
    move-object v8, p4

    .line 38
    invoke-static/range {v3 .. v8}, Ll/xe5;->H0(Landroid/telephony/TelephonyManager;Landroid/telephony/CellInfo;Ll/xe5$g;Ll/xe5$d;Ll/xe5$h;Ll/xe5$j;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    move-object p0, v3

    .line 42
    move-object p1, v5

    .line 43
    move-object p2, v6

    .line 44
    move-object p3, v7

    .line 45
    move-object p4, v8

    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p0, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    monitor-exit v1

    .line 51
    return-void

    .line 52
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0
.end method

.method private static H(Landroid/content/Context;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    :try_start_0
    new-array v1, v1, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/hardware/camera2/CameraManager;

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/xe5;->a:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v1, 0x15

    .line 27
    .line 28
    new-array v1, v1, [B

    .line 29
    .line 30
    fill-array-data v1, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    array-length v2, v1

    .line 48
    const/4 v3, 0x0

    .line 49
    :goto_0
    if-ge v3, v2, :cond_1

    .line 50
    .line 51
    aget-object v4, v1, v3

    .line 52
    .line 53
    new-instance v5, Ll/xe5$e;

    .line 54
    .line 55
    const/4 v6, 0x0

    .line 56
    invoke-direct {v5, v6}, Ll/xe5$e;-><init>(Ll/xe5$a;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v4}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v4, v5}, Ll/xe5;->L0(Landroid/hardware/camera2/CameraCharacteristics;Ll/xe5$e;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v4}, Ll/xe5;->I(Landroid/hardware/camera2/CameraCharacteristics;)I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    iput v6, v5, Ll/xe5$e;->b:I

    .line 71
    .line 72
    invoke-static {v4, v5}, Ll/xe5;->M0(Landroid/hardware/camera2/CameraCharacteristics;Ll/xe5$e;)V

    .line 73
    .line 74
    .line 75
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 76
    .line 77
    invoke-static {v4, v6}, Ll/xe5;->c0(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CameraCharacteristics$Key;)I

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    iput v6, v5, Ll/xe5$e;->d:I

    .line 82
    .line 83
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 84
    .line 85
    invoke-virtual {v4, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    check-cast v6, Landroid/util/Range;

    .line 90
    .line 91
    iput-object v6, v5, Ll/xe5$e;->e:Landroid/util/Range;

    .line 92
    .line 93
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 94
    .line 95
    invoke-static {v4, v6}, Ll/xe5;->c0(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CameraCharacteristics$Key;)I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    iput v6, v5, Ll/xe5$e;->f:I

    .line 100
    .line 101
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AF:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 102
    .line 103
    invoke-static {v4, v6}, Ll/xe5;->c0(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CameraCharacteristics$Key;)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    iput v6, v5, Ll/xe5$e;->g:I

    .line 108
    .line 109
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 110
    .line 111
    invoke-virtual {v4, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    check-cast v4, Landroid/util/SizeF;

    .line 116
    .line 117
    iput-object v4, v5, Ll/xe5$e;->h:Landroid/util/SizeF;

    .line 118
    .line 119
    invoke-virtual {v5}, Ll/xe5$e;->a()Lorg/json/JSONObject;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    .line 125
    .line 126
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_1
    return-object v0

    .line 130
    :goto_1
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 131
    .line 132
    const/16 v2, 0x1f

    .line 133
    .line 134
    new-array v2, v2, [B

    .line 135
    .line 136
    fill-array-data v2, :array_2

    .line 137
    .line 138
    .line 139
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 144
    .line 145
    .line 146
    return-object v0

    .line 147
    :array_0
    .array-data 1
        0x53t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    nop

    .line 155
    :array_1
    .array-data 1
        0x73t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    nop

    .line 171
    :array_2
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x0t
        0xbt
        0x55t
        0x14t
        0x50t
        0x7bt
        0x8t
        0x15t
        0x44t
        0x46t
        0x65t
        0x5ft
        0x13t
        0x9t
        0x47t
        0x7t
        0x53t
        0x5bt
        0x4t
        0x5ct
        0x10t
    .end array-data
.end method

.method private static declared-synchronized H0(Landroid/telephony/TelephonyManager;Landroid/telephony/CellInfo;Ll/xe5$g;Ll/xe5$d;Ll/xe5$h;Ll/xe5$j;)V
    .locals 2

    .line 1
    const-class v0, Ll/xe5;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    .line 5
    .line 6
    .line 7
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_1
    instance-of p0, p1, Landroid/telephony/CellInfoGsm;

    .line 13
    .line 14
    const v1, 0x7fffffff

    .line 15
    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    move-object p0, p1

    .line 20
    check-cast p0, Landroid/telephony/CellInfoGsm;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/telephony/CellInfoGsm;->getCellIdentity()Landroid/telephony/CellIdentityGsm;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getMcc()I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    iput p3, p2, Ll/xe5$g;->b:I

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getMnc()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    iput p3, p2, Ll/xe5$g;->a:I

    .line 37
    .line 38
    iget p4, p2, Ll/xe5$g;->b:I

    .line 39
    .line 40
    if-eq p4, v1, :cond_5

    .line 41
    .line 42
    if-eq p3, v1, :cond_5

    .line 43
    .line 44
    check-cast p1, Landroid/telephony/CellInfoGsm;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/telephony/CellInfoGsm;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthGsm;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getLac()I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    iput p3, p2, Ll/xe5$g;->c:I

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getCid()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    iput p3, p2, Ll/xe5$g;->d:I

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getArfcn()I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    iput p3, p2, Ll/xe5$g;->e:I

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/telephony/CellIdentityGsm;->getBsic()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    iput p0, p2, Ll/xe5$g;->g:I

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthGsm;->getDbm()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    iput p0, p2, Ll/xe5$g;->f:I

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :catchall_0
    move-exception p0

    .line 83
    goto/16 :goto_1

    .line 84
    .line 85
    :cond_1
    instance-of p0, p1, Landroid/telephony/CellInfoCdma;

    .line 86
    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    move-object p0, p1

    .line 90
    check-cast p0, Landroid/telephony/CellInfoCdma;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/telephony/CellInfoCdma;->getCellIdentity()Landroid/telephony/CellIdentityCdma;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p1, Landroid/telephony/CellInfoCdma;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/telephony/CellInfoCdma;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthCdma;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0}, Landroid/telephony/CellIdentityCdma;->getNetworkId()I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iput p2, p3, Ll/xe5$d;->a:I

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/telephony/CellIdentityCdma;->getSystemId()I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iput p2, p3, Ll/xe5$d;->b:I

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/telephony/CellIdentityCdma;->getLatitude()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    iput p2, p3, Ll/xe5$d;->d:I

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/telephony/CellIdentityCdma;->getLongitude()I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    iput p2, p3, Ll/xe5$d;->e:I

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/telephony/CellIdentityCdma;->getBasestationId()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    iput p0, p3, Ll/xe5$d;->c:I

    .line 131
    .line 132
    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthCdma;->getCdmaDbm()I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    iput p0, p3, Ll/xe5$d;->f:I

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_2
    instance-of p0, p1, Landroid/telephony/CellInfoLte;

    .line 141
    .line 142
    if-eqz p0, :cond_4

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/telephony/CellInfo;->isRegistered()Z

    .line 145
    .line 146
    .line 147
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 148
    if-nez p0, :cond_3

    .line 149
    .line 150
    monitor-exit v0

    .line 151
    return-void

    .line 152
    :cond_3
    :try_start_2
    move-object p0, p1

    .line 153
    check-cast p0, Landroid/telephony/CellInfoLte;

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getMnc()I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    iput p2, p4, Ll/xe5$h;->a:I

    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getMcc()I

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    iput p2, p4, Ll/xe5$h;->b:I

    .line 170
    .line 171
    iget p3, p4, Ll/xe5$h;->a:I

    .line 172
    .line 173
    if-eq p3, v1, :cond_5

    .line 174
    .line 175
    if-eq p2, v1, :cond_5

    .line 176
    .line 177
    check-cast p1, Landroid/telephony/CellInfoLte;

    .line 178
    .line 179
    invoke-virtual {p1}, Landroid/telephony/CellInfoLte;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthLte;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getTac()I

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    iput p2, p4, Ll/xe5$h;->c:I

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getCi()I

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    iput p2, p4, Ll/xe5$h;->d:I

    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getPci()I

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    iput p2, p4, Ll/xe5$h;->f:I

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getEarfcn()I

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    iput p0, p4, Ll/xe5$h;->e:I

    .line 206
    .line 207
    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthLte;->getDbm()I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    iput p0, p4, Ll/xe5$h;->g:I

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_4
    instance-of p0, p1, Landroid/telephony/CellInfoWcdma;

    .line 215
    .line 216
    if-eqz p0, :cond_5

    .line 217
    .line 218
    move-object p0, p1

    .line 219
    check-cast p0, Landroid/telephony/CellInfoWcdma;

    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/telephony/CellInfoWcdma;->getCellIdentity()Landroid/telephony/CellIdentityWcdma;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    check-cast p1, Landroid/telephony/CellInfoWcdma;

    .line 226
    .line 227
    invoke-virtual {p1}, Landroid/telephony/CellInfoWcdma;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthWcdma;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getMnc()I

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    iput p2, p5, Ll/xe5$j;->a:I

    .line 236
    .line 237
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getMcc()I

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    iput p2, p5, Ll/xe5$j;->b:I

    .line 242
    .line 243
    iget p3, p5, Ll/xe5$j;->a:I

    .line 244
    .line 245
    if-eq p3, v1, :cond_5

    .line 246
    .line 247
    if-eq p2, v1, :cond_5

    .line 248
    .line 249
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getUarfcn()I

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    iput p2, p5, Ll/xe5$j;->f:I

    .line 254
    .line 255
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getPsc()I

    .line 256
    .line 257
    .line 258
    move-result p2

    .line 259
    iput p2, p5, Ll/xe5$j;->e:I

    .line 260
    .line 261
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getCid()I

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    iput p2, p5, Ll/xe5$j;->d:I

    .line 266
    .line 267
    invoke-virtual {p0}, Landroid/telephony/CellIdentityWcdma;->getLac()I

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    iput p0, p5, Ll/xe5$j;->c:I

    .line 272
    .line 273
    invoke-virtual {p1}, Landroid/telephony/CellSignalStrengthWcdma;->getDbm()I

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    iput p0, p5, Ll/xe5$j;->g:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 278
    .line 279
    :cond_5
    :goto_0
    monitor-exit v0

    .line 280
    return-void

    .line 281
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 282
    throw p0
.end method

.method private static I(Landroid/hardware/camera2/CameraCharacteristics;)I
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x100

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    array-length v0, p0

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Ll/xe5$f;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/xe5$f;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p0, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/util/Size;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    mul-int/2addr v0, p0

    .line 46
    div-int/lit16 v0, v0, 0x2710
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    return v0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 51
    .line 52
    const/16 v1, 0x17

    .line 53
    .line 54
    new-array v1, v1, [B

    .line 55
    .line 56
    fill-array-data v1, :array_0

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catch_1
    move-exception p0

    .line 68
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 69
    .line 70
    const/16 v1, 0x20

    .line 71
    .line 72
    new-array v1, v1, [B

    .line 73
    .line 74
    fill-array-data v1, :array_1

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    .line 83
    .line 84
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 85
    return p0

    .line 86
    nop

    .line 87
    :array_0
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x0t
        0xbt
        0x55t
        0x14t
        0x50t
        0x67t
        0x8t
        0x1et
        0x55t
        0xat
        0x42t
        0xdt
        0x41t
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :array_1
    .array-data 1
        0x71t
        0x15t
        0x42t
        0x52t
        0x13t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x72t
        0x13t
        0x14t
        0x5ft
        0x14t
        0x11t
        0x50t
        0x4t
        0x12t
        0x73t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
        0x60t
        0xft
        0x49t
        0x52t
        0xdt
        0x15t
        0xat
        0x46t
    .end array-data
.end method

.method private static I0()[D
    .locals 12

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    new-array v3, v2, [B

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/16 v5, 0x42

    .line 19
    .line 20
    aput-byte v5, v3, v4

    .line 21
    .line 22
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-direct {v0, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    :try_start_1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    new-array v5, v3, [B

    .line 37
    .line 38
    fill-array-data v5, :array_1

    .line 39
    .line 40
    .line 41
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const/4 v5, 0x5

    .line 50
    aget-object v5, v1, v5

    .line 51
    .line 52
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    const/4 v7, 0x2

    .line 57
    aget-object v8, v1, v7

    .line 58
    .line 59
    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 60
    .line 61
    .line 62
    move-result-wide v8

    .line 63
    aget-object v3, v1, v3

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 66
    .line 67
    .line 68
    move-result-wide v10

    .line 69
    add-double/2addr v8, v10

    .line 70
    const/4 v3, 0x4

    .line 71
    aget-object v3, v1, v3

    .line 72
    .line 73
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 74
    .line 75
    .line 76
    move-result-wide v10

    .line 77
    add-double/2addr v8, v10

    .line 78
    const/4 v3, 0x6

    .line 79
    aget-object v3, v1, v3

    .line 80
    .line 81
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 82
    .line 83
    .line 84
    move-result-wide v10

    .line 85
    add-double/2addr v8, v10

    .line 86
    const/16 v3, 0x8

    .line 87
    .line 88
    aget-object v3, v1, v3

    .line 89
    .line 90
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 91
    .line 92
    .line 93
    move-result-wide v10

    .line 94
    add-double/2addr v8, v10

    .line 95
    const/4 v3, 0x7

    .line 96
    aget-object v1, v1, v3

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 99
    .line 100
    .line 101
    move-result-wide v10

    .line 102
    add-double/2addr v8, v10

    .line 103
    new-array v1, v7, [D

    .line 104
    .line 105
    aput-wide v5, v1, v4

    .line 106
    .line 107
    aput-wide v8, v1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .line 109
    :try_start_2
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 110
    .line 111
    .line 112
    return-object v1

    .line 113
    :catchall_0
    move-exception v1

    .line 114
    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :goto_0
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 120
    :catchall_1
    move-exception v2

    .line 121
    :try_start_4
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :catchall_2
    move-exception v0

    .line 126
    :try_start_5
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    :goto_1
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 132
    .line 133
    const/16 v2, 0x19

    .line 134
    .line 135
    new-array v2, v2, [B

    .line 136
    .line 137
    fill-array-data v2, :array_2

    .line 138
    .line 139
    .line 140
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 145
    .line 146
    .line 147
    :goto_2
    const/4 v0, 0x0

    .line 148
    return-object v0

    .line 149
    :array_0
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x43t
        0x12t
        0x50t
        0x43t
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    nop

    .line 159
    :array_1
    .array-data 1
        0x6ct
        0x15t
        0x1at
    .end array-data

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_2
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x42t
        0x3t
        0x50t
        0x53t
        0x8t
        0x8t
        0x57t
        0x46t
        0x72t
        0x67t
        0x34t
        0x46t
        0x44t
        0xft
        0x5ct
        0x52t
        0x12t
        0x5ct
        0x10t
    .end array-data
.end method

.method private static J(Ljava/lang/String;)I
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    .line 2
    .line 3
    new-instance v1, Ljava/io/FileReader;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    new-array v2, v1, [B

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    const/16 v4, 0x1d

    .line 28
    .line 29
    aput-byte v4, v2, v3

    .line 30
    .line 31
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    array-length v2, p0

    .line 40
    const/4 v4, 0x2

    .line 41
    if-ne v2, v4, :cond_0

    .line 42
    .line 43
    aget-object v2, p0, v1

    .line 44
    .line 45
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    aget-object p0, p0, v3

    .line 50
    .line 51
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    sub-int/2addr v2, p0

    .line 56
    add-int/2addr v2, v1

    .line 57
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 58
    .line 59
    .line 60
    return v2

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    :try_start_3
    array-length v2, p0

    .line 64
    if-ne v2, v1, :cond_1

    .line 65
    .line 66
    aget-object p0, p0, v3

    .line 67
    .line 68
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 72
    add-int/2addr p0, v1

    .line 73
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 74
    .line 75
    .line 76
    return p0

    .line 77
    :cond_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_0

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :goto_0
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 82
    :catchall_1
    move-exception v1

    .line 83
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :catchall_2
    move-exception v0

    .line 88
    :try_start_7
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    throw v1
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_0

    .line 92
    :catch_0
    move-exception p0

    .line 93
    const/4 v0, 0x3

    .line 94
    new-array v0, v0, [B

    .line 95
    .line 96
    fill-array-data v0, :array_0

    .line 97
    .line 98
    .line 99
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const/16 v2, 0x18

    .line 109
    .line 110
    new-array v2, v2, [B

    .line 111
    .line 112
    fill-array-data v2, :array_1

    .line 113
    .line 114
    .line 115
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    :goto_2
    const/4 p0, -0x1

    .line 133
    return p0

    .line 134
    nop

    .line 135
    :array_0
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0xet
        0x14t
        0x55t
        0x15t
        0x77t
        0x45t
        0xet
        0xbt
        0x76t
        0xft
        0x5dt
        0x52t
        0x5bt
        0x46t
    .end array-data
.end method

.method private static J0(Ljava/lang/String;)I
    .locals 4

    .line 1
    invoke-static {p0}, Ll/f2j0;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :try_start_0
    new-instance p0, Ljava/io/BufferedReader;

    .line 15
    .line 16
    new-instance v2, Ljava/io/FileReader;

    .line 17
    .line 18
    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :try_start_1
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :try_start_2
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_1

    .line 42
    :catch_1
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 46
    :catchall_1
    move-exception v2

    .line 47
    :try_start_4
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_2
    move-exception p0

    .line 52
    :try_start_5
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 56
    :goto_1
    const/4 v0, 0x3

    .line 57
    new-array v0, v0, [B

    .line 58
    .line 59
    fill-array-data v0, :array_0

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const/16 v3, 0x23

    .line 72
    .line 73
    new-array v3, v3, [B

    .line 74
    .line 75
    fill-array-data v3, :array_1

    .line 76
    .line 77
    .line 78
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    return v1

    .line 96
    nop

    .line 97
    :array_0
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x42t
        0x3t
        0x50t
        0x53t
        0x27t
        0xft
        0x42t
        0x15t
        0x45t
        0x7bt
        0x8t
        0x8t
        0x55t
        0x20t
        0x43t
        0x58t
        0xct
        0x35t
        0x49t
        0x15t
        0x45t
        0x52t
        0xct
        0x20t
        0x59t
        0xat
        0x54t
        0xdt
        0x41t
    .end array-data
.end method

.method public static K()Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, ""

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 20
    .line 21
    invoke-virtual {v1, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v1, v2

    .line 27
    :goto_0
    sget-object v3, Landroid/os/Build;->SUPPORTED_64_BIT_ABIS:[Ljava/lang/String;

    .line 28
    .line 29
    array-length v4, v3

    .line 30
    if-lez v4, :cond_1

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aget-object v2, v3, v2

    .line 34
    .line 35
    :cond_1
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v3, 0x4

    .line 42
    new-array v4, v3, [B

    .line 43
    .line 44
    fill-array-data v4, :array_1

    .line 45
    .line 46
    .line 47
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    new-array v0, v3, [B

    .line 58
    .line 59
    fill-array-data v0, :array_2

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    return-object v0

    .line 67
    :cond_2
    new-array v4, v0, [B

    .line 68
    .line 69
    fill-array-data v4, :array_3

    .line 70
    .line 71
    .line 72
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    const/4 v5, 0x3

    .line 81
    if-nez v4, :cond_6

    .line 82
    .line 83
    new-array v4, v5, [B

    .line 84
    .line 85
    fill-array-data v4, :array_4

    .line 86
    .line 87
    .line 88
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-nez v4, :cond_6

    .line 97
    .line 98
    new-array v4, v5, [B

    .line 99
    .line 100
    fill-array-data v4, :array_5

    .line 101
    .line 102
    .line 103
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-eqz v4, :cond_3

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    new-array v3, v3, [B

    .line 115
    .line 116
    fill-array-data v3, :array_6

    .line 117
    .line 118
    .line 119
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-nez v3, :cond_5

    .line 128
    .line 129
    const/4 v3, 0x6

    .line 130
    new-array v3, v3, [B

    .line 131
    .line 132
    fill-array-data v3, :array_7

    .line 133
    .line 134
    .line 135
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_5

    .line 144
    .line 145
    new-array v1, v5, [B

    .line 146
    .line 147
    fill-array-data v1, :array_8

    .line 148
    .line 149
    .line 150
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_4

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    new-array v0, v0, [B

    .line 162
    .line 163
    fill-array-data v0, :array_9

    .line 164
    .line 165
    .line 166
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    return-object v0

    .line 171
    :cond_5
    :goto_1
    new-array v0, v5, [B

    .line 172
    .line 173
    fill-array-data v0, :array_a

    .line 174
    .line 175
    .line 176
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    return-object v0

    .line 181
    :cond_6
    :goto_2
    new-array v0, v5, [B

    .line 182
    .line 183
    fill-array-data v0, :array_b

    .line 184
    .line 185
    .line 186
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    return-object v0

    .line 191
    :array_0
    .array-data 1
        0x5ft
        0x15t
        0x1ft
        0x56t
        0x13t
        0x5t
        0x58t
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_1
    .array-data 1
        0x7dt
        0x2ft
        0x61t
        0x64t
    .end array-data

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :array_2
    .array-data 1
        0x5dt
        0xft
        0x41t
        0x44t
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_3
    .array-data 1
        0x71t
        0x27t
        0x63t
        0x74t
        0x29t
        0x50t
        0x4t
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :array_4
    .array-data 1
        0x71t
        0x34t
        0x7ct
    .end array-data

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_5
    .array-data 1
        0x71t
        0x34t
        0x7ct
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    :array_6
    .array-data 1
        0x79t
        0x50t
        0x9t
        0x1t
    .end array-data

    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    :array_7
    .array-data 1
        0x68t
        0x5et
        0x7t
        0x68t
        0x57t
        0x52t
    .end array-data

    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    nop

    .line 245
    :array_8
    .array-data 1
        0x68t
        0x5et
        0x7t
    .end array-data

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    :array_9
    .array-data 1
        0x45t
        0x8t
        0x5at
        0x59t
        0xet
        0x11t
        0x5et
    .end array-data

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    :array_a
    .array-data 1
        0x48t
        0x5et
        0x7t
    .end array-data

    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_b
    .array-data 1
        0x51t
        0x14t
        0x5ct
    .end array-data
.end method

.method private static K0()Ljava/lang/String;
    .locals 6

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/f2j0;->b(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    return-object v3

    .line 20
    :cond_0
    new-instance v2, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    .line 26
    .line 27
    new-instance v5, Ljava/io/FileReader;

    .line 28
    .line 29
    invoke-direct {v5, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    new-array v0, v0, [B

    .line 42
    .line 43
    fill-array-data v0, :array_1

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    const/16 v0, 0xe

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    goto :goto_2

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :goto_0
    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    :catchall_1
    move-exception v2

    .line 76
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catchall_2
    move-exception v4

    .line 81
    :try_start_5
    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 85
    :goto_2
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 86
    .line 87
    new-instance v4, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const/16 v5, 0x2c

    .line 93
    .line 94
    new-array v5, v5, [B

    .line 95
    .line 96
    fill-array-data v5, :array_2

    .line 97
    .line 98
    .line 99
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    .line 115
    .line 116
    :goto_3
    return-object v3

    .line 117
    :array_0
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x46t
        0x3t
        0x43t
        0x44t
        0x8t
        0x9t
        0x5et
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    nop

    .line 129
    :array_1
    .array-data 1
        0x7ct
        0xft
        0x5ft
        0x42t
        0x19t
        0x46t
        0x46t
        0x3t
        0x43t
        0x44t
        0x8t
        0x9t
        0x5et
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    nop

    .line 141
    :array_2
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x13t
        0x3t
        0x51t
        0x2t
        0x58t
        0x59t
        0x6t
        0x46t
        0x5bt
        0x3t
        0x43t
        0x59t
        0x4t
        0xat
        0x10t
        0x10t
        0x54t
        0x45t
        0x12t
        0xft
        0x5ft
        0x8t
        0x11t
        0x51t
        0x13t
        0x9t
        0x5dt
        0x46t
    .end array-data
.end method

.method public static L()[Ljava/lang/String;
    .locals 9

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-array v0, v0, [B

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/f2j0;->e(Ljava/lang/String;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 21
    move-object v2, v1

    .line 22
    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_4

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    const/4 v4, 0x1

    .line 35
    new-array v5, v4, [B

    .line 36
    .line 37
    const/16 v6, 0xa

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    aput-byte v6, v5, v7

    .line 41
    .line 42
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    array-length v5, v3

    .line 51
    const/4 v8, 0x2

    .line 52
    if-ne v5, v8, :cond_0

    .line 53
    .line 54
    aget-object v5, v3, v7

    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    aget-object v3, v3, v4

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const/16 v4, 0x8

    .line 67
    .line 68
    new-array v4, v4, [B

    .line 69
    .line 70
    fill-array-data v4, :array_1

    .line 71
    .line 72
    .line 73
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_3

    .line 82
    .line 83
    const/16 v4, 0x9

    .line 84
    .line 85
    new-array v7, v4, [B

    .line 86
    .line 87
    fill-array-data v7, :array_2

    .line 88
    .line 89
    .line 90
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_1
    new-array v4, v4, [B

    .line 102
    .line 103
    fill-array-data v4, :array_3

    .line 104
    .line 105
    .line 106
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-nez v4, :cond_2

    .line 115
    .line 116
    new-array v4, v6, [B

    .line 117
    .line 118
    fill-array-data v4, :array_4

    .line 119
    .line 120
    .line 121
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 129
    if-eqz v4, :cond_0

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catch_0
    move-exception v0

    .line 133
    goto :goto_3

    .line 134
    :cond_2
    :goto_1
    move-object v2, v3

    .line 135
    goto :goto_0

    .line 136
    :cond_3
    :goto_2
    move-object v1, v3

    .line 137
    goto :goto_0

    .line 138
    :catch_1
    move-exception v0

    .line 139
    move-object v2, v1

    .line 140
    :goto_3
    const/4 v3, 0x3

    .line 141
    new-array v3, v3, [B

    .line 142
    .line 143
    fill-array-data v3, :array_5

    .line 144
    .line 145
    .line 146
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    new-instance v4, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    const/16 v5, 0x12

    .line 156
    .line 157
    new-array v5, v5, [B

    .line 158
    .line 159
    fill-array-data v5, :array_6

    .line 160
    .line 161
    .line 162
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    :cond_4
    filled-new-array {v2, v1}, [Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    return-object v0

    .line 184
    nop

    .line 185
    :array_0
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x53t
        0x16t
        0x44t
        0x5et
        0xft
        0x0t
        0x5ft
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    nop

    .line 197
    :array_1
    .array-data 1
        0x78t
        0x7t
        0x43t
        0x53t
        0x16t
        0x7t
        0x42t
        0x3t
    .end array-data

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    :array_2
    .array-data 1
        0x46t
        0x3t
        0x5ft
        0x53t
        0xet
        0x14t
        0x6ft
        0xft
        0x55t
    .end array-data

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    nop

    .line 215
    :array_3
    .array-data 1
        0x60t
        0x14t
        0x5et
        0x54t
        0x4t
        0x15t
        0x43t
        0x9t
        0x43t
    .end array-data

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    nop

    .line 225
    :array_4
    .array-data 1
        0x5dt
        0x9t
        0x55t
        0x52t
        0xdt
        0x46t
        0x5et
        0x7t
        0x5ct
        0x52t
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    nop

    .line 235
    :array_5
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    :array_6
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x11t
        0x13t
        0x79t
        0x8t
        0x57t
        0x58t
        0x5bt
        0x46t
    .end array-data
.end method

.method private static L0(Landroid/hardware/camera2/CameraCharacteristics;Ll/xe5$e;)V
    .locals 2

    .line 1
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iput v1, p1, Ll/xe5$e;->a:I

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-ne p0, v1, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x2

    .line 28
    iput p0, p1, Ll/xe5$e;->a:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public static M()D
    .locals 12

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/xe5;->I0()[D

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    aget-wide v4, v0, v1

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    aget-wide v6, v0, v6

    .line 21
    .line 22
    sget-boolean v0, Ll/xe5;->e:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sput-boolean v1, Ll/xe5;->e:Z

    .line 27
    .line 28
    sput-wide v4, Ll/xe5;->f:D

    .line 29
    .line 30
    sput-wide v6, Ll/xe5;->g:D

    .line 31
    .line 32
    return-wide v2

    .line 33
    :cond_1
    add-double v0, v6, v4

    .line 34
    .line 35
    sget-wide v8, Ll/xe5;->g:D

    .line 36
    .line 37
    sget-wide v10, Ll/xe5;->f:D

    .line 38
    .line 39
    add-double/2addr v10, v8

    .line 40
    sub-double/2addr v0, v10

    .line 41
    cmpl-double v10, v0, v2

    .line 42
    .line 43
    if-eqz v10, :cond_2

    .line 44
    .line 45
    sub-double v8, v6, v8

    .line 46
    .line 47
    const-wide/high16 v10, 0x4059000000000000L    # 100.0

    .line 48
    .line 49
    mul-double/2addr v8, v10

    .line 50
    div-double/2addr v8, v0

    .line 51
    mul-double/2addr v8, v10

    .line 52
    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    long-to-double v0, v0

    .line 57
    div-double/2addr v0, v10

    .line 58
    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->min(DD)D

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    :cond_2
    sput-wide v6, Ll/xe5;->g:D

    .line 67
    .line 68
    sput-wide v4, Ll/xe5;->f:D

    .line 69
    .line 70
    :cond_3
    :goto_0
    return-wide v2
.end method

.method private static M0(Landroid/hardware/camera2/CameraCharacteristics;Ll/xe5$e;)V
    .locals 1

    .line 1
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_FOCAL_LENGTHS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, [F

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->sort([F)V

    .line 12
    .line 13
    .line 14
    array-length v0, p0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    aget p0, p0, v0

    .line 18
    .line 19
    iput p0, p1, Ll/xe5$e;->c:F

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static N(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    new-array v2, v2, [B

    .line 12
    .line 13
    fill-array-data v2, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/app/ActivityManager;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 49
    .line 50
    iget v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    .line 51
    .line 52
    if-ne v3, v1, :cond_1

    .line 53
    .line 54
    iget-object p0, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    return-object v0

    .line 58
    nop

    .line 59
    :array_0
    .array-data 1
        0x51t
        0x5t
        0x45t
        0x5et
        0x17t
        0xft
        0x44t
        0x1ft
    .end array-data
.end method

.method public static O()Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    const/16 v0, 0x1a

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-array v0, v0, [B

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/16 v2, 0x12

    .line 18
    .line 19
    new-array v2, v2, [B

    .line 20
    .line 21
    fill-array-data v2, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    return-object v0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    const/4 v2, 0x7

    .line 41
    new-array v2, v2, [B

    .line 42
    .line 43
    fill-array-data v2, :array_2

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/16 v3, 0x2c

    .line 51
    .line 52
    new-array v3, v3, [B

    .line 53
    .line 54
    fill-array-data v3, :array_3

    .line 55
    .line 56
    .line 57
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 62
    .line 63
    .line 64
    return-object v1

    .line 65
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x50t
        0x47t
        0x11t
        0x48t
        0x71t
        0x5t
        0x45t
        0x5et
        0x17t
        0xft
        0x44t
        0x1ft
        0x65t
        0x5ft
        0x13t
        0x3t
        0x51t
        0x2t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    nop

    .line 83
    :array_1
    .array-data 1
        0x53t
        0x13t
        0x43t
        0x45t
        0x4t
        0x8t
        0x44t
        0x36t
        0x43t
        0x58t
        0x2t
        0x3t
        0x43t
        0x15t
        0x7ft
        0x56t
        0xct
        0x3t
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    nop

    .line 97
    :array_2
    .array-data 1
        0x71t
        0x16t
        0x41t
        0x7et
        0xft
        0x0t
        0x5ft
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    :array_3
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x43t
        0x8t
        0x8t
        0x57t
        0x46t
        0x41t
        0x45t
        0xet
        0x5t
        0x55t
        0x15t
        0x42t
        0x17t
        0xft
        0x7t
        0x5dt
        0x3t
        0x11t
        0x55t
        0x18t
        0x46t
        0x71t
        0x5t
        0x45t
        0x5et
        0x17t
        0xft
        0x44t
        0x1ft
        0x65t
        0x5ft
        0x13t
        0x3t
        0x51t
        0x2t
    .end array-data
.end method

.method public static P()Ljava/lang/String;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/yqq0;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    return-object v0
.end method

.method public static Q()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    new-array v2, v1, [B

    .line 9
    .line 10
    fill-array-data v2, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-array v1, v1, [B

    .line 18
    .line 19
    fill-array-data v1, :array_1

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Ll/xe5;->y0(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x14

    .line 38
    .line 39
    new-array v2, v1, [B

    .line 40
    .line 41
    fill-array-data v2, :array_2

    .line 42
    .line 43
    .line 44
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-array v1, v1, [B

    .line 49
    .line 50
    fill-array-data v1, :array_3

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ll/xe5;->y0(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x45t
        0x15t
        0x1et
        0x42t
        0x12t
        0x4t
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x4t
        0x45t
        0x15t
        0x1et
        0x42t
        0x12t
        0x4t
    .end array-data

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    :array_2
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x5t
        0x5ct
        0x7t
        0x42t
        0x44t
        0x4et
        0x8t
        0x55t
        0x12t
        0x1et
        0x40t
        0xdt
        0x7t
        0x5et
        0x56t
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :array_3
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x5t
        0x5ct
        0x7t
        0x42t
        0x44t
        0x4et
        0x8t
        0x55t
        0x12t
        0x1et
        0x40t
        0xdt
        0x7t
        0x5et
        0x56t
    .end array-data
.end method

.method private static R(ILandroid/content/Context;)Ljava/lang/String;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission",
            "HardwareIds"
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xf

    .line 8
    .line 9
    :try_start_0
    new-array v0, v0, [B

    .line 10
    .line 11
    fill-array-data v0, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p0, p1}, Ll/xe5;->b0(Ljava/lang/String;ILandroid/content/Context;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    return-object p0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    sget-object p1, Ll/xe5;->a:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v0, 0x1a

    .line 27
    .line 28
    new-array v0, v0, [B

    .line 29
    .line 30
    fill-array-data v0, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return-object p0

    .line 42
    nop

    .line 43
    :array_0
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x14t
        0x4t
        0x43t
        0x5t
        0x43t
        0x5et
        0x3t
        0x3t
        0x42t
        0x2ft
        0x55t
    .end array-data

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    :array_1
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x6t
        0x3t
        0x44t
        0x2ft
        0x5ct
        0x44t
        0x8t
        0x3et
        0x10t
        0x3t
        0x43t
        0x45t
        0xet
        0x14t
        0xat
        0x46t
    .end array-data
.end method

.method public static S(Landroid/content/Context;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/inputmethod/InputMethodManager;->getInputMethodList()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/view/inputmethod/InputMethodInfo;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v2, v3}, Landroid/view/inputmethod/InputMethodInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v2}, Landroid/view/inputmethod/InputMethodInfo;->getId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Ll/f2j0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return-object v0

    .line 68
    nop

    .line 69
    :array_0
    .array-data 1
        0x59t
        0x8t
        0x41t
        0x42t
        0x15t
        0x39t
        0x5dt
        0x3t
        0x45t
        0x5ft
        0xet
        0x2t
    .end array-data
.end method

.method public static T()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/xe5;->K0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const/16 v0, 0xa

    .line 15
    .line 16
    new-array v0, v0, [B

    .line 17
    .line 18
    fill-array-data v0, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0

    .line 30
    nop

    .line 31
    :array_0
    .array-data 1
        0x5ft
        0x15t
        0x1ft
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data
.end method

.method public static U()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static V(Landroid/content/Context;I)Ljava/lang/String;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x23

    .line 4
    .line 5
    :try_start_0
    new-array v1, v1, [B

    .line 6
    .line 7
    const/16 v2, 0x51

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    aput-byte v2, v1, v3

    .line 11
    .line 12
    const/16 v2, 0x8

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    aput-byte v2, v1, v4

    .line 16
    .line 17
    const/16 v5, 0x55

    .line 18
    .line 19
    const/4 v6, 0x2

    .line 20
    aput-byte v5, v1, v6

    .line 21
    .line 22
    const/16 v5, 0x45

    .line 23
    .line 24
    const/4 v7, 0x3

    .line 25
    aput-byte v5, v1, v7

    .line 26
    .line 27
    const/16 v8, 0xe

    .line 28
    .line 29
    const/4 v9, 0x4

    .line 30
    aput-byte v8, v1, v9

    .line 31
    .line 32
    const/16 v10, 0xf

    .line 33
    .line 34
    const/4 v11, 0x5

    .line 35
    aput-byte v10, v1, v11

    .line 36
    .line 37
    const/16 v12, 0x54

    .line 38
    .line 39
    const/4 v13, 0x6

    .line 40
    aput-byte v12, v1, v13

    .line 41
    .line 42
    const/16 v14, 0x48

    .line 43
    .line 44
    const/4 v15, 0x7

    .line 45
    aput-byte v14, v1, v15

    .line 46
    .line 47
    const/16 v14, 0x41

    .line 48
    .line 49
    aput-byte v14, v1, v2

    .line 50
    .line 51
    const/16 v14, 0x9

    .line 52
    .line 53
    const/16 v16, 0x52

    .line 54
    .line 55
    aput-byte v16, v1, v14

    .line 56
    .line 57
    const/16 v14, 0xa

    .line 58
    .line 59
    const/16 v16, 0x13

    .line 60
    .line 61
    aput-byte v16, v1, v14

    .line 62
    .line 63
    const/16 v14, 0xb

    .line 64
    .line 65
    aput-byte v14, v1, v14

    .line 66
    .line 67
    const/16 v14, 0xc

    .line 68
    .line 69
    const/16 v17, 0x59

    .line 70
    .line 71
    aput-byte v17, v1, v14

    .line 72
    .line 73
    const/16 v14, 0xd

    .line 74
    .line 75
    const/16 v18, 0x15

    .line 76
    .line 77
    aput-byte v18, v1, v14

    .line 78
    .line 79
    const/16 v14, 0x42

    .line 80
    .line 81
    aput-byte v14, v1, v8

    .line 82
    .line 83
    const/16 v14, 0x5e

    .line 84
    .line 85
    aput-byte v14, v1, v10

    .line 86
    .line 87
    const/16 v19, 0x10

    .line 88
    .line 89
    aput-byte v8, v1, v19

    .line 90
    .line 91
    const/16 v19, 0x11

    .line 92
    .line 93
    aput-byte v2, v1, v19

    .line 94
    .line 95
    const/16 v2, 0x12

    .line 96
    .line 97
    const/16 v19, 0x1e

    .line 98
    .line 99
    aput-byte v19, v1, v2

    .line 100
    .line 101
    const/16 v2, 0x34

    .line 102
    .line 103
    aput-byte v2, v1, v16

    .line 104
    .line 105
    const/16 v2, 0x14

    .line 106
    .line 107
    const/16 v16, 0x74

    .line 108
    .line 109
    aput-byte v16, v1, v2

    .line 110
    .line 111
    const/16 v2, 0x76

    .line 112
    .line 113
    aput-byte v2, v1, v18

    .line 114
    .line 115
    const/16 v2, 0x16

    .line 116
    .line 117
    const/16 v16, 0x25

    .line 118
    .line 119
    aput-byte v16, v1, v2

    .line 120
    .line 121
    const/16 v2, 0x17

    .line 122
    .line 123
    const/16 v16, 0x39

    .line 124
    .line 125
    aput-byte v16, v1, v2

    .line 126
    .line 127
    const/16 v2, 0x18

    .line 128
    .line 129
    const/16 v18, 0x60

    .line 130
    .line 131
    aput-byte v18, v1, v2

    .line 132
    .line 133
    const/16 v2, 0x19

    .line 134
    .line 135
    const/16 v18, 0x2e

    .line 136
    .line 137
    aput-byte v18, v1, v2

    .line 138
    .line 139
    const/16 v2, 0x1a

    .line 140
    .line 141
    const/16 v18, 0x7e

    .line 142
    .line 143
    aput-byte v18, v1, v2

    .line 144
    .line 145
    const/16 v2, 0x1b

    .line 146
    .line 147
    const/16 v18, 0x79

    .line 148
    .line 149
    aput-byte v18, v1, v2

    .line 150
    .line 151
    const/16 v2, 0x1c

    .line 152
    .line 153
    const/16 v18, 0x24

    .line 154
    .line 155
    aput-byte v18, v1, v2

    .line 156
    .line 157
    const/16 v2, 0x1d

    .line 158
    .line 159
    aput-byte v16, v1, v2

    .line 160
    .line 161
    const/16 v16, 0x63

    .line 162
    .line 163
    aput-byte v16, v1, v19

    .line 164
    .line 165
    const/16 v19, 0x1f

    .line 166
    .line 167
    const/16 v20, 0x32

    .line 168
    .line 169
    aput-byte v20, v1, v19

    .line 170
    .line 171
    const/16 v19, 0x20

    .line 172
    .line 173
    const/16 v20, 0x70

    .line 174
    .line 175
    aput-byte v20, v1, v19

    .line 176
    .line 177
    const/16 v19, 0x21

    .line 178
    .line 179
    aput-byte v16, v1, v19

    .line 180
    .line 181
    const/16 v16, 0x22

    .line 182
    .line 183
    aput-byte v18, v1, v16

    .line 184
    .line 185
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {v0, v1}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_0

    .line 194
    .line 195
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 196
    .line 197
    if-ge v1, v2, :cond_0

    .line 198
    .line 199
    new-array v1, v11, [B

    .line 200
    .line 201
    const/16 v2, 0x40

    .line 202
    .line 203
    aput-byte v2, v1, v3

    .line 204
    .line 205
    aput-byte v8, v1, v4

    .line 206
    .line 207
    aput-byte v14, v1, v6

    .line 208
    .line 209
    aput-byte v17, v1, v7

    .line 210
    .line 211
    aput-byte v9, v1, v9

    .line 212
    .line 213
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    new-array v2, v15, [B

    .line 228
    .line 229
    const/16 v8, 0x57

    .line 230
    .line 231
    aput-byte v8, v2, v3

    .line 232
    .line 233
    aput-byte v7, v2, v4

    .line 234
    .line 235
    aput-byte v5, v2, v6

    .line 236
    .line 237
    const/16 v5, 0x7a

    .line 238
    .line 239
    aput-byte v5, v2, v7

    .line 240
    .line 241
    aput-byte v9, v2, v9

    .line 242
    .line 243
    aput-byte v10, v2, v11

    .line 244
    .line 245
    aput-byte v12, v2, v13

    .line 246
    .line 247
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    new-array v5, v4, [Ljava/lang/Class;

    .line 252
    .line 253
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 254
    .line 255
    aput-object v6, v5, v3

    .line 256
    .line 257
    invoke-virtual {v1, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    new-array v2, v4, [Ljava/lang/Object;

    .line 262
    .line 263
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    aput-object v4, v2, v3

    .line 268
    .line 269
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    .line 275
    return-object v0

    .line 276
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 277
    return-object v0
.end method

.method public static W(Landroid/content/Context;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/os/storage/StorageManager;

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/16 v3, 0xe

    .line 27
    .line 28
    new-array v4, v3, [B

    .line 29
    .line 30
    fill-array-data v4, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    new-array v3, v3, [B

    .line 47
    .line 48
    fill-array-data v3, :array_2

    .line 49
    .line 50
    .line 51
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const-class v6, Ljava/lang/String;

    .line 56
    .line 57
    filled-new-array {v6}, [Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-virtual {v4, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v2, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, [Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    array-length v4, v2

    .line 74
    const/4 v5, 0x0

    .line 75
    :goto_0
    if-ge v5, v4, :cond_1

    .line 76
    .line 77
    aget-object v6, v2, v5

    .line 78
    .line 79
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    check-cast v7, Ljava/lang/String;

    .line 88
    .line 89
    new-array v8, v0, [B

    .line 90
    .line 91
    fill-array-data v8, :array_3

    .line 92
    .line 93
    .line 94
    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v8

    .line 98
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-eqz v7, :cond_0

    .line 103
    .line 104
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :catch_0
    move-exception p0

    .line 109
    goto :goto_2

    .line 110
    :catch_1
    move-exception p0

    .line 111
    goto :goto_3

    .line 112
    :catch_2
    move-exception p0

    .line 113
    goto :goto_4

    .line 114
    :cond_0
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :goto_2
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 118
    .line 119
    const/16 v2, 0x34

    .line 120
    .line 121
    new-array v2, v2, [B

    .line 122
    .line 123
    fill-array-data v2, :array_4

    .line 124
    .line 125
    .line 126
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .line 132
    .line 133
    goto :goto_5

    .line 134
    :goto_3
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 135
    .line 136
    const/16 v2, 0x27

    .line 137
    .line 138
    new-array v2, v2, [B

    .line 139
    .line 140
    fill-array-data v2, :array_5

    .line 141
    .line 142
    .line 143
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    .line 149
    .line 150
    goto :goto_5

    .line 151
    :goto_4
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 152
    .line 153
    const/16 v2, 0x29

    .line 154
    .line 155
    new-array v2, v2, [B

    .line 156
    .line 157
    fill-array-data v2, :array_6

    .line 158
    .line 159
    .line 160
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 165
    .line 166
    .line 167
    :cond_1
    :goto_5
    return-object v1

    .line 168
    nop

    .line 169
    :array_0
    .array-data 1
        0x43t
        0x12t
        0x5et
        0x45t
        0x0t
        0x1t
        0x55t
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :array_1
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x61t
        0xet
        0xat
        0x45t
        0xbt
        0x54t
        0x67t
        0x0t
        0x12t
        0x58t
        0x15t
    .end array-data

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    nop

    .line 189
    :array_2
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x61t
        0xet
        0xat
        0x45t
        0xbt
        0x54t
        0x64t
        0x15t
        0x7t
        0x44t
        0x3t
    .end array-data

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    nop

    .line 201
    :array_3
    .array-data 1
        0x5dt
        0x9t
        0x44t
        0x59t
        0x15t
        0x3t
        0x54t
    .end array-data

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    :array_4
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7at
        0xet
        0x13t
        0x5et
        0x12t
        0x54t
        0x53t
        0x31t
        0x9t
        0x59t
        0x8t
        0x45t
        0x44t
        0x41t
        0x2ft
        0x5et
        0x10t
        0x5et
        0x54t
        0x0t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x15t
        0x7t
        0x42t
        0x1t
        0x54t
        0x43t
        0x41t
        0x3t
        0x48t
        0x5t
        0x54t
        0x47t
        0x15t
        0xft
        0x5ft
        0x8t
        0xbt
        0x17t
    .end array-data

    .line 210
    .line 211
    .line 212
    .line 213
    :array_5
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7at
        0xet
        0x13t
        0x5et
        0x12t
        0x54t
        0x53t
        0x31t
        0x9t
        0x59t
        0x8t
        0x45t
        0x44t
        0x41t
        0x2ft
        0x5ct
        0xat
        0x54t
        0x50t
        0x0t
        0xat
        0x10t
        0x7t
        0x52t
        0x54t
        0x4t
        0x15t
        0x43t
        0x5ct
        0x11t
    .end array-data

    :array_6
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7at
        0xet
        0x13t
        0x5et
        0x12t
        0x54t
        0x53t
        0x31t
        0x9t
        0x59t
        0x8t
        0x45t
        0x44t
        0x41t
        0x2bt
        0x55t
        0x12t
        0x59t
        0x58t
        0x5t
        0x46t
        0x5et
        0x9t
        0x45t
        0x17t
        0x7t
        0x9t
        0x45t
        0x8t
        0x55t
        0xdt
        0x41t
    .end array-data
.end method

.method public static X()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    sget-object v3, Ll/xe5;->l:[Ljava/lang/String;

    .line 9
    .line 10
    array-length v4, v3

    .line 11
    if-ge v2, v4, :cond_1

    .line 12
    .line 13
    :try_start_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v5, 0x1c

    .line 16
    .line 17
    if-le v4, v5, :cond_0

    .line 18
    .line 19
    new-instance v4, Ljava/lang/String;

    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    invoke-static {v2, v5}, Lcom/immomo/hdata/android/Coded;->doCommand2(II)[B

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catch_0
    move-exception v3

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    new-instance v4, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lcom/immomo/hdata/android/Coded;->doCommand2(II)[B

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .line 39
    .line 40
    .line 41
    :goto_1
    aget-object v3, v3, v2

    .line 42
    .line 43
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_3

    .line 47
    :goto_2
    sget-object v4, Ll/xe5;->a:Ljava/lang/String;

    .line 48
    .line 49
    new-instance v5, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const/16 v6, 0x1f

    .line 55
    .line 56
    new-array v6, v6, [B

    .line 57
    .line 58
    fill-array-data v6, :array_0

    .line 59
    .line 60
    .line 61
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    return-object v0

    .line 82
    nop

    .line 83
    :array_0
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x67t
        0xet
        0x58t
        0x5bt
        0x4t
        0x46t
        0x57t
        0x3t
        0x45t
        0x79t
        0x0t
        0x12t
        0x59t
        0x10t
        0x54t
        0x71t
        0x14t
        0x8t
        0x53t
        0x2ft
        0x5ft
        0x51t
        0xet
        0x5ct
        0x10t
    .end array-data
.end method

.method public static Y()I
    .locals 4

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    :try_start_0
    new-array v0, v0, [B

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/xe5;->J(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    const/16 v0, 0x1f

    .line 20
    .line 21
    new-array v0, v0, [B

    .line 22
    .line 23
    fill-array-data v0, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/xe5;->J(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    :cond_0
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    new-instance v2, Ljava/io/File;

    .line 37
    .line 38
    const/16 v3, 0x18

    .line 39
    .line 40
    new-array v3, v3, [B

    .line 41
    .line 42
    fill-array-data v3, :array_2

    .line 43
    .line 44
    .line 45
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v3, Ll/xe5;->d:Ljava/io/FileFilter;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    array-length v0, v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :cond_1
    return v0

    .line 62
    :catch_0
    return v1

    .line 63
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x2t
        0x55t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x52t
        0x47t
        0x14t
        0x49t
        0x40t
        0x9t
        0x42t
        0x44t
        0x8t
        0x4t
        0x5ct
        0x3t
    .end array-data

    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x2t
        0x55t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x52t
        0x47t
        0x14t
        0x49t
        0x40t
        0x14t
        0x54t
        0x44t
        0x4t
        0x8t
        0x44t
    .end array-data

    :array_2
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x2t
        0x55t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x52t
        0x47t
        0x14t
        0x49t
    .end array-data
.end method

.method public static Z()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/qre0;->a()Ll/qre0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/qre0;->c()Ll/okq0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :try_start_0
    invoke-virtual {v1}, Ll/okq0;->a()Landroid/os/IBinder;

    .line 15
    .line 16
    .line 17
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    const/16 v2, 0x14

    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    :try_start_1
    new-array v2, v2, [B

    .line 25
    .line 26
    fill-array-data v2, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    array-length v4, v2

    .line 53
    if-lez v4, :cond_0

    .line 54
    .line 55
    const/16 v4, 0x16

    .line 56
    .line 57
    new-array v4, v4, [B

    .line 58
    .line 59
    fill-array-data v4, :array_1

    .line 60
    .line 61
    .line 62
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const/4 v5, 0x0

    .line 67
    aget-object v2, v2, v5

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    const/16 v2, 0x16

    .line 80
    .line 81
    new-array v2, v2, [B

    .line 82
    .line 83
    fill-array-data v2, :array_2

    .line 84
    .line 85
    .line 86
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/4 v2, 0x6

    .line 102
    new-array v2, v2, [B

    .line 103
    .line 104
    fill-array-data v2, :array_3

    .line 105
    .line 106
    .line 107
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    :cond_1
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    return-object v0

    .line 121
    :cond_2
    new-array v1, v2, [B

    .line 122
    .line 123
    fill-array-data v1, :array_4

    .line 124
    .line 125
    .line 126
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    :goto_1
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 135
    .line 136
    new-instance v3, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const/16 v4, 0x21

    .line 142
    .line 143
    new-array v4, v4, [B

    .line 144
    .line 145
    fill-array-data v4, :array_5

    .line 146
    .line 147
    .line 148
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    return-object v0

    .line 166
    nop

    .line 167
    :array_0
    .array-data 1
        0x60t
        0xet
        0x5et
        0x59t
        0x4t
        0x2bt
        0x51t
        0x8t
        0x50t
        0x50t
        0x4t
        0x14t
        0x1dt
        0x2ft
        0x73t
        0x5et
        0xft
        0x2t
        0x55t
        0x14t
    .end array-data

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_1
    .array-data 1
        0x60t
        0xet
        0x5et
        0x59t
        0x4t
        0x2bt
        0x51t
        0x8t
        0x50t
        0x50t
        0x4t
        0x14t
        0x1dt
        0x2ft
        0x5ft
        0x43t
        0x4t
        0x14t
        0x56t
        0x7t
        0x52t
        0x52t
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    nop

    .line 197
    :array_2
    .array-data 1
        0x60t
        0xet
        0x5et
        0x59t
        0x4t
        0x2bt
        0x51t
        0x8t
        0x50t
        0x50t
        0x4t
        0x14t
        0x1dt
        0x2ft
        0x5ft
        0x43t
        0x4t
        0x14t
        0x56t
        0x7t
        0x52t
        0x52t
    .end array-data

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    nop

    .line 213
    :array_3
    .array-data 1
        0x5ct
        0x9t
        0x50t
        0x53t
        0x4t
        0x14t
    .end array-data

    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    nop

    .line 221
    :array_4
    .array-data 1
        0x60t
        0xet
        0x5et
        0x59t
        0x4t
        0x2bt
        0x51t
        0x8t
        0x50t
        0x50t
        0x4t
        0x14t
        0x1dt
        0x2ft
        0x73t
        0x5et
        0xft
        0x2t
        0x55t
        0x14t
    .end array-data

    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :array_5
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x67t
        0xet
        0x58t
        0x5bt
        0x4t
        0x46t
        0x57t
        0x3t
        0x45t
        0x67t
        0x9t
        0x9t
        0x5et
        0x3t
        0x7ct
        0x56t
        0xft
        0x7t
        0x57t
        0x3t
        0x43t
        0x7et
        0xft
        0x0t
        0x5ft
        0x5ct
        0x11t
    .end array-data
.end method

.method public static synthetic a(Ljava/io/File;)Z
    .locals 1

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :array_0
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x6ct
        0x51t
        0x4bt
        0x9t
        0x3bt
        0x1at
    .end array-data
.end method

.method private static a0(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    if-eq p0, v1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    new-array p0, v0, [B

    .line 11
    .line 12
    fill-array-data p0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/16 p0, 0x8

    .line 21
    .line 22
    new-array p0, p0, [B

    .line 23
    .line 24
    fill-array-data p0, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    const/4 p0, 0x3

    .line 33
    new-array p0, p0, [B

    .line 34
    .line 35
    fill-array-data p0, :array_2

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    new-array p0, v1, [B

    .line 44
    .line 45
    fill-array-data p0, :array_3

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :array_0
    .array-data 1
        0x5et
        0x9t
        0x5ft
        0x52t
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 1
        0x47t
        0xft
        0x43t
        0x52t
        0xdt
        0x3t
        0x43t
        0x15t
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :array_2
    .array-data 1
        0x45t
        0x15t
        0x53t
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    :array_3
    .array-data 1
        0x51t
        0x5t
    .end array-data
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/xe5;->k:Landroid/net/LocalServerSocket;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    :try_start_0
    new-instance v0, Landroid/net/LocalServerSocket;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Ll/xe5;->k:Landroid/net/LocalServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return v1

    .line 19
    :catch_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method private static b0(Ljava/lang/String;ILandroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Landroid/telephony/TelephonyManager;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :try_start_0
    const-class v1, Landroid/telephony/TelephonyManager;

    .line 19
    .line 20
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, p0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    sget-object p1, Ll/xe5;->a:Ljava/lang/String;

    .line 51
    .line 52
    const/16 p2, 0x25

    .line 53
    .line 54
    new-array p2, p2, [B

    .line 55
    .line 56
    fill-array-data p2, :array_1

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    .line 65
    .line 66
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const-string v0, ""

    .line 70
    .line 71
    :goto_1
    return-object v0

    .line 72
    nop

    .line 73
    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    nop

    .line 81
    :array_1
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x34t
        0x54t
        0x51t
        0xdt
        0x3t
        0x48t
        0x2bt
        0x54t
        0x43t
        0x9t
        0x9t
        0x54t
        0x31t
        0x58t
        0x43t
        0x9t
        0x2ft
        0x54t
    .end array-data
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/xe5;->F0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/xe5;->s0(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/xe5;->E0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method private static c0(Landroid/hardware/camera2/CameraCharacteristics;Landroid/hardware/camera2/CameraCharacteristics$Key;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public static d(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 14

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const/16 v1, 0xa

    const/4 v2, 0x3

    .line 2
    :try_start_0
    new-array v1, v1, [B

    fill-array-data v1, :array_0

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ll/xiw;->b()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto/16 :goto_2b

    :catch_0
    move-exception v1

    .line 3
    :try_start_1
    sget-object v3, Ll/xe5;->a:Ljava/lang/String;

    const/16 v4, 0x17

    new-array v4, v4, [B

    fill-array-data v4, :array_1

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    const/16 v1, 0xa

    .line 4
    :try_start_2
    new-array v1, v1, [B

    fill-array-data v1, :array_2

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v1

    .line 5
    :try_start_3
    sget-object v3, Ll/xe5;->a:Ljava/lang/String;

    const/16 v4, 0x21

    new-array v4, v4, [B

    fill-array-data v4, :array_3

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    const/4 v1, 0x0

    const/4 v3, 0x4

    const/16 v4, 0xf

    .line 6
    :try_start_4
    new-array v3, v3, [B

    fill-array-data v3, :array_4

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v1}, Ll/xe5;->V(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    :catch_2
    move-exception v3

    .line 7
    :try_start_5
    sget-object v5, Ll/xe5;->a:Ljava/lang/String;

    new-array v6, v4, [B

    fill-array-data v6, :array_5

    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_2
    const/16 v3, 0x9

    const/16 v5, 0x13

    .line 8
    :try_start_6
    new-array v6, v3, [B

    fill-array-data v6, :array_6

    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ll/xe5;->l0()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    :catch_3
    move-exception v6

    .line 9
    :try_start_7
    sget-object v7, Ll/xe5;->a:Ljava/lang/String;

    new-array v8, v5, [B

    fill-array-data v8, :array_7

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 10
    :goto_3
    :try_start_8
    new-array v6, v3, [B

    fill-array-data v6, :array_8

    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ll/xe5;->B()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_4

    :catch_4
    move-exception v6

    .line 11
    :try_start_9
    sget-object v7, Ll/xe5;->a:Ljava/lang/String;

    new-array v8, v5, [B

    fill-array-data v8, :array_9

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :goto_4
    const/16 v6, 0xa

    const/16 v7, 0x15

    .line 12
    :try_start_a
    new-array v6, v6, [B

    fill-array-data v6, :array_a

    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0}, Ll/xe5;->C(Landroid/content/Context;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v0, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_5

    :catch_5
    move-exception v6

    .line 13
    :try_start_b
    sget-object v8, Ll/xe5;->a:Ljava/lang/String;

    new-array v9, v7, [B

    fill-array-data v9, :array_b

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :goto_5
    const/4 v6, 0x7

    .line 14
    :try_start_c
    new-array v8, v6, [B

    fill-array-data v8, :array_c

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0}, Ll/xe5;->w(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_6

    :catch_6
    move-exception v8

    .line 15
    :try_start_d
    sget-object v9, Ll/xe5;->a:Ljava/lang/String;

    const/16 v10, 0x16

    new-array v10, v10, [B

    fill-array-data v10, :array_d

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    :goto_6
    const/16 v8, 0xa

    const/16 v9, 0x14

    .line 16
    :try_start_e
    new-array v8, v8, [B

    fill-array-data v8, :array_e

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0}, Ll/xe5;->p0(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_7
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto :goto_7

    :catch_7
    move-exception v8

    .line 17
    :try_start_f
    sget-object v10, Ll/xe5;->a:Ljava/lang/String;

    new-array v11, v9, [B

    fill-array-data v11, :array_f

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    :goto_7
    const/16 v8, 0xb

    .line 18
    :try_start_10
    new-array v8, v8, [B

    fill-array-data v8, :array_10

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ll/xe5;->n0()Ljava/util/Map;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_8
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto :goto_8

    :catch_8
    move-exception v8

    .line 19
    :try_start_11
    sget-object v10, Ll/xe5;->a:Ljava/lang/String;

    const/16 v11, 0x16

    new-array v11, v11, [B

    fill-array-data v11, :array_11

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    :goto_8
    const/16 v8, 0xd

    .line 20
    :try_start_12
    new-array v8, v8, [B

    fill-array-data v8, :array_12

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0}, Ll/xe5;->A0(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_9
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto :goto_9

    :catch_9
    move-exception v8

    .line 21
    :try_start_13
    sget-object v10, Ll/xe5;->a:Ljava/lang/String;

    const/16 v11, 0x1d

    new-array v11, v11, [B

    fill-array-data v11, :array_13

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 22
    :goto_9
    :try_start_14
    new-array v8, v3, [B

    fill-array-data v8, :array_14

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ll/xe5;->Y()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_a
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    goto :goto_a

    :catch_a
    move-exception v8

    .line 23
    :try_start_15
    sget-object v10, Ll/xe5;->a:Ljava/lang/String;

    const/16 v11, 0x1b

    new-array v11, v11, [B

    fill-array-data v11, :array_15

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    :goto_a
    const/16 v8, 0xc

    .line 24
    :try_start_16
    new-array v8, v8, [B

    fill-array-data v8, :array_16

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ll/xe5;->E()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_b
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    goto :goto_b

    :catch_b
    move-exception v8

    .line 25
    :try_start_17
    new-array v10, v2, [B

    fill-array-data v10, :array_17

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x18

    new-array v12, v12, [B

    fill-array-data v12, :array_18

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    :goto_b
    const/16 v8, 0xc

    .line 26
    :try_start_18
    new-array v8, v8, [B

    fill-array-data v8, :array_19

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ll/xe5;->F()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_c
    .catchall {:try_start_18 .. :try_end_18} :catchall_0

    goto :goto_c

    :catch_c
    move-exception v8

    .line 27
    :try_start_19
    new-array v10, v2, [B

    fill-array-data v10, :array_1a

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x18

    new-array v12, v12, [B

    fill-array-data v12, :array_1b

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    .line 28
    :goto_c
    :try_start_1a
    new-array v8, v4, [B

    fill-array-data v8, :array_1c

    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Ll/xe5;->j0()Ljava/util/Map;

    move-result-object v10

    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_d
    .catchall {:try_start_1a .. :try_end_1a} :catchall_0

    goto :goto_d

    :catch_d
    move-exception v8

    .line 29
    :try_start_1b
    new-array v10, v2, [B

    fill-array-data v10, :array_1d

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x16

    new-array v12, v12, [B

    fill-array-data v12, :array_1e

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    :goto_d
    const/16 v8, 0x12

    .line 30
    :try_start_1c
    invoke-static {}, Ll/xe5;->L()[Ljava/lang/String;

    move-result-object v10

    .line 31
    new-array v11, v3, [B

    fill-array-data v11, :array_1f

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    aget-object v1, v10, v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0xa

    .line 32
    new-array v1, v1, [B

    fill-array-data v1, :array_20

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    const/4 v11, 0x1

    aget-object v10, v10, v11

    invoke-interface {v0, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_e
    .catchall {:try_start_1c .. :try_end_1c} :catchall_0

    goto :goto_e

    :catch_e
    move-exception v1

    .line 33
    :try_start_1d
    new-array v10, v2, [B

    fill-array-data v10, :array_21

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    new-array v12, v8, [B

    fill-array-data v12, :array_22

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v10, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    :goto_e
    const/16 v1, 0x8

    .line 34
    :try_start_1e
    new-array v10, v1, [B

    fill-array-data v10, :array_23

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ll/xe5;->K()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_f
    .catchall {:try_start_1e .. :try_end_1e} :catchall_0

    goto :goto_f

    :catch_f
    move-exception v10

    .line 35
    :try_start_1f
    new-array v11, v2, [B

    fill-array-data v11, :array_24

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    new-array v13, v8, [B

    fill-array-data v13, :array_25

    invoke-static {v13}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    .line 36
    :goto_f
    :try_start_20
    new-array v10, v1, [B

    fill-array-data v10, :array_26

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ll/xe5;->M()D

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_10
    .catchall {:try_start_20 .. :try_end_20} :catchall_0

    goto :goto_10

    :catch_10
    move-exception v10

    .line 37
    :try_start_21
    new-array v11, v2, [B

    fill-array-data v11, :array_27

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    new-array v13, v5, [B

    fill-array-data v13, :array_28

    invoke-static {v13}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_0

    :goto_10
    const/16 v10, 0xc

    .line 38
    :try_start_22
    new-array v10, v10, [B

    fill-array-data v10, :array_29

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {p0}, Ll/xe5;->G(Landroid/content/Context;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_11
    .catchall {:try_start_22 .. :try_end_22} :catchall_0

    goto :goto_11

    :catch_11
    move-exception v10

    .line 39
    :try_start_23
    new-array v11, v2, [B

    fill-array-data v11, :array_2a

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v13, 0x16

    new-array v13, v13, [B

    fill-array-data v13, :array_2b

    invoke-static {v13}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    :goto_11
    const/16 v10, 0xd

    .line 40
    :try_start_24
    new-array v10, v10, [B

    fill-array-data v10, :array_2c

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {p0}, Ll/xe5;->H(Landroid/content/Context;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_12
    .catchall {:try_start_24 .. :try_end_24} :catchall_0

    goto :goto_12

    :catch_12
    move-exception v10

    .line 41
    :try_start_25
    new-array v11, v2, [B

    fill-array-data v11, :array_2d

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    new-array v13, v7, [B

    fill-array-data v13, :array_2e

    invoke-static {v13}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    :goto_12
    const/16 v10, 0xa

    .line 42
    :try_start_26
    new-array v10, v10, [B

    fill-array-data v10, :array_2f

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ll/xe5;->D()Ljava/util/Map;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_13
    .catchall {:try_start_26 .. :try_end_26} :catchall_0

    goto :goto_13

    :catch_13
    move-exception v10

    .line 43
    :try_start_27
    new-array v11, v2, [B

    fill-array-data v11, :array_30

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    new-array v9, v9, [B

    fill-array-data v9, :array_31

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v11, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_0

    :goto_13
    const/16 v9, 0xd

    .line 44
    :try_start_28
    new-array v9, v9, [B

    fill-array-data v9, :array_32

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Ll/xe5;->S(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_14
    .catchall {:try_start_28 .. :try_end_28} :catchall_0

    goto :goto_14

    :catch_14
    move-exception v9

    .line 45
    :try_start_29
    new-array v10, v2, [B

    fill-array-data v10, :array_33

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x1a

    new-array v12, v12, [B

    fill-array-data v12, :array_34

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_0

    :goto_14
    const/16 v9, 0xd

    .line 46
    :try_start_2a
    new-array v9, v9, [B

    fill-array-data v9, :array_35

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Ll/xe5;->n(Landroid/content/Context;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_15
    .catchall {:try_start_2a .. :try_end_2a} :catchall_0

    goto :goto_15

    :catch_15
    move-exception v9

    .line 47
    :try_start_2b
    new-array v10, v2, [B

    fill-array-data v10, :array_36

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x23

    new-array v12, v12, [B

    fill-array-data v12, :array_37

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_0

    :goto_15
    const/16 v9, 0xe

    .line 48
    :try_start_2c
    new-array v9, v9, [B

    fill-array-data v9, :array_38

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Ll/xe5;->y(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_16
    .catchall {:try_start_2c .. :try_end_2c} :catchall_0

    goto :goto_16

    :catch_16
    move-exception v9

    .line 49
    :try_start_2d
    new-array v10, v2, [B

    fill-array-data v10, :array_39

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x18

    new-array v12, v12, [B

    fill-array-data v12, :array_3a

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_0

    .line 50
    :goto_16
    :try_start_2e
    new-array v9, v3, [B

    fill-array-data v9, :array_3b

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Ll/xe5;->p(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_17
    .catchall {:try_start_2e .. :try_end_2e} :catchall_0

    goto :goto_17

    :catch_17
    move-exception v9

    .line 51
    :try_start_2f
    new-array v10, v2, [B

    fill-array-data v10, :array_3c

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x16

    new-array v12, v12, [B

    fill-array-data v12, :array_3d

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_0

    .line 52
    :goto_17
    :try_start_30
    new-array v9, v5, [B

    fill-array-data v9, :array_3e

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0}, Ll/xe5;->W(Landroid/content/Context;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_18
    .catchall {:try_start_30 .. :try_end_30} :catchall_0

    goto :goto_18

    :catch_18
    move-exception v9

    .line 53
    :try_start_31
    new-array v10, v2, [B

    fill-array-data v10, :array_3f

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v12, 0x18

    new-array v12, v12, [B

    fill-array-data v12, :array_40

    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_0

    .line 54
    :goto_18
    :try_start_32
    new-array v3, v3, [B

    fill-array-data v3, :array_41

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->d0(Landroid/content/Context;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_19
    .catchall {:try_start_32 .. :try_end_32} :catchall_0

    goto :goto_19

    :catch_19
    move-exception v3

    .line 55
    :try_start_33
    new-array v9, v2, [B

    fill-array-data v9, :array_42

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    new-array v11, v5, [B

    fill-array-data v11, :array_43

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_0

    :goto_19
    const/16 v3, 0xe

    .line 56
    :try_start_34
    new-array v3, v3, [B

    fill-array-data v3, :array_44

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ll/xiw;->a()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Ll/xe5;->g0(Landroid/content/Context;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_1a
    .catchall {:try_start_34 .. :try_end_34} :catchall_0

    goto :goto_1a

    :catch_1a
    move-exception v3

    .line 57
    :try_start_35
    new-array v9, v2, [B

    fill-array-data v9, :array_45

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x17

    new-array v11, v11, [B

    fill-array-data v11, :array_46

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_0

    :goto_1a
    const/16 v3, 0x10

    .line 58
    :try_start_36
    new-array v3, v3, [B

    fill-array-data v3, :array_47

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->D0(Landroid/content/Context;)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_36} :catch_1b
    .catchall {:try_start_36 .. :try_end_36} :catchall_0

    goto :goto_1b

    :catch_1b
    move-exception v3

    .line 59
    :try_start_37
    new-array v9, v2, [B

    fill-array-data v9, :array_48

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x16

    new-array v11, v11, [B

    fill-array-data v11, :array_49

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_0

    .line 60
    :goto_1b
    :try_start_38
    new-array v3, v1, [B

    fill-array-data v3, :array_4a

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->f0(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_38} :catch_1c
    .catchall {:try_start_38 .. :try_end_38} :catchall_0

    goto :goto_1c

    :catch_1c
    move-exception v3

    .line 61
    :try_start_39
    new-array v9, v2, [B

    fill-array-data v9, :array_4b

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x17

    new-array v11, v11, [B

    fill-array-data v11, :array_4c

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_0

    .line 62
    :goto_1c
    :try_start_3a
    new-array v3, v6, [B

    fill-array-data v3, :array_4d

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->c(Landroid/content/Context;)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3a} :catch_1d
    .catchall {:try_start_3a .. :try_end_3a} :catchall_0

    goto :goto_1d

    :catch_1d
    move-exception v3

    .line 63
    :try_start_3b
    new-array v9, v2, [B

    fill-array-data v9, :array_4e

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x11

    new-array v11, v11, [B

    fill-array-data v11, :array_4f

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_0

    :goto_1d
    const/16 v3, 0xe

    .line 64
    :try_start_3c
    new-array v3, v3, [B

    fill-array-data v3, :array_50

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ll/xe5;->T()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_3c} :catch_1e
    .catchall {:try_start_3c .. :try_end_3c} :catchall_0

    goto :goto_1e

    :catch_1e
    move-exception v3

    .line 65
    :try_start_3d
    new-array v9, v2, [B

    fill-array-data v9, :array_51

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x18

    new-array v11, v11, [B

    fill-array-data v11, :array_52

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_0

    .line 66
    :goto_1e
    :try_start_3e
    new-array v3, v1, [B

    fill-array-data v3, :array_53

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ll/xe5;->U()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_3e} :catch_1f
    .catchall {:try_start_3e .. :try_end_3e} :catchall_0

    goto :goto_1f

    :catch_1f
    move-exception v3

    .line 67
    :try_start_3f
    new-array v9, v2, [B

    fill-array-data v9, :array_54

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    new-array v11, v5, [B

    fill-array-data v11, :array_55

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3f
    .catchall {:try_start_3f .. :try_end_3f} :catchall_0

    :goto_1f
    const/16 v3, 0x1b

    .line 68
    :try_start_40
    new-array v3, v3, [B

    fill-array-data v3, :array_56

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->e(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_40} :catch_20
    .catchall {:try_start_40 .. :try_end_40} :catchall_0

    goto :goto_20

    :catch_20
    move-exception v3

    .line 69
    :try_start_41
    new-array v9, v2, [B

    fill-array-data v9, :array_57

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x17

    new-array v11, v11, [B

    fill-array-data v11, :array_58

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_41 .. :try_end_41} :catchall_0

    :goto_20
    const/16 v3, 0x19

    .line 70
    :try_start_42
    new-array v3, v3, [B

    fill-array-data v3, :array_59

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ll/xe5;->Q()Ljava/util/Map;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_42} :catch_21
    .catchall {:try_start_42 .. :try_end_42} :catchall_0

    goto :goto_21

    :catch_21
    move-exception v3

    .line 71
    :try_start_43
    new-array v9, v2, [B

    fill-array-data v9, :array_5a

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x17

    new-array v11, v11, [B

    fill-array-data v11, :array_5b

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_43
    .catchall {:try_start_43 .. :try_end_43} :catchall_0

    :goto_21
    const/16 v3, 0xd

    .line 72
    :try_start_44
    new-array v3, v3, [B

    fill-array-data v3, :array_5c

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ll/xe5;->o()Ljava/util/List;

    move-result-object v9

    invoke-interface {v0, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_44} :catch_22
    .catchall {:try_start_44 .. :try_end_44} :catchall_0

    goto :goto_22

    :catch_22
    move-exception v3

    .line 73
    :try_start_45
    new-array v9, v2, [B

    fill-array-data v9, :array_5d

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v11, 0x1c

    new-array v11, v11, [B

    fill-array-data v11, :array_5e

    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_45 .. :try_end_45} :catchall_0

    .line 74
    :goto_22
    :try_start_46
    new-array v3, v4, [B

    fill-array-data v3, :array_5f

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->q(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_46} :catch_23
    .catchall {:try_start_46 .. :try_end_46} :catchall_0

    goto :goto_23

    :catch_23
    move-exception v3

    .line 75
    :try_start_47
    new-array v4, v2, [B

    fill-array-data v4, :array_60

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v10, 0x18

    new-array v10, v10, [B

    fill-array-data v10, :array_61

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_47
    .catchall {:try_start_47 .. :try_end_47} :catchall_0

    .line 76
    :goto_23
    :try_start_48
    new-array v3, v1, [B

    fill-array-data v3, :array_62

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Ll/xe5;->m0(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_48} :catch_24
    .catchall {:try_start_48 .. :try_end_48} :catchall_0

    goto :goto_24

    :catch_24
    move-exception v3

    .line 77
    :try_start_49
    new-array v4, v2, [B

    fill-array-data v4, :array_63

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    new-array v10, v8, [B

    fill-array-data v10, :array_64

    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_49
    .catchall {:try_start_49 .. :try_end_49} :catchall_0

    .line 78
    :goto_24
    :try_start_4a
    new-array v1, v1, [B

    fill-array-data v1, :array_65

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ll/xe5;->r(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4a} :catch_25
    .catchall {:try_start_4a .. :try_end_4a} :catchall_0

    goto :goto_25

    :catch_25
    move-exception v1

    .line 79
    :try_start_4b
    new-array v3, v2, [B

    fill-array-data v3, :array_66

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    new-array v9, v8, [B

    fill-array-data v9, :array_67

    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4b
    .catchall {:try_start_4b .. :try_end_4b} :catchall_0

    :goto_25
    const/16 v1, 0xd

    .line 80
    :try_start_4c
    new-array v1, v1, [B

    fill-array-data v1, :array_68

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ll/xe5;->b(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4c} :catch_26
    .catchall {:try_start_4c .. :try_end_4c} :catchall_0

    goto :goto_26

    :catch_26
    move-exception p0

    .line 81
    :try_start_4d
    new-array v1, v2, [B

    fill-array-data v1, :array_69

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x1e

    new-array v4, v4, [B

    fill-array-data v4, :array_6a

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4d
    .catchall {:try_start_4d .. :try_end_4d} :catchall_0

    :goto_26
    const/16 p0, 0xb

    .line 82
    :try_start_4e
    new-array p0, p0, [B

    fill-array-data p0, :array_6b

    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ll/xe5;->h0()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_4e} :catch_27
    .catchall {:try_start_4e .. :try_end_4e} :catchall_0

    goto :goto_27

    :catch_27
    move-exception p0

    .line 83
    :try_start_4f
    new-array v1, v2, [B

    fill-array-data v1, :array_6c

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-array v4, v7, [B

    fill-array-data v4, :array_6d

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4f
    .catchall {:try_start_4f .. :try_end_4f} :catchall_0

    :goto_27
    const/16 p0, 0x11

    .line 84
    :try_start_50
    new-array p0, p0, [B

    fill-array-data p0, :array_6e

    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ll/xe5;->x0()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_50} :catch_28
    .catchall {:try_start_50 .. :try_end_50} :catchall_0

    goto :goto_28

    :catch_28
    move-exception p0

    .line 85
    :try_start_51
    new-array v1, v2, [B

    fill-array-data v1, :array_6f

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x17

    new-array v4, v4, [B

    fill-array-data v4, :array_70

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_51
    .catchall {:try_start_51 .. :try_end_51} :catchall_0

    .line 86
    :goto_28
    :try_start_52
    new-array p0, v8, [B

    fill-array-data p0, :array_71

    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ll/xe5;->Z()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_52
    .catchall {:try_start_52 .. :try_end_52} :catchall_1

    goto :goto_29

    :catchall_1
    move-exception p0

    .line 87
    :try_start_53
    new-array v1, v2, [B

    fill-array-data v1, :array_72

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x1b

    new-array v4, v4, [B

    fill-array-data v4, :array_73

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catchall {:try_start_53 .. :try_end_53} :catchall_0

    .line 88
    :goto_29
    :try_start_54
    new-array p0, v5, [B

    fill-array-data p0, :array_74

    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ll/xe5;->q0()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_54
    .catchall {:try_start_54 .. :try_end_54} :catchall_2

    goto :goto_2a

    :catchall_2
    move-exception p0

    .line 89
    :try_start_55
    new-array v1, v2, [B

    fill-array-data v1, :array_75

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x1c

    new-array v4, v4, [B

    fill-array-data v4, :array_76

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_0

    .line 90
    :goto_2a
    :try_start_56
    new-array p0, v6, [B

    fill-array-data p0, :array_77

    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ll/xe5;->X()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_56} :catch_29
    .catchall {:try_start_56 .. :try_end_56} :catchall_0

    goto :goto_2c

    :catch_29
    move-exception p0

    .line 91
    :try_start_57
    new-array v1, v2, [B

    fill-array-data v1, :array_78

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x19

    new-array v4, v4, [B

    fill-array-data v4, :array_79

    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_57
    .catchall {:try_start_57 .. :try_end_57} :catchall_0

    goto :goto_2c

    .line 92
    :goto_2b
    new-array v1, v2, [B

    fill-array-data v1, :array_7a

    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x19

    new-array v3, v3, [B

    fill-array-data v3, :array_7b

    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :goto_2c
    invoke-static {v0}, Ll/f2j0;->d(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    nop

    :array_0
    .array-data 1
        0x43t
        0x2t
        0x5at
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data

    nop

    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x17t
        0x32t
        0x22t
        0x7bt
        0x46t
        0x47t
        0x52t
        0x13t
        0x15t
        0x59t
        0x9t
        0x5ft
        0xdt
        0x41t
    .end array-data

    :array_2
    .array-data 1
        0x5ft
        0x15t
        0x6et
        0x41t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x17t
        0x23t
        0x13t
        0x59t
        0xat
        0x55t
        0x19t
        0x37t
        0x23t
        0x62t
        0x35t
        0x78t
        0x78t
        0x2ft
        0x48t
        0x62t
        0x23t
        0x7dt
        0x72t
        0x20t
        0x35t
        0x75t
        0x5ct
        0x11t
    .end array-data

    nop

    :array_4
    .array-data 1
        0x5dt
        0x3t
        0x58t
        0x53t
    .end array-data

    :array_5
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7at
        0x4t
        0xft
        0x54t
        0x5ct
        0x11t
    .end array-data

    :array_6
    .array-data 1
        0x44t
        0xft
        0x5ct
        0x52t
        0x3et
        0x1ct
        0x5ft
        0x8t
        0x54t
    .end array-data

    nop

    :array_7
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x63t
        0x8t
        0xbt
        0x55t
        0x3ct
        0x5et
        0x59t
        0x4t
        0x5ct
        0x10t
    .end array-data

    :array_8
    .array-data 1
        0x52t
        0x9t
        0x5et
        0x43t
        0x3et
        0x12t
        0x59t
        0xbt
        0x54t
    .end array-data

    nop

    :array_9
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0xet
        0x9t
        0x44t
        0x32t
        0x58t
        0x5at
        0x4t
        0x5ct
        0x10t
    .end array-data

    :array_a
    .array-data 1
        0x52t
        0x14t
        0x58t
        0x50t
        0x9t
        0x12t
        0x5et
        0x3t
        0x42t
        0x44t
    .end array-data

    nop

    :array_b
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0x13t
        0xft
        0x57t
        0xet
        0x45t
        0x59t
        0x4t
        0x15t
        0x43t
        0x5ct
        0x11t
    .end array-data

    nop

    :array_c
    .array-data 1
        0x52t
        0x7t
        0x45t
        0x43t
        0x4t
        0x14t
        0x49t
    .end array-data

    :array_d
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0x0t
        0x12t
        0x44t
        0x3t
        0x43t
        0x4et
        0x28t
        0x8t
        0x56t
        0x9t
        0xbt
        0x17t
    .end array-data

    nop

    :array_e
    .array-data 1
        0x45t
        0x15t
        0x54t
        0x45t
        0x3et
        0x7t
        0x57t
        0x3t
        0x5ft
        0x43t
    .end array-data

    nop

    :array_f
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x62t
        0x12t
        0x3t
        0x42t
        0x27t
        0x56t
        0x52t
        0xft
        0x12t
        0xat
        0x46t
    .end array-data

    :array_10
    .array-data 1
        0x5et
        0x3t
        0x45t
        0x68t
        0x15t
        0x14t
        0x51t
        0x0t
        0x57t
        0x5et
        0x2t
    .end array-data

    :array_11
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x63t
        0x13t
        0x7t
        0x56t
        0x0t
        0x58t
        0x54t
        0x12t
        0x2bt
        0x51t
        0x16t
        0xbt
        0x17t
    .end array-data

    nop

    :array_12
    .array-data 1
        0x5dt
        0x9t
        0x52t
        0x5ct
        0x3et
        0xat
        0x5ft
        0x5t
        0x50t
        0x43t
        0x8t
        0x9t
        0x5et
    .end array-data

    nop

    :array_13
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x59t
        0x15t
        0x7ct
        0x58t
        0x2t
        0xdt
        0x7ct
        0x9t
        0x52t
        0x56t
        0x15t
        0xft
        0x5ft
        0x8t
        0x74t
        0x59t
        0x0t
        0x4t
        0x5ct
        0x3t
        0x55t
        0xdt
        0x41t
    .end array-data

    nop

    :array_14
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0x2t
        0x9t
        0x45t
        0x8t
        0x45t
    .end array-data

    nop

    :array_15
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x79t
        0x14t
        0xbt
        0x52t
        0x3t
        0x43t
        0x78t
        0x7t
        0x25t
        0x60t
        0x33t
        0x72t
        0x58t
        0x13t
        0x3t
        0x43t
        0x5ct
        0x11t
    .end array-data

    :array_16
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0xct
        0x7t
        0x48t
        0x39t
        0x57t
        0x45t
        0x4t
        0x17t
    .end array-data

    :array_17
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_18
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x31t
        0x33t
        0x7dt
        0x7t
        0x49t
        0x71t
        0x13t
        0x3t
        0x41t
        0x2dt
        0x79t
        0x4dt
        0x5bt
        0x46t
    .end array-data

    :array_19
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0xct
        0xft
        0x5et
        0x39t
        0x57t
        0x45t
        0x4t
        0x17t
    .end array-data

    :array_1a
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_1b
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x31t
        0x33t
        0x7dt
        0xft
        0x5ft
        0x71t
        0x13t
        0x3t
        0x41t
        0x2dt
        0x79t
        0x4dt
        0x5bt
        0x46t
    .end array-data

    :array_1c
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0x15t
        0x3t
        0x5dt
        0x16t
        0x54t
        0x45t
        0x0t
        0x12t
        0x45t
        0x14t
        0x54t
    .end array-data

    :array_1d
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_1e
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x63t
        0x4t
        0xbt
        0x40t
        0x3t
        0x43t
        0x56t
        0x15t
        0x13t
        0x42t
        0x3t
        0xbt
        0x17t
    .end array-data

    nop

    :array_1f
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0xct
        0x9t
        0x54t
        0x3t
        0x5dt
    .end array-data

    nop

    :array_20
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0x17t
        0x3t
        0x5et
        0x2t
        0x5et
        0x45t
    .end array-data

    nop

    :array_21
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_22
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x11t
        0x13t
        0x79t
        0x8t
        0x57t
        0x58t
        0x5bt
        0x46t
    .end array-data

    nop

    :array_23
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0x0t
        0x14t
        0x53t
        0xet
    .end array-data

    :array_24
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_25
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x11t
        0x13t
        0x71t
        0x14t
        0x52t
        0x5ft
        0x5bt
        0x46t
    .end array-data

    nop

    :array_26
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x68t
        0xdt
        0x9t
        0x51t
        0x2t
    .end array-data

    :array_27
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_28
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x11t
        0x13t
        0x65t
        0x15t
        0x50t
        0x50t
        0x4t
        0x5ct
        0x10t
    .end array-data

    :array_29
    .array-data 1
        0x53t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
        0x6ft
        0x5t
        0x5et
        0x42t
        0xft
        0x12t
    .end array-data

    :array_2a
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_2b
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x0t
        0xbt
        0x55t
        0x14t
        0x50t
        0x74t
        0xet
        0x13t
        0x5et
        0x12t
        0xbt
        0x17t
    .end array-data

    nop

    :array_2c
    .array-data 1
        0x53t
        0x7t
        0x5ct
        0x52t
        0x13t
        0x7t
        0x6ft
        0x2t
        0x54t
        0x43t
        0x0t
        0xft
        0x5ct
    .end array-data

    nop

    :array_2d
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_2e
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x74t
        0x0t
        0xbt
        0x55t
        0x14t
        0x50t
        0x7bt
        0x8t
        0x15t
        0x44t
        0x5ct
        0x11t
    .end array-data

    nop

    :array_2f
    .array-data 1
        0x52t
        0x13t
        0x58t
        0x5bt
        0x5t
        0x39t
        0x59t
        0x8t
        0x57t
        0x58t
    .end array-data

    nop

    :array_30
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_31
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0x14t
        0xft
        0x5ct
        0x2t
        0x78t
        0x59t
        0x7t
        0x9t
        0xat
        0x46t
    .end array-data

    :array_32
    .array-data 1
        0x59t
        0x8t
        0x41t
        0x42t
        0x15t
        0x39t
        0x5dt
        0x3t
        0x45t
        0x5ft
        0xet
        0x2t
        0x43t
    .end array-data

    nop

    :array_33
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_34
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7et
        0xft
        0x16t
        0x45t
        0x12t
        0x7ct
        0x52t
        0x15t
        0xet
        0x5ft
        0x2t
        0x7dt
        0x5et
        0x12t
        0x12t
        0xat
        0x46t
    .end array-data

    nop

    :array_35
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0x59t
        0x4t
        0x58t
        0x5bt
        0x8t
        0x12t
        0x49t
    .end array-data

    nop

    :array_36
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_37
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x76t
        0x2t
        0x5t
        0x55t
        0x15t
        0x42t
        0x5et
        0x3t
        0xft
        0x5ct
        0xft
        0x45t
        0x4et
        0x32t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
        0x2at
        0x59t
        0x15t
        0x45t
        0xdt
        0x41t
    .end array-data

    :array_38
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x15t
        0x9t
        0x5ft
        0x12t
        0x59t
        0x68t
        0x8t
        0x8t
        0x56t
        0x9t
    .end array-data

    nop

    :array_39
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_3a
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0xdt
        0x13t
        0x55t
        0x12t
        0x5et
        0x58t
        0x15t
        0xet
        0x79t
        0x8t
        0x57t
        0x58t
        0x5bt
        0x46t
    .end array-data

    :array_3b
    .array-data 1
        0x53t
        0x3t
        0x5dt
        0x5bt
        0x3et
        0xft
        0x5et
        0x0t
        0x5et
    .end array-data

    nop

    :array_3c
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_3d
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x76t
        0xdt
        0xat
        0x73t
        0x3t
        0x5dt
        0x5bt
        0x28t
        0x8t
        0x56t
        0x9t
        0xbt
        0x17t
    .end array-data

    nop

    :array_3e
    .array-data 1
        0x5dt
        0x9t
        0x44t
        0x59t
        0x15t
        0x3t
        0x54t
        0x39t
        0x41t
        0x58t
        0x8t
        0x8t
        0x44t
        0x15t
        0x6et
        0x5bt
        0x8t
        0x15t
        0x44t
    .end array-data

    :array_3f
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_40
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7at
        0xet
        0x13t
        0x5et
        0x12t
        0x54t
        0x53t
        0x31t
        0x9t
        0x59t
        0x8t
        0x45t
        0x44t
        0x5bt
        0x46t
    .end array-data

    :array_41
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x68t
        0x2t
        0x9t
        0x45t
        0x8t
        0x45t
    .end array-data

    nop

    :array_42
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_43
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x64t
        0x8t
        0xbt
        0x73t
        0x9t
        0x44t
        0x59t
        0x15t
        0x5ct
        0x10t
    .end array-data

    :array_44
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x68t
        0x14t
        0x15t
        0x55t
        0x2t
        0x6et
        0x54t
        0xet
        0x13t
        0x5et
        0x12t
    .end array-data

    nop

    :array_45
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_46
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x64t
        0x8t
        0xbt
        0x65t
        0x15t
        0x54t
        0x53t
        0x22t
        0x9t
        0x45t
        0x8t
        0x45t
        0xdt
        0x41t
    .end array-data

    :array_47
    .array-data 1
        0x59t
        0x15t
        0x6et
        0x44t
        0x8t
        0xbt
        0x53t
        0x7t
        0x43t
        0x53t
        0x3et
        0x14t
        0x55t
        0x7t
        0x55t
        0x4et
    .end array-data

    :array_48
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_49
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x59t
        0x15t
        0x62t
        0x5et
        0xct
        0x25t
        0x51t
        0x14t
        0x55t
        0x65t
        0x4t
        0x7t
        0x54t
        0x1ft
        0xbt
        0x17t
    .end array-data

    nop

    :array_4a
    .array-data 1
        0x43t
        0xft
        0x5ct
        0x68t
        0x8t
        0x8t
        0x56t
        0x9t
    .end array-data

    :array_4b
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_4c
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x64t
        0x8t
        0xbt
        0x7dt
        0x13t
        0x5dt
        0x43t
        0x8t
        0x2ft
        0x5et
        0x0t
        0x5et
        0xdt
        0x41t
    .end array-data

    :array_4d
    .array-data 1
        0x59t
        0x15t
        0x6et
        0x45t
        0xet
        0x9t
        0x44t
    .end array-data

    :array_4e
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_4f
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x53t
        0xet
        0x54t
        0x54t
        0xat
        0x34t
        0x5ft
        0x9t
        0x45t
        0xdt
        0x41t
    .end array-data

    nop

    :array_50
    .array-data 1
        0x5bt
        0x3t
        0x43t
        0x59t
        0x4t
        0xat
        0x6ft
        0x10t
        0x54t
        0x45t
        0x12t
        0xft
        0x5ft
        0x8t
    .end array-data

    nop

    :array_51
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_52
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7ct
        0x4t
        0x14t
        0x5et
        0x3t
        0x5dt
        0x61t
        0x4t
        0x14t
        0x43t
        0xft
        0x5et
        0x59t
        0x5bt
        0x46t
    .end array-data

    :array_53
    .array-data 1
        0x5ct
        0x7t
        0x5ft
        0x50t
        0x14t
        0x7t
        0x57t
        0x3t
    .end array-data

    :array_54
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_55
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x7bt
        0x0t
        0x8t
        0x57t
        0x13t
        0x50t
        0x50t
        0x4t
        0x5ct
        0x10t
    .end array-data

    :array_56
    .array-data 1
        0x53t
        0x9t
        0x5dt
        0x5bt
        0x4t
        0x5t
        0x44t
        0x39t
        0x47t
        0x5et
        0x13t
        0x12t
        0x45t
        0x7t
        0x5dt
        0x68t
        0x8t
        0x8t
        0x56t
        0x9t
        0x6et
        0x53t
        0x4t
        0x12t
        0x51t
        0xft
        0x5dt
    .end array-data

    :array_57
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_58
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x71t
        0x8t
        0xat
        0x55t
        0x23t
        0x49t
        0x5et
        0x12t
        0x12t
        0x7dt
        0x7t
        0x41t
        0xdt
        0x41t
    .end array-data

    :array_59
    .array-data 1
        0x53t
        0x9t
        0x5dt
        0x5bt
        0x4t
        0x5t
        0x44t
        0x39t
        0x43t
        0x52t
        0x0t
        0xat
        0x6ft
        0xbt
        0x50t
        0x54t
        0x9t
        0xft
        0x5et
        0x3t
        0x6et
        0x5et
        0xft
        0x0t
        0x5ft
    .end array-data

    nop

    :array_5a
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_5b
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x71t
        0x8t
        0xat
        0x55t
        0x23t
        0x49t
        0x5et
        0x12t
        0x12t
        0x7dt
        0x7t
        0x41t
        0xdt
        0x41t
    .end array-data

    :array_5c
    .array-data 1
        0x44t
        0x5t
        0x41t
        0x68t
        0x11t
        0x9t
        0x42t
        0x12t
        0x6et
        0x5bt
        0x8t
        0x15t
        0x44t
    .end array-data

    nop

    :array_5d
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_5e
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x76t
        0x2t
        0x12t
        0x59t
        0x10t
        0x54t
        0x63t
        0x2t
        0x16t
        0x60t
        0x9t
        0x43t
        0x43t
        0x2dt
        0xft
        0x43t
        0x12t
        0xbt
        0x17t
    .end array-data

    :array_5f
    .array-data 1
        0x51t
        0xat
        0x5dt
        0x68t
        0x12t
        0x3t
        0x5et
        0x15t
        0x5et
        0x45t
        0x3et
        0xat
        0x59t
        0x15t
        0x45t
    .end array-data

    :array_60
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_61
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x76t
        0xdt
        0xat
        0x63t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
        0x7ct
        0xft
        0x42t
        0x43t
        0x5bt
        0x46t
    .end array-data

    :array_62
    .array-data 1
        0x44t
        0x9t
        0x41t
        0x68t
        0x15t
        0x7t
        0x43t
        0xdt
    .end array-data

    :array_63
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_64
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x63t
        0xet
        0x16t
        0x64t
        0x7t
        0x42t
        0x5ct
        0x5bt
        0x46t
    .end array-data

    nop

    :array_65
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x68t
        0x8t
        0x8t
        0x56t
        0x9t
    .end array-data

    :array_66
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_67
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x76t
        0x11t
        0x16t
        0x79t
        0x8t
        0x57t
        0x58t
        0x5bt
        0x46t
    .end array-data

    nop

    :array_68
    .array-data 1
        0x43t
        0x9t
        0x52t
        0x5ct
        0x4t
        0x12t
        0x6ft
        0x9t
        0x52t
        0x54t
        0x14t
        0x16t
        0x49t
    .end array-data

    nop

    :array_69
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_6a
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x53t
        0xet
        0x54t
        0x54t
        0xat
        0x2at
        0x5ft
        0x5t
        0x50t
        0x5bt
        0x32t
        0x3t
        0x42t
        0x10t
        0x54t
        0x45t
        0x32t
        0x9t
        0x53t
        0xdt
        0x54t
        0x43t
        0x5bt
        0x46t
    .end array-data

    nop

    :array_6b
    .array-data 1
        0x43t
        0x12t
        0x50t
        0x54t
        0xat
        0x39t
        0x44t
        0x14t
        0x50t
        0x54t
        0x4t
    .end array-data

    :array_6c
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_6d
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x64t
        0x15t
        0x7t
        0x53t
        0xdt
        0x65t
        0x45t
        0x0t
        0x5t
        0x55t
        0x5ct
        0x11t
    .end array-data

    nop

    :array_6e
    .array-data 1
        0x59t
        0x15t
        0x6et
        0x54t
        0x14t
        0x15t
        0x44t
        0x9t
        0x5ct
        0x5et
        0x1bt
        0x3t
        0x54t
        0x39t
        0x43t
        0x58t
        0xct
    .end array-data

    nop

    :array_6f
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_70
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x59t
        0x15t
        0x72t
        0x42t
        0x12t
        0x12t
        0x5ft
        0xbt
        0x58t
        0x4dt
        0x4t
        0x2t
        0x62t
        0x9t
        0x5ct
        0xdt
        0x41t
    .end array-data

    :array_71
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
        0x39t
        0x5dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x39t
        0x58t
        0x59t
        0x7t
        0x9t
    .end array-data

    nop

    :array_72
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_73
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x67t
        0x9t
        0x9t
        0x5et
        0x3t
        0x7ct
        0x56t
        0xft
        0x7t
        0x57t
        0x3t
        0x43t
        0x7et
        0xft
        0x0t
        0x5ft
        0x5ct
        0x11t
    .end array-data

    :array_74
    .array-data 1
        0x47t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x6ft
        0xbt
        0x50t
        0x59t
        0x0t
        0x1t
        0x55t
        0x14t
        0x6et
        0x5et
        0xft
        0x0t
        0x5ft
    .end array-data

    :array_75
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_76
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x60t
        0x8t
        0x8t
        0x54t
        0x9t
        0x46t
        0x7at
        0x0t
        0x8t
        0x51t
        0x1t
        0x54t
        0x45t
        0x28t
        0x8t
        0x56t
        0x9t
        0xbt
        0x17t
    .end array-data

    :array_77
    .array-data 1
        0x53t
        0x9t
        0x41t
        0x54t
        0xet
        0x2t
        0x55t
    .end array-data

    :array_78
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_79
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x79t
        0x0t
        0x12t
        0x59t
        0x10t
        0x54t
        0x71t
        0x14t
        0x8t
        0x53t
        0x2ft
        0x5ft
        0x51t
        0xet
        0x5ct
        0x10t
    .end array-data

    nop

    :array_7a
    .array-data 1
        0x64t
        0x27t
        0x76t
    .end array-data

    :array_7b
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x73t
        0x9t
        0x5dt
        0x5bt
        0x4t
        0x5t
        0x44t
        0x9t
        0x43t
        0x17t
        0x2t
        0x9t
        0x5ct
        0xat
        0x54t
        0x54t
        0x15t
        0x5ct
        0x10t
    .end array-data
.end method

.method public static d0(Landroid/content/Context;)I
    .locals 3

    .line 1
    const/16 v0, 0x1e

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :try_start_0
    new-array v0, v0, [B

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/telephony/SubscriptionManager;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoCountMax()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    const/4 v0, 0x5

    .line 29
    new-array v0, v0, [B

    .line 30
    .line 31
    fill-array-data v0, :array_1

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    .line 47
    .line 48
    .line 49
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return p0

    .line 51
    :cond_1
    return v1

    .line 52
    :goto_1
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 53
    .line 54
    const/16 v2, 0x21

    .line 55
    .line 56
    new-array v2, v2, [B

    .line 57
    .line 58
    fill-array-data v2, :array_2

    .line 59
    .line 60
    .line 61
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 66
    .line 67
    .line 68
    return v1

    .line 69
    :array_0
    .array-data 1
        0x44t
        0x3t
        0x5dt
        0x52t
        0x11t
        0xet
        0x5ft
        0x8t
        0x48t
        0x68t
        0x12t
        0x13t
        0x52t
        0x15t
        0x52t
        0x45t
        0x8t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x3et
        0x15t
        0x55t
        0x14t
        0x47t
        0x5et
        0x2t
        0x3t
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    nop

    .line 89
    :array_1
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    nop

    .line 97
    :array_2
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x12t
        0x58t
        0x59t
        0x6t
        0x46t
        0x63t
        0x2ft
        0x7ct
        0x17t
        0x2t
        0x9t
        0x45t
        0x8t
        0x45t
    .end array-data
.end method

.method public static e(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/xe5;->g(Ljava/util/Map;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/xe5;->h(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/xe5;->i(Landroid/content/Context;Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method private static e0(Landroid/content/Context;Ljava/util/List;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0x23

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    const/16 v0, 0x1e

    .line 21
    .line 22
    new-array v0, v0, [B

    .line 23
    .line 24
    fill-array-data v0, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/telephony/SubscriptionManager;

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Landroid/telephony/SubscriptionInfo;

    .line 61
    .line 62
    new-instance v2, Ll/xe5$i;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/xe5$i;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    iput v3, v2, Ll/xe5$i;->a:I

    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getCarrierName()Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Ljava/lang/String;

    .line 78
    .line 79
    iput-object v3, v2, Ll/xe5$i;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iput-object v3, v2, Ll/xe5$i;->e:Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    iput v3, v2, Ll/xe5$i;->b:I

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getCountryIso()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, v2, Ll/xe5$i;->f:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    .line 99
    :try_start_1
    iget v1, v2, Ll/xe5$i;->a:I

    .line 100
    .line 101
    invoke-static {v1, p0}, Ll/xe5;->R(ILandroid/content/Context;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v2, Ll/xe5$i;->c:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :catch_0
    move-exception v1

    .line 109
    :try_start_2
    sget-object v3, Ll/xe5;->a:Ljava/lang/String;

    .line 110
    .line 111
    const/16 v4, 0x36

    .line 112
    .line 113
    new-array v4, v4, [B

    .line 114
    .line 115
    fill-array-data v4, :array_2

    .line 116
    .line 117
    .line 118
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 123
    .line 124
    .line 125
    :goto_1
    invoke-virtual {v2}, Ll/xe5$i;->a()Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :catch_1
    move-exception p0

    .line 134
    sget-object p1, Ll/xe5;->a:Ljava/lang/String;

    .line 135
    .line 136
    const/16 v0, 0x2d

    .line 137
    .line 138
    new-array v0, v0, [B

    .line 139
    .line 140
    fill-array-data v0, :array_3

    .line 141
    .line 142
    .line 143
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    .line 149
    .line 150
    :cond_2
    :goto_2
    return-void

    .line 151
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x34t
        0x74t
        0x76t
        0x25t
        0x39t
        0x60t
        0x2et
        0x7et
        0x79t
        0x24t
        0x39t
        0x63t
        0x32t
        0x70t
        0x63t
        0x24t
    .end array-data

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_1
    .array-data 1
        0x44t
        0x3t
        0x5dt
        0x52t
        0x11t
        0xet
        0x5ft
        0x8t
        0x48t
        0x68t
        0x12t
        0x13t
        0x52t
        0x15t
        0x52t
        0x45t
        0x8t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x3et
        0x15t
        0x55t
        0x14t
        0x47t
        0x5et
        0x2t
        0x3t
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    nop

    .line 193
    :array_2
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x35t
        0x58t
        0x5at
        0x28t
        0x8t
        0x56t
        0x9t
        0x77t
        0x58t
        0x13t
        0x2at
        0x5ft
        0xat
        0x5dt
        0x5et
        0x11t
        0x9t
        0x40t
        0x27t
        0x5ft
        0x53t
        0x20t
        0x4t
        0x5ft
        0x10t
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x2ft
        0x5ct
        0x44t
        0x8t
        0x3et
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    nop

    .line 225
    :array_3
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x35t
        0x58t
        0x5at
        0x28t
        0x8t
        0x56t
        0x9t
        0x77t
        0x58t
        0x13t
        0x2at
        0x5ft
        0xat
        0x5dt
        0x5et
        0x11t
        0x9t
        0x40t
        0x27t
        0x5ft
        0x53t
        0x20t
        0x4t
        0x5ft
        0x10t
        0x54t
    .end array-data
.end method

.method private static f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/io/File;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_5

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    array-length v2, v1

    .line 32
    const/4 v3, 0x0

    .line 33
    move v4, v3

    .line 34
    :goto_0
    if-ge v4, v2, :cond_4

    .line 35
    .line 36
    aget-object v5, v1, v4

    .line 37
    .line 38
    if-eqz v5, :cond_3

    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    array-length v6, p1

    .line 51
    move v7, v3

    .line 52
    :goto_1
    if-ge v7, v6, :cond_3

    .line 53
    .line 54
    aget-object v8, p1, v7

    .line 55
    .line 56
    sget-object v9, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 57
    .line 58
    invoke-virtual {v8, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v9

    .line 62
    invoke-virtual {v5, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    if-eqz v9, :cond_2

    .line 67
    .line 68
    invoke-interface {v0, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    :cond_5
    :goto_2
    return-void
.end method

.method public static f0(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/xe5;->e0(Landroid/content/Context;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/f2j0;->f(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private static g(Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Ll/xe5;->h:[Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1, v2, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    new-array v1, v0, [B

    .line 18
    .line 19
    fill-array-data v1, :array_1

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v3, Ll/xe5;->i:[Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1, v3, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    fill-array-data v0, :array_2

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0, v2, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    const/16 v0, 0x10

    .line 44
    .line 45
    new-array v0, v0, [B

    .line 46
    .line 47
    fill-array-data v0, :array_3

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x4

    .line 55
    new-array v2, v1, [B

    .line 56
    .line 57
    fill-array-data v2, :array_4

    .line 58
    .line 59
    .line 60
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    new-array v3, v1, [B

    .line 65
    .line 66
    fill-array-data v3, :array_5

    .line 67
    .line 68
    .line 69
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const/16 v4, 0x9

    .line 74
    .line 75
    new-array v4, v4, [B

    .line 76
    .line 77
    fill-array-data v4, :array_6

    .line 78
    .line 79
    .line 80
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    filled-new-array {v2, v3, v4}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-static {v0, v2, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 89
    .line 90
    .line 91
    new-array v0, v1, [B

    .line 92
    .line 93
    fill-array-data v0, :array_7

    .line 94
    .line 95
    .line 96
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-array v2, v1, [B

    .line 101
    .line 102
    fill-array-data v2, :array_8

    .line 103
    .line 104
    .line 105
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    new-array v3, v1, [B

    .line 110
    .line 111
    fill-array-data v3, :array_9

    .line 112
    .line 113
    .line 114
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    const/16 v4, 0x9

    .line 119
    .line 120
    new-array v4, v4, [B

    .line 121
    .line 122
    fill-array-data v4, :array_a

    .line 123
    .line 124
    .line 125
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    const/4 v5, 0x6

    .line 130
    new-array v5, v5, [B

    .line 131
    .line 132
    fill-array-data v5, :array_b

    .line 133
    .line 134
    .line 135
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v0, v2, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 144
    .line 145
    .line 146
    const/16 v0, 0x13

    .line 147
    .line 148
    new-array v0, v0, [B

    .line 149
    .line 150
    fill-array-data v0, :array_c

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-array v2, v1, [B

    .line 158
    .line 159
    fill-array-data v2, :array_d

    .line 160
    .line 161
    .line 162
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    new-array v1, v1, [B

    .line 167
    .line 168
    fill-array-data v1, :array_e

    .line 169
    .line 170
    .line 171
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/4 v3, 0x3

    .line 176
    new-array v4, v3, [B

    .line 177
    .line 178
    fill-array-data v4, :array_f

    .line 179
    .line 180
    .line 181
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    const/4 v5, 0x7

    .line 186
    new-array v5, v5, [B

    .line 187
    .line 188
    fill-array-data v5, :array_10

    .line 189
    .line 190
    .line 191
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    const/16 v6, 0xa

    .line 196
    .line 197
    new-array v6, v6, [B

    .line 198
    .line 199
    fill-array-data v6, :array_11

    .line 200
    .line 201
    .line 202
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    filled-new-array {v2, v1, v4, v5, v6}, [Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-static {v0, v1, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 211
    .line 212
    .line 213
    const/16 v0, 0xd

    .line 214
    .line 215
    new-array v0, v0, [B

    .line 216
    .line 217
    fill-array-data v0, :array_12

    .line 218
    .line 219
    .line 220
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-array v1, v3, [B

    .line 225
    .line 226
    fill-array-data v1, :array_13

    .line 227
    .line 228
    .line 229
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    filled-new-array {v1}, [Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-static {v0, v1, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 238
    .line 239
    .line 240
    const/16 v0, 0xf

    .line 241
    .line 242
    new-array v0, v0, [B

    .line 243
    .line 244
    fill-array-data v0, :array_14

    .line 245
    .line 246
    .line 247
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-array v1, v3, [B

    .line 252
    .line 253
    fill-array-data v1, :array_15

    .line 254
    .line 255
    .line 256
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    filled-new-array {v1}, [Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {v0, v1, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 265
    .line 266
    .line 267
    const/16 v0, 0xc

    .line 268
    .line 269
    new-array v0, v0, [B

    .line 270
    .line 271
    fill-array-data v0, :array_16

    .line 272
    .line 273
    .line 274
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    const/4 v1, 0x5

    .line 279
    new-array v1, v1, [B

    .line 280
    .line 281
    fill-array-data v1, :array_17

    .line 282
    .line 283
    .line 284
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    const/16 v2, 0xe

    .line 289
    .line 290
    new-array v2, v2, [B

    .line 291
    .line 292
    fill-array-data v2, :array_18

    .line 293
    .line 294
    .line 295
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    invoke-static {v0, v1, p0}, Ll/xe5;->f(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)V

    .line 304
    .line 305
    .line 306
    invoke-static {p0}, Ll/xe5;->w0(Ljava/util/Map;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    nop

    .line 311
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x5dt
        0x5et
        0x3t
    .end array-data

    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    :array_1
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x15t
        0x3t
        0x5dt
        0x49t
        0x53t
        0x5et
        0xft
    .end array-data

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    :array_2
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0xbt
        0x5ft
        0x2t
        0x44t
        0x5bt
        0x4t
    .end array-data

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    :array_3
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x5t
        0x5ct
        0x7t
        0x42t
        0x44t
        0x4et
        0xbt
        0x59t
        0x15t
        0x52t
        0x18t
    .end array-data

    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    :array_4
    .array-data 1
        0x46t
        0x4t
        0x5et
        0x4ft
    .end array-data

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    :array_5
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
    .end array-data

    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    :array_6
    .array-data 1
        0x46t
        0xet
        0x5et
        0x44t
        0x15t
        0x4bt
        0x5et
        0x3t
        0x45t
    .end array-data

    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    nop

    .line 375
    :array_7
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
    .end array-data

    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    :array_8
    .array-data 1
        0x46t
        0x4t
        0x5et
        0x4ft
    .end array-data

    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    :array_9
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
    .end array-data

    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    :array_a
    .array-data 1
        0x46t
        0xet
        0x5et
        0x44t
        0x15t
        0x4bt
        0x5et
        0x3t
        0x45t
    .end array-data

    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    nop

    .line 403
    :array_b
    .array-data 1
        0x44t
        0x12t
        0x58t
        0x47t
        0x2t
        0x39t
    .end array-data

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    nop

    .line 411
    :array_c
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x39t
        0x6ft
        0x16t
        0x43t
        0x58t
        0x11t
        0x3t
        0x42t
        0x12t
        0x58t
        0x52t
        0x12t
        0x39t
        0x6ft
    .end array-data

    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    :array_d
    .array-data 1
        0x46t
        0x4t
        0x5et
        0x4ft
    .end array-data

    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    :array_e
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
    .end array-data

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    :array_f
    .array-data 1
        0x55t
        0x12t
        0x59t
    .end array-data

    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :array_10
    .array-data 1
        0x47t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x43t
    .end array-data

    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    :array_11
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x12t
        0x12t
        0x51t
        0x5t
        0x5at
        0x44t
    .end array-data

    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    nop

    .line 461
    :array_12
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x5et
        0x3t
        0x45t
        0x18t
        0x0t
        0x14t
        0x40t
    .end array-data

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    nop

    .line 473
    :array_13
    .array-data 1
        0x55t
        0x12t
        0x59t
    .end array-data

    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    :array_14
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x5et
        0x3t
        0x45t
        0x18t
        0x13t
        0x9t
        0x45t
        0x12t
        0x54t
    .end array-data

    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    :array_15
    .array-data 1
        0x55t
        0x12t
        0x59t
    .end array-data

    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    :array_16
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x15t
        0x5ft
        0x5t
        0x5at
        0x52t
        0x15t
        0x49t
    .end array-data

    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    :array_17
    .array-data 1
        0x41t
        0x3t
        0x5ct
        0x42t
        0x5t
    .end array-data

    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    nop

    .line 515
    :array_18
    .array-data 1
        0x52t
        0x7t
        0x42t
        0x52t
        0x3t
        0x7t
        0x5et
        0x2t
        0x6et
        0x50t
        0x4t
        0x8t
        0x49t
        0x2t
    .end array-data
.end method

.method public static g0(Landroid/content/Context;)I
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const/16 v0, 0x23

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/16 v0, 0x1e

    .line 21
    .line 22
    new-array v0, v0, [B

    .line 23
    .line 24
    fill-array-data v0, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/telephony/SubscriptionManager;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoCount()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_1
    const/4 v0, 0x5

    .line 45
    new-array v1, v0, [B

    .line 46
    .line 47
    fill-array-data v1, :array_2

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSimState()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    const/4 v3, 0x1

    .line 68
    if-ne v2, v0, :cond_2

    .line 69
    .line 70
    move v1, v3

    .line 71
    :cond_2
    :try_start_0
    const-class v2, Landroid/telephony/TelephonyManager;

    .line 72
    .line 73
    const/16 v4, 0xb

    .line 74
    .line 75
    new-array v4, v4, [B

    .line 76
    .line 77
    fill-array-data v4, :array_3

    .line 78
    .line 79
    .line 80
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 85
    .line 86
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    instance-of v2, p0, Ljava/lang/Integer;

    .line 107
    .line 108
    if-eqz v2, :cond_3

    .line 109
    .line 110
    check-cast p0, Ljava/lang/Integer;

    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    if-ne p0, v0, :cond_3

    .line 117
    .line 118
    const/4 p0, 0x2

    .line 119
    return p0

    .line 120
    :catch_0
    move-exception p0

    .line 121
    goto :goto_0

    .line 122
    :cond_3
    return v1

    .line 123
    :goto_0
    sget-object v0, Ll/xe5;->a:Ljava/lang/String;

    .line 124
    .line 125
    const/16 v2, 0x1b

    .line 126
    .line 127
    new-array v2, v2, [B

    .line 128
    .line 129
    fill-array-data v2, :array_4

    .line 130
    .line 131
    .line 132
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 137
    .line 138
    .line 139
    :cond_4
    return v1

    .line 140
    nop

    .line 141
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x34t
        0x74t
        0x76t
        0x25t
        0x39t
        0x60t
        0x2et
        0x7et
        0x79t
        0x24t
        0x39t
        0x63t
        0x32t
        0x70t
        0x63t
        0x24t
    .end array-data

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    :array_1
    .array-data 1
        0x44t
        0x3t
        0x5dt
        0x52t
        0x11t
        0xet
        0x5ft
        0x8t
        0x48t
        0x68t
        0x12t
        0x13t
        0x52t
        0x15t
        0x52t
        0x45t
        0x8t
        0x16t
        0x44t
        0xft
        0x5et
        0x59t
        0x3et
        0x15t
        0x55t
        0x14t
        0x47t
        0x5et
        0x2t
        0x3t
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    nop

    .line 183
    :array_2
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    nop

    .line 191
    :array_3
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x8t
        0xbt
        0x63t
        0x12t
        0x50t
        0x43t
        0x4t
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    :array_4
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x6t
        0x3t
        0x44t
        0x35t
        0x58t
        0x5at
        0x32t
        0x12t
        0x51t
        0x12t
        0x54t
    .end array-data
.end method

.method private static h(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x3

    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    fill-array-data v1, :array_1

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/16 v1, 0xa

    .line 26
    .line 27
    new-array v1, v1, [B

    .line 28
    .line 29
    fill-array-data v1, :array_2

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1, v0, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, 0x1

    .line 41
    if-eq v1, v2, :cond_0

    .line 42
    .line 43
    const/16 v1, 0x10

    .line 44
    .line 45
    new-array v1, v1, [B

    .line 46
    .line 47
    fill-array-data v1, :array_3

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1, v0, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void

    .line 58
    nop

    .line 59
    :array_0
    .array-data 1
        0x5dt
        0xbt
        0x52t
        0x55t
        0xdt
        0xdt
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    nop

    .line 67
    :array_1
    .array-data 1
        0x54t
        0xbt
        0x1ct
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_2
    .array-data 1
        0x1ft
        0x2t
        0x54t
        0x41t
        0x4et
        0x4t
        0x5ct
        0x9t
        0x52t
        0x5ct
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    nop

    .line 83
    :array_3
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x40t
        0x7t
        0x43t
        0x43t
        0x8t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x44t
    .end array-data
.end method

.method public static h0()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    :try_start_0
    new-instance v2, Ljava/lang/Exception;

    .line 8
    .line 9
    new-array v3, v1, [B

    .line 10
    .line 11
    fill-array-data v3, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :catch_0
    move-exception v2

    .line 23
    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    array-length v3, v2

    .line 28
    const/4 v4, 0x0

    .line 29
    :goto_0
    if-ge v4, v3, :cond_0

    .line 30
    .line 31
    aget-object v5, v2, v4

    .line 32
    .line 33
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    new-instance v7, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    new-array v8, v1, [B

    .line 47
    .line 48
    fill-array-data v8, :array_1

    .line 49
    .line 50
    .line 51
    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const/16 v6, 0x9

    .line 62
    .line 63
    new-array v6, v6, [B

    .line 64
    .line 65
    fill-array-data v6, :array_2

    .line 66
    .line 67
    .line 68
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    add-int/lit8 v4, v4, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    return-object v0

    .line 89
    :array_0
    .array-data 1
        0x54t
        0x3t
        0x45t
        0x52t
        0x2t
        0x12t
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    nop

    .line 97
    :array_1
    .array-data 1
        0x53t
        0xat
        0x50t
        0x4dt
        0x1bt
        0x5bt
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    nop

    .line 105
    :array_2
    .array-data 1
        0x4ct
        0x46t
        0x5ct
        0x52t
        0x15t
        0xet
        0x5ft
        0x2t
        0xct
    .end array-data
.end method

.method private static i(Landroid/content/Context;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-static {p0}, Ll/xe5;->W(Landroid/content/Context;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x9

    .line 14
    .line 15
    new-array v1, v1, [B

    .line 16
    .line 17
    fill-array-data v1, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    filled-new-array {v1}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/lang/String;

    .line 43
    .line 44
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v4, 0x0

    .line 51
    aget-object v4, v1, v4

    .line 52
    .line 53
    invoke-virtual {v4, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    :goto_1
    return-void

    .line 71
    :array_0
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x12t
        0x12t
        0x51t
        0x5t
        0x5at
    .end array-data
.end method

.method private static i0(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p0, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x5

    .line 11
    if-eq p0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x7

    .line 14
    new-array p0, p0, [B

    .line 15
    .line 16
    fill-array-data p0, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    new-array p0, v0, [B

    .line 25
    .line 26
    fill-array-data p0, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    const/16 p0, 0xc

    .line 35
    .line 36
    new-array p0, p0, [B

    .line 37
    .line 38
    fill-array-data p0, :array_2

    .line 39
    .line 40
    .line 41
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const/16 p0, 0xb

    .line 47
    .line 48
    new-array p0, p0, [B

    .line 49
    .line 50
    fill-array-data p0, :array_3

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_3
    const/16 p0, 0x8

    .line 59
    .line 60
    new-array p0, p0, [B

    .line 61
    .line 62
    fill-array-data p0, :array_4

    .line 63
    .line 64
    .line 65
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    nop

    .line 71
    :array_0
    .array-data 1
        0x45t
        0x8t
        0x5at
        0x59t
        0xet
        0x11t
        0x5et
    .end array-data

    :array_1
    .array-data 1
        0x56t
        0x13t
        0x5dt
        0x5bt
    .end array-data

    :array_2
    .array-data 1
        0x5et
        0x9t
        0x45t
        0x17t
        0x2t
        0xet
        0x51t
        0x14t
        0x56t
        0x5et
        0xft
        0x1t
    .end array-data

    :array_3
    .array-data 1
        0x54t
        0xft
        0x42t
        0x54t
        0x9t
        0x7t
        0x42t
        0x1t
        0x58t
        0x59t
        0x6t
    .end array-data

    :array_4
    .array-data 1
        0x53t
        0xet
        0x50t
        0x45t
        0x6t
        0xft
        0x5et
        0x1t
    .end array-data
.end method

.method private static j(I)F
    .locals 1

    .line 1
    if-lez p0, :cond_4

    .line 2
    .line 3
    const v0, 0x1312d00

    .line 4
    .line 5
    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const v0, 0x16e360

    .line 10
    .line 11
    .line 12
    if-le p0, v0, :cond_1

    .line 13
    .line 14
    int-to-float p0, p0

    .line 15
    const v0, 0x47c35000    # 100000.0f

    .line 16
    .line 17
    .line 18
    :goto_0
    div-float/2addr p0, v0

    .line 19
    return p0

    .line 20
    :cond_1
    const/16 v0, 0x3a98

    .line 21
    .line 22
    if-le p0, v0, :cond_2

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    const/16 v0, 0x96

    .line 29
    .line 30
    if-le p0, v0, :cond_3

    .line 31
    .line 32
    int-to-float p0, p0

    .line 33
    const/high16 v0, 0x41200000    # 10.0f

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    int-to-float p0, p0

    .line 37
    return p0

    .line 38
    :cond_4
    :goto_1
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public static j0()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xe5;->Y()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 14
    .line 15
    const/16 v4, 0x26

    .line 16
    .line 17
    new-array v4, v4, [B

    .line 18
    .line 19
    fill-array-data v4, :array_0

    .line 20
    .line 21
    .line 22
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const/4 v5, 0x5

    .line 39
    new-array v5, v5, [B

    .line 40
    .line 41
    fill-array-data v5, :array_1

    .line 42
    .line 43
    .line 44
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-static {v3, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v4}, Ll/xe5;->k0(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    return-object v0

    .line 71
    :array_0
    .array-data 1
        0x1ft
        0x15t
        0x48t
        0x44t
        0x4et
        0x5t
        0x5ct
        0x7t
        0x42t
        0x44t
        0x4et
        0x12t
        0x58t
        0x3t
        0x43t
        0x5at
        0x0t
        0xat
        0x1ft
        0x12t
        0x59t
        0x52t
        0x13t
        0xbt
        0x51t
        0xat
        0x6et
        0x4dt
        0xet
        0x8t
        0x55t
        0x43t
        0x55t
        0x18t
        0x15t
        0x3t
        0x5dt
        0x16t
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    nop

    .line 95
    :array_1
    .array-data 1
        0x53t
        0x16t
        0x44t
        0x12t
        0x5t
    .end array-data
.end method

.method public static k(Landroid/hardware/Sensor;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/Sensor;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    fill-array-data v2, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x6

    .line 24
    new-array v2, v2, [B

    .line 25
    .line 26
    fill-array-data v2, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x7

    .line 41
    new-array v2, v2, [B

    .line 42
    .line 43
    fill-array-data v2, :array_2

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getVersion()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-array v1, v1, [B

    .line 62
    .line 63
    fill-array-data v1, :array_3

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getType()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    const/16 v1, 0x8

    .line 82
    .line 83
    new-array v2, v1, [B

    .line 84
    .line 85
    fill-array-data v2, :array_4

    .line 86
    .line 87
    .line 88
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getMaximumRange()F

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    const/16 v2, 0xa

    .line 104
    .line 105
    new-array v2, v2, [B

    .line 106
    .line 107
    fill-array-data v2, :array_5

    .line 108
    .line 109
    .line 110
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getResolution()F

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    new-array v1, v1, [B

    .line 126
    .line 127
    fill-array-data v1, :array_6

    .line 128
    .line 129
    .line 130
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p0}, Landroid/hardware/Sensor;->getMinDelay()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    return-object v0

    .line 146
    nop

    .line 147
    :array_0
    .array-data 1
        0x5et
        0x7t
        0x5ct
        0x52t
    .end array-data

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 1
        0x46t
        0x3t
        0x5ft
        0x53t
        0xet
        0x14t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    nop

    .line 161
    :array_2
    .array-data 1
        0x46t
        0x3t
        0x43t
        0x44t
        0x8t
        0x9t
        0x5et
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :array_3
    .array-data 1
        0x44t
        0x1ft
        0x41t
        0x52t
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :array_4
    .array-data 1
        0x5dt
        0x7t
        0x49t
        0x65t
        0x0t
        0x8t
        0x57t
        0x3t
    .end array-data

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :array_5
    .array-data 1
        0x42t
        0x3t
        0x42t
        0x58t
        0xdt
        0x13t
        0x44t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    nop

    .line 193
    :array_6
    .array-data 1
        0x5dt
        0xft
        0x5ft
        0x73t
        0x4t
        0xat
        0x51t
        0x1ft
    .end array-data
.end method

.method private static k0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xe5;->J0(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ll/xe5;->j(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ll/xe5;->m(F)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private static l(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    const-string v1, "\n"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length v1, p0

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_0
    if-ge v2, v1, :cond_2

    .line 18
    .line 19
    aget-object v3, p0, v2

    .line 20
    .line 21
    sget-object v4, Ll/xe5;->j:Ljava/util/regex/Pattern;

    .line 22
    .line 23
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/16 v4, 0x10

    .line 39
    .line 40
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catch_0
    move-exception v3

    .line 53
    sget-object v4, Ll/xe5;->a:Ljava/lang/String;

    .line 54
    .line 55
    new-instance v5, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const/16 v6, 0x20

    .line 61
    .line 62
    new-array v6, v6, [B

    .line 63
    .line 64
    fill-array-data v6, :array_0

    .line 65
    .line 66
    .line 67
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    :goto_2
    return-object v0

    .line 88
    nop

    .line 89
    :array_0
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x4t
        0x1et
        0x44t
        0x14t
        0x50t
        0x54t
        0x15t
        0x32t
        0x53t
        0x16t
        0x61t
        0x58t
        0x13t
        0x12t
        0xat
        0x46t
    .end array-data
.end method

.method public static l0()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v2, v1}, Ljava/util/TimeZone;->getDisplayName(ZI)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object v0

    .line 12
    :catch_0
    const/4 v0, 0x4

    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    fill-array-data v0, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :array_0
    .array-data 1
        0x6t
        0x50t
        0x7t
        0x1t
    .end array-data
.end method

.method private static m(F)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p0, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 7
    .line 8
    const/4 v1, 0x7

    .line 9
    new-array v1, v1, [B

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :array_0
    .array-data 1
        0x15t
        0x48t
        0x0t
        0x51t
        -0x5dt
        -0x2at
        0x73t
    .end array-data
.end method

.method public static m0(Landroid/content/Context;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/app/ActivityManager;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v1}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 34
    .line 35
    invoke-static {p0}, Ll/wqq0;->a(Landroid/app/ActivityManager$RunningTaskInfo;)Landroid/content/ComponentName;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x4

    .line 42
    new-array v1, v1, [B

    .line 43
    .line 44
    fill-array-data v1, :array_1

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    new-array v1, v1, [B

    .line 60
    .line 61
    fill-array-data v1, :array_2

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    :cond_0
    return-object v0

    .line 76
    nop

    .line 77
    :array_0
    .array-data 1
        0x51t
        0x5t
        0x45t
        0x5et
        0x17t
        0xft
        0x44t
        0x1ft
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :array_1
    .array-data 1
        0x40t
        0x7t
        0x52t
        0x5ct
    .end array-data

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_2
    .array-data 1
        0x53t
        0xat
        0x50t
        0x44t
        0x12t
    .end array-data
.end method

.method public static n(Landroid/content/Context;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/16 v3, 0x15

    .line 12
    .line 13
    new-array v3, v3, [B

    .line 14
    .line 15
    fill-array-data v3, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v2
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v2

    .line 28
    sget-object v3, Ll/xe5;->a:Ljava/lang/String;

    .line 29
    .line 30
    const/16 v4, 0x2b

    .line 31
    .line 32
    new-array v4, v4, [B

    .line 33
    .line 34
    fill-array-data v4, :array_1

    .line 35
    .line 36
    .line 37
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    .line 43
    .line 44
    move v2, v1

    .line 45
    :goto_0
    const/4 v3, 0x1

    .line 46
    if-ne v2, v3, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/16 v2, 0x1e

    .line 53
    .line 54
    new-array v2, v2, [B

    .line 55
    .line 56
    fill-array-data v2, :array_2

    .line 57
    .line 58
    .line 59
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {p0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-eqz p0, :cond_0

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    new-array v0, v0, [B

    .line 71
    .line 72
    const/16 v2, 0xa

    .line 73
    .line 74
    aput-byte v2, v0, v1

    .line 75
    .line 76
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :cond_0
    return-object v0

    .line 89
    :array_0
    .array-data 1
        0x51t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0x59t
        0x4t
        0x58t
        0x5bt
        0x8t
        0x12t
        0x49t
        0x39t
        0x54t
        0x59t
        0x0t
        0x4t
        0x5ct
        0x3t
        0x55t
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    nop

    .line 105
    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x43t
        0x8t
        0x8t
        0x57t
        0x46t
        0x50t
        0x54t
        0x2t
        0x3t
        0x43t
        0x15t
        0x58t
        0x55t
        0x8t
        0xat
        0x59t
        0x12t
        0x48t
        0x17t
        0x4t
        0x8t
        0x51t
        0x4t
        0x5dt
        0x52t
        0x5t
        0x46t
        0x43t
        0x3t
        0x45t
        0x43t
        0x8t
        0x8t
        0x57t
    .end array-data

    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_2
    .array-data 1
        0x55t
        0x8t
        0x50t
        0x55t
        0xdt
        0x3t
        0x54t
        0x39t
        0x50t
        0x54t
        0x2t
        0x3t
        0x43t
        0x15t
        0x58t
        0x55t
        0x8t
        0xat
        0x59t
        0x12t
        0x48t
        0x68t
        0x12t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
        0x15t
    .end array-data
.end method

.method public static n0()Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/net/TrafficStats;->getMobileRxBytes()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {}, Landroid/net/TrafficStats;->getMobileTxBytes()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    invoke-static {}, Landroid/net/TrafficStats;->getTotalTxBytes()J

    .line 15
    .line 16
    .line 17
    move-result-wide v5

    .line 18
    invoke-static {}, Landroid/net/TrafficStats;->getTotalRxBytes()J

    .line 19
    .line 20
    .line 21
    move-result-wide v7

    .line 22
    const/16 v9, 0xd

    .line 23
    .line 24
    new-array v10, v9, [B

    .line 25
    .line 26
    fill-array-data v10, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    new-array v1, v9, [B

    .line 41
    .line 42
    fill-array-data v1, :array_1

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const/16 v1, 0xc

    .line 57
    .line 58
    new-array v2, v1, [B

    .line 59
    .line 60
    fill-array-data v2, :array_2

    .line 61
    .line 62
    .line 63
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    new-array v1, v1, [B

    .line 75
    .line 76
    fill-array-data v1, :array_3

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    return-object v0

    .line 91
    :array_0
    .array-data 1
        0x5dt
        0x9t
        0x53t
        0x5et
        0xdt
        0x3t
        0x62t
        0x1et
        0x73t
        0x4et
        0x15t
        0x3t
        0x43t
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    nop

    .line 103
    :array_1
    .array-data 1
        0x5dt
        0x9t
        0x53t
        0x5et
        0xdt
        0x3t
        0x64t
        0x1et
        0x73t
        0x4et
        0x15t
        0x3t
        0x43t
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    nop

    .line 115
    :array_2
    .array-data 1
        0x44t
        0x9t
        0x45t
        0x56t
        0xdt
        0x32t
        0x48t
        0x24t
        0x48t
        0x43t
        0x4t
        0x15t
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_3
    .array-data 1
        0x44t
        0x9t
        0x45t
        0x56t
        0xdt
        0x34t
        0x48t
        0x24t
        0x48t
        0x43t
        0x4t
        0x15t
    .end array-data
.end method

.method public static o()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/f2j0;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/xe5;->l(Ljava/lang/String;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0

    .line 21
    :array_0
    .array-data 1
        0x53t
        0x7t
        0x45t
        0x17t
        0x4et
        0x16t
        0x42t
        0x9t
        0x52t
        0x18t
        0xft
        0x3t
        0x44t
        0x49t
        0x45t
        0x54t
        0x11t
    .end array-data
.end method

.method public static o0()Ljava/lang/String;
    .locals 3

    .line 1
    const/16 v0, 0x15

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/f2j0;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/16 v0, 0x18

    .line 24
    .line 25
    new-array v0, v0, [B

    .line 26
    .line 27
    fill-array-data v0, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_0
    const/16 v1, 0xa

    .line 35
    .line 36
    new-array v1, v1, [B

    .line 37
    .line 38
    fill-array-data v1, :array_2

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    const/16 v0, 0x20

    .line 60
    .line 61
    new-array v0, v0, [B

    .line 62
    .line 63
    fill-array-data v0, :array_3

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    return-object v2

    .line 70
    :cond_1
    const/4 v1, 0x1

    .line 71
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Ll/xe5;->B0(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 86
    .line 87
    const/4 v2, 0x6

    .line 88
    new-array v2, v2, [B

    .line 89
    .line 90
    fill-array-data v2, :array_4

    .line 91
    .line 92
    .line 93
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    add-int/lit16 v0, v0, -0x2710

    .line 98
    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    return-object v0

    .line 112
    :cond_2
    const/16 v0, 0x14

    .line 113
    .line 114
    new-array v0, v0, [B

    .line 115
    .line 116
    fill-array-data v0, :array_5

    .line 117
    .line 118
    .line 119
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    return-object v2

    .line 123
    :array_0
    .array-data 1
        0x53t
        0x7t
        0x45t
        0x17t
        0x4et
        0x16t
        0x42t
        0x9t
        0x52t
        0x18t
        0x12t
        0x3t
        0x5ct
        0x0t
        0x1et
        0x54t
        0x6t
        0x14t
        0x5ft
        0x13t
        0x41t
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    nop

    .line 139
    :array_1
    .array-data 1
        0x73t
        0x1t
        0x43t
        0x58t
        0x14t
        0x16t
        0x10t
        0x5t
        0x5et
        0x59t
        0x15t
        0x3t
        0x5et
        0x12t
        0x11t
        0x5et
        0x12t
        0x46t
        0x55t
        0xbt
        0x41t
        0x43t
        0x18t
        0x48t
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_2
    .array-data 1
        0x1ft
        0x13t
        0x58t
        0x53t
        0x3et
        0x4et
        0x6ct
        0x2t
        0x1at
        0x1et
    .end array-data

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    nop

    .line 165
    :array_3
    .array-data 1
        0x65t
        0x2ft
        0x75t
        0x17t
        0xft
        0x9t
        0x44t
        0x46t
        0x57t
        0x58t
        0x14t
        0x8t
        0x54t
        0x46t
        0x58t
        0x59t
        0x41t
        0x5t
        0x57t
        0x14t
        0x5et
        0x42t
        0x11t
        0x46t
        0x53t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x48t
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :array_4
    .array-data 1
        0x45t
        0x56t
        0x6et
        0x56t
        0x44t
        0x2t
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    nop

    .line 193
    :array_5
    .array-data 1
        0x65t
        0x2ft
        0x75t
        0x17t
        0x8t
        0x15t
        0x10t
        0x8t
        0x5et
        0x43t
        0x41t
        0x7t
        0x10t
        0x8t
        0x44t
        0x5at
        0x3t
        0x3t
        0x42t
        0x48t
    .end array-data
.end method

.method public static declared-synchronized p(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 7

    .line 1
    const-class v0, Ll/xe5;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ll/xe5$g;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-direct {v1, v2}, Ll/xe5$g;-><init>(Ll/xe5$a;)V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ll/xe5$d;

    .line 11
    .line 12
    invoke-direct {v3, v2}, Ll/xe5$d;-><init>(Ll/xe5$a;)V

    .line 13
    .line 14
    .line 15
    new-instance v4, Ll/xe5$h;

    .line 16
    .line 17
    invoke-direct {v4, v2}, Ll/xe5$h;-><init>(Ll/xe5$a;)V

    .line 18
    .line 19
    .line 20
    new-instance v5, Ll/xe5$j;

    .line 21
    .line 22
    invoke-direct {v5, v2}, Ll/xe5$j;-><init>(Ll/xe5$a;)V

    .line 23
    .line 24
    .line 25
    const/16 v2, 0x29

    .line 26
    .line 27
    new-array v2, v2, [B

    .line 28
    .line 29
    fill-array-data v2, :array_0

    .line 30
    .line 31
    .line 32
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {p0, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    const/16 v2, 0x27

    .line 43
    .line 44
    new-array v2, v2, [B

    .line 45
    .line 46
    fill-array-data v2, :array_1

    .line 47
    .line 48
    .line 49
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {p0, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto/16 :goto_2

    .line 62
    .line 63
    :cond_0
    :goto_0
    const/4 v2, 0x5

    .line 64
    new-array v2, v2, [B

    .line 65
    .line 66
    fill-array-data v2, :array_2

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 78
    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    const/4 v6, 0x1

    .line 86
    if-eq v2, v6, :cond_1

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    const/4 v6, 0x2

    .line 93
    if-ne v2, v6, :cond_2

    .line 94
    .line 95
    :cond_1
    invoke-static {p0, v1, v3, v4, v5}, Ll/xe5;->G0(Landroid/telephony/TelephonyManager;Ll/xe5$g;Ll/xe5$d;Ll/xe5$h;Ll/xe5$j;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    new-instance p0, Lorg/json/JSONObject;

    .line 99
    .line 100
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    .line 102
    .line 103
    const/16 v2, 0xc

    .line 104
    .line 105
    :try_start_1
    new-array v2, v2, [B

    .line 106
    .line 107
    fill-array-data v2, :array_3

    .line 108
    .line 109
    .line 110
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1}, Ll/xe5$g;->a()Lorg/json/JSONObject;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    const/16 v1, 0xd

    .line 122
    .line 123
    new-array v1, v1, [B

    .line 124
    .line 125
    fill-array-data v1, :array_4

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v3}, Ll/xe5$d;->a()Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    const/16 v1, 0xe

    .line 140
    .line 141
    new-array v1, v1, [B

    .line 142
    .line 143
    fill-array-data v1, :array_5

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v5}, Ll/xe5$j;->a()Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    const/16 v1, 0xc

    .line 158
    .line 159
    new-array v1, v1, [B

    .line 160
    .line 161
    fill-array-data v1, :array_6

    .line 162
    .line 163
    .line 164
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v4}, Ll/xe5$h;->a()Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :catch_0
    move-exception v1

    .line 177
    :try_start_2
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 178
    .line 179
    const/16 v3, 0x1c

    .line 180
    .line 181
    new-array v3, v3, [B

    .line 182
    .line 183
    fill-array-data v3, :array_7

    .line 184
    .line 185
    .line 186
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    .line 192
    .line 193
    :goto_1
    monitor-exit v0

    .line 194
    return-object p0

    .line 195
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    throw p0

    .line 197
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x72t
        0x78t
        0x20t
        0x34t
        0x63t
        0x23t
        0x6et
        0x7bt
        0x2et
        0x25t
        0x71t
        0x32t
        0x78t
        0x78t
        0x2ft
    .end array-data

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    nop

    .line 223
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x27t
        0x72t
        0x74t
        0x24t
        0x35t
        0x63t
        0x39t
        0x77t
        0x7et
        0x2ft
        0x23t
        0x6ft
        0x2at
        0x7et
        0x74t
        0x20t
        0x32t
        0x79t
        0x29t
        0x7ft
    .end array-data

    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    :array_2
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    nop

    .line 255
    :array_3
    .array-data 1
        0x57t
        0x15t
        0x5ct
        0x68t
        0x2t
        0x3t
        0x5ct
        0xat
        0x58t
        0x59t
        0x7t
        0x9t
    .end array-data

    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    :array_4
    .array-data 1
        0x53t
        0x2t
        0x5ct
        0x56t
        0x3et
        0x5t
        0x55t
        0xat
        0x5dt
        0x5et
        0xft
        0x0t
        0x5ft
    .end array-data

    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    nop

    .line 277
    :array_5
    .array-data 1
        0x47t
        0x5t
        0x55t
        0x5at
        0x0t
        0x39t
        0x53t
        0x3t
        0x5dt
        0x5bt
        0x8t
        0x8t
        0x56t
        0x9t
    .end array-data

    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    nop

    .line 289
    :array_6
    .array-data 1
        0x5ct
        0x12t
        0x54t
        0x68t
        0x2t
        0x3t
        0x5ct
        0xat
        0x58t
        0x59t
        0x7t
        0x9t
    .end array-data

    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    :array_7
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x53t
        0x14t
        0x54t
        0x56t
        0x15t
        0xft
        0x5et
        0x1t
        0x11t
        0x7dt
        0x32t
        0x29t
        0x7et
        0x46t
        0x5et
        0x55t
        0xbt
        0x3t
        0x53t
        0x12t
        0xbt
        0x17t
    .end array-data
.end method

.method public static p0(Landroid/content/Context;)Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Ll/xe5;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v0, Ll/xe5;->c:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    sget-object v1, Ll/xe5;->b:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    return-object v1

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_4

    .line 17
    :cond_1
    :try_start_1
    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    const/16 p0, 0xa

    .line 23
    .line 24
    :try_start_2
    new-array p0, p0, [B

    .line 25
    .line 26
    fill-array-data p0, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, ""

    .line 34
    .line 35
    invoke-static {p0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v3, v2

    .line 53
    :goto_1
    if-ge v2, v3, :cond_5

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    const/16 v5, 0x1f

    .line 60
    .line 61
    if-le v4, v5, :cond_4

    .line 62
    .line 63
    const/16 v5, 0x7f

    .line 64
    .line 65
    if-lt v4, v5, :cond_3

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_4
    :goto_2
    const/4 v5, 0x6

    .line 73
    new-array v5, v5, [B

    .line 74
    .line 75
    fill-array-data v5, :array_1

    .line 76
    .line 77
    .line 78
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sput-object p0, Ll/xe5;->b:Ljava/lang/String;

    .line 105
    .line 106
    sget-object p0, Ll/xe5;->b:Ljava/lang/String;

    .line 107
    .line 108
    monitor-exit v0

    .line 109
    return-object p0

    .line 110
    :goto_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    throw p0

    .line 112
    nop

    .line 113
    :array_0
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x4ft
        0x7t
        0x57t
        0x3t
        0x5ft
        0x43t
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    nop

    .line 123
    :array_1
    .array-data 1
        0x6ct
        0x13t
        0x14t
        0x7t
        0x55t
        0x1et
    .end array-data
.end method

.method public static q(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ll/xe5;->a:Ljava/lang/String;

    .line 9
    .line 10
    const/16 v1, 0x2d

    .line 11
    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    fill-array-data v1, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    const/4 v1, 0x6

    .line 26
    new-array v1, v1, [B

    .line 27
    .line 28
    fill-array-data v1, :array_1

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Landroid/hardware/SensorManager;

    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Ll/xe5;->a:Ljava/lang/String;

    .line 44
    .line 45
    const/16 v1, 0x33

    .line 46
    .line 47
    new-array v1, v1, [B

    .line 48
    .line 49
    fill-array-data v1, :array_2

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_1
    const/4 v1, -0x1

    .line 61
    invoke-virtual {p0, v1}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Landroid/hardware/Sensor;

    .line 80
    .line 81
    invoke-static {v1}, Ll/xe5;->k(Landroid/hardware/Sensor;)Ljava/util/Map;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    return-object v0

    .line 90
    nop

    .line 91
    :array_0
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x1et
        0x44t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
        0x1bt
        0x41t
        0x14t
        0x55t
        0x12t
        0x44t
        0x45t
        0xft
        0xft
        0x5et
        0x1t
        0x11t
        0x52t
        0xct
        0x16t
        0x44t
        0x1ft
        0x11t
        0x44t
        0x4t
        0x8t
        0x43t
        0x9t
        0x43t
        0x17t
        0xdt
        0xft
        0x43t
        0x12t
        0x1ft
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    nop

    .line 119
    :array_1
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    nop

    .line 127
    :array_2
    .array-data 1
        0x63t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x46t
        0x58t
        0x44t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
        0x1bt
        0x41t
        0x14t
        0x55t
        0x12t
        0x44t
        0x45t
        0xft
        0xft
        0x5et
        0x1t
        0x11t
        0x52t
        0xct
        0x16t
        0x44t
        0x1ft
        0x11t
        0x44t
        0x4t
        0x8t
        0x43t
        0x9t
        0x43t
        0x17t
        0xdt
        0xft
        0x43t
        0x12t
        0x1ft
    .end array-data
.end method

.method public static q0()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/qre0;->a()Ll/qre0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/qre0;->d()Ll/pkq0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :try_start_0
    invoke-virtual {v1}, Ll/pkq0;->a()Landroid/os/IBinder;

    .line 15
    .line 16
    .line 17
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    const/16 v2, 0x15

    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    :try_start_1
    new-array v2, v2, [B

    .line 25
    .line 26
    fill-array-data v2, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    array-length v4, v2

    .line 53
    if-lez v4, :cond_0

    .line 54
    .line 55
    const/16 v4, 0x17

    .line 56
    .line 57
    new-array v4, v4, [B

    .line 58
    .line 59
    fill-array-data v4, :array_1

    .line 60
    .line 61
    .line 62
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const/4 v5, 0x0

    .line 67
    aget-object v2, v2, v5

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    const/16 v2, 0x17

    .line 80
    .line 81
    new-array v2, v2, [B

    .line 82
    .line 83
    fill-array-data v2, :array_2

    .line 84
    .line 85
    .line 86
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/4 v2, 0x6

    .line 102
    new-array v2, v2, [B

    .line 103
    .line 104
    fill-array-data v2, :array_3

    .line 105
    .line 106
    .line 107
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    :cond_1
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    return-object v0

    .line 121
    :cond_2
    new-array v1, v2, [B

    .line 122
    .line 123
    fill-array-data v1, :array_4

    .line 124
    .line 125
    .line 126
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    :goto_1
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 135
    .line 136
    new-instance v3, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const/16 v4, 0x22

    .line 142
    .line 143
    new-array v4, v4, [B

    .line 144
    .line 145
    fill-array-data v4, :array_5

    .line 146
    .line 147
    .line 148
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    return-object v0

    .line 166
    nop

    .line 167
    :array_0
    .array-data 1
        0x67t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x4bt
        0x78t
        0x75t
        0x8t
        0x8t
        0x54t
        0x3t
        0x43t
    .end array-data

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    nop

    .line 183
    :array_1
    .array-data 1
        0x67t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x4bt
        0x78t
        0x59t
        0x15t
        0x3t
        0x42t
        0x0t
        0x50t
        0x54t
        0x4t
    .end array-data

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_2
    .array-data 1
        0x67t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x4bt
        0x78t
        0x59t
        0x15t
        0x3t
        0x42t
        0x0t
        0x50t
        0x54t
        0x4t
    .end array-data

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    :array_3
    .array-data 1
        0x5ct
        0x9t
        0x50t
        0x53t
        0x4t
        0x14t
    .end array-data

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    nop

    .line 223
    :array_4
    .array-data 1
        0x67t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
        0x4bt
        0x78t
        0x75t
        0x8t
        0x8t
        0x54t
        0x3t
        0x43t
    .end array-data

    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    nop

    .line 239
    :array_5
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x67t
        0xet
        0x58t
        0x5bt
        0x4t
        0x46t
        0x57t
        0x3t
        0x45t
        0x60t
        0x8t
        0x8t
        0x54t
        0x9t
        0x46t
        0x7at
        0x0t
        0x8t
        0x51t
        0x1t
        0x54t
        0x45t
        0x28t
        0x8t
        0x56t
        0x9t
        0xbt
        0x17t
    .end array-data
.end method

.method public static r(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Ll/xe5$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xe5$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/xe5$b;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Ll/xe5;->o0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Ll/xe5$b;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Ll/xe5;->s(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Ll/xe5$b;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Ll/xe5$b;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0}, Ll/xe5;->u(Landroid/content/Context;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Ll/xe5$b;->e:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Ll/xe5$b;->g:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0}, Ll/xe5;->t(Landroid/content/Context;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-object p0, v0, Ll/xe5$b;->f:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/xe5$b;->a()Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method private static r0()Z
    .locals 5

    .line 1
    const/16 v0, 0x1d

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x17

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    fill-array-data v1, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/16 v2, 0x12

    .line 24
    .line 25
    new-array v3, v2, [B

    .line 26
    .line 27
    fill-array-data v3, :array_2

    .line 28
    .line 29
    .line 30
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const/16 v4, 0x1a

    .line 35
    .line 36
    new-array v4, v4, [B

    .line 37
    .line 38
    fill-array-data v4, :array_3

    .line 39
    .line 40
    .line 41
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    new-array v2, v2, [B

    .line 46
    .line 47
    fill-array-data v2, :array_4

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    filled-new-array {v0, v1, v3, v4, v2}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v1, 0x0

    .line 59
    move v2, v1

    .line 60
    :goto_0
    const/4 v3, 0x5

    .line 61
    if-ge v2, v3, :cond_0

    .line 62
    .line 63
    aget-object v3, v0, v2

    .line 64
    .line 65
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    return v0

    .line 70
    :catch_0
    add-int/lit8 v2, v2, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    return v1

    .line 74
    nop

    .line 75
    :array_0
    .array-data 1
        0x5at
        0x7t
        0x47t
        0x56t
        0x4ft
        0xat
        0x51t
        0x8t
        0x56t
        0x19t
        0x16t
        0x1t
        0x4at
        0x15t
        0x1ft
        0x73t
        0x4t
        0x10t
        0x59t
        0x5t
        0x54t
        0x7et
        0xft
        0x0t
        0x5ft
        0x36t
        0x43t
        0x58t
        0x11t
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    nop

    .line 95
    :array_1
    .array-data 1
        0x5at
        0x7t
        0x47t
        0x56t
        0x4ft
        0xat
        0x51t
        0x8t
        0x56t
        0x19t
        0x16t
        0x1t
        0x4at
        0x15t
        0x1ft
        0x76t
        0x24t
        0x35t
        0x65t
        0x12t
        0x58t
        0x5bt
        0x12t
    .end array-data

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :array_2
    .array-data 1
        0x5at
        0x7t
        0x47t
        0x56t
        0x4ft
        0xat
        0x51t
        0x8t
        0x56t
        0x19t
        0x16t
        0x1t
        0x4at
        0x15t
        0x1ft
        0x7bt
        0xet
        0x1t
    .end array-data

    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    nop

    .line 125
    :array_3
    .array-data 1
        0x5at
        0x7t
        0x47t
        0x56t
        0x4ft
        0xat
        0x51t
        0x8t
        0x56t
        0x19t
        0x16t
        0x1t
        0x4at
        0x15t
        0x1ft
        0x64t
        0x15t
        0x14t
        0x55t
        0x7t
        0x5ct
        0x62t
        0x15t
        0xft
        0x5ct
        0x15t
    .end array-data

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    nop

    .line 143
    :array_4
    .array-data 1
        0x5at
        0x7t
        0x47t
        0x56t
        0x4ft
        0xat
        0x51t
        0x8t
        0x56t
        0x19t
        0x36t
        0x1t
        0x4at
        0x15t
        0x64t
        0x43t
        0x8t
        0xat
    .end array-data
.end method

.method private static s(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    move-object p0, v0

    .line 21
    :goto_0
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :goto_1
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v2, 0x1e

    .line 27
    .line 28
    new-array v2, v2, [B

    .line 29
    .line 30
    fill-array-data v2, :array_0

    .line 31
    .line 32
    .line 33
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :array_0
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x43t
        0x8t
        0x8t
        0x57t
        0x46t
        0x50t
        0x47t
        0x11t
        0xat
        0x59t
        0x5t
        0x50t
        0x43t
        0x8t
        0x9t
        0x5et
        0x46t
        0x5ft
        0x56t
        0xct
        0x3t
    .end array-data
.end method

.method private static s0(Landroid/content/Context;)Z
    .locals 4

    .line 1
    const/16 v0, 0x17

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x18

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    fill-array-data v1, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/16 v2, 0x14

    .line 24
    .line 25
    new-array v2, v2, [B

    .line 26
    .line 27
    fill-array-data v2, :array_2

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const/16 v3, 0x1a

    .line 35
    .line 36
    new-array v3, v3, [B

    .line 37
    .line 38
    fill-array-data v3, :array_3

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x0

    .line 50
    move v2, v1

    .line 51
    :goto_0
    const/4 v3, 0x4

    .line 52
    if-ge v2, v3, :cond_1

    .line 53
    .line 54
    aget-object v3, v0, v2

    .line 55
    .line 56
    invoke-static {p0, v3}, Ll/xe5;->C0(Landroid/content/Context;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_0

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    return v1

    .line 68
    nop

    .line 69
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0xft
        0x9t
        0x43t
        0xet
        0x44t
        0x51t
        0xet
        0x13t
        0x1et
        0x7t
        0x5ft
        0x53t
        0x13t
        0x9t
        0x59t
        0x2t
        0x1ft
        0x44t
        0x14t
    .end array-data

    .line 70
    .line 71
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x15t
        0xet
        0x59t
        0x14t
        0x55t
        0x47t
        0x0t
        0x14t
        0x44t
        0x1ft
        0x1ft
        0x44t
        0x14t
        0x16t
        0x55t
        0x14t
        0x44t
        0x44t
        0x4t
        0x14t
    .end array-data

    :array_2
    .array-data 1
        0x55t
        0x13t
        0x1ft
        0x54t
        0x9t
        0x7t
        0x59t
        0x8t
        0x57t
        0x5et
        0x13t
        0x3t
        0x1et
        0x15t
        0x44t
        0x47t
        0x4t
        0x14t
        0x43t
        0x13t
    .end array-data

    :array_3
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0xat
        0x9t
        0x45t
        0x15t
        0x59t
        0x5et
        0xat
        0x2t
        0x45t
        0x12t
        0x45t
        0x56t
        0x4ft
        0x15t
        0x45t
        0x16t
        0x54t
        0x45t
        0x14t
        0x15t
        0x55t
        0x14t
    .end array-data
.end method

.method private static t(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/xe5;->P()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {}, Ll/xe5;->O()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    invoke-static {p0}, Ll/xe5;->N(Landroid/content/Context;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static t0()Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method private static u(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    return-object v0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 24
    .line 25
    const/16 v2, 0x16

    .line 26
    .line 27
    new-array v2, v2, [B

    .line 28
    .line 29
    fill-array-data v2, :array_0

    .line 30
    .line 31
    .line 32
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    nop

    .line 41
    :array_0
    .array-data 1
        0x60t
        0x7t
        0x52t
        0x5ct
        0x0t
        0x1t
        0x55t
        0x46t
        0x5ft
        0x56t
        0xct
        0x3t
        0x10t
        0x8t
        0x5et
        0x43t
        0x41t
        0x0t
        0x5ft
        0x13t
        0x5ft
        0x53t
    .end array-data
.end method

.method public static u0(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/16 v1, 0x1d

    .line 10
    .line 11
    new-array v1, v1, [B

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_2

    .line 25
    .line 26
    const/16 v1, 0x1a

    .line 27
    .line 28
    new-array v1, v1, [B

    .line 29
    .line 30
    fill-array-data v1, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return v0

    .line 45
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x4t
        0x5ct
        0x13t
        0x54t
        0x43t
        0xet
        0x9t
        0x44t
        0xet
        0x6et
        0x5bt
        0x4t
    .end array-data

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    nop

    .line 67
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x4t
        0x5ct
        0x13t
        0x54t
        0x43t
        0xet
        0x9t
        0x44t
        0xet
    .end array-data
.end method

.method private static v(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/16 v1, 0x24

    .line 4
    .line 5
    :try_start_0
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-class v2, Landroid/content/Context;

    .line 19
    .line 20
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/16 v2, 0x12

    .line 37
    .line 38
    new-array v2, v2, [B

    .line 39
    .line 40
    fill-array-data v2, :array_1

    .line 41
    .line 42
    .line 43
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x1

    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    check-cast p0, Ljava/lang/Double;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    sget-object p0, Ll/xe5;->a:Ljava/lang/String;

    .line 76
    .line 77
    const/16 v1, 0x2d

    .line 78
    .line 79
    new-array v1, v1, [B

    .line 80
    .line 81
    fill-array-data v1, :array_2

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    return-object v0

    .line 92
    :goto_0
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 93
    .line 94
    const/16 v2, 0x1a

    .line 95
    .line 96
    new-array v2, v2, [B

    .line 97
    .line 98
    fill-array-data v2, :array_3

    .line 99
    .line 100
    .line 101
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    .line 107
    .line 108
    return-object v0

    .line 109
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x0t
        0x8t
        0x54t
        0x14t
        0x5et
        0x5et
        0x5t
        0x48t
        0x59t
        0x8t
        0x45t
        0x52t
        0x13t
        0x8t
        0x51t
        0xat
        0x1ft
        0x58t
        0x12t
        0x48t
        0x60t
        0x9t
        0x46t
        0x52t
        0x13t
        0x36t
        0x42t
        0x9t
        0x57t
        0x5et
        0xdt
        0x3t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_1
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x75t
        0x0t
        0x12t
        0x44t
        0x3t
        0x43t
        0x4et
        0x22t
        0x7t
        0x40t
        0x7t
        0x52t
        0x5et
        0x15t
        0x1ft
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    nop

    .line 145
    :array_2
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x75t
        0x0t
        0x12t
        0x44t
        0x3t
        0x43t
        0x4et
        0x22t
        0x7t
        0x40t
        0x7t
        0x52t
        0x5et
        0x15t
        0x1ft
        0x7dt
        0x3t
        0x45t
        0x5ft
        0xet
        0x2t
        0x1et
        0xft
        0x5ft
        0x41t
        0xet
        0xdt
        0x55t
        0x46t
        0x43t
        0x52t
        0x15t
        0x13t
        0x42t
        0x8t
        0x54t
        0x53t
        0x41t
        0x8t
        0x45t
        0xat
        0x5dt
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    nop

    .line 173
    :array_3
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x57t
        0x3t
        0x45t
        0x75t
        0x0t
        0x12t
        0x44t
        0x3t
        0x43t
        0x4et
        0x22t
        0x7t
        0x40t
        0x7t
        0x52t
        0x5et
        0x15t
        0x1ft
        0xat
        0x46t
    .end array-data
.end method

.method private static v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v2, 0x1a

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, -0x1

    .line 12
    if-lt v1, v2, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-static {p0}, Ll/f2j0;->b(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Ljava/io/BufferedReader;

    .line 21
    .line 22
    new-instance v2, Ljava/io/InputStreamReader;

    .line 23
    .line 24
    new-array v5, v3, [Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v5}, Ll/ve5;->a(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    new-array v6, v3, [Ljava/nio/file/OpenOption;

    .line 31
    .line 32
    invoke-static {v5, v6}, Ll/dig0;->a(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-direct {v2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catch_0
    move-exception p0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return v4

    .line 46
    :goto_0
    sget-object p1, Ll/xe5;->a:Ljava/lang/String;

    .line 47
    .line 48
    const/16 p2, 0x1c

    .line 49
    .line 50
    new-array p2, p2, [B

    .line 51
    .line 52
    fill-array-data p2, :array_0

    .line 53
    .line 54
    .line 55
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    return v4

    .line 63
    :cond_1
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    .line 64
    .line 65
    new-instance v2, Ljava/io/InputStreamReader;

    .line 66
    .line 67
    new-instance v5, Ljava/io/FileInputStream;

    .line 68
    .line 69
    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-direct {v2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-eqz v2, :cond_4

    .line 83
    .line 84
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 85
    .line 86
    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    array-length v5, p1

    .line 91
    move v6, v3

    .line 92
    :goto_2
    if-ge v6, v5, :cond_2

    .line 93
    .line 94
    aget-object v7, p1, v6

    .line 95
    .line 96
    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 97
    .line 98
    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-eqz v8, :cond_3

    .line 107
    .line 108
    invoke-interface {v0, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    goto :goto_3

    .line 112
    :catch_1
    move-exception p1

    .line 113
    goto :goto_4

    .line 114
    :cond_3
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_4
    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 118
    .line 119
    .line 120
    const/4 p0, 0x1

    .line 121
    return p0

    .line 122
    :goto_4
    sget-object p2, Ll/xe5;->a:Ljava/lang/String;

    .line 123
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const/16 v1, 0x1e

    .line 130
    .line 131
    new-array v1, v1, [B

    .line 132
    .line 133
    fill-array-data v1, :array_1

    .line 134
    .line 135
    .line 136
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 151
    .line 152
    .line 153
    move v3, v4

    .line 154
    :catch_2
    return v3

    .line 155
    :catch_3
    move-exception p0

    .line 156
    sget-object p1, Ll/xe5;->a:Ljava/lang/String;

    .line 157
    .line 158
    const/16 p2, 0x1c

    .line 159
    .line 160
    new-array p2, p2, [B

    .line 161
    .line 162
    fill-array-data p2, :array_2

    .line 163
    .line 164
    .line 165
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    .line 171
    .line 172
    return v4

    .line 173
    :array_0
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x8t
        0x15t
        0x73t
        0x9t
        0x5ft
        0x43t
        0x0t
        0xft
        0x5et
        0x35t
        0x45t
        0x45t
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :array_1
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x13t
        0x3t
        0x51t
        0x2t
        0x58t
        0x59t
        0x6t
        0x46t
        0x56t
        0xft
        0x5dt
        0x52t
        0x5bt
        0x46t
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    nop

    .line 211
    :array_2
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x17t
        0x16t
        0xet
        0x59t
        0xat
        0x54t
        0x17t
        0x8t
        0x15t
        0x73t
        0x9t
        0x5ft
        0x43t
        0x0t
        0xft
        0x5et
        0x35t
        0x45t
        0x45t
    .end array-data
.end method

.method private static w(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    const/16 v1, 0x25

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {p0, v1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v2, Ll/xe5$c;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Ll/xe5$c;-><init>(Ll/xe5$a;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/xe5;->v(Landroid/content/Context;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iput-object p0, v2, Ll/xe5$c;->a:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x5

    .line 36
    new-array v1, p0, [B

    .line 37
    .line 38
    fill-array-data v1, :array_1

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const/4 v3, -0x1

    .line 46
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    new-array p0, p0, [B

    .line 51
    .line 52
    fill-array-data p0, :array_2

    .line 53
    .line 54
    .line 55
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    int-to-float v1, v1

    .line 64
    int-to-float p0, p0

    .line 65
    div-float/2addr v1, p0

    .line 66
    iput v1, v2, Ll/xe5$c;->b:F

    .line 67
    .line 68
    const/4 p0, 0x7

    .line 69
    new-array p0, p0, [B

    .line 70
    .line 71
    fill-array-data p0, :array_3

    .line 72
    .line 73
    .line 74
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    iput p0, v2, Ll/xe5$c;->c:I

    .line 83
    .line 84
    const/16 p0, 0xb

    .line 85
    .line 86
    new-array p0, p0, [B

    .line 87
    .line 88
    fill-array-data p0, :array_4

    .line 89
    .line 90
    .line 91
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    int-to-float p0, p0

    .line 100
    const/high16 v1, 0x41200000    # 10.0f

    .line 101
    .line 102
    div-float/2addr p0, v1

    .line 103
    iput p0, v2, Ll/xe5$c;->d:F

    .line 104
    .line 105
    const/4 p0, 0x6

    .line 106
    new-array p0, p0, [B

    .line 107
    .line 108
    fill-array-data p0, :array_5

    .line 109
    .line 110
    .line 111
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {p0}, Ll/xe5;->i0(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iput-object p0, v2, Ll/xe5$c;->e:Ljava/lang/String;

    .line 124
    .line 125
    const/4 p0, 0x7

    .line 126
    new-array p0, p0, [B

    .line 127
    .line 128
    fill-array-data p0, :array_6

    .line 129
    .line 130
    .line 131
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    invoke-static {p0}, Ll/xe5;->a0(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    iput-object p0, v2, Ll/xe5$c;->f:Ljava/lang/String;

    .line 144
    .line 145
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 146
    .line 147
    const/16 v1, 0x22

    .line 148
    .line 149
    if-lt p0, v1, :cond_0

    .line 150
    .line 151
    const/16 p0, 0x1c

    .line 152
    .line 153
    new-array p0, p0, [B

    .line 154
    .line 155
    fill-array-data p0, :array_7

    .line 156
    .line 157
    .line 158
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    iput p0, v2, Ll/xe5$c;->g:I

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_0
    iput v3, v2, Ll/xe5$c;->g:I

    .line 170
    .line 171
    :cond_1
    :goto_0
    invoke-virtual {v2}, Ll/xe5$c;->a()Lorg/json/JSONObject;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    nop

    .line 177
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x58t
        0x59t
        0x15t
        0x3t
        0x5et
        0x12t
        0x1ft
        0x56t
        0x2t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x19t
        0x23t
        0x27t
        0x64t
        0x32t
        0x74t
        0x65t
        0x38t
        0x39t
        0x73t
        0x2et
        0x70t
        0x79t
        0x26t
        0x23t
        0x74t
    .end array-data

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    nop

    .line 201
    :array_1
    .array-data 1
        0x5ct
        0x3t
        0x47t
        0x52t
        0xdt
    .end array-data

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    nop

    .line 209
    :array_2
    .array-data 1
        0x43t
        0x5t
        0x50t
        0x5bt
        0x4t
    .end array-data

    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    nop

    .line 217
    :array_3
    .array-data 1
        0x46t
        0x9t
        0x5dt
        0x43t
        0x0t
        0x1t
        0x55t
    .end array-data

    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_4
    .array-data 1
        0x44t
        0x3t
        0x5ct
        0x47t
        0x4t
        0x14t
        0x51t
        0x12t
        0x44t
        0x45t
        0x4t
    .end array-data

    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :array_5
    .array-data 1
        0x43t
        0x12t
        0x50t
        0x43t
        0x14t
        0x15t
    .end array-data

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    nop

    .line 243
    :array_6
    .array-data 1
        0x40t
        0xat
        0x44t
        0x50t
        0x6t
        0x3t
        0x54t
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    :array_7
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x5et
        0x44t
        0x4ft
        0x3t
        0x48t
        0x12t
        0x43t
        0x56t
        0x4ft
        0x25t
        0x69t
        0x25t
        0x7dt
        0x72t
        0x3et
        0x25t
        0x7ft
        0x33t
        0x7ft
        0x63t
    .end array-data
.end method

.method private static w0(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0xb

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    fill-array-data v1, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/16 v2, 0xd

    .line 24
    .line 25
    new-array v2, v2, [B

    .line 26
    .line 27
    fill-array-data v2, :array_2

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const/16 v3, 0xa

    .line 35
    .line 36
    new-array v3, v3, [B

    .line 37
    .line 38
    fill-array-data v3, :array_3

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const/16 v4, 0xe

    .line 46
    .line 47
    new-array v4, v4, [B

    .line 48
    .line 49
    fill-array-data v4, :array_4

    .line 50
    .line 51
    .line 52
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v1, 0x0

    .line 61
    :goto_0
    const/4 v2, 0x5

    .line 62
    if-ge v1, v2, :cond_0

    .line 63
    .line 64
    aget-object v2, v0, v1

    .line 65
    .line 66
    sget-object v3, Ll/xe5;->h:[Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v2, v3, p0}, Ll/xe5;->v0(Ljava/lang/String;[Ljava/lang/String;Ljava/util/Map;)I

    .line 69
    .line 70
    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    return-void

    .line 75
    :array_0
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x59t
        0x8t
        0x45t
        0x52t
        0x13t
        0x14t
        0x45t
        0x16t
        0x45t
        0x44t
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x59t
        0x9t
        0x5ct
        0x52t
        0xct
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    :array_2
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x59t
        0x9t
        0x41t
        0x58t
        0x13t
        0x12t
        0x43t
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    nop

    .line 109
    :array_3
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x5dt
        0xft
        0x42t
        0x54t
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    nop

    .line 119
    :array_4
    .array-data 1
        0x1ft
        0x16t
        0x43t
        0x58t
        0x2t
        0x49t
        0x5bt
        0x7t
        0x5dt
        0x5bt
        0x12t
        0x1ft
        0x5dt
        0x15t
    .end array-data
.end method

.method public static x()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    return-object v0
.end method

.method public static x0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/xe5;->r0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/xe5;->z0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    return v0
.end method

.method public static y(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x13

    .line 7
    .line 8
    :try_start_0
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/xe5;->t0()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v1

    .line 26
    sget-object v2, Ll/xe5;->a:Ljava/lang/String;

    .line 27
    .line 28
    const/16 v3, 0x1a

    .line 29
    .line 30
    new-array v3, v3, [B

    .line 31
    .line 32
    fill-array-data v3, :array_1

    .line 33
    .line 34
    .line 35
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    .line 41
    .line 42
    :goto_0
    const/16 v1, 0x12

    .line 43
    .line 44
    :try_start_1
    new-array v1, v1, [B

    .line 45
    .line 46
    fill-array-data v1, :array_2

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {p0}, Ll/xe5;->u0(Landroid/content/Context;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    const/16 v1, 0xd

    .line 61
    .line 62
    new-array v2, v1, [B

    .line 63
    .line 64
    fill-array-data v2, :array_3

    .line 65
    .line 66
    .line 67
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {p0}, Ll/xe5;->A(Landroid/content/Context;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    new-array v1, v1, [B

    .line 79
    .line 80
    fill-array-data v1, :array_4

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {}, Ll/xe5;->z()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    .line 93
    .line 94
    const/16 v1, 0xe

    .line 95
    .line 96
    new-array v1, v1, [B

    .line 97
    .line 98
    fill-array-data v1, :array_5

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {}, Ll/xe5;->x()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    .line 111
    .line 112
    const/16 v1, 0x14

    .line 113
    .line 114
    new-array v1, v1, [B

    .line 115
    .line 116
    fill-array-data v1, :array_6

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const/16 v2, 0x1c

    .line 124
    .line 125
    new-array v2, v2, [B

    .line 126
    .line 127
    fill-array-data v2, :array_7

    .line 128
    .line 129
    .line 130
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-static {p0, v2}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :catch_1
    move-exception p0

    .line 143
    sget-object v1, Ll/xe5;->a:Ljava/lang/String;

    .line 144
    .line 145
    const/16 v2, 0x2d

    .line 146
    .line 147
    new-array v2, v2, [B

    .line 148
    .line 149
    fill-array-data v2, :array_8

    .line 150
    .line 151
    .line 152
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 157
    .line 158
    .line 159
    :goto_1
    return-object v0

    .line 160
    nop

    .line 161
    :array_0
    .array-data 1
        0x59t
        0x15t
        0x6et
        0x55t
        0xdt
        0x13t
        0x55t
        0x12t
        0x5et
        0x58t
        0x15t
        0xet
        0x6ft
        0x3t
        0x5ft
        0x56t
        0x3t
        0xat
        0x55t
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :array_1
    .array-data 1
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x46t
        0x59t
        0x15t
        0x73t
        0x5bt
        0x14t
        0x3t
        0x44t
        0x9t
        0x5et
        0x43t
        0x9t
        0x23t
        0x5et
        0x7t
        0x53t
        0x5bt
        0x4t
        0x2t
        0xat
        0x46t
    .end array-data

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    nop

    .line 193
    :array_2
    .array-data 1
        0x59t
        0x15t
        0x6et
        0x55t
        0xdt
        0x13t
        0x55t
        0x12t
        0x5et
        0x58t
        0x15t
        0xet
        0x6ft
        0x3t
        0x49t
        0x5et
        0x12t
        0x12t
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    nop

    .line 207
    :array_3
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x15t
        0x9t
        0x5ft
        0x12t
        0x59t
        0x68t
        0x17t
        0x3t
        0x42t
    .end array-data

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    nop

    .line 219
    :array_4
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x15t
        0x9t
        0x5ft
        0x12t
        0x59t
        0x68t
        0xct
        0x7t
        0x53t
    .end array-data

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    nop

    .line 231
    :array_5
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x15t
        0x9t
        0x5ft
        0x12t
        0x59t
        0x68t
        0xft
        0x7t
        0x5dt
        0x3t
    .end array-data

    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    nop

    .line 243
    :array_6
    .array-data 1
        0x52t
        0xat
        0x44t
        0x52t
        0x15t
        0x9t
        0x5ft
        0x12t
        0x59t
        0x68t
        0x11t
        0x3t
        0x42t
        0xbt
        0x58t
        0x44t
        0x12t
        0xft
        0x5ft
        0x8t
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :array_7
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x24t
        0x7dt
        0x62t
        0x24t
        0x32t
        0x7ft
        0x29t
        0x65t
        0x7ft
    .end array-data

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    :array_8
    .array-data 1
        0x76t
        0x7t
        0x58t
        0x5bt
        0x4t
        0x2t
        0x10t
        0x12t
        0x5et
        0x17t
        0x2t
        0x14t
        0x55t
        0x7t
        0x45t
        0x52t
        0x41t
        0x1t
        0x55t
        0x12t
        0x73t
        0x5bt
        0x14t
        0x3t
        0x44t
        0x9t
        0x5et
        0x43t
        0x9t
        0x2ft
        0x5et
        0x0t
        0x5et
        0x17t
        0x2bt
        0x35t
        0x7ft
        0x28t
        0x11t
        0x58t
        0x3t
        0xct
        0x55t
        0x5t
        0x45t
    .end array-data
.end method

.method private static y0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static z()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    return-object v0
.end method

.method private static z0()Z
    .locals 6

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/io/File;

    .line 18
    .line 19
    const/16 v2, 0x1b

    .line 20
    .line 21
    new-array v2, v2, [B

    .line 22
    .line 23
    fill-array-data v2, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v2, 0x1

    .line 38
    const/4 v3, 0x0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move v0, v3

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    move v0, v2

    .line 51
    :goto_1
    new-instance v1, Ljava/lang/String;

    .line 52
    .line 53
    const/4 v4, 0x4

    .line 54
    new-array v4, v4, [B

    .line 55
    .line 56
    fill-array-data v4, :array_2

    .line 57
    .line 58
    .line 59
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/16 v5, 0x6b

    .line 68
    .line 69
    invoke-static {v4, v5}, Lcom/immomo/hdata/android/Coded;->doCommand([BI)[B

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-direct {v1, v4}, Ljava/lang/String;-><init>([B)V

    .line 74
    .line 75
    .line 76
    const/4 v4, 0x7

    .line 77
    new-array v4, v4, [B

    .line 78
    .line 79
    fill-array-data v4, :array_3

    .line 80
    .line 81
    .line 82
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_3

    .line 91
    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_2
    return v3

    .line 96
    :cond_3
    :goto_2
    return v2

    .line 97
    :array_0
    .array-data 1
        0x1ft
        0x2t
        0x50t
        0x43t
        0x0t
        0x49t
        0x5ct
        0x9t
        0x52t
        0x56t
        0xdt
        0x49t
        0x44t
        0xbt
        0x41t
        0x18t
        0x2t
        0x9t
        0x5et
        0x0t
        0x58t
        0x50t
        0x12t
        0x49t
        0x1et
        0x16t
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    nop

    .line 115
    :array_1
    .array-data 1
        0x1ft
        0x2t
        0x50t
        0x43t
        0x0t
        0x49t
        0x5ct
        0x9t
        0x52t
        0x56t
        0xdt
        0x49t
        0x44t
        0xbt
        0x41t
        0x18t
        0x2t
        0x9t
        0x5et
        0x0t
        0x58t
        0x50t
        0x12t
        0x49t
        0x1et
        0x15t
        0x41t
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :array_2
    .array-data 1
        0x44t
        0x3t
        0x42t
        0x43t
    .end array-data

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_3
    .array-data 1
        0x43t
        0x13t
        0x52t
        0x54t
        0x4t
        0x15t
        0x43t
    .end array-data
.end method
