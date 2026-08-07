.class public final Ll/urr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# static fields
.field public static final v:[B


# instance fields
.field public final a:Z

.field public final b:Ll/dfw0;

.field public final c:Ll/bgw0;

.field public final d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public f:Ll/sgr0;

.field public g:Ll/sgr0;

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:J

.field public r:I

.field public s:J

.field public t:Ll/sgr0;

.field public u:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/urr0;->v:[B

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 1
        0x49t
        0x44t
        0x33t
    .end array-data
.end method

.method public constructor <init>(ZLjava/lang/String;)V
    .locals 3
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dfw0;

    .line 5
    .line 6
    const/4 v1, 0x7

    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Ll/dfw0;-><init>([BI)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/urr0;->b:Ll/dfw0;

    .line 13
    .line 14
    new-instance v0, Ll/bgw0;

    .line 15
    .line 16
    sget-object v1, Ll/urr0;->v:[B

    .line 17
    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Ll/bgw0;-><init>([B)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/urr0;->c:Ll/bgw0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/urr0;->g()V

    .line 30
    .line 31
    .line 32
    const/4 v0, -0x1

    .line 33
    iput v0, p0, Ll/urr0;->m:I

    .line 34
    .line 35
    iput v0, p0, Ll/urr0;->n:I

    .line 36
    .line 37
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    iput-wide v0, p0, Ll/urr0;->q:J

    .line 43
    .line 44
    iput-wide v0, p0, Ll/urr0;->s:J

    .line 45
    .line 46
    iput-boolean p1, p0, Ll/urr0;->a:Z

    .line 47
    .line 48
    iput-object p2, p0, Ll/urr0;->d:Ljava/lang/String;

    .line 49
    .line 50
    return-void
.end method

.method public static e(I)Z
    .locals 1

    .line 1
    const v0, 0xfff6

    .line 2
    .line 3
    .line 4
    and-int/2addr p0, v0

    .line 5
    const v0, 0xfff0

    .line 6
    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static final k(BB)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0xff

    .line 2
    .line 3
    const p1, 0xff00

    .line 4
    .line 5
    .line 6
    or-int/2addr p0, p1

    .line 7
    invoke-static {p0}, Ll/urr0;->e(I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static final l(Ll/bgw0;[BI)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-ge v0, p2, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, p1, v1, p2}, Ll/bgw0;->g([BII)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    iget-object v1, v0, Ll/urr0;->f:Ll/sgr0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget v1, Ll/mpw0;->a:I

    .line 11
    .line 12
    :cond_0
    :goto_0
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_1d

    .line 17
    .line 18
    iget v1, v0, Ll/urr0;->h:I

    .line 19
    .line 20
    const/16 v2, 0xd

    .line 21
    .line 22
    const/4 v3, 0x7

    .line 23
    const/4 v4, 0x4

    .line 24
    const/4 v5, 0x3

    .line 25
    const/4 v7, -0x1

    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v9, 0x2

    .line 28
    const/4 v10, 0x1

    .line 29
    if-eqz v1, :cond_b

    .line 30
    .line 31
    if-eq v1, v10, :cond_8

    .line 32
    .line 33
    const/16 v7, 0xa

    .line 34
    .line 35
    if-eq v1, v9, :cond_7

    .line 36
    .line 37
    if-eq v1, v5, :cond_2

    .line 38
    .line 39
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget v2, v0, Ll/urr0;->r:I

    .line 44
    .line 45
    iget v3, v0, Ll/urr0;->i:I

    .line 46
    .line 47
    sub-int/2addr v2, v3

    .line 48
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object v2, v0, Ll/urr0;->t:Ll/sgr0;

    .line 53
    .line 54
    invoke-interface {v2, v6, v1}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 55
    .line 56
    .line 57
    iget v2, v0, Ll/urr0;->i:I

    .line 58
    .line 59
    add-int/2addr v2, v1

    .line 60
    iput v2, v0, Ll/urr0;->i:I

    .line 61
    .line 62
    iget v1, v0, Ll/urr0;->r:I

    .line 63
    .line 64
    if-ne v2, v1, :cond_0

    .line 65
    .line 66
    iget-wide v1, v0, Ll/urr0;->s:J

    .line 67
    .line 68
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    cmp-long v1, v1, v3

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    move v8, v10

    .line 78
    :cond_1
    invoke-static {v8}, Ll/lev0;->f(Z)V

    .line 79
    .line 80
    .line 81
    iget-object v9, v0, Ll/urr0;->t:Ll/sgr0;

    .line 82
    .line 83
    iget-wide v10, v0, Ll/urr0;->s:J

    .line 84
    .line 85
    iget v13, v0, Ll/urr0;->r:I

    .line 86
    .line 87
    const/4 v14, 0x0

    .line 88
    const/4 v15, 0x0

    .line 89
    const/4 v12, 0x1

    .line 90
    invoke-interface/range {v9 .. v15}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 91
    .line 92
    .line 93
    iget-wide v1, v0, Ll/urr0;->s:J

    .line 94
    .line 95
    iget-wide v3, v0, Ll/urr0;->u:J

    .line 96
    .line 97
    add-long/2addr v1, v3

    .line 98
    iput-wide v1, v0, Ll/urr0;->s:J

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/urr0;->g()V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    iget-boolean v1, v0, Ll/urr0;->k:Z

    .line 105
    .line 106
    const/4 v11, 0x5

    .line 107
    if-eq v10, v1, :cond_3

    .line 108
    .line 109
    move v1, v11

    .line 110
    goto :goto_1

    .line 111
    :cond_3
    move v1, v3

    .line 112
    :goto_1
    iget-object v12, v0, Ll/urr0;->b:Ll/dfw0;

    .line 113
    .line 114
    iget-object v12, v12, Ll/dfw0;->a:[B

    .line 115
    .line 116
    invoke-virtual {v0, v6, v12, v1}, Ll/urr0;->j(Ll/bgw0;[BI)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_0

    .line 121
    .line 122
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 123
    .line 124
    invoke-virtual {v1, v8}, Ll/dfw0;->k(I)V

    .line 125
    .line 126
    .line 127
    iget-boolean v1, v0, Ll/urr0;->p:Z

    .line 128
    .line 129
    iget-object v12, v0, Ll/urr0;->b:Ll/dfw0;

    .line 130
    .line 131
    if-nez v1, :cond_5

    .line 132
    .line 133
    invoke-virtual {v12, v9}, Ll/dfw0;->d(I)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    add-int/2addr v1, v10

    .line 138
    if-eq v1, v9, :cond_4

    .line 139
    .line 140
    new-instance v7, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v12, "Detected audio object type: "

    .line 143
    .line 144
    invoke-direct {v7, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v1, ", but assuming AAC LC."

    .line 151
    .line 152
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v7, "AdtsReader"

    .line 160
    .line 161
    invoke-static {v7, v1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_4
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 165
    .line 166
    invoke-virtual {v1, v11}, Ll/dfw0;->m(I)V

    .line 167
    .line 168
    .line 169
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 170
    .line 171
    invoke-virtual {v1, v5}, Ll/dfw0;->d(I)I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    iget v7, v0, Ll/urr0;->n:I

    .line 176
    .line 177
    shr-int/lit8 v11, v7, 0x1

    .line 178
    .line 179
    and-int/2addr v11, v3

    .line 180
    or-int/lit8 v11, v11, 0x10

    .line 181
    .line 182
    int-to-byte v11, v11

    .line 183
    shl-int/lit8 v3, v7, 0x7

    .line 184
    .line 185
    shl-int/2addr v1, v5

    .line 186
    and-int/lit16 v3, v3, 0x80

    .line 187
    .line 188
    and-int/lit8 v1, v1, 0x78

    .line 189
    .line 190
    or-int/2addr v1, v3

    .line 191
    int-to-byte v1, v1

    .line 192
    new-array v3, v9, [B

    .line 193
    .line 194
    aput-byte v11, v3, v8

    .line 195
    .line 196
    aput-byte v1, v3, v10

    .line 197
    .line 198
    invoke-static {v3}, Ll/cdr0;->a([B)Ll/bdr0;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    new-instance v5, Ll/znr0;

    .line 203
    .line 204
    invoke-direct {v5}, Ll/znr0;-><init>()V

    .line 205
    .line 206
    .line 207
    iget-object v7, v0, Ll/urr0;->e:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v5, v7}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 210
    .line 211
    .line 212
    const-string v7, "audio/mp4a-latm"

    .line 213
    .line 214
    invoke-virtual {v5, v7}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 215
    .line 216
    .line 217
    iget-object v7, v1, Ll/bdr0;->c:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v5, v7}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 220
    .line 221
    .line 222
    iget v7, v1, Ll/bdr0;->b:I

    .line 223
    .line 224
    invoke-virtual {v5, v7}, Ll/znr0;->k0(I)Ll/znr0;

    .line 225
    .line 226
    .line 227
    iget v1, v1, Ll/bdr0;->a:I

    .line 228
    .line 229
    invoke-virtual {v5, v1}, Ll/znr0;->x(I)Ll/znr0;

    .line 230
    .line 231
    .line 232
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v5, v1}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 237
    .line 238
    .line 239
    iget-object v1, v0, Ll/urr0;->d:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v5, v1}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iget v3, v1, Ll/sqr0;->z:I

    .line 249
    .line 250
    int-to-long v7, v3

    .line 251
    const-wide/32 v11, 0x3d090000

    .line 252
    .line 253
    .line 254
    div-long/2addr v11, v7

    .line 255
    iput-wide v11, v0, Ll/urr0;->q:J

    .line 256
    .line 257
    iget-object v3, v0, Ll/urr0;->f:Ll/sgr0;

    .line 258
    .line 259
    invoke-interface {v3, v1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 260
    .line 261
    .line 262
    iput-boolean v10, v0, Ll/urr0;->p:Z

    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_5
    invoke-virtual {v12, v7}, Ll/dfw0;->m(I)V

    .line 266
    .line 267
    .line 268
    :goto_2
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 269
    .line 270
    invoke-virtual {v1, v4}, Ll/dfw0;->m(I)V

    .line 271
    .line 272
    .line 273
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 274
    .line 275
    invoke-virtual {v1, v2}, Ll/dfw0;->d(I)I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    add-int/lit8 v2, v1, -0x7

    .line 280
    .line 281
    iget-boolean v3, v0, Ll/urr0;->k:Z

    .line 282
    .line 283
    if-eqz v3, :cond_6

    .line 284
    .line 285
    add-int/lit8 v2, v1, -0x9

    .line 286
    .line 287
    :cond_6
    move v5, v2

    .line 288
    iget-object v1, v0, Ll/urr0;->f:Ll/sgr0;

    .line 289
    .line 290
    iget-wide v2, v0, Ll/urr0;->q:J

    .line 291
    .line 292
    const/4 v4, 0x0

    .line 293
    invoke-virtual/range {v0 .. v5}, Ll/urr0;->i(Ll/sgr0;JII)V

    .line 294
    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :cond_7
    iget-object v1, v0, Ll/urr0;->c:Ll/bgw0;

    .line 299
    .line 300
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v0, v6, v1, v7}, Ll/urr0;->j(Ll/bgw0;[BI)Z

    .line 305
    .line 306
    .line 307
    move-result v1

    .line 308
    if-eqz v1, :cond_0

    .line 309
    .line 310
    iget-object v1, v0, Ll/urr0;->g:Ll/sgr0;

    .line 311
    .line 312
    iget-object v2, v0, Ll/urr0;->c:Ll/bgw0;

    .line 313
    .line 314
    invoke-interface {v1, v2, v7}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 315
    .line 316
    .line 317
    iget-object v1, v0, Ll/urr0;->c:Ll/bgw0;

    .line 318
    .line 319
    const/4 v2, 0x6

    .line 320
    invoke-virtual {v1, v2}, Ll/bgw0;->k(I)V

    .line 321
    .line 322
    .line 323
    iget-object v1, v0, Ll/urr0;->g:Ll/sgr0;

    .line 324
    .line 325
    iget-object v2, v0, Ll/urr0;->c:Ll/bgw0;

    .line 326
    .line 327
    invoke-virtual {v2}, Ll/bgw0;->A()I

    .line 328
    .line 329
    .line 330
    move-result v2

    .line 331
    const/16 v4, 0xa

    .line 332
    .line 333
    add-int/lit8 v5, v2, 0xa

    .line 334
    .line 335
    const-wide/16 v2, 0x0

    .line 336
    .line 337
    invoke-virtual/range {v0 .. v5}, Ll/urr0;->i(Ll/sgr0;JII)V

    .line 338
    .line 339
    .line 340
    goto/16 :goto_0

    .line 341
    .line 342
    :cond_8
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-eqz v1, :cond_0

    .line 347
    .line 348
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 349
    .line 350
    iget-object v2, v1, Ll/dfw0;->a:[B

    .line 351
    .line 352
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 353
    .line 354
    .line 355
    move-result-object v3

    .line 356
    invoke-virtual {v6}, Ll/bgw0;->s()I

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    aget-byte v3, v3, v5

    .line 361
    .line 362
    aput-byte v3, v2, v8

    .line 363
    .line 364
    invoke-virtual {v1, v9}, Ll/dfw0;->k(I)V

    .line 365
    .line 366
    .line 367
    iget-object v1, v0, Ll/urr0;->b:Ll/dfw0;

    .line 368
    .line 369
    invoke-virtual {v1, v4}, Ll/dfw0;->d(I)I

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    iget v2, v0, Ll/urr0;->n:I

    .line 374
    .line 375
    if-eq v2, v7, :cond_9

    .line 376
    .line 377
    if-eq v1, v2, :cond_9

    .line 378
    .line 379
    invoke-virtual {v0}, Ll/urr0;->f()V

    .line 380
    .line 381
    .line 382
    goto/16 :goto_0

    .line 383
    .line 384
    :cond_9
    iget-boolean v2, v0, Ll/urr0;->l:Z

    .line 385
    .line 386
    if-nez v2, :cond_a

    .line 387
    .line 388
    iput-boolean v10, v0, Ll/urr0;->l:Z

    .line 389
    .line 390
    iget v2, v0, Ll/urr0;->o:I

    .line 391
    .line 392
    iput v2, v0, Ll/urr0;->m:I

    .line 393
    .line 394
    iput v1, v0, Ll/urr0;->n:I

    .line 395
    .line 396
    :cond_a
    invoke-virtual {v0}, Ll/urr0;->h()V

    .line 397
    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :cond_b
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-virtual {v6}, Ll/bgw0;->s()I

    .line 406
    .line 407
    .line 408
    move-result v11

    .line 409
    invoke-virtual {v6}, Ll/bgw0;->t()I

    .line 410
    .line 411
    .line 412
    move-result v12

    .line 413
    :goto_3
    if-ge v11, v12, :cond_1c

    .line 414
    .line 415
    add-int/lit8 v13, v11, 0x1

    .line 416
    .line 417
    aget-byte v14, v1, v11

    .line 418
    .line 419
    and-int/lit16 v15, v14, 0xff

    .line 420
    .line 421
    move/from16 v16, v5

    .line 422
    .line 423
    iget v5, v0, Ll/urr0;->j:I

    .line 424
    .line 425
    const/16 v8, 0x200

    .line 426
    .line 427
    if-ne v5, v8, :cond_c

    .line 428
    .line 429
    int-to-byte v5, v15

    .line 430
    invoke-static {v7, v5}, Ll/urr0;->k(BB)Z

    .line 431
    .line 432
    .line 433
    move-result v5

    .line 434
    if-eqz v5, :cond_c

    .line 435
    .line 436
    iget-boolean v5, v0, Ll/urr0;->l:Z

    .line 437
    .line 438
    if-nez v5, :cond_13

    .line 439
    .line 440
    add-int/lit8 v5, v11, -0x1

    .line 441
    .line 442
    invoke-virtual {v6, v11}, Ll/bgw0;->k(I)V

    .line 443
    .line 444
    .line 445
    iget-object v8, v0, Ll/urr0;->b:Ll/dfw0;

    .line 446
    .line 447
    iget-object v8, v8, Ll/dfw0;->a:[B

    .line 448
    .line 449
    invoke-static {v6, v8, v10}, Ll/urr0;->l(Ll/bgw0;[BI)Z

    .line 450
    .line 451
    .line 452
    move-result v8

    .line 453
    if-nez v8, :cond_d

    .line 454
    .line 455
    :cond_c
    move v9, v3

    .line 456
    goto/16 :goto_8

    .line 457
    .line 458
    :cond_d
    iget-object v8, v0, Ll/urr0;->b:Ll/dfw0;

    .line 459
    .line 460
    invoke-virtual {v8, v4}, Ll/dfw0;->k(I)V

    .line 461
    .line 462
    .line 463
    iget-object v8, v0, Ll/urr0;->b:Ll/dfw0;

    .line 464
    .line 465
    invoke-virtual {v8, v10}, Ll/dfw0;->d(I)I

    .line 466
    .line 467
    .line 468
    move-result v8

    .line 469
    iget v3, v0, Ll/urr0;->m:I

    .line 470
    .line 471
    if-eq v3, v7, :cond_f

    .line 472
    .line 473
    if-ne v8, v3, :cond_e

    .line 474
    .line 475
    goto :goto_4

    .line 476
    :cond_e
    const/4 v9, 0x7

    .line 477
    goto/16 :goto_8

    .line 478
    .line 479
    :cond_f
    :goto_4
    iget v3, v0, Ll/urr0;->n:I

    .line 480
    .line 481
    if-eq v3, v7, :cond_11

    .line 482
    .line 483
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 484
    .line 485
    iget-object v3, v3, Ll/dfw0;->a:[B

    .line 486
    .line 487
    invoke-static {v6, v3, v10}, Ll/urr0;->l(Ll/bgw0;[BI)Z

    .line 488
    .line 489
    .line 490
    move-result v3

    .line 491
    if-nez v3, :cond_10

    .line 492
    .line 493
    goto :goto_5

    .line 494
    :cond_10
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 495
    .line 496
    invoke-virtual {v3, v9}, Ll/dfw0;->k(I)V

    .line 497
    .line 498
    .line 499
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 500
    .line 501
    invoke-virtual {v3, v4}, Ll/dfw0;->d(I)I

    .line 502
    .line 503
    .line 504
    move-result v3

    .line 505
    iget v9, v0, Ll/urr0;->n:I

    .line 506
    .line 507
    if-ne v3, v9, :cond_e

    .line 508
    .line 509
    add-int/lit8 v3, v11, 0x1

    .line 510
    .line 511
    invoke-virtual {v6, v3}, Ll/bgw0;->k(I)V

    .line 512
    .line 513
    .line 514
    :cond_11
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 515
    .line 516
    iget-object v3, v3, Ll/dfw0;->a:[B

    .line 517
    .line 518
    invoke-static {v6, v3, v4}, Ll/urr0;->l(Ll/bgw0;[BI)Z

    .line 519
    .line 520
    .line 521
    move-result v3

    .line 522
    if-eqz v3, :cond_13

    .line 523
    .line 524
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 525
    .line 526
    const/16 v9, 0xe

    .line 527
    .line 528
    invoke-virtual {v3, v9}, Ll/dfw0;->k(I)V

    .line 529
    .line 530
    .line 531
    iget-object v3, v0, Ll/urr0;->b:Ll/dfw0;

    .line 532
    .line 533
    invoke-virtual {v3, v2}, Ll/dfw0;->d(I)I

    .line 534
    .line 535
    .line 536
    move-result v3

    .line 537
    const/4 v9, 0x7

    .line 538
    if-lt v3, v9, :cond_16

    .line 539
    .line 540
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 541
    .line 542
    .line 543
    move-result-object v17

    .line 544
    invoke-virtual {v6}, Ll/bgw0;->t()I

    .line 545
    .line 546
    .line 547
    move-result v2

    .line 548
    add-int/2addr v5, v3

    .line 549
    if-ge v5, v2, :cond_13

    .line 550
    .line 551
    aget-byte v3, v17, v5

    .line 552
    .line 553
    if-ne v3, v7, :cond_12

    .line 554
    .line 555
    add-int/lit8 v5, v5, 0x1

    .line 556
    .line 557
    if-eq v5, v2, :cond_13

    .line 558
    .line 559
    aget-byte v2, v17, v5

    .line 560
    .line 561
    invoke-static {v7, v2}, Ll/urr0;->k(BB)Z

    .line 562
    .line 563
    .line 564
    move-result v3

    .line 565
    if-eqz v3, :cond_16

    .line 566
    .line 567
    and-int/lit8 v2, v2, 0x8

    .line 568
    .line 569
    shr-int/lit8 v2, v2, 0x3

    .line 570
    .line 571
    if-ne v2, v8, :cond_16

    .line 572
    .line 573
    goto :goto_5

    .line 574
    :cond_12
    const/16 v8, 0x49

    .line 575
    .line 576
    if-ne v3, v8, :cond_16

    .line 577
    .line 578
    add-int/lit8 v3, v5, 0x1

    .line 579
    .line 580
    if-eq v3, v2, :cond_13

    .line 581
    .line 582
    aget-byte v3, v17, v3

    .line 583
    .line 584
    const/16 v8, 0x44

    .line 585
    .line 586
    if-ne v3, v8, :cond_16

    .line 587
    .line 588
    add-int/lit8 v5, v5, 0x2

    .line 589
    .line 590
    if-eq v5, v2, :cond_13

    .line 591
    .line 592
    aget-byte v2, v17, v5

    .line 593
    .line 594
    const/16 v3, 0x33

    .line 595
    .line 596
    if-ne v2, v3, :cond_16

    .line 597
    .line 598
    :cond_13
    :goto_5
    and-int/lit8 v1, v14, 0x8

    .line 599
    .line 600
    shr-int/lit8 v1, v1, 0x3

    .line 601
    .line 602
    iput v1, v0, Ll/urr0;->o:I

    .line 603
    .line 604
    and-int/lit8 v1, v14, 0x1

    .line 605
    .line 606
    xor-int/2addr v1, v10

    .line 607
    if-eq v10, v1, :cond_14

    .line 608
    .line 609
    const/4 v1, 0x0

    .line 610
    goto :goto_6

    .line 611
    :cond_14
    move v1, v10

    .line 612
    :goto_6
    iput-boolean v1, v0, Ll/urr0;->k:Z

    .line 613
    .line 614
    iget-boolean v1, v0, Ll/urr0;->l:Z

    .line 615
    .line 616
    if-nez v1, :cond_15

    .line 617
    .line 618
    iput v10, v0, Ll/urr0;->h:I

    .line 619
    .line 620
    const/4 v1, 0x0

    .line 621
    iput v1, v0, Ll/urr0;->i:I

    .line 622
    .line 623
    goto :goto_7

    .line 624
    :cond_15
    invoke-virtual {v0}, Ll/urr0;->h()V

    .line 625
    .line 626
    .line 627
    :goto_7
    invoke-virtual {v6, v13}, Ll/bgw0;->k(I)V

    .line 628
    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :cond_16
    :goto_8
    iget v2, v0, Ll/urr0;->j:I

    .line 633
    .line 634
    or-int v3, v2, v15

    .line 635
    .line 636
    const/16 v5, 0x149

    .line 637
    .line 638
    if-eq v3, v5, :cond_1b

    .line 639
    .line 640
    const/16 v5, 0x1ff

    .line 641
    .line 642
    if-eq v3, v5, :cond_1a

    .line 643
    .line 644
    const/16 v5, 0x344

    .line 645
    .line 646
    if-eq v3, v5, :cond_19

    .line 647
    .line 648
    const/16 v5, 0x433

    .line 649
    .line 650
    if-eq v3, v5, :cond_18

    .line 651
    .line 652
    const/16 v3, 0x100

    .line 653
    .line 654
    if-eq v2, v3, :cond_17

    .line 655
    .line 656
    iput v3, v0, Ll/urr0;->j:I

    .line 657
    .line 658
    move v3, v9

    .line 659
    move/from16 v5, v16

    .line 660
    .line 661
    const/16 v2, 0xd

    .line 662
    .line 663
    const/4 v8, 0x0

    .line 664
    const/4 v9, 0x2

    .line 665
    goto/16 :goto_3

    .line 666
    .line 667
    :cond_17
    move/from16 v3, v16

    .line 668
    .line 669
    const/4 v2, 0x2

    .line 670
    const/4 v5, 0x0

    .line 671
    goto :goto_a

    .line 672
    :cond_18
    const/4 v2, 0x2

    .line 673
    iput v2, v0, Ll/urr0;->h:I

    .line 674
    .line 675
    move/from16 v3, v16

    .line 676
    .line 677
    iput v3, v0, Ll/urr0;->i:I

    .line 678
    .line 679
    const/4 v5, 0x0

    .line 680
    iput v5, v0, Ll/urr0;->r:I

    .line 681
    .line 682
    iget-object v1, v0, Ll/urr0;->c:Ll/bgw0;

    .line 683
    .line 684
    invoke-virtual {v1, v5}, Ll/bgw0;->k(I)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v6, v13}, Ll/bgw0;->k(I)V

    .line 688
    .line 689
    .line 690
    goto/16 :goto_0

    .line 691
    .line 692
    :cond_19
    move/from16 v3, v16

    .line 693
    .line 694
    const/4 v2, 0x2

    .line 695
    const/4 v5, 0x0

    .line 696
    const/16 v8, 0x400

    .line 697
    .line 698
    :goto_9
    iput v8, v0, Ll/urr0;->j:I

    .line 699
    .line 700
    goto :goto_a

    .line 701
    :cond_1a
    move/from16 v3, v16

    .line 702
    .line 703
    const/4 v2, 0x2

    .line 704
    const/4 v5, 0x0

    .line 705
    const/16 v8, 0x200

    .line 706
    .line 707
    goto :goto_9

    .line 708
    :cond_1b
    move/from16 v3, v16

    .line 709
    .line 710
    const/4 v2, 0x2

    .line 711
    const/4 v5, 0x0

    .line 712
    const/16 v8, 0x300

    .line 713
    .line 714
    goto :goto_9

    .line 715
    :goto_a
    move v8, v5

    .line 716
    move v11, v13

    .line 717
    move v5, v3

    .line 718
    move v3, v9

    .line 719
    move v9, v2

    .line 720
    const/16 v2, 0xd

    .line 721
    .line 722
    goto/16 :goto_3

    .line 723
    .line 724
    :cond_1c
    invoke-virtual {v6, v11}, Ll/bgw0;->k(I)V

    .line 725
    .line 726
    .line 727
    goto/16 :goto_0

    .line 728
    .line 729
    :cond_1d
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/urr0;->s:J

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
    iput-object v0, p0, Ll/urr0;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/urr0;->f:Ll/sgr0;

    .line 20
    .line 21
    iput-object v0, p0, Ll/urr0;->t:Ll/sgr0;

    .line 22
    .line 23
    iget-boolean v0, p0, Ll/urr0;->a:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/gur0;->c()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x5

    .line 35
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ll/urr0;->g:Ll/sgr0;

    .line 40
    .line 41
    new-instance p0, Ll/znr0;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/znr0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0, p2}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 51
    .line 52
    .line 53
    const-string p2, "application/id3"

    .line 54
    .line 55
    invoke-virtual {p0, p2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/znr0;->D()Ll/sqr0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p1, p0}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    new-instance p1, Ll/oer0;

    .line 67
    .line 68
    invoke-direct {p1}, Ll/oer0;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Ll/urr0;->g:Ll/sgr0;

    .line 72
    .line 73
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/urr0;->l:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/urr0;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/urr0;->h:I

    .line 3
    .line 4
    iput v0, p0, Ll/urr0;->i:I

    .line 5
    .line 6
    const/16 v0, 0x100

    .line 7
    .line 8
    iput v0, p0, Ll/urr0;->j:I

    .line 9
    .line 10
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    iput v0, p0, Ll/urr0;->h:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/urr0;->i:I

    .line 6
    .line 7
    return-void
.end method

.method public final i(Ll/sgr0;JII)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    iput v0, p0, Ll/urr0;->h:I

    .line 3
    .line 4
    iput p4, p0, Ll/urr0;->i:I

    .line 5
    .line 6
    iput-object p1, p0, Ll/urr0;->t:Ll/sgr0;

    .line 7
    .line 8
    iput-wide p2, p0, Ll/urr0;->u:J

    .line 9
    .line 10
    iput p5, p0, Ll/urr0;->r:I

    .line 11
    .line 12
    return-void
.end method

.method public final j(Ll/bgw0;[BI)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/urr0;->i:I

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
    iget v1, p0, Ll/urr0;->i:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v1, v0}, Ll/bgw0;->g([BII)V

    .line 16
    .line 17
    .line 18
    iget p1, p0, Ll/urr0;->i:I

    .line 19
    .line 20
    add-int/2addr p1, v0

    .line 21
    iput p1, p0, Ll/urr0;->i:I

    .line 22
    .line 23
    if-ne p1, p3, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final zze()V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    iput-wide v0, p0, Ll/urr0;->s:J

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/urr0;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
