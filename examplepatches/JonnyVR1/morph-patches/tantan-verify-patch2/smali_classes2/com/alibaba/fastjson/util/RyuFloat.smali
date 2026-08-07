.class public final Lcom/alibaba/fastjson/util/RyuFloat;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final POW5_INV_SPLIT:[[I

.field private static final POW5_SPLIT:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 49

    .line 1
    const/high16 v0, 0x20000000

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    filled-new-array {v0, v1}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/high16 v0, 0x28000000

    .line 9
    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const/high16 v0, 0x32000000

    .line 15
    .line 16
    filled-new-array {v0, v1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    const/high16 v0, 0x3e800000    # 0.25f

    .line 21
    .line 22
    filled-new-array {v0, v1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    const/high16 v0, 0x27100000

    .line 27
    .line 28
    filled-new-array {v0, v1}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    const/high16 v0, 0x30d40000

    .line 33
    .line 34
    filled-new-array {v0, v1}, [I

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    const/high16 v0, 0x3d090000

    .line 39
    .line 40
    filled-new-array {v0, v1}, [I

    .line 41
    .line 42
    .line 43
    move-result-object v8

    .line 44
    const v0, 0x2625a000

    .line 45
    .line 46
    .line 47
    filled-new-array {v0, v1}, [I

    .line 48
    .line 49
    .line 50
    move-result-object v9

    .line 51
    const v0, 0x2faf0800

    .line 52
    .line 53
    .line 54
    filled-new-array {v0, v1}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    const v0, 0x3b9aca00

    .line 59
    .line 60
    .line 61
    filled-new-array {v0, v1}, [I

    .line 62
    .line 63
    .line 64
    move-result-object v11

    .line 65
    const v0, 0x2540be40

    .line 66
    .line 67
    .line 68
    filled-new-array {v0, v1}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v12

    .line 72
    const v0, 0x2e90edd0

    .line 73
    .line 74
    .line 75
    filled-new-array {v0, v1}, [I

    .line 76
    .line 77
    .line 78
    move-result-object v13

    .line 79
    const v0, 0x3a352944

    .line 80
    .line 81
    .line 82
    filled-new-array {v0, v1}, [I

    .line 83
    .line 84
    .line 85
    move-result-object v14

    .line 86
    const v0, 0x246139ca

    .line 87
    .line 88
    .line 89
    const/high16 v1, 0x40000000    # 2.0f

    .line 90
    .line 91
    filled-new-array {v0, v1}, [I

    .line 92
    .line 93
    .line 94
    move-result-object v15

    .line 95
    const v0, 0x2d79883d

    .line 96
    .line 97
    .line 98
    const/high16 v1, 0x10000000

    .line 99
    .line 100
    filled-new-array {v0, v1}, [I

    .line 101
    .line 102
    .line 103
    move-result-object v16

    .line 104
    const v0, 0x38d7ea4c

    .line 105
    .line 106
    .line 107
    const/high16 v1, 0x34000000

    .line 108
    .line 109
    filled-new-array {v0, v1}, [I

    .line 110
    .line 111
    .line 112
    move-result-object v17

    .line 113
    const v0, 0x2386f26f

    .line 114
    .line 115
    .line 116
    const/high16 v1, 0x60800000

    .line 117
    .line 118
    filled-new-array {v0, v1}, [I

    .line 119
    .line 120
    .line 121
    move-result-object v18

    .line 122
    const v0, 0x2c68af0b

    .line 123
    .line 124
    .line 125
    const/high16 v1, 0x58a00000

    .line 126
    .line 127
    filled-new-array {v0, v1}, [I

    .line 128
    .line 129
    .line 130
    move-result-object v19

    .line 131
    const v0, 0x3782dace

    .line 132
    .line 133
    .line 134
    const/high16 v1, 0x4ec80000    # 1.6777216E9f

    .line 135
    .line 136
    filled-new-array {v0, v1}, [I

    .line 137
    .line 138
    .line 139
    move-result-object v20

    .line 140
    const v0, 0x22b1c8c1

    .line 141
    .line 142
    .line 143
    const/high16 v1, 0x113d0000

    .line 144
    .line 145
    filled-new-array {v0, v1}, [I

    .line 146
    .line 147
    .line 148
    move-result-object v21

    .line 149
    const v0, 0x2b5e3af1

    .line 150
    .line 151
    .line 152
    const v1, 0x358c4000

    .line 153
    .line 154
    .line 155
    filled-new-array {v0, v1}, [I

    .line 156
    .line 157
    .line 158
    move-result-object v22

    .line 159
    const v0, 0x3635c9ad

    .line 160
    .line 161
    .line 162
    const v1, 0x62ef5000

    .line 163
    .line 164
    .line 165
    filled-new-array {v0, v1}, [I

    .line 166
    .line 167
    .line 168
    move-result-object v23

    .line 169
    const v0, 0x21e19e0c

    .line 170
    .line 171
    .line 172
    const v1, 0x4dd59200    # 4.478894E8f

    .line 173
    .line 174
    .line 175
    filled-new-array {v0, v1}, [I

    .line 176
    .line 177
    .line 178
    move-result-object v24

    .line 179
    const v0, 0x2a5a058f

    .line 180
    .line 181
    .line 182
    const v1, 0x614af680    # 2.3400028E20f

    .line 183
    .line 184
    .line 185
    filled-new-array {v0, v1}, [I

    .line 186
    .line 187
    .line 188
    move-result-object v25

    .line 189
    const v0, 0x34f086f3

    .line 190
    .line 191
    .line 192
    const v1, 0x599db420

    .line 193
    .line 194
    .line 195
    filled-new-array {v0, v1}, [I

    .line 196
    .line 197
    .line 198
    move-result-object v26

    .line 199
    const v0, 0x21165458

    .line 200
    .line 201
    .line 202
    const v1, 0x28029094    # 7.2478E-15f

    .line 203
    .line 204
    .line 205
    filled-new-array {v0, v1}, [I

    .line 206
    .line 207
    .line 208
    move-result-object v27

    .line 209
    const v0, 0x295be96e

    .line 210
    .line 211
    .line 212
    const v1, 0x320334b9

    .line 213
    .line 214
    .line 215
    filled-new-array {v0, v1}, [I

    .line 216
    .line 217
    .line 218
    move-result-object v28

    .line 219
    const v0, 0x33b2e3c9

    .line 220
    .line 221
    .line 222
    const v1, 0x7e8401e7

    .line 223
    .line 224
    .line 225
    filled-new-array {v0, v1}, [I

    .line 226
    .line 227
    .line 228
    move-result-object v29

    .line 229
    const v0, 0x204fce5e

    .line 230
    .line 231
    .line 232
    const v1, 0x1f128130

    .line 233
    .line 234
    .line 235
    filled-new-array {v0, v1}, [I

    .line 236
    .line 237
    .line 238
    move-result-object v30

    .line 239
    const v0, 0x2863c1f5

    .line 240
    .line 241
    .line 242
    const v1, 0x66d7217c

    .line 243
    .line 244
    .line 245
    filled-new-array {v0, v1}, [I

    .line 246
    .line 247
    .line 248
    move-result-object v31

    .line 249
    const v0, 0x327cb273

    .line 250
    .line 251
    .line 252
    const v1, 0x208ce9db

    .line 253
    .line 254
    .line 255
    filled-new-array {v0, v1}, [I

    .line 256
    .line 257
    .line 258
    move-result-object v32

    .line 259
    const v0, 0x3f1bdf10

    .line 260
    .line 261
    .line 262
    const v1, 0x8b02452

    .line 263
    .line 264
    .line 265
    filled-new-array {v0, v1}, [I

    .line 266
    .line 267
    .line 268
    move-result-object v33

    .line 269
    const v0, 0x27716b6a

    .line 270
    .line 271
    .line 272
    const v1, 0x56e16b3

    .line 273
    .line 274
    .line 275
    filled-new-array {v0, v1}, [I

    .line 276
    .line 277
    .line 278
    move-result-object v34

    .line 279
    const v0, 0x314dc644

    .line 280
    .line 281
    .line 282
    const v1, 0x46c99c60    # 25806.188f

    .line 283
    .line 284
    .line 285
    filled-new-array {v0, v1}, [I

    .line 286
    .line 287
    .line 288
    move-result-object v35

    .line 289
    const v0, 0x3da137d5

    .line 290
    .line 291
    .line 292
    const v1, 0x587c0378

    .line 293
    .line 294
    .line 295
    filled-new-array {v0, v1}, [I

    .line 296
    .line 297
    .line 298
    move-result-object v36

    .line 299
    const v0, 0x2684c2e5

    .line 300
    .line 301
    .line 302
    const v1, 0x474d822b

    .line 303
    .line 304
    .line 305
    filled-new-array {v0, v1}, [I

    .line 306
    .line 307
    .line 308
    move-result-object v37

    .line 309
    const v0, 0x3025f39e

    .line 310
    .line 311
    .line 312
    const v1, 0x7920e2b6

    .line 313
    .line 314
    .line 315
    filled-new-array {v0, v1}, [I

    .line 316
    .line 317
    .line 318
    move-result-object v38

    .line 319
    const v0, 0x3c2f7086

    .line 320
    .line 321
    .line 322
    const v1, 0x57691b64

    .line 323
    .line 324
    .line 325
    filled-new-array {v0, v1}, [I

    .line 326
    .line 327
    .line 328
    move-result-object v39

    .line 329
    const v0, 0x259da654

    .line 330
    .line 331
    .line 332
    const v1, 0x16a1b11e

    .line 333
    .line 334
    .line 335
    filled-new-array {v0, v1}, [I

    .line 336
    .line 337
    .line 338
    move-result-object v40

    .line 339
    const v0, 0x2f050fe9

    .line 340
    .line 341
    .line 342
    const v1, 0x1c4a1d66

    .line 343
    .line 344
    .line 345
    filled-new-array {v0, v1}, [I

    .line 346
    .line 347
    .line 348
    move-result-object v41

    .line 349
    const v0, 0x3ac653e3

    .line 350
    .line 351
    .line 352
    const v1, 0x435ca4bf

    .line 353
    .line 354
    .line 355
    filled-new-array {v0, v1}, [I

    .line 356
    .line 357
    .line 358
    move-result-object v42

    .line 359
    const v0, 0x24bbf46e

    .line 360
    .line 361
    .line 362
    const v1, 0x1a19e6f7

    .line 363
    .line 364
    .line 365
    filled-new-array {v0, v1}, [I

    .line 366
    .line 367
    .line 368
    move-result-object v43

    .line 369
    const v0, 0x2deaf189

    .line 370
    .line 371
    .line 372
    const v1, 0x60a060b5

    .line 373
    .line 374
    .line 375
    filled-new-array {v0, v1}, [I

    .line 376
    .line 377
    .line 378
    move-result-object v44

    .line 379
    const v0, 0x3965adec

    .line 380
    .line 381
    .line 382
    const v1, 0x18c878e3

    .line 383
    .line 384
    .line 385
    filled-new-array {v0, v1}, [I

    .line 386
    .line 387
    .line 388
    move-result-object v45

    .line 389
    const v0, 0x23df8cb3

    .line 390
    .line 391
    .line 392
    const v1, 0x4f7d4b8d

    .line 393
    .line 394
    .line 395
    filled-new-array {v0, v1}, [I

    .line 396
    .line 397
    .line 398
    move-result-object v46

    .line 399
    const v0, 0x2cd76fe0

    .line 400
    .line 401
    .line 402
    const v1, 0x435c9e71

    .line 403
    .line 404
    .line 405
    filled-new-array {v0, v1}, [I

    .line 406
    .line 407
    .line 408
    move-result-object v47

    .line 409
    const v0, 0x380d4bd8

    .line 410
    .line 411
    .line 412
    const v1, 0x5433c60d

    .line 413
    .line 414
    .line 415
    filled-new-array {v0, v1}, [I

    .line 416
    .line 417
    .line 418
    move-result-object v48

    .line 419
    filled-new-array/range {v2 .. v48}, [[I

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    sput-object v0, Lcom/alibaba/fastjson/util/RyuFloat;->POW5_SPLIT:[[I

    .line 424
    .line 425
    const/4 v0, 0x1

    .line 426
    const/high16 v1, 0x10000000

    .line 427
    .line 428
    filled-new-array {v1, v0}, [I

    .line 429
    .line 430
    .line 431
    move-result-object v2

    .line 432
    const v0, 0xccccccc

    .line 433
    .line 434
    .line 435
    const v1, 0x66666667

    .line 436
    .line 437
    .line 438
    filled-new-array {v0, v1}, [I

    .line 439
    .line 440
    .line 441
    move-result-object v3

    .line 442
    const v0, 0xa3d70a3

    .line 443
    .line 444
    .line 445
    const v1, 0x6b851eb9

    .line 446
    .line 447
    .line 448
    filled-new-array {v0, v1}, [I

    .line 449
    .line 450
    .line 451
    move-result-object v4

    .line 452
    const v0, 0x83126e9

    .line 453
    .line 454
    .line 455
    const v1, 0x3c6a7efa

    .line 456
    .line 457
    .line 458
    filled-new-array {v0, v1}, [I

    .line 459
    .line 460
    .line 461
    move-result-object v5

    .line 462
    const v0, 0xd1b7175

    .line 463
    .line 464
    .line 465
    const v1, 0x4710cb2a

    .line 466
    .line 467
    .line 468
    filled-new-array {v0, v1}, [I

    .line 469
    .line 470
    .line 471
    move-result-object v6

    .line 472
    const v0, 0xa7c5ac4

    .line 473
    .line 474
    .line 475
    const v1, 0x38da3c22

    .line 476
    .line 477
    .line 478
    filled-new-array {v0, v1}, [I

    .line 479
    .line 480
    .line 481
    move-result-object v7

    .line 482
    const v0, 0x8637bd0

    .line 483
    .line 484
    .line 485
    const v1, 0x2d7b634e

    .line 486
    .line 487
    .line 488
    filled-new-array {v0, v1}, [I

    .line 489
    .line 490
    .line 491
    move-result-object v8

    .line 492
    const v0, 0xd6bf94d

    .line 493
    .line 494
    .line 495
    const v1, 0x2f2bd216

    .line 496
    .line 497
    .line 498
    filled-new-array {v0, v1}, [I

    .line 499
    .line 500
    .line 501
    move-result-object v9

    .line 502
    const v0, 0xabcc771

    .line 503
    .line 504
    .line 505
    const v1, 0xc230e78

    .line 506
    .line 507
    .line 508
    filled-new-array {v0, v1}, [I

    .line 509
    .line 510
    .line 511
    move-result-object v10

    .line 512
    const v0, 0x89705f4

    .line 513
    .line 514
    .line 515
    const v1, 0x9b5a52d

    .line 516
    .line 517
    .line 518
    filled-new-array {v0, v1}, [I

    .line 519
    .line 520
    .line 521
    move-result-object v11

    .line 522
    const v0, 0xdbe6fec

    .line 523
    .line 524
    .line 525
    const v1, 0x75ef6eae

    .line 526
    .line 527
    .line 528
    filled-new-array {v0, v1}, [I

    .line 529
    .line 530
    .line 531
    move-result-object v12

    .line 532
    const v0, 0xafebff0

    .line 533
    .line 534
    .line 535
    const v1, 0x5e592558

    .line 536
    .line 537
    .line 538
    filled-new-array {v0, v1}, [I

    .line 539
    .line 540
    .line 541
    move-result-object v13

    .line 542
    const v0, 0x8cbccc0

    .line 543
    .line 544
    .line 545
    const v1, 0x4b7a8447    # 1.6417863E7f

    .line 546
    .line 547
    .line 548
    filled-new-array {v0, v1}, [I

    .line 549
    .line 550
    .line 551
    move-result-object v14

    .line 552
    const v0, 0xe12e134

    .line 553
    .line 554
    .line 555
    const v1, 0x125da071

    .line 556
    .line 557
    .line 558
    filled-new-array {v0, v1}, [I

    .line 559
    .line 560
    .line 561
    move-result-object v15

    .line 562
    const v0, 0xb424dc3

    .line 563
    .line 564
    .line 565
    const v1, 0x284ae6c1

    .line 566
    .line 567
    .line 568
    filled-new-array {v0, v1}, [I

    .line 569
    .line 570
    .line 571
    move-result-object v16

    .line 572
    const v0, 0x901d7cf

    .line 573
    .line 574
    .line 575
    const v1, 0x39d58567

    .line 576
    .line 577
    .line 578
    filled-new-array {v0, v1}, [I

    .line 579
    .line 580
    .line 581
    move-result-object v17

    .line 582
    const v0, 0xe69594b

    .line 583
    .line 584
    .line 585
    const v1, 0x76226f0b

    .line 586
    .line 587
    .line 588
    filled-new-array {v0, v1}, [I

    .line 589
    .line 590
    .line 591
    move-result-object v18

    .line 592
    const v0, 0xb877aa3

    .line 593
    .line 594
    .line 595
    const v1, 0x11b525a3

    .line 596
    .line 597
    .line 598
    filled-new-array {v0, v1}, [I

    .line 599
    .line 600
    .line 601
    move-result-object v19

    .line 602
    const v0, 0x9392ee8

    .line 603
    .line 604
    .line 605
    const v1, 0x7490eae9

    .line 606
    .line 607
    .line 608
    filled-new-array {v0, v1}, [I

    .line 609
    .line 610
    .line 611
    move-result-object v20

    .line 612
    const v0, 0xec1e4a7

    .line 613
    .line 614
    .line 615
    const v1, 0x6db4ab0e

    .line 616
    .line 617
    .line 618
    filled-new-array {v0, v1}, [I

    .line 619
    .line 620
    .line 621
    move-result-object v21

    .line 622
    const v0, 0xbce5086

    .line 623
    .line 624
    .line 625
    const v1, 0x249088d8

    .line 626
    .line 627
    .line 628
    filled-new-array {v0, v1}, [I

    .line 629
    .line 630
    .line 631
    move-result-object v22

    .line 632
    const v0, 0x971da05

    .line 633
    .line 634
    .line 635
    const v1, 0x3a6d3e0

    .line 636
    .line 637
    .line 638
    filled-new-array {v0, v1}, [I

    .line 639
    .line 640
    .line 641
    move-result-object v23

    .line 642
    const v0, 0xf1c9008

    .line 643
    .line 644
    .line 645
    const v1, 0x5d7b966

    .line 646
    .line 647
    .line 648
    filled-new-array {v0, v1}, [I

    .line 649
    .line 650
    .line 651
    move-result-object v24

    .line 652
    const v0, 0xc16d9a0

    .line 653
    .line 654
    .line 655
    const v1, 0x4ac9452

    .line 656
    .line 657
    .line 658
    filled-new-array {v0, v1}, [I

    .line 659
    .line 660
    .line 661
    move-result-object v25

    .line 662
    const v0, 0x9abe14c

    .line 663
    .line 664
    .line 665
    const v1, 0x6a23a9db

    .line 666
    .line 667
    .line 668
    filled-new-array {v0, v1}, [I

    .line 669
    .line 670
    .line 671
    move-result-object v26

    .line 672
    const v0, 0xf79687a

    .line 673
    .line 674
    .line 675
    const v1, 0x769f762b

    .line 676
    .line 677
    .line 678
    filled-new-array {v0, v1}, [I

    .line 679
    .line 680
    .line 681
    move-result-object v27

    .line 682
    const v0, 0xc612062

    .line 683
    .line 684
    .line 685
    const v1, 0x2bb2c4ef

    .line 686
    .line 687
    .line 688
    filled-new-array {v0, v1}, [I

    .line 689
    .line 690
    .line 691
    move-result-object v28

    .line 692
    const v0, 0x9e74d1b

    .line 693
    .line 694
    .line 695
    const v1, 0x3c8f03f3

    .line 696
    .line 697
    .line 698
    filled-new-array {v0, v1}, [I

    .line 699
    .line 700
    .line 701
    move-result-object v29

    .line 702
    const v0, 0xfd87b5f

    .line 703
    .line 704
    .line 705
    const v1, 0x14180651

    .line 706
    .line 707
    .line 708
    filled-new-array {v0, v1}, [I

    .line 709
    .line 710
    .line 711
    move-result-object v30

    .line 712
    const v0, 0xcad2f7f

    .line 713
    .line 714
    .line 715
    const v1, 0x29acd1da

    .line 716
    .line 717
    .line 718
    filled-new-array {v0, v1}, [I

    .line 719
    .line 720
    .line 721
    move-result-object v31

    .line 722
    const v0, 0xa2425ff

    .line 723
    .line 724
    .line 725
    const v1, 0x3af0a7e2

    .line 726
    .line 727
    .line 728
    filled-new-array {v0, v1}, [I

    .line 729
    .line 730
    .line 731
    move-result-object v32

    .line 732
    filled-new-array/range {v2 .. v32}, [[I

    .line 733
    .line 734
    .line 735
    move-result-object v0

    .line 736
    sput-object v0, Lcom/alibaba/fastjson/util/RyuFloat;->POW5_INV_SPLIT:[[I

    .line 737
    .line 738
    return-void
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

.method public static toString(F[CI)I
    .locals 37

    .line 1
    invoke-static/range {p0 .. p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    add-int/lit8 v0, p2, 0x1

    .line 8
    .line 9
    const/16 v1, 0x4e

    .line 10
    .line 11
    aput-char v1, p1, p2

    .line 12
    .line 13
    add-int/lit8 v2, p2, 0x2

    .line 14
    .line 15
    const/16 v3, 0x61

    .line 16
    .line 17
    aput-char v3, p1, v0

    .line 18
    .line 19
    add-int/lit8 v0, p2, 0x3

    .line 20
    .line 21
    aput-char v1, p1, v2

    .line 22
    .line 23
    :goto_0
    sub-int v0, v0, p2

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 27
    .line 28
    cmpl-float v0, p0, v0

    .line 29
    .line 30
    const/16 v1, 0x79

    .line 31
    .line 32
    const/16 v2, 0x74

    .line 33
    .line 34
    const/16 v3, 0x66

    .line 35
    .line 36
    const/16 v4, 0x49

    .line 37
    .line 38
    const/16 v5, 0x69

    .line 39
    .line 40
    const/16 v6, 0x6e

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    add-int/lit8 v0, p2, 0x1

    .line 45
    .line 46
    aput-char v4, p1, p2

    .line 47
    .line 48
    add-int/lit8 v4, p2, 0x2

    .line 49
    .line 50
    aput-char v6, p1, v0

    .line 51
    .line 52
    add-int/lit8 v0, p2, 0x3

    .line 53
    .line 54
    aput-char v3, p1, v4

    .line 55
    .line 56
    add-int/lit8 v3, p2, 0x4

    .line 57
    .line 58
    aput-char v5, p1, v0

    .line 59
    .line 60
    add-int/lit8 v0, p2, 0x5

    .line 61
    .line 62
    aput-char v6, p1, v3

    .line 63
    .line 64
    add-int/lit8 v3, p2, 0x6

    .line 65
    .line 66
    aput-char v5, p1, v0

    .line 67
    .line 68
    add-int/lit8 v0, p2, 0x7

    .line 69
    .line 70
    aput-char v2, p1, v3

    .line 71
    .line 72
    add-int/lit8 v2, p2, 0x8

    .line 73
    .line 74
    aput-char v1, p1, v0

    .line 75
    .line 76
    sub-int v2, v2, p2

    .line 77
    .line 78
    return v2

    .line 79
    :cond_1
    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    .line 80
    .line 81
    cmpl-float v0, p0, v0

    .line 82
    .line 83
    const/16 v7, 0x2d

    .line 84
    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    add-int/lit8 v0, p2, 0x1

    .line 88
    .line 89
    aput-char v7, p1, p2

    .line 90
    .line 91
    add-int/lit8 v7, p2, 0x2

    .line 92
    .line 93
    aput-char v4, p1, v0

    .line 94
    .line 95
    add-int/lit8 v0, p2, 0x3

    .line 96
    .line 97
    aput-char v6, p1, v7

    .line 98
    .line 99
    add-int/lit8 v4, p2, 0x4

    .line 100
    .line 101
    aput-char v3, p1, v0

    .line 102
    .line 103
    add-int/lit8 v0, p2, 0x5

    .line 104
    .line 105
    aput-char v5, p1, v4

    .line 106
    .line 107
    add-int/lit8 v3, p2, 0x6

    .line 108
    .line 109
    aput-char v6, p1, v0

    .line 110
    .line 111
    add-int/lit8 v0, p2, 0x7

    .line 112
    .line 113
    aput-char v5, p1, v3

    .line 114
    .line 115
    add-int/lit8 v3, p2, 0x8

    .line 116
    .line 117
    aput-char v2, p1, v0

    .line 118
    .line 119
    add-int/lit8 v0, p2, 0x9

    .line 120
    .line 121
    aput-char v1, p1, v3

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    invoke-static/range {p0 .. p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    const/16 v1, 0x2e

    .line 129
    .line 130
    const/16 v2, 0x30

    .line 131
    .line 132
    if-nez v0, :cond_3

    .line 133
    .line 134
    add-int/lit8 v0, p2, 0x1

    .line 135
    .line 136
    aput-char v2, p1, p2

    .line 137
    .line 138
    add-int/lit8 v3, p2, 0x2

    .line 139
    .line 140
    aput-char v1, p1, v0

    .line 141
    .line 142
    add-int/lit8 v0, p2, 0x3

    .line 143
    .line 144
    aput-char v2, p1, v3

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_3
    const/high16 v3, -0x80000000

    .line 148
    .line 149
    if-ne v0, v3, :cond_4

    .line 150
    .line 151
    add-int/lit8 v0, p2, 0x1

    .line 152
    .line 153
    aput-char v7, p1, p2

    .line 154
    .line 155
    add-int/lit8 v3, p2, 0x2

    .line 156
    .line 157
    aput-char v2, p1, v0

    .line 158
    .line 159
    add-int/lit8 v0, p2, 0x3

    .line 160
    .line 161
    aput-char v1, p1, v3

    .line 162
    .line 163
    add-int/lit8 v1, p2, 0x4

    .line 164
    .line 165
    aput-char v2, p1, v0

    .line 166
    .line 167
    sub-int v1, v1, p2

    .line 168
    .line 169
    return v1

    .line 170
    :cond_4
    shr-int/lit8 v3, v0, 0x17

    .line 171
    .line 172
    and-int/lit16 v3, v3, 0xff

    .line 173
    .line 174
    const v4, 0x7fffff

    .line 175
    .line 176
    .line 177
    and-int/2addr v4, v0

    .line 178
    if-nez v3, :cond_5

    .line 179
    .line 180
    const/16 v5, -0x95

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_5
    add-int/lit16 v5, v3, -0x96

    .line 184
    .line 185
    const/high16 v6, 0x800000

    .line 186
    .line 187
    or-int/2addr v4, v6

    .line 188
    :goto_1
    const/4 v8, 0x1

    .line 189
    if-gez v0, :cond_6

    .line 190
    .line 191
    move v0, v8

    .line 192
    goto :goto_2

    .line 193
    :cond_6
    const/4 v0, 0x0

    .line 194
    :goto_2
    and-int/lit8 v9, v4, 0x1

    .line 195
    .line 196
    if-nez v9, :cond_7

    .line 197
    .line 198
    move v9, v8

    .line 199
    goto :goto_3

    .line 200
    :cond_7
    const/4 v9, 0x0

    .line 201
    :goto_3
    mul-int/lit8 v10, v4, 0x4

    .line 202
    .line 203
    add-int/lit8 v11, v10, 0x2

    .line 204
    .line 205
    int-to-long v12, v4

    .line 206
    const-wide/32 v14, 0x800000

    .line 207
    .line 208
    .line 209
    cmp-long v4, v12, v14

    .line 210
    .line 211
    if-nez v4, :cond_9

    .line 212
    .line 213
    if-gt v3, v8, :cond_8

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_8
    move v3, v8

    .line 217
    goto :goto_5

    .line 218
    :cond_9
    :goto_4
    const/4 v3, 0x2

    .line 219
    :goto_5
    sub-int v3, v10, v3

    .line 220
    .line 221
    add-int/lit8 v5, v5, -0x2

    .line 222
    .line 223
    const-wide/32 v15, 0x98967f

    .line 224
    .line 225
    .line 226
    const-wide/32 v17, 0x1624c50

    .line 227
    .line 228
    .line 229
    const-wide/32 v19, 0x989680

    .line 230
    .line 231
    .line 232
    move/from16 p0, v1

    .line 233
    .line 234
    if-ltz v5, :cond_16

    .line 235
    .line 236
    move/from16 v21, v7

    .line 237
    .line 238
    const/16 v22, 0x0

    .line 239
    .line 240
    int-to-long v6, v5

    .line 241
    const-wide/32 v23, 0x2deefb

    .line 242
    .line 243
    .line 244
    mul-long v6, v6, v23

    .line 245
    .line 246
    div-long v6, v6, v19

    .line 247
    .line 248
    long-to-int v6, v6

    .line 249
    if-nez v6, :cond_a

    .line 250
    .line 251
    move v12, v8

    .line 252
    const/4 v7, 0x2

    .line 253
    const-wide/16 v23, 0xa

    .line 254
    .line 255
    goto :goto_6

    .line 256
    :cond_a
    const/4 v7, 0x2

    .line 257
    const-wide/16 v23, 0xa

    .line 258
    .line 259
    int-to-long v12, v6

    .line 260
    mul-long v12, v12, v17

    .line 261
    .line 262
    add-long/2addr v12, v15

    .line 263
    div-long v12, v12, v19

    .line 264
    .line 265
    long-to-int v12, v12

    .line 266
    :goto_6
    add-int/lit8 v12, v12, 0x3a

    .line 267
    .line 268
    neg-int v5, v5

    .line 269
    add-int/2addr v5, v6

    .line 270
    add-int/2addr v12, v5

    .line 271
    sget-object v13, Lcom/alibaba/fastjson/util/RyuFloat;->POW5_INV_SPLIT:[[I

    .line 272
    .line 273
    aget-object v14, v13, v6

    .line 274
    .line 275
    move/from16 v25, v2

    .line 276
    .line 277
    aget v2, v14, v22

    .line 278
    .line 279
    move/from16 v27, v5

    .line 280
    .line 281
    const/16 v26, 0x1f

    .line 282
    .line 283
    int-to-long v4, v2

    .line 284
    aget v2, v14, v8

    .line 285
    .line 286
    const/16 v14, 0xa

    .line 287
    .line 288
    int-to-long v1, v2

    .line 289
    move-wide/from16 v28, v15

    .line 290
    .line 291
    move/from16 v16, v14

    .line 292
    .line 293
    int-to-long v14, v10

    .line 294
    mul-long v30, v14, v4

    .line 295
    .line 296
    mul-long v32, v14, v1

    .line 297
    .line 298
    shr-long v32, v32, v26

    .line 299
    .line 300
    add-long v30, v30, v32

    .line 301
    .line 302
    add-int/lit8 v12, v12, -0x1f

    .line 303
    .line 304
    move/from16 v33, v7

    .line 305
    .line 306
    move/from16 v32, v8

    .line 307
    .line 308
    shr-long v7, v30, v12

    .line 309
    .line 310
    long-to-int v7, v7

    .line 311
    move v8, v0

    .line 312
    move-wide/from16 v30, v1

    .line 313
    .line 314
    int-to-long v0, v11

    .line 315
    mul-long v34, v0, v4

    .line 316
    .line 317
    mul-long v0, v0, v30

    .line 318
    .line 319
    shr-long v0, v0, v26

    .line 320
    .line 321
    add-long v34, v34, v0

    .line 322
    .line 323
    shr-long v0, v34, v12

    .line 324
    .line 325
    long-to-int v0, v0

    .line 326
    int-to-long v1, v3

    .line 327
    mul-long/2addr v4, v1

    .line 328
    mul-long v1, v1, v30

    .line 329
    .line 330
    shr-long v1, v1, v26

    .line 331
    .line 332
    add-long/2addr v4, v1

    .line 333
    shr-long v1, v4, v12

    .line 334
    .line 335
    long-to-int v1, v1

    .line 336
    if-eqz v6, :cond_c

    .line 337
    .line 338
    add-int/lit8 v2, v0, -0x1

    .line 339
    .line 340
    div-int/lit8 v2, v2, 0xa

    .line 341
    .line 342
    div-int/lit8 v4, v1, 0xa

    .line 343
    .line 344
    if-gt v2, v4, :cond_c

    .line 345
    .line 346
    add-int/lit8 v2, v6, -0x1

    .line 347
    .line 348
    if-nez v2, :cond_b

    .line 349
    .line 350
    move/from16 v4, v32

    .line 351
    .line 352
    goto :goto_7

    .line 353
    :cond_b
    int-to-long v4, v2

    .line 354
    mul-long v4, v4, v17

    .line 355
    .line 356
    add-long v4, v4, v28

    .line 357
    .line 358
    div-long v4, v4, v19

    .line 359
    .line 360
    long-to-int v4, v4

    .line 361
    :goto_7
    add-int/lit8 v4, v4, 0x3a

    .line 362
    .line 363
    add-int/lit8 v5, v27, -0x1

    .line 364
    .line 365
    add-int/2addr v5, v4

    .line 366
    aget-object v2, v13, v2

    .line 367
    .line 368
    aget v4, v2, v22

    .line 369
    .line 370
    int-to-long v12, v4

    .line 371
    mul-long/2addr v12, v14

    .line 372
    aget v2, v2, v32

    .line 373
    .line 374
    move v4, v0

    .line 375
    move/from16 v27, v1

    .line 376
    .line 377
    int-to-long v0, v2

    .line 378
    mul-long/2addr v14, v0

    .line 379
    shr-long v0, v14, v26

    .line 380
    .line 381
    add-long/2addr v12, v0

    .line 382
    add-int/lit8 v5, v5, -0x1f

    .line 383
    .line 384
    shr-long v0, v12, v5

    .line 385
    .line 386
    rem-long v0, v0, v23

    .line 387
    .line 388
    long-to-int v0, v0

    .line 389
    goto :goto_8

    .line 390
    :cond_c
    move v4, v0

    .line 391
    move/from16 v27, v1

    .line 392
    .line 393
    move/from16 v0, v22

    .line 394
    .line 395
    :goto_8
    move/from16 v1, v22

    .line 396
    .line 397
    :goto_9
    if-lez v11, :cond_e

    .line 398
    .line 399
    rem-int/lit8 v2, v11, 0x5

    .line 400
    .line 401
    if-eqz v2, :cond_d

    .line 402
    .line 403
    goto :goto_a

    .line 404
    :cond_d
    div-int/lit8 v11, v11, 0x5

    .line 405
    .line 406
    add-int/lit8 v1, v1, 0x1

    .line 407
    .line 408
    goto :goto_9

    .line 409
    :cond_e
    :goto_a
    move/from16 v2, v22

    .line 410
    .line 411
    :goto_b
    if-lez v10, :cond_10

    .line 412
    .line 413
    rem-int/lit8 v5, v10, 0x5

    .line 414
    .line 415
    if-eqz v5, :cond_f

    .line 416
    .line 417
    goto :goto_c

    .line 418
    :cond_f
    div-int/lit8 v10, v10, 0x5

    .line 419
    .line 420
    add-int/lit8 v2, v2, 0x1

    .line 421
    .line 422
    goto :goto_b

    .line 423
    :cond_10
    :goto_c
    move/from16 v5, v22

    .line 424
    .line 425
    :goto_d
    if-lez v3, :cond_12

    .line 426
    .line 427
    rem-int/lit8 v10, v3, 0x5

    .line 428
    .line 429
    if-eqz v10, :cond_11

    .line 430
    .line 431
    goto :goto_e

    .line 432
    :cond_11
    div-int/lit8 v3, v3, 0x5

    .line 433
    .line 434
    add-int/lit8 v5, v5, 0x1

    .line 435
    .line 436
    goto :goto_d

    .line 437
    :cond_12
    :goto_e
    if-lt v1, v6, :cond_13

    .line 438
    .line 439
    move/from16 v1, v32

    .line 440
    .line 441
    goto :goto_f

    .line 442
    :cond_13
    move/from16 v1, v22

    .line 443
    .line 444
    :goto_f
    if-lt v2, v6, :cond_14

    .line 445
    .line 446
    move/from16 v2, v32

    .line 447
    .line 448
    goto :goto_10

    .line 449
    :cond_14
    move/from16 v2, v22

    .line 450
    .line 451
    :goto_10
    if-lt v5, v6, :cond_15

    .line 452
    .line 453
    move/from16 v3, v32

    .line 454
    .line 455
    goto :goto_11

    .line 456
    :cond_15
    move/from16 v3, v22

    .line 457
    .line 458
    :goto_11
    move v5, v1

    .line 459
    move/from16 v30, v7

    .line 460
    .line 461
    move v1, v0

    .line 462
    move v7, v2

    .line 463
    move v0, v4

    .line 464
    move/from16 v2, v27

    .line 465
    .line 466
    goto/16 :goto_19

    .line 467
    .line 468
    :cond_16
    move/from16 v25, v2

    .line 469
    .line 470
    move/from16 v21, v7

    .line 471
    .line 472
    move/from16 v32, v8

    .line 473
    .line 474
    move-wide/from16 v28, v15

    .line 475
    .line 476
    const/16 v16, 0xa

    .line 477
    .line 478
    const/16 v22, 0x0

    .line 479
    .line 480
    const-wide/16 v23, 0xa

    .line 481
    .line 482
    const/16 v26, 0x1f

    .line 483
    .line 484
    const/16 v33, 0x2

    .line 485
    .line 486
    move v8, v0

    .line 487
    neg-int v0, v5

    .line 488
    int-to-long v1, v0

    .line 489
    const-wide/32 v6, 0x6aa784

    .line 490
    .line 491
    .line 492
    mul-long/2addr v1, v6

    .line 493
    div-long v1, v1, v19

    .line 494
    .line 495
    long-to-int v1, v1

    .line 496
    sub-int/2addr v0, v1

    .line 497
    if-nez v0, :cond_17

    .line 498
    .line 499
    move/from16 v2, v32

    .line 500
    .line 501
    goto :goto_12

    .line 502
    :cond_17
    int-to-long v6, v0

    .line 503
    mul-long v6, v6, v17

    .line 504
    .line 505
    add-long v6, v6, v28

    .line 506
    .line 507
    div-long v6, v6, v19

    .line 508
    .line 509
    long-to-int v2, v6

    .line 510
    :goto_12
    add-int/lit8 v2, v2, -0x3d

    .line 511
    .line 512
    sub-int v2, v1, v2

    .line 513
    .line 514
    sget-object v4, Lcom/alibaba/fastjson/util/RyuFloat;->POW5_SPLIT:[[I

    .line 515
    .line 516
    aget-object v6, v4, v0

    .line 517
    .line 518
    aget v7, v6, v22

    .line 519
    .line 520
    int-to-long v12, v7

    .line 521
    aget v6, v6, v32

    .line 522
    .line 523
    int-to-long v6, v6

    .line 524
    add-int/lit8 v2, v2, -0x1f

    .line 525
    .line 526
    int-to-long v14, v10

    .line 527
    mul-long v30, v14, v12

    .line 528
    .line 529
    mul-long v34, v14, v6

    .line 530
    .line 531
    shr-long v34, v34, v26

    .line 532
    .line 533
    add-long v30, v30, v34

    .line 534
    .line 535
    move-object/from16 v34, v4

    .line 536
    .line 537
    move/from16 v27, v5

    .line 538
    .line 539
    shr-long v4, v30, v2

    .line 540
    .line 541
    long-to-int v4, v4

    .line 542
    move/from16 v30, v4

    .line 543
    .line 544
    int-to-long v4, v11

    .line 545
    mul-long v35, v4, v12

    .line 546
    .line 547
    mul-long/2addr v4, v6

    .line 548
    shr-long v4, v4, v26

    .line 549
    .line 550
    add-long v35, v35, v4

    .line 551
    .line 552
    shr-long v4, v35, v2

    .line 553
    .line 554
    long-to-int v4, v4

    .line 555
    move v11, v4

    .line 556
    int-to-long v4, v3

    .line 557
    mul-long/2addr v12, v4

    .line 558
    mul-long/2addr v4, v6

    .line 559
    shr-long v4, v4, v26

    .line 560
    .line 561
    add-long/2addr v12, v4

    .line 562
    shr-long v4, v12, v2

    .line 563
    .line 564
    long-to-int v2, v4

    .line 565
    if-eqz v1, :cond_19

    .line 566
    .line 567
    add-int/lit8 v4, v11, -0x1

    .line 568
    .line 569
    div-int/lit8 v4, v4, 0xa

    .line 570
    .line 571
    div-int/lit8 v5, v2, 0xa

    .line 572
    .line 573
    if-gt v4, v5, :cond_19

    .line 574
    .line 575
    add-int/lit8 v0, v0, 0x1

    .line 576
    .line 577
    add-int/lit8 v4, v1, -0x1

    .line 578
    .line 579
    if-nez v0, :cond_18

    .line 580
    .line 581
    move/from16 v5, v32

    .line 582
    .line 583
    goto :goto_13

    .line 584
    :cond_18
    int-to-long v5, v0

    .line 585
    mul-long v5, v5, v17

    .line 586
    .line 587
    add-long v5, v5, v28

    .line 588
    .line 589
    div-long v5, v5, v19

    .line 590
    .line 591
    long-to-int v5, v5

    .line 592
    :goto_13
    add-int/lit8 v5, v5, -0x3d

    .line 593
    .line 594
    sub-int/2addr v4, v5

    .line 595
    aget-object v0, v34, v0

    .line 596
    .line 597
    aget v5, v0, v22

    .line 598
    .line 599
    int-to-long v5, v5

    .line 600
    mul-long/2addr v5, v14

    .line 601
    aget v0, v0, v32

    .line 602
    .line 603
    int-to-long v12, v0

    .line 604
    mul-long/2addr v14, v12

    .line 605
    shr-long v12, v14, v26

    .line 606
    .line 607
    add-long/2addr v5, v12

    .line 608
    add-int/lit8 v4, v4, -0x1f

    .line 609
    .line 610
    shr-long v4, v5, v4

    .line 611
    .line 612
    rem-long v4, v4, v23

    .line 613
    .line 614
    long-to-int v0, v4

    .line 615
    goto :goto_14

    .line 616
    :cond_19
    move/from16 v0, v22

    .line 617
    .line 618
    :goto_14
    add-int v6, v1, v27

    .line 619
    .line 620
    move/from16 v4, v32

    .line 621
    .line 622
    if-lt v4, v1, :cond_1a

    .line 623
    .line 624
    move v5, v4

    .line 625
    goto :goto_15

    .line 626
    :cond_1a
    move/from16 v5, v22

    .line 627
    .line 628
    :goto_15
    const/16 v7, 0x17

    .line 629
    .line 630
    if-ge v1, v7, :cond_1b

    .line 631
    .line 632
    add-int/lit8 v7, v1, -0x1

    .line 633
    .line 634
    shl-int v7, v4, v7

    .line 635
    .line 636
    sub-int/2addr v7, v4

    .line 637
    and-int/2addr v7, v10

    .line 638
    if-nez v7, :cond_1b

    .line 639
    .line 640
    move v7, v4

    .line 641
    goto :goto_16

    .line 642
    :cond_1b
    move/from16 v7, v22

    .line 643
    .line 644
    :goto_16
    rem-int/lit8 v3, v3, 0x2

    .line 645
    .line 646
    if-ne v3, v4, :cond_1c

    .line 647
    .line 648
    move/from16 v3, v22

    .line 649
    .line 650
    goto :goto_17

    .line 651
    :cond_1c
    const/4 v3, 0x1

    .line 652
    :goto_17
    if-lt v3, v1, :cond_1d

    .line 653
    .line 654
    const/4 v1, 0x1

    .line 655
    goto :goto_18

    .line 656
    :cond_1d
    move/from16 v1, v22

    .line 657
    .line 658
    :goto_18
    move v3, v1

    .line 659
    move v1, v0

    .line 660
    move v0, v11

    .line 661
    :goto_19
    const v4, 0x3b9aca00

    .line 662
    .line 663
    .line 664
    move/from16 v14, v16

    .line 665
    .line 666
    :goto_1a
    if-lez v14, :cond_1f

    .line 667
    .line 668
    if-lt v0, v4, :cond_1e

    .line 669
    .line 670
    goto :goto_1b

    .line 671
    :cond_1e
    div-int/lit8 v4, v4, 0xa

    .line 672
    .line 673
    add-int/lit8 v14, v14, -0x1

    .line 674
    .line 675
    goto :goto_1a

    .line 676
    :cond_1f
    :goto_1b
    add-int/2addr v6, v14

    .line 677
    add-int/lit8 v4, v6, -0x1

    .line 678
    .line 679
    const/4 v10, -0x3

    .line 680
    if-lt v4, v10, :cond_21

    .line 681
    .line 682
    const/4 v10, 0x7

    .line 683
    if-lt v4, v10, :cond_20

    .line 684
    .line 685
    goto :goto_1c

    .line 686
    :cond_20
    move/from16 v10, v22

    .line 687
    .line 688
    goto :goto_1d

    .line 689
    :cond_21
    :goto_1c
    const/4 v10, 0x1

    .line 690
    :goto_1d
    if-eqz v5, :cond_22

    .line 691
    .line 692
    if-nez v9, :cond_22

    .line 693
    .line 694
    add-int/lit8 v0, v0, -0x1

    .line 695
    .line 696
    :cond_22
    move/from16 v5, v22

    .line 697
    .line 698
    :goto_1e
    div-int/lit8 v11, v0, 0xa

    .line 699
    .line 700
    div-int/lit8 v12, v2, 0xa

    .line 701
    .line 702
    const/16 v13, 0x64

    .line 703
    .line 704
    if-le v11, v12, :cond_25

    .line 705
    .line 706
    if-ge v0, v13, :cond_23

    .line 707
    .line 708
    if-eqz v10, :cond_23

    .line 709
    .line 710
    goto :goto_20

    .line 711
    :cond_23
    rem-int/lit8 v2, v2, 0xa

    .line 712
    .line 713
    if-nez v2, :cond_24

    .line 714
    .line 715
    const/4 v0, 0x1

    .line 716
    goto :goto_1f

    .line 717
    :cond_24
    move/from16 v0, v22

    .line 718
    .line 719
    :goto_1f
    and-int/2addr v3, v0

    .line 720
    rem-int/lit8 v1, v30, 0xa

    .line 721
    .line 722
    div-int/lit8 v30, v30, 0xa

    .line 723
    .line 724
    add-int/lit8 v5, v5, 0x1

    .line 725
    .line 726
    move v0, v11

    .line 727
    move v2, v12

    .line 728
    goto :goto_1e

    .line 729
    :cond_25
    :goto_20
    if-eqz v3, :cond_27

    .line 730
    .line 731
    if-eqz v9, :cond_27

    .line 732
    .line 733
    :goto_21
    rem-int/lit8 v11, v2, 0xa

    .line 734
    .line 735
    if-nez v11, :cond_27

    .line 736
    .line 737
    if-ge v0, v13, :cond_26

    .line 738
    .line 739
    if-eqz v10, :cond_26

    .line 740
    .line 741
    goto :goto_22

    .line 742
    :cond_26
    div-int/lit8 v0, v0, 0xa

    .line 743
    .line 744
    rem-int/lit8 v1, v30, 0xa

    .line 745
    .line 746
    div-int/lit8 v30, v30, 0xa

    .line 747
    .line 748
    div-int/lit8 v2, v2, 0xa

    .line 749
    .line 750
    add-int/lit8 v5, v5, 0x1

    .line 751
    .line 752
    goto :goto_21

    .line 753
    :cond_27
    :goto_22
    move/from16 v0, v30

    .line 754
    .line 755
    const/4 v11, 0x5

    .line 756
    if-eqz v7, :cond_28

    .line 757
    .line 758
    if-ne v1, v11, :cond_28

    .line 759
    .line 760
    rem-int/lit8 v7, v0, 0x2

    .line 761
    .line 762
    if-nez v7, :cond_28

    .line 763
    .line 764
    const/4 v1, 0x4

    .line 765
    :cond_28
    if-ne v0, v2, :cond_29

    .line 766
    .line 767
    if-eqz v3, :cond_2a

    .line 768
    .line 769
    if-eqz v9, :cond_2a

    .line 770
    .line 771
    :cond_29
    if-lt v1, v11, :cond_2b

    .line 772
    .line 773
    :cond_2a
    const/4 v1, 0x1

    .line 774
    goto :goto_23

    .line 775
    :cond_2b
    move/from16 v1, v22

    .line 776
    .line 777
    :goto_23
    add-int/2addr v0, v1

    .line 778
    sub-int v1, v14, v5

    .line 779
    .line 780
    if-eqz v8, :cond_2c

    .line 781
    .line 782
    add-int/lit8 v2, p2, 0x1

    .line 783
    .line 784
    aput-char v21, p1, p2

    .line 785
    .line 786
    goto :goto_24

    .line 787
    :cond_2c
    move/from16 v2, p2

    .line 788
    .line 789
    :goto_24
    if-eqz v10, :cond_31

    .line 790
    .line 791
    move/from16 v6, v22

    .line 792
    .line 793
    :goto_25
    add-int/lit8 v3, v1, -0x1

    .line 794
    .line 795
    if-ge v6, v3, :cond_2d

    .line 796
    .line 797
    rem-int/lit8 v3, v0, 0xa

    .line 798
    .line 799
    div-int/lit8 v0, v0, 0xa

    .line 800
    .line 801
    add-int v5, v2, v1

    .line 802
    .line 803
    sub-int/2addr v5, v6

    .line 804
    add-int/lit8 v3, v3, 0x30

    .line 805
    .line 806
    int-to-char v3, v3

    .line 807
    aput-char v3, p1, v5

    .line 808
    .line 809
    add-int/lit8 v6, v6, 0x1

    .line 810
    .line 811
    goto :goto_25

    .line 812
    :cond_2d
    rem-int/lit8 v0, v0, 0xa

    .line 813
    .line 814
    add-int/lit8 v0, v0, 0x30

    .line 815
    .line 816
    int-to-char v0, v0

    .line 817
    aput-char v0, p1, v2

    .line 818
    .line 819
    add-int/lit8 v0, v2, 0x1

    .line 820
    .line 821
    aput-char p0, p1, v0

    .line 822
    .line 823
    add-int/lit8 v0, v1, 0x1

    .line 824
    .line 825
    add-int/2addr v2, v0

    .line 826
    const/4 v0, 0x1

    .line 827
    if-ne v1, v0, :cond_2e

    .line 828
    .line 829
    add-int/lit8 v0, v2, 0x1

    .line 830
    .line 831
    aput-char v25, p1, v2

    .line 832
    .line 833
    move v2, v0

    .line 834
    :cond_2e
    add-int/lit8 v0, v2, 0x1

    .line 835
    .line 836
    const/16 v1, 0x45

    .line 837
    .line 838
    aput-char v1, p1, v2

    .line 839
    .line 840
    if-gez v4, :cond_2f

    .line 841
    .line 842
    add-int/lit8 v2, v2, 0x2

    .line 843
    .line 844
    aput-char v21, p1, v0

    .line 845
    .line 846
    neg-int v4, v4

    .line 847
    move v0, v2

    .line 848
    :cond_2f
    move/from16 v14, v16

    .line 849
    .line 850
    if-lt v4, v14, :cond_30

    .line 851
    .line 852
    add-int/lit8 v1, v0, 0x1

    .line 853
    .line 854
    div-int/lit8 v2, v4, 0xa

    .line 855
    .line 856
    add-int/lit8 v2, v2, 0x30

    .line 857
    .line 858
    int-to-char v2, v2

    .line 859
    aput-char v2, p1, v0

    .line 860
    .line 861
    move v0, v1

    .line 862
    :cond_30
    add-int/lit8 v1, v0, 0x1

    .line 863
    .line 864
    const/16 v14, 0xa

    .line 865
    .line 866
    rem-int/2addr v4, v14

    .line 867
    add-int/lit8 v4, v4, 0x30

    .line 868
    .line 869
    int-to-char v2, v4

    .line 870
    aput-char v2, p1, v0

    .line 871
    .line 872
    goto/16 :goto_2b

    .line 873
    .line 874
    :cond_31
    if-gez v4, :cond_34

    .line 875
    .line 876
    add-int/lit8 v3, v2, 0x1

    .line 877
    .line 878
    aput-char v25, p1, v2

    .line 879
    .line 880
    add-int/lit8 v2, v2, 0x2

    .line 881
    .line 882
    aput-char p0, p1, v3

    .line 883
    .line 884
    const/4 v3, -0x1

    .line 885
    :goto_26
    if-le v3, v4, :cond_32

    .line 886
    .line 887
    add-int/lit8 v5, v2, 0x1

    .line 888
    .line 889
    aput-char v25, p1, v2

    .line 890
    .line 891
    add-int/lit8 v3, v3, -0x1

    .line 892
    .line 893
    move v2, v5

    .line 894
    goto :goto_26

    .line 895
    :cond_32
    move v3, v2

    .line 896
    move/from16 v6, v22

    .line 897
    .line 898
    :goto_27
    if-ge v6, v1, :cond_33

    .line 899
    .line 900
    add-int v4, v2, v1

    .line 901
    .line 902
    sub-int/2addr v4, v6

    .line 903
    const/16 v32, 0x1

    .line 904
    .line 905
    add-int/lit8 v4, v4, -0x1

    .line 906
    .line 907
    rem-int/lit8 v5, v0, 0xa

    .line 908
    .line 909
    add-int/lit8 v5, v5, 0x30

    .line 910
    .line 911
    int-to-char v5, v5

    .line 912
    aput-char v5, p1, v4

    .line 913
    .line 914
    const/16 v14, 0xa

    .line 915
    .line 916
    div-int/2addr v0, v14

    .line 917
    add-int/lit8 v3, v3, 0x1

    .line 918
    .line 919
    add-int/lit8 v6, v6, 0x1

    .line 920
    .line 921
    goto :goto_27

    .line 922
    :cond_33
    move v1, v3

    .line 923
    goto :goto_2b

    .line 924
    :cond_34
    if-lt v6, v1, :cond_37

    .line 925
    .line 926
    move/from16 v3, v22

    .line 927
    .line 928
    :goto_28
    if-ge v3, v1, :cond_35

    .line 929
    .line 930
    add-int v4, v2, v1

    .line 931
    .line 932
    sub-int/2addr v4, v3

    .line 933
    const/16 v32, 0x1

    .line 934
    .line 935
    add-int/lit8 v4, v4, -0x1

    .line 936
    .line 937
    rem-int/lit8 v5, v0, 0xa

    .line 938
    .line 939
    add-int/lit8 v5, v5, 0x30

    .line 940
    .line 941
    int-to-char v5, v5

    .line 942
    aput-char v5, p1, v4

    .line 943
    .line 944
    const/16 v14, 0xa

    .line 945
    .line 946
    div-int/2addr v0, v14

    .line 947
    add-int/lit8 v3, v3, 0x1

    .line 948
    .line 949
    goto :goto_28

    .line 950
    :cond_35
    add-int/2addr v2, v1

    .line 951
    :goto_29
    if-ge v1, v6, :cond_36

    .line 952
    .line 953
    add-int/lit8 v0, v2, 0x1

    .line 954
    .line 955
    aput-char v25, p1, v2

    .line 956
    .line 957
    add-int/lit8 v1, v1, 0x1

    .line 958
    .line 959
    move v2, v0

    .line 960
    goto :goto_29

    .line 961
    :cond_36
    add-int/lit8 v0, v2, 0x1

    .line 962
    .line 963
    aput-char p0, p1, v2

    .line 964
    .line 965
    add-int/lit8 v1, v2, 0x2

    .line 966
    .line 967
    aput-char v25, p1, v0

    .line 968
    .line 969
    goto :goto_2b

    .line 970
    :cond_37
    add-int/lit8 v3, v2, 0x1

    .line 971
    .line 972
    move/from16 v6, v22

    .line 973
    .line 974
    :goto_2a
    if-ge v6, v1, :cond_39

    .line 975
    .line 976
    sub-int v5, v1, v6

    .line 977
    .line 978
    const/16 v32, 0x1

    .line 979
    .line 980
    add-int/lit8 v5, v5, -0x1

    .line 981
    .line 982
    if-ne v5, v4, :cond_38

    .line 983
    .line 984
    add-int v5, v3, v1

    .line 985
    .line 986
    sub-int/2addr v5, v6

    .line 987
    add-int/lit8 v5, v5, -0x1

    .line 988
    .line 989
    aput-char p0, p1, v5

    .line 990
    .line 991
    add-int/lit8 v3, v3, -0x1

    .line 992
    .line 993
    :cond_38
    add-int v5, v3, v1

    .line 994
    .line 995
    sub-int/2addr v5, v6

    .line 996
    add-int/lit8 v5, v5, -0x1

    .line 997
    .line 998
    rem-int/lit8 v7, v0, 0xa

    .line 999
    .line 1000
    add-int/lit8 v7, v7, 0x30

    .line 1001
    .line 1002
    int-to-char v7, v7

    .line 1003
    aput-char v7, p1, v5

    .line 1004
    .line 1005
    const/16 v14, 0xa

    .line 1006
    .line 1007
    div-int/2addr v0, v14

    .line 1008
    add-int/lit8 v6, v6, 0x1

    .line 1009
    .line 1010
    goto :goto_2a

    .line 1011
    :cond_39
    const/16 v32, 0x1

    .line 1012
    .line 1013
    add-int/lit8 v1, v1, 0x1

    .line 1014
    .line 1015
    add-int/2addr v1, v2

    .line 1016
    :goto_2b
    sub-int v1, v1, p2

    .line 1017
    .line 1018
    return v1
.end method

.method public static toString(F)Ljava/lang/String;
    .locals 3

    const/16 v0, 0xf

    .line 1019
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 1020
    invoke-static {p0, v0, v1}, Lcom/alibaba/fastjson/util/RyuFloat;->toString(F[CI)I

    move-result p0

    .line 1021
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v1, p0}, Ljava/lang/String;-><init>([CII)V

    return-object v2
.end method
