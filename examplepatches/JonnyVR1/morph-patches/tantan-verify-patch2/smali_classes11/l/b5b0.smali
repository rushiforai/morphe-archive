.class public final Ll/b5b0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public static a([BI)Ll/a5b0;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/ig60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ig60;-><init>([B)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    :try_start_0
    invoke-static {v0}, Ll/b5b0;->c(Ll/ig60;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Ll/b5b0;->f(Ll/ig60;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {v0}, Ll/b5b0;->e(Ll/ig60;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-object v0, p0

    .line 24
    :goto_0
    if-nez v0, :cond_1

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eq v1, v3, :cond_3

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    if-eq v1, v4, :cond_2

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    new-instance p0, Ll/a5b0;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/a5b0$a;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/a5b0$a;

    .line 52
    .line 53
    invoke-direct {p0, v1, v0, p1}, Ll/a5b0;-><init>(Ll/a5b0$a;Ll/a5b0$a;I)V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    new-instance p0, Ll/a5b0;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ll/a5b0$a;

    .line 64
    .line 65
    invoke-direct {p0, v0, p1}, Ll/a5b0;-><init>(Ll/a5b0$a;I)V

    .line 66
    .line 67
    .line 68
    return-object p0
.end method

.method public static b(I)I
    .locals 1

    .line 1
    shr-int/lit8 v0, p0, 0x1

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    neg-int p0, p0

    .line 6
    xor-int/2addr p0, v0

    .line 7
    return p0
.end method

.method public static c(Ll/ig60;)Z
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v1}, Ll/ig60;->U(I)V

    .line 11
    .line 12
    .line 13
    const p0, 0x70726f6a

    .line 14
    .line 15
    .line 16
    if-ne v0, p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    return v1
.end method

.method public static d(Ll/ig60;)Ll/a5b0$a;
    .locals 23
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Ll/ig60;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x2710

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    new-array v1, v0, [F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    :goto_0
    if-ge v4, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual/range {p0 .. p0}, Ll/ig60;->p()F

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    aput v5, v1, v4

    .line 21
    .line 22
    add-int/lit8 v4, v4, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual/range {p0 .. p0}, Ll/ig60;->q()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    const/16 v5, 0x7d00

    .line 30
    .line 31
    if-le v4, v5, :cond_2

    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_2
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 35
    .line 36
    invoke-static {v5, v6}, Ljava/lang/Math;->log(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide v7

    .line 40
    int-to-double v9, v0

    .line 41
    mul-double/2addr v9, v5

    .line 42
    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v9

    .line 46
    div-double/2addr v9, v7

    .line 47
    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    .line 48
    .line 49
    .line 50
    move-result-wide v9

    .line 51
    double-to-int v9, v9

    .line 52
    new-instance v10, Ll/hg60;

    .line 53
    .line 54
    invoke-virtual/range {p0 .. p0}, Ll/ig60;->e()[B

    .line 55
    .line 56
    .line 57
    move-result-object v11

    .line 58
    invoke-direct {v10, v11}, Ll/hg60;-><init>([B)V

    .line 59
    .line 60
    .line 61
    invoke-virtual/range {p0 .. p0}, Ll/ig60;->f()I

    .line 62
    .line 63
    .line 64
    move-result v11

    .line 65
    const/16 v12, 0x8

    .line 66
    .line 67
    mul-int/2addr v11, v12

    .line 68
    invoke-virtual {v10, v11}, Ll/hg60;->p(I)V

    .line 69
    .line 70
    .line 71
    mul-int/lit8 v11, v4, 0x5

    .line 72
    .line 73
    new-array v11, v11, [F

    .line 74
    .line 75
    const/4 v13, 0x5

    .line 76
    new-array v14, v13, [I

    .line 77
    .line 78
    const/4 v15, 0x0

    .line 79
    const/16 v16, 0x0

    .line 80
    .line 81
    :goto_1
    if-ge v15, v4, :cond_6

    .line 82
    .line 83
    move-object/from16 v17, v2

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    :goto_2
    if-ge v2, v13, :cond_5

    .line 87
    .line 88
    aget v18, v14, v2

    .line 89
    .line 90
    invoke-virtual {v10, v9}, Ll/hg60;->h(I)I

    .line 91
    .line 92
    .line 93
    move-result v19

    .line 94
    invoke-static/range {v19 .. v19}, Ll/b5b0;->b(I)I

    .line 95
    .line 96
    .line 97
    move-result v19

    .line 98
    add-int v3, v18, v19

    .line 99
    .line 100
    if-ge v3, v0, :cond_4

    .line 101
    .line 102
    if-gez v3, :cond_3

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_3
    add-int/lit8 v18, v16, 0x1

    .line 106
    .line 107
    aget v19, v1, v3

    .line 108
    .line 109
    aput v19, v11, v16

    .line 110
    .line 111
    aput v3, v14, v2

    .line 112
    .line 113
    add-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    move/from16 v16, v18

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    :goto_3
    return-object v17

    .line 119
    :cond_5
    add-int/lit8 v15, v15, 0x1

    .line 120
    .line 121
    move-object/from16 v2, v17

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_6
    move-object/from16 v17, v2

    .line 125
    .line 126
    invoke-virtual {v10}, Ll/hg60;->e()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/lit8 v0, v0, 0x7

    .line 131
    .line 132
    and-int/lit8 v0, v0, -0x8

    .line 133
    .line 134
    invoke-virtual {v10, v0}, Ll/hg60;->p(I)V

    .line 135
    .line 136
    .line 137
    const/16 v0, 0x20

    .line 138
    .line 139
    invoke-virtual {v10, v0}, Ll/hg60;->h(I)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    new-array v2, v1, [Ll/a5b0$b;

    .line 144
    .line 145
    const/4 v3, 0x0

    .line 146
    :goto_4
    if-ge v3, v1, :cond_b

    .line 147
    .line 148
    invoke-virtual {v10, v12}, Ll/hg60;->h(I)I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    invoke-virtual {v10, v12}, Ll/hg60;->h(I)I

    .line 153
    .line 154
    .line 155
    move-result v13

    .line 156
    invoke-virtual {v10, v0}, Ll/hg60;->h(I)I

    .line 157
    .line 158
    .line 159
    move-result v14

    .line 160
    const v15, 0x1f400

    .line 161
    .line 162
    .line 163
    if-le v14, v15, :cond_7

    .line 164
    .line 165
    return-object v17

    .line 166
    :cond_7
    move v15, v1

    .line 167
    int-to-double v0, v4

    .line 168
    mul-double/2addr v0, v5

    .line 169
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    .line 170
    .line 171
    .line 172
    move-result-wide v0

    .line 173
    div-double/2addr v0, v7

    .line 174
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 175
    .line 176
    .line 177
    move-result-wide v0

    .line 178
    double-to-int v0, v0

    .line 179
    mul-int/lit8 v1, v14, 0x3

    .line 180
    .line 181
    new-array v1, v1, [F

    .line 182
    .line 183
    mul-int/lit8 v5, v14, 0x2

    .line 184
    .line 185
    new-array v5, v5, [F

    .line 186
    .line 187
    const/4 v6, 0x0

    .line 188
    const/16 v16, 0x0

    .line 189
    .line 190
    :goto_5
    if-ge v6, v14, :cond_a

    .line 191
    .line 192
    invoke-virtual {v10, v0}, Ll/hg60;->h(I)I

    .line 193
    .line 194
    .line 195
    move-result v20

    .line 196
    invoke-static/range {v20 .. v20}, Ll/b5b0;->b(I)I

    .line 197
    .line 198
    .line 199
    move-result v20

    .line 200
    add-int v12, v16, v20

    .line 201
    .line 202
    if-ltz v12, :cond_9

    .line 203
    .line 204
    if-lt v12, v4, :cond_8

    .line 205
    .line 206
    goto :goto_6

    .line 207
    :cond_8
    mul-int/lit8 v16, v6, 0x3

    .line 208
    .line 209
    mul-int/lit8 v20, v12, 0x5

    .line 210
    .line 211
    aget v21, v11, v20

    .line 212
    .line 213
    aput v21, v1, v16

    .line 214
    .line 215
    add-int/lit8 v21, v16, 0x1

    .line 216
    .line 217
    add-int/lit8 v22, v20, 0x1

    .line 218
    .line 219
    aget v22, v11, v22

    .line 220
    .line 221
    aput v22, v1, v21

    .line 222
    .line 223
    add-int/lit8 v16, v16, 0x2

    .line 224
    .line 225
    add-int/lit8 v21, v20, 0x2

    .line 226
    .line 227
    aget v21, v11, v21

    .line 228
    .line 229
    aput v21, v1, v16

    .line 230
    .line 231
    mul-int/lit8 v16, v6, 0x2

    .line 232
    .line 233
    add-int/lit8 v21, v20, 0x3

    .line 234
    .line 235
    aget v21, v11, v21

    .line 236
    .line 237
    aput v21, v5, v16

    .line 238
    .line 239
    add-int/lit8 v16, v16, 0x1

    .line 240
    .line 241
    add-int/lit8 v20, v20, 0x4

    .line 242
    .line 243
    aget v20, v11, v20

    .line 244
    .line 245
    aput v20, v5, v16

    .line 246
    .line 247
    add-int/lit8 v6, v6, 0x1

    .line 248
    .line 249
    move/from16 v16, v12

    .line 250
    .line 251
    const/16 v12, 0x8

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_9
    :goto_6
    return-object v17

    .line 255
    :cond_a
    new-instance v0, Ll/a5b0$b;

    .line 256
    .line 257
    invoke-direct {v0, v9, v1, v5, v13}, Ll/a5b0$b;-><init>(I[F[FI)V

    .line 258
    .line 259
    .line 260
    aput-object v0, v2, v3

    .line 261
    .line 262
    add-int/lit8 v3, v3, 0x1

    .line 263
    .line 264
    move v1, v15

    .line 265
    const/16 v0, 0x20

    .line 266
    .line 267
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 268
    .line 269
    const/16 v12, 0x8

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_b
    new-instance v0, Ll/a5b0$a;

    .line 273
    .line 274
    invoke-direct {v0, v2}, Ll/a5b0$a;-><init>([Ll/a5b0$b;)V

    .line 275
    .line 276
    .line 277
    return-object v0
.end method

.method public static e(Ll/ig60;)Ljava/util/ArrayList;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/a5b0$a;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    const/4 v0, 0x7

    .line 10
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const v2, 0x64666c38

    .line 18
    .line 19
    .line 20
    if-ne v0, v2, :cond_2

    .line 21
    .line 22
    new-instance v0, Ll/ig60;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/ig60;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ljava/util/zip/Inflater;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-direct {v2, v3}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-static {p0, v0, v2}, Ll/bmk0;->y0(Ll/ig60;Ll/ig60;Ljava/util/zip/Inflater;)Z

    .line 34
    .line 35
    .line 36
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->end()V

    .line 40
    .line 41
    .line 42
    return-object v1

    .line 43
    :cond_1
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->end()V

    .line 44
    .line 45
    .line 46
    move-object p0, v0

    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->end()V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :cond_2
    const v2, 0x72617720

    .line 54
    .line 55
    .line 56
    if-eq v0, v2, :cond_3

    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_3
    :goto_0
    invoke-static {p0}, Ll/b5b0;->g(Ll/ig60;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public static f(Ll/ig60;)Ljava/util/ArrayList;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/a5b0$a;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Ll/ig60;->g()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    :goto_0
    const/4 v2, 0x0

    .line 15
    if-ge v0, v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    add-int/2addr v3, v0

    .line 22
    if-le v3, v0, :cond_3

    .line 23
    .line 24
    if-le v3, v1, :cond_0

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const v2, 0x79746d70

    .line 32
    .line 33
    .line 34
    if-eq v0, v2, :cond_2

    .line 35
    .line 36
    const v2, 0x6d736870

    .line 37
    .line 38
    .line 39
    if-ne v0, v2, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {p0, v3}, Ll/ig60;->U(I)V

    .line 43
    .line 44
    .line 45
    move v0, v3

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    :goto_1
    invoke-virtual {p0, v3}, Ll/ig60;->T(I)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0}, Ll/b5b0;->e(Ll/ig60;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_3
    :goto_2
    return-object v2
.end method

.method public static g(Ll/ig60;)Ljava/util/ArrayList;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/a5b0$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Ll/ig60;->g()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    :goto_0
    if-ge v1, v2, :cond_4

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    add-int/2addr v3, v1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-le v3, v1, :cond_3

    .line 23
    .line 24
    if-le v3, v2, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const v5, 0x6d657368

    .line 32
    .line 33
    .line 34
    if-ne v1, v5, :cond_2

    .line 35
    .line 36
    invoke-static {p0}, Ll/b5b0;->d(Ll/ig60;)Ll/a5b0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    return-object v4

    .line 43
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {p0, v3}, Ll/ig60;->U(I)V

    .line 47
    .line 48
    .line 49
    move v1, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_3
    :goto_1
    return-object v4

    .line 52
    :cond_4
    return-object v0
.end method
