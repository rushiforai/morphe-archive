.class public final Ll/usr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ll/ktr0;

.field public b:Ljava/lang/String;

.field public c:Ll/sgr0;

.field public d:Ll/tsr0;

.field public e:Z

.field public final f:[Z

.field public final g:Ll/ysr0;

.field public final h:Ll/ysr0;

.field public final i:Ll/ysr0;

.field public final j:Ll/ysr0;

.field public final k:Ll/ysr0;

.field public l:J

.field public m:J

.field public final n:Ll/bgw0;


# direct methods
.method public constructor <init>(Ll/ktr0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/usr0;->a:Ll/ktr0;

    .line 5
    .line 6
    const/4 p1, 0x3

    .line 7
    new-array p1, p1, [Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/usr0;->f:[Z

    .line 10
    .line 11
    new-instance p1, Ll/ysr0;

    .line 12
    .line 13
    const/16 v0, 0x20

    .line 14
    .line 15
    const/16 v1, 0x80

    .line 16
    .line 17
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/usr0;->g:Ll/ysr0;

    .line 21
    .line 22
    new-instance p1, Ll/ysr0;

    .line 23
    .line 24
    const/16 v0, 0x21

    .line 25
    .line 26
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/usr0;->h:Ll/ysr0;

    .line 30
    .line 31
    new-instance p1, Ll/ysr0;

    .line 32
    .line 33
    const/16 v0, 0x22

    .line 34
    .line 35
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/usr0;->i:Ll/ysr0;

    .line 39
    .line 40
    new-instance p1, Ll/ysr0;

    .line 41
    .line 42
    const/16 v0, 0x27

    .line 43
    .line 44
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/usr0;->j:Ll/ysr0;

    .line 48
    .line 49
    new-instance p1, Ll/ysr0;

    .line 50
    .line 51
    const/16 v0, 0x28

    .line 52
    .line 53
    invoke-direct {p1, v0, v1}, Ll/ysr0;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/usr0;->k:Ll/ysr0;

    .line 57
    .line 58
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    iput-wide v0, p0, Ll/usr0;->m:J

    .line 64
    .line 65
    new-instance p1, Ll/bgw0;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Ll/usr0;->n:Ll/bgw0;

    .line 71
    .line 72
    return-void
.end method

.method private final e([BII)V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/usr0;->d:Ll/tsr0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/tsr0;->c([BII)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Ll/usr0;->e:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/usr0;->g:Ll/ysr0;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/usr0;->h:Ll/ysr0;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/usr0;->i:Ll/ysr0;

    .line 21
    .line 22
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/usr0;->j:Ll/ysr0;

    .line 26
    .line 27
    invoke-virtual {v0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/usr0;->k:Ll/ysr0;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, p3}, Ll/ysr0;->a([BII)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/usr0;->c:Ll/sgr0;

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
    iget-object p1, p0, Ll/usr0;->d:Ll/tsr0;

    .line 11
    .line 12
    iget-wide v0, p0, Ll/usr0;->l:J

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Ll/tsr0;->a(J)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/usr0;->c:Ll/sgr0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    sget v1, Ll/mpw0;->a:I

    .line 9
    .line 10
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-lez v1, :cond_8

    .line 15
    .line 16
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->s()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->t()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->m()[B

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-wide v4, v0, Ll/usr0;->l:J

    .line 29
    .line 30
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    int-to-long v6, v6

    .line 35
    add-long/2addr v4, v6

    .line 36
    iput-wide v4, v0, Ll/usr0;->l:J

    .line 37
    .line 38
    iget-object v4, v0, Ll/usr0;->c:Ll/sgr0;

    .line 39
    .line 40
    invoke-virtual/range {p1 .. p1}, Ll/bgw0;->q()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    move-object/from16 v6, p1

    .line 45
    .line 46
    invoke-interface {v4, v6, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    if-ge v1, v2, :cond_0

    .line 50
    .line 51
    iget-object v4, v0, Ll/usr0;->f:[Z

    .line 52
    .line 53
    invoke-static {v3, v1, v2, v4}, Ll/w3x0;->a([BII[Z)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eq v4, v2, :cond_7

    .line 58
    .line 59
    add-int/lit8 v5, v4, 0x3

    .line 60
    .line 61
    aget-byte v7, v3, v5

    .line 62
    .line 63
    and-int/lit8 v7, v7, 0x7e

    .line 64
    .line 65
    sub-int v8, v4, v1

    .line 66
    .line 67
    if-lez v8, :cond_1

    .line 68
    .line 69
    invoke-direct {v0, v3, v1, v4}, Ll/usr0;->e([BII)V

    .line 70
    .line 71
    .line 72
    :cond_1
    sub-int v12, v2, v4

    .line 73
    .line 74
    iget-wide v9, v0, Ll/usr0;->l:J

    .line 75
    .line 76
    int-to-long v13, v12

    .line 77
    sub-long v10, v9, v13

    .line 78
    .line 79
    if-gez v8, :cond_2

    .line 80
    .line 81
    neg-int v4, v8

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    const/4 v4, 0x0

    .line 84
    :goto_1
    iget-wide v8, v0, Ll/usr0;->m:J

    .line 85
    .line 86
    iget-object v13, v0, Ll/usr0;->d:Ll/tsr0;

    .line 87
    .line 88
    iget-boolean v14, v0, Ll/usr0;->e:Z

    .line 89
    .line 90
    invoke-virtual {v13, v10, v11, v12, v14}, Ll/tsr0;->b(JIZ)V

    .line 91
    .line 92
    .line 93
    iget-boolean v13, v0, Ll/usr0;->e:Z

    .line 94
    .line 95
    if-nez v13, :cond_3

    .line 96
    .line 97
    iget-object v13, v0, Ll/usr0;->g:Ll/ysr0;

    .line 98
    .line 99
    invoke-virtual {v13, v4}, Ll/ysr0;->d(I)Z

    .line 100
    .line 101
    .line 102
    iget-object v13, v0, Ll/usr0;->h:Ll/ysr0;

    .line 103
    .line 104
    invoke-virtual {v13, v4}, Ll/ysr0;->d(I)Z

    .line 105
    .line 106
    .line 107
    iget-object v13, v0, Ll/usr0;->i:Ll/ysr0;

    .line 108
    .line 109
    invoke-virtual {v13, v4}, Ll/ysr0;->d(I)Z

    .line 110
    .line 111
    .line 112
    iget-object v13, v0, Ll/usr0;->g:Ll/ysr0;

    .line 113
    .line 114
    invoke-virtual {v13}, Ll/ysr0;->e()Z

    .line 115
    .line 116
    .line 117
    move-result v16

    .line 118
    if-eqz v16, :cond_3

    .line 119
    .line 120
    iget-object v14, v0, Ll/usr0;->h:Ll/ysr0;

    .line 121
    .line 122
    invoke-virtual {v14}, Ll/ysr0;->e()Z

    .line 123
    .line 124
    .line 125
    move-result v17

    .line 126
    if-eqz v17, :cond_3

    .line 127
    .line 128
    iget-object v15, v0, Ll/usr0;->i:Ll/ysr0;

    .line 129
    .line 130
    invoke-virtual {v15}, Ll/ysr0;->e()Z

    .line 131
    .line 132
    .line 133
    move-result v18

    .line 134
    if-eqz v18, :cond_3

    .line 135
    .line 136
    iget-object v1, v0, Ll/usr0;->c:Ll/sgr0;

    .line 137
    .line 138
    move/from16 v19, v5

    .line 139
    .line 140
    iget-object v5, v0, Ll/usr0;->b:Ljava/lang/String;

    .line 141
    .line 142
    iget v6, v13, Ll/ysr0;->e:I

    .line 143
    .line 144
    move/from16 v20, v7

    .line 145
    .line 146
    iget v7, v14, Ll/ysr0;->e:I

    .line 147
    .line 148
    add-int/2addr v7, v6

    .line 149
    move/from16 v21, v7

    .line 150
    .line 151
    iget v7, v15, Ll/ysr0;->e:I

    .line 152
    .line 153
    add-int v7, v21, v7

    .line 154
    .line 155
    new-array v7, v7, [B

    .line 156
    .line 157
    move-wide/from16 v21, v10

    .line 158
    .line 159
    iget-object v10, v13, Ll/ysr0;->d:[B

    .line 160
    .line 161
    const/4 v11, 0x0

    .line 162
    invoke-static {v10, v11, v7, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 163
    .line 164
    .line 165
    iget-object v6, v14, Ll/ysr0;->d:[B

    .line 166
    .line 167
    iget v10, v13, Ll/ysr0;->e:I

    .line 168
    .line 169
    move/from16 v18, v12

    .line 170
    .line 171
    iget v12, v14, Ll/ysr0;->e:I

    .line 172
    .line 173
    invoke-static {v6, v11, v7, v10, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    .line 175
    .line 176
    iget-object v6, v15, Ll/ysr0;->d:[B

    .line 177
    .line 178
    iget v10, v13, Ll/ysr0;->e:I

    .line 179
    .line 180
    iget v12, v14, Ll/ysr0;->e:I

    .line 181
    .line 182
    add-int/2addr v10, v12

    .line 183
    iget v12, v15, Ll/ysr0;->e:I

    .line 184
    .line 185
    invoke-static {v6, v11, v7, v10, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    .line 187
    .line 188
    iget-object v6, v14, Ll/ysr0;->d:[B

    .line 189
    .line 190
    iget v10, v14, Ll/ysr0;->e:I

    .line 191
    .line 192
    const/4 v11, 0x5

    .line 193
    invoke-static {v6, v11, v10}, Ll/w3x0;->c([BII)Ll/f0x0;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    iget v10, v6, Ll/f0x0;->a:I

    .line 198
    .line 199
    iget-boolean v11, v6, Ll/f0x0;->b:Z

    .line 200
    .line 201
    iget v12, v6, Ll/f0x0;->c:I

    .line 202
    .line 203
    iget v13, v6, Ll/f0x0;->d:I

    .line 204
    .line 205
    iget-object v14, v6, Ll/f0x0;->g:[I

    .line 206
    .line 207
    iget v15, v6, Ll/f0x0;->h:I

    .line 208
    .line 209
    move/from16 v23, v10

    .line 210
    .line 211
    move/from16 v24, v11

    .line 212
    .line 213
    move/from16 v25, v12

    .line 214
    .line 215
    move/from16 v26, v13

    .line 216
    .line 217
    move-object/from16 v27, v14

    .line 218
    .line 219
    move/from16 v28, v15

    .line 220
    .line 221
    invoke-static/range {v23 .. v28}, Ll/rgv0;->b(IZII[II)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v10

    .line 225
    new-instance v11, Ll/znr0;

    .line 226
    .line 227
    invoke-direct {v11}, Ll/znr0;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v11, v5}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 231
    .line 232
    .line 233
    const-string v5, "video/hevc"

    .line 234
    .line 235
    invoke-virtual {v11, v5}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v11, v10}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 239
    .line 240
    .line 241
    iget v5, v6, Ll/f0x0;->i:I

    .line 242
    .line 243
    invoke-virtual {v11, v5}, Ll/znr0;->C(I)Ll/znr0;

    .line 244
    .line 245
    .line 246
    iget v5, v6, Ll/f0x0;->j:I

    .line 247
    .line 248
    invoke-virtual {v11, v5}, Ll/znr0;->i(I)Ll/znr0;

    .line 249
    .line 250
    .line 251
    new-instance v5, Ll/dty0;

    .line 252
    .line 253
    invoke-direct {v5}, Ll/dty0;-><init>()V

    .line 254
    .line 255
    .line 256
    iget v10, v6, Ll/f0x0;->l:I

    .line 257
    .line 258
    invoke-virtual {v5, v10}, Ll/dty0;->c(I)Ll/dty0;

    .line 259
    .line 260
    .line 261
    iget v10, v6, Ll/f0x0;->m:I

    .line 262
    .line 263
    invoke-virtual {v5, v10}, Ll/dty0;->b(I)Ll/dty0;

    .line 264
    .line 265
    .line 266
    iget v10, v6, Ll/f0x0;->n:I

    .line 267
    .line 268
    invoke-virtual {v5, v10}, Ll/dty0;->d(I)Ll/dty0;

    .line 269
    .line 270
    .line 271
    iget v10, v6, Ll/f0x0;->e:I

    .line 272
    .line 273
    add-int/lit8 v10, v10, 0x8

    .line 274
    .line 275
    invoke-virtual {v5, v10}, Ll/dty0;->f(I)Ll/dty0;

    .line 276
    .line 277
    .line 278
    iget v10, v6, Ll/f0x0;->f:I

    .line 279
    .line 280
    add-int/lit8 v10, v10, 0x8

    .line 281
    .line 282
    invoke-virtual {v5, v10}, Ll/dty0;->a(I)Ll/dty0;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5}, Ll/dty0;->g()Ll/wwy0;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-virtual {v11, v5}, Ll/znr0;->a(Ll/wwy0;)Ll/znr0;

    .line 290
    .line 291
    .line 292
    iget v5, v6, Ll/f0x0;->k:F

    .line 293
    .line 294
    invoke-virtual {v11, v5}, Ll/znr0;->s(F)Ll/znr0;

    .line 295
    .line 296
    .line 297
    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    invoke-virtual {v11, v5}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v11}, Ll/znr0;->D()Ll/sqr0;

    .line 305
    .line 306
    .line 307
    move-result-object v5

    .line 308
    invoke-interface {v1, v5}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 309
    .line 310
    .line 311
    const/4 v1, 0x1

    .line 312
    iput-boolean v1, v0, Ll/usr0;->e:Z

    .line 313
    .line 314
    goto :goto_2

    .line 315
    :cond_3
    move/from16 v19, v5

    .line 316
    .line 317
    move/from16 v20, v7

    .line 318
    .line 319
    move-wide/from16 v21, v10

    .line 320
    .line 321
    move/from16 v18, v12

    .line 322
    .line 323
    :goto_2
    iget-object v1, v0, Ll/usr0;->j:Ll/ysr0;

    .line 324
    .line 325
    invoke-virtual {v1, v4}, Ll/ysr0;->d(I)Z

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    if-eqz v1, :cond_4

    .line 330
    .line 331
    iget-object v1, v0, Ll/usr0;->j:Ll/ysr0;

    .line 332
    .line 333
    iget-object v5, v1, Ll/ysr0;->d:[B

    .line 334
    .line 335
    iget v1, v1, Ll/ysr0;->e:I

    .line 336
    .line 337
    invoke-static {v5, v1}, Ll/w3x0;->b([BI)I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    iget-object v5, v0, Ll/usr0;->n:Ll/bgw0;

    .line 342
    .line 343
    iget-object v6, v0, Ll/usr0;->j:Ll/ysr0;

    .line 344
    .line 345
    iget-object v6, v6, Ll/ysr0;->d:[B

    .line 346
    .line 347
    invoke-virtual {v5, v6, v1}, Ll/bgw0;->i([BI)V

    .line 348
    .line 349
    .line 350
    iget-object v1, v0, Ll/usr0;->n:Ll/bgw0;

    .line 351
    .line 352
    const/4 v11, 0x5

    .line 353
    invoke-virtual {v1, v11}, Ll/bgw0;->l(I)V

    .line 354
    .line 355
    .line 356
    iget-object v1, v0, Ll/usr0;->a:Ll/ktr0;

    .line 357
    .line 358
    iget-object v5, v0, Ll/usr0;->n:Ll/bgw0;

    .line 359
    .line 360
    invoke-virtual {v1, v8, v9, v5}, Ll/ktr0;->a(JLl/bgw0;)V

    .line 361
    .line 362
    .line 363
    :cond_4
    iget-object v1, v0, Ll/usr0;->k:Ll/ysr0;

    .line 364
    .line 365
    invoke-virtual {v1, v4}, Ll/ysr0;->d(I)Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    if-eqz v1, :cond_5

    .line 370
    .line 371
    iget-object v1, v0, Ll/usr0;->k:Ll/ysr0;

    .line 372
    .line 373
    iget-object v4, v1, Ll/ysr0;->d:[B

    .line 374
    .line 375
    iget v1, v1, Ll/ysr0;->e:I

    .line 376
    .line 377
    invoke-static {v4, v1}, Ll/w3x0;->b([BI)I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    iget-object v4, v0, Ll/usr0;->n:Ll/bgw0;

    .line 382
    .line 383
    iget-object v5, v0, Ll/usr0;->k:Ll/ysr0;

    .line 384
    .line 385
    iget-object v5, v5, Ll/ysr0;->d:[B

    .line 386
    .line 387
    invoke-virtual {v4, v5, v1}, Ll/bgw0;->i([BI)V

    .line 388
    .line 389
    .line 390
    iget-object v1, v0, Ll/usr0;->n:Ll/bgw0;

    .line 391
    .line 392
    const/4 v11, 0x5

    .line 393
    invoke-virtual {v1, v11}, Ll/bgw0;->l(I)V

    .line 394
    .line 395
    .line 396
    iget-object v1, v0, Ll/usr0;->a:Ll/ktr0;

    .line 397
    .line 398
    iget-object v4, v0, Ll/usr0;->n:Ll/bgw0;

    .line 399
    .line 400
    invoke-virtual {v1, v8, v9, v4}, Ll/ktr0;->a(JLl/bgw0;)V

    .line 401
    .line 402
    .line 403
    :cond_5
    const/16 v16, 0x1

    .line 404
    .line 405
    shr-int/lit8 v13, v20, 0x1

    .line 406
    .line 407
    iget-wide v14, v0, Ll/usr0;->m:J

    .line 408
    .line 409
    iget-object v9, v0, Ll/usr0;->d:Ll/tsr0;

    .line 410
    .line 411
    iget-boolean v1, v0, Ll/usr0;->e:Z

    .line 412
    .line 413
    move/from16 v16, v1

    .line 414
    .line 415
    move/from16 v12, v18

    .line 416
    .line 417
    move-wide/from16 v10, v21

    .line 418
    .line 419
    invoke-virtual/range {v9 .. v16}, Ll/tsr0;->e(JIIJZ)V

    .line 420
    .line 421
    .line 422
    iget-boolean v1, v0, Ll/usr0;->e:Z

    .line 423
    .line 424
    if-nez v1, :cond_6

    .line 425
    .line 426
    iget-object v1, v0, Ll/usr0;->g:Ll/ysr0;

    .line 427
    .line 428
    invoke-virtual {v1, v13}, Ll/ysr0;->c(I)V

    .line 429
    .line 430
    .line 431
    iget-object v1, v0, Ll/usr0;->h:Ll/ysr0;

    .line 432
    .line 433
    invoke-virtual {v1, v13}, Ll/ysr0;->c(I)V

    .line 434
    .line 435
    .line 436
    iget-object v1, v0, Ll/usr0;->i:Ll/ysr0;

    .line 437
    .line 438
    invoke-virtual {v1, v13}, Ll/ysr0;->c(I)V

    .line 439
    .line 440
    .line 441
    :cond_6
    iget-object v1, v0, Ll/usr0;->j:Ll/ysr0;

    .line 442
    .line 443
    invoke-virtual {v1, v13}, Ll/ysr0;->c(I)V

    .line 444
    .line 445
    .line 446
    iget-object v1, v0, Ll/usr0;->k:Ll/ysr0;

    .line 447
    .line 448
    invoke-virtual {v1, v13}, Ll/ysr0;->c(I)V

    .line 449
    .line 450
    .line 451
    move-object/from16 v6, p1

    .line 452
    .line 453
    move/from16 v1, v19

    .line 454
    .line 455
    goto/16 :goto_0

    .line 456
    .line 457
    :cond_7
    invoke-direct {v0, v3, v1, v2}, Ll/usr0;->e([BII)V

    .line 458
    .line 459
    .line 460
    :cond_8
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/usr0;->m:J

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
    iput-object v0, p0, Ll/usr0;->b:Ljava/lang/String;

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
    iput-object v0, p0, Ll/usr0;->c:Ll/sgr0;

    .line 20
    .line 21
    new-instance v1, Ll/tsr0;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ll/tsr0;-><init>(Ll/sgr0;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/usr0;->d:Ll/tsr0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/usr0;->a:Ll/ktr0;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/ktr0;->b(Ll/ser0;Ll/gur0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/usr0;->l:J

    .line 4
    .line 5
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/usr0;->m:J

    .line 11
    .line 12
    iget-object v0, p0, Ll/usr0;->f:[Z

    .line 13
    .line 14
    invoke-static {v0}, Ll/w3x0;->f([Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/usr0;->g:Ll/ysr0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/usr0;->h:Ll/ysr0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/usr0;->i:Ll/ysr0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/usr0;->j:Ll/ysr0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/usr0;->k:Ll/ysr0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ysr0;->b()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/usr0;->d:Ll/tsr0;

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/tsr0;->d()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
