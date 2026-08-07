.class public final Ll/xnl0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final k:Ll/xnl0;


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:[F

.field public final h:F

.field public final i:F

.field public final j:F


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    sget-object v0, Ll/i94;->c:[F

    .line 2
    .line 3
    const/high16 v1, 0x42480000    # 50.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/i94;->h(F)F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    float-to-double v2, v2

    .line 10
    const-wide v4, 0x404fd4bbab8b494cL    # 63.66197723675813

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    mul-double/2addr v2, v4

    .line 16
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 17
    .line 18
    div-double/2addr v2, v4

    .line 19
    double-to-float v2, v2

    .line 20
    const/high16 v3, 0x40000000    # 2.0f

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {v0, v2, v1, v3, v4}, Ll/xnl0;->k([FFFFZ)Ll/xnl0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/xnl0;->k:Ll/xnl0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(FFFFFF[FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/xnl0;->f:F

    .line 5
    .line 6
    iput p2, p0, Ll/xnl0;->a:F

    .line 7
    .line 8
    iput p3, p0, Ll/xnl0;->b:F

    .line 9
    .line 10
    iput p4, p0, Ll/xnl0;->c:F

    .line 11
    .line 12
    iput p5, p0, Ll/xnl0;->d:F

    .line 13
    .line 14
    iput p6, p0, Ll/xnl0;->e:F

    .line 15
    .line 16
    iput-object p7, p0, Ll/xnl0;->g:[F

    .line 17
    .line 18
    iput p8, p0, Ll/xnl0;->h:F

    .line 19
    .line 20
    iput p9, p0, Ll/xnl0;->i:F

    .line 21
    .line 22
    iput p10, p0, Ll/xnl0;->j:F

    .line 23
    .line 24
    return-void
.end method

.method public static k([FFFFZ)Ll/xnl0;
    .locals 22
    .param p0    # [F
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    sget-object v1, Ll/i94;->a:[[F

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget v3, p0, v2

    .line 7
    .line 8
    aget-object v4, v1, v2

    .line 9
    .line 10
    aget v5, v4, v2

    .line 11
    .line 12
    mul-float/2addr v5, v3

    .line 13
    const/4 v6, 0x1

    .line 14
    aget v7, p0, v6

    .line 15
    .line 16
    aget v8, v4, v6

    .line 17
    .line 18
    mul-float/2addr v8, v7

    .line 19
    add-float/2addr v5, v8

    .line 20
    const/4 v8, 0x2

    .line 21
    aget v9, p0, v8

    .line 22
    .line 23
    aget v4, v4, v8

    .line 24
    .line 25
    mul-float/2addr v4, v9

    .line 26
    add-float/2addr v5, v4

    .line 27
    aget-object v4, v1, v6

    .line 28
    .line 29
    aget v10, v4, v2

    .line 30
    .line 31
    mul-float/2addr v10, v3

    .line 32
    aget v11, v4, v6

    .line 33
    .line 34
    mul-float/2addr v11, v7

    .line 35
    add-float/2addr v10, v11

    .line 36
    aget v4, v4, v8

    .line 37
    .line 38
    mul-float/2addr v4, v9

    .line 39
    add-float/2addr v10, v4

    .line 40
    aget-object v1, v1, v8

    .line 41
    .line 42
    aget v4, v1, v2

    .line 43
    .line 44
    mul-float/2addr v3, v4

    .line 45
    aget v4, v1, v6

    .line 46
    .line 47
    mul-float/2addr v7, v4

    .line 48
    add-float/2addr v3, v7

    .line 49
    aget v1, v1, v8

    .line 50
    .line 51
    mul-float/2addr v9, v1

    .line 52
    add-float/2addr v3, v9

    .line 53
    const/high16 v1, 0x41200000    # 10.0f

    .line 54
    .line 55
    div-float v4, p3, v1

    .line 56
    .line 57
    const v7, 0x3f4ccccd    # 0.8f

    .line 58
    .line 59
    .line 60
    add-float/2addr v4, v7

    .line 61
    float-to-double v11, v4

    .line 62
    const-wide v13, 0x3feccccccccccccdL    # 0.9

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    cmpl-double v9, v11, v13

    .line 68
    .line 69
    const v11, 0x3f170a3d    # 0.59f

    .line 70
    .line 71
    .line 72
    if-ltz v9, :cond_0

    .line 73
    .line 74
    const v7, 0x3f666666    # 0.9f

    .line 75
    .line 76
    .line 77
    sub-float v7, v4, v7

    .line 78
    .line 79
    mul-float/2addr v7, v1

    .line 80
    const v1, 0x3f30a3d7    # 0.69f

    .line 81
    .line 82
    .line 83
    invoke-static {v11, v1, v7}, Ll/i94;->d(FFF)F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    :goto_0
    move/from16 v16, v1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_0
    sub-float v7, v4, v7

    .line 91
    .line 92
    mul-float/2addr v7, v1

    .line 93
    const v1, 0x3f066666    # 0.525f

    .line 94
    .line 95
    .line 96
    invoke-static {v1, v11, v7}, Ll/i94;->d(FFF)F

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    goto :goto_0

    .line 101
    :goto_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 102
    .line 103
    if-eqz p4, :cond_1

    .line 104
    .line 105
    move v7, v1

    .line 106
    goto :goto_2

    .line 107
    :cond_1
    neg-float v7, v0

    .line 108
    const/high16 v9, 0x42280000    # 42.0f

    .line 109
    .line 110
    sub-float/2addr v7, v9

    .line 111
    const/high16 v9, 0x42b80000    # 92.0f

    .line 112
    .line 113
    div-float/2addr v7, v9

    .line 114
    float-to-double v11, v7

    .line 115
    invoke-static {v11, v12}, Ljava/lang/Math;->exp(D)D

    .line 116
    .line 117
    .line 118
    move-result-wide v11

    .line 119
    double-to-float v7, v11

    .line 120
    const v9, 0x3e8e38e4

    .line 121
    .line 122
    .line 123
    mul-float/2addr v7, v9

    .line 124
    sub-float v7, v1, v7

    .line 125
    .line 126
    mul-float/2addr v7, v4

    .line 127
    :goto_2
    float-to-double v11, v7

    .line 128
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 129
    .line 130
    cmpl-double v9, v11, v13

    .line 131
    .line 132
    if-lez v9, :cond_2

    .line 133
    .line 134
    move v7, v1

    .line 135
    goto :goto_3

    .line 136
    :cond_2
    const-wide/16 v13, 0x0

    .line 137
    .line 138
    cmpg-double v9, v11, v13

    .line 139
    .line 140
    if-gez v9, :cond_3

    .line 141
    .line 142
    const/4 v7, 0x0

    .line 143
    :cond_3
    :goto_3
    const/high16 v9, 0x42c80000    # 100.0f

    .line 144
    .line 145
    div-float v11, v9, v5

    .line 146
    .line 147
    mul-float/2addr v11, v7

    .line 148
    add-float/2addr v11, v1

    .line 149
    sub-float/2addr v11, v7

    .line 150
    div-float v12, v9, v10

    .line 151
    .line 152
    mul-float/2addr v12, v7

    .line 153
    add-float/2addr v12, v1

    .line 154
    sub-float/2addr v12, v7

    .line 155
    div-float/2addr v9, v3

    .line 156
    mul-float/2addr v9, v7

    .line 157
    add-float/2addr v9, v1

    .line 158
    sub-float/2addr v9, v7

    .line 159
    const/4 v7, 0x3

    .line 160
    new-array v13, v7, [F

    .line 161
    .line 162
    aput v11, v13, v2

    .line 163
    .line 164
    aput v12, v13, v6

    .line 165
    .line 166
    aput v9, v13, v8

    .line 167
    .line 168
    const/high16 v9, 0x40a00000    # 5.0f

    .line 169
    .line 170
    mul-float/2addr v9, v0

    .line 171
    add-float/2addr v9, v1

    .line 172
    div-float v9, v1, v9

    .line 173
    .line 174
    mul-float v11, v9, v9

    .line 175
    .line 176
    mul-float/2addr v11, v9

    .line 177
    mul-float/2addr v11, v9

    .line 178
    sub-float/2addr v1, v11

    .line 179
    mul-float/2addr v11, v0

    .line 180
    const v9, 0x3dcccccd    # 0.1f

    .line 181
    .line 182
    .line 183
    mul-float/2addr v9, v1

    .line 184
    mul-float/2addr v9, v1

    .line 185
    const-wide/high16 v14, 0x4014000000000000L    # 5.0

    .line 186
    .line 187
    float-to-double v0, v0

    .line 188
    mul-double/2addr v0, v14

    .line 189
    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    .line 190
    .line 191
    .line 192
    move-result-wide v0

    .line 193
    double-to-float v0, v0

    .line 194
    mul-float/2addr v9, v0

    .line 195
    add-float/2addr v11, v9

    .line 196
    invoke-static/range {p2 .. p2}, Ll/i94;->h(F)F

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    aget v1, p0, v6

    .line 201
    .line 202
    div-float v12, v0, v1

    .line 203
    .line 204
    float-to-double v0, v12

    .line 205
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 206
    .line 207
    .line 208
    move-result-wide v14

    .line 209
    double-to-float v9, v14

    .line 210
    const v14, 0x3fbd70a4    # 1.48f

    .line 211
    .line 212
    .line 213
    add-float v21, v9, v14

    .line 214
    .line 215
    const-wide v14, 0x3fc999999999999aL    # 0.2

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->pow(DD)D

    .line 221
    .line 222
    .line 223
    move-result-wide v0

    .line 224
    double-to-float v0, v0

    .line 225
    const v1, 0x3f39999a    # 0.725f

    .line 226
    .line 227
    .line 228
    div-float v14, v1, v0

    .line 229
    .line 230
    aget v0, v13, v2

    .line 231
    .line 232
    mul-float/2addr v0, v11

    .line 233
    mul-float/2addr v0, v5

    .line 234
    float-to-double v0, v0

    .line 235
    const-wide/high16 v17, 0x4059000000000000L    # 100.0

    .line 236
    .line 237
    div-double v0, v0, v17

    .line 238
    .line 239
    move v5, v2

    .line 240
    move v9, v3

    .line 241
    const-wide v2, 0x3fdae147ae147ae1L    # 0.42

    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 247
    .line 248
    .line 249
    move-result-wide v0

    .line 250
    double-to-float v0, v0

    .line 251
    aget v1, v13, v6

    .line 252
    .line 253
    mul-float/2addr v1, v11

    .line 254
    mul-float/2addr v1, v10

    .line 255
    move/from16 p0, v5

    .line 256
    .line 257
    move v10, v6

    .line 258
    float-to-double v5, v1

    .line 259
    div-double v5, v5, v17

    .line 260
    .line 261
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 262
    .line 263
    .line 264
    move-result-wide v5

    .line 265
    double-to-float v1, v5

    .line 266
    aget v5, v13, v8

    .line 267
    .line 268
    mul-float/2addr v5, v11

    .line 269
    mul-float/2addr v5, v9

    .line 270
    float-to-double v5, v5

    .line 271
    div-double v5, v5, v17

    .line 272
    .line 273
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 274
    .line 275
    .line 276
    move-result-wide v2

    .line 277
    double-to-float v2, v2

    .line 278
    new-array v3, v7, [F

    .line 279
    .line 280
    aput v0, v3, p0

    .line 281
    .line 282
    aput v1, v3, v10

    .line 283
    .line 284
    aput v2, v3, v8

    .line 285
    .line 286
    aget v0, v3, p0

    .line 287
    .line 288
    const/high16 v1, 0x43c80000    # 400.0f

    .line 289
    .line 290
    mul-float v2, v0, v1

    .line 291
    .line 292
    const v5, 0x41d90a3d    # 27.13f

    .line 293
    .line 294
    .line 295
    add-float/2addr v0, v5

    .line 296
    div-float/2addr v2, v0

    .line 297
    aget v0, v3, v10

    .line 298
    .line 299
    mul-float v6, v0, v1

    .line 300
    .line 301
    add-float/2addr v0, v5

    .line 302
    div-float/2addr v6, v0

    .line 303
    aget v0, v3, v8

    .line 304
    .line 305
    mul-float/2addr v1, v0

    .line 306
    add-float/2addr v0, v5

    .line 307
    div-float/2addr v1, v0

    .line 308
    new-array v0, v7, [F

    .line 309
    .line 310
    aput v2, v0, p0

    .line 311
    .line 312
    aput v6, v0, v10

    .line 313
    .line 314
    aput v1, v0, v8

    .line 315
    .line 316
    const/high16 v1, 0x40000000    # 2.0f

    .line 317
    .line 318
    aget v2, v0, p0

    .line 319
    .line 320
    mul-float/2addr v2, v1

    .line 321
    aget v1, v0, v10

    .line 322
    .line 323
    add-float/2addr v2, v1

    .line 324
    const v1, 0x3d4ccccd    # 0.05f

    .line 325
    .line 326
    .line 327
    aget v0, v0, v8

    .line 328
    .line 329
    mul-float/2addr v0, v1

    .line 330
    add-float/2addr v2, v0

    .line 331
    mul-float/2addr v2, v14

    .line 332
    new-instance v0, Ll/xnl0;

    .line 333
    .line 334
    float-to-double v5, v11

    .line 335
    const-wide/high16 v7, 0x3fd0000000000000L    # 0.25

    .line 336
    .line 337
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 338
    .line 339
    .line 340
    move-result-wide v5

    .line 341
    double-to-float v1, v5

    .line 342
    move v15, v14

    .line 343
    move/from16 v20, v1

    .line 344
    .line 345
    move/from16 v17, v4

    .line 346
    .line 347
    move/from16 v19, v11

    .line 348
    .line 349
    move-object/from16 v18, v13

    .line 350
    .line 351
    move-object v11, v0

    .line 352
    move v13, v2

    .line 353
    invoke-direct/range {v11 .. v21}, Ll/xnl0;-><init>(FFFFFF[FFFF)V

    .line 354
    .line 355
    .line 356
    return-object v11
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public e()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public g()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public h()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public i()[F
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xnl0;->g:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xnl0;->j:F

    .line 2
    .line 3
    return p0
.end method
