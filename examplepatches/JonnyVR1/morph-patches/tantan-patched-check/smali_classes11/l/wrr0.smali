.class public final Ll/wrr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:Ll/sgr0;

.field public e:I

.field public f:I

.field public g:I

.field public h:J

.field public i:Ll/sqr0;

.field public j:I

.field public k:J


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
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/16 v1, 0x12

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/bgw0;-><init>([B)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/wrr0;->a:Ll/bgw0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ll/wrr0;->e:I

    .line 17
    .line 18
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    iput-wide v0, p0, Ll/wrr0;->k:J

    .line 24
    .line 25
    iput-object p1, p0, Ll/wrr0;->b:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/wrr0;->d:Ll/sgr0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-lez v2, :cond_d

    .line 15
    .line 16
    iget v2, v0, Ll/wrr0;->e:I

    .line 17
    .line 18
    const/16 v3, 0x8

    .line 19
    .line 20
    const/4 v4, 0x3

    .line 21
    const/4 v5, 0x2

    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v7, 0x4

    .line 24
    const/4 v8, 0x1

    .line 25
    if-eqz v2, :cond_b

    .line 26
    .line 27
    if-eq v2, v8, :cond_2

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget v3, v0, Ll/wrr0;->j:I

    .line 34
    .line 35
    iget v4, v0, Ll/wrr0;->f:I

    .line 36
    .line 37
    sub-int/2addr v3, v4

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v3, v0, Ll/wrr0;->d:Ll/sgr0;

    .line 43
    .line 44
    invoke-interface {v3, v1, v2}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 45
    .line 46
    .line 47
    iget v3, v0, Ll/wrr0;->f:I

    .line 48
    .line 49
    add-int/2addr v3, v2

    .line 50
    iput v3, v0, Ll/wrr0;->f:I

    .line 51
    .line 52
    iget v2, v0, Ll/wrr0;->j:I

    .line 53
    .line 54
    if-ne v3, v2, :cond_0

    .line 55
    .line 56
    iget-wide v2, v0, Ll/wrr0;->k:J

    .line 57
    .line 58
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    cmp-long v2, v2, v4

    .line 64
    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    move v8, v6

    .line 69
    :goto_1
    invoke-static {v8}, Ll/lev0;->f(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v9, v0, Ll/wrr0;->d:Ll/sgr0;

    .line 73
    .line 74
    iget-wide v10, v0, Ll/wrr0;->k:J

    .line 75
    .line 76
    iget v13, v0, Ll/wrr0;->j:I

    .line 77
    .line 78
    const/4 v14, 0x0

    .line 79
    const/4 v15, 0x0

    .line 80
    const/4 v12, 0x1

    .line 81
    invoke-interface/range {v9 .. v15}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 82
    .line 83
    .line 84
    iget-wide v2, v0, Ll/wrr0;->k:J

    .line 85
    .line 86
    iget-wide v4, v0, Ll/wrr0;->h:J

    .line 87
    .line 88
    add-long/2addr v2, v4

    .line 89
    iput-wide v2, v0, Ll/wrr0;->k:J

    .line 90
    .line 91
    iput v6, v0, Ll/wrr0;->e:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    iget-object v2, v0, Ll/wrr0;->a:Ll/bgw0;

    .line 95
    .line 96
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    iget v10, v0, Ll/wrr0;->f:I

    .line 105
    .line 106
    const/16 v11, 0x12

    .line 107
    .line 108
    rsub-int/lit8 v10, v10, 0x12

    .line 109
    .line 110
    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    iget v10, v0, Ll/wrr0;->f:I

    .line 115
    .line 116
    invoke-virtual {v1, v2, v10, v9}, Ll/bgw0;->g([BII)V

    .line 117
    .line 118
    .line 119
    iget v2, v0, Ll/wrr0;->f:I

    .line 120
    .line 121
    add-int/2addr v2, v9

    .line 122
    iput v2, v0, Ll/wrr0;->f:I

    .line 123
    .line 124
    if-ne v2, v11, :cond_0

    .line 125
    .line 126
    iget-object v2, v0, Ll/wrr0;->a:Ll/bgw0;

    .line 127
    .line 128
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    iget-object v9, v0, Ll/wrr0;->i:Ll/sqr0;

    .line 133
    .line 134
    if-nez v9, :cond_3

    .line 135
    .line 136
    iget-object v9, v0, Ll/wrr0;->c:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v10, v0, Ll/wrr0;->b:Ljava/lang/String;

    .line 139
    .line 140
    const/4 v12, 0x0

    .line 141
    invoke-static {v2, v9, v10, v12}, Ll/mer0;->a([BLjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzae;)Ll/sqr0;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    iput-object v9, v0, Ll/wrr0;->i:Ll/sqr0;

    .line 146
    .line 147
    iget-object v10, v0, Ll/wrr0;->d:Ll/sgr0;

    .line 148
    .line 149
    invoke-interface {v10, v9}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    sget-object v9, Ll/mer0;->a:[I

    .line 153
    .line 154
    aget-byte v9, v2, v6

    .line 155
    .line 156
    const/16 v10, 0x1f

    .line 157
    .line 158
    const/4 v12, -0x1

    .line 159
    const/4 v13, -0x2

    .line 160
    const/4 v14, 0x5

    .line 161
    const/4 v15, 0x7

    .line 162
    const/16 v16, 0x6

    .line 163
    .line 164
    if-eq v9, v13, :cond_6

    .line 165
    .line 166
    if-eq v9, v12, :cond_5

    .line 167
    .line 168
    if-eq v9, v10, :cond_4

    .line 169
    .line 170
    aget-byte v3, v2, v14

    .line 171
    .line 172
    and-int/2addr v3, v4

    .line 173
    shl-int/lit8 v3, v3, 0xc

    .line 174
    .line 175
    aget-byte v4, v2, v16

    .line 176
    .line 177
    and-int/lit16 v4, v4, 0xff

    .line 178
    .line 179
    shl-int/2addr v4, v7

    .line 180
    move/from16 v17, v14

    .line 181
    .line 182
    aget-byte v14, v2, v15

    .line 183
    .line 184
    :goto_2
    and-int/lit16 v14, v14, 0xf0

    .line 185
    .line 186
    shr-int/2addr v14, v7

    .line 187
    or-int/2addr v3, v4

    .line 188
    or-int/2addr v3, v14

    .line 189
    add-int/2addr v3, v8

    .line 190
    move v4, v6

    .line 191
    goto :goto_4

    .line 192
    :cond_4
    move/from16 v17, v14

    .line 193
    .line 194
    aget-byte v14, v2, v16

    .line 195
    .line 196
    and-int/2addr v4, v14

    .line 197
    shl-int/lit8 v4, v4, 0xc

    .line 198
    .line 199
    aget-byte v14, v2, v15

    .line 200
    .line 201
    and-int/lit16 v14, v14, 0xff

    .line 202
    .line 203
    shl-int/2addr v14, v7

    .line 204
    aget-byte v3, v2, v3

    .line 205
    .line 206
    and-int/lit8 v3, v3, 0x3c

    .line 207
    .line 208
    shr-int/2addr v3, v5

    .line 209
    or-int/2addr v4, v14

    .line 210
    or-int/2addr v3, v4

    .line 211
    :goto_3
    add-int/2addr v3, v8

    .line 212
    move v4, v8

    .line 213
    goto :goto_4

    .line 214
    :cond_5
    move/from16 v17, v14

    .line 215
    .line 216
    aget-byte v3, v2, v15

    .line 217
    .line 218
    and-int/2addr v3, v4

    .line 219
    shl-int/lit8 v3, v3, 0xc

    .line 220
    .line 221
    aget-byte v4, v2, v16

    .line 222
    .line 223
    and-int/lit16 v4, v4, 0xff

    .line 224
    .line 225
    shl-int/2addr v4, v7

    .line 226
    const/16 v14, 0x9

    .line 227
    .line 228
    aget-byte v14, v2, v14

    .line 229
    .line 230
    and-int/lit8 v14, v14, 0x3c

    .line 231
    .line 232
    shr-int/2addr v14, v5

    .line 233
    or-int/2addr v3, v4

    .line 234
    or-int/2addr v3, v14

    .line 235
    goto :goto_3

    .line 236
    :cond_6
    move/from16 v17, v14

    .line 237
    .line 238
    aget-byte v3, v2, v7

    .line 239
    .line 240
    and-int/2addr v3, v4

    .line 241
    shl-int/lit8 v3, v3, 0xc

    .line 242
    .line 243
    aget-byte v4, v2, v15

    .line 244
    .line 245
    and-int/lit16 v4, v4, 0xff

    .line 246
    .line 247
    shl-int/2addr v4, v7

    .line 248
    aget-byte v14, v2, v16

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :goto_4
    if-eqz v4, :cond_7

    .line 252
    .line 253
    mul-int/lit8 v3, v3, 0x10

    .line 254
    .line 255
    div-int/lit8 v3, v3, 0xe

    .line 256
    .line 257
    :cond_7
    iput v3, v0, Ll/wrr0;->j:I

    .line 258
    .line 259
    if-eq v9, v13, :cond_a

    .line 260
    .line 261
    if-eq v9, v12, :cond_9

    .line 262
    .line 263
    if-eq v9, v10, :cond_8

    .line 264
    .line 265
    aget-byte v3, v2, v7

    .line 266
    .line 267
    and-int/2addr v3, v8

    .line 268
    shl-int/lit8 v3, v3, 0x6

    .line 269
    .line 270
    aget-byte v2, v2, v17

    .line 271
    .line 272
    :goto_5
    and-int/lit16 v2, v2, 0xfc

    .line 273
    .line 274
    :goto_6
    shr-int/2addr v2, v5

    .line 275
    or-int/2addr v2, v3

    .line 276
    goto :goto_8

    .line 277
    :cond_8
    aget-byte v3, v2, v17

    .line 278
    .line 279
    and-int/2addr v3, v15

    .line 280
    shl-int/2addr v3, v7

    .line 281
    aget-byte v2, v2, v16

    .line 282
    .line 283
    :goto_7
    and-int/lit8 v2, v2, 0x3c

    .line 284
    .line 285
    goto :goto_6

    .line 286
    :cond_9
    aget-byte v3, v2, v7

    .line 287
    .line 288
    and-int/2addr v3, v15

    .line 289
    shl-int/2addr v3, v7

    .line 290
    aget-byte v2, v2, v15

    .line 291
    .line 292
    goto :goto_7

    .line 293
    :cond_a
    aget-byte v3, v2, v17

    .line 294
    .line 295
    and-int/2addr v3, v8

    .line 296
    shl-int/lit8 v3, v3, 0x6

    .line 297
    .line 298
    aget-byte v2, v2, v7

    .line 299
    .line 300
    goto :goto_5

    .line 301
    :goto_8
    add-int/2addr v2, v8

    .line 302
    iget-object v3, v0, Ll/wrr0;->i:Ll/sqr0;

    .line 303
    .line 304
    iget v3, v3, Ll/sqr0;->z:I

    .line 305
    .line 306
    mul-int/lit8 v2, v2, 0x20

    .line 307
    .line 308
    int-to-long v7, v2

    .line 309
    const-wide/32 v9, 0xf4240

    .line 310
    .line 311
    .line 312
    mul-long/2addr v7, v9

    .line 313
    int-to-long v2, v3

    .line 314
    div-long/2addr v7, v2

    .line 315
    long-to-int v2, v7

    .line 316
    int-to-long v2, v2

    .line 317
    iput-wide v2, v0, Ll/wrr0;->h:J

    .line 318
    .line 319
    iget-object v2, v0, Ll/wrr0;->a:Ll/bgw0;

    .line 320
    .line 321
    invoke-virtual {v2, v6}, Ll/bgw0;->k(I)V

    .line 322
    .line 323
    .line 324
    iget-object v2, v0, Ll/wrr0;->d:Ll/sgr0;

    .line 325
    .line 326
    iget-object v3, v0, Ll/wrr0;->a:Ll/bgw0;

    .line 327
    .line 328
    invoke-interface {v2, v3, v11}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 329
    .line 330
    .line 331
    iput v5, v0, Ll/wrr0;->e:I

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :cond_b
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    if-lez v2, :cond_0

    .line 340
    .line 341
    iget v2, v0, Ll/wrr0;->g:I

    .line 342
    .line 343
    shl-int/2addr v2, v3

    .line 344
    iput v2, v0, Ll/wrr0;->g:I

    .line 345
    .line 346
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 347
    .line 348
    .line 349
    move-result v9

    .line 350
    or-int/2addr v2, v9

    .line 351
    iput v2, v0, Ll/wrr0;->g:I

    .line 352
    .line 353
    sget-object v9, Ll/mer0;->a:[I

    .line 354
    .line 355
    const v9, 0x7ffe8001

    .line 356
    .line 357
    .line 358
    if-eq v2, v9, :cond_c

    .line 359
    .line 360
    const v9, -0x180fe80

    .line 361
    .line 362
    .line 363
    if-eq v2, v9, :cond_c

    .line 364
    .line 365
    const v9, 0x1fffe800

    .line 366
    .line 367
    .line 368
    if-eq v2, v9, :cond_c

    .line 369
    .line 370
    const v9, -0xe0ff18

    .line 371
    .line 372
    .line 373
    if-ne v2, v9, :cond_b

    .line 374
    .line 375
    :cond_c
    iget-object v2, v0, Ll/wrr0;->a:Ll/bgw0;

    .line 376
    .line 377
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    iget v3, v0, Ll/wrr0;->g:I

    .line 382
    .line 383
    shr-int/lit8 v9, v3, 0x18

    .line 384
    .line 385
    and-int/lit16 v9, v9, 0xff

    .line 386
    .line 387
    int-to-byte v9, v9

    .line 388
    aput-byte v9, v2, v6

    .line 389
    .line 390
    shr-int/lit8 v9, v3, 0x10

    .line 391
    .line 392
    and-int/lit16 v9, v9, 0xff

    .line 393
    .line 394
    int-to-byte v9, v9

    .line 395
    aput-byte v9, v2, v8

    .line 396
    .line 397
    shr-int/lit8 v9, v3, 0x8

    .line 398
    .line 399
    and-int/lit16 v9, v9, 0xff

    .line 400
    .line 401
    int-to-byte v9, v9

    .line 402
    aput-byte v9, v2, v5

    .line 403
    .line 404
    and-int/lit16 v3, v3, 0xff

    .line 405
    .line 406
    int-to-byte v3, v3

    .line 407
    aput-byte v3, v2, v4

    .line 408
    .line 409
    iput v7, v0, Ll/wrr0;->f:I

    .line 410
    .line 411
    iput v6, v0, Ll/wrr0;->g:I

    .line 412
    .line 413
    iput v8, v0, Ll/wrr0;->e:I

    .line 414
    .line 415
    goto/16 :goto_0

    .line 416
    .line 417
    :cond_d
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/wrr0;->k:J

    .line 2
    .line 3
    return-void
.end method

.method public final d(Ll/ser0;Ll/gur0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/gur0;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/wrr0;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-interface {p1, p2, v0}, Ll/ser0;->i(II)Ll/sgr0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/wrr0;->d:Ll/sgr0;

    .line 20
    .line 21
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wrr0;->e:I

    .line 3
    .line 4
    iput v0, p0, Ll/wrr0;->f:I

    .line 5
    .line 6
    iput v0, p0, Ll/wrr0;->g:I

    .line 7
    .line 8
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Ll/wrr0;->k:J

    .line 14
    .line 15
    return-void
.end method
