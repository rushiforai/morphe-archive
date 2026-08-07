.class public final Ll/s0f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x21

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/s0f;->a:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x4
        0x6
        0x6
        0x8
        0x8
        0x8
        0x8
        0x8
        0x8
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
    .end array-data
.end method

.method public static a(Ll/b13;II)[I
    .locals 7

    .line 1
    new-array p2, p2, [I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    div-int/2addr v0, p1

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    if-ge v2, v0, :cond_2

    .line 11
    .line 12
    move v3, v1

    .line 13
    move v4, v3

    .line 14
    :goto_1
    if-ge v3, p1, :cond_1

    .line 15
    .line 16
    mul-int v5, v2, p1

    .line 17
    .line 18
    add-int/2addr v5, v3

    .line 19
    invoke-virtual {p0, v5}, Ll/b13;->f(I)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    sub-int v5, p1, v3

    .line 26
    .line 27
    const/4 v6, 0x1

    .line 28
    sub-int/2addr v5, v6

    .line 29
    shl-int v5, v6, v5

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_0
    move v5, v1

    .line 33
    :goto_2
    or-int/2addr v4, v5

    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    aput v4, p2, v2

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return-object p2
.end method

.method public static b(Ll/d13;II)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p2, :cond_1

    .line 3
    .line 4
    sub-int v1, p1, v0

    .line 5
    .line 6
    move v2, v1

    .line 7
    :goto_1
    add-int v3, p1, v0

    .line 8
    .line 9
    if-gt v2, v3, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v2, v1}, Ll/d13;->o(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v2, v3}, Ll/d13;->o(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1, v2}, Ll/d13;->o(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v3, v2}, Ll/d13;->o(II)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    add-int/lit8 v0, v0, 0x2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    sub-int v0, p1, p2

    .line 30
    .line 31
    invoke-virtual {p0, v0, v0}, Ll/d13;->o(II)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v1, v0, 0x1

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Ll/d13;->o(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Ll/d13;->o(II)V

    .line 40
    .line 41
    .line 42
    add-int/2addr p1, p2

    .line 43
    invoke-virtual {p0, p1, v0}, Ll/d13;->o(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1, v1}, Ll/d13;->o(II)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 p2, p1, -0x1

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Ll/d13;->o(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static c(Ll/d13;ZILl/b13;)V
    .locals 2

    .line 1
    div-int/lit8 p2, p2, 0x2

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    :goto_0
    const/4 p1, 0x7

    .line 7
    if-ge v0, p1, :cond_9

    .line 8
    .line 9
    add-int/lit8 p1, p2, -0x3

    .line 10
    .line 11
    add-int/2addr p1, v0

    .line 12
    invoke-virtual {p3, v0}, Ll/b13;->f(I)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    add-int/lit8 v1, p2, -0x5

    .line 19
    .line 20
    invoke-virtual {p0, p1, v1}, Ll/d13;->o(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    add-int/lit8 v1, v0, 0x7

    .line 24
    .line 25
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    add-int/lit8 v1, p2, 0x5

    .line 32
    .line 33
    invoke-virtual {p0, v1, p1}, Ll/d13;->o(II)V

    .line 34
    .line 35
    .line 36
    :cond_1
    rsub-int/lit8 v1, v0, 0x14

    .line 37
    .line 38
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    add-int/lit8 v1, p2, 0x5

    .line 45
    .line 46
    invoke-virtual {p0, p1, v1}, Ll/d13;->o(II)V

    .line 47
    .line 48
    .line 49
    :cond_2
    rsub-int/lit8 v1, v0, 0x1b

    .line 50
    .line 51
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    add-int/lit8 v1, p2, -0x5

    .line 58
    .line 59
    invoke-virtual {p0, v1, p1}, Ll/d13;->o(II)V

    .line 60
    .line 61
    .line 62
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    :goto_1
    const/16 p1, 0xa

    .line 66
    .line 67
    if-ge v0, p1, :cond_9

    .line 68
    .line 69
    add-int/lit8 p1, p2, -0x5

    .line 70
    .line 71
    add-int/2addr p1, v0

    .line 72
    div-int/lit8 v1, v0, 0x5

    .line 73
    .line 74
    add-int/2addr p1, v1

    .line 75
    invoke-virtual {p3, v0}, Ll/b13;->f(I)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    add-int/lit8 v1, p2, -0x7

    .line 82
    .line 83
    invoke-virtual {p0, p1, v1}, Ll/d13;->o(II)V

    .line 84
    .line 85
    .line 86
    :cond_5
    add-int/lit8 v1, v0, 0xa

    .line 87
    .line 88
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    add-int/lit8 v1, p2, 0x7

    .line 95
    .line 96
    invoke-virtual {p0, v1, p1}, Ll/d13;->o(II)V

    .line 97
    .line 98
    .line 99
    :cond_6
    rsub-int/lit8 v1, v0, 0x1d

    .line 100
    .line 101
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    add-int/lit8 v1, p2, 0x7

    .line 108
    .line 109
    invoke-virtual {p0, p1, v1}, Ll/d13;->o(II)V

    .line 110
    .line 111
    .line 112
    :cond_7
    rsub-int/lit8 v1, v0, 0x27

    .line 113
    .line 114
    invoke-virtual {p3, v1}, Ll/b13;->f(I)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    add-int/lit8 v1, p2, -0x7

    .line 121
    .line 122
    invoke-virtual {p0, v1, p1}, Ll/d13;->o(II)V

    .line 123
    .line 124
    .line 125
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_9
    return-void
.end method

.method public static d([BII)Ll/xp1;
    .locals 20

    .line 1
    new-instance v0, Ll/y4l;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/y4l;-><init>([B)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/y4l;->a()Ll/b13;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    mul-int v1, v1, p1

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x64

    .line 19
    .line 20
    const/16 v2, 0xb

    .line 21
    .line 22
    add-int/2addr v1, v2

    .line 23
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    add-int/2addr v3, v1

    .line 28
    const/4 v4, 0x0

    .line 29
    const/16 v5, 0x20

    .line 30
    .line 31
    const/4 v7, 0x1

    .line 32
    if-eqz p2, :cond_5

    .line 33
    .line 34
    if-gez p2, :cond_0

    .line 35
    .line 36
    move v3, v7

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v3, 0x0

    .line 39
    :goto_0
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    :cond_1
    if-gt v8, v5, :cond_4

    .line 47
    .line 48
    invoke-static {v8, v3}, Ll/s0f;->i(IZ)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    sget-object v9, Ll/s0f;->a:[I

    .line 53
    .line 54
    aget v9, v9, v8

    .line 55
    .line 56
    rem-int v10, v5, v9

    .line 57
    .line 58
    sub-int v10, v5, v10

    .line 59
    .line 60
    invoke-static {v0, v9}, Ll/s0f;->h(Ll/b13;I)Ll/b13;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 65
    .line 66
    .line 67
    move-result v11

    .line 68
    add-int/2addr v11, v1

    .line 69
    const-string v1, "Data to large for user specified layer"

    .line 70
    .line 71
    if-gt v11, v10, :cond_3

    .line 72
    .line 73
    if-eqz v3, :cond_d

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    shl-int/lit8 v11, v9, 0x6

    .line 80
    .line 81
    if-gt v10, v11, :cond_2

    .line 82
    .line 83
    goto/16 :goto_4

    .line 84
    .line 85
    :cond_2
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-object v4

    .line 89
    :cond_3
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-object v4

    .line 93
    :cond_4
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "Illegal value %s for layers"

    .line 102
    .line 103
    invoke-static {v1, v0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-object v4

    .line 107
    :cond_5
    move-object v9, v4

    .line 108
    const/4 v8, 0x0

    .line 109
    const/4 v10, 0x0

    .line 110
    :goto_1
    if-gt v8, v5, :cond_1d

    .line 111
    .line 112
    const/4 v11, 0x3

    .line 113
    if-gt v8, v11, :cond_6

    .line 114
    .line 115
    move v11, v7

    .line 116
    goto :goto_2

    .line 117
    :cond_6
    const/4 v11, 0x0

    .line 118
    :goto_2
    if-eqz v11, :cond_7

    .line 119
    .line 120
    add-int/lit8 v12, v8, 0x1

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_7
    move v12, v8

    .line 124
    :goto_3
    invoke-static {v12, v11}, Ll/s0f;->i(IZ)I

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    if-gt v3, v13, :cond_b

    .line 129
    .line 130
    if-eqz v9, :cond_8

    .line 131
    .line 132
    sget-object v14, Ll/s0f;->a:[I

    .line 133
    .line 134
    aget v14, v14, v12

    .line 135
    .line 136
    if-eq v10, v14, :cond_9

    .line 137
    .line 138
    :cond_8
    sget-object v9, Ll/s0f;->a:[I

    .line 139
    .line 140
    aget v9, v9, v12

    .line 141
    .line 142
    invoke-static {v0, v9}, Ll/s0f;->h(Ll/b13;I)Ll/b13;

    .line 143
    .line 144
    .line 145
    move-result-object v10

    .line 146
    move-object/from16 v19, v10

    .line 147
    .line 148
    move v10, v9

    .line 149
    move-object/from16 v9, v19

    .line 150
    .line 151
    :cond_9
    rem-int v14, v13, v10

    .line 152
    .line 153
    sub-int v14, v13, v14

    .line 154
    .line 155
    if-eqz v11, :cond_a

    .line 156
    .line 157
    invoke-virtual {v9}, Ll/b13;->m()I

    .line 158
    .line 159
    .line 160
    move-result v15

    .line 161
    shl-int/lit8 v2, v10, 0x6

    .line 162
    .line 163
    if-gt v15, v2, :cond_b

    .line 164
    .line 165
    :cond_a
    invoke-virtual {v9}, Ll/b13;->m()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    add-int/2addr v2, v1

    .line 170
    if-le v2, v14, :cond_c

    .line 171
    .line 172
    :cond_b
    move/from16 v18, v7

    .line 173
    .line 174
    goto/16 :goto_11

    .line 175
    .line 176
    :cond_c
    move-object v0, v9

    .line 177
    move v9, v10

    .line 178
    move v3, v11

    .line 179
    move v8, v12

    .line 180
    move v5, v13

    .line 181
    :cond_d
    :goto_4
    invoke-static {v0, v5, v9}, Ll/s0f;->e(Ll/b13;II)Ll/b13;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v0}, Ll/b13;->m()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    div-int/2addr v0, v9

    .line 190
    invoke-static {v3, v8, v0}, Ll/s0f;->f(ZII)Ll/b13;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    if-eqz v3, :cond_e

    .line 195
    .line 196
    const/16 v4, 0xb

    .line 197
    .line 198
    goto :goto_5

    .line 199
    :cond_e
    const/16 v4, 0xe

    .line 200
    .line 201
    :goto_5
    shl-int/lit8 v5, v8, 0x2

    .line 202
    .line 203
    add-int/2addr v4, v5

    .line 204
    new-array v5, v4, [I

    .line 205
    .line 206
    const/4 v9, 0x2

    .line 207
    if-eqz v3, :cond_10

    .line 208
    .line 209
    const/4 v10, 0x0

    .line 210
    :goto_6
    if-ge v10, v4, :cond_f

    .line 211
    .line 212
    aput v10, v5, v10

    .line 213
    .line 214
    add-int/lit8 v10, v10, 0x1

    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_f
    move v10, v4

    .line 218
    goto :goto_8

    .line 219
    :cond_10
    add-int/lit8 v10, v4, 0x1

    .line 220
    .line 221
    div-int/lit8 v11, v4, 0x2

    .line 222
    .line 223
    add-int/lit8 v12, v11, -0x1

    .line 224
    .line 225
    div-int/lit8 v12, v12, 0xf

    .line 226
    .line 227
    mul-int/2addr v12, v9

    .line 228
    add-int/2addr v10, v12

    .line 229
    div-int/lit8 v12, v10, 0x2

    .line 230
    .line 231
    const/4 v13, 0x0

    .line 232
    :goto_7
    if-ge v13, v11, :cond_11

    .line 233
    .line 234
    div-int/lit8 v14, v13, 0xf

    .line 235
    .line 236
    add-int/2addr v14, v13

    .line 237
    sub-int v15, v11, v13

    .line 238
    .line 239
    sub-int/2addr v15, v7

    .line 240
    sub-int v16, v12, v14

    .line 241
    .line 242
    add-int/lit8 v16, v16, -0x1

    .line 243
    .line 244
    aput v16, v5, v15

    .line 245
    .line 246
    add-int v15, v11, v13

    .line 247
    .line 248
    add-int/2addr v14, v12

    .line 249
    add-int/2addr v14, v7

    .line 250
    aput v14, v5, v15

    .line 251
    .line 252
    add-int/lit8 v13, v13, 0x1

    .line 253
    .line 254
    goto :goto_7

    .line 255
    :cond_11
    :goto_8
    new-instance v11, Ll/d13;

    .line 256
    .line 257
    invoke-direct {v11, v10}, Ll/d13;-><init>(I)V

    .line 258
    .line 259
    .line 260
    const/4 v12, 0x0

    .line 261
    const/4 v13, 0x0

    .line 262
    :goto_9
    if-ge v12, v8, :cond_19

    .line 263
    .line 264
    sub-int v14, v8, v12

    .line 265
    .line 266
    shl-int/2addr v14, v9

    .line 267
    if-eqz v3, :cond_12

    .line 268
    .line 269
    const/16 v15, 0x9

    .line 270
    .line 271
    goto :goto_a

    .line 272
    :cond_12
    const/16 v15, 0xc

    .line 273
    .line 274
    :goto_a
    add-int/2addr v14, v15

    .line 275
    const/4 v15, 0x0

    .line 276
    :goto_b
    if-ge v15, v14, :cond_18

    .line 277
    .line 278
    shl-int/lit8 v16, v15, 0x1

    .line 279
    .line 280
    const/4 v6, 0x0

    .line 281
    :goto_c
    if-ge v6, v9, :cond_17

    .line 282
    .line 283
    add-int v17, v13, v16

    .line 284
    .line 285
    move/from16 v18, v7

    .line 286
    .line 287
    add-int v7, v17, v6

    .line 288
    .line 289
    invoke-virtual {v1, v7}, Ll/b13;->f(I)Z

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    if-eqz v7, :cond_13

    .line 294
    .line 295
    shl-int/lit8 v7, v12, 0x1

    .line 296
    .line 297
    add-int v17, v7, v6

    .line 298
    .line 299
    move/from16 p0, v9

    .line 300
    .line 301
    aget v9, v5, v17

    .line 302
    .line 303
    add-int/2addr v7, v15

    .line 304
    aget v7, v5, v7

    .line 305
    .line 306
    invoke-virtual {v11, v9, v7}, Ll/d13;->o(II)V

    .line 307
    .line 308
    .line 309
    goto :goto_d

    .line 310
    :cond_13
    move/from16 p0, v9

    .line 311
    .line 312
    :goto_d
    shl-int/lit8 v7, v14, 0x1

    .line 313
    .line 314
    add-int/2addr v7, v13

    .line 315
    add-int v7, v7, v16

    .line 316
    .line 317
    add-int/2addr v7, v6

    .line 318
    invoke-virtual {v1, v7}, Ll/b13;->f(I)Z

    .line 319
    .line 320
    .line 321
    move-result v7

    .line 322
    if-eqz v7, :cond_14

    .line 323
    .line 324
    shl-int/lit8 v7, v12, 0x1

    .line 325
    .line 326
    add-int v9, v7, v15

    .line 327
    .line 328
    aget v9, v5, v9

    .line 329
    .line 330
    add-int/lit8 v17, v4, -0x1

    .line 331
    .line 332
    sub-int v17, v17, v7

    .line 333
    .line 334
    sub-int v17, v17, v6

    .line 335
    .line 336
    aget v7, v5, v17

    .line 337
    .line 338
    invoke-virtual {v11, v9, v7}, Ll/d13;->o(II)V

    .line 339
    .line 340
    .line 341
    :cond_14
    shl-int/lit8 v7, v14, 0x2

    .line 342
    .line 343
    add-int/2addr v7, v13

    .line 344
    add-int v7, v7, v16

    .line 345
    .line 346
    add-int/2addr v7, v6

    .line 347
    invoke-virtual {v1, v7}, Ll/b13;->f(I)Z

    .line 348
    .line 349
    .line 350
    move-result v7

    .line 351
    if-eqz v7, :cond_15

    .line 352
    .line 353
    add-int/lit8 v7, v4, -0x1

    .line 354
    .line 355
    shl-int/lit8 v9, v12, 0x1

    .line 356
    .line 357
    sub-int/2addr v7, v9

    .line 358
    sub-int v9, v7, v6

    .line 359
    .line 360
    aget v9, v5, v9

    .line 361
    .line 362
    sub-int/2addr v7, v15

    .line 363
    aget v7, v5, v7

    .line 364
    .line 365
    invoke-virtual {v11, v9, v7}, Ll/d13;->o(II)V

    .line 366
    .line 367
    .line 368
    :cond_15
    mul-int/lit8 v7, v14, 0x6

    .line 369
    .line 370
    add-int/2addr v7, v13

    .line 371
    add-int v7, v7, v16

    .line 372
    .line 373
    add-int/2addr v7, v6

    .line 374
    invoke-virtual {v1, v7}, Ll/b13;->f(I)Z

    .line 375
    .line 376
    .line 377
    move-result v7

    .line 378
    if-eqz v7, :cond_16

    .line 379
    .line 380
    add-int/lit8 v7, v4, -0x1

    .line 381
    .line 382
    shl-int/lit8 v9, v12, 0x1

    .line 383
    .line 384
    sub-int/2addr v7, v9

    .line 385
    sub-int/2addr v7, v15

    .line 386
    aget v7, v5, v7

    .line 387
    .line 388
    add-int/2addr v9, v6

    .line 389
    aget v9, v5, v9

    .line 390
    .line 391
    invoke-virtual {v11, v7, v9}, Ll/d13;->o(II)V

    .line 392
    .line 393
    .line 394
    :cond_16
    add-int/lit8 v6, v6, 0x1

    .line 395
    .line 396
    move/from16 v9, p0

    .line 397
    .line 398
    move/from16 v7, v18

    .line 399
    .line 400
    goto :goto_c

    .line 401
    :cond_17
    move/from16 v18, v7

    .line 402
    .line 403
    move/from16 p0, v9

    .line 404
    .line 405
    add-int/lit8 v15, v15, 0x1

    .line 406
    .line 407
    goto/16 :goto_b

    .line 408
    .line 409
    :cond_18
    move/from16 v18, v7

    .line 410
    .line 411
    move/from16 p0, v9

    .line 412
    .line 413
    shl-int/lit8 v6, v14, 0x3

    .line 414
    .line 415
    add-int/2addr v13, v6

    .line 416
    add-int/lit8 v12, v12, 0x1

    .line 417
    .line 418
    goto/16 :goto_9

    .line 419
    .line 420
    :cond_19
    move/from16 v18, v7

    .line 421
    .line 422
    move/from16 p0, v9

    .line 423
    .line 424
    invoke-static {v11, v3, v10, v2}, Ll/s0f;->c(Ll/d13;ZILl/b13;)V

    .line 425
    .line 426
    .line 427
    if-eqz v3, :cond_1a

    .line 428
    .line 429
    div-int/lit8 v1, v10, 0x2

    .line 430
    .line 431
    const/4 v2, 0x5

    .line 432
    invoke-static {v11, v1, v2}, Ll/s0f;->b(Ll/d13;II)V

    .line 433
    .line 434
    .line 435
    goto :goto_10

    .line 436
    :cond_1a
    div-int/lit8 v1, v10, 0x2

    .line 437
    .line 438
    const/4 v2, 0x7

    .line 439
    invoke-static {v11, v1, v2}, Ll/s0f;->b(Ll/d13;II)V

    .line 440
    .line 441
    .line 442
    const/4 v2, 0x0

    .line 443
    const/4 v6, 0x0

    .line 444
    :goto_e
    div-int/lit8 v5, v4, 0x2

    .line 445
    .line 446
    add-int/lit8 v5, v5, -0x1

    .line 447
    .line 448
    if-ge v6, v5, :cond_1c

    .line 449
    .line 450
    and-int/lit8 v5, v1, 0x1

    .line 451
    .line 452
    :goto_f
    if-ge v5, v10, :cond_1b

    .line 453
    .line 454
    sub-int v7, v1, v2

    .line 455
    .line 456
    invoke-virtual {v11, v7, v5}, Ll/d13;->o(II)V

    .line 457
    .line 458
    .line 459
    add-int v9, v1, v2

    .line 460
    .line 461
    invoke-virtual {v11, v9, v5}, Ll/d13;->o(II)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v11, v5, v7}, Ll/d13;->o(II)V

    .line 465
    .line 466
    .line 467
    invoke-virtual {v11, v5, v9}, Ll/d13;->o(II)V

    .line 468
    .line 469
    .line 470
    add-int/lit8 v5, v5, 0x2

    .line 471
    .line 472
    goto :goto_f

    .line 473
    :cond_1b
    add-int/lit8 v6, v6, 0xf

    .line 474
    .line 475
    add-int/lit8 v2, v2, 0x10

    .line 476
    .line 477
    goto :goto_e

    .line 478
    :cond_1c
    :goto_10
    new-instance v1, Ll/xp1;

    .line 479
    .line 480
    invoke-direct {v1}, Ll/xp1;-><init>()V

    .line 481
    .line 482
    .line 483
    invoke-virtual {v1, v3}, Ll/xp1;->c(Z)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v1, v10}, Ll/xp1;->f(I)V

    .line 487
    .line 488
    .line 489
    invoke-virtual {v1, v8}, Ll/xp1;->d(I)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v1, v0}, Ll/xp1;->b(I)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v1, v11}, Ll/xp1;->e(Ll/d13;)V

    .line 496
    .line 497
    .line 498
    return-object v1

    .line 499
    :goto_11
    add-int/lit8 v8, v8, 0x1

    .line 500
    .line 501
    move/from16 v7, v18

    .line 502
    .line 503
    const/16 v2, 0xb

    .line 504
    .line 505
    goto/16 :goto_1

    .line 506
    .line 507
    :cond_1d
    const-string v0, "Data too large for an Aztec code"

    .line 508
    .line 509
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 510
    .line 511
    .line 512
    return-object v4
.end method

.method public static e(Ll/b13;II)Ll/b13;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/2addr v0, p2

    .line 6
    new-instance v1, Ll/guc0;

    .line 7
    .line 8
    invoke-static {p2}, Ll/s0f;->g(I)Ll/zlj;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2}, Ll/guc0;-><init>(Ll/zlj;)V

    .line 13
    .line 14
    .line 15
    div-int v2, p1, p2

    .line 16
    .line 17
    invoke-static {p0, p2, v2}, Ll/s0f;->a(Ll/b13;II)[I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sub-int/2addr v2, v0

    .line 22
    invoke-virtual {v1, p0, v2}, Ll/guc0;->b([II)V

    .line 23
    .line 24
    .line 25
    rem-int/2addr p1, p2

    .line 26
    new-instance v0, Ll/b13;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/b13;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1, p1}, Ll/b13;->c(II)V

    .line 33
    .line 34
    .line 35
    array-length p1, p0

    .line 36
    :goto_0
    if-ge v1, p1, :cond_0

    .line 37
    .line 38
    aget v2, p0, v1

    .line 39
    .line 40
    invoke-virtual {v0, v2, p2}, Ll/b13;->c(II)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-object v0
.end method

.method public static f(ZII)Ll/b13;
    .locals 2

    .line 1
    new-instance v0, Ll/b13;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b13;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    invoke-virtual {v0, p1, p0}, Ll/b13;->c(II)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 p2, p2, -0x1

    .line 16
    .line 17
    const/4 p0, 0x6

    .line 18
    invoke-virtual {v0, p2, p0}, Ll/b13;->c(II)V

    .line 19
    .line 20
    .line 21
    const/16 p0, 0x1c

    .line 22
    .line 23
    invoke-static {v0, p0, v1}, Ll/s0f;->e(Ll/b13;II)Ll/b13;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 29
    .line 30
    const/4 p0, 0x5

    .line 31
    invoke-virtual {v0, p1, p0}, Ll/b13;->c(II)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 p2, p2, -0x1

    .line 35
    .line 36
    const/16 p0, 0xb

    .line 37
    .line 38
    invoke-virtual {v0, p2, p0}, Ll/b13;->c(II)V

    .line 39
    .line 40
    .line 41
    const/16 p0, 0x28

    .line 42
    .line 43
    invoke-static {v0, p0, v1}, Ll/s0f;->e(Ll/b13;II)Ll/b13;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public static g(I)Ll/zlj;
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eq p0, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    if-eq p0, v0, :cond_3

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    if-eq p0, v0, :cond_2

    .line 10
    .line 11
    const/16 v0, 0xa

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/16 v0, 0xc

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/zlj;->h:Ll/zlj;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string v0, "Unsupported word size "

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_1
    sget-object p0, Ll/zlj;->i:Ll/zlj;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    sget-object p0, Ll/zlj;->n:Ll/zlj;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_3
    sget-object p0, Ll/zlj;->j:Ll/zlj;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_4
    sget-object p0, Ll/zlj;->k:Ll/zlj;

    .line 47
    .line 48
    return-object p0
.end method

.method public static h(Ll/b13;I)Ll/b13;
    .locals 9

    .line 1
    new-instance v0, Ll/b13;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b13;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/b13;->m()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    shl-int v3, v2, p1

    .line 12
    .line 13
    add-int/lit8 v3, v3, -0x2

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    move v5, v4

    .line 17
    :goto_0
    if-ge v5, v1, :cond_5

    .line 18
    .line 19
    move v6, v4

    .line 20
    move v7, v6

    .line 21
    :goto_1
    if-ge v6, p1, :cond_2

    .line 22
    .line 23
    add-int v8, v5, v6

    .line 24
    .line 25
    if-ge v8, v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v8}, Ll/b13;->f(I)Z

    .line 28
    .line 29
    .line 30
    move-result v8

    .line 31
    if-eqz v8, :cond_1

    .line 32
    .line 33
    :cond_0
    add-int/lit8 v8, p1, -0x1

    .line 34
    .line 35
    sub-int/2addr v8, v6

    .line 36
    shl-int v8, v2, v8

    .line 37
    .line 38
    or-int/2addr v7, v8

    .line 39
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    and-int v6, v7, v3

    .line 43
    .line 44
    if-ne v6, v3, :cond_3

    .line 45
    .line 46
    invoke-virtual {v0, v6, p1}, Ll/b13;->c(II)V

    .line 47
    .line 48
    .line 49
    :goto_2
    add-int/lit8 v5, v5, -0x1

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_3
    if-nez v6, :cond_4

    .line 53
    .line 54
    or-int/lit8 v6, v7, 0x1

    .line 55
    .line 56
    invoke-virtual {v0, v6, p1}, Ll/b13;->c(II)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_4
    invoke-virtual {v0, v7, p1}, Ll/b13;->c(II)V

    .line 61
    .line 62
    .line 63
    :goto_3
    add-int/2addr v5, p1

    .line 64
    goto :goto_0

    .line 65
    :cond_5
    return-object v0
.end method

.method public static i(IZ)I
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/16 p1, 0x58

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 p1, 0x70

    .line 7
    .line 8
    :goto_0
    shl-int/lit8 v0, p0, 0x4

    .line 9
    .line 10
    add-int/2addr p1, v0

    .line 11
    mul-int/2addr p1, p0

    .line 12
    return p1
.end method
