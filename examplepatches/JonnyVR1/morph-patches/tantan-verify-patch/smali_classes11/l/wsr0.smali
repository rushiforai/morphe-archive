.class public final Ll/wsr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/bgw0;

.field public final c:Ll/dfw0;

.field public d:Ll/sgr0;

.field public e:Ljava/lang/String;

.field public f:Ll/sqr0;

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:J

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:J

.field public r:I

.field public s:J

.field public t:I

.field public u:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wsr0;->a:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p1, Ll/bgw0;

    .line 7
    .line 8
    const/16 v0, 0x400

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 14
    .line 15
    new-instance v0, Ll/dfw0;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    array-length v1, p1

    .line 22
    invoke-direct {v0, p1, v1}, Ll/dfw0;-><init>([BI)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/wsr0;->c:Ll/dfw0;

    .line 26
    .line 27
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    iput-wide v0, p0, Ll/wsr0;->k:J

    .line 33
    .line 34
    return-void
.end method

.method public static f(Ll/dfw0;)J
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/dfw0;->d(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    mul-int/lit8 v0, v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/dfw0;->d(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    int-to-long v0, p0

    .line 15
    return-wide v0
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wsr0;->d:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_1e

    .line 11
    .line 12
    iget v0, p0, Ll/wsr0;->g:I

    .line 13
    .line 14
    const/16 v1, 0x56

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_1d

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    const/4 v4, 0x0

    .line 21
    if-eq v0, v2, :cond_1b

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    const/16 v5, 0x8

    .line 25
    .line 26
    if-eq v0, v3, :cond_19

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v3, p0, Ll/wsr0;->i:I

    .line 33
    .line 34
    iget v6, p0, Ll/wsr0;->h:I

    .line 35
    .line 36
    sub-int/2addr v3, v6

    .line 37
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v3, p0, Ll/wsr0;->c:Ll/dfw0;

    .line 42
    .line 43
    iget-object v3, v3, Ll/dfw0;->a:[B

    .line 44
    .line 45
    iget v6, p0, Ll/wsr0;->h:I

    .line 46
    .line 47
    invoke-virtual {p1, v3, v6, v0}, Ll/bgw0;->g([BII)V

    .line 48
    .line 49
    .line 50
    iget v3, p0, Ll/wsr0;->h:I

    .line 51
    .line 52
    add-int/2addr v3, v0

    .line 53
    iput v3, p0, Ll/wsr0;->h:I

    .line 54
    .line 55
    iget v0, p0, Ll/wsr0;->i:I

    .line 56
    .line 57
    if-ne v3, v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Ll/wsr0;->c:Ll/dfw0;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Ll/dfw0;->k(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/wsr0;->c:Ll/dfw0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    const/4 v6, 0x0

    .line 71
    if-nez v3, :cond_10

    .line 72
    .line 73
    iput-boolean v2, p0, Ll/wsr0;->l:Z

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-ne v3, v2, :cond_1

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ll/dfw0;->d(I)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    move v7, v2

    .line 86
    goto :goto_1

    .line 87
    :cond_1
    move v7, v3

    .line 88
    move v3, v4

    .line 89
    :goto_1
    iput v3, p0, Ll/wsr0;->m:I

    .line 90
    .line 91
    if-nez v3, :cond_f

    .line 92
    .line 93
    if-ne v7, v2, :cond_2

    .line 94
    .line 95
    invoke-static {v0}, Ll/wsr0;->f(Ll/dfw0;)J

    .line 96
    .line 97
    .line 98
    move v7, v2

    .line 99
    :cond_2
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_e

    .line 104
    .line 105
    const/4 v3, 0x6

    .line 106
    invoke-virtual {v0, v3}, Ll/dfw0;->d(I)I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    iput v8, p0, Ll/wsr0;->n:I

    .line 111
    .line 112
    const/4 v8, 0x4

    .line 113
    invoke-virtual {v0, v8}, Ll/dfw0;->d(I)I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    invoke-virtual {v0, v1}, Ll/dfw0;->d(I)I

    .line 118
    .line 119
    .line 120
    move-result v10

    .line 121
    if-nez v9, :cond_d

    .line 122
    .line 123
    if-nez v10, :cond_d

    .line 124
    .line 125
    if-nez v7, :cond_3

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/dfw0;->c()I

    .line 128
    .line 129
    .line 130
    move-result v9

    .line 131
    invoke-virtual {p0, v0}, Ll/wsr0;->e(Ll/dfw0;)I

    .line 132
    .line 133
    .line 134
    move-result v10

    .line 135
    invoke-virtual {v0, v9}, Ll/dfw0;->k(I)V

    .line 136
    .line 137
    .line 138
    add-int/lit8 v9, v10, 0x7

    .line 139
    .line 140
    div-int/2addr v9, v5

    .line 141
    new-array v9, v9, [B

    .line 142
    .line 143
    invoke-virtual {v0, v9, v4, v10}, Ll/dfw0;->g([BII)V

    .line 144
    .line 145
    .line 146
    new-instance v10, Ll/znr0;

    .line 147
    .line 148
    invoke-direct {v10}, Ll/znr0;-><init>()V

    .line 149
    .line 150
    .line 151
    iget-object v11, p0, Ll/wsr0;->e:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v10, v11}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 154
    .line 155
    .line 156
    const-string v11, "audio/mp4a-latm"

    .line 157
    .line 158
    invoke-virtual {v10, v11}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 159
    .line 160
    .line 161
    iget-object v11, p0, Ll/wsr0;->u:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v10, v11}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 164
    .line 165
    .line 166
    iget v11, p0, Ll/wsr0;->t:I

    .line 167
    .line 168
    invoke-virtual {v10, v11}, Ll/znr0;->k0(I)Ll/znr0;

    .line 169
    .line 170
    .line 171
    iget v11, p0, Ll/wsr0;->r:I

    .line 172
    .line 173
    invoke-virtual {v10, v11}, Ll/znr0;->x(I)Ll/znr0;

    .line 174
    .line 175
    .line 176
    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 177
    .line 178
    .line 179
    move-result-object v9

    .line 180
    invoke-virtual {v10, v9}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 181
    .line 182
    .line 183
    iget-object v9, p0, Ll/wsr0;->a:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v10, v9}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v10}, Ll/znr0;->D()Ll/sqr0;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    iget-object v10, p0, Ll/wsr0;->f:Ll/sqr0;

    .line 193
    .line 194
    invoke-virtual {v9, v10}, Ll/sqr0;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v10

    .line 198
    if-nez v10, :cond_4

    .line 199
    .line 200
    iput-object v9, p0, Ll/wsr0;->f:Ll/sqr0;

    .line 201
    .line 202
    iget v10, v9, Ll/sqr0;->z:I

    .line 203
    .line 204
    int-to-long v10, v10

    .line 205
    const-wide/32 v12, 0x3d090000

    .line 206
    .line 207
    .line 208
    div-long/2addr v12, v10

    .line 209
    iput-wide v12, p0, Ll/wsr0;->s:J

    .line 210
    .line 211
    iget-object v10, p0, Ll/wsr0;->d:Ll/sgr0;

    .line 212
    .line 213
    invoke-interface {v10, v9}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_3
    invoke-static {v0}, Ll/wsr0;->f(Ll/dfw0;)J

    .line 218
    .line 219
    .line 220
    move-result-wide v9

    .line 221
    long-to-int v9, v9

    .line 222
    invoke-virtual {p0, v0}, Ll/wsr0;->e(Ll/dfw0;)I

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    sub-int/2addr v9, v10

    .line 227
    invoke-virtual {v0, v9}, Ll/dfw0;->m(I)V

    .line 228
    .line 229
    .line 230
    :cond_4
    :goto_2
    invoke-virtual {v0, v1}, Ll/dfw0;->d(I)I

    .line 231
    .line 232
    .line 233
    move-result v9

    .line 234
    iput v9, p0, Ll/wsr0;->o:I

    .line 235
    .line 236
    if-eqz v9, :cond_9

    .line 237
    .line 238
    if-eq v9, v2, :cond_8

    .line 239
    .line 240
    if-eq v9, v1, :cond_7

    .line 241
    .line 242
    if-eq v9, v8, :cond_7

    .line 243
    .line 244
    const/4 v1, 0x5

    .line 245
    if-eq v9, v1, :cond_7

    .line 246
    .line 247
    if-eq v9, v3, :cond_6

    .line 248
    .line 249
    const/4 v1, 0x7

    .line 250
    if-ne v9, v1, :cond_5

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :cond_5
    invoke-static {}, Ll/wpg0;->a()V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_6
    :goto_3
    invoke-virtual {v0, v2}, Ll/dfw0;->m(I)V

    .line 258
    .line 259
    .line 260
    goto :goto_4

    .line 261
    :cond_7
    invoke-virtual {v0, v3}, Ll/dfw0;->m(I)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_8
    const/16 v1, 0x9

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ll/dfw0;->m(I)V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_9
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 272
    .line 273
    .line 274
    :goto_4
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    iput-boolean v1, p0, Ll/wsr0;->p:Z

    .line 279
    .line 280
    const-wide/16 v8, 0x0

    .line 281
    .line 282
    iput-wide v8, p0, Ll/wsr0;->q:J

    .line 283
    .line 284
    if-eqz v1, :cond_c

    .line 285
    .line 286
    if-eq v7, v2, :cond_b

    .line 287
    .line 288
    :cond_a
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    iget-wide v7, p0, Ll/wsr0;->q:J

    .line 293
    .line 294
    shl-long/2addr v7, v5

    .line 295
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 296
    .line 297
    .line 298
    move-result v3

    .line 299
    int-to-long v9, v3

    .line 300
    add-long/2addr v7, v9

    .line 301
    iput-wide v7, p0, Ll/wsr0;->q:J

    .line 302
    .line 303
    if-nez v1, :cond_a

    .line 304
    .line 305
    goto :goto_5

    .line 306
    :cond_b
    invoke-static {v0}, Ll/wsr0;->f(Ll/dfw0;)J

    .line 307
    .line 308
    .line 309
    move-result-wide v7

    .line 310
    iput-wide v7, p0, Ll/wsr0;->q:J

    .line 311
    .line 312
    :cond_c
    :goto_5
    invoke-virtual {v0}, Ll/dfw0;->o()Z

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    if-eqz v1, :cond_11

    .line 317
    .line 318
    invoke-virtual {v0, v5}, Ll/dfw0;->m(I)V

    .line 319
    .line 320
    .line 321
    goto :goto_6

    .line 322
    :cond_d
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    throw p0

    .line 327
    :cond_e
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    throw p0

    .line 332
    :cond_f
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    throw p0

    .line 337
    :cond_10
    iget-boolean v1, p0, Ll/wsr0;->l:Z

    .line 338
    .line 339
    if-nez v1, :cond_11

    .line 340
    .line 341
    goto :goto_a

    .line 342
    :cond_11
    :goto_6
    iget v1, p0, Ll/wsr0;->m:I

    .line 343
    .line 344
    if-nez v1, :cond_18

    .line 345
    .line 346
    iget v1, p0, Ll/wsr0;->n:I

    .line 347
    .line 348
    if-nez v1, :cond_17

    .line 349
    .line 350
    iget v1, p0, Ll/wsr0;->o:I

    .line 351
    .line 352
    if-nez v1, :cond_16

    .line 353
    .line 354
    move v1, v4

    .line 355
    :goto_7
    invoke-virtual {v0, v5}, Ll/dfw0;->d(I)I

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    add-int v10, v1, v3

    .line 360
    .line 361
    const/16 v1, 0xff

    .line 362
    .line 363
    if-eq v3, v1, :cond_15

    .line 364
    .line 365
    invoke-virtual {v0}, Ll/dfw0;->c()I

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    and-int/lit8 v3, v1, 0x7

    .line 370
    .line 371
    iget-object v5, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 372
    .line 373
    if-nez v3, :cond_12

    .line 374
    .line 375
    shr-int/lit8 v1, v1, 0x3

    .line 376
    .line 377
    invoke-virtual {v5, v1}, Ll/bgw0;->k(I)V

    .line 378
    .line 379
    .line 380
    goto :goto_8

    .line 381
    :cond_12
    mul-int/lit8 v1, v10, 0x8

    .line 382
    .line 383
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    invoke-virtual {v0, v3, v4, v1}, Ll/dfw0;->g([BII)V

    .line 388
    .line 389
    .line 390
    iget-object v1, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 391
    .line 392
    invoke-virtual {v1, v4}, Ll/bgw0;->k(I)V

    .line 393
    .line 394
    .line 395
    :goto_8
    iget-object v1, p0, Ll/wsr0;->d:Ll/sgr0;

    .line 396
    .line 397
    iget-object v3, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 398
    .line 399
    invoke-interface {v1, v3, v10}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 400
    .line 401
    .line 402
    iget-wide v5, p0, Ll/wsr0;->k:J

    .line 403
    .line 404
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    cmp-long v1, v5, v7

    .line 410
    .line 411
    if-eqz v1, :cond_13

    .line 412
    .line 413
    goto :goto_9

    .line 414
    :cond_13
    move v2, v4

    .line 415
    :goto_9
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 416
    .line 417
    .line 418
    iget-object v6, p0, Ll/wsr0;->d:Ll/sgr0;

    .line 419
    .line 420
    iget-wide v7, p0, Ll/wsr0;->k:J

    .line 421
    .line 422
    const/4 v11, 0x0

    .line 423
    const/4 v12, 0x0

    .line 424
    const/4 v9, 0x1

    .line 425
    invoke-interface/range {v6 .. v12}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 426
    .line 427
    .line 428
    iget-wide v1, p0, Ll/wsr0;->k:J

    .line 429
    .line 430
    iget-wide v5, p0, Ll/wsr0;->s:J

    .line 431
    .line 432
    add-long/2addr v1, v5

    .line 433
    iput-wide v1, p0, Ll/wsr0;->k:J

    .line 434
    .line 435
    iget-boolean v1, p0, Ll/wsr0;->p:Z

    .line 436
    .line 437
    if-eqz v1, :cond_14

    .line 438
    .line 439
    iget-wide v1, p0, Ll/wsr0;->q:J

    .line 440
    .line 441
    long-to-int v1, v1

    .line 442
    invoke-virtual {v0, v1}, Ll/dfw0;->m(I)V

    .line 443
    .line 444
    .line 445
    :cond_14
    :goto_a
    iput v4, p0, Ll/wsr0;->g:I

    .line 446
    .line 447
    goto/16 :goto_0

    .line 448
    .line 449
    :cond_15
    move v1, v10

    .line 450
    goto :goto_7

    .line 451
    :cond_16
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    throw p0

    .line 456
    :cond_17
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    throw p0

    .line 461
    :cond_18
    invoke-static {v6, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    throw p0

    .line 466
    :cond_19
    iget v0, p0, Ll/wsr0;->j:I

    .line 467
    .line 468
    and-int/lit16 v0, v0, -0xe1

    .line 469
    .line 470
    shl-int/2addr v0, v5

    .line 471
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 472
    .line 473
    .line 474
    move-result v2

    .line 475
    or-int/2addr v0, v2

    .line 476
    iput v0, p0, Ll/wsr0;->i:I

    .line 477
    .line 478
    iget-object v2, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 479
    .line 480
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    array-length v3, v3

    .line 485
    if-le v0, v3, :cond_1a

    .line 486
    .line 487
    invoke-virtual {v2, v0}, Ll/bgw0;->h(I)V

    .line 488
    .line 489
    .line 490
    iget-object v0, p0, Ll/wsr0;->c:Ll/dfw0;

    .line 491
    .line 492
    iget-object v2, p0, Ll/wsr0;->b:Ll/bgw0;

    .line 493
    .line 494
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    array-length v3, v2

    .line 499
    invoke-virtual {v0, v2, v3}, Ll/dfw0;->j([BI)V

    .line 500
    .line 501
    .line 502
    :cond_1a
    iput v4, p0, Ll/wsr0;->h:I

    .line 503
    .line 504
    iput v1, p0, Ll/wsr0;->g:I

    .line 505
    .line 506
    goto/16 :goto_0

    .line 507
    .line 508
    :cond_1b
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 509
    .line 510
    .line 511
    move-result v0

    .line 512
    and-int/lit16 v2, v0, 0xe0

    .line 513
    .line 514
    const/16 v5, 0xe0

    .line 515
    .line 516
    if-ne v2, v5, :cond_1c

    .line 517
    .line 518
    iput v0, p0, Ll/wsr0;->j:I

    .line 519
    .line 520
    iput v3, p0, Ll/wsr0;->g:I

    .line 521
    .line 522
    goto/16 :goto_0

    .line 523
    .line 524
    :cond_1c
    if-eq v0, v1, :cond_0

    .line 525
    .line 526
    iput v4, p0, Ll/wsr0;->g:I

    .line 527
    .line 528
    goto/16 :goto_0

    .line 529
    .line 530
    :cond_1d
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 531
    .line 532
    .line 533
    move-result v0

    .line 534
    if-ne v0, v1, :cond_0

    .line 535
    .line 536
    iput v2, p0, Ll/wsr0;->g:I

    .line 537
    .line 538
    goto/16 :goto_0

    .line 539
    .line 540
    :cond_1e
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/wsr0;->k:J

    .line 2
    .line 3
    return-void
.end method

.method public final d(Ll/ser0;Ll/gur0;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/gur0;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/wsr0;->d:Ll/sgr0;

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/wsr0;->e:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public final e(Ll/dfw0;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/dfw0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {p1, v1}, Ll/cdr0;->b(Ll/dfw0;Z)Ll/bdr0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, v1, Ll/bdr0;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v2, p0, Ll/wsr0;->u:Ljava/lang/String;

    .line 13
    .line 14
    iget v2, v1, Ll/bdr0;->a:I

    .line 15
    .line 16
    iput v2, p0, Ll/wsr0;->r:I

    .line 17
    .line 18
    iget v1, v1, Ll/bdr0;->b:I

    .line 19
    .line 20
    iput v1, p0, Ll/wsr0;->t:I

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/dfw0;->a()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr v0, p0

    .line 27
    return v0
.end method

.method public final zze()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wsr0;->g:I

    .line 3
    .line 4
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v1, p0, Ll/wsr0;->k:J

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/wsr0;->l:Z

    .line 12
    .line 13
    return-void
.end method
