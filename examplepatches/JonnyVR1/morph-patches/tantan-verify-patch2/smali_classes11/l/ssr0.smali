.class public final Ll/ssr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ll/ktr0;

.field public final b:Ll/ysr0;

.field public final c:Ll/ysr0;

.field public final d:Ll/ysr0;

.field public e:J

.field public final f:[Z

.field public g:Ljava/lang/String;

.field public h:Ll/sgr0;

.field public i:Ll/rsr0;

.field public j:Z

.field public k:J

.field public l:Z

.field public final m:Ll/bgw0;


# direct methods
.method public constructor <init>(Ll/ktr0;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ssr0;->a:Ll/ktr0;

    .line 5
    .line 6
    const/4 p1, 0x3

    .line 7
    new-array p1, p1, [Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/ssr0;->f:[Z

    .line 10
    .line 11
    new-instance p1, Ll/ysr0;

    .line 12
    .line 13
    const/4 p2, 0x7

    .line 14
    const/16 p3, 0x80

    .line 15
    .line 16
    invoke-direct {p1, p2, p3}, Ll/ysr0;-><init>(II)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/ssr0;->b:Ll/ysr0;

    .line 20
    .line 21
    new-instance p1, Ll/ysr0;

    .line 22
    .line 23
    const/16 p2, 0x8

    .line 24
    .line 25
    invoke-direct {p1, p2, p3}, Ll/ysr0;-><init>(II)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/ssr0;->c:Ll/ysr0;

    .line 29
    .line 30
    new-instance p1, Ll/ysr0;

    .line 31
    .line 32
    const/4 p2, 0x6

    .line 33
    invoke-direct {p1, p2, p3}, Ll/ysr0;-><init>(II)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/ssr0;->d:Ll/ysr0;

    .line 37
    .line 38
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    iput-wide p1, p0, Ll/ssr0;->k:J

    .line 44
    .line 45
    new-instance p1, Ll/bgw0;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/ssr0;->m:Ll/bgw0;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ssr0;->h:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    sget v0, Ll/mpw0;->a:I

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/ssr0;->i:Ll/rsr0;

    .line 11
    .line 12
    iget-wide v0, p0, Ll/ssr0;->e:J

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Ll/rsr0;->a(J)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ssr0;->h:Ll/sgr0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    sget v1, Ll/mpw0;->a:I

    .line 9
    .line 10
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->s()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->t()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->m()[B

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-wide v4, v0, Ll/ssr0;->e:J

    .line 23
    .line 24
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    int-to-long v6, v6

    .line 29
    add-long/2addr v4, v6

    .line 30
    iput-wide v4, v0, Ll/ssr0;->e:J

    .line 31
    .line 32
    iget-object v4, v0, Ll/ssr0;->h:Ll/sgr0;

    .line 33
    .line 34
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    move-object/from16 v6, p1

    .line 39
    .line 40
    invoke-interface {v4, v6, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object v4, v0, Ll/ssr0;->f:[Z

    .line 44
    .line 45
    invoke-static {v3, v1, v2, v4}, Ll/w3x0;->a([BII[Z)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eq v4, v2, :cond_a

    .line 50
    .line 51
    add-int/lit8 v5, v4, 0x3

    .line 52
    .line 53
    aget-byte v6, v3, v5

    .line 54
    .line 55
    and-int/lit8 v10, v6, 0x1f

    .line 56
    .line 57
    sub-int v6, v4, v1

    .line 58
    .line 59
    if-lez v6, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0, v3, v1, v4}, Ll/ssr0;->e([BII)V

    .line 62
    .line 63
    .line 64
    :cond_0
    sub-int v1, v2, v4

    .line 65
    .line 66
    iget-wide v7, v0, Ll/ssr0;->e:J

    .line 67
    .line 68
    int-to-long v11, v1

    .line 69
    sub-long v8, v7, v11

    .line 70
    .line 71
    if-gez v6, :cond_1

    .line 72
    .line 73
    neg-int v6, v6

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const/4 v6, 0x0

    .line 76
    :goto_1
    iget-wide v11, v0, Ll/ssr0;->k:J

    .line 77
    .line 78
    iget-boolean v7, v0, Ll/ssr0;->j:Z

    .line 79
    .line 80
    const/4 v13, 0x4

    .line 81
    if-eqz v7, :cond_3

    .line 82
    .line 83
    :cond_2
    move/from16 v17, v2

    .line 84
    .line 85
    move/from16 v16, v5

    .line 86
    .line 87
    goto/16 :goto_2

    .line 88
    .line 89
    :cond_3
    iget-object v7, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 90
    .line 91
    invoke-virtual {v7, v6}, Ll/ysr0;->d(I)Z

    .line 92
    .line 93
    .line 94
    iget-object v7, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 95
    .line 96
    invoke-virtual {v7, v6}, Ll/ysr0;->d(I)Z

    .line 97
    .line 98
    .line 99
    iget-boolean v7, v0, Ll/ssr0;->j:Z

    .line 100
    .line 101
    iget-object v14, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 102
    .line 103
    if-nez v7, :cond_4

    .line 104
    .line 105
    invoke-virtual {v14}, Ll/ysr0;->e()Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    if-eqz v7, :cond_2

    .line 110
    .line 111
    iget-object v7, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 112
    .line 113
    invoke-virtual {v7}, Ll/ysr0;->e()Z

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    if-eqz v7, :cond_2

    .line 118
    .line 119
    new-instance v7, Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .line 123
    .line 124
    iget-object v14, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 125
    .line 126
    iget-object v15, v14, Ll/ysr0;->d:[B

    .line 127
    .line 128
    iget v14, v14, Ll/ysr0;->e:I

    .line 129
    .line 130
    invoke-static {v15, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 131
    .line 132
    .line 133
    move-result-object v14

    .line 134
    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    iget-object v14, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 138
    .line 139
    iget-object v15, v14, Ll/ysr0;->d:[B

    .line 140
    .line 141
    iget v14, v14, Ll/ysr0;->e:I

    .line 142
    .line 143
    invoke-static {v15, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 144
    .line 145
    .line 146
    move-result-object v14

    .line 147
    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    iget-object v14, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 151
    .line 152
    iget-object v15, v14, Ll/ysr0;->d:[B

    .line 153
    .line 154
    iget v14, v14, Ll/ysr0;->e:I

    .line 155
    .line 156
    invoke-static {v15, v13, v14}, Ll/w3x0;->e([BII)Ll/p2x0;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    iget-object v15, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 161
    .line 162
    iget-object v4, v15, Ll/ysr0;->d:[B

    .line 163
    .line 164
    iget v15, v15, Ll/ysr0;->e:I

    .line 165
    .line 166
    invoke-static {v4, v13, v15}, Ll/w3x0;->d([BII)Ll/j1x0;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    iget v15, v14, Ll/p2x0;->a:I

    .line 171
    .line 172
    iget v13, v14, Ll/p2x0;->b:I

    .line 173
    .line 174
    move/from16 v16, v5

    .line 175
    .line 176
    iget v5, v14, Ll/p2x0;->c:I

    .line 177
    .line 178
    invoke-static {v15, v13, v5}, Ll/rgv0;->a(III)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    iget-object v13, v0, Ll/ssr0;->h:Ll/sgr0;

    .line 183
    .line 184
    new-instance v15, Ll/znr0;

    .line 185
    .line 186
    invoke-direct {v15}, Ll/znr0;-><init>()V

    .line 187
    .line 188
    .line 189
    move/from16 v17, v2

    .line 190
    .line 191
    iget-object v2, v0, Ll/ssr0;->g:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v15, v2}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 194
    .line 195
    .line 196
    const-string v2, "video/avc"

    .line 197
    .line 198
    invoke-virtual {v15, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v15, v5}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 202
    .line 203
    .line 204
    iget v2, v14, Ll/p2x0;->e:I

    .line 205
    .line 206
    invoke-virtual {v15, v2}, Ll/znr0;->C(I)Ll/znr0;

    .line 207
    .line 208
    .line 209
    iget v2, v14, Ll/p2x0;->f:I

    .line 210
    .line 211
    invoke-virtual {v15, v2}, Ll/znr0;->i(I)Ll/znr0;

    .line 212
    .line 213
    .line 214
    new-instance v2, Ll/dty0;

    .line 215
    .line 216
    invoke-direct {v2}, Ll/dty0;-><init>()V

    .line 217
    .line 218
    .line 219
    iget v5, v14, Ll/p2x0;->j:I

    .line 220
    .line 221
    invoke-virtual {v2, v5}, Ll/dty0;->c(I)Ll/dty0;

    .line 222
    .line 223
    .line 224
    iget v5, v14, Ll/p2x0;->k:I

    .line 225
    .line 226
    invoke-virtual {v2, v5}, Ll/dty0;->b(I)Ll/dty0;

    .line 227
    .line 228
    .line 229
    iget v5, v14, Ll/p2x0;->l:I

    .line 230
    .line 231
    invoke-virtual {v2, v5}, Ll/dty0;->d(I)Ll/dty0;

    .line 232
    .line 233
    .line 234
    iget v5, v14, Ll/p2x0;->h:I

    .line 235
    .line 236
    add-int/lit8 v5, v5, 0x8

    .line 237
    .line 238
    invoke-virtual {v2, v5}, Ll/dty0;->f(I)Ll/dty0;

    .line 239
    .line 240
    .line 241
    iget v5, v14, Ll/p2x0;->i:I

    .line 242
    .line 243
    add-int/lit8 v5, v5, 0x8

    .line 244
    .line 245
    invoke-virtual {v2, v5}, Ll/dty0;->a(I)Ll/dty0;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v2}, Ll/dty0;->g()Ll/wwy0;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-virtual {v15, v2}, Ll/znr0;->a(Ll/wwy0;)Ll/znr0;

    .line 253
    .line 254
    .line 255
    iget v2, v14, Ll/p2x0;->g:F

    .line 256
    .line 257
    invoke-virtual {v15, v2}, Ll/znr0;->s(F)Ll/znr0;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v15, v7}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v15}, Ll/znr0;->D()Ll/sqr0;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-interface {v13, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 268
    .line 269
    .line 270
    const/4 v2, 0x1

    .line 271
    iput-boolean v2, v0, Ll/ssr0;->j:Z

    .line 272
    .line 273
    iget-object v2, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 274
    .line 275
    invoke-virtual {v2, v14}, Ll/rsr0;->c(Ll/p2x0;)V

    .line 276
    .line 277
    .line 278
    iget-object v2, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 279
    .line 280
    invoke-virtual {v2, v4}, Ll/rsr0;->b(Ll/j1x0;)V

    .line 281
    .line 282
    .line 283
    iget-object v2, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 284
    .line 285
    invoke-virtual {v2}, Ll/ysr0;->b()V

    .line 286
    .line 287
    .line 288
    iget-object v2, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 289
    .line 290
    invoke-virtual {v2}, Ll/ysr0;->b()V

    .line 291
    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_4
    move/from16 v17, v2

    .line 295
    .line 296
    move/from16 v16, v5

    .line 297
    .line 298
    invoke-virtual {v14}, Ll/ysr0;->e()Z

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    if-eqz v2, :cond_5

    .line 303
    .line 304
    iget-object v2, v14, Ll/ysr0;->d:[B

    .line 305
    .line 306
    iget v4, v14, Ll/ysr0;->e:I

    .line 307
    .line 308
    const/4 v5, 0x4

    .line 309
    invoke-static {v2, v5, v4}, Ll/w3x0;->e([BII)Ll/p2x0;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    iget-object v4, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 314
    .line 315
    invoke-virtual {v4, v2}, Ll/rsr0;->c(Ll/p2x0;)V

    .line 316
    .line 317
    .line 318
    iget-object v2, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 319
    .line 320
    invoke-virtual {v2}, Ll/ysr0;->b()V

    .line 321
    .line 322
    .line 323
    goto :goto_2

    .line 324
    :cond_5
    const/4 v5, 0x4

    .line 325
    iget-object v2, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 326
    .line 327
    invoke-virtual {v2}, Ll/ysr0;->e()Z

    .line 328
    .line 329
    .line 330
    move-result v4

    .line 331
    if-eqz v4, :cond_6

    .line 332
    .line 333
    iget-object v4, v2, Ll/ysr0;->d:[B

    .line 334
    .line 335
    iget v2, v2, Ll/ysr0;->e:I

    .line 336
    .line 337
    invoke-static {v4, v5, v2}, Ll/w3x0;->d([BII)Ll/j1x0;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    iget-object v4, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 342
    .line 343
    invoke-virtual {v4, v2}, Ll/rsr0;->b(Ll/j1x0;)V

    .line 344
    .line 345
    .line 346
    iget-object v2, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 347
    .line 348
    invoke-virtual {v2}, Ll/ysr0;->b()V

    .line 349
    .line 350
    .line 351
    :cond_6
    :goto_2
    iget-object v2, v0, Ll/ssr0;->d:Ll/ysr0;

    .line 352
    .line 353
    invoke-virtual {v2, v6}, Ll/ysr0;->d(I)Z

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    if-eqz v2, :cond_7

    .line 358
    .line 359
    iget-object v2, v0, Ll/ssr0;->d:Ll/ysr0;

    .line 360
    .line 361
    iget-object v4, v2, Ll/ysr0;->d:[B

    .line 362
    .line 363
    iget v2, v2, Ll/ysr0;->e:I

    .line 364
    .line 365
    invoke-static {v4, v2}, Ll/w3x0;->b([BI)I

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    iget-object v4, v0, Ll/ssr0;->m:Ll/bgw0;

    .line 370
    .line 371
    iget-object v5, v0, Ll/ssr0;->d:Ll/ysr0;

    .line 372
    .line 373
    iget-object v5, v5, Ll/ysr0;->d:[B

    .line 374
    .line 375
    invoke-virtual {v4, v5, v2}, Ll/bgw0;->i([BI)V

    .line 376
    .line 377
    .line 378
    iget-object v2, v0, Ll/ssr0;->m:Ll/bgw0;

    .line 379
    .line 380
    const/4 v5, 0x4

    .line 381
    invoke-virtual {v2, v5}, Ll/bgw0;->k(I)V

    .line 382
    .line 383
    .line 384
    iget-object v2, v0, Ll/ssr0;->a:Ll/ktr0;

    .line 385
    .line 386
    iget-object v4, v0, Ll/ssr0;->m:Ll/bgw0;

    .line 387
    .line 388
    invoke-virtual {v2, v11, v12, v4}, Ll/ktr0;->a(JLl/bgw0;)V

    .line 389
    .line 390
    .line 391
    :cond_7
    iget-object v2, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 392
    .line 393
    iget-boolean v4, v0, Ll/ssr0;->j:Z

    .line 394
    .line 395
    invoke-virtual {v2, v8, v9, v1, v4}, Ll/rsr0;->f(JIZ)Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-eqz v1, :cond_8

    .line 400
    .line 401
    const/4 v1, 0x0

    .line 402
    iput-boolean v1, v0, Ll/ssr0;->l:Z

    .line 403
    .line 404
    :cond_8
    iget-wide v11, v0, Ll/ssr0;->k:J

    .line 405
    .line 406
    iget-boolean v1, v0, Ll/ssr0;->j:Z

    .line 407
    .line 408
    if-nez v1, :cond_9

    .line 409
    .line 410
    iget-object v1, v0, Ll/ssr0;->b:Ll/ysr0;

    .line 411
    .line 412
    invoke-virtual {v1, v10}, Ll/ysr0;->c(I)V

    .line 413
    .line 414
    .line 415
    iget-object v1, v0, Ll/ssr0;->c:Ll/ysr0;

    .line 416
    .line 417
    invoke-virtual {v1, v10}, Ll/ysr0;->c(I)V

    .line 418
    .line 419
    .line 420
    :cond_9
    iget-object v1, v0, Ll/ssr0;->d:Ll/ysr0;

    .line 421
    .line 422
    invoke-virtual {v1, v10}, Ll/ysr0;->c(I)V

    .line 423
    .line 424
    .line 425
    iget-object v7, v0, Ll/ssr0;->i:Ll/rsr0;

    .line 426
    .line 427
    iget-boolean v13, v0, Ll/ssr0;->l:Z

    .line 428
    .line 429
    invoke-virtual/range {v7 .. v13}, Ll/rsr0;->e(JIJZ)V

    .line 430
    .line 431
    .line 432
    move/from16 v1, v16

    .line 433
    .line 434
    move/from16 v2, v17

    .line 435
    .line 436
    goto/16 :goto_0

    .line 437
    .line 438
    :cond_a
    invoke-virtual {v0, v3, v1, v2}, Ll/ssr0;->e([BII)V

    .line 439
    .line 440
    .line 441
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ssr0;->k:J

    .line 2
    .line 3
    and-int/lit8 p1, p3, 0x2

    .line 4
    .line 5
    iget-boolean p2, p0, Ll/ssr0;->l:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    or-int/2addr p1, p2

    .line 13
    iput-boolean p1, p0, Ll/ssr0;->l:Z

    .line 14
    .line 15
    return-void
.end method

.method public final d(Ll/ser0;Ll/gur0;)V
    .locals 3

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
    iput-object v0, p0, Ll/ssr0;->g:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/ssr0;->h:Ll/sgr0;

    .line 20
    .line 21
    new-instance v1, Ll/rsr0;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v1, v0, v2, v2}, Ll/rsr0;-><init>(Ll/sgr0;ZZ)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/ssr0;->i:Ll/rsr0;

    .line 28
    .line 29
    iget-object p0, p0, Ll/ssr0;->a:Ll/ktr0;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ll/ktr0;->b(Ll/ser0;Ll/gur0;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final e([BII)V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ssr0;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ssr0;->b:Ll/ysr0;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ssr0;->c:Ll/ysr0;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/ssr0;->d:Ll/ysr0;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/ssr0;->e:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ssr0;->l:Z

    .line 7
    .line 8
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Ll/ssr0;->k:J

    .line 14
    .line 15
    iget-object v0, p0, Ll/ssr0;->f:[Z

    .line 16
    .line 17
    invoke-static {v0}, Ll/w3x0;->f([Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ssr0;->b:Ll/ysr0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/ssr0;->c:Ll/ysr0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ssr0;->d:Ll/ysr0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/ssr0;->i:Ll/rsr0;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/rsr0;->d()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
