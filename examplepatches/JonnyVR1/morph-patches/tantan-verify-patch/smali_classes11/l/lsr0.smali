.class public final Ll/lsr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# static fields
.field public static final q:[D


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/sgr0;

.field public final c:Ll/jur0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/bgw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ll/ysr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:[Z

.field public final g:Ll/zrr0;

.field public h:J

.field public i:Z

.field public j:Z

.field public k:J

.field public l:J

.field public m:J

.field public n:J

.field public o:Z

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [D

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/lsr0;->q:[D

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 8
        0x4037f9dcb5112287L    # 23.976023976023978
        0x4038000000000000L    # 24.0
        0x4039000000000000L    # 25.0
        0x403df853e2556b28L    # 29.97002997002997
        0x403e000000000000L    # 30.0
        0x4049000000000000L    # 50.0
        0x404df853e2556b28L    # 59.94005994005994
        0x404e000000000000L    # 60.0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, v0}, Ll/lsr0;-><init>(Ll/jur0;)V

    return-void
.end method

.method public constructor <init>(Ll/jur0;)V
    .locals 2
    .param p1    # Ll/jur0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lsr0;->c:Ll/jur0;

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    new-array v0, v0, [Z

    .line 8
    .line 9
    iput-object v0, p0, Ll/lsr0;->f:[Z

    .line 10
    .line 11
    new-instance v0, Ll/zrr0;

    .line 12
    .line 13
    const/16 v1, 0x80

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/zrr0;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/lsr0;->g:Ll/zrr0;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/ysr0;

    .line 23
    .line 24
    const/16 v0, 0xb2

    .line 25
    .line 26
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/lsr0;->e:Ll/ysr0;

    .line 30
    .line 31
    new-instance p1, Ll/bgw0;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 34
    .line 35
    .line 36
    :goto_0
    iput-object p1, p0, Ll/lsr0;->d:Ll/bgw0;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Ll/lsr0;->e:Ll/ysr0;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :goto_1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    iput-wide v0, p0, Ll/lsr0;->l:J

    .line 49
    .line 50
    iput-wide v0, p0, Ll/lsr0;->n:J

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/lsr0;->b:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-boolean v4, p0, Ll/lsr0;->o:Z

    .line 9
    .line 10
    iget-wide v0, p0, Ll/lsr0;->h:J

    .line 11
    .line 12
    iget-wide v2, p0, Ll/lsr0;->m:J

    .line 13
    .line 14
    sub-long/2addr v0, v2

    .line 15
    move-wide v2, v0

    .line 16
    iget-object v1, p0, Ll/lsr0;->b:Ll/sgr0;

    .line 17
    .line 18
    iget-wide p0, p0, Ll/lsr0;->n:J

    .line 19
    .line 20
    long-to-int v5, v2

    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    move-wide v2, p0

    .line 24
    invoke-interface/range {v1 .. v7}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/lsr0;->b:Ll/sgr0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->s()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->t()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->m()[B

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-wide v4, v0, Ll/lsr0;->h:J

    .line 21
    .line 22
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    int-to-long v6, v6

    .line 27
    add-long/2addr v4, v6

    .line 28
    iput-wide v4, v0, Ll/lsr0;->h:J

    .line 29
    .line 30
    iget-object v4, v0, Ll/lsr0;->b:Ll/sgr0;

    .line 31
    .line 32
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    move-object/from16 v6, p1

    .line 37
    .line 38
    invoke-interface {v4, v6, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object v4, v0, Ll/lsr0;->f:[Z

    .line 42
    .line 43
    invoke-static {v3, v1, v2, v4}, Ll/w3x0;->a([BII[Z)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-ne v4, v2, :cond_2

    .line 48
    .line 49
    iget-boolean v4, v0, Ll/lsr0;->j:Z

    .line 50
    .line 51
    if-nez v4, :cond_0

    .line 52
    .line 53
    iget-object v4, v0, Ll/lsr0;->g:Ll/zrr0;

    .line 54
    .line 55
    invoke-virtual {v4, v3, v1, v2}, Ll/zrr0;->a([BII)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object v0, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0, v3, v1, v2}, Ll/ysr0;->a([BII)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void

    .line 66
    :cond_2
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    add-int/lit8 v7, v4, 0x3

    .line 71
    .line 72
    aget-byte v5, v5, v7

    .line 73
    .line 74
    and-int/lit16 v5, v5, 0xff

    .line 75
    .line 76
    sub-int v8, v4, v1

    .line 77
    .line 78
    iget-boolean v9, v0, Ll/lsr0;->j:Z

    .line 79
    .line 80
    if-nez v9, :cond_a

    .line 81
    .line 82
    if-lez v8, :cond_3

    .line 83
    .line 84
    iget-object v9, v0, Ll/lsr0;->g:Ll/zrr0;

    .line 85
    .line 86
    invoke-virtual {v9, v3, v1, v4}, Ll/zrr0;->a([BII)V

    .line 87
    .line 88
    .line 89
    :cond_3
    if-gez v8, :cond_4

    .line 90
    .line 91
    neg-int v9, v8

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    const/4 v9, 0x0

    .line 94
    :goto_1
    iget-object v12, v0, Ll/lsr0;->g:Ll/zrr0;

    .line 95
    .line 96
    invoke-virtual {v12, v5, v9}, Ll/zrr0;->c(II)Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_a

    .line 101
    .line 102
    iget-object v9, v0, Ll/lsr0;->g:Ll/zrr0;

    .line 103
    .line 104
    iget-object v12, v0, Ll/lsr0;->a:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    iget-object v13, v9, Ll/zrr0;->d:[B

    .line 110
    .line 111
    iget v14, v9, Ll/zrr0;->b:I

    .line 112
    .line 113
    invoke-static {v13, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 114
    .line 115
    .line 116
    move-result-object v13

    .line 117
    const/4 v14, 0x4

    .line 118
    aget-byte v15, v13, v14

    .line 119
    .line 120
    and-int/lit16 v15, v15, 0xff

    .line 121
    .line 122
    const/16 v16, 0x5

    .line 123
    .line 124
    aget-byte v10, v13, v16

    .line 125
    .line 126
    and-int/lit16 v11, v10, 0xff

    .line 127
    .line 128
    const/16 v17, 0x6

    .line 129
    .line 130
    move/from16 v18, v14

    .line 131
    .line 132
    aget-byte v14, v13, v17

    .line 133
    .line 134
    and-int/lit16 v14, v14, 0xff

    .line 135
    .line 136
    const/16 v17, 0x7

    .line 137
    .line 138
    move/from16 v19, v2

    .line 139
    .line 140
    aget-byte v2, v13, v17

    .line 141
    .line 142
    and-int/lit16 v2, v2, 0xf0

    .line 143
    .line 144
    and-int/lit8 v10, v10, 0xf

    .line 145
    .line 146
    shl-int/lit8 v15, v15, 0x4

    .line 147
    .line 148
    shr-int/lit8 v11, v11, 0x4

    .line 149
    .line 150
    or-int/2addr v11, v15

    .line 151
    shr-int/lit8 v2, v2, 0x4

    .line 152
    .line 153
    const/16 v15, 0x8

    .line 154
    .line 155
    shl-int/2addr v10, v15

    .line 156
    or-int/2addr v10, v14

    .line 157
    const/4 v14, 0x2

    .line 158
    if-eq v2, v14, :cond_7

    .line 159
    .line 160
    const/4 v14, 0x3

    .line 161
    if-eq v2, v14, :cond_6

    .line 162
    .line 163
    move/from16 v14, v18

    .line 164
    .line 165
    if-eq v2, v14, :cond_5

    .line 166
    .line 167
    const/high16 v2, 0x3f800000    # 1.0f

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_5
    mul-int/lit8 v2, v10, 0x79

    .line 171
    .line 172
    mul-int/lit8 v14, v11, 0x64

    .line 173
    .line 174
    :goto_2
    int-to-float v2, v2

    .line 175
    int-to-float v14, v14

    .line 176
    div-float/2addr v2, v14

    .line 177
    goto :goto_3

    .line 178
    :cond_6
    mul-int/lit8 v2, v10, 0x10

    .line 179
    .line 180
    mul-int/lit8 v14, v11, 0x9

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_7
    mul-int/lit8 v2, v10, 0x4

    .line 184
    .line 185
    mul-int/lit8 v14, v11, 0x3

    .line 186
    .line 187
    goto :goto_2

    .line 188
    :goto_3
    new-instance v14, Ll/znr0;

    .line 189
    .line 190
    invoke-direct {v14}, Ll/znr0;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v14, v12}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 194
    .line 195
    .line 196
    const-string v12, "video/mpeg2"

    .line 197
    .line 198
    invoke-virtual {v14, v12}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v14, v11}, Ll/znr0;->C(I)Ll/znr0;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v14, v10}, Ll/znr0;->i(I)Ll/znr0;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v14, v2}, Ll/znr0;->s(F)Ll/znr0;

    .line 208
    .line 209
    .line 210
    invoke-static {v13}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v14, v2}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v14}, Ll/znr0;->D()Ll/sqr0;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    aget-byte v10, v13, v17

    .line 222
    .line 223
    and-int/lit8 v10, v10, 0xf

    .line 224
    .line 225
    add-int/lit8 v10, v10, -0x1

    .line 226
    .line 227
    const-wide/16 v11, 0x0

    .line 228
    .line 229
    if-ltz v10, :cond_9

    .line 230
    .line 231
    if-ge v10, v15, :cond_9

    .line 232
    .line 233
    sget-object v11, Ll/lsr0;->q:[D

    .line 234
    .line 235
    aget-wide v10, v11, v10

    .line 236
    .line 237
    iget v9, v9, Ll/zrr0;->c:I

    .line 238
    .line 239
    add-int/lit8 v9, v9, 0x9

    .line 240
    .line 241
    aget-byte v9, v13, v9

    .line 242
    .line 243
    and-int/lit8 v12, v9, 0x60

    .line 244
    .line 245
    shr-int/lit8 v12, v12, 0x5

    .line 246
    .line 247
    and-int/lit8 v9, v9, 0x1f

    .line 248
    .line 249
    if-eq v12, v9, :cond_8

    .line 250
    .line 251
    int-to-double v12, v12

    .line 252
    add-int/lit8 v9, v9, 0x1

    .line 253
    .line 254
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 255
    .line 256
    add-double/2addr v12, v14

    .line 257
    int-to-double v14, v9

    .line 258
    div-double/2addr v12, v14

    .line 259
    mul-double/2addr v10, v12

    .line 260
    :cond_8
    const-wide v12, 0x412e848000000000L    # 1000000.0

    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    div-double/2addr v12, v10

    .line 266
    double-to-long v11, v12

    .line 267
    :cond_9
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 268
    .line 269
    .line 270
    move-result-object v9

    .line 271
    invoke-static {v2, v9}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    iget-object v9, v0, Ll/lsr0;->b:Ll/sgr0;

    .line 276
    .line 277
    iget-object v10, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 278
    .line 279
    check-cast v10, Ll/sqr0;

    .line 280
    .line 281
    invoke-interface {v9, v10}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 282
    .line 283
    .line 284
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 285
    .line 286
    check-cast v2, Ljava/lang/Long;

    .line 287
    .line 288
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 289
    .line 290
    .line 291
    move-result-wide v9

    .line 292
    iput-wide v9, v0, Ll/lsr0;->k:J

    .line 293
    .line 294
    const/4 v2, 0x1

    .line 295
    iput-boolean v2, v0, Ll/lsr0;->j:Z

    .line 296
    .line 297
    goto :goto_4

    .line 298
    :cond_a
    move/from16 v19, v2

    .line 299
    .line 300
    :goto_4
    iget-object v2, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 301
    .line 302
    if-eqz v2, :cond_e

    .line 303
    .line 304
    if-lez v8, :cond_b

    .line 305
    .line 306
    invoke-virtual {v2, v3, v1, v4}, Ll/ysr0;->a([BII)V

    .line 307
    .line 308
    .line 309
    const/4 v1, 0x0

    .line 310
    goto :goto_5

    .line 311
    :cond_b
    neg-int v1, v8

    .line 312
    :goto_5
    iget-object v2, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 313
    .line 314
    invoke-virtual {v2, v1}, Ll/ysr0;->d(I)Z

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    if-eqz v1, :cond_c

    .line 319
    .line 320
    iget-object v1, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 321
    .line 322
    iget-object v2, v1, Ll/ysr0;->d:[B

    .line 323
    .line 324
    iget v1, v1, Ll/ysr0;->e:I

    .line 325
    .line 326
    invoke-static {v2, v1}, Ll/w3x0;->b([BI)I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    iget-object v2, v0, Ll/lsr0;->d:Ll/bgw0;

    .line 331
    .line 332
    sget v8, Ll/mpw0;->a:I

    .line 333
    .line 334
    iget-object v8, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 335
    .line 336
    iget-object v8, v8, Ll/ysr0;->d:[B

    .line 337
    .line 338
    invoke-virtual {v2, v8, v1}, Ll/bgw0;->i([BI)V

    .line 339
    .line 340
    .line 341
    iget-object v1, v0, Ll/lsr0;->c:Ll/jur0;

    .line 342
    .line 343
    iget-wide v8, v0, Ll/lsr0;->n:J

    .line 344
    .line 345
    iget-object v2, v0, Ll/lsr0;->d:Ll/bgw0;

    .line 346
    .line 347
    invoke-virtual {v1, v8, v9, v2}, Ll/jur0;->a(JLl/bgw0;)V

    .line 348
    .line 349
    .line 350
    :cond_c
    const/16 v1, 0xb2

    .line 351
    .line 352
    if-ne v5, v1, :cond_e

    .line 353
    .line 354
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    add-int/lit8 v5, v4, 0x2

    .line 359
    .line 360
    aget-byte v2, v2, v5

    .line 361
    .line 362
    const/4 v5, 0x1

    .line 363
    if-ne v2, v5, :cond_d

    .line 364
    .line 365
    iget-object v2, v0, Ll/lsr0;->e:Ll/ysr0;

    .line 366
    .line 367
    invoke-virtual {v2, v1}, Ll/ysr0;->c(I)V

    .line 368
    .line 369
    .line 370
    :cond_d
    move v5, v1

    .line 371
    :cond_e
    if-eqz v5, :cond_10

    .line 372
    .line 373
    const/16 v1, 0xb3

    .line 374
    .line 375
    if-ne v5, v1, :cond_f

    .line 376
    .line 377
    goto :goto_6

    .line 378
    :cond_f
    const/16 v1, 0xb8

    .line 379
    .line 380
    if-ne v5, v1, :cond_18

    .line 381
    .line 382
    const/4 v2, 0x1

    .line 383
    iput-boolean v2, v0, Ll/lsr0;->o:Z

    .line 384
    .line 385
    goto/16 :goto_c

    .line 386
    .line 387
    :cond_10
    :goto_6
    sub-int v13, v19, v4

    .line 388
    .line 389
    iget-boolean v1, v0, Ll/lsr0;->p:Z

    .line 390
    .line 391
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    if-eqz v1, :cond_11

    .line 397
    .line 398
    iget-boolean v1, v0, Ll/lsr0;->j:Z

    .line 399
    .line 400
    if-eqz v1, :cond_11

    .line 401
    .line 402
    move-wide v1, v8

    .line 403
    iget-wide v9, v0, Ll/lsr0;->n:J

    .line 404
    .line 405
    cmp-long v4, v9, v1

    .line 406
    .line 407
    if-eqz v4, :cond_12

    .line 408
    .line 409
    iget-boolean v11, v0, Ll/lsr0;->o:Z

    .line 410
    .line 411
    iget-wide v14, v0, Ll/lsr0;->h:J

    .line 412
    .line 413
    iget-wide v1, v0, Ll/lsr0;->m:J

    .line 414
    .line 415
    sub-long/2addr v14, v1

    .line 416
    long-to-int v1, v14

    .line 417
    sub-int v12, v1, v13

    .line 418
    .line 419
    iget-object v8, v0, Ll/lsr0;->b:Ll/sgr0;

    .line 420
    .line 421
    const/4 v14, 0x0

    .line 422
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    invoke-interface/range {v8 .. v14}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 428
    .line 429
    .line 430
    goto :goto_7

    .line 431
    :cond_11
    move-wide v1, v8

    .line 432
    :cond_12
    :goto_7
    iget-boolean v4, v0, Ll/lsr0;->i:Z

    .line 433
    .line 434
    if-eqz v4, :cond_14

    .line 435
    .line 436
    iget-boolean v4, v0, Ll/lsr0;->p:Z

    .line 437
    .line 438
    if-eqz v4, :cond_13

    .line 439
    .line 440
    goto :goto_8

    .line 441
    :cond_13
    const/4 v2, 0x1

    .line 442
    const/4 v4, 0x0

    .line 443
    goto :goto_a

    .line 444
    :cond_14
    :goto_8
    iget-wide v8, v0, Ll/lsr0;->h:J

    .line 445
    .line 446
    int-to-long v10, v13

    .line 447
    sub-long/2addr v8, v10

    .line 448
    iput-wide v8, v0, Ll/lsr0;->m:J

    .line 449
    .line 450
    iget-wide v8, v0, Ll/lsr0;->l:J

    .line 451
    .line 452
    cmp-long v4, v8, v1

    .line 453
    .line 454
    if-eqz v4, :cond_15

    .line 455
    .line 456
    goto :goto_9

    .line 457
    :cond_15
    iget-wide v8, v0, Ll/lsr0;->n:J

    .line 458
    .line 459
    cmp-long v4, v8, v1

    .line 460
    .line 461
    if-eqz v4, :cond_16

    .line 462
    .line 463
    iget-wide v10, v0, Ll/lsr0;->k:J

    .line 464
    .line 465
    add-long/2addr v8, v10

    .line 466
    goto :goto_9

    .line 467
    :cond_16
    move-wide v8, v1

    .line 468
    :goto_9
    iput-wide v8, v0, Ll/lsr0;->n:J

    .line 469
    .line 470
    const/4 v4, 0x0

    .line 471
    iput-boolean v4, v0, Ll/lsr0;->o:Z

    .line 472
    .line 473
    iput-wide v1, v0, Ll/lsr0;->l:J

    .line 474
    .line 475
    const/4 v2, 0x1

    .line 476
    iput-boolean v2, v0, Ll/lsr0;->i:Z

    .line 477
    .line 478
    :goto_a
    if-nez v5, :cond_17

    .line 479
    .line 480
    move v10, v2

    .line 481
    goto :goto_b

    .line 482
    :cond_17
    move v10, v4

    .line 483
    :goto_b
    iput-boolean v10, v0, Ll/lsr0;->p:Z

    .line 484
    .line 485
    :cond_18
    :goto_c
    move v1, v7

    .line 486
    move/from16 v2, v19

    .line 487
    .line 488
    goto/16 :goto_0
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lsr0;->l:J

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
    iput-object v0, p0, Ll/lsr0;->a:Ljava/lang/String;

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
    iput-object v0, p0, Ll/lsr0;->b:Ll/sgr0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/lsr0;->c:Ll/jur0;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/jur0;->b(Ll/ser0;Ll/gur0;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lsr0;->f:[Z

    .line 2
    .line 3
    invoke-static {v0}, Ll/w3x0;->f([Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/lsr0;->g:Ll/zrr0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/zrr0;->b()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/lsr0;->e:Ll/ysr0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Ll/lsr0;->h:J

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/lsr0;->i:Z

    .line 24
    .line 25
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    iput-wide v0, p0, Ll/lsr0;->l:J

    .line 31
    .line 32
    iput-wide v0, p0, Ll/lsr0;->n:J

    .line 33
    .line 34
    return-void
.end method
