.class public final Ll/osr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# static fields
.field public static final l:[F


# instance fields
.field public final a:Ll/jur0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/bgw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:[Z

.field public final d:Ll/msr0;

.field public final e:Ll/ysr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ll/nsr0;

.field public g:J

.field public h:Ljava/lang/String;

.field public i:Ll/sgr0;

.field public j:Z

.field public k:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/osr0;->l:[F

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f8ba2e9
        0x3f68ba2f
        0x3fba2e8c
        0x3f9b26ca
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, v0}, Ll/osr0;-><init>(Ll/jur0;)V

    return-void
.end method

.method public constructor <init>(Ll/jur0;)V
    .locals 3
    .param p1    # Ll/jur0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/osr0;->a:Ll/jur0;

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    new-array p1, p1, [Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/osr0;->c:[Z

    .line 10
    .line 11
    new-instance p1, Ll/msr0;

    .line 12
    .line 13
    const/16 v0, 0x80

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ll/msr0;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/osr0;->d:Ll/msr0;

    .line 19
    .line 20
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    iput-wide v1, p0, Ll/osr0;->k:J

    .line 26
    .line 27
    new-instance p1, Ll/ysr0;

    .line 28
    .line 29
    const/16 v1, 0xb2

    .line 30
    .line 31
    invoke-direct {p1, v1, v0}, Ll/ysr0;-><init>(II)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/osr0;->e:Ll/ysr0;

    .line 35
    .line 36
    new-instance p1, Ll/bgw0;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/osr0;->b:Ll/bgw0;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/osr0;->f:Ll/nsr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/osr0;->f:Ll/nsr0;

    .line 9
    .line 10
    iget-wide v0, p0, Ll/osr0;->g:J

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iget-boolean v3, p0, Ll/osr0;->j:Z

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1, v2, v3}, Ll/nsr0;->b(JIZ)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/osr0;->f:Ll/nsr0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/nsr0;->d()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/osr0;->f:Ll/nsr0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Ll/osr0;->i:Ll/sgr0;

    .line 9
    .line 10
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->s()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->t()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->m()[B

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-wide v4, v0, Ll/osr0;->g:J

    .line 26
    .line 27
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    int-to-long v6, v6

    .line 32
    add-long/2addr v4, v6

    .line 33
    iput-wide v4, v0, Ll/osr0;->g:J

    .line 34
    .line 35
    iget-object v4, v0, Ll/osr0;->i:Ll/sgr0;

    .line 36
    .line 37
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    move-object/from16 v6, p1

    .line 42
    .line 43
    invoke-interface {v4, v6, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v4, v0, Ll/osr0;->c:[Z

    .line 47
    .line 48
    invoke-static {v3, v1, v2, v4}, Ll/w3x0;->a([BII[Z)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-ne v4, v2, :cond_1

    .line 53
    .line 54
    iget-boolean v4, v0, Ll/osr0;->j:Z

    .line 55
    .line 56
    if-nez v4, :cond_0

    .line 57
    .line 58
    iget-object v4, v0, Ll/osr0;->d:Ll/msr0;

    .line 59
    .line 60
    invoke-virtual {v4, v3, v1, v2}, Ll/msr0;->a([BII)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v4, v0, Ll/osr0;->f:Ll/nsr0;

    .line 64
    .line 65
    invoke-virtual {v4, v3, v1, v2}, Ll/nsr0;->a([BII)V

    .line 66
    .line 67
    .line 68
    iget-object v0, v0, Ll/osr0;->e:Ll/ysr0;

    .line 69
    .line 70
    invoke-virtual {v0, v3, v1, v2}, Ll/ysr0;->a([BII)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    add-int/lit8 v7, v4, 0x3

    .line 79
    .line 80
    aget-byte v5, v5, v7

    .line 81
    .line 82
    and-int/lit16 v5, v5, 0xff

    .line 83
    .line 84
    sub-int v8, v4, v1

    .line 85
    .line 86
    iget-boolean v9, v0, Ll/osr0;->j:Z

    .line 87
    .line 88
    if-nez v9, :cond_d

    .line 89
    .line 90
    if-lez v8, :cond_2

    .line 91
    .line 92
    iget-object v9, v0, Ll/osr0;->d:Ll/msr0;

    .line 93
    .line 94
    invoke-virtual {v9, v3, v1, v4}, Ll/msr0;->a([BII)V

    .line 95
    .line 96
    .line 97
    :cond_2
    if-gez v8, :cond_3

    .line 98
    .line 99
    neg-int v9, v8

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    const/4 v9, 0x0

    .line 102
    :goto_1
    iget-object v12, v0, Ll/osr0;->d:Ll/msr0;

    .line 103
    .line 104
    invoke-virtual {v12, v5, v9}, Ll/msr0;->c(II)Z

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    if-eqz v9, :cond_d

    .line 109
    .line 110
    iget-object v9, v0, Ll/osr0;->i:Ll/sgr0;

    .line 111
    .line 112
    iget-object v12, v0, Ll/osr0;->d:Ll/msr0;

    .line 113
    .line 114
    iget v13, v12, Ll/msr0;->d:I

    .line 115
    .line 116
    iget-object v14, v0, Ll/osr0;->h:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    iget-object v15, v12, Ll/msr0;->e:[B

    .line 122
    .line 123
    iget v12, v12, Ll/msr0;->c:I

    .line 124
    .line 125
    invoke-static {v15, v12}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 126
    .line 127
    .line 128
    move-result-object v12

    .line 129
    new-instance v15, Ll/dfw0;

    .line 130
    .line 131
    array-length v10, v12

    .line 132
    invoke-direct {v15, v12, v10}, Ll/dfw0;-><init>([BI)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v15, v13}, Ll/dfw0;->n(I)V

    .line 136
    .line 137
    .line 138
    const/4 v10, 0x4

    .line 139
    invoke-virtual {v15, v10}, Ll/dfw0;->n(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 143
    .line 144
    .line 145
    const/16 v13, 0x8

    .line 146
    .line 147
    invoke-virtual {v15, v13}, Ll/dfw0;->m(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v15}, Ll/dfw0;->o()Z

    .line 151
    .line 152
    .line 153
    move-result v16

    .line 154
    const/4 v11, 0x3

    .line 155
    if-eqz v16, :cond_4

    .line 156
    .line 157
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v15, v11}, Ll/dfw0;->m(I)V

    .line 161
    .line 162
    .line 163
    :cond_4
    invoke-virtual {v15, v10}, Ll/dfw0;->d(I)I

    .line 164
    .line 165
    .line 166
    move-result v10

    .line 167
    const/high16 v16, 0x3f800000    # 1.0f

    .line 168
    .line 169
    const-string v11, "Invalid aspect ratio"

    .line 170
    .line 171
    const-string v13, "H263Reader"

    .line 172
    .line 173
    move/from16 v17, v2

    .line 174
    .line 175
    const/16 v2, 0xf

    .line 176
    .line 177
    if-ne v10, v2, :cond_6

    .line 178
    .line 179
    const/16 v2, 0x8

    .line 180
    .line 181
    invoke-virtual {v15, v2}, Ll/dfw0;->d(I)I

    .line 182
    .line 183
    .line 184
    move-result v10

    .line 185
    invoke-virtual {v15, v2}, Ll/dfw0;->d(I)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-nez v2, :cond_5

    .line 190
    .line 191
    invoke-static {v13, v11}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :goto_2
    move/from16 v2, v16

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_5
    int-to-float v10, v10

    .line 198
    int-to-float v2, v2

    .line 199
    div-float v16, v10, v2

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_6
    const/4 v2, 0x7

    .line 203
    if-ge v10, v2, :cond_7

    .line 204
    .line 205
    sget-object v2, Ll/osr0;->l:[F

    .line 206
    .line 207
    aget v16, v2, v10

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_7
    invoke-static {v13, v11}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :goto_3
    invoke-virtual {v15}, Ll/dfw0;->o()Z

    .line 215
    .line 216
    .line 217
    move-result v10

    .line 218
    const/4 v11, 0x2

    .line 219
    if-eqz v10, :cond_8

    .line 220
    .line 221
    invoke-virtual {v15, v11}, Ll/dfw0;->m(I)V

    .line 222
    .line 223
    .line 224
    const/4 v10, 0x1

    .line 225
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v15}, Ll/dfw0;->o()Z

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    if-eqz v10, :cond_8

    .line 233
    .line 234
    const/16 v10, 0xf

    .line 235
    .line 236
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 252
    .line 253
    .line 254
    const/4 v11, 0x3

    .line 255
    invoke-virtual {v15, v11}, Ll/dfw0;->m(I)V

    .line 256
    .line 257
    .line 258
    const/16 v11, 0xb

    .line 259
    .line 260
    invoke-virtual {v15, v11}, Ll/dfw0;->m(I)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v15, v10}, Ll/dfw0;->m(I)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 270
    .line 271
    .line 272
    const/4 v10, 0x2

    .line 273
    goto :goto_4

    .line 274
    :cond_8
    move v10, v11

    .line 275
    :goto_4
    invoke-virtual {v15, v10}, Ll/dfw0;->d(I)I

    .line 276
    .line 277
    .line 278
    move-result v10

    .line 279
    if-eqz v10, :cond_9

    .line 280
    .line 281
    const-string v10, "Unhandled video object layer shape"

    .line 282
    .line 283
    invoke-static {v13, v10}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    :cond_9
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 287
    .line 288
    .line 289
    const/16 v10, 0x10

    .line 290
    .line 291
    invoke-virtual {v15, v10}, Ll/dfw0;->d(I)I

    .line 292
    .line 293
    .line 294
    move-result v10

    .line 295
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v15}, Ll/dfw0;->o()Z

    .line 299
    .line 300
    .line 301
    move-result v11

    .line 302
    if-eqz v11, :cond_c

    .line 303
    .line 304
    if-nez v10, :cond_a

    .line 305
    .line 306
    const-string v10, "Invalid vop_increment_time_resolution"

    .line 307
    .line 308
    invoke-static {v13, v10}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    goto :goto_6

    .line 312
    :cond_a
    add-int/lit8 v10, v10, -0x1

    .line 313
    .line 314
    const/4 v11, 0x0

    .line 315
    :goto_5
    if-lez v10, :cond_b

    .line 316
    .line 317
    shr-int/lit8 v10, v10, 0x1

    .line 318
    .line 319
    add-int/lit8 v11, v11, 0x1

    .line 320
    .line 321
    goto :goto_5

    .line 322
    :cond_b
    invoke-virtual {v15, v11}, Ll/dfw0;->m(I)V

    .line 323
    .line 324
    .line 325
    :cond_c
    :goto_6
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 326
    .line 327
    .line 328
    const/16 v10, 0xd

    .line 329
    .line 330
    invoke-virtual {v15, v10}, Ll/dfw0;->d(I)I

    .line 331
    .line 332
    .line 333
    move-result v11

    .line 334
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v15, v10}, Ll/dfw0;->d(I)I

    .line 338
    .line 339
    .line 340
    move-result v10

    .line 341
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v15}, Ll/dfw0;->l()V

    .line 345
    .line 346
    .line 347
    new-instance v13, Ll/znr0;

    .line 348
    .line 349
    invoke-direct {v13}, Ll/znr0;-><init>()V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v13, v14}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 353
    .line 354
    .line 355
    const-string v14, "video/mp4v-es"

    .line 356
    .line 357
    invoke-virtual {v13, v14}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v13, v11}, Ll/znr0;->C(I)Ll/znr0;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v13, v10}, Ll/znr0;->i(I)Ll/znr0;

    .line 364
    .line 365
    .line 366
    invoke-virtual {v13, v2}, Ll/znr0;->s(F)Ll/znr0;

    .line 367
    .line 368
    .line 369
    invoke-static {v12}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    invoke-virtual {v13, v2}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v13}, Ll/znr0;->D()Ll/sqr0;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    invoke-interface {v9, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 381
    .line 382
    .line 383
    const/4 v10, 0x1

    .line 384
    iput-boolean v10, v0, Ll/osr0;->j:Z

    .line 385
    .line 386
    goto :goto_7

    .line 387
    :cond_d
    move/from16 v17, v2

    .line 388
    .line 389
    :goto_7
    iget-object v2, v0, Ll/osr0;->f:Ll/nsr0;

    .line 390
    .line 391
    invoke-virtual {v2, v3, v1, v4}, Ll/nsr0;->a([BII)V

    .line 392
    .line 393
    .line 394
    iget-object v2, v0, Ll/osr0;->e:Ll/ysr0;

    .line 395
    .line 396
    if-lez v8, :cond_e

    .line 397
    .line 398
    invoke-virtual {v2, v3, v1, v4}, Ll/ysr0;->a([BII)V

    .line 399
    .line 400
    .line 401
    const/4 v10, 0x0

    .line 402
    goto :goto_8

    .line 403
    :cond_e
    neg-int v10, v8

    .line 404
    :goto_8
    iget-object v1, v0, Ll/osr0;->e:Ll/ysr0;

    .line 405
    .line 406
    invoke-virtual {v1, v10}, Ll/ysr0;->d(I)Z

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    if-eqz v1, :cond_f

    .line 411
    .line 412
    iget-object v1, v0, Ll/osr0;->e:Ll/ysr0;

    .line 413
    .line 414
    iget-object v2, v1, Ll/ysr0;->d:[B

    .line 415
    .line 416
    iget v1, v1, Ll/ysr0;->e:I

    .line 417
    .line 418
    invoke-static {v2, v1}, Ll/w3x0;->b([BI)I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    iget-object v2, v0, Ll/osr0;->b:Ll/bgw0;

    .line 423
    .line 424
    sget v8, Ll/mpw0;->a:I

    .line 425
    .line 426
    iget-object v8, v0, Ll/osr0;->e:Ll/ysr0;

    .line 427
    .line 428
    iget-object v8, v8, Ll/ysr0;->d:[B

    .line 429
    .line 430
    invoke-virtual {v2, v8, v1}, Ll/bgw0;->i([BI)V

    .line 431
    .line 432
    .line 433
    iget-object v1, v0, Ll/osr0;->a:Ll/jur0;

    .line 434
    .line 435
    iget-wide v8, v0, Ll/osr0;->k:J

    .line 436
    .line 437
    iget-object v2, v0, Ll/osr0;->b:Ll/bgw0;

    .line 438
    .line 439
    invoke-virtual {v1, v8, v9, v2}, Ll/jur0;->a(JLl/bgw0;)V

    .line 440
    .line 441
    .line 442
    :cond_f
    const/16 v1, 0xb2

    .line 443
    .line 444
    if-ne v5, v1, :cond_11

    .line 445
    .line 446
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    add-int/lit8 v5, v4, 0x2

    .line 451
    .line 452
    aget-byte v2, v2, v5

    .line 453
    .line 454
    const/4 v10, 0x1

    .line 455
    if-ne v2, v10, :cond_10

    .line 456
    .line 457
    iget-object v2, v0, Ll/osr0;->e:Ll/ysr0;

    .line 458
    .line 459
    invoke-virtual {v2, v1}, Ll/ysr0;->c(I)V

    .line 460
    .line 461
    .line 462
    :cond_10
    move v5, v1

    .line 463
    :cond_11
    sub-int v2, v17, v4

    .line 464
    .line 465
    iget-wide v8, v0, Ll/osr0;->g:J

    .line 466
    .line 467
    int-to-long v10, v2

    .line 468
    sub-long/2addr v8, v10

    .line 469
    iget-object v1, v0, Ll/osr0;->f:Ll/nsr0;

    .line 470
    .line 471
    iget-boolean v4, v0, Ll/osr0;->j:Z

    .line 472
    .line 473
    invoke-virtual {v1, v8, v9, v2, v4}, Ll/nsr0;->b(JIZ)V

    .line 474
    .line 475
    .line 476
    iget-object v1, v0, Ll/osr0;->f:Ll/nsr0;

    .line 477
    .line 478
    iget-wide v8, v0, Ll/osr0;->k:J

    .line 479
    .line 480
    invoke-virtual {v1, v5, v8, v9}, Ll/nsr0;->c(IJ)V

    .line 481
    .line 482
    .line 483
    move v1, v7

    .line 484
    move/from16 v2, v17

    .line 485
    .line 486
    goto/16 :goto_0
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/osr0;->k:J

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
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/osr0;->h:Ljava/lang/String;

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
    iput-object v0, p0, Ll/osr0;->i:Ll/sgr0;

    .line 20
    .line 21
    new-instance v1, Ll/nsr0;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ll/nsr0;-><init>(Ll/sgr0;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/osr0;->f:Ll/nsr0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/osr0;->a:Ll/jur0;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/jur0;->b(Ll/ser0;Ll/gur0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/osr0;->c:[Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/w3x0;->f([Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/osr0;->d:Ll/msr0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/msr0;->b()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/osr0;->f:Ll/nsr0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/nsr0;->d()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/osr0;->e:Ll/ysr0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 21
    .line 22
    .line 23
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    iput-wide v0, p0, Ll/osr0;->g:J

    .line 26
    .line 27
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    iput-wide v0, p0, Ll/osr0;->k:J

    .line 33
    .line 34
    return-void
.end method
