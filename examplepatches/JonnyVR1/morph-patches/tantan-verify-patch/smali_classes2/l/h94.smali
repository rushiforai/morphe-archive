.class public Ll/h94;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F

.field public final h:F

.field public final i:F


# direct methods
.method public constructor <init>(FFFFFFFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/h94;->a:F

    .line 5
    .line 6
    iput p2, p0, Ll/h94;->b:F

    .line 7
    .line 8
    iput p3, p0, Ll/h94;->c:F

    .line 9
    .line 10
    iput p4, p0, Ll/h94;->d:F

    .line 11
    .line 12
    iput p5, p0, Ll/h94;->e:F

    .line 13
    .line 14
    iput p6, p0, Ll/h94;->f:F

    .line 15
    .line 16
    iput p7, p0, Ll/h94;->g:F

    .line 17
    .line 18
    iput p8, p0, Ll/h94;->h:F

    .line 19
    .line 20
    iput p9, p0, Ll/h94;->i:F

    .line 21
    .line 22
    return-void
.end method

.method public static b(FFF)Ll/h94;
    .locals 12
    .param p0    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 360.0
        .end annotation
    .end param
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = Infinity
            toInclusive = false
        .end annotation
    .end param
    .param p2    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 100.0
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x42c80000    # 100.0f

    .line 3
    .line 4
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    move v5, v0

    .line 8
    move-object v4, v3

    .line 9
    move v3, v2

    .line 10
    :goto_0
    sub-float v6, v5, v1

    .line 11
    .line 12
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v6

    .line 16
    const v7, 0x3c23d70a    # 0.01f

    .line 17
    .line 18
    .line 19
    cmpl-float v6, v6, v7

    .line 20
    .line 21
    if-lez v6, :cond_3

    .line 22
    .line 23
    sub-float v6, v1, v5

    .line 24
    .line 25
    const/high16 v7, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr v6, v7

    .line 28
    add-float/2addr v6, v5

    .line 29
    invoke-static {v6, p1, p0}, Ll/h94;->e(FFF)Ll/h94;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v7}, Ll/h94;->p()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    invoke-static {v7}, Ll/i94;->b(I)F

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    sub-float v9, p2, v8

    .line 42
    .line 43
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    const v10, 0x3e4ccccd    # 0.2f

    .line 48
    .line 49
    .line 50
    cmpg-float v10, v9, v10

    .line 51
    .line 52
    if-gez v10, :cond_0

    .line 53
    .line 54
    invoke-static {v7}, Ll/h94;->c(I)Ll/h94;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    invoke-virtual {v7}, Ll/h94;->k()F

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    invoke-virtual {v7}, Ll/h94;->i()F

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    invoke-static {v10, v11, p0}, Ll/h94;->e(FFF)Ll/h94;

    .line 67
    .line 68
    .line 69
    move-result-object v10

    .line 70
    invoke-virtual {v7, v10}, Ll/h94;->a(Ll/h94;)F

    .line 71
    .line 72
    .line 73
    move-result v10

    .line 74
    const/high16 v11, 0x3f800000    # 1.0f

    .line 75
    .line 76
    cmpg-float v11, v10, v11

    .line 77
    .line 78
    if-gtz v11, :cond_0

    .line 79
    .line 80
    move-object v4, v7

    .line 81
    move v2, v9

    .line 82
    move v3, v10

    .line 83
    :cond_0
    cmpl-float v7, v2, v0

    .line 84
    .line 85
    if-nez v7, :cond_1

    .line 86
    .line 87
    cmpl-float v7, v3, v0

    .line 88
    .line 89
    if-nez v7, :cond_1

    .line 90
    .line 91
    return-object v4

    .line 92
    :cond_1
    cmpg-float v7, v8, p2

    .line 93
    .line 94
    if-gez v7, :cond_2

    .line 95
    .line 96
    move v5, v6

    .line 97
    goto :goto_0

    .line 98
    :cond_2
    move v1, v6

    .line 99
    goto :goto_0

    .line 100
    :cond_3
    return-object v4
.end method

.method public static c(I)Ll/h94;
    .locals 14
    .param p0    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    new-array v2, v1, [F

    .line 6
    .line 7
    sget-object v3, Ll/xnl0;->k:Ll/xnl0;

    .line 8
    .line 9
    invoke-static {p0, v3, v0, v2}, Ll/h94;->d(ILl/xnl0;[F[F)V

    .line 10
    .line 11
    .line 12
    new-instance v4, Ll/h94;

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    aget v5, v2, p0

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aget v6, v2, v3

    .line 19
    .line 20
    aget v7, v0, p0

    .line 21
    .line 22
    aget v8, v0, v3

    .line 23
    .line 24
    const/4 p0, 0x2

    .line 25
    aget v9, v0, p0

    .line 26
    .line 27
    aget v10, v0, v1

    .line 28
    .line 29
    const/4 p0, 0x4

    .line 30
    aget v11, v0, p0

    .line 31
    .line 32
    const/4 p0, 0x5

    .line 33
    aget v12, v0, p0

    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    aget v13, v0, p0

    .line 37
    .line 38
    invoke-direct/range {v4 .. v13}, Ll/h94;-><init>(FFFFFFFFF)V

    .line 39
    .line 40
    .line 41
    return-object v4
.end method

.method public static d(ILl/xnl0;[F[F)V
    .locals 21
    .param p0    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p1    # Ll/xnl0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [F
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Landroidx/annotation/Size;
            value = 0x7L
        .end annotation
    .end param
    .param p3    # [F
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Landroidx/annotation/Size;
            value = 0x3L
        .end annotation
    .end param

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i94;->f(I[F)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/i94;->a:[[F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget v3, v1, v2

    .line 12
    .line 13
    aget-object v4, v0, v2

    .line 14
    .line 15
    aget v5, v4, v2

    .line 16
    .line 17
    mul-float/2addr v5, v3

    .line 18
    const/4 v6, 0x1

    .line 19
    aget v7, v1, v6

    .line 20
    .line 21
    aget v8, v4, v6

    .line 22
    .line 23
    mul-float/2addr v8, v7

    .line 24
    add-float/2addr v5, v8

    .line 25
    const/4 v8, 0x2

    .line 26
    aget v9, v1, v8

    .line 27
    .line 28
    aget v4, v4, v8

    .line 29
    .line 30
    mul-float/2addr v4, v9

    .line 31
    add-float/2addr v5, v4

    .line 32
    aget-object v4, v0, v6

    .line 33
    .line 34
    aget v10, v4, v2

    .line 35
    .line 36
    mul-float/2addr v10, v3

    .line 37
    aget v11, v4, v6

    .line 38
    .line 39
    mul-float/2addr v11, v7

    .line 40
    add-float/2addr v10, v11

    .line 41
    aget v4, v4, v8

    .line 42
    .line 43
    mul-float/2addr v4, v9

    .line 44
    add-float/2addr v10, v4

    .line 45
    aget-object v0, v0, v8

    .line 46
    .line 47
    aget v4, v0, v2

    .line 48
    .line 49
    mul-float/2addr v3, v4

    .line 50
    aget v4, v0, v6

    .line 51
    .line 52
    mul-float/2addr v7, v4

    .line 53
    add-float/2addr v3, v7

    .line 54
    aget v0, v0, v8

    .line 55
    .line 56
    mul-float/2addr v9, v0

    .line 57
    add-float/2addr v3, v9

    .line 58
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    aget v0, v0, v2

    .line 63
    .line 64
    mul-float/2addr v0, v5

    .line 65
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    aget v4, v4, v6

    .line 70
    .line 71
    mul-float/2addr v4, v10

    .line 72
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    aget v5, v5, v8

    .line 77
    .line 78
    mul-float/2addr v5, v3

    .line 79
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    mul-float/2addr v3, v7

    .line 88
    float-to-double v9, v3

    .line 89
    const-wide/high16 v11, 0x4059000000000000L    # 100.0

    .line 90
    .line 91
    div-double/2addr v9, v11

    .line 92
    const-wide v13, 0x3fdae147ae147ae1L    # 0.42

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->pow(DD)D

    .line 98
    .line 99
    .line 100
    move-result-wide v9

    .line 101
    double-to-float v3, v9

    .line 102
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    mul-float/2addr v7, v9

    .line 111
    float-to-double v9, v7

    .line 112
    div-double/2addr v9, v11

    .line 113
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->pow(DD)D

    .line 114
    .line 115
    .line 116
    move-result-wide v9

    .line 117
    double-to-float v7, v9

    .line 118
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 119
    .line 120
    .line 121
    move-result v9

    .line 122
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 123
    .line 124
    .line 125
    move-result v10

    .line 126
    mul-float/2addr v9, v10

    .line 127
    float-to-double v9, v9

    .line 128
    div-double/2addr v9, v11

    .line 129
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->pow(DD)D

    .line 130
    .line 131
    .line 132
    move-result-wide v9

    .line 133
    double-to-float v9, v9

    .line 134
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    const/high16 v10, 0x43c80000    # 400.0f

    .line 139
    .line 140
    mul-float/2addr v0, v10

    .line 141
    mul-float/2addr v0, v3

    .line 142
    const v13, 0x41d90a3d    # 27.13f

    .line 143
    .line 144
    .line 145
    add-float/2addr v3, v13

    .line 146
    div-float/2addr v0, v3

    .line 147
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    mul-float/2addr v3, v10

    .line 152
    mul-float/2addr v3, v7

    .line 153
    add-float/2addr v7, v13

    .line 154
    div-float/2addr v3, v7

    .line 155
    invoke-static {v5}, Ljava/lang/Math;->signum(F)F

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    mul-float/2addr v4, v10

    .line 160
    mul-float/2addr v4, v9

    .line 161
    add-float/2addr v9, v13

    .line 162
    div-float/2addr v4, v9

    .line 163
    const-wide/high16 v9, 0x4026000000000000L    # 11.0

    .line 164
    .line 165
    float-to-double v13, v0

    .line 166
    mul-double/2addr v13, v9

    .line 167
    const-wide/high16 v9, -0x3fd8000000000000L    # -12.0

    .line 168
    .line 169
    move/from16 p0, v6

    .line 170
    .line 171
    float-to-double v6, v3

    .line 172
    mul-double/2addr v6, v9

    .line 173
    add-double/2addr v13, v6

    .line 174
    float-to-double v5, v4

    .line 175
    add-double/2addr v13, v5

    .line 176
    double-to-float v7, v13

    .line 177
    const/high16 v9, 0x41300000    # 11.0f

    .line 178
    .line 179
    div-float/2addr v7, v9

    .line 180
    add-float v9, v0, v3

    .line 181
    .line 182
    float-to-double v9, v9

    .line 183
    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    .line 184
    .line 185
    mul-double/2addr v5, v13

    .line 186
    sub-double/2addr v9, v5

    .line 187
    double-to-float v5, v9

    .line 188
    const/high16 v6, 0x41100000    # 9.0f

    .line 189
    .line 190
    div-float/2addr v5, v6

    .line 191
    const/high16 v6, 0x41a00000    # 20.0f

    .line 192
    .line 193
    mul-float v9, v0, v6

    .line 194
    .line 195
    mul-float/2addr v3, v6

    .line 196
    add-float/2addr v9, v3

    .line 197
    const/high16 v10, 0x41a80000    # 21.0f

    .line 198
    .line 199
    mul-float/2addr v10, v4

    .line 200
    add-float/2addr v9, v10

    .line 201
    div-float/2addr v9, v6

    .line 202
    const/high16 v10, 0x42200000    # 40.0f

    .line 203
    .line 204
    mul-float/2addr v0, v10

    .line 205
    add-float/2addr v0, v3

    .line 206
    add-float/2addr v0, v4

    .line 207
    div-float/2addr v0, v6

    .line 208
    float-to-double v3, v5

    .line 209
    move v6, v8

    .line 210
    move v10, v9

    .line 211
    float-to-double v8, v7

    .line 212
    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    .line 213
    .line 214
    .line 215
    move-result-wide v3

    .line 216
    double-to-float v3, v3

    .line 217
    const/high16 v4, 0x43340000    # 180.0f

    .line 218
    .line 219
    mul-float/2addr v3, v4

    .line 220
    const v8, 0x40490fdb    # (float)Math.PI

    .line 221
    .line 222
    .line 223
    div-float/2addr v3, v8

    .line 224
    const/4 v9, 0x0

    .line 225
    cmpg-float v9, v3, v9

    .line 226
    .line 227
    const/high16 v15, 0x43b40000    # 360.0f

    .line 228
    .line 229
    if-gez v9, :cond_0

    .line 230
    .line 231
    add-float/2addr v3, v15

    .line 232
    goto :goto_0

    .line 233
    :cond_0
    cmpl-float v9, v3, v15

    .line 234
    .line 235
    if-ltz v9, :cond_1

    .line 236
    .line 237
    sub-float/2addr v3, v15

    .line 238
    :cond_1
    :goto_0
    mul-float/2addr v8, v3

    .line 239
    div-float/2addr v8, v4

    .line 240
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->f()F

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    mul-float/2addr v0, v4

    .line 245
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->a()F

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    div-float/2addr v0, v4

    .line 250
    move v9, v6

    .line 251
    move v4, v7

    .line 252
    float-to-double v6, v0

    .line 253
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->b()F

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->j()F

    .line 258
    .line 259
    .line 260
    move-result v16

    .line 261
    mul-float v0, v0, v16

    .line 262
    .line 263
    move/from16 v17, v9

    .line 264
    .line 265
    move/from16 v16, v10

    .line 266
    .line 267
    float-to-double v9, v0

    .line 268
    invoke-static {v6, v7, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 269
    .line 270
    .line 271
    move-result-wide v6

    .line 272
    double-to-float v0, v6

    .line 273
    const/high16 v6, 0x42c80000    # 100.0f

    .line 274
    .line 275
    mul-float/2addr v0, v6

    .line 276
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->b()F

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    const/high16 v9, 0x40800000    # 4.0f

    .line 281
    .line 282
    div-float v7, v9, v7

    .line 283
    .line 284
    div-float v6, v0, v6

    .line 285
    .line 286
    move/from16 v18, v9

    .line 287
    .line 288
    float-to-double v9, v6

    .line 289
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 290
    .line 291
    .line 292
    move-result-wide v9

    .line 293
    double-to-float v6, v9

    .line 294
    mul-float/2addr v7, v6

    .line 295
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->a()F

    .line 296
    .line 297
    .line 298
    move-result v6

    .line 299
    add-float v6, v6, v18

    .line 300
    .line 301
    mul-float/2addr v7, v6

    .line 302
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->d()F

    .line 303
    .line 304
    .line 305
    move-result v6

    .line 306
    mul-float/2addr v7, v6

    .line 307
    float-to-double v9, v3

    .line 308
    const-wide v19, 0x403423d70a3d70a4L    # 20.14

    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    cmpg-double v6, v9, v19

    .line 314
    .line 315
    if-gez v6, :cond_2

    .line 316
    .line 317
    add-float/2addr v15, v3

    .line 318
    goto :goto_1

    .line 319
    :cond_2
    move v15, v3

    .line 320
    :goto_1
    float-to-double v9, v15

    .line 321
    const-wide v19, 0x400921fb54442d18L    # Math.PI

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    mul-double v9, v9, v19

    .line 327
    .line 328
    const-wide v19, 0x4066800000000000L    # 180.0

    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    div-double v9, v9, v19

    .line 334
    .line 335
    add-double/2addr v9, v13

    .line 336
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 337
    .line 338
    .line 339
    move-result-wide v9

    .line 340
    const-wide v13, 0x400e666666666666L    # 3.8

    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    add-double/2addr v9, v13

    .line 346
    double-to-float v6, v9

    .line 347
    const/high16 v9, 0x3e800000    # 0.25f

    .line 348
    .line 349
    mul-float/2addr v6, v9

    .line 350
    const v9, 0x45706276

    .line 351
    .line 352
    .line 353
    mul-float/2addr v6, v9

    .line 354
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->g()F

    .line 355
    .line 356
    .line 357
    move-result v9

    .line 358
    mul-float/2addr v6, v9

    .line 359
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->h()F

    .line 360
    .line 361
    .line 362
    move-result v9

    .line 363
    mul-float/2addr v6, v9

    .line 364
    mul-float/2addr v4, v4

    .line 365
    mul-float/2addr v5, v5

    .line 366
    add-float/2addr v4, v5

    .line 367
    float-to-double v4, v4

    .line 368
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 369
    .line 370
    .line 371
    move-result-wide v4

    .line 372
    double-to-float v4, v4

    .line 373
    mul-float/2addr v6, v4

    .line 374
    const v4, 0x3e9c28f6    # 0.305f

    .line 375
    .line 376
    .line 377
    add-float v9, v16, v4

    .line 378
    .line 379
    div-float/2addr v6, v9

    .line 380
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->e()F

    .line 381
    .line 382
    .line 383
    move-result v4

    .line 384
    float-to-double v4, v4

    .line 385
    const-wide v9, 0x3fd28f5c28f5c28fL    # 0.29

    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 391
    .line 392
    .line 393
    move-result-wide v4

    .line 394
    const-wide v9, 0x3ffa3d70a3d70a3dL    # 1.64

    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    sub-double/2addr v9, v4

    .line 400
    const-wide v4, 0x3fe75c28f5c28f5cL    # 0.73

    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 406
    .line 407
    .line 408
    move-result-wide v4

    .line 409
    double-to-float v4, v4

    .line 410
    float-to-double v5, v6

    .line 411
    const-wide v9, 0x3feccccccccccccdL    # 0.9

    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 417
    .line 418
    .line 419
    move-result-wide v5

    .line 420
    double-to-float v5, v5

    .line 421
    mul-float/2addr v4, v5

    .line 422
    float-to-double v5, v0

    .line 423
    div-double/2addr v5, v11

    .line 424
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 425
    .line 426
    .line 427
    move-result-wide v5

    .line 428
    double-to-float v5, v5

    .line 429
    mul-float/2addr v5, v4

    .line 430
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->d()F

    .line 431
    .line 432
    .line 433
    move-result v6

    .line 434
    mul-float/2addr v6, v5

    .line 435
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->b()F

    .line 436
    .line 437
    .line 438
    move-result v9

    .line 439
    mul-float/2addr v4, v9

    .line 440
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->a()F

    .line 441
    .line 442
    .line 443
    move-result v9

    .line 444
    add-float v9, v9, v18

    .line 445
    .line 446
    div-float/2addr v4, v9

    .line 447
    float-to-double v9, v4

    .line 448
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 449
    .line 450
    .line 451
    move-result-wide v9

    .line 452
    double-to-float v4, v9

    .line 453
    const/high16 v9, 0x42480000    # 50.0f

    .line 454
    .line 455
    mul-float/2addr v4, v9

    .line 456
    const v9, 0x3fd9999a    # 1.7f

    .line 457
    .line 458
    .line 459
    mul-float/2addr v9, v0

    .line 460
    const v10, 0x3be56042    # 0.007f

    .line 461
    .line 462
    .line 463
    mul-float/2addr v10, v0

    .line 464
    const/high16 v11, 0x3f800000    # 1.0f

    .line 465
    .line 466
    add-float/2addr v10, v11

    .line 467
    div-float/2addr v9, v10

    .line 468
    const v10, 0x3cbac711    # 0.0228f

    .line 469
    .line 470
    .line 471
    mul-float/2addr v10, v6

    .line 472
    add-float/2addr v10, v11

    .line 473
    float-to-double v10, v10

    .line 474
    invoke-static {v10, v11}, Ljava/lang/Math;->log(D)D

    .line 475
    .line 476
    .line 477
    move-result-wide v10

    .line 478
    double-to-float v10, v10

    .line 479
    const v11, 0x422f7048

    .line 480
    .line 481
    .line 482
    mul-float/2addr v10, v11

    .line 483
    float-to-double v11, v8

    .line 484
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 485
    .line 486
    .line 487
    move-result-wide v13

    .line 488
    double-to-float v8, v13

    .line 489
    mul-float/2addr v8, v10

    .line 490
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 491
    .line 492
    .line 493
    move-result-wide v11

    .line 494
    double-to-float v11, v11

    .line 495
    mul-float/2addr v10, v11

    .line 496
    aput v3, v1, v2

    .line 497
    .line 498
    aput v5, v1, p0

    .line 499
    .line 500
    if-eqz p2, :cond_3

    .line 501
    .line 502
    aput v0, p2, v2

    .line 503
    .line 504
    aput v7, p2, p0

    .line 505
    .line 506
    aput v6, p2, v17

    .line 507
    .line 508
    const/4 v0, 0x3

    .line 509
    aput v4, p2, v0

    .line 510
    .line 511
    const/4 v0, 0x4

    .line 512
    aput v9, p2, v0

    .line 513
    .line 514
    const/4 v0, 0x5

    .line 515
    aput v8, p2, v0

    .line 516
    .line 517
    const/4 v0, 0x6

    .line 518
    aput v10, p2, v0

    .line 519
    .line 520
    :cond_3
    return-void
.end method

.method public static e(FFF)Ll/h94;
    .locals 1
    .param p0    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 100.0
        .end annotation
    .end param
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = Infinity
            toInclusive = false
        .end annotation
    .end param
    .param p2    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 360.0
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/xnl0;->k:Ll/xnl0;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Ll/h94;->f(FFFLl/xnl0;)Ll/h94;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static f(FFFLl/xnl0;)Ll/h94;
    .locals 12
    .param p0    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 100.0
        .end annotation
    .end param
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = Infinity
            toInclusive = false
        .end annotation
    .end param
    .param p2    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 360.0
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/xnl0;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40800000    # 4.0f

    .line 6
    .line 7
    div-float v0, v1, v0

    .line 8
    .line 9
    float-to-double v4, p0

    .line 10
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    .line 11
    .line 12
    div-double/2addr v4, v6

    .line 13
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v6

    .line 17
    double-to-float v2, v6

    .line 18
    mul-float/2addr v0, v2

    .line 19
    invoke-virtual {p3}, Ll/xnl0;->a()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-float/2addr v2, v1

    .line 24
    mul-float/2addr v0, v2

    .line 25
    invoke-virtual {p3}, Ll/xnl0;->d()F

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    mul-float/2addr v0, v2

    .line 30
    invoke-virtual {p3}, Ll/xnl0;->d()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    mul-float/2addr v2, p1

    .line 35
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    double-to-float v4, v4

    .line 40
    div-float v4, p1, v4

    .line 41
    .line 42
    invoke-virtual {p3}, Ll/xnl0;->b()F

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    mul-float/2addr v4, v5

    .line 47
    invoke-virtual {p3}, Ll/xnl0;->a()F

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    add-float/2addr v5, v1

    .line 52
    div-float/2addr v4, v5

    .line 53
    float-to-double v4, v4

    .line 54
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    double-to-float v1, v4

    .line 59
    const/high16 v4, 0x42480000    # 50.0f

    .line 60
    .line 61
    mul-float v6, v1, v4

    .line 62
    .line 63
    const v1, 0x40490fdb    # (float)Math.PI

    .line 64
    .line 65
    .line 66
    mul-float/2addr v1, p2

    .line 67
    const/high16 v4, 0x43340000    # 180.0f

    .line 68
    .line 69
    div-float/2addr v1, v4

    .line 70
    const v4, 0x3fd9999a    # 1.7f

    .line 71
    .line 72
    .line 73
    mul-float/2addr v4, p0

    .line 74
    const v5, 0x3be56042    # 0.007f

    .line 75
    .line 76
    .line 77
    mul-float/2addr v5, p0

    .line 78
    const/high16 v7, 0x3f800000    # 1.0f

    .line 79
    .line 80
    add-float/2addr v5, v7

    .line 81
    div-float v7, v4, v5

    .line 82
    .line 83
    const-wide v4, 0x3f9758e219652bd4L    # 0.0228

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    float-to-double v8, v2

    .line 89
    mul-double/2addr v8, v4

    .line 90
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 91
    .line 92
    add-double/2addr v8, v4

    .line 93
    invoke-static {v8, v9}, Ljava/lang/Math;->log(D)D

    .line 94
    .line 95
    .line 96
    move-result-wide v4

    .line 97
    double-to-float v4, v4

    .line 98
    const v5, 0x422f7048

    .line 99
    .line 100
    .line 101
    mul-float/2addr v4, v5

    .line 102
    float-to-double v8, v1

    .line 103
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    .line 104
    .line 105
    .line 106
    move-result-wide v10

    .line 107
    double-to-float v1, v10

    .line 108
    mul-float/2addr v1, v4

    .line 109
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    .line 110
    .line 111
    .line 112
    move-result-wide v8

    .line 113
    double-to-float v5, v8

    .line 114
    mul-float v9, v4, v5

    .line 115
    .line 116
    move v4, v0

    .line 117
    new-instance v0, Ll/h94;

    .line 118
    .line 119
    move v3, p0

    .line 120
    move v8, v1

    .line 121
    move v5, v2

    .line 122
    move v2, p1

    .line 123
    move v1, p2

    .line 124
    invoke-direct/range {v0 .. v9}, Ll/h94;-><init>(FFFFFFFFF)V

    .line 125
    .line 126
    .line 127
    return-object v0
.end method

.method public static m(FFF)I
    .locals 1
    .param p0    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 360.0
        .end annotation
    .end param
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = Infinity
            toInclusive = false
        .end annotation
    .end param
    .param p2    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 100.0
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/xnl0;->k:Ll/xnl0;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Ll/h94;->n(FFFLl/xnl0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static n(FFFLl/xnl0;)I
    .locals 6
    .param p0    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 360.0
        .end annotation
    .end param
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = Infinity
            toInclusive = false
        .end annotation
    .end param
    .param p2    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 100.0
        .end annotation
    .end param
    .param p3    # Ll/xnl0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    float-to-double v0, p1

    .line 2
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 3
    .line 4
    cmpg-double v0, v0, v2

    .line 5
    .line 6
    if-ltz v0, :cond_7

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-double v0, v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmpg-double v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_7

    .line 18
    .line 19
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-double v0, v0

    .line 24
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 25
    .line 26
    cmpl-double v0, v0, v2

    .line 27
    .line 28
    if-ltz v0, :cond_0

    .line 29
    .line 30
    goto :goto_3

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    cmpg-float v1, p0, v0

    .line 33
    .line 34
    if-gez v1, :cond_1

    .line 35
    .line 36
    move p0, v0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/high16 v1, 0x43b40000    # 360.0f

    .line 39
    .line 40
    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    :goto_0
    const/4 v1, 0x1

    .line 45
    const/4 v2, 0x0

    .line 46
    move-object v3, v2

    .line 47
    move v2, v1

    .line 48
    move v1, v0

    .line 49
    move v0, p1

    .line 50
    :goto_1
    sub-float v4, v1, p1

    .line 51
    .line 52
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    const v5, 0x3ecccccd    # 0.4f

    .line 57
    .line 58
    .line 59
    cmpl-float v4, v4, v5

    .line 60
    .line 61
    if-ltz v4, :cond_5

    .line 62
    .line 63
    invoke-static {p0, v0, p2}, Ll/h94;->b(FFF)Ll/h94;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/high16 v5, 0x40000000    # 2.0f

    .line 68
    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    if-eqz v4, :cond_2

    .line 72
    .line 73
    invoke-virtual {v4, p3}, Ll/h94;->o(Ll/xnl0;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_2
    sub-float v0, p1, v1

    .line 79
    .line 80
    div-float/2addr v0, v5

    .line 81
    add-float/2addr v0, v1

    .line 82
    const/4 v2, 0x0

    .line 83
    goto :goto_1

    .line 84
    :cond_3
    if-nez v4, :cond_4

    .line 85
    .line 86
    move p1, v0

    .line 87
    goto :goto_2

    .line 88
    :cond_4
    move v1, v0

    .line 89
    move-object v3, v4

    .line 90
    :goto_2
    sub-float v0, p1, v1

    .line 91
    .line 92
    div-float/2addr v0, v5

    .line 93
    add-float/2addr v0, v1

    .line 94
    goto :goto_1

    .line 95
    :cond_5
    if-nez v3, :cond_6

    .line 96
    .line 97
    invoke-static {p2}, Ll/i94;->a(F)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_6
    invoke-virtual {v3, p3}, Ll/h94;->o(Ll/xnl0;)I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    return p0

    .line 107
    :cond_7
    :goto_3
    invoke-static {p2}, Ll/i94;->a(F)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0
.end method


# virtual methods
.method public a(Ll/h94;)F
    .locals 3
    .param p1    # Ll/h94;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/h94;->l()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/h94;->l()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Ll/h94;->g()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Ll/h94;->g()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-float/2addr v1, v2

    .line 19
    invoke-virtual {p0}, Ll/h94;->h()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1}, Ll/h94;->h()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-float/2addr p0, p1

    .line 28
    mul-float/2addr v0, v0

    .line 29
    mul-float/2addr v1, v1

    .line 30
    add-float/2addr v0, v1

    .line 31
    mul-float/2addr p0, p0

    .line 32
    add-float/2addr v0, p0

    .line 33
    float-to-double p0, v0

    .line 34
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide p0

    .line 38
    const-wide v0, 0x3fe428f5c28f5c29L    # 0.63

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    const-wide v0, 0x3ff68f5c28f5c28fL    # 1.41

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    mul-double/2addr p0, v0

    .line 53
    double-to-float p0, p0

    .line 54
    return p0
.end method

.method public g()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = -Infinity
        fromInclusive = false
        to = Infinity
        toInclusive = false
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public h()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = -Infinity
        fromInclusive = false
        to = Infinity
        toInclusive = false
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public i()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = 0.0
        to = Infinity
        toInclusive = false
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public j()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = 0.0
        to = 360.0
        toInclusive = false
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public k()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = 0.0
        to = 100.0
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public l()F
    .locals 0
    .annotation build Landroidx/annotation/FloatRange;
        from = 0.0
        to = 100.0
    .end annotation

    .line 1
    iget p0, p0, Ll/h94;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public o(Ll/xnl0;)I
    .locals 17
    .param p1    # Ll/xnl0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Ll/h94;->i()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-double v0, v0

    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmpl-double v0, v0, v2

    .line 9
    .line 10
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual/range {p0 .. p0}, Ll/h94;->k()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    float-to-double v0, v0

    .line 19
    cmpl-double v0, v0, v2

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ll/h94;->i()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual/range {p0 .. p0}, Ll/h94;->k()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    float-to-double v6, v1

    .line 33
    div-double/2addr v6, v4

    .line 34
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide v6

    .line 38
    double-to-float v1, v6

    .line 39
    div-float/2addr v0, v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 42
    :goto_1
    float-to-double v0, v0

    .line 43
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->e()F

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    float-to-double v6, v6

    .line 48
    const-wide v8, 0x3fd28f5c28f5c28fL    # 0.29

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 54
    .line 55
    .line 56
    move-result-wide v6

    .line 57
    const-wide v8, 0x3ffa3d70a3d70a3dL    # 1.64

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    sub-double/2addr v8, v6

    .line 63
    const-wide v6, 0x3fe75c28f5c28f5cL    # 0.73

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 69
    .line 70
    .line 71
    move-result-wide v6

    .line 72
    div-double/2addr v0, v6

    .line 73
    const-wide v6, 0x3ff1c71c71c71c72L    # 1.1111111111111112

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    double-to-float v0, v0

    .line 83
    invoke-virtual/range {p0 .. p0}, Ll/h94;->j()F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const v6, 0x40490fdb    # (float)Math.PI

    .line 88
    .line 89
    .line 90
    mul-float/2addr v1, v6

    .line 91
    const/high16 v6, 0x43340000    # 180.0f

    .line 92
    .line 93
    div-float/2addr v1, v6

    .line 94
    float-to-double v6, v1

    .line 95
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 96
    .line 97
    add-double/2addr v8, v6

    .line 98
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    .line 99
    .line 100
    .line 101
    move-result-wide v8

    .line 102
    const-wide v10, 0x400e666666666666L    # 3.8

    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    add-double/2addr v8, v10

    .line 108
    double-to-float v1, v8

    .line 109
    const/high16 v8, 0x3e800000    # 0.25f

    .line 110
    .line 111
    mul-float/2addr v1, v8

    .line 112
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->a()F

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    invoke-virtual/range {p0 .. p0}, Ll/h94;->k()F

    .line 117
    .line 118
    .line 119
    move-result v9

    .line 120
    float-to-double v9, v9

    .line 121
    div-double/2addr v9, v4

    .line 122
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->b()F

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    float-to-double v4, v4

    .line 127
    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    .line 128
    .line 129
    div-double/2addr v11, v4

    .line 130
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->j()F

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    float-to-double v4, v4

    .line 135
    div-double/2addr v11, v4

    .line 136
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    .line 137
    .line 138
    .line 139
    move-result-wide v4

    .line 140
    double-to-float v4, v4

    .line 141
    mul-float/2addr v8, v4

    .line 142
    const v4, 0x45706276

    .line 143
    .line 144
    .line 145
    mul-float/2addr v1, v4

    .line 146
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->g()F

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    mul-float/2addr v1, v4

    .line 151
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->h()F

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    mul-float/2addr v1, v4

    .line 156
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->f()F

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    div-float/2addr v8, v4

    .line 161
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 162
    .line 163
    .line 164
    move-result-wide v4

    .line 165
    double-to-float v4, v4

    .line 166
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    .line 167
    .line 168
    .line 169
    move-result-wide v5

    .line 170
    double-to-float v5, v5

    .line 171
    const v6, 0x3e9c28f6    # 0.305f

    .line 172
    .line 173
    .line 174
    add-float/2addr v6, v8

    .line 175
    const/high16 v7, 0x41b80000    # 23.0f

    .line 176
    .line 177
    mul-float/2addr v6, v7

    .line 178
    mul-float/2addr v6, v0

    .line 179
    mul-float/2addr v1, v7

    .line 180
    const/high16 v7, 0x41300000    # 11.0f

    .line 181
    .line 182
    mul-float/2addr v7, v0

    .line 183
    mul-float/2addr v7, v5

    .line 184
    add-float/2addr v1, v7

    .line 185
    const/high16 v7, 0x42d80000    # 108.0f

    .line 186
    .line 187
    mul-float/2addr v0, v7

    .line 188
    mul-float/2addr v0, v4

    .line 189
    add-float/2addr v1, v0

    .line 190
    div-float/2addr v6, v1

    .line 191
    mul-float/2addr v5, v6

    .line 192
    mul-float/2addr v6, v4

    .line 193
    const/high16 v0, 0x43e60000    # 460.0f

    .line 194
    .line 195
    mul-float/2addr v8, v0

    .line 196
    const v0, 0x43e18000    # 451.0f

    .line 197
    .line 198
    .line 199
    mul-float/2addr v0, v5

    .line 200
    add-float/2addr v0, v8

    .line 201
    const/high16 v1, 0x43900000    # 288.0f

    .line 202
    .line 203
    mul-float/2addr v1, v6

    .line 204
    add-float/2addr v0, v1

    .line 205
    const v1, 0x44af6000    # 1403.0f

    .line 206
    .line 207
    .line 208
    div-float/2addr v0, v1

    .line 209
    const v4, 0x445ec000    # 891.0f

    .line 210
    .line 211
    .line 212
    mul-float/2addr v4, v5

    .line 213
    sub-float v4, v8, v4

    .line 214
    .line 215
    const v7, 0x43828000    # 261.0f

    .line 216
    .line 217
    .line 218
    mul-float/2addr v7, v6

    .line 219
    sub-float/2addr v4, v7

    .line 220
    div-float/2addr v4, v1

    .line 221
    const/high16 v7, 0x435c0000    # 220.0f

    .line 222
    .line 223
    mul-float/2addr v5, v7

    .line 224
    sub-float/2addr v8, v5

    .line 225
    const v5, 0x45c4e000    # 6300.0f

    .line 226
    .line 227
    .line 228
    mul-float/2addr v6, v5

    .line 229
    sub-float/2addr v8, v6

    .line 230
    div-float/2addr v8, v1

    .line 231
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    float-to-double v5, v1

    .line 236
    const-wide v9, 0x403b2147ae147ae1L    # 27.13

    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    mul-double/2addr v5, v9

    .line 242
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    float-to-double v11, v1

    .line 247
    const-wide/high16 v13, 0x4079000000000000L    # 400.0

    .line 248
    .line 249
    sub-double v11, v13, v11

    .line 250
    .line 251
    div-double/2addr v5, v11

    .line 252
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    .line 253
    .line 254
    .line 255
    move-result-wide v5

    .line 256
    double-to-float v1, v5

    .line 257
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    const/high16 v6, 0x42c80000    # 100.0f

    .line 266
    .line 267
    div-float v5, v6, v5

    .line 268
    .line 269
    mul-float/2addr v0, v5

    .line 270
    float-to-double v11, v1

    .line 271
    move/from16 p0, v6

    .line 272
    .line 273
    const-wide v6, 0x40030c30c30c30c3L    # 2.380952380952381

    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    invoke-static {v11, v12, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 279
    .line 280
    .line 281
    move-result-wide v11

    .line 282
    double-to-float v1, v11

    .line 283
    mul-float/2addr v0, v1

    .line 284
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    float-to-double v11, v1

    .line 289
    mul-double/2addr v11, v9

    .line 290
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    move-wide v15, v9

    .line 295
    float-to-double v9, v1

    .line 296
    sub-double v9, v13, v9

    .line 297
    .line 298
    div-double/2addr v11, v9

    .line 299
    invoke-static {v2, v3, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 300
    .line 301
    .line 302
    move-result-wide v9

    .line 303
    double-to-float v1, v9

    .line 304
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 309
    .line 310
    .line 311
    move-result v5

    .line 312
    div-float v5, p0, v5

    .line 313
    .line 314
    mul-float/2addr v4, v5

    .line 315
    float-to-double v9, v1

    .line 316
    invoke-static {v9, v10, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 317
    .line 318
    .line 319
    move-result-wide v9

    .line 320
    double-to-float v1, v9

    .line 321
    mul-float/2addr v4, v1

    .line 322
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    float-to-double v9, v1

    .line 327
    mul-double/2addr v9, v15

    .line 328
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    float-to-double v11, v1

    .line 333
    sub-double/2addr v13, v11

    .line 334
    div-double/2addr v9, v13

    .line 335
    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->max(DD)D

    .line 336
    .line 337
    .line 338
    move-result-wide v1

    .line 339
    double-to-float v1, v1

    .line 340
    invoke-static {v8}, Ljava/lang/Math;->signum(F)F

    .line 341
    .line 342
    .line 343
    move-result v2

    .line 344
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->c()F

    .line 345
    .line 346
    .line 347
    move-result v3

    .line 348
    div-float v3, p0, v3

    .line 349
    .line 350
    mul-float/2addr v2, v3

    .line 351
    float-to-double v8, v1

    .line 352
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 353
    .line 354
    .line 355
    move-result-wide v5

    .line 356
    double-to-float v1, v5

    .line 357
    mul-float/2addr v2, v1

    .line 358
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    const/4 v3, 0x0

    .line 363
    aget v1, v1, v3

    .line 364
    .line 365
    div-float/2addr v0, v1

    .line 366
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    const/4 v5, 0x1

    .line 371
    aget v1, v1, v5

    .line 372
    .line 373
    div-float/2addr v4, v1

    .line 374
    invoke-virtual/range {p1 .. p1}, Ll/xnl0;->i()[F

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    const/4 v6, 0x2

    .line 379
    aget v1, v1, v6

    .line 380
    .line 381
    div-float/2addr v2, v1

    .line 382
    sget-object v1, Ll/i94;->b:[[F

    .line 383
    .line 384
    aget-object v7, v1, v3

    .line 385
    .line 386
    aget v8, v7, v3

    .line 387
    .line 388
    mul-float/2addr v8, v0

    .line 389
    aget v9, v7, v5

    .line 390
    .line 391
    mul-float/2addr v9, v4

    .line 392
    add-float/2addr v8, v9

    .line 393
    aget v7, v7, v6

    .line 394
    .line 395
    mul-float/2addr v7, v2

    .line 396
    add-float/2addr v8, v7

    .line 397
    aget-object v7, v1, v5

    .line 398
    .line 399
    aget v9, v7, v3

    .line 400
    .line 401
    mul-float/2addr v9, v0

    .line 402
    aget v10, v7, v5

    .line 403
    .line 404
    mul-float/2addr v10, v4

    .line 405
    add-float/2addr v9, v10

    .line 406
    aget v7, v7, v6

    .line 407
    .line 408
    mul-float/2addr v7, v2

    .line 409
    add-float/2addr v9, v7

    .line 410
    aget-object v1, v1, v6

    .line 411
    .line 412
    aget v3, v1, v3

    .line 413
    .line 414
    mul-float/2addr v0, v3

    .line 415
    aget v3, v1, v5

    .line 416
    .line 417
    mul-float/2addr v4, v3

    .line 418
    add-float/2addr v0, v4

    .line 419
    aget v1, v1, v6

    .line 420
    .line 421
    mul-float/2addr v2, v1

    .line 422
    add-float/2addr v0, v2

    .line 423
    float-to-double v1, v8

    .line 424
    float-to-double v3, v9

    .line 425
    float-to-double v5, v0

    .line 426
    invoke-static/range {v1 .. v6}, Ll/gf5;->c(DDD)I

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    return v0
.end method

.method public p()I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    sget-object v0, Ll/xnl0;->k:Ll/xnl0;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/h94;->o(Ll/xnl0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
