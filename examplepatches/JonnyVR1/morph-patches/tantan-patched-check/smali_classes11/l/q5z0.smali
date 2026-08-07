.class public abstract Ll/q5z0;
.super Ll/t5z0;
.source "SourceFile"


# instance fields
.field public c:Ll/p5z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t5z0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final e([Ll/afy0;Ll/q2z0;Ll/kzy0;Ll/d0u0;)Ll/u5z0;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    new-array v3, v1, [[Ll/t2u0;

    .line 7
    .line 8
    new-array v6, v1, [[[I

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    :goto_0
    if-ge v4, v1, :cond_0

    .line 12
    .line 13
    iget v5, v0, Ll/q2z0;->a:I

    .line 14
    .line 15
    new-array v7, v5, [Ll/t2u0;

    .line 16
    .line 17
    aput-object v7, v3, v4

    .line 18
    .line 19
    new-array v5, v5, [[I

    .line 20
    .line 21
    aput-object v5, v6, v4

    .line 22
    .line 23
    add-int/lit8 v4, v4, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x2

    .line 27
    new-array v7, v1, [I

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    :goto_1
    if-ge v4, v1, :cond_1

    .line 31
    .line 32
    aget-object v5, p1, v4

    .line 33
    .line 34
    invoke-interface {v5}, Ll/afy0;->zze()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    aput v5, v7, v4

    .line 39
    .line 40
    add-int/lit8 v4, v4, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const/4 v4, 0x0

    .line 44
    :goto_2
    iget v5, v0, Ll/q2z0;->a:I

    .line 45
    .line 46
    if-ge v4, v5, :cond_9

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    iget v8, v5, Ll/t2u0;->c:I

    .line 53
    .line 54
    move v10, v1

    .line 55
    const/4 v9, 0x0

    .line 56
    const/4 v13, 0x0

    .line 57
    const/4 v14, 0x1

    .line 58
    :goto_3
    if-ge v9, v1, :cond_6

    .line 59
    .line 60
    aget-object v15, p1, v9

    .line 61
    .line 62
    const/4 v11, 0x0

    .line 63
    const/4 v12, 0x0

    .line 64
    :goto_4
    if-gtz v11, :cond_2

    .line 65
    .line 66
    invoke-virtual {v5, v11}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {v15, v1}, Ll/afy0;->l(Ll/sqr0;)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    and-int/lit8 v1, v1, 0x7

    .line 75
    .line 76
    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    add-int/lit8 v11, v11, 0x1

    .line 81
    .line 82
    const/4 v1, 0x2

    .line 83
    goto :goto_4

    .line 84
    :cond_2
    aget v1, v2, v9

    .line 85
    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    const/4 v1, 0x1

    .line 89
    goto :goto_5

    .line 90
    :cond_3
    const/4 v1, 0x0

    .line 91
    :goto_5
    if-gt v12, v13, :cond_4

    .line 92
    .line 93
    if-ne v12, v13, :cond_5

    .line 94
    .line 95
    const/4 v11, 0x5

    .line 96
    if-ne v8, v11, :cond_5

    .line 97
    .line 98
    if-nez v14, :cond_5

    .line 99
    .line 100
    if-eqz v1, :cond_5

    .line 101
    .line 102
    move v10, v9

    .line 103
    move v13, v12

    .line 104
    const/4 v14, 0x1

    .line 105
    goto :goto_6

    .line 106
    :cond_4
    move v14, v1

    .line 107
    move v10, v9

    .line 108
    move v13, v12

    .line 109
    :cond_5
    :goto_6
    add-int/lit8 v9, v9, 0x1

    .line 110
    .line 111
    const/4 v1, 0x2

    .line 112
    goto :goto_3

    .line 113
    :cond_6
    if-ne v10, v1, :cond_7

    .line 114
    .line 115
    const/4 v1, 0x1

    .line 116
    new-array v8, v1, [I

    .line 117
    .line 118
    goto :goto_8

    .line 119
    :cond_7
    const/4 v1, 0x1

    .line 120
    aget-object v8, p1, v10

    .line 121
    .line 122
    new-array v9, v1, [I

    .line 123
    .line 124
    const/4 v1, 0x0

    .line 125
    :goto_7
    if-gtz v1, :cond_8

    .line 126
    .line 127
    invoke-virtual {v5, v1}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 128
    .line 129
    .line 130
    move-result-object v11

    .line 131
    invoke-interface {v8, v11}, Ll/afy0;->l(Ll/sqr0;)I

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    aput v11, v9, v1

    .line 136
    .line 137
    add-int/lit8 v1, v1, 0x1

    .line 138
    .line 139
    goto :goto_7

    .line 140
    :cond_8
    move-object v8, v9

    .line 141
    :goto_8
    aget v1, v2, v10

    .line 142
    .line 143
    aget-object v9, v3, v10

    .line 144
    .line 145
    aput-object v5, v9, v1

    .line 146
    .line 147
    aget-object v5, v6, v10

    .line 148
    .line 149
    aput-object v8, v5, v1

    .line 150
    .line 151
    const/16 v16, 0x1

    .line 152
    .line 153
    add-int/lit8 v1, v1, 0x1

    .line 154
    .line 155
    aput v1, v2, v10

    .line 156
    .line 157
    add-int/lit8 v4, v4, 0x1

    .line 158
    .line 159
    const/4 v1, 0x2

    .line 160
    goto :goto_2

    .line 161
    :cond_9
    new-array v0, v1, [Ll/q2z0;

    .line 162
    .line 163
    new-array v5, v1, [Ljava/lang/String;

    .line 164
    .line 165
    move-object v9, v6

    .line 166
    new-array v6, v1, [I

    .line 167
    .line 168
    const/4 v4, 0x0

    .line 169
    :goto_9
    if-ge v4, v1, :cond_a

    .line 170
    .line 171
    aget v1, v2, v4

    .line 172
    .line 173
    new-instance v8, Ll/q2z0;

    .line 174
    .line 175
    aget-object v10, v3, v4

    .line 176
    .line 177
    invoke-static {v10, v1}, Ll/mpw0;->l([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v10

    .line 181
    check-cast v10, [Ll/t2u0;

    .line 182
    .line 183
    invoke-direct {v8, v10}, Ll/q2z0;-><init>([Ll/t2u0;)V

    .line 184
    .line 185
    .line 186
    aput-object v8, v0, v4

    .line 187
    .line 188
    aget-object v8, v9, v4

    .line 189
    .line 190
    invoke-static {v8, v1}, Ll/mpw0;->l([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    check-cast v1, [[I

    .line 195
    .line 196
    aput-object v1, v9, v4

    .line 197
    .line 198
    aget-object v1, p1, v4

    .line 199
    .line 200
    invoke-interface {v1}, Ll/afy0;->e()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    aput-object v1, v5, v4

    .line 205
    .line 206
    aget-object v1, p1, v4

    .line 207
    .line 208
    invoke-interface {v1}, Ll/afy0;->c()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    aput v1, v6, v4

    .line 213
    .line 214
    add-int/lit8 v4, v4, 0x1

    .line 215
    .line 216
    const/4 v1, 0x2

    .line 217
    goto :goto_9

    .line 218
    :cond_a
    move/from16 v17, v1

    .line 219
    .line 220
    aget v1, v2, v17

    .line 221
    .line 222
    new-instance v10, Ll/q2z0;

    .line 223
    .line 224
    aget-object v2, v3, v17

    .line 225
    .line 226
    invoke-static {v2, v1}, Ll/mpw0;->l([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    check-cast v1, [Ll/t2u0;

    .line 231
    .line 232
    invoke-direct {v10, v1}, Ll/q2z0;-><init>([Ll/t2u0;)V

    .line 233
    .line 234
    .line 235
    new-instance v4, Ll/p5z0;

    .line 236
    .line 237
    move-object v8, v7

    .line 238
    move-object v7, v0

    .line 239
    invoke-direct/range {v4 .. v10}, Ll/p5z0;-><init>([Ljava/lang/String;[I[Ll/q2z0;[I[[[ILl/q2z0;)V

    .line 240
    .line 241
    .line 242
    move-object v5, v4

    .line 243
    move-object v7, v8

    .line 244
    move-object v6, v9

    .line 245
    move-object/from16 v4, p0

    .line 246
    .line 247
    move-object/from16 v8, p3

    .line 248
    .line 249
    move-object/from16 v9, p4

    .line 250
    .line 251
    invoke-virtual/range {v4 .. v9}, Ll/q5z0;->j(Ll/p5z0;[[[I[ILl/kzy0;Ll/d0u0;)Landroid/util/Pair;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    move-object v4, v5

    .line 256
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 257
    .line 258
    check-cast v1, [Ll/r5z0;

    .line 259
    .line 260
    array-length v2, v1

    .line 261
    new-array v2, v2, [Ljava/util/List;

    .line 262
    .line 263
    const/4 v3, 0x0

    .line 264
    :goto_a
    array-length v5, v1

    .line 265
    if-ge v3, v5, :cond_c

    .line 266
    .line 267
    aget-object v5, v1, v3

    .line 268
    .line 269
    if-eqz v5, :cond_b

    .line 270
    .line 271
    invoke-static {v5}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    goto :goto_b

    .line 276
    :cond_b
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 277
    .line 278
    .line 279
    move-result-object v5

    .line 280
    :goto_b
    aput-object v5, v2, v3

    .line 281
    .line 282
    add-int/lit8 v3, v3, 0x1

    .line 283
    .line 284
    goto :goto_a

    .line 285
    :cond_c
    new-instance v1, Ll/mqw0;

    .line 286
    .line 287
    invoke-direct {v1}, Ll/mqw0;-><init>()V

    .line 288
    .line 289
    .line 290
    const/4 v3, 0x0

    .line 291
    :goto_c
    const/4 v5, 0x2

    .line 292
    if-ge v3, v5, :cond_12

    .line 293
    .line 294
    invoke-virtual {v4, v3}, Ll/p5z0;->d(I)Ll/q2z0;

    .line 295
    .line 296
    .line 297
    move-result-object v6

    .line 298
    aget-object v7, v2, v3

    .line 299
    .line 300
    const/4 v8, 0x0

    .line 301
    :goto_d
    iget v9, v6, Ll/q2z0;->a:I

    .line 302
    .line 303
    if-ge v8, v9, :cond_11

    .line 304
    .line 305
    invoke-virtual {v6, v8}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 306
    .line 307
    .line 308
    move-result-object v9

    .line 309
    const/4 v10, 0x0

    .line 310
    invoke-virtual {v4, v3, v8, v10}, Ll/p5z0;->a(IIZ)I

    .line 311
    .line 312
    .line 313
    move-result v11

    .line 314
    if-eqz v11, :cond_d

    .line 315
    .line 316
    const/4 v10, 0x1

    .line 317
    goto :goto_e

    .line 318
    :cond_d
    const/4 v10, 0x0

    .line 319
    :goto_e
    iget v11, v9, Ll/t2u0;->a:I

    .line 320
    .line 321
    const/4 v11, 0x1

    .line 322
    new-array v12, v11, [I

    .line 323
    .line 324
    new-array v13, v11, [Z

    .line 325
    .line 326
    const/4 v11, 0x0

    .line 327
    :goto_f
    if-gtz v11, :cond_10

    .line 328
    .line 329
    invoke-virtual {v4, v3, v8, v11}, Ll/p5z0;->b(III)I

    .line 330
    .line 331
    .line 332
    move-result v14

    .line 333
    and-int/lit8 v14, v14, 0x7

    .line 334
    .line 335
    aput v14, v12, v11

    .line 336
    .line 337
    const/4 v14, 0x0

    .line 338
    :goto_10
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 339
    .line 340
    .line 341
    move-result v15

    .line 342
    if-ge v14, v15, :cond_f

    .line 343
    .line 344
    invoke-interface {v7, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v15

    .line 348
    check-cast v15, Ll/r5z0;

    .line 349
    .line 350
    invoke-interface {v15}, Ll/r5z0;->zze()Ll/t2u0;

    .line 351
    .line 352
    .line 353
    move-result-object v5

    .line 354
    invoke-virtual {v5, v9}, Ll/t2u0;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v5

    .line 358
    if-eqz v5, :cond_e

    .line 359
    .line 360
    invoke-interface {v15, v11}, Ll/r5z0;->e(I)I

    .line 361
    .line 362
    .line 363
    move-result v5

    .line 364
    const/4 v15, -0x1

    .line 365
    if-eq v5, v15, :cond_e

    .line 366
    .line 367
    const/4 v5, 0x1

    .line 368
    goto :goto_11

    .line 369
    :cond_e
    add-int/lit8 v14, v14, 0x1

    .line 370
    .line 371
    const/4 v5, 0x2

    .line 372
    goto :goto_10

    .line 373
    :cond_f
    const/4 v5, 0x0

    .line 374
    :goto_11
    aput-boolean v5, v13, v11

    .line 375
    .line 376
    add-int/lit8 v11, v11, 0x1

    .line 377
    .line 378
    const/4 v5, 0x2

    .line 379
    goto :goto_f

    .line 380
    :cond_10
    new-instance v5, Ll/mgu0;

    .line 381
    .line 382
    invoke-direct {v5, v9, v10, v12, v13}, Ll/mgu0;-><init>(Ll/t2u0;Z[I[Z)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1, v5}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 386
    .line 387
    .line 388
    add-int/lit8 v8, v8, 0x1

    .line 389
    .line 390
    const/4 v5, 0x2

    .line 391
    goto :goto_d

    .line 392
    :cond_11
    add-int/lit8 v3, v3, 0x1

    .line 393
    .line 394
    goto :goto_c

    .line 395
    :cond_12
    invoke-virtual {v4}, Ll/p5z0;->e()Ll/q2z0;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    const/4 v10, 0x0

    .line 400
    :goto_12
    iget v3, v2, Ll/q2z0;->a:I

    .line 401
    .line 402
    if-ge v10, v3, :cond_13

    .line 403
    .line 404
    invoke-virtual {v2, v10}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    iget v5, v3, Ll/t2u0;->a:I

    .line 409
    .line 410
    const/4 v11, 0x1

    .line 411
    new-array v5, v11, [I

    .line 412
    .line 413
    const/4 v6, 0x0

    .line 414
    invoke-static {v5, v6}, Ljava/util/Arrays;->fill([II)V

    .line 415
    .line 416
    .line 417
    new-array v7, v11, [Z

    .line 418
    .line 419
    new-instance v8, Ll/mgu0;

    .line 420
    .line 421
    invoke-direct {v8, v3, v6, v5, v7}, Ll/mgu0;-><init>(Ll/t2u0;Z[I[Z)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v1, v8}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 425
    .line 426
    .line 427
    add-int/lit8 v10, v10, 0x1

    .line 428
    .line 429
    goto :goto_12

    .line 430
    :cond_13
    new-instance v2, Ll/uhu0;

    .line 431
    .line 432
    invoke-virtual {v1}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    invoke-direct {v2, v1}, Ll/uhu0;-><init>(Ljava/util/List;)V

    .line 437
    .line 438
    .line 439
    new-instance v1, Ll/u5z0;

    .line 440
    .line 441
    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 442
    .line 443
    check-cast v3, [Ll/dfy0;

    .line 444
    .line 445
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 446
    .line 447
    check-cast v0, [Ll/n5z0;

    .line 448
    .line 449
    invoke-direct {v1, v3, v0, v2, v4}, Ll/u5z0;-><init>([Ll/dfy0;[Ll/n5z0;Ll/uhu0;Ljava/lang/Object;)V

    .line 450
    .line 451
    .line 452
    return-object v1
.end method

.method public final f(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/p5z0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/q5z0;->c:Ll/p5z0;

    .line 4
    .line 5
    return-void
.end method

.method public abstract j(Ll/p5z0;[[[I[ILl/kzy0;Ll/d0u0;)Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation
.end method
