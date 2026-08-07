.class public Lorg/spongycastle/math/ec/custom/sec/SecT163Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M35:J = 0x7ffffffffL

.field private static final M55:J = 0x7fffffffffffffL

.field private static final ROOT_Z:[J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [J

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->ROOT_Z:[J

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 8
        -0x4924924924924950L    # -1.921780751074024E-44
        0x492492492492db6dL    # 2.293790934720842E44
        0x492492492L
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static add([J[J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    aget-wide v3, p1, v0

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p2, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aget-wide v3, p1, v0

    .line 13
    .line 14
    xor-long/2addr v1, v3

    .line 15
    aput-wide v1, p2, v0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    aget-wide v1, p0, v0

    .line 19
    .line 20
    aget-wide p0, p1, v0

    .line 21
    .line 22
    xor-long/2addr p0, v1

    .line 23
    aput-wide p0, p2, v0

    .line 24
    .line 25
    return-void
.end method

.method public static addExt([J[J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    aget-wide v3, p1, v0

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p2, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aget-wide v3, p1, v0

    .line 13
    .line 14
    xor-long/2addr v1, v3

    .line 15
    aput-wide v1, p2, v0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    aget-wide v1, p0, v0

    .line 19
    .line 20
    aget-wide v3, p1, v0

    .line 21
    .line 22
    xor-long/2addr v1, v3

    .line 23
    aput-wide v1, p2, v0

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    aget-wide v1, p0, v0

    .line 27
    .line 28
    aget-wide v3, p1, v0

    .line 29
    .line 30
    xor-long/2addr v1, v3

    .line 31
    aput-wide v1, p2, v0

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    aget-wide v1, p0, v0

    .line 35
    .line 36
    aget-wide v3, p1, v0

    .line 37
    .line 38
    xor-long/2addr v1, v3

    .line 39
    aput-wide v1, p2, v0

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    aget-wide v1, p0, v0

    .line 43
    .line 44
    aget-wide p0, p1, v0

    .line 45
    .line 46
    xor-long/2addr p0, v1

    .line 47
    aput-wide p0, p2, v0

    .line 48
    .line 49
    return-void
.end method

.method public static addOne([J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const-wide/16 v3, 0x1

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p1, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aput-wide v1, p1, v0

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    aget-wide v1, p0, v0

    .line 16
    .line 17
    aput-wide v1, p1, v0

    .line 18
    .line 19
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat192;->fromBigInteger64(Ljava/math/BigInteger;)[J

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->reduce29([JI)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public static implCompactExt([J)V
    .locals 20

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/4 v9, 0x3

    .line 11
    aget-wide v10, p0, v9

    .line 12
    .line 13
    const/4 v12, 0x4

    .line 14
    aget-wide v13, p0, v12

    .line 15
    .line 16
    const/4 v15, 0x5

    .line 17
    aget-wide v16, p0, v15

    .line 18
    .line 19
    const/16 v18, 0x37

    .line 20
    .line 21
    shl-long v18, v4, v18

    .line 22
    .line 23
    xor-long v1, v1, v18

    .line 24
    .line 25
    aput-wide v1, p0, v0

    .line 26
    .line 27
    const/16 v0, 0x9

    .line 28
    .line 29
    ushr-long v0, v4, v0

    .line 30
    .line 31
    const/16 v2, 0x2e

    .line 32
    .line 33
    shl-long v4, v7, v2

    .line 34
    .line 35
    xor-long/2addr v0, v4

    .line 36
    aput-wide v0, p0, v3

    .line 37
    .line 38
    const/16 v0, 0x12

    .line 39
    .line 40
    ushr-long v0, v7, v0

    .line 41
    .line 42
    const/16 v2, 0x25

    .line 43
    .line 44
    shl-long v2, v10, v2

    .line 45
    .line 46
    xor-long/2addr v0, v2

    .line 47
    aput-wide v0, p0, v6

    .line 48
    .line 49
    const/16 v0, 0x1b

    .line 50
    .line 51
    ushr-long v0, v10, v0

    .line 52
    .line 53
    const/16 v2, 0x1c

    .line 54
    .line 55
    shl-long v2, v13, v2

    .line 56
    .line 57
    xor-long/2addr v0, v2

    .line 58
    aput-wide v0, p0, v9

    .line 59
    .line 60
    const/16 v0, 0x24

    .line 61
    .line 62
    ushr-long v0, v13, v0

    .line 63
    .line 64
    const/16 v2, 0x13

    .line 65
    .line 66
    shl-long v2, v16, v2

    .line 67
    .line 68
    xor-long/2addr v0, v2

    .line 69
    aput-wide v0, p0, v12

    .line 70
    .line 71
    const/16 v0, 0x2d

    .line 72
    .line 73
    ushr-long v0, v16, v0

    .line 74
    .line 75
    aput-wide v0, p0, v15

    .line 76
    .line 77
    return-void
.end method

.method public static implMultiply([J[J[J)V
    .locals 32

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/16 v9, 0x2e

    .line 11
    .line 12
    ushr-long v10, v4, v9

    .line 13
    .line 14
    const/16 v12, 0x12

    .line 15
    .line 16
    shl-long/2addr v7, v12

    .line 17
    xor-long v13, v10, v7

    .line 18
    .line 19
    const/16 v7, 0x37

    .line 20
    .line 21
    ushr-long v10, v1, v7

    .line 22
    .line 23
    const/16 v8, 0x9

    .line 24
    .line 25
    shl-long/2addr v4, v8

    .line 26
    xor-long/2addr v4, v10

    .line 27
    const-wide v10, 0x7fffffffffffffL

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    and-long/2addr v4, v10

    .line 33
    and-long v15, v1, v10

    .line 34
    .line 35
    aget-wide v1, p1, v0

    .line 36
    .line 37
    aget-wide v17, p1, v3

    .line 38
    .line 39
    aget-wide v19, p1, v6

    .line 40
    .line 41
    ushr-long v21, v17, v9

    .line 42
    .line 43
    shl-long v19, v19, v12

    .line 44
    .line 45
    xor-long v21, v21, v19

    .line 46
    .line 47
    ushr-long v19, v1, v7

    .line 48
    .line 49
    shl-long v17, v17, v8

    .line 50
    .line 51
    xor-long v17, v19, v17

    .line 52
    .line 53
    and-long v23, v17, v10

    .line 54
    .line 55
    and-long v17, v1, v10

    .line 56
    .line 57
    const/16 v1, 0xa

    .line 58
    .line 59
    new-array v1, v1, [J

    .line 60
    .line 61
    const/16 v20, 0x0

    .line 62
    .line 63
    move-object/from16 v19, v1

    .line 64
    .line 65
    invoke-static/range {v15 .. v20}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMulw(JJ[JI)V

    .line 66
    .line 67
    .line 68
    move-wide v1, v15

    .line 69
    move-object/from16 v29, v19

    .line 70
    .line 71
    move-wide/from16 v19, v17

    .line 72
    .line 73
    const/16 v18, 0x2

    .line 74
    .line 75
    move-wide/from16 v15, v21

    .line 76
    .line 77
    move-object/from16 v17, v29

    .line 78
    .line 79
    invoke-static/range {v13 .. v18}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMulw(JJ[JI)V

    .line 80
    .line 81
    .line 82
    xor-long v17, v1, v4

    .line 83
    .line 84
    xor-long v25, v17, v13

    .line 85
    .line 86
    xor-long v17, v19, v23

    .line 87
    .line 88
    xor-long v27, v17, v15

    .line 89
    .line 90
    const/16 v30, 0x4

    .line 91
    .line 92
    invoke-static/range {v25 .. v30}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMulw(JJ[JI)V

    .line 93
    .line 94
    .line 95
    move-wide/from16 v17, v25

    .line 96
    .line 97
    move-wide/from16 v21, v27

    .line 98
    .line 99
    shl-long/2addr v4, v3

    .line 100
    shl-long v12, v13, v6

    .line 101
    .line 102
    xor-long/2addr v4, v12

    .line 103
    shl-long v12, v23, v3

    .line 104
    .line 105
    shl-long v14, v15, v6

    .line 106
    .line 107
    xor-long/2addr v12, v14

    .line 108
    xor-long v25, v1, v4

    .line 109
    .line 110
    xor-long v27, v19, v12

    .line 111
    .line 112
    const/16 v30, 0x6

    .line 113
    .line 114
    invoke-static/range {v25 .. v30}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMulw(JJ[JI)V

    .line 115
    .line 116
    .line 117
    xor-long v25, v17, v4

    .line 118
    .line 119
    xor-long v27, v21, v12

    .line 120
    .line 121
    const/16 v30, 0x8

    .line 122
    .line 123
    invoke-static/range {v25 .. v30}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMulw(JJ[JI)V

    .line 124
    .line 125
    .line 126
    const/4 v1, 0x6

    .line 127
    aget-wide v1, v29, v1

    .line 128
    .line 129
    const/16 v4, 0x8

    .line 130
    .line 131
    aget-wide v12, v29, v4

    .line 132
    .line 133
    xor-long/2addr v12, v1

    .line 134
    const/4 v5, 0x7

    .line 135
    aget-wide v14, v29, v5

    .line 136
    .line 137
    aget-wide v8, v29, v8

    .line 138
    .line 139
    xor-long/2addr v8, v14

    .line 140
    shl-long v16, v12, v3

    .line 141
    .line 142
    xor-long v1, v16, v1

    .line 143
    .line 144
    shl-long v16, v8, v3

    .line 145
    .line 146
    xor-long v12, v12, v16

    .line 147
    .line 148
    xor-long/2addr v12, v14

    .line 149
    aget-wide v14, v29, v0

    .line 150
    .line 151
    aget-wide v16, v29, v3

    .line 152
    .line 153
    xor-long v18, v16, v14

    .line 154
    .line 155
    const/4 v5, 0x4

    .line 156
    aget-wide v20, v29, v5

    .line 157
    .line 158
    xor-long v18, v18, v20

    .line 159
    .line 160
    const/16 v20, 0x5

    .line 161
    .line 162
    aget-wide v21, v29, v20

    .line 163
    .line 164
    xor-long v16, v16, v21

    .line 165
    .line 166
    xor-long/2addr v1, v14

    .line 167
    aget-wide v21, v29, v6

    .line 168
    .line 169
    shl-long v23, v21, v5

    .line 170
    .line 171
    xor-long v1, v1, v23

    .line 172
    .line 173
    shl-long v23, v21, v3

    .line 174
    .line 175
    xor-long v1, v1, v23

    .line 176
    .line 177
    xor-long v12, v18, v12

    .line 178
    .line 179
    const/16 v23, 0x3

    .line 180
    .line 181
    aget-wide v24, v29, v23

    .line 182
    .line 183
    shl-long v26, v24, v5

    .line 184
    .line 185
    xor-long v12, v12, v26

    .line 186
    .line 187
    shl-long v26, v24, v3

    .line 188
    .line 189
    xor-long v12, v12, v26

    .line 190
    .line 191
    xor-long v8, v16, v8

    .line 192
    .line 193
    ushr-long v26, v1, v7

    .line 194
    .line 195
    xor-long v12, v12, v26

    .line 196
    .line 197
    and-long/2addr v1, v10

    .line 198
    ushr-long v26, v12, v7

    .line 199
    .line 200
    xor-long v7, v8, v26

    .line 201
    .line 202
    and-long v26, v12, v10

    .line 203
    .line 204
    ushr-long/2addr v1, v3

    .line 205
    const-wide/16 v30, 0x1

    .line 206
    .line 207
    and-long v12, v12, v30

    .line 208
    .line 209
    const/16 v9, 0x36

    .line 210
    .line 211
    shl-long/2addr v12, v9

    .line 212
    xor-long/2addr v1, v12

    .line 213
    ushr-long v12, v26, v3

    .line 214
    .line 215
    and-long v26, v7, v30

    .line 216
    .line 217
    shl-long v26, v26, v9

    .line 218
    .line 219
    xor-long v12, v12, v26

    .line 220
    .line 221
    ushr-long/2addr v7, v3

    .line 222
    shl-long v26, v1, v3

    .line 223
    .line 224
    xor-long v1, v1, v26

    .line 225
    .line 226
    shl-long v26, v1, v6

    .line 227
    .line 228
    xor-long v1, v1, v26

    .line 229
    .line 230
    shl-long v26, v1, v5

    .line 231
    .line 232
    xor-long v1, v1, v26

    .line 233
    .line 234
    shl-long v26, v1, v4

    .line 235
    .line 236
    xor-long v1, v1, v26

    .line 237
    .line 238
    const/16 v26, 0x10

    .line 239
    .line 240
    shl-long v27, v1, v26

    .line 241
    .line 242
    xor-long v1, v1, v27

    .line 243
    .line 244
    const/16 v27, 0x20

    .line 245
    .line 246
    shl-long v30, v1, v27

    .line 247
    .line 248
    xor-long v1, v1, v30

    .line 249
    .line 250
    and-long/2addr v1, v10

    .line 251
    ushr-long v30, v1, v9

    .line 252
    .line 253
    xor-long v12, v12, v30

    .line 254
    .line 255
    shl-long v30, v12, v3

    .line 256
    .line 257
    xor-long v12, v12, v30

    .line 258
    .line 259
    shl-long v30, v12, v6

    .line 260
    .line 261
    xor-long v12, v12, v30

    .line 262
    .line 263
    shl-long v30, v12, v5

    .line 264
    .line 265
    xor-long v12, v12, v30

    .line 266
    .line 267
    shl-long v30, v12, v4

    .line 268
    .line 269
    xor-long v12, v12, v30

    .line 270
    .line 271
    shl-long v30, v12, v26

    .line 272
    .line 273
    xor-long v12, v12, v30

    .line 274
    .line 275
    shl-long v30, v12, v27

    .line 276
    .line 277
    xor-long v12, v12, v30

    .line 278
    .line 279
    and-long/2addr v10, v12

    .line 280
    ushr-long v12, v10, v9

    .line 281
    .line 282
    xor-long/2addr v7, v12

    .line 283
    shl-long v12, v7, v3

    .line 284
    .line 285
    xor-long/2addr v7, v12

    .line 286
    shl-long v12, v7, v6

    .line 287
    .line 288
    xor-long/2addr v7, v12

    .line 289
    shl-long v12, v7, v5

    .line 290
    .line 291
    xor-long/2addr v7, v12

    .line 292
    shl-long v12, v7, v4

    .line 293
    .line 294
    xor-long/2addr v7, v12

    .line 295
    shl-long v12, v7, v26

    .line 296
    .line 297
    xor-long/2addr v7, v12

    .line 298
    shl-long v12, v7, v27

    .line 299
    .line 300
    xor-long/2addr v7, v12

    .line 301
    aput-wide v14, p2, v0

    .line 302
    .line 303
    xor-long v12, v18, v1

    .line 304
    .line 305
    xor-long v12, v12, v21

    .line 306
    .line 307
    aput-wide v12, p2, v3

    .line 308
    .line 309
    xor-long v3, v16, v10

    .line 310
    .line 311
    xor-long v0, v3, v1

    .line 312
    .line 313
    xor-long v0, v0, v24

    .line 314
    .line 315
    aput-wide v0, p2, v6

    .line 316
    .line 317
    xor-long v0, v7, v10

    .line 318
    .line 319
    aput-wide v0, p2, v23

    .line 320
    .line 321
    aget-wide v0, v29, v6

    .line 322
    .line 323
    xor-long/2addr v0, v7

    .line 324
    aput-wide v0, p2, v5

    .line 325
    .line 326
    aget-wide v0, v29, v23

    .line 327
    .line 328
    aput-wide v0, p2, v20

    .line 329
    .line 330
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implCompactExt([J)V

    .line 331
    .line 332
    .line 333
    return-void
.end method

.method public static implMulw(JJ[JI)V
    .locals 17

    .line 1
    move-wide/from16 v0, p0

    .line 2
    .line 3
    const/16 v2, 0x8

    .line 4
    .line 5
    new-array v2, v2, [J

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    aput-wide p2, v2, v3

    .line 9
    .line 10
    shl-long v4, p2, v3

    .line 11
    .line 12
    const/4 v6, 0x2

    .line 13
    aput-wide v4, v2, v6

    .line 14
    .line 15
    xor-long v4, v4, p2

    .line 16
    .line 17
    const/4 v7, 0x3

    .line 18
    aput-wide v4, v2, v7

    .line 19
    .line 20
    shl-long v8, p2, v6

    .line 21
    .line 22
    const/4 v6, 0x4

    .line 23
    aput-wide v8, v2, v6

    .line 24
    .line 25
    const/4 v6, 0x5

    .line 26
    xor-long v8, v8, p2

    .line 27
    .line 28
    aput-wide v8, v2, v6

    .line 29
    .line 30
    shl-long/2addr v4, v3

    .line 31
    const/4 v6, 0x6

    .line 32
    aput-wide v4, v2, v6

    .line 33
    .line 34
    xor-long v4, v4, p2

    .line 35
    .line 36
    const/4 v8, 0x7

    .line 37
    aput-wide v4, v2, v8

    .line 38
    .line 39
    long-to-int v4, v0

    .line 40
    and-int/2addr v4, v7

    .line 41
    aget-wide v4, v2, v4

    .line 42
    .line 43
    const-wide/16 v9, 0x0

    .line 44
    .line 45
    const/16 v11, 0x2f

    .line 46
    .line 47
    :cond_0
    ushr-long v12, v0, v11

    .line 48
    .line 49
    long-to-int v12, v12

    .line 50
    and-int/lit8 v13, v12, 0x7

    .line 51
    .line 52
    aget-wide v13, v2, v13

    .line 53
    .line 54
    ushr-int/lit8 v15, v12, 0x3

    .line 55
    .line 56
    and-int/2addr v15, v8

    .line 57
    aget-wide v15, v2, v15

    .line 58
    .line 59
    shl-long/2addr v15, v7

    .line 60
    xor-long/2addr v13, v15

    .line 61
    ushr-int/2addr v12, v6

    .line 62
    and-int/2addr v12, v8

    .line 63
    aget-wide v15, v2, v12

    .line 64
    .line 65
    shl-long/2addr v15, v6

    .line 66
    xor-long v12, v13, v15

    .line 67
    .line 68
    shl-long v14, v12, v11

    .line 69
    .line 70
    xor-long/2addr v4, v14

    .line 71
    neg-int v14, v11

    .line 72
    ushr-long/2addr v12, v14

    .line 73
    xor-long/2addr v9, v12

    .line 74
    add-int/lit8 v11, v11, -0x9

    .line 75
    .line 76
    if-gtz v11, :cond_0

    .line 77
    .line 78
    const-wide v0, 0x7fffffffffffffL

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    and-long/2addr v0, v4

    .line 84
    aput-wide v0, p4, p5

    .line 85
    .line 86
    add-int/lit8 v0, p5, 0x1

    .line 87
    .line 88
    const/16 v1, 0x37

    .line 89
    .line 90
    ushr-long v1, v4, v1

    .line 91
    .line 92
    const/16 v3, 0x9

    .line 93
    .line 94
    shl-long v3, v9, v3

    .line 95
    .line 96
    xor-long/2addr v1, v3

    .line 97
    aput-wide v1, p4, v0

    .line 98
    .line 99
    return-void
.end method

.method public static implSquare([J[J)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    invoke-static {v1, v2, p1, v0}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    aget-wide v0, p0, v0

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 12
    .line 13
    .line 14
    aget-wide v0, p0, v2

    .line 15
    .line 16
    long-to-int p0, v0

    .line 17
    invoke-static {p0}, Lorg/spongycastle/math/raw/Interleave;->expand32to64(I)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    const/4 p0, 0x4

    .line 22
    aput-wide v2, p1, p0

    .line 23
    .line 24
    const/16 p0, 0x20

    .line 25
    .line 26
    ushr-long/2addr v0, p0

    .line 27
    long-to-int p0, v0

    .line 28
    invoke-static {p0}, Lorg/spongycastle/math/raw/Interleave;->expand8to16(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-long v0, p0

    .line 33
    const-wide v2, 0xffffffffL

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    and-long/2addr v0, v2

    .line 39
    const/4 p0, 0x5

    .line 40
    aput-wide v0, p1, p0

    .line 41
    .line 42
    return-void
.end method

.method public static invert([J[J)V
    .locals 2

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat192;->isZero64([J)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->square([J[J)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x3

    .line 32
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 42
    .line 43
    .line 44
    const/16 p0, 0x9

    .line 45
    .line 46
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 56
    .line 57
    .line 58
    const/16 p0, 0x1b

    .line 59
    .line 60
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0x51

    .line 73
    .line 74
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->squareN([JI[J)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static multiply([J[J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->addExt([J[J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static reduce([J[J)V
    .locals 24

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/4 v9, 0x3

    .line 11
    aget-wide v10, p0, v9

    .line 12
    .line 13
    const/4 v12, 0x4

    .line 14
    aget-wide v12, p0, v12

    .line 15
    .line 16
    const/4 v14, 0x5

    .line 17
    aget-wide v14, p0, v14

    .line 18
    .line 19
    const/16 v16, 0x1d

    .line 20
    .line 21
    shl-long v17, v14, v16

    .line 22
    .line 23
    const/16 v19, 0x20

    .line 24
    .line 25
    shl-long v20, v14, v19

    .line 26
    .line 27
    xor-long v17, v17, v20

    .line 28
    .line 29
    const/16 v20, 0x23

    .line 30
    .line 31
    shl-long v21, v14, v20

    .line 32
    .line 33
    xor-long v17, v17, v21

    .line 34
    .line 35
    const/16 v21, 0x24

    .line 36
    .line 37
    shl-long v22, v14, v21

    .line 38
    .line 39
    xor-long v17, v17, v22

    .line 40
    .line 41
    xor-long v7, v7, v17

    .line 42
    .line 43
    ushr-long v17, v14, v20

    .line 44
    .line 45
    ushr-long v22, v14, v19

    .line 46
    .line 47
    xor-long v17, v17, v22

    .line 48
    .line 49
    ushr-long v22, v14, v16

    .line 50
    .line 51
    xor-long v17, v17, v22

    .line 52
    .line 53
    const/16 v22, 0x1c

    .line 54
    .line 55
    ushr-long v14, v14, v22

    .line 56
    .line 57
    xor-long v14, v17, v14

    .line 58
    .line 59
    xor-long/2addr v10, v14

    .line 60
    shl-long v14, v12, v16

    .line 61
    .line 62
    shl-long v17, v12, v19

    .line 63
    .line 64
    xor-long v14, v14, v17

    .line 65
    .line 66
    shl-long v17, v12, v20

    .line 67
    .line 68
    xor-long v14, v14, v17

    .line 69
    .line 70
    shl-long v17, v12, v21

    .line 71
    .line 72
    xor-long v14, v14, v17

    .line 73
    .line 74
    xor-long/2addr v4, v14

    .line 75
    ushr-long v14, v12, v20

    .line 76
    .line 77
    ushr-long v17, v12, v19

    .line 78
    .line 79
    xor-long v14, v14, v17

    .line 80
    .line 81
    ushr-long v17, v12, v16

    .line 82
    .line 83
    xor-long v14, v14, v17

    .line 84
    .line 85
    ushr-long v12, v12, v22

    .line 86
    .line 87
    xor-long/2addr v12, v14

    .line 88
    xor-long/2addr v7, v12

    .line 89
    shl-long v12, v10, v16

    .line 90
    .line 91
    shl-long v14, v10, v19

    .line 92
    .line 93
    xor-long/2addr v12, v14

    .line 94
    shl-long v14, v10, v20

    .line 95
    .line 96
    xor-long/2addr v12, v14

    .line 97
    shl-long v14, v10, v21

    .line 98
    .line 99
    xor-long/2addr v12, v14

    .line 100
    xor-long/2addr v1, v12

    .line 101
    ushr-long v12, v10, v20

    .line 102
    .line 103
    ushr-long v14, v10, v19

    .line 104
    .line 105
    xor-long/2addr v12, v14

    .line 106
    ushr-long v14, v10, v16

    .line 107
    .line 108
    xor-long/2addr v12, v14

    .line 109
    ushr-long v10, v10, v22

    .line 110
    .line 111
    xor-long/2addr v10, v12

    .line 112
    xor-long/2addr v4, v10

    .line 113
    ushr-long v10, v7, v20

    .line 114
    .line 115
    xor-long/2addr v1, v10

    .line 116
    shl-long v12, v10, v9

    .line 117
    .line 118
    xor-long/2addr v1, v12

    .line 119
    const/4 v9, 0x6

    .line 120
    shl-long v12, v10, v9

    .line 121
    .line 122
    xor-long/2addr v1, v12

    .line 123
    const/4 v9, 0x7

    .line 124
    shl-long v9, v10, v9

    .line 125
    .line 126
    xor-long/2addr v1, v9

    .line 127
    aput-wide v1, p1, v0

    .line 128
    .line 129
    aput-wide v4, p1, v3

    .line 130
    .line 131
    const-wide v0, 0x7ffffffffL

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    and-long/2addr v0, v7

    .line 137
    aput-wide v0, p1, v6

    .line 138
    .line 139
    return-void
.end method

.method public static reduce29([JI)V
    .locals 11

    .line 1
    add-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    aget-wide v1, p0, v0

    .line 4
    .line 5
    const/16 v3, 0x23

    .line 6
    .line 7
    ushr-long v3, v1, v3

    .line 8
    .line 9
    aget-wide v5, p0, p1

    .line 10
    .line 11
    const/4 v7, 0x3

    .line 12
    shl-long v7, v3, v7

    .line 13
    .line 14
    xor-long/2addr v7, v3

    .line 15
    const/4 v9, 0x6

    .line 16
    shl-long v9, v3, v9

    .line 17
    .line 18
    xor-long/2addr v7, v9

    .line 19
    const/4 v9, 0x7

    .line 20
    shl-long/2addr v3, v9

    .line 21
    xor-long/2addr v3, v7

    .line 22
    xor-long/2addr v3, v5

    .line 23
    aput-wide v3, p0, p1

    .line 24
    .line 25
    const-wide v3, 0x7ffffffffL

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    and-long/2addr v1, v3

    .line 31
    aput-wide v1, p0, v0

    .line 32
    .line 33
    return-void
.end method

.method public static sqrt([J[J)V
    .locals 14

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    aget-wide v2, p0, v1

    .line 7
    .line 8
    invoke-static {v2, v3}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const/4 v4, 0x1

    .line 13
    aget-wide v5, p0, v4

    .line 14
    .line 15
    invoke-static {v5, v6}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    const-wide v7, 0xffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    and-long v9, v2, v7

    .line 25
    .line 26
    const/16 v11, 0x20

    .line 27
    .line 28
    shl-long v12, v5, v11

    .line 29
    .line 30
    or-long/2addr v9, v12

    .line 31
    ushr-long/2addr v2, v11

    .line 32
    const-wide v12, -0x100000000L

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long/2addr v5, v12

    .line 38
    or-long/2addr v2, v5

    .line 39
    aput-wide v2, v0, v1

    .line 40
    .line 41
    const/4 v2, 0x2

    .line 42
    aget-wide v2, p0, v2

    .line 43
    .line 44
    invoke-static {v2, v3}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    and-long v5, v2, v7

    .line 49
    .line 50
    ushr-long/2addr v2, v11

    .line 51
    aput-wide v2, v0, v4

    .line 52
    .line 53
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->ROOT_Z:[J

    .line 54
    .line 55
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->multiply([J[J[J)V

    .line 56
    .line 57
    .line 58
    aget-wide v2, p1, v1

    .line 59
    .line 60
    xor-long/2addr v2, v9

    .line 61
    aput-wide v2, p1, v1

    .line 62
    .line 63
    aget-wide v0, p1, v4

    .line 64
    .line 65
    xor-long/2addr v0, v5

    .line 66
    aput-wide v0, p1, v4

    .line 67
    .line 68
    return-void
.end method

.method public static square([J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->addExt([J[J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareN([JI[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->implSquare([J[J)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT163Field;->reduce([J[J)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public static trace([J)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v0, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x2

    .line 5
    aget-wide v2, p0, v2

    .line 6
    .line 7
    const/16 p0, 0x1d

    .line 8
    .line 9
    ushr-long/2addr v2, p0

    .line 10
    xor-long/2addr v0, v2

    .line 11
    long-to-int p0, v0

    .line 12
    and-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    return p0
.end method
