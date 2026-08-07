.class public final Ll/atr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hur0;


# instance fields
.field public final a:Ll/yrr0;

.field public final b:Ll/dfw0;

.field public c:I

.field public d:I

.field public e:Ll/nnw0;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Z


# direct methods
.method public constructor <init>(Ll/yrr0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/atr0;->a:Ll/yrr0;

    .line 5
    .line 6
    new-instance p1, Ll/dfw0;

    .line 7
    .line 8
    const/16 v0, 0xa

    .line 9
    .line 10
    new-array v1, v0, [B

    .line 11
    .line 12
    invoke-direct {p1, v1, v0}, Ll/dfw0;-><init>([BI)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/atr0;->b:Ll/dfw0;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Ll/atr0;->c:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(Ll/nnw0;Ll/ser0;Ll/gur0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/atr0;->e:Ll/nnw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/atr0;->a:Ll/yrr0;

    .line 4
    .line 5
    invoke-interface {p0, p2, p3}, Ll/yrr0;->d(Ll/ser0;Ll/gur0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b(Ll/bgw0;I)V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/atr0;->e:Ll/nnw0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    and-int/lit8 v2, p2, 0x1

    .line 11
    .line 12
    const-string v3, "PesReader"

    .line 13
    .line 14
    const/4 v4, -0x1

    .line 15
    const/4 v5, 0x2

    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x1

    .line 18
    if-eqz v2, :cond_4

    .line 19
    .line 20
    iget v2, v0, Ll/atr0;->c:I

    .line 21
    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    if-eq v2, v7, :cond_3

    .line 25
    .line 26
    if-eq v2, v5, :cond_2

    .line 27
    .line 28
    iget v2, v0, Ll/atr0;->j:I

    .line 29
    .line 30
    if-eq v2, v4, :cond_0

    .line 31
    .line 32
    new-instance v8, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v9, "Unexpected start indicator: expected "

    .line 35
    .line 36
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, " more bytes"

    .line 43
    .line 44
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v3, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {v1}, Ll/bgw0;->t()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    move v2, v7

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    move v2, v6

    .line 63
    :goto_0
    iget-object v8, v0, Ll/atr0;->a:Ll/yrr0;

    .line 64
    .line 65
    invoke-interface {v8, v2}, Ll/yrr0;->a(Z)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const-string v2, "Unexpected start indicator reading extended header"

    .line 70
    .line 71
    invoke-static {v3, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    invoke-virtual {v0, v7}, Ll/atr0;->c(I)V

    .line 75
    .line 76
    .line 77
    :cond_4
    move/from16 v2, p2

    .line 78
    .line 79
    :goto_2
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    if-lez v8, :cond_12

    .line 84
    .line 85
    iget v8, v0, Ll/atr0;->c:I

    .line 86
    .line 87
    if-eqz v8, :cond_11

    .line 88
    .line 89
    if-eq v8, v7, :cond_c

    .line 90
    .line 91
    if-eq v8, v5, :cond_8

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    iget v9, v0, Ll/atr0;->j:I

    .line 98
    .line 99
    if-ne v9, v4, :cond_5

    .line 100
    .line 101
    move v9, v6

    .line 102
    goto :goto_3

    .line 103
    :cond_5
    sub-int v9, v8, v9

    .line 104
    .line 105
    :goto_3
    if-lez v9, :cond_6

    .line 106
    .line 107
    sub-int/2addr v8, v9

    .line 108
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    add-int/2addr v9, v8

    .line 113
    invoke-virtual {v1, v9}, Ll/bgw0;->j(I)V

    .line 114
    .line 115
    .line 116
    :cond_6
    iget-object v9, v0, Ll/atr0;->a:Ll/yrr0;

    .line 117
    .line 118
    invoke-interface {v9, v1}, Ll/yrr0;->b(Ll/bgw0;)V

    .line 119
    .line 120
    .line 121
    iget v9, v0, Ll/atr0;->j:I

    .line 122
    .line 123
    if-eq v9, v4, :cond_7

    .line 124
    .line 125
    sub-int/2addr v9, v8

    .line 126
    iput v9, v0, Ll/atr0;->j:I

    .line 127
    .line 128
    if-nez v9, :cond_7

    .line 129
    .line 130
    iget-object v8, v0, Ll/atr0;->a:Ll/yrr0;

    .line 131
    .line 132
    invoke-interface {v8, v6}, Ll/yrr0;->a(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v7}, Ll/atr0;->c(I)V

    .line 136
    .line 137
    .line 138
    :cond_7
    move v9, v5

    .line 139
    goto/16 :goto_9

    .line 140
    .line 141
    :cond_8
    const/16 v8, 0xa

    .line 142
    .line 143
    iget v9, v0, Ll/atr0;->i:I

    .line 144
    .line 145
    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    iget-object v9, v0, Ll/atr0;->b:Ll/dfw0;

    .line 150
    .line 151
    iget-object v9, v9, Ll/dfw0;->a:[B

    .line 152
    .line 153
    invoke-virtual {v0, v1, v9, v8}, Ll/atr0;->d(Ll/bgw0;[BI)Z

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    if-eqz v8, :cond_7

    .line 158
    .line 159
    const/4 v8, 0x0

    .line 160
    iget v9, v0, Ll/atr0;->i:I

    .line 161
    .line 162
    invoke-virtual {v0, v1, v8, v9}, Ll/atr0;->d(Ll/bgw0;[BI)Z

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    if-eqz v8, :cond_7

    .line 167
    .line 168
    iget-object v8, v0, Ll/atr0;->b:Ll/dfw0;

    .line 169
    .line 170
    invoke-virtual {v8, v6}, Ll/dfw0;->k(I)V

    .line 171
    .line 172
    .line 173
    iget-boolean v8, v0, Ll/atr0;->f:Z

    .line 174
    .line 175
    const/4 v9, 0x3

    .line 176
    const/4 v10, 0x4

    .line 177
    if-eqz v8, :cond_a

    .line 178
    .line 179
    iget-object v8, v0, Ll/atr0;->b:Ll/dfw0;

    .line 180
    .line 181
    invoke-virtual {v8, v10}, Ll/dfw0;->m(I)V

    .line 182
    .line 183
    .line 184
    iget-object v8, v0, Ll/atr0;->b:Ll/dfw0;

    .line 185
    .line 186
    invoke-virtual {v8, v9}, Ll/dfw0;->d(I)I

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    int-to-long v11, v8

    .line 191
    iget-object v8, v0, Ll/atr0;->b:Ll/dfw0;

    .line 192
    .line 193
    invoke-virtual {v8, v7}, Ll/dfw0;->m(I)V

    .line 194
    .line 195
    .line 196
    iget-object v8, v0, Ll/atr0;->b:Ll/dfw0;

    .line 197
    .line 198
    const/16 v13, 0xf

    .line 199
    .line 200
    invoke-virtual {v8, v13}, Ll/dfw0;->d(I)I

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    shl-int/2addr v8, v13

    .line 205
    iget-object v14, v0, Ll/atr0;->b:Ll/dfw0;

    .line 206
    .line 207
    invoke-virtual {v14, v7}, Ll/dfw0;->m(I)V

    .line 208
    .line 209
    .line 210
    iget-object v14, v0, Ll/atr0;->b:Ll/dfw0;

    .line 211
    .line 212
    invoke-virtual {v14, v13}, Ll/dfw0;->d(I)I

    .line 213
    .line 214
    .line 215
    move-result v14

    .line 216
    int-to-long v14, v14

    .line 217
    iget-object v5, v0, Ll/atr0;->b:Ll/dfw0;

    .line 218
    .line 219
    invoke-virtual {v5, v7}, Ll/dfw0;->m(I)V

    .line 220
    .line 221
    .line 222
    iget-boolean v5, v0, Ll/atr0;->h:Z

    .line 223
    .line 224
    const/16 v16, 0x1e

    .line 225
    .line 226
    if-nez v5, :cond_9

    .line 227
    .line 228
    iget-boolean v5, v0, Ll/atr0;->g:Z

    .line 229
    .line 230
    if-eqz v5, :cond_9

    .line 231
    .line 232
    iget-object v5, v0, Ll/atr0;->b:Ll/dfw0;

    .line 233
    .line 234
    invoke-virtual {v5, v10}, Ll/dfw0;->m(I)V

    .line 235
    .line 236
    .line 237
    iget-object v5, v0, Ll/atr0;->b:Ll/dfw0;

    .line 238
    .line 239
    invoke-virtual {v5, v9}, Ll/dfw0;->d(I)I

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    move-wide/from16 v17, v11

    .line 244
    .line 245
    int-to-long v10, v5

    .line 246
    shl-long v10, v10, v16

    .line 247
    .line 248
    iget-object v5, v0, Ll/atr0;->b:Ll/dfw0;

    .line 249
    .line 250
    invoke-virtual {v5, v7}, Ll/dfw0;->m(I)V

    .line 251
    .line 252
    .line 253
    iget-object v5, v0, Ll/atr0;->b:Ll/dfw0;

    .line 254
    .line 255
    invoke-virtual {v5, v13}, Ll/dfw0;->d(I)I

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    shl-int/2addr v5, v13

    .line 260
    iget-object v12, v0, Ll/atr0;->b:Ll/dfw0;

    .line 261
    .line 262
    invoke-virtual {v12, v7}, Ll/dfw0;->m(I)V

    .line 263
    .line 264
    .line 265
    iget-object v12, v0, Ll/atr0;->b:Ll/dfw0;

    .line 266
    .line 267
    invoke-virtual {v12, v13}, Ll/dfw0;->d(I)I

    .line 268
    .line 269
    .line 270
    move-result v12

    .line 271
    int-to-long v12, v12

    .line 272
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 273
    .line 274
    invoke-virtual {v4, v7}, Ll/dfw0;->m(I)V

    .line 275
    .line 276
    .line 277
    iget-object v4, v0, Ll/atr0;->e:Ll/nnw0;

    .line 278
    .line 279
    move-wide/from16 v19, v10

    .line 280
    .line 281
    int-to-long v9, v5

    .line 282
    or-long v9, v19, v9

    .line 283
    .line 284
    or-long/2addr v9, v12

    .line 285
    invoke-virtual {v4, v9, v10}, Ll/nnw0;->b(J)J

    .line 286
    .line 287
    .line 288
    iput-boolean v7, v0, Ll/atr0;->h:Z

    .line 289
    .line 290
    goto :goto_4

    .line 291
    :cond_9
    move-wide/from16 v17, v11

    .line 292
    .line 293
    :goto_4
    shl-long v4, v17, v16

    .line 294
    .line 295
    int-to-long v8, v8

    .line 296
    or-long/2addr v4, v8

    .line 297
    or-long/2addr v4, v14

    .line 298
    iget-object v8, v0, Ll/atr0;->e:Ll/nnw0;

    .line 299
    .line 300
    invoke-virtual {v8, v4, v5}, Ll/nnw0;->b(J)J

    .line 301
    .line 302
    .line 303
    move-result-wide v4

    .line 304
    goto :goto_5

    .line 305
    :cond_a
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    :goto_5
    iget-boolean v8, v0, Ll/atr0;->k:Z

    .line 311
    .line 312
    if-eq v7, v8, :cond_b

    .line 313
    .line 314
    move v10, v6

    .line 315
    goto :goto_6

    .line 316
    :cond_b
    const/4 v10, 0x4

    .line 317
    :goto_6
    or-int/2addr v2, v10

    .line 318
    iget-object v8, v0, Ll/atr0;->a:Ll/yrr0;

    .line 319
    .line 320
    invoke-interface {v8, v4, v5, v2}, Ll/yrr0;->c(JI)V

    .line 321
    .line 322
    .line 323
    const/4 v4, 0x3

    .line 324
    invoke-virtual {v0, v4}, Ll/atr0;->c(I)V

    .line 325
    .line 326
    .line 327
    const/4 v4, -0x1

    .line 328
    const/4 v5, 0x2

    .line 329
    goto/16 :goto_2

    .line 330
    .line 331
    :cond_c
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 332
    .line 333
    iget-object v4, v4, Ll/dfw0;->a:[B

    .line 334
    .line 335
    const/16 v5, 0x9

    .line 336
    .line 337
    invoke-virtual {v0, v1, v4, v5}, Ll/atr0;->d(Ll/bgw0;[BI)Z

    .line 338
    .line 339
    .line 340
    move-result v4

    .line 341
    if-eqz v4, :cond_10

    .line 342
    .line 343
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 344
    .line 345
    invoke-virtual {v4, v6}, Ll/dfw0;->k(I)V

    .line 346
    .line 347
    .line 348
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 349
    .line 350
    const/16 v5, 0x18

    .line 351
    .line 352
    invoke-virtual {v4, v5}, Ll/dfw0;->d(I)I

    .line 353
    .line 354
    .line 355
    move-result v4

    .line 356
    if-eq v4, v7, :cond_d

    .line 357
    .line 358
    new-instance v5, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    const-string v8, "Unexpected start code prefix: "

    .line 361
    .line 362
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    invoke-static {v3, v4}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    const/4 v4, -0x1

    .line 376
    iput v4, v0, Ll/atr0;->j:I

    .line 377
    .line 378
    move v5, v6

    .line 379
    const/4 v9, 0x2

    .line 380
    goto :goto_8

    .line 381
    :cond_d
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 382
    .line 383
    const/16 v5, 0x8

    .line 384
    .line 385
    invoke-virtual {v4, v5}, Ll/dfw0;->m(I)V

    .line 386
    .line 387
    .line 388
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 389
    .line 390
    const/16 v8, 0x10

    .line 391
    .line 392
    invoke-virtual {v4, v8}, Ll/dfw0;->d(I)I

    .line 393
    .line 394
    .line 395
    move-result v8

    .line 396
    const/4 v9, 0x5

    .line 397
    invoke-virtual {v4, v9}, Ll/dfw0;->m(I)V

    .line 398
    .line 399
    .line 400
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 401
    .line 402
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    .line 403
    .line 404
    .line 405
    move-result v4

    .line 406
    iput-boolean v4, v0, Ll/atr0;->k:Z

    .line 407
    .line 408
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 409
    .line 410
    const/4 v9, 0x2

    .line 411
    invoke-virtual {v4, v9}, Ll/dfw0;->m(I)V

    .line 412
    .line 413
    .line 414
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 415
    .line 416
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    .line 417
    .line 418
    .line 419
    move-result v4

    .line 420
    iput-boolean v4, v0, Ll/atr0;->f:Z

    .line 421
    .line 422
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 423
    .line 424
    invoke-virtual {v4}, Ll/dfw0;->o()Z

    .line 425
    .line 426
    .line 427
    move-result v4

    .line 428
    iput-boolean v4, v0, Ll/atr0;->g:Z

    .line 429
    .line 430
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 431
    .line 432
    const/4 v10, 0x6

    .line 433
    invoke-virtual {v4, v10}, Ll/dfw0;->m(I)V

    .line 434
    .line 435
    .line 436
    iget-object v4, v0, Ll/atr0;->b:Ll/dfw0;

    .line 437
    .line 438
    invoke-virtual {v4, v5}, Ll/dfw0;->d(I)I

    .line 439
    .line 440
    .line 441
    move-result v4

    .line 442
    iput v4, v0, Ll/atr0;->i:I

    .line 443
    .line 444
    if-nez v8, :cond_e

    .line 445
    .line 446
    const/4 v5, -0x1

    .line 447
    iput v5, v0, Ll/atr0;->j:I

    .line 448
    .line 449
    move v4, v5

    .line 450
    :goto_7
    move v5, v9

    .line 451
    goto :goto_8

    .line 452
    :cond_e
    add-int/lit8 v8, v8, -0x3

    .line 453
    .line 454
    sub-int/2addr v8, v4

    .line 455
    iput v8, v0, Ll/atr0;->j:I

    .line 456
    .line 457
    if-gez v8, :cond_f

    .line 458
    .line 459
    new-instance v4, Ljava/lang/StringBuilder;

    .line 460
    .line 461
    const-string v5, "Found negative packet payload size: "

    .line 462
    .line 463
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v4

    .line 473
    invoke-static {v3, v4}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    .line 475
    .line 476
    const/4 v4, -0x1

    .line 477
    iput v4, v0, Ll/atr0;->j:I

    .line 478
    .line 479
    goto :goto_7

    .line 480
    :cond_f
    const/4 v4, -0x1

    .line 481
    goto :goto_7

    .line 482
    :goto_8
    invoke-virtual {v0, v5}, Ll/atr0;->c(I)V

    .line 483
    .line 484
    .line 485
    goto :goto_9

    .line 486
    :cond_10
    const/4 v4, -0x1

    .line 487
    const/4 v9, 0x2

    .line 488
    goto :goto_9

    .line 489
    :cond_11
    move v9, v5

    .line 490
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 491
    .line 492
    .line 493
    move-result v5

    .line 494
    invoke-virtual {v1, v5}, Ll/bgw0;->l(I)V

    .line 495
    .line 496
    .line 497
    :goto_9
    move v5, v9

    .line 498
    goto/16 :goto_2

    .line 499
    .line 500
    :cond_12
    return-void
.end method

.method public final c(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/atr0;->c:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/atr0;->d:I

    .line 5
    .line 6
    return-void
.end method

.method public final d(Ll/bgw0;[BI)Z
    .locals 3
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/atr0;->d:I

    .line 6
    .line 7
    sub-int v1, p3, v1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    if-nez p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/bgw0;->l(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget v2, p0, Ll/atr0;->d:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v2, v0}, Ll/bgw0;->g([BII)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget p1, p0, Ll/atr0;->d:I

    .line 29
    .line 30
    add-int/2addr p1, v0

    .line 31
    iput p1, p0, Ll/atr0;->d:I

    .line 32
    .line 33
    if-ne p1, p3, :cond_2

    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public final zzc()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/atr0;->c:I

    .line 3
    .line 4
    iput v0, p0, Ll/atr0;->d:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/atr0;->h:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/atr0;->a:Ll/yrr0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/yrr0;->zze()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
