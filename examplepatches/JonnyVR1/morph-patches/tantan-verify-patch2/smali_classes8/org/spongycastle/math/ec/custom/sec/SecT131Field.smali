.class public Lorg/spongycastle/math/ec/custom/sec/SecT131Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M03:J = 0x7L

.field private static final M44:J = 0xfffffffffffL

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
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->ROOT_Z:[J

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 8
        0x26bc4d789af13523L
        0x26bc4d789af135e2L    # 4.281425911902527E-122
        0x6
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
    aget-wide p0, p1, v0

    .line 37
    .line 38
    xor-long/2addr p0, v1

    .line 39
    aput-wide p0, p2, v0

    .line 40
    .line 41
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
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce61([JI)V

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
    const/16 v18, 0x2c

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
    const/16 v0, 0x14

    .line 28
    .line 29
    ushr-long v0, v4, v0

    .line 30
    .line 31
    const/16 v2, 0x18

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
    const/16 v0, 0x28

    .line 39
    .line 40
    ushr-long v0, v7, v0

    .line 41
    .line 42
    shl-long v2, v10, v12

    .line 43
    .line 44
    xor-long/2addr v0, v2

    .line 45
    const/16 v2, 0x30

    .line 46
    .line 47
    shl-long v2, v13, v2

    .line 48
    .line 49
    xor-long/2addr v0, v2

    .line 50
    aput-wide v0, p0, v6

    .line 51
    .line 52
    const/16 v0, 0x3c

    .line 53
    .line 54
    ushr-long v0, v10, v0

    .line 55
    .line 56
    const/16 v2, 0x1c

    .line 57
    .line 58
    shl-long v2, v16, v2

    .line 59
    .line 60
    xor-long/2addr v0, v2

    .line 61
    const/16 v2, 0x10

    .line 62
    .line 63
    ushr-long v2, v13, v2

    .line 64
    .line 65
    xor-long/2addr v0, v2

    .line 66
    aput-wide v0, p0, v9

    .line 67
    .line 68
    const/16 v0, 0x24

    .line 69
    .line 70
    ushr-long v0, v16, v0

    .line 71
    .line 72
    aput-wide v0, p0, v12

    .line 73
    .line 74
    const-wide/16 v0, 0x0

    .line 75
    .line 76
    aput-wide v0, p0, v15

    .line 77
    .line 78
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
    const/16 v9, 0x18

    .line 11
    .line 12
    ushr-long v10, v4, v9

    .line 13
    .line 14
    const/16 v12, 0x28

    .line 15
    .line 16
    shl-long/2addr v7, v12

    .line 17
    xor-long/2addr v7, v10

    .line 18
    const-wide v10, 0xfffffffffffL

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    and-long v13, v7, v10

    .line 24
    .line 25
    const/16 v7, 0x2c

    .line 26
    .line 27
    ushr-long v15, v1, v7

    .line 28
    .line 29
    const/16 v8, 0x14

    .line 30
    .line 31
    shl-long/2addr v4, v8

    .line 32
    xor-long/2addr v4, v15

    .line 33
    and-long/2addr v4, v10

    .line 34
    and-long v15, v1, v10

    .line 35
    .line 36
    aget-wide v1, p1, v0

    .line 37
    .line 38
    aget-wide v17, p1, v3

    .line 39
    .line 40
    aget-wide v19, p1, v6

    .line 41
    .line 42
    ushr-long v21, v17, v9

    .line 43
    .line 44
    shl-long v19, v19, v12

    .line 45
    .line 46
    xor-long v19, v21, v19

    .line 47
    .line 48
    and-long v21, v19, v10

    .line 49
    .line 50
    ushr-long v19, v1, v7

    .line 51
    .line 52
    shl-long v8, v17, v8

    .line 53
    .line 54
    xor-long v8, v19, v8

    .line 55
    .line 56
    and-long/2addr v8, v10

    .line 57
    and-long v17, v1, v10

    .line 58
    .line 59
    const/16 v1, 0xa

    .line 60
    .line 61
    new-array v1, v1, [J

    .line 62
    .line 63
    const/16 v20, 0x0

    .line 64
    .line 65
    move-object/from16 v19, v1

    .line 66
    .line 67
    invoke-static/range {v15 .. v20}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 68
    .line 69
    .line 70
    move-wide v1, v15

    .line 71
    move-object/from16 v27, v19

    .line 72
    .line 73
    move-wide/from16 v19, v17

    .line 74
    .line 75
    const/16 v18, 0x2

    .line 76
    .line 77
    move-wide/from16 v15, v21

    .line 78
    .line 79
    move-object/from16 v17, v27

    .line 80
    .line 81
    invoke-static/range {v13 .. v18}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 82
    .line 83
    .line 84
    xor-long v17, v1, v4

    .line 85
    .line 86
    xor-long v23, v17, v13

    .line 87
    .line 88
    xor-long v17, v19, v8

    .line 89
    .line 90
    xor-long v25, v17, v15

    .line 91
    .line 92
    const/16 v28, 0x4

    .line 93
    .line 94
    invoke-static/range {v23 .. v28}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 95
    .line 96
    .line 97
    move-wide/from16 v17, v23

    .line 98
    .line 99
    move-wide/from16 v21, v25

    .line 100
    .line 101
    shl-long/2addr v4, v3

    .line 102
    shl-long v12, v13, v6

    .line 103
    .line 104
    xor-long/2addr v4, v12

    .line 105
    shl-long/2addr v8, v3

    .line 106
    shl-long v12, v15, v6

    .line 107
    .line 108
    xor-long/2addr v8, v12

    .line 109
    xor-long v23, v1, v4

    .line 110
    .line 111
    xor-long v25, v19, v8

    .line 112
    .line 113
    const/16 v28, 0x6

    .line 114
    .line 115
    invoke-static/range {v23 .. v28}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 116
    .line 117
    .line 118
    xor-long v23, v17, v4

    .line 119
    .line 120
    xor-long v25, v21, v8

    .line 121
    .line 122
    const/16 v28, 0x8

    .line 123
    .line 124
    invoke-static/range {v23 .. v28}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 125
    .line 126
    .line 127
    const/4 v1, 0x6

    .line 128
    aget-wide v1, v27, v1

    .line 129
    .line 130
    const/16 v4, 0x8

    .line 131
    .line 132
    aget-wide v8, v27, v4

    .line 133
    .line 134
    xor-long/2addr v8, v1

    .line 135
    const/4 v5, 0x7

    .line 136
    aget-wide v12, v27, v5

    .line 137
    .line 138
    const/16 v5, 0x9

    .line 139
    .line 140
    aget-wide v14, v27, v5

    .line 141
    .line 142
    xor-long/2addr v14, v12

    .line 143
    shl-long v16, v8, v3

    .line 144
    .line 145
    xor-long v1, v16, v1

    .line 146
    .line 147
    shl-long v16, v14, v3

    .line 148
    .line 149
    xor-long v8, v8, v16

    .line 150
    .line 151
    xor-long/2addr v8, v12

    .line 152
    aget-wide v12, v27, v0

    .line 153
    .line 154
    aget-wide v16, v27, v3

    .line 155
    .line 156
    xor-long v18, v16, v12

    .line 157
    .line 158
    const/4 v5, 0x4

    .line 159
    aget-wide v20, v27, v5

    .line 160
    .line 161
    xor-long v18, v18, v20

    .line 162
    .line 163
    const/16 v20, 0x5

    .line 164
    .line 165
    aget-wide v21, v27, v20

    .line 166
    .line 167
    xor-long v16, v16, v21

    .line 168
    .line 169
    xor-long/2addr v1, v12

    .line 170
    aget-wide v21, v27, v6

    .line 171
    .line 172
    shl-long v23, v21, v5

    .line 173
    .line 174
    xor-long v1, v1, v23

    .line 175
    .line 176
    shl-long v23, v21, v3

    .line 177
    .line 178
    xor-long v1, v1, v23

    .line 179
    .line 180
    xor-long v8, v18, v8

    .line 181
    .line 182
    const/16 v23, 0x3

    .line 183
    .line 184
    aget-wide v24, v27, v23

    .line 185
    .line 186
    shl-long v28, v24, v5

    .line 187
    .line 188
    xor-long v8, v8, v28

    .line 189
    .line 190
    shl-long v28, v24, v3

    .line 191
    .line 192
    xor-long v8, v8, v28

    .line 193
    .line 194
    xor-long v14, v16, v14

    .line 195
    .line 196
    ushr-long v28, v1, v7

    .line 197
    .line 198
    xor-long v8, v8, v28

    .line 199
    .line 200
    and-long/2addr v1, v10

    .line 201
    ushr-long v28, v8, v7

    .line 202
    .line 203
    xor-long v14, v14, v28

    .line 204
    .line 205
    and-long v28, v8, v10

    .line 206
    .line 207
    ushr-long/2addr v1, v3

    .line 208
    const-wide/16 v30, 0x1

    .line 209
    .line 210
    and-long v7, v8, v30

    .line 211
    .line 212
    const/16 v9, 0x2b

    .line 213
    .line 214
    shl-long/2addr v7, v9

    .line 215
    xor-long/2addr v1, v7

    .line 216
    ushr-long v7, v28, v3

    .line 217
    .line 218
    and-long v28, v14, v30

    .line 219
    .line 220
    shl-long v28, v28, v9

    .line 221
    .line 222
    xor-long v7, v7, v28

    .line 223
    .line 224
    ushr-long/2addr v14, v3

    .line 225
    shl-long v28, v1, v3

    .line 226
    .line 227
    xor-long v1, v1, v28

    .line 228
    .line 229
    shl-long v28, v1, v6

    .line 230
    .line 231
    xor-long v1, v1, v28

    .line 232
    .line 233
    shl-long v28, v1, v5

    .line 234
    .line 235
    xor-long v1, v1, v28

    .line 236
    .line 237
    shl-long v28, v1, v4

    .line 238
    .line 239
    xor-long v1, v1, v28

    .line 240
    .line 241
    const/16 v26, 0x10

    .line 242
    .line 243
    shl-long v28, v1, v26

    .line 244
    .line 245
    xor-long v1, v1, v28

    .line 246
    .line 247
    const/16 v28, 0x20

    .line 248
    .line 249
    shl-long v29, v1, v28

    .line 250
    .line 251
    xor-long v1, v1, v29

    .line 252
    .line 253
    and-long/2addr v1, v10

    .line 254
    ushr-long v29, v1, v9

    .line 255
    .line 256
    xor-long v7, v7, v29

    .line 257
    .line 258
    shl-long v29, v7, v3

    .line 259
    .line 260
    xor-long v7, v7, v29

    .line 261
    .line 262
    shl-long v29, v7, v6

    .line 263
    .line 264
    xor-long v7, v7, v29

    .line 265
    .line 266
    shl-long v29, v7, v5

    .line 267
    .line 268
    xor-long v7, v7, v29

    .line 269
    .line 270
    shl-long v29, v7, v4

    .line 271
    .line 272
    xor-long v7, v7, v29

    .line 273
    .line 274
    shl-long v29, v7, v26

    .line 275
    .line 276
    xor-long v7, v7, v29

    .line 277
    .line 278
    shl-long v29, v7, v28

    .line 279
    .line 280
    xor-long v7, v7, v29

    .line 281
    .line 282
    and-long/2addr v7, v10

    .line 283
    ushr-long v9, v7, v9

    .line 284
    .line 285
    xor-long/2addr v9, v14

    .line 286
    shl-long v14, v9, v3

    .line 287
    .line 288
    xor-long/2addr v9, v14

    .line 289
    shl-long v14, v9, v6

    .line 290
    .line 291
    xor-long/2addr v9, v14

    .line 292
    shl-long v14, v9, v5

    .line 293
    .line 294
    xor-long/2addr v9, v14

    .line 295
    shl-long v14, v9, v4

    .line 296
    .line 297
    xor-long/2addr v9, v14

    .line 298
    shl-long v14, v9, v26

    .line 299
    .line 300
    xor-long/2addr v9, v14

    .line 301
    shl-long v14, v9, v28

    .line 302
    .line 303
    xor-long/2addr v9, v14

    .line 304
    aput-wide v12, p2, v0

    .line 305
    .line 306
    xor-long v11, v18, v1

    .line 307
    .line 308
    xor-long v11, v11, v21

    .line 309
    .line 310
    aput-wide v11, p2, v3

    .line 311
    .line 312
    xor-long v3, v16, v7

    .line 313
    .line 314
    xor-long v0, v3, v1

    .line 315
    .line 316
    xor-long v0, v0, v24

    .line 317
    .line 318
    aput-wide v0, p2, v6

    .line 319
    .line 320
    xor-long v0, v9, v7

    .line 321
    .line 322
    aput-wide v0, p2, v23

    .line 323
    .line 324
    aget-wide v0, v27, v6

    .line 325
    .line 326
    xor-long/2addr v0, v9

    .line 327
    aput-wide v0, p2, v5

    .line 328
    .line 329
    aget-wide v0, v27, v23

    .line 330
    .line 331
    aput-wide v0, p2, v20

    .line 332
    .line 333
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implCompactExt([J)V

    .line 334
    .line 335
    .line 336
    return-void
.end method

.method public static implMulw(JJ[JI)V
    .locals 18

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
    and-int/lit8 v5, v4, 0x7

    .line 41
    .line 42
    aget-wide v9, v2, v5

    .line 43
    .line 44
    ushr-int/lit8 v5, v4, 0x3

    .line 45
    .line 46
    and-int/2addr v5, v8

    .line 47
    aget-wide v11, v2, v5

    .line 48
    .line 49
    shl-long/2addr v11, v7

    .line 50
    xor-long/2addr v9, v11

    .line 51
    ushr-int/2addr v4, v6

    .line 52
    and-int/2addr v4, v8

    .line 53
    aget-wide v4, v2, v4

    .line 54
    .line 55
    shl-long/2addr v4, v6

    .line 56
    xor-long/2addr v4, v9

    .line 57
    const-wide/16 v9, 0x0

    .line 58
    .line 59
    const/16 v11, 0x21

    .line 60
    .line 61
    :cond_0
    ushr-long v12, v0, v11

    .line 62
    .line 63
    long-to-int v12, v12

    .line 64
    and-int/lit8 v13, v12, 0x7

    .line 65
    .line 66
    aget-wide v13, v2, v13

    .line 67
    .line 68
    ushr-int/lit8 v15, v12, 0x3

    .line 69
    .line 70
    and-int/2addr v15, v8

    .line 71
    aget-wide v15, v2, v15

    .line 72
    .line 73
    shl-long/2addr v15, v7

    .line 74
    xor-long/2addr v13, v15

    .line 75
    ushr-int/lit8 v15, v12, 0x6

    .line 76
    .line 77
    and-int/2addr v15, v8

    .line 78
    aget-wide v15, v2, v15

    .line 79
    .line 80
    shl-long/2addr v15, v6

    .line 81
    xor-long/2addr v13, v15

    .line 82
    const/16 v15, 0x9

    .line 83
    .line 84
    ushr-int/2addr v12, v15

    .line 85
    and-int/2addr v12, v8

    .line 86
    aget-wide v16, v2, v12

    .line 87
    .line 88
    shl-long v15, v16, v15

    .line 89
    .line 90
    xor-long v12, v13, v15

    .line 91
    .line 92
    shl-long v14, v12, v11

    .line 93
    .line 94
    xor-long/2addr v4, v14

    .line 95
    neg-int v14, v11

    .line 96
    ushr-long/2addr v12, v14

    .line 97
    xor-long/2addr v9, v12

    .line 98
    add-int/lit8 v11, v11, -0xc

    .line 99
    .line 100
    if-gtz v11, :cond_0

    .line 101
    .line 102
    const-wide v0, 0xfffffffffffL

    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    and-long/2addr v0, v4

    .line 108
    aput-wide v0, p4, p5

    .line 109
    .line 110
    add-int/lit8 v0, p5, 0x1

    .line 111
    .line 112
    const/16 v1, 0x2c

    .line 113
    .line 114
    ushr-long v1, v4, v1

    .line 115
    .line 116
    const/16 v3, 0x14

    .line 117
    .line 118
    shl-long v3, v9, v3

    .line 119
    .line 120
    xor-long/2addr v1, v3

    .line 121
    aput-wide v1, p4, v0

    .line 122
    .line 123
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
    invoke-static {p0}, Lorg/spongycastle/math/raw/Interleave;->expand8to16(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-long v0, p0

    .line 22
    const-wide v2, 0xffffffffL

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    and-long/2addr v0, v2

    .line 28
    const/4 p0, 0x4

    .line 29
    aput-wide v0, p1, p0

    .line 30
    .line 31
    return-void
.end method

.method public static invert([J[J)V
    .locals 3

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
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x4

    .line 29
    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 33
    .line 34
    .line 35
    const/16 v2, 0x8

    .line 36
    .line 37
    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 41
    .line 42
    .line 43
    const/16 v2, 0x10

    .line 44
    .line 45
    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 49
    .line 50
    .line 51
    const/16 v2, 0x20

    .line 52
    .line 53
    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 63
    .line 64
    .line 65
    const/16 p0, 0x41

    .line 66
    .line 67
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 78
    .line 79
    .line 80
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
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

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
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->addExt([J[J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static reduce([J[J)V
    .locals 21

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
    const/16 v14, 0x3d

    .line 17
    .line 18
    shl-long v15, v12, v14

    .line 19
    .line 20
    const/16 v17, 0x3f

    .line 21
    .line 22
    shl-long v18, v12, v17

    .line 23
    .line 24
    xor-long v15, v15, v18

    .line 25
    .line 26
    xor-long/2addr v4, v15

    .line 27
    ushr-long v15, v12, v9

    .line 28
    .line 29
    ushr-long v18, v12, v3

    .line 30
    .line 31
    xor-long v15, v15, v18

    .line 32
    .line 33
    xor-long/2addr v15, v12

    .line 34
    const/16 v18, 0x5

    .line 35
    .line 36
    shl-long v19, v12, v18

    .line 37
    .line 38
    xor-long v15, v15, v19

    .line 39
    .line 40
    xor-long/2addr v7, v15

    .line 41
    const/16 v15, 0x3b

    .line 42
    .line 43
    ushr-long/2addr v12, v15

    .line 44
    xor-long/2addr v10, v12

    .line 45
    shl-long v12, v10, v14

    .line 46
    .line 47
    shl-long v16, v10, v17

    .line 48
    .line 49
    xor-long v12, v12, v16

    .line 50
    .line 51
    xor-long/2addr v1, v12

    .line 52
    ushr-long v12, v10, v9

    .line 53
    .line 54
    ushr-long v16, v10, v3

    .line 55
    .line 56
    xor-long v12, v12, v16

    .line 57
    .line 58
    xor-long/2addr v12, v10

    .line 59
    shl-long v16, v10, v18

    .line 60
    .line 61
    xor-long v12, v12, v16

    .line 62
    .line 63
    xor-long/2addr v4, v12

    .line 64
    ushr-long/2addr v10, v15

    .line 65
    xor-long/2addr v7, v10

    .line 66
    ushr-long v10, v7, v9

    .line 67
    .line 68
    xor-long/2addr v1, v10

    .line 69
    shl-long v12, v10, v6

    .line 70
    .line 71
    xor-long/2addr v1, v12

    .line 72
    shl-long v12, v10, v9

    .line 73
    .line 74
    xor-long/2addr v1, v12

    .line 75
    const/16 v9, 0x8

    .line 76
    .line 77
    shl-long v9, v10, v9

    .line 78
    .line 79
    xor-long/2addr v1, v9

    .line 80
    aput-wide v1, p1, v0

    .line 81
    .line 82
    ushr-long v0, v7, v15

    .line 83
    .line 84
    xor-long/2addr v0, v4

    .line 85
    aput-wide v0, p1, v3

    .line 86
    .line 87
    const-wide/16 v0, 0x7

    .line 88
    .line 89
    and-long/2addr v0, v7

    .line 90
    aput-wide v0, p1, v6

    .line 91
    .line 92
    return-void
.end method

.method public static reduce61([JI)V
    .locals 12

    .line 1
    add-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    aget-wide v1, p0, v0

    .line 4
    .line 5
    const/4 v3, 0x3

    .line 6
    ushr-long v4, v1, v3

    .line 7
    .line 8
    aget-wide v6, p0, p1

    .line 9
    .line 10
    const/4 v8, 0x2

    .line 11
    shl-long v8, v4, v8

    .line 12
    .line 13
    xor-long/2addr v8, v4

    .line 14
    shl-long v10, v4, v3

    .line 15
    .line 16
    xor-long/2addr v8, v10

    .line 17
    const/16 v3, 0x8

    .line 18
    .line 19
    shl-long v3, v4, v3

    .line 20
    .line 21
    xor-long/2addr v3, v8

    .line 22
    xor-long/2addr v3, v6

    .line 23
    aput-wide v3, p0, p1

    .line 24
    .line 25
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    aget-wide v3, p0, p1

    .line 28
    .line 29
    const/16 v5, 0x3b

    .line 30
    .line 31
    ushr-long v5, v1, v5

    .line 32
    .line 33
    xor-long/2addr v3, v5

    .line 34
    aput-wide v3, p0, p1

    .line 35
    .line 36
    const-wide/16 v3, 0x7

    .line 37
    .line 38
    and-long/2addr v1, v3

    .line 39
    aput-wide v1, p0, v0

    .line 40
    .line 41
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
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->ROOT_Z:[J

    .line 54
    .line 55
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

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
    const/4 v0, 0x5

    .line 2
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->addExt([J[J[J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static squareN([JI[J)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 10
    .line 11
    .line 12
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    if-lez p1, :cond_0

    .line 15
    .line 16
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public static trace([J)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v0, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    aget-wide v3, p0, v2

    .line 6
    .line 7
    const/16 v5, 0x3b

    .line 8
    .line 9
    ushr-long/2addr v3, v5

    .line 10
    xor-long/2addr v0, v3

    .line 11
    const/4 v3, 0x2

    .line 12
    aget-wide v3, p0, v3

    .line 13
    .line 14
    ushr-long/2addr v3, v2

    .line 15
    xor-long/2addr v0, v3

    .line 16
    long-to-int p0, v0

    .line 17
    and-int/2addr p0, v2

    .line 18
    return p0
.end method
