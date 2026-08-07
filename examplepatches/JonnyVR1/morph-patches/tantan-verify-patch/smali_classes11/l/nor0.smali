.class public final Ll/nor0;
.super Ll/lor0;
.source "SourceFile"


# instance fields
.field public n:Ll/mor0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:I

.field public p:Z

.field public q:Ll/xgr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:Ll/vgr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lor0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;)J
    .locals 12

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    aget-byte v0, v0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    and-int/2addr v0, v2

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    const-wide/16 p0, -0x1

    .line 13
    .line 14
    return-wide p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    aget-byte v0, v0, v1

    .line 20
    .line 21
    iget-object v3, p0, Ll/nor0;->n:Ll/mor0;

    .line 22
    .line 23
    invoke-static {v3}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    shr-int/2addr v0, v2

    .line 27
    iget v4, v3, Ll/mor0;->e:I

    .line 28
    .line 29
    iget-object v5, v3, Ll/mor0;->d:[Ll/wgr0;

    .line 30
    .line 31
    const/16 v6, 0xff

    .line 32
    .line 33
    const/16 v7, 0x8

    .line 34
    .line 35
    rsub-int/lit8 v4, v4, 0x8

    .line 36
    .line 37
    ushr-int v4, v6, v4

    .line 38
    .line 39
    and-int/2addr v0, v4

    .line 40
    aget-object v0, v5, v0

    .line 41
    .line 42
    iget-boolean v0, v0, Ll/wgr0;->a:Z

    .line 43
    .line 44
    iget-object v3, v3, Ll/mor0;->a:Ll/xgr0;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget v0, v3, Ll/xgr0;->e:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget v0, v3, Ll/xgr0;->f:I

    .line 52
    .line 53
    :goto_0
    iget-boolean v3, p0, Ll/nor0;->p:Z

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    iget v1, p0, Ll/nor0;->o:I

    .line 58
    .line 59
    add-int/2addr v1, v0

    .line 60
    div-int/lit8 v1, v1, 0x4

    .line 61
    .line 62
    :cond_2
    invoke-virtual {p1}, Ll/bgw0;->r()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    add-int/lit8 v4, v4, 0x4

    .line 71
    .line 72
    if-ge v3, v4, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    add-int/lit8 v4, v4, 0x4

    .line 83
    .line 84
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    array-length v4, v3

    .line 89
    invoke-virtual {p1, v3, v4}, Ll/bgw0;->i([BI)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    add-int/lit8 v3, v3, 0x4

    .line 98
    .line 99
    invoke-virtual {p1, v3}, Ll/bgw0;->j(I)V

    .line 100
    .line 101
    .line 102
    :goto_1
    int-to-long v3, v1

    .line 103
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    add-int/lit8 v5, v5, -0x4

    .line 112
    .line 113
    const-wide/16 v8, 0xff

    .line 114
    .line 115
    and-long v10, v3, v8

    .line 116
    .line 117
    long-to-int v6, v10

    .line 118
    int-to-byte v6, v6

    .line 119
    aput-byte v6, v1, v5

    .line 120
    .line 121
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    add-int/lit8 v5, v5, -0x3

    .line 126
    .line 127
    ushr-long v6, v3, v7

    .line 128
    .line 129
    and-long/2addr v6, v8

    .line 130
    long-to-int v6, v6

    .line 131
    int-to-byte v6, v6

    .line 132
    aput-byte v6, v1, v5

    .line 133
    .line 134
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    add-int/lit8 v5, v5, -0x2

    .line 139
    .line 140
    const/16 v6, 0x10

    .line 141
    .line 142
    ushr-long v6, v3, v6

    .line 143
    .line 144
    and-long/2addr v6, v8

    .line 145
    long-to-int v6, v6

    .line 146
    int-to-byte v6, v6

    .line 147
    aput-byte v6, v1, v5

    .line 148
    .line 149
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    add-int/lit8 p1, p1, -0x1

    .line 154
    .line 155
    const/16 v5, 0x18

    .line 156
    .line 157
    ushr-long v5, v3, v5

    .line 158
    .line 159
    and-long/2addr v5, v8

    .line 160
    long-to-int v5, v5

    .line 161
    int-to-byte v5, v5

    .line 162
    aput-byte v5, v1, p1

    .line 163
    .line 164
    iput-boolean v2, p0, Ll/nor0;->p:Z

    .line 165
    .line 166
    iput v0, p0, Ll/nor0;->o:I

    .line 167
    .line 168
    return-wide v3
.end method

.method public final b(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lor0;->b(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/nor0;->n:Ll/mor0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/nor0;->q:Ll/xgr0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/nor0;->r:Ll/vgr0;

    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Ll/nor0;->o:I

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/nor0;->p:Z

    .line 17
    .line 18
    return-void
.end method

.method public final c(Ll/bgw0;JLl/ior0;)Z
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "#3.format"
        }
        result = false
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    iget-object v3, v0, Ll/nor0;->n:Ll/mor0;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    iget-object v0, v2, Ll/ior0;->a:Ll/sqr0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    return v4

    .line 18
    :cond_0
    iget-object v6, v0, Ll/nor0;->q:Ll/xgr0;

    .line 19
    .line 20
    const/4 v11, 0x1

    .line 21
    if-nez v6, :cond_5

    .line 22
    .line 23
    invoke-static {v11, v1, v4}, Ll/ygr0;->d(ILl/bgw0;Z)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ll/bgw0;->y()I

    .line 27
    .line 28
    .line 29
    move-result v13

    .line 30
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 31
    .line 32
    .line 33
    move-result v14

    .line 34
    invoke-virtual {v1}, Ll/bgw0;->y()I

    .line 35
    .line 36
    .line 37
    move-result v15

    .line 38
    invoke-virtual {v1}, Ll/bgw0;->x()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-gtz v6, :cond_1

    .line 43
    .line 44
    const/16 v16, -0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move/from16 v16, v6

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v1}, Ll/bgw0;->x()I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-gtz v6, :cond_2

    .line 54
    .line 55
    const/16 v17, -0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move/from16 v17, v6

    .line 59
    .line 60
    :goto_1
    invoke-virtual {v1}, Ll/bgw0;->x()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-gtz v6, :cond_3

    .line 65
    .line 66
    const/16 v18, -0x1

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_3
    move/from16 v18, v6

    .line 70
    .line 71
    :goto_2
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    and-int/lit8 v6, v3, 0xf

    .line 76
    .line 77
    int-to-double v8, v6

    .line 78
    const/16 p2, 0x4

    .line 79
    .line 80
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 81
    .line 82
    invoke-static {v5, v6, v8, v9}, Ljava/lang/Math;->pow(DD)D

    .line 83
    .line 84
    .line 85
    move-result-wide v8

    .line 86
    double-to-int v8, v8

    .line 87
    and-int/lit16 v3, v3, 0xf0

    .line 88
    .line 89
    shr-int/lit8 v3, v3, 0x4

    .line 90
    .line 91
    int-to-double v9, v3

    .line 92
    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 93
    .line 94
    .line 95
    move-result-wide v5

    .line 96
    double-to-int v3, v5

    .line 97
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    and-int/2addr v5, v11

    .line 102
    if-eq v11, v5, :cond_4

    .line 103
    .line 104
    move/from16 v21, v4

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_4
    move/from16 v21, v11

    .line 108
    .line 109
    :goto_3
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v1}, Ll/bgw0;->t()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-static {v4, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 118
    .line 119
    .line 120
    move-result-object v22

    .line 121
    new-instance v12, Ll/xgr0;

    .line 122
    .line 123
    move/from16 v20, v3

    .line 124
    .line 125
    move/from16 v19, v8

    .line 126
    .line 127
    invoke-direct/range {v12 .. v22}, Ll/xgr0;-><init>(IIIIIIIIZ[B)V

    .line 128
    .line 129
    .line 130
    iput-object v12, v0, Ll/nor0;->q:Ll/xgr0;

    .line 131
    .line 132
    :goto_4
    const/4 v7, 0x0

    .line 133
    goto/16 :goto_22

    .line 134
    .line 135
    :cond_5
    const/16 p2, 0x4

    .line 136
    .line 137
    iget-object v5, v0, Ll/nor0;->r:Ll/vgr0;

    .line 138
    .line 139
    if-nez v5, :cond_6

    .line 140
    .line 141
    invoke-static {v1, v11, v11}, Ll/ygr0;->c(Ll/bgw0;ZZ)Ll/vgr0;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iput-object v1, v0, Ll/nor0;->r:Ll/vgr0;

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_6
    invoke-virtual {v1}, Ll/bgw0;->t()I

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    new-array v8, v8, [B

    .line 153
    .line 154
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 155
    .line 156
    .line 157
    move-result-object v9

    .line 158
    invoke-virtual {v1}, Ll/bgw0;->t()I

    .line 159
    .line 160
    .line 161
    move-result v10

    .line 162
    invoke-static {v9, v4, v8, v4, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 163
    .line 164
    .line 165
    iget v9, v6, Ll/xgr0;->a:I

    .line 166
    .line 167
    const/4 v10, 0x5

    .line 168
    invoke-static {v10, v1, v4}, Ll/ygr0;->d(ILl/bgw0;Z)Z

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 172
    .line 173
    .line 174
    move-result v12

    .line 175
    add-int/2addr v12, v11

    .line 176
    new-instance v13, Ll/ugr0;

    .line 177
    .line 178
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 179
    .line 180
    .line 181
    move-result-object v14

    .line 182
    invoke-direct {v13, v14}, Ll/ugr0;-><init>([B)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    const/16 v14, 0x8

    .line 190
    .line 191
    mul-int/2addr v1, v14

    .line 192
    invoke-virtual {v13, v1}, Ll/ugr0;->c(I)V

    .line 193
    .line 194
    .line 195
    move v1, v4

    .line 196
    :goto_5
    const/16 v15, 0x18

    .line 197
    .line 198
    const/4 v3, 0x2

    .line 199
    const/16 v4, 0x10

    .line 200
    .line 201
    if-ge v1, v12, :cond_11

    .line 202
    .line 203
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 204
    .line 205
    .line 206
    move-result v14

    .line 207
    const v7, 0x564342

    .line 208
    .line 209
    .line 210
    if-ne v14, v7, :cond_10

    .line 211
    .line 212
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 217
    .line 218
    .line 219
    move-result v7

    .line 220
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 221
    .line 222
    .line 223
    move-result v14

    .line 224
    if-nez v14, :cond_a

    .line 225
    .line 226
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 227
    .line 228
    .line 229
    move-result v14

    .line 230
    const/4 v15, 0x0

    .line 231
    :goto_6
    if-ge v15, v7, :cond_9

    .line 232
    .line 233
    if-eqz v14, :cond_7

    .line 234
    .line 235
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 236
    .line 237
    .line 238
    move-result v18

    .line 239
    if-eqz v18, :cond_8

    .line 240
    .line 241
    invoke-virtual {v13, v10}, Ll/ugr0;->c(I)V

    .line 242
    .line 243
    .line 244
    goto :goto_7

    .line 245
    :cond_7
    invoke-virtual {v13, v10}, Ll/ugr0;->c(I)V

    .line 246
    .line 247
    .line 248
    :cond_8
    :goto_7
    add-int/lit8 v15, v15, 0x1

    .line 249
    .line 250
    goto :goto_6

    .line 251
    :cond_9
    move/from16 v14, p2

    .line 252
    .line 253
    goto :goto_9

    .line 254
    :cond_a
    invoke-virtual {v13, v10}, Ll/ugr0;->c(I)V

    .line 255
    .line 256
    .line 257
    const/4 v14, 0x0

    .line 258
    :goto_8
    if-ge v14, v7, :cond_9

    .line 259
    .line 260
    sub-int v15, v7, v14

    .line 261
    .line 262
    invoke-static {v15}, Ll/ygr0;->a(I)I

    .line 263
    .line 264
    .line 265
    move-result v15

    .line 266
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 267
    .line 268
    .line 269
    move-result v15

    .line 270
    add-int/2addr v14, v15

    .line 271
    goto :goto_8

    .line 272
    :goto_9
    invoke-virtual {v13, v14}, Ll/ugr0;->b(I)I

    .line 273
    .line 274
    .line 275
    move-result v15

    .line 276
    if-gt v15, v3, :cond_f

    .line 277
    .line 278
    if-eq v15, v11, :cond_c

    .line 279
    .line 280
    if-ne v15, v3, :cond_b

    .line 281
    .line 282
    goto :goto_a

    .line 283
    :cond_b
    move v14, v11

    .line 284
    goto :goto_c

    .line 285
    :cond_c
    move v3, v15

    .line 286
    :goto_a
    const/16 v15, 0x20

    .line 287
    .line 288
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v13, v14}, Ll/ugr0;->b(I)I

    .line 295
    .line 296
    .line 297
    move-result v15

    .line 298
    add-int/2addr v15, v11

    .line 299
    invoke-virtual {v13, v11}, Ll/ugr0;->c(I)V

    .line 300
    .line 301
    .line 302
    if-ne v3, v11, :cond_e

    .line 303
    .line 304
    if-eqz v4, :cond_d

    .line 305
    .line 306
    move v14, v11

    .line 307
    int-to-long v10, v7

    .line 308
    int-to-long v3, v4

    .line 309
    long-to-double v3, v3

    .line 310
    long-to-double v10, v10

    .line 311
    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    .line 312
    .line 313
    div-double v3, v19, v3

    .line 314
    .line 315
    invoke-static {v10, v11, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 316
    .line 317
    .line 318
    move-result-wide v3

    .line 319
    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    .line 320
    .line 321
    .line 322
    move-result-wide v3

    .line 323
    double-to-long v3, v3

    .line 324
    goto :goto_b

    .line 325
    :cond_d
    move v14, v11

    .line 326
    const-wide/16 v3, 0x0

    .line 327
    .line 328
    goto :goto_b

    .line 329
    :cond_e
    move v14, v11

    .line 330
    int-to-long v3, v4

    .line 331
    int-to-long v10, v7

    .line 332
    mul-long/2addr v3, v10

    .line 333
    :goto_b
    int-to-long v10, v15

    .line 334
    mul-long/2addr v3, v10

    .line 335
    long-to-int v3, v3

    .line 336
    invoke-virtual {v13, v3}, Ll/ugr0;->c(I)V

    .line 337
    .line 338
    .line 339
    :goto_c
    add-int/lit8 v1, v1, 0x1

    .line 340
    .line 341
    move v11, v14

    .line 342
    const/16 p2, 0x4

    .line 343
    .line 344
    const/4 v4, 0x0

    .line 345
    const/4 v10, 0x5

    .line 346
    const/16 v14, 0x8

    .line 347
    .line 348
    goto/16 :goto_5

    .line 349
    .line 350
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    const-string v1, "lookup type greater than 2 not decodable: "

    .line 353
    .line 354
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    const/4 v1, 0x0

    .line 365
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    throw v0

    .line 370
    :cond_10
    const/4 v1, 0x0

    .line 371
    invoke-virtual {v13}, Ll/ugr0;->a()I

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    new-instance v2, Ljava/lang/StringBuilder;

    .line 376
    .line 377
    const-string v3, "expected code book to start with [0x56, 0x43, 0x42] at "

    .line 378
    .line 379
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    throw v0

    .line 394
    :cond_11
    move v14, v11

    .line 395
    const/4 v1, 0x6

    .line 396
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 397
    .line 398
    .line 399
    move-result v7

    .line 400
    add-int/2addr v7, v14

    .line 401
    const/4 v10, 0x0

    .line 402
    :goto_d
    if-ge v10, v7, :cond_13

    .line 403
    .line 404
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 405
    .line 406
    .line 407
    move-result v11

    .line 408
    if-nez v11, :cond_12

    .line 409
    .line 410
    add-int/lit8 v10, v10, 0x1

    .line 411
    .line 412
    goto :goto_d

    .line 413
    :cond_12
    const-string v0, "placeholder of time domain transforms not zeroed out"

    .line 414
    .line 415
    const/4 v1, 0x0

    .line 416
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    throw v0

    .line 421
    :cond_13
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 422
    .line 423
    .line 424
    move-result v7

    .line 425
    add-int/2addr v7, v14

    .line 426
    const/4 v10, 0x0

    .line 427
    :goto_e
    const/4 v11, 0x3

    .line 428
    if-ge v10, v7, :cond_1d

    .line 429
    .line 430
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 431
    .line 432
    .line 433
    move-result v12

    .line 434
    if-eqz v12, :cond_1b

    .line 435
    .line 436
    if-ne v12, v14, :cond_1a

    .line 437
    .line 438
    const/4 v14, 0x5

    .line 439
    invoke-virtual {v13, v14}, Ll/ugr0;->b(I)I

    .line 440
    .line 441
    .line 442
    move-result v12

    .line 443
    new-array v14, v12, [I

    .line 444
    .line 445
    const/4 v1, -0x1

    .line 446
    const/4 v15, 0x0

    .line 447
    :goto_f
    if-ge v15, v12, :cond_15

    .line 448
    .line 449
    const/4 v4, 0x4

    .line 450
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 451
    .line 452
    .line 453
    move-result v3

    .line 454
    aput v3, v14, v15

    .line 455
    .line 456
    if-le v3, v1, :cond_14

    .line 457
    .line 458
    move v1, v3

    .line 459
    :cond_14
    add-int/lit8 v15, v15, 0x1

    .line 460
    .line 461
    const/4 v3, 0x2

    .line 462
    const/16 v4, 0x10

    .line 463
    .line 464
    goto :goto_f

    .line 465
    :cond_15
    add-int/lit8 v1, v1, 0x1

    .line 466
    .line 467
    new-array v3, v1, [I

    .line 468
    .line 469
    const/4 v4, 0x0

    .line 470
    :goto_10
    if-ge v4, v1, :cond_18

    .line 471
    .line 472
    invoke-virtual {v13, v11}, Ll/ugr0;->b(I)I

    .line 473
    .line 474
    .line 475
    move-result v15

    .line 476
    const/16 v19, 0x1

    .line 477
    .line 478
    add-int/lit8 v15, v15, 0x1

    .line 479
    .line 480
    aput v15, v3, v4

    .line 481
    .line 482
    const/4 v15, 0x2

    .line 483
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 484
    .line 485
    .line 486
    move-result v23

    .line 487
    if-lez v23, :cond_16

    .line 488
    .line 489
    const/16 v15, 0x8

    .line 490
    .line 491
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 492
    .line 493
    .line 494
    :goto_11
    move/from16 v24, v1

    .line 495
    .line 496
    const/4 v11, 0x0

    .line 497
    goto :goto_12

    .line 498
    :cond_16
    const/16 v15, 0x8

    .line 499
    .line 500
    goto :goto_11

    .line 501
    :goto_12
    shl-int v1, v19, v23

    .line 502
    .line 503
    move-object/from16 v19, v14

    .line 504
    .line 505
    if-ge v11, v1, :cond_17

    .line 506
    .line 507
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 508
    .line 509
    .line 510
    add-int/lit8 v11, v11, 0x1

    .line 511
    .line 512
    move-object/from16 v14, v19

    .line 513
    .line 514
    const/16 v15, 0x8

    .line 515
    .line 516
    const/16 v19, 0x1

    .line 517
    .line 518
    goto :goto_12

    .line 519
    :cond_17
    add-int/lit8 v4, v4, 0x1

    .line 520
    .line 521
    move-object/from16 v14, v19

    .line 522
    .line 523
    move/from16 v1, v24

    .line 524
    .line 525
    const/4 v11, 0x3

    .line 526
    goto :goto_10

    .line 527
    :cond_18
    move-object/from16 v19, v14

    .line 528
    .line 529
    const/4 v15, 0x2

    .line 530
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 531
    .line 532
    .line 533
    const/4 v4, 0x4

    .line 534
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    const/4 v4, 0x0

    .line 539
    const/4 v11, 0x0

    .line 540
    const/4 v15, 0x0

    .line 541
    :goto_13
    if-ge v4, v12, :cond_1c

    .line 542
    .line 543
    aget v23, v19, v4

    .line 544
    .line 545
    aget v23, v3, v23

    .line 546
    .line 547
    add-int v11, v11, v23

    .line 548
    .line 549
    :goto_14
    if-ge v15, v11, :cond_19

    .line 550
    .line 551
    invoke-virtual {v13, v1}, Ll/ugr0;->c(I)V

    .line 552
    .line 553
    .line 554
    add-int/lit8 v15, v15, 0x1

    .line 555
    .line 556
    goto :goto_14

    .line 557
    :cond_19
    add-int/lit8 v4, v4, 0x1

    .line 558
    .line 559
    goto :goto_13

    .line 560
    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 561
    .line 562
    const-string v1, "floor type greater than 1 not decodable: "

    .line 563
    .line 564
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    const/4 v1, 0x0

    .line 575
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 576
    .line 577
    .line 578
    move-result-object v0

    .line 579
    throw v0

    .line 580
    :cond_1b
    const/16 v15, 0x8

    .line 581
    .line 582
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 583
    .line 584
    .line 585
    const/16 v1, 0x10

    .line 586
    .line 587
    invoke-virtual {v13, v1}, Ll/ugr0;->c(I)V

    .line 588
    .line 589
    .line 590
    invoke-virtual {v13, v1}, Ll/ugr0;->c(I)V

    .line 591
    .line 592
    .line 593
    const/4 v1, 0x6

    .line 594
    invoke-virtual {v13, v1}, Ll/ugr0;->c(I)V

    .line 595
    .line 596
    .line 597
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 598
    .line 599
    .line 600
    const/4 v4, 0x4

    .line 601
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 602
    .line 603
    .line 604
    move-result v1

    .line 605
    const/4 v14, 0x1

    .line 606
    add-int/2addr v1, v14

    .line 607
    const/4 v3, 0x0

    .line 608
    :goto_15
    if-ge v3, v1, :cond_1c

    .line 609
    .line 610
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 611
    .line 612
    .line 613
    add-int/lit8 v3, v3, 0x1

    .line 614
    .line 615
    const/16 v15, 0x8

    .line 616
    .line 617
    goto :goto_15

    .line 618
    :cond_1c
    add-int/lit8 v10, v10, 0x1

    .line 619
    .line 620
    const/4 v1, 0x6

    .line 621
    const/4 v3, 0x2

    .line 622
    const/16 v4, 0x10

    .line 623
    .line 624
    const/4 v14, 0x1

    .line 625
    const/16 v15, 0x18

    .line 626
    .line 627
    goto/16 :goto_e

    .line 628
    .line 629
    :cond_1d
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 630
    .line 631
    .line 632
    move-result v3

    .line 633
    const/4 v14, 0x1

    .line 634
    add-int/2addr v3, v14

    .line 635
    const/4 v4, 0x0

    .line 636
    :goto_16
    if-ge v4, v3, :cond_24

    .line 637
    .line 638
    const/16 v7, 0x10

    .line 639
    .line 640
    invoke-virtual {v13, v7}, Ll/ugr0;->b(I)I

    .line 641
    .line 642
    .line 643
    move-result v10

    .line 644
    const/4 v15, 0x2

    .line 645
    if-gt v10, v15, :cond_23

    .line 646
    .line 647
    const/16 v7, 0x18

    .line 648
    .line 649
    invoke-virtual {v13, v7}, Ll/ugr0;->c(I)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v13, v7}, Ll/ugr0;->c(I)V

    .line 653
    .line 654
    .line 655
    invoke-virtual {v13, v7}, Ll/ugr0;->c(I)V

    .line 656
    .line 657
    .line 658
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 659
    .line 660
    .line 661
    move-result v10

    .line 662
    add-int/2addr v10, v14

    .line 663
    const/16 v15, 0x8

    .line 664
    .line 665
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 666
    .line 667
    .line 668
    new-array v1, v10, [I

    .line 669
    .line 670
    const/4 v11, 0x0

    .line 671
    :goto_17
    if-ge v11, v10, :cond_1f

    .line 672
    .line 673
    const/4 v12, 0x3

    .line 674
    invoke-virtual {v13, v12}, Ll/ugr0;->b(I)I

    .line 675
    .line 676
    .line 677
    move-result v19

    .line 678
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 679
    .line 680
    .line 681
    move-result v20

    .line 682
    if-eqz v20, :cond_1e

    .line 683
    .line 684
    const/4 v7, 0x5

    .line 685
    invoke-virtual {v13, v7}, Ll/ugr0;->b(I)I

    .line 686
    .line 687
    .line 688
    move-result v18

    .line 689
    goto :goto_18

    .line 690
    :cond_1e
    const/4 v7, 0x5

    .line 691
    const/16 v18, 0x0

    .line 692
    .line 693
    :goto_18
    mul-int/lit8 v18, v18, 0x8

    .line 694
    .line 695
    add-int v18, v18, v19

    .line 696
    .line 697
    aput v18, v1, v11

    .line 698
    .line 699
    add-int/lit8 v11, v11, 0x1

    .line 700
    .line 701
    const/16 v7, 0x18

    .line 702
    .line 703
    goto :goto_17

    .line 704
    :cond_1f
    const/4 v12, 0x3

    .line 705
    const/4 v11, 0x0

    .line 706
    :goto_19
    const/4 v7, 0x5

    .line 707
    if-ge v11, v10, :cond_22

    .line 708
    .line 709
    const/4 v7, 0x0

    .line 710
    :goto_1a
    if-ge v7, v15, :cond_21

    .line 711
    .line 712
    aget v19, v1, v11

    .line 713
    .line 714
    const/4 v14, 0x1

    .line 715
    shl-int v23, v14, v7

    .line 716
    .line 717
    and-int v19, v19, v23

    .line 718
    .line 719
    if-eqz v19, :cond_20

    .line 720
    .line 721
    invoke-virtual {v13, v15}, Ll/ugr0;->c(I)V

    .line 722
    .line 723
    .line 724
    :cond_20
    add-int/lit8 v7, v7, 0x1

    .line 725
    .line 726
    const/16 v15, 0x8

    .line 727
    .line 728
    goto :goto_1a

    .line 729
    :cond_21
    add-int/lit8 v11, v11, 0x1

    .line 730
    .line 731
    const/16 v15, 0x8

    .line 732
    .line 733
    goto :goto_19

    .line 734
    :cond_22
    add-int/lit8 v4, v4, 0x1

    .line 735
    .line 736
    const/4 v1, 0x6

    .line 737
    const/4 v14, 0x1

    .line 738
    goto :goto_16

    .line 739
    :cond_23
    const-string v0, "residueType greater than 2 is not decodable"

    .line 740
    .line 741
    const/4 v1, 0x0

    .line 742
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 743
    .line 744
    .line 745
    move-result-object v0

    .line 746
    throw v0

    .line 747
    :cond_24
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 748
    .line 749
    .line 750
    move-result v3

    .line 751
    const/4 v14, 0x1

    .line 752
    add-int/2addr v3, v14

    .line 753
    const/4 v1, 0x0

    .line 754
    :goto_1b
    if-ge v1, v3, :cond_2b

    .line 755
    .line 756
    const/16 v7, 0x10

    .line 757
    .line 758
    invoke-virtual {v13, v7}, Ll/ugr0;->b(I)I

    .line 759
    .line 760
    .line 761
    move-result v4

    .line 762
    if-eqz v4, :cond_25

    .line 763
    .line 764
    new-instance v7, Ljava/lang/StringBuilder;

    .line 765
    .line 766
    const-string v10, "mapping type other than 0 not supported: "

    .line 767
    .line 768
    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 769
    .line 770
    .line 771
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 772
    .line 773
    .line 774
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 775
    .line 776
    .line 777
    move-result-object v4

    .line 778
    const-string v7, "VorbisUtil"

    .line 779
    .line 780
    invoke-static {v7, v4}, Ll/y4w0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 781
    .line 782
    .line 783
    const/4 v10, 0x4

    .line 784
    const/4 v15, 0x2

    .line 785
    goto :goto_20

    .line 786
    :cond_25
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 787
    .line 788
    .line 789
    move-result v4

    .line 790
    if-eqz v4, :cond_26

    .line 791
    .line 792
    const/4 v4, 0x4

    .line 793
    invoke-virtual {v13, v4}, Ll/ugr0;->b(I)I

    .line 794
    .line 795
    .line 796
    move-result v7

    .line 797
    const/4 v14, 0x1

    .line 798
    add-int/lit8 v4, v7, 0x1

    .line 799
    .line 800
    goto :goto_1c

    .line 801
    :cond_26
    const/4 v14, 0x1

    .line 802
    move v4, v14

    .line 803
    :goto_1c
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 804
    .line 805
    .line 806
    move-result v7

    .line 807
    if-eqz v7, :cond_27

    .line 808
    .line 809
    const/16 v15, 0x8

    .line 810
    .line 811
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 812
    .line 813
    .line 814
    move-result v7

    .line 815
    add-int/2addr v7, v14

    .line 816
    const/4 v10, 0x0

    .line 817
    :goto_1d
    if-ge v10, v7, :cond_27

    .line 818
    .line 819
    add-int/lit8 v11, v9, -0x1

    .line 820
    .line 821
    invoke-static {v11}, Ll/ygr0;->a(I)I

    .line 822
    .line 823
    .line 824
    move-result v12

    .line 825
    invoke-virtual {v13, v12}, Ll/ugr0;->c(I)V

    .line 826
    .line 827
    .line 828
    invoke-static {v11}, Ll/ygr0;->a(I)I

    .line 829
    .line 830
    .line 831
    move-result v11

    .line 832
    invoke-virtual {v13, v11}, Ll/ugr0;->c(I)V

    .line 833
    .line 834
    .line 835
    add-int/lit8 v10, v10, 0x1

    .line 836
    .line 837
    goto :goto_1d

    .line 838
    :cond_27
    const/4 v15, 0x2

    .line 839
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 840
    .line 841
    .line 842
    move-result v7

    .line 843
    if-nez v7, :cond_2a

    .line 844
    .line 845
    const/4 v14, 0x1

    .line 846
    if-le v4, v14, :cond_28

    .line 847
    .line 848
    const/4 v7, 0x0

    .line 849
    :goto_1e
    if-ge v7, v9, :cond_28

    .line 850
    .line 851
    const/4 v10, 0x4

    .line 852
    invoke-virtual {v13, v10}, Ll/ugr0;->c(I)V

    .line 853
    .line 854
    .line 855
    add-int/lit8 v7, v7, 0x1

    .line 856
    .line 857
    goto :goto_1e

    .line 858
    :cond_28
    const/4 v10, 0x4

    .line 859
    const/4 v7, 0x0

    .line 860
    :goto_1f
    if-ge v7, v4, :cond_29

    .line 861
    .line 862
    const/16 v11, 0x8

    .line 863
    .line 864
    invoke-virtual {v13, v11}, Ll/ugr0;->c(I)V

    .line 865
    .line 866
    .line 867
    invoke-virtual {v13, v11}, Ll/ugr0;->c(I)V

    .line 868
    .line 869
    .line 870
    invoke-virtual {v13, v11}, Ll/ugr0;->c(I)V

    .line 871
    .line 872
    .line 873
    add-int/lit8 v7, v7, 0x1

    .line 874
    .line 875
    goto :goto_1f

    .line 876
    :cond_29
    :goto_20
    add-int/lit8 v1, v1, 0x1

    .line 877
    .line 878
    goto :goto_1b

    .line 879
    :cond_2a
    const-string v0, "to reserved bits must be zero after mapping coupling steps"

    .line 880
    .line 881
    const/4 v1, 0x0

    .line 882
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 883
    .line 884
    .line 885
    move-result-object v0

    .line 886
    throw v0

    .line 887
    :cond_2b
    const/4 v1, 0x6

    .line 888
    invoke-virtual {v13, v1}, Ll/ugr0;->b(I)I

    .line 889
    .line 890
    .line 891
    move-result v1

    .line 892
    add-int/lit8 v3, v1, 0x1

    .line 893
    .line 894
    new-array v9, v3, [Ll/wgr0;

    .line 895
    .line 896
    const/4 v4, 0x0

    .line 897
    :goto_21
    if-ge v4, v3, :cond_2c

    .line 898
    .line 899
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 900
    .line 901
    .line 902
    move-result v7

    .line 903
    const/16 v10, 0x10

    .line 904
    .line 905
    invoke-virtual {v13, v10}, Ll/ugr0;->b(I)I

    .line 906
    .line 907
    .line 908
    move-result v11

    .line 909
    invoke-virtual {v13, v10}, Ll/ugr0;->b(I)I

    .line 910
    .line 911
    .line 912
    move-result v12

    .line 913
    const/16 v15, 0x8

    .line 914
    .line 915
    invoke-virtual {v13, v15}, Ll/ugr0;->b(I)I

    .line 916
    .line 917
    .line 918
    move-result v10

    .line 919
    new-instance v14, Ll/wgr0;

    .line 920
    .line 921
    invoke-direct {v14, v7, v11, v12, v10}, Ll/wgr0;-><init>(ZIII)V

    .line 922
    .line 923
    .line 924
    aput-object v14, v9, v4

    .line 925
    .line 926
    add-int/lit8 v4, v4, 0x1

    .line 927
    .line 928
    goto :goto_21

    .line 929
    :cond_2c
    invoke-virtual {v13}, Ll/ugr0;->d()Z

    .line 930
    .line 931
    .line 932
    move-result v3

    .line 933
    if-eqz v3, :cond_2e

    .line 934
    .line 935
    move-object v7, v5

    .line 936
    new-instance v5, Ll/mor0;

    .line 937
    .line 938
    invoke-static {v1}, Ll/ygr0;->a(I)I

    .line 939
    .line 940
    .line 941
    move-result v10

    .line 942
    invoke-direct/range {v5 .. v10}, Ll/mor0;-><init>(Ll/xgr0;Ll/vgr0;[B[Ll/wgr0;I)V

    .line 943
    .line 944
    .line 945
    move-object v7, v5

    .line 946
    :goto_22
    iput-object v7, v0, Ll/nor0;->n:Ll/mor0;

    .line 947
    .line 948
    if-nez v7, :cond_2d

    .line 949
    .line 950
    const/4 v14, 0x1

    .line 951
    return v14

    .line 952
    :cond_2d
    new-instance v0, Ljava/util/ArrayList;

    .line 953
    .line 954
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 955
    .line 956
    .line 957
    iget-object v1, v7, Ll/mor0;->a:Ll/xgr0;

    .line 958
    .line 959
    iget-object v3, v1, Ll/xgr0;->g:[B

    .line 960
    .line 961
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 962
    .line 963
    .line 964
    iget-object v3, v7, Ll/mor0;->c:[B

    .line 965
    .line 966
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 967
    .line 968
    .line 969
    iget-object v3, v7, Ll/mor0;->b:Ll/vgr0;

    .line 970
    .line 971
    iget-object v3, v3, Ll/vgr0;->b:[Ljava/lang/String;

    .line 972
    .line 973
    invoke-static {v3}, Lcom/google/android/gms/internal/ads/zzgaa;->zzk([Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 974
    .line 975
    .line 976
    move-result-object v3

    .line 977
    invoke-static {v3}, Ll/ygr0;->b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzby;

    .line 978
    .line 979
    .line 980
    move-result-object v3

    .line 981
    new-instance v4, Ll/znr0;

    .line 982
    .line 983
    invoke-direct {v4}, Ll/znr0;-><init>()V

    .line 984
    .line 985
    .line 986
    const-string v5, "audio/vorbis"

    .line 987
    .line 988
    invoke-virtual {v4, v5}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 989
    .line 990
    .line 991
    iget v5, v1, Ll/xgr0;->d:I

    .line 992
    .line 993
    invoke-virtual {v4, v5}, Ll/znr0;->j0(I)Ll/znr0;

    .line 994
    .line 995
    .line 996
    iget v5, v1, Ll/xgr0;->c:I

    .line 997
    .line 998
    invoke-virtual {v4, v5}, Ll/znr0;->r(I)Ll/znr0;

    .line 999
    .line 1000
    .line 1001
    iget v5, v1, Ll/xgr0;->a:I

    .line 1002
    .line 1003
    invoke-virtual {v4, v5}, Ll/znr0;->k0(I)Ll/znr0;

    .line 1004
    .line 1005
    .line 1006
    iget v1, v1, Ll/xgr0;->b:I

    .line 1007
    .line 1008
    invoke-virtual {v4, v1}, Ll/znr0;->x(I)Ll/znr0;

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {v4, v0}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 1012
    .line 1013
    .line 1014
    invoke-virtual {v4, v3}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 1015
    .line 1016
    .line 1017
    invoke-virtual {v4}, Ll/znr0;->D()Ll/sqr0;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    iput-object v0, v2, Ll/ior0;->a:Ll/sqr0;

    .line 1022
    .line 1023
    const/4 v14, 0x1

    .line 1024
    return v14

    .line 1025
    :cond_2e
    const-string v0, "framing bit after modes not set as expected"

    .line 1026
    .line 1027
    const/4 v1, 0x0

    .line 1028
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v0

    .line 1032
    throw v0
.end method

.method public final h(J)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/lor0;->h(J)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p1, p2

    .line 14
    :goto_0
    iput-boolean p1, p0, Ll/nor0;->p:Z

    .line 15
    .line 16
    iget-object p1, p0, Ll/nor0;->q:Ll/xgr0;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget p2, p1, Ll/xgr0;->e:I

    .line 21
    .line 22
    :cond_1
    iput p2, p0, Ll/nor0;->o:I

    .line 23
    .line 24
    return-void
.end method
