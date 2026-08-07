.class public final Ll/bur0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/itr0;


# instance fields
.field public final a:Ll/dfw0;

.field public final b:Landroid/util/SparseArray;

.field public final c:Landroid/util/SparseIntArray;

.field public final d:I

.field public final synthetic e:Ll/cur0;


# direct methods
.method public constructor <init>(Ll/cur0;I)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/bur0;->e:Ll/cur0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/dfw0;

    .line 7
    .line 8
    const/4 v0, 0x5

    .line 9
    new-array v1, v0, [B

    .line 10
    .line 11
    invoke-direct {p1, v1, v0}, Ll/dfw0;-><init>([BI)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/bur0;->a:Ll/dfw0;

    .line 15
    .line 16
    new-instance p1, Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/bur0;->b:Landroid/util/SparseArray;

    .line 22
    .line 23
    new-instance p1, Landroid/util/SparseIntArray;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/bur0;->c:Landroid/util/SparseIntArray;

    .line 29
    .line 30
    iput p2, p0, Ll/bur0;->d:I

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(Ll/nnw0;Ll/ser0;Ll/gur0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq v2, v3, :cond_0

    .line 11
    .line 12
    goto/16 :goto_d

    .line 13
    .line 14
    :cond_0
    iget-object v2, v0, Ll/bur0;->e:Ll/cur0;

    .line 15
    .line 16
    invoke-static {v2}, Ll/cur0;->k(Ll/cur0;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/nnw0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    and-int/lit16 v5, v5, 0x80

    .line 32
    .line 33
    if-eqz v5, :cond_16

    .line 34
    .line 35
    const/4 v5, 0x1

    .line 36
    invoke-virtual {v1, v5}, Ll/bgw0;->l(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ll/bgw0;->F()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    const/4 v7, 0x3

    .line 44
    invoke-virtual {v1, v7}, Ll/bgw0;->l(I)V

    .line 45
    .line 46
    .line 47
    iget-object v8, v0, Ll/bur0;->a:Ll/dfw0;

    .line 48
    .line 49
    invoke-virtual {v1, v8, v3}, Ll/bgw0;->f(Ll/dfw0;I)V

    .line 50
    .line 51
    .line 52
    iget-object v8, v0, Ll/bur0;->a:Ll/dfw0;

    .line 53
    .line 54
    invoke-virtual {v8, v7}, Ll/dfw0;->m(I)V

    .line 55
    .line 56
    .line 57
    iget-object v8, v0, Ll/bur0;->e:Ll/cur0;

    .line 58
    .line 59
    iget-object v9, v0, Ll/bur0;->a:Ll/dfw0;

    .line 60
    .line 61
    const/16 v10, 0xd

    .line 62
    .line 63
    invoke-virtual {v9, v10}, Ll/dfw0;->d(I)I

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    invoke-static {v8, v9}, Ll/cur0;->l(Ll/cur0;I)V

    .line 68
    .line 69
    .line 70
    iget-object v8, v0, Ll/bur0;->a:Ll/dfw0;

    .line 71
    .line 72
    invoke-virtual {v1, v8, v3}, Ll/bgw0;->f(Ll/dfw0;I)V

    .line 73
    .line 74
    .line 75
    iget-object v3, v0, Ll/bur0;->a:Ll/dfw0;

    .line 76
    .line 77
    const/4 v8, 0x4

    .line 78
    invoke-virtual {v3, v8}, Ll/dfw0;->m(I)V

    .line 79
    .line 80
    .line 81
    iget-object v3, v0, Ll/bur0;->a:Ll/dfw0;

    .line 82
    .line 83
    const/16 v9, 0xc

    .line 84
    .line 85
    invoke-virtual {v3, v9}, Ll/dfw0;->d(I)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {v1, v3}, Ll/bgw0;->l(I)V

    .line 90
    .line 91
    .line 92
    iget-object v3, v0, Ll/bur0;->b:Landroid/util/SparseArray;

    .line 93
    .line 94
    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 95
    .line 96
    .line 97
    iget-object v3, v0, Ll/bur0;->c:Landroid/util/SparseIntArray;

    .line 98
    .line 99
    invoke-virtual {v3}, Landroid/util/SparseIntArray;->clear()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    :goto_0
    if-lez v3, :cond_13

    .line 107
    .line 108
    iget-object v11, v0, Ll/bur0;->a:Ll/dfw0;

    .line 109
    .line 110
    const/4 v12, 0x5

    .line 111
    invoke-virtual {v1, v11, v12}, Ll/bgw0;->f(Ll/dfw0;I)V

    .line 112
    .line 113
    .line 114
    iget-object v11, v0, Ll/bur0;->a:Ll/dfw0;

    .line 115
    .line 116
    const/16 v13, 0x8

    .line 117
    .line 118
    invoke-virtual {v11, v13}, Ll/dfw0;->d(I)I

    .line 119
    .line 120
    .line 121
    move-result v13

    .line 122
    invoke-virtual {v11, v7}, Ll/dfw0;->m(I)V

    .line 123
    .line 124
    .line 125
    iget-object v11, v0, Ll/bur0;->a:Ll/dfw0;

    .line 126
    .line 127
    invoke-virtual {v11, v10}, Ll/dfw0;->d(I)I

    .line 128
    .line 129
    .line 130
    move-result v11

    .line 131
    iget-object v14, v0, Ll/bur0;->a:Ll/dfw0;

    .line 132
    .line 133
    invoke-virtual {v14, v8}, Ll/dfw0;->m(I)V

    .line 134
    .line 135
    .line 136
    iget-object v14, v0, Ll/bur0;->a:Ll/dfw0;

    .line 137
    .line 138
    invoke-virtual {v14, v9}, Ll/dfw0;->d(I)I

    .line 139
    .line 140
    .line 141
    move-result v14

    .line 142
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 143
    .line 144
    .line 145
    move-result v15

    .line 146
    add-int v9, v15, v14

    .line 147
    .line 148
    const/16 v16, 0x0

    .line 149
    .line 150
    const/16 v17, -0x1

    .line 151
    .line 152
    move-object/from16 v5, v16

    .line 153
    .line 154
    move-object v10, v5

    .line 155
    move/from16 v18, v17

    .line 156
    .line 157
    :goto_1
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-ge v4, v9, :cond_f

    .line 162
    .line 163
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 168
    .line 169
    .line 170
    move-result v19

    .line 171
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 172
    .line 173
    .line 174
    move-result v20

    .line 175
    add-int v8, v20, v19

    .line 176
    .line 177
    if-le v8, v9, :cond_1

    .line 178
    .line 179
    const/4 v12, 0x4

    .line 180
    :goto_2
    move/from16 v21, v3

    .line 181
    .line 182
    goto/16 :goto_b

    .line 183
    .line 184
    :cond_1
    const/16 v19, 0xac

    .line 185
    .line 186
    const/16 v20, 0x87

    .line 187
    .line 188
    const/16 v22, 0x81

    .line 189
    .line 190
    if-ne v4, v12, :cond_6

    .line 191
    .line 192
    invoke-virtual {v1}, Ll/bgw0;->J()J

    .line 193
    .line 194
    .line 195
    move-result-wide v23

    .line 196
    const-wide/32 v25, 0x41432d33

    .line 197
    .line 198
    .line 199
    cmp-long v4, v23, v25

    .line 200
    .line 201
    if-nez v4, :cond_2

    .line 202
    .line 203
    :goto_3
    move/from16 v21, v3

    .line 204
    .line 205
    move/from16 v18, v22

    .line 206
    .line 207
    const/4 v12, 0x4

    .line 208
    move/from16 v22, v8

    .line 209
    .line 210
    goto/16 :goto_a

    .line 211
    .line 212
    :cond_2
    const-wide/32 v25, 0x45414333

    .line 213
    .line 214
    .line 215
    cmp-long v4, v23, v25

    .line 216
    .line 217
    if-nez v4, :cond_3

    .line 218
    .line 219
    :goto_4
    move/from16 v21, v3

    .line 220
    .line 221
    move/from16 v22, v8

    .line 222
    .line 223
    move/from16 v18, v20

    .line 224
    .line 225
    :goto_5
    const/4 v12, 0x4

    .line 226
    goto/16 :goto_a

    .line 227
    .line 228
    :cond_3
    const-wide/32 v25, 0x41432d34

    .line 229
    .line 230
    .line 231
    cmp-long v4, v23, v25

    .line 232
    .line 233
    if-nez v4, :cond_4

    .line 234
    .line 235
    :goto_6
    move/from16 v21, v3

    .line 236
    .line 237
    move/from16 v22, v8

    .line 238
    .line 239
    move/from16 v18, v19

    .line 240
    .line 241
    goto :goto_5

    .line 242
    :cond_4
    const-wide/32 v19, 0x48455643

    .line 243
    .line 244
    .line 245
    cmp-long v4, v23, v19

    .line 246
    .line 247
    if-nez v4, :cond_5

    .line 248
    .line 249
    const/16 v4, 0x24

    .line 250
    .line 251
    :goto_7
    move/from16 v21, v3

    .line 252
    .line 253
    move/from16 v18, v4

    .line 254
    .line 255
    :goto_8
    move/from16 v22, v8

    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_5
    move/from16 v21, v3

    .line 259
    .line 260
    goto :goto_8

    .line 261
    :cond_6
    const/16 v12, 0x6a

    .line 262
    .line 263
    if-ne v4, v12, :cond_7

    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_7
    const/16 v12, 0x7a

    .line 267
    .line 268
    if-ne v4, v12, :cond_8

    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_8
    const/16 v12, 0x7f

    .line 272
    .line 273
    if-ne v4, v12, :cond_9

    .line 274
    .line 275
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    const/16 v12, 0x15

    .line 280
    .line 281
    if-ne v4, v12, :cond_5

    .line 282
    .line 283
    goto :goto_6

    .line 284
    :cond_9
    const/16 v12, 0x7b

    .line 285
    .line 286
    if-ne v4, v12, :cond_a

    .line 287
    .line 288
    const/16 v4, 0x8a

    .line 289
    .line 290
    goto :goto_7

    .line 291
    :cond_a
    const/16 v12, 0xa

    .line 292
    .line 293
    if-ne v4, v12, :cond_b

    .line 294
    .line 295
    sget-object v4, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 296
    .line 297
    invoke-virtual {v1, v7, v4}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v4

    .line 301
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    move/from16 v21, v3

    .line 306
    .line 307
    move-object v10, v4

    .line 308
    goto :goto_8

    .line 309
    :cond_b
    const/16 v12, 0x59

    .line 310
    .line 311
    if-ne v4, v12, :cond_d

    .line 312
    .line 313
    new-instance v4, Ljava/util/ArrayList;

    .line 314
    .line 315
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .line 317
    .line 318
    :goto_9
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 319
    .line 320
    .line 321
    move-result v5

    .line 322
    if-ge v5, v8, :cond_c

    .line 323
    .line 324
    sget-object v5, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 325
    .line 326
    invoke-virtual {v1, v7, v5}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v5

    .line 330
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 335
    .line 336
    .line 337
    move-result v7

    .line 338
    move/from16 v21, v3

    .line 339
    .line 340
    const/4 v12, 0x4

    .line 341
    new-array v3, v12, [B

    .line 342
    .line 343
    move/from16 v22, v8

    .line 344
    .line 345
    const/4 v8, 0x0

    .line 346
    invoke-virtual {v1, v3, v8, v12}, Ll/bgw0;->g([BII)V

    .line 347
    .line 348
    .line 349
    new-instance v8, Ll/dur0;

    .line 350
    .line 351
    invoke-direct {v8, v5, v7, v3}, Ll/dur0;-><init>(Ljava/lang/String;I[B)V

    .line 352
    .line 353
    .line 354
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move/from16 v3, v21

    .line 358
    .line 359
    move/from16 v8, v22

    .line 360
    .line 361
    const/4 v7, 0x3

    .line 362
    const/16 v12, 0x59

    .line 363
    .line 364
    goto :goto_9

    .line 365
    :cond_c
    move/from16 v21, v3

    .line 366
    .line 367
    move/from16 v22, v8

    .line 368
    .line 369
    const/4 v12, 0x4

    .line 370
    move-object v5, v4

    .line 371
    const/16 v18, 0x59

    .line 372
    .line 373
    goto :goto_a

    .line 374
    :cond_d
    move/from16 v21, v3

    .line 375
    .line 376
    move/from16 v22, v8

    .line 377
    .line 378
    const/4 v12, 0x4

    .line 379
    const/16 v3, 0x6f

    .line 380
    .line 381
    if-ne v4, v3, :cond_e

    .line 382
    .line 383
    const/16 v3, 0x101

    .line 384
    .line 385
    move/from16 v18, v3

    .line 386
    .line 387
    :cond_e
    :goto_a
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 388
    .line 389
    .line 390
    move-result v3

    .line 391
    sub-int v8, v22, v3

    .line 392
    .line 393
    invoke-virtual {v1, v8}, Ll/bgw0;->l(I)V

    .line 394
    .line 395
    .line 396
    move v8, v12

    .line 397
    move/from16 v3, v21

    .line 398
    .line 399
    const/4 v7, 0x3

    .line 400
    const/4 v12, 0x5

    .line 401
    goto/16 :goto_1

    .line 402
    .line 403
    :cond_f
    move v12, v8

    .line 404
    goto/16 :goto_2

    .line 405
    .line 406
    :goto_b
    invoke-virtual {v1, v9}, Ll/bgw0;->k(I)V

    .line 407
    .line 408
    .line 409
    new-instance v3, Ll/eur0;

    .line 410
    .line 411
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    invoke-static {v4, v15, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 416
    .line 417
    .line 418
    move-result-object v4

    .line 419
    move/from16 v7, v18

    .line 420
    .line 421
    invoke-direct {v3, v7, v10, v5, v4}, Ll/eur0;-><init>(ILjava/lang/String;Ljava/util/List;[B)V

    .line 422
    .line 423
    .line 424
    const/4 v4, 0x6

    .line 425
    if-eq v13, v4, :cond_10

    .line 426
    .line 427
    const/4 v4, 0x5

    .line 428
    if-ne v13, v4, :cond_11

    .line 429
    .line 430
    :cond_10
    iget v13, v3, Ll/eur0;->a:I

    .line 431
    .line 432
    :cond_11
    add-int/lit8 v14, v14, 0x5

    .line 433
    .line 434
    sub-int v4, v21, v14

    .line 435
    .line 436
    iget-object v5, v0, Ll/bur0;->e:Ll/cur0;

    .line 437
    .line 438
    invoke-static {v5}, Ll/cur0;->g(Ll/cur0;)Landroid/util/SparseBooleanArray;

    .line 439
    .line 440
    .line 441
    move-result-object v5

    .line 442
    invoke-virtual {v5, v11}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 443
    .line 444
    .line 445
    move-result v5

    .line 446
    if-nez v5, :cond_12

    .line 447
    .line 448
    iget-object v5, v0, Ll/bur0;->e:Ll/cur0;

    .line 449
    .line 450
    invoke-static {v5}, Ll/cur0;->j(Ll/cur0;)Ll/fur0;

    .line 451
    .line 452
    .line 453
    move-result-object v5

    .line 454
    invoke-interface {v5, v13, v3}, Ll/fur0;->a(ILl/eur0;)Ll/hur0;

    .line 455
    .line 456
    .line 457
    move-result-object v3

    .line 458
    iget-object v5, v0, Ll/bur0;->c:Landroid/util/SparseIntArray;

    .line 459
    .line 460
    invoke-virtual {v5, v11, v11}, Landroid/util/SparseIntArray;->put(II)V

    .line 461
    .line 462
    .line 463
    iget-object v5, v0, Ll/bur0;->b:Landroid/util/SparseArray;

    .line 464
    .line 465
    invoke-virtual {v5, v11, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 466
    .line 467
    .line 468
    :cond_12
    move v3, v4

    .line 469
    move v8, v12

    .line 470
    const/4 v4, 0x0

    .line 471
    const/4 v5, 0x1

    .line 472
    const/4 v7, 0x3

    .line 473
    const/16 v9, 0xc

    .line 474
    .line 475
    const/16 v10, 0xd

    .line 476
    .line 477
    goto/16 :goto_0

    .line 478
    .line 479
    :cond_13
    iget-object v1, v0, Ll/bur0;->c:Landroid/util/SparseIntArray;

    .line 480
    .line 481
    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    .line 482
    .line 483
    .line 484
    move-result v1

    .line 485
    const/4 v8, 0x0

    .line 486
    :goto_c
    if-ge v8, v1, :cond_15

    .line 487
    .line 488
    iget-object v3, v0, Ll/bur0;->c:Landroid/util/SparseIntArray;

    .line 489
    .line 490
    iget-object v4, v0, Ll/bur0;->e:Ll/cur0;

    .line 491
    .line 492
    invoke-virtual {v3, v8}, Landroid/util/SparseIntArray;->keyAt(I)I

    .line 493
    .line 494
    .line 495
    move-result v5

    .line 496
    invoke-virtual {v3, v8}, Landroid/util/SparseIntArray;->valueAt(I)I

    .line 497
    .line 498
    .line 499
    move-result v3

    .line 500
    invoke-static {v4}, Ll/cur0;->g(Ll/cur0;)Landroid/util/SparseBooleanArray;

    .line 501
    .line 502
    .line 503
    move-result-object v4

    .line 504
    const/4 v7, 0x1

    .line 505
    invoke-virtual {v4, v5, v7}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 506
    .line 507
    .line 508
    iget-object v4, v0, Ll/bur0;->e:Ll/cur0;

    .line 509
    .line 510
    invoke-static {v4}, Ll/cur0;->h(Ll/cur0;)Landroid/util/SparseBooleanArray;

    .line 511
    .line 512
    .line 513
    move-result-object v4

    .line 514
    invoke-virtual {v4, v3, v7}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 515
    .line 516
    .line 517
    iget-object v4, v0, Ll/bur0;->b:Landroid/util/SparseArray;

    .line 518
    .line 519
    invoke-virtual {v4, v8}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v4

    .line 523
    check-cast v4, Ll/hur0;

    .line 524
    .line 525
    if-eqz v4, :cond_14

    .line 526
    .line 527
    iget-object v7, v0, Ll/bur0;->e:Ll/cur0;

    .line 528
    .line 529
    invoke-static {v7}, Ll/cur0;->i(Ll/cur0;)Ll/ser0;

    .line 530
    .line 531
    .line 532
    move-result-object v7

    .line 533
    new-instance v9, Ll/gur0;

    .line 534
    .line 535
    const/16 v10, 0x2000

    .line 536
    .line 537
    invoke-direct {v9, v6, v5, v10}, Ll/gur0;-><init>(III)V

    .line 538
    .line 539
    .line 540
    invoke-interface {v4, v2, v7, v9}, Ll/hur0;->a(Ll/nnw0;Ll/ser0;Ll/gur0;)V

    .line 541
    .line 542
    .line 543
    iget-object v5, v0, Ll/bur0;->e:Ll/cur0;

    .line 544
    .line 545
    invoke-static {v5}, Ll/cur0;->b(Ll/cur0;)Landroid/util/SparseArray;

    .line 546
    .line 547
    .line 548
    move-result-object v5

    .line 549
    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 550
    .line 551
    .line 552
    :cond_14
    add-int/lit8 v8, v8, 0x1

    .line 553
    .line 554
    goto :goto_c

    .line 555
    :cond_15
    iget-object v1, v0, Ll/bur0;->e:Ll/cur0;

    .line 556
    .line 557
    iget v2, v0, Ll/bur0;->d:I

    .line 558
    .line 559
    invoke-static {v1}, Ll/cur0;->b(Ll/cur0;)Landroid/util/SparseArray;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->remove(I)V

    .line 564
    .line 565
    .line 566
    iget-object v1, v0, Ll/bur0;->e:Ll/cur0;

    .line 567
    .line 568
    const/4 v8, 0x0

    .line 569
    invoke-static {v1, v8}, Ll/cur0;->m(Ll/cur0;I)V

    .line 570
    .line 571
    .line 572
    iget-object v1, v0, Ll/bur0;->e:Ll/cur0;

    .line 573
    .line 574
    invoke-static {v1}, Ll/cur0;->a(Ll/cur0;)I

    .line 575
    .line 576
    .line 577
    move-result v2

    .line 578
    if-nez v2, :cond_16

    .line 579
    .line 580
    invoke-static {v1}, Ll/cur0;->i(Ll/cur0;)Ll/ser0;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 585
    .line 586
    .line 587
    iget-object v0, v0, Ll/bur0;->e:Ll/cur0;

    .line 588
    .line 589
    const/4 v7, 0x1

    .line 590
    invoke-static {v0, v7}, Ll/cur0;->n(Ll/cur0;Z)V

    .line 591
    .line 592
    .line 593
    :cond_16
    :goto_d
    return-void
.end method
