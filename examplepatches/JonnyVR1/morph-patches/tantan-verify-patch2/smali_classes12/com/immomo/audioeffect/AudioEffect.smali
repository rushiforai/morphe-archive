.class public Lcom/immomo/audioeffect/AudioEffect;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/audioeffect/AudioEffect$b;,
        Lcom/immomo/audioeffect/AudioEffect$c;,
        Lcom/immomo/audioeffect/AudioEffect$a;
    }
.end annotation


# static fields
.field public static final BASEMENT:I = 0x2

.field public static final BATHROOM:I = 0x3

.field public static final ELECTRONIC:I = 0x8

.field public static final KTV:I = 0x5

.field public static final NewKTV:I = 0x7

.field public static final Origin:I = 0x0

.field public static final STUDIO:I = 0x6

.field public static final THEATER:I = 0x1

.field public static final WORKPLACE:I = 0x4

.field private static volatile mIsLibLoaded:Z


# instance fields
.field public ELC:Ljava/lang/String;

.field public EQ:Ljava/lang/String;

.field public GAIN:Ljava/lang/String;

.field public REVERB:Ljava/lang/String;

.field private basementEQ:[[F

.field private bathroomEQ:[[F

.field private handle:J

.field private ktvEQ:[[F

.field private mSyncObj:Ljava/lang/Object;

.field private newKtvEQ:[[F

.field private procfun:Lcom/immomo/audioeffect/AudioEffect$b;

.field private studioEQ:[[F

.field private theaterEQ:[[F

.field private workplaceEQ:[[F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "equalizer"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->EQ:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "reverb"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->REVERB:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "gain"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->GAIN:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "tremolo"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->ELC:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 29
    .line 30
    const/4 v0, 0x3

    .line 31
    new-array v1, v0, [F

    .line 32
    .line 33
    fill-array-data v1, :array_0

    .line 34
    .line 35
    .line 36
    new-array v2, v0, [F

    .line 37
    .line 38
    fill-array-data v2, :array_1

    .line 39
    .line 40
    .line 41
    new-array v3, v0, [F

    .line 42
    .line 43
    fill-array-data v3, :array_2

    .line 44
    .line 45
    .line 46
    new-array v4, v0, [F

    .line 47
    .line 48
    fill-array-data v4, :array_3

    .line 49
    .line 50
    .line 51
    new-array v5, v0, [F

    .line 52
    .line 53
    fill-array-data v5, :array_4

    .line 54
    .line 55
    .line 56
    new-array v6, v0, [F

    .line 57
    .line 58
    fill-array-data v6, :array_5

    .line 59
    .line 60
    .line 61
    filled-new-array/range {v1 .. v6}, [[F

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->workplaceEQ:[[F

    .line 66
    .line 67
    new-array v1, v0, [F

    .line 68
    .line 69
    fill-array-data v1, :array_6

    .line 70
    .line 71
    .line 72
    new-array v2, v0, [F

    .line 73
    .line 74
    fill-array-data v2, :array_7

    .line 75
    .line 76
    .line 77
    new-array v3, v0, [F

    .line 78
    .line 79
    fill-array-data v3, :array_8

    .line 80
    .line 81
    .line 82
    new-array v4, v0, [F

    .line 83
    .line 84
    fill-array-data v4, :array_9

    .line 85
    .line 86
    .line 87
    filled-new-array {v1, v2, v3, v4}, [[F

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->studioEQ:[[F

    .line 92
    .line 93
    new-array v1, v0, [F

    .line 94
    .line 95
    fill-array-data v1, :array_a

    .line 96
    .line 97
    .line 98
    new-array v2, v0, [F

    .line 99
    .line 100
    fill-array-data v2, :array_b

    .line 101
    .line 102
    .line 103
    new-array v3, v0, [F

    .line 104
    .line 105
    fill-array-data v3, :array_c

    .line 106
    .line 107
    .line 108
    new-array v4, v0, [F

    .line 109
    .line 110
    fill-array-data v4, :array_d

    .line 111
    .line 112
    .line 113
    new-array v5, v0, [F

    .line 114
    .line 115
    fill-array-data v5, :array_e

    .line 116
    .line 117
    .line 118
    filled-new-array {v1, v2, v3, v4, v5}, [[F

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->theaterEQ:[[F

    .line 123
    .line 124
    new-array v2, v0, [F

    .line 125
    .line 126
    fill-array-data v2, :array_f

    .line 127
    .line 128
    .line 129
    new-array v3, v0, [F

    .line 130
    .line 131
    fill-array-data v3, :array_10

    .line 132
    .line 133
    .line 134
    new-array v4, v0, [F

    .line 135
    .line 136
    fill-array-data v4, :array_11

    .line 137
    .line 138
    .line 139
    new-array v5, v0, [F

    .line 140
    .line 141
    fill-array-data v5, :array_12

    .line 142
    .line 143
    .line 144
    new-array v6, v0, [F

    .line 145
    .line 146
    fill-array-data v6, :array_13

    .line 147
    .line 148
    .line 149
    new-array v7, v0, [F

    .line 150
    .line 151
    fill-array-data v7, :array_14

    .line 152
    .line 153
    .line 154
    new-array v8, v0, [F

    .line 155
    .line 156
    fill-array-data v8, :array_15

    .line 157
    .line 158
    .line 159
    filled-new-array/range {v2 .. v8}, [[F

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->ktvEQ:[[F

    .line 164
    .line 165
    new-array v1, v0, [F

    .line 166
    .line 167
    fill-array-data v1, :array_16

    .line 168
    .line 169
    .line 170
    new-array v2, v0, [F

    .line 171
    .line 172
    fill-array-data v2, :array_17

    .line 173
    .line 174
    .line 175
    new-array v3, v0, [F

    .line 176
    .line 177
    fill-array-data v3, :array_18

    .line 178
    .line 179
    .line 180
    new-array v4, v0, [F

    .line 181
    .line 182
    fill-array-data v4, :array_19

    .line 183
    .line 184
    .line 185
    new-array v5, v0, [F

    .line 186
    .line 187
    fill-array-data v5, :array_1a

    .line 188
    .line 189
    .line 190
    filled-new-array {v1, v2, v3, v4, v5}, [[F

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->bathroomEQ:[[F

    .line 195
    .line 196
    new-array v1, v0, [F

    .line 197
    .line 198
    fill-array-data v1, :array_1b

    .line 199
    .line 200
    .line 201
    new-array v2, v0, [F

    .line 202
    .line 203
    fill-array-data v2, :array_1c

    .line 204
    .line 205
    .line 206
    new-array v3, v0, [F

    .line 207
    .line 208
    fill-array-data v3, :array_1d

    .line 209
    .line 210
    .line 211
    filled-new-array {v1, v2, v3}, [[F

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->basementEQ:[[F

    .line 216
    .line 217
    new-array v2, v0, [F

    .line 218
    .line 219
    fill-array-data v2, :array_1e

    .line 220
    .line 221
    .line 222
    new-array v3, v0, [F

    .line 223
    .line 224
    fill-array-data v3, :array_1f

    .line 225
    .line 226
    .line 227
    new-array v4, v0, [F

    .line 228
    .line 229
    fill-array-data v4, :array_20

    .line 230
    .line 231
    .line 232
    new-array v5, v0, [F

    .line 233
    .line 234
    fill-array-data v5, :array_21

    .line 235
    .line 236
    .line 237
    new-array v6, v0, [F

    .line 238
    .line 239
    fill-array-data v6, :array_22

    .line 240
    .line 241
    .line 242
    new-array v7, v0, [F

    .line 243
    .line 244
    fill-array-data v7, :array_23

    .line 245
    .line 246
    .line 247
    new-array v8, v0, [F

    .line 248
    .line 249
    fill-array-data v8, :array_24

    .line 250
    .line 251
    .line 252
    new-array v9, v0, [F

    .line 253
    .line 254
    fill-array-data v9, :array_25

    .line 255
    .line 256
    .line 257
    filled-new-array/range {v2 .. v9}, [[F

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iput-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->newKtvEQ:[[F

    .line 262
    .line 263
    sget-boolean p0, Lcom/immomo/audioeffect/AudioEffect;->mIsLibLoaded:Z

    .line 264
    .line 265
    if-nez p0, :cond_0

    .line 266
    .line 267
    :try_start_0
    const-string p0, "audioeffect"

    .line 268
    .line 269
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    const/4 p0, 0x1

    .line 273
    sput-boolean p0, Lcom/immomo/audioeffect/AudioEffect;->mIsLibLoaded:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    .line 275
    return-void

    .line 276
    :catch_0
    move-exception v0

    .line 277
    move-object p0, v0

    .line 278
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 279
    .line 280
    .line 281
    :cond_0
    return-void

    .line 282
    nop

    .line 283
    :array_0
    .array-data 4
        0x41fa0000    # 31.25f
        0x3f800000    # 1.0f
        0x41400000    # 12.0f
    .end array-data

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    :array_1
    .array-data 4
        0x427a0000    # 62.5f
        0x3f800000    # 1.0f
        0x41400000    # 12.0f
    .end array-data

    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    :array_2
    .array-data 4
        0x42fa0000    # 125.0f
        0x3f800000    # 1.0f
        0x41400000    # 12.0f
    .end array-data

    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    :array_3
    .array-data 4
        0x437a0000    # 250.0f
        0x3f800000    # 1.0f
        0x40a00000    # 5.0f
    .end array-data

    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    :array_4
    .array-data 4
        0x44fa0000    # 2000.0f
        0x3f800000    # 1.0f
        0x40a00000    # 5.0f
    .end array-data

    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    :array_5
    .array-data 4
        0x45bb8000    # 6000.0f
        0x3fc00000    # 1.5f
        -0x3f600000    # -5.0f
    .end array-data

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    :array_6
    .array-data 4
        0x437a0000    # 250.0f
        0x3fc00000    # 1.5f
        0x41200000    # 10.0f
    .end array-data

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
    :array_7
    .array-data 4
        0x44fa0000    # 2000.0f
        0x3f800000    # 1.0f
        0x40e00000    # 7.0f
    .end array-data

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    :array_8
    .array-data 4
        0x457a0000    # 4000.0f
        0x3fc00000    # 1.5f
        0x0
    .end array-data

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    :array_9
    .array-data 4
        0x45fa0000    # 8000.0f
        0x3fc00000    # 1.5f
        0x0
    .end array-data

    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    :array_a
    .array-data 4
        0x427c0000    # 63.0f
        0x3fb33333    # 1.4f
        0x41000000    # 8.0f
    .end array-data

    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    :array_b
    .array-data 4
        0x43200000    # 160.0f
        0x40066666    # 2.1f
        0x41000000    # 8.0f
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
    .line 403
    :array_c
    .array-data 4
        0x439d8000    # 315.0f
        0x4089999a    # 4.3f
        0x41000000    # 8.0f
    .end array-data

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    :array_d
    .array-data 4
        0x45c4e000    # 6300.0f
        0x400b851f    # 2.18f
        0x41000000    # 8.0f
    .end array-data

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
    :array_e
    .array-data 4
        0x46435000    # 12500.0f
        0x40533333    # 3.3f
        0x41000000    # 8.0f
    .end array-data

    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    :array_f
    .array-data 4
        0x41fa0000    # 31.25f
        0x40000000    # 2.0f
        0x41a00000    # 20.0f
    .end array-data

    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :array_10
    .array-data 4
        0x427a0000    # 62.5f
        0x40000000    # 2.0f
        0x41a00000    # 20.0f
    .end array-data

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
    :array_11
    .array-data 4
        0x42fa0000    # 125.0f
        0x3fc00000    # 1.5f
        0x41200000    # 10.0f
    .end array-data

    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :array_12
    .array-data 4
        0x437a0000    # 250.0f
        0x3fc00000    # 1.5f
        -0x3fc00000    # -3.0f
    .end array-data

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    :array_13
    .array-data 4
        0x44fa0000    # 2000.0f
        0x3fc00000    # 1.5f
        0x40c00000    # 6.0f
    .end array-data

    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    :array_14
    .array-data 4
        0x457a0000    # 4000.0f
        0x3fc00000    # 1.5f
        0x0
    .end array-data

    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    :array_15
    .array-data 4
        0x45fa0000    # 8000.0f
        0x3fc00000    # 1.5f
        0x0
    .end array-data

    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    :array_16
    .array-data 4
        0x427c0000    # 63.0f
        0x3fb33333    # 1.4f
        0x41000000    # 8.0f
    .end array-data

    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    :array_17
    .array-data 4
        0x43200000    # 160.0f
        0x40066666    # 2.1f
        0x41000000    # 8.0f
    .end array-data

    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    :array_18
    .array-data 4
        0x439d8000    # 315.0f
        0x4089999a    # 4.3f
        0x41000000    # 8.0f
    .end array-data

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
    :array_19
    .array-data 4
        0x45c4e000    # 6300.0f
        0x400b851f    # 2.18f
        0x41000000    # 8.0f
    .end array-data

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
    :array_1a
    .array-data 4
        0x46435000    # 12500.0f
        0x40533333    # 3.3f
        0x41000000    # 8.0f
    .end array-data

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
    :array_1b
    .array-data 4
        0x427c0000    # 63.0f
        0x3fb33333    # 1.4f
        0x41000000    # 8.0f
    .end array-data

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
    :array_1c
    .array-data 4
        0x43200000    # 160.0f
        0x40066666    # 2.1f
        0x41000000    # 8.0f
    .end array-data

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
    :array_1d
    .array-data 4
        0x439d8000    # 315.0f
        0x4089999a    # 4.3f
        0x41000000    # 8.0f
    .end array-data

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
    :array_1e
    .array-data 4
        0x41fa0000    # 31.25f
        0x3f800000    # 1.0f
        0x41100000    # 9.0f
    .end array-data

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
    :array_1f
    .array-data 4
        0x427a0000    # 62.5f
        0x3f800000    # 1.0f
        0x40e00000    # 7.0f
    .end array-data

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
    :array_20
    .array-data 4
        0x42fa0000    # 125.0f
        0x3fc00000    # 1.5f
        0x40a00000    # 5.0f
    .end array-data

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
    :array_21
    .array-data 4
        0x437a0000    # 250.0f
        0x3fc00000    # 1.5f
        0x40800000    # 4.0f
    .end array-data

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
    :array_22
    .array-data 4
        0x44fa0000    # 2000.0f
        0x3f800000    # 1.0f
        0x40e00000    # 7.0f
    .end array-data

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
    :array_23
    .array-data 4
        0x457a0000    # 4000.0f
        0x3fc00000    # 1.5f
        0x40400000    # 3.0f
    .end array-data

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
    :array_24
    .array-data 4
        0x45fa0000    # 8000.0f
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data

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
    :array_25
    .array-data 4
        0x467a0000    # 16000.0f
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data
.end method

.method private native _endChain(JLjava/lang/String;)I
.end method

.method private native _setElcChain(JLcom/immomo/audioeffect/ElctronicInfo;)I
.end method

.method private native _setEqChain(JLcom/immomo/audioeffect/EqEffectInfo;)I
.end method

.method private native _setReverbChain(JLcom/immomo/audioeffect/ReverbEffectInfo;)I
.end method

.method private native _startChain(JLjava/lang/String;)I
.end method

.method public static synthetic a(Lcom/immomo/audioeffect/AudioEffect;Ljava/lang/String;[BI)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/audioeffect/AudioEffect;->f(Ljava/lang/String;[BI)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private native destroy(J)V
.end method

.method private f(Ljava/lang/String;[BI)[B
    .locals 8

    .line 1
    const-string v0, "sox"

    .line 2
    .line 3
    const-string v1, "sox process"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    iget-wide v3, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 12
    .line 13
    const-wide/16 v5, 0x0

    .line 14
    .line 15
    cmp-long v0, v3, v5

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    move-object v2, p0

    .line 24
    move-object v5, p1

    .line 25
    move v7, p3

    .line 26
    invoke-direct/range {v2 .. v7}, Lcom/immomo/audioeffect/AudioEffect;->processNew(JLjava/lang/String;Ljava/nio/ByteBuffer;I)I

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    move-object p0, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit v1

    .line 34
    return-object p2

    .line 35
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method private h()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, -0x3

    .line 5
    const/16 v1, 0x50

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/16 v3, 0x46

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->basementEQ:[[F

    .line 18
    .line 19
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private i()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/16 v5, 0x15

    .line 4
    .line 5
    const/4 v6, -0x4

    .line 6
    const/16 v1, 0x57

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/16 v3, 0x13

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->bathroomEQ:[[F

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private native init_chain(J)V
.end method

.method private native init_effect(III)I
.end method

.method private k([[F)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->EQ:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/immomo/audioeffect/AudioEffect;->v(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    array-length v1, p1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_0

    .line 15
    .line 16
    aget-object v3, p1, v2

    .line 17
    .line 18
    new-instance v4, Lcom/immomo/audioeffect/EqEffectInfo;

    .line 19
    .line 20
    invoke-direct {v4, v3}, Lcom/immomo/audioeffect/EqEffectInfo;-><init>([F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->j(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/immomo/audioeffect/AudioEffect;->EQ:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/immomo/audioeffect/AudioEffect;->c(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lcom/immomo/audioeffect/AudioEffect$a;

    .line 5
    .line 6
    invoke-direct {v1, p0}, Lcom/immomo/audioeffect/AudioEffect$a;-><init>(Lcom/immomo/audioeffect/AudioEffect;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method private n()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/16 v5, 0xa

    .line 4
    .line 5
    const/4 v6, 0x6

    .line 6
    const/16 v1, 0x46

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/16 v3, 0x64

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->ktvEQ:[[F

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private o()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/16 v5, 0x21

    .line 4
    .line 5
    const/4 v6, -0x2

    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/16 v3, 0x50

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->newKtvEQ:[[F

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method private native process(JLjava/nio/ByteBuffer;I)I
.end method

.method private native processNew(JLjava/lang/String;Ljava/nio/ByteBuffer;I)I
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lcom/immomo/audioeffect/AudioEffect$c;

    .line 5
    .line 6
    invoke-direct {v1, p0}, Lcom/immomo/audioeffect/AudioEffect$c;-><init>(Lcom/immomo/audioeffect/AudioEffect;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method private s()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    const/16 v1, 0x50

    .line 6
    .line 7
    const/16 v2, 0x1e

    .line 8
    .line 9
    const/16 v3, 0x1e

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->studioEQ:[[F

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private t()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/16 v5, 0x1f4

    .line 4
    .line 5
    const/4 v6, -0x6

    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    const/16 v2, 0x14

    .line 9
    .line 10
    const/16 v3, 0x5a

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->theaterEQ:[[F

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private u()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ReverbEffectInfo;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, -0x7

    .line 5
    const/4 v1, 0x5

    .line 6
    const/16 v2, 0xf

    .line 7
    .line 8
    const/16 v3, 0x32

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-direct/range {v0 .. v6}, Lcom/immomo/audioeffect/ReverbEffectInfo;-><init>(IIIIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->workplaceEQ:[[F

    .line 18
    .line 19
    invoke-direct {p0, v0}, Lcom/immomo/audioeffect/AudioEffect;->k([[F)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->r()V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->mSyncObj:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 5
    .line 6
    invoke-direct {p0, v1, v2}, Lcom/immomo/audioeffect/AudioEffect;->destroy(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/audioeffect/AudioEffect;->_endChain(JLjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d([BI)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/audioeffect/AudioEffect;->procfun:Lcom/immomo/audioeffect/AudioEffect$b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2}, Lcom/immomo/audioeffect/AudioEffect$b;->a([BI)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public e(III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/audioeffect/AudioEffect;->init_effect(III)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-long p1, p1

    .line 6
    iput-wide p1, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 7
    .line 8
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :pswitch_0
    invoke-virtual {p0}, Lcom/immomo/audioeffect/AudioEffect;->l()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :pswitch_1
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->o()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_2
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->s()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_3
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->n()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_4
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->u()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_5
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->i()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_6
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->h()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_7
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->t()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_8
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->p()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_data_0
    .packed-switch 0x0
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

.method public j(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/audioeffect/EqEffectInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/immomo/audioeffect/EqEffectInfo;

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 18
    .line 19
    invoke-direct {p0, v1, v2, v0}, Lcom/immomo/audioeffect/AudioEffect;->_setEqChain(JLcom/immomo/audioeffect/EqEffectInfo;)I

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/audioeffect/ElctronicInfo;

    .line 2
    .line 3
    const/16 v1, 0x23

    .line 4
    .line 5
    const/16 v2, 0x50

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/immomo/audioeffect/ElctronicInfo;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iget-wide v1, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 11
    .line 12
    invoke-direct {p0, v1, v2, v0}, Lcom/immomo/audioeffect/AudioEffect;->_setElcChain(JLcom/immomo/audioeffect/ElctronicInfo;)I

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/immomo/audioeffect/AudioEffect;->m()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public q(Lcom/immomo/audioeffect/ReverbEffectInfo;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/audioeffect/AudioEffect;->_setReverbChain(JLcom/immomo/audioeffect/ReverbEffectInfo;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/audioeffect/AudioEffect;->handle:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/immomo/audioeffect/AudioEffect;->_startChain(JLjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method
