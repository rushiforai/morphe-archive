.class public final Lcom/alibaba/fastjson/util/RyuDouble;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final POW5_INV_SPLIT:[[I

.field private static final POW5_SPLIT:[[I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x4

    .line 6
    aput v3, v1, v2

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    const/16 v5, 0x146

    .line 10
    .line 11
    aput v5, v1, v4

    .line 12
    .line 13
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 14
    .line 15
    invoke-static {v6, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, [[I

    .line 20
    .line 21
    sput-object v1, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_SPLIT:[[I

    .line 22
    .line 23
    new-array v0, v0, [I

    .line 24
    .line 25
    aput v3, v0, v2

    .line 26
    .line 27
    const/16 v1, 0x123

    .line 28
    .line 29
    aput v1, v0, v4

    .line 30
    .line 31
    invoke-static {v6, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, [[I

    .line 36
    .line 37
    sput-object v0, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_INV_SPLIT:[[I

    .line 38
    .line 39
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    .line 40
    .line 41
    const/16 v1, 0x1f

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v7, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    move v7, v4

    .line 60
    :goto_0
    if-ge v7, v5, :cond_5

    .line 61
    .line 62
    const-wide/16 v8, 0x5

    .line 63
    .line 64
    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    invoke-virtual {v8, v7}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    invoke-virtual {v8}, Ljava/math/BigInteger;->bitLength()I

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    if-nez v7, :cond_0

    .line 77
    .line 78
    move v10, v2

    .line 79
    goto :goto_1

    .line 80
    :cond_0
    int-to-long v10, v7

    .line 81
    const-wide/32 v12, 0x1624c50

    .line 82
    .line 83
    .line 84
    mul-long/2addr v10, v12

    .line 85
    const-wide/32 v12, 0x98967f

    .line 86
    .line 87
    .line 88
    add-long/2addr v10, v12

    .line 89
    const-wide/32 v12, 0x989680

    .line 90
    .line 91
    .line 92
    div-long/2addr v10, v12

    .line 93
    long-to-int v10, v10

    .line 94
    :goto_1
    if-ne v10, v9, :cond_4

    .line 95
    .line 96
    sget-object v10, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_SPLIT:[[I

    .line 97
    .line 98
    array-length v10, v10

    .line 99
    if-ge v7, v10, :cond_1

    .line 100
    .line 101
    move v10, v4

    .line 102
    :goto_2
    if-ge v10, v3, :cond_1

    .line 103
    .line 104
    sget-object v11, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_SPLIT:[[I

    .line 105
    .line 106
    aget-object v11, v11, v7

    .line 107
    .line 108
    add-int/lit8 v12, v9, -0x79

    .line 109
    .line 110
    rsub-int/lit8 v13, v10, 0x3

    .line 111
    .line 112
    mul-int/2addr v13, v1

    .line 113
    add-int/2addr v12, v13

    .line 114
    invoke-virtual {v8, v12}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 115
    .line 116
    .line 117
    move-result-object v12

    .line 118
    invoke-virtual {v12, v6}, Ljava/math/BigInteger;->and(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    invoke-virtual {v12}, Ljava/math/BigInteger;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result v12

    .line 126
    aput v12, v11, v10

    .line 127
    .line 128
    add-int/lit8 v10, v10, 0x1

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_1
    sget-object v10, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_INV_SPLIT:[[I

    .line 132
    .line 133
    array-length v10, v10

    .line 134
    if-ge v7, v10, :cond_3

    .line 135
    .line 136
    add-int/lit8 v9, v9, 0x79

    .line 137
    .line 138
    sget-object v10, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    .line 139
    .line 140
    invoke-virtual {v10, v9}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 141
    .line 142
    .line 143
    move-result-object v9

    .line 144
    invoke-virtual {v9, v8}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-virtual {v8, v10}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 149
    .line 150
    .line 151
    move-result-object v8

    .line 152
    move v9, v4

    .line 153
    :goto_3
    if-ge v9, v3, :cond_3

    .line 154
    .line 155
    if-nez v9, :cond_2

    .line 156
    .line 157
    sget-object v10, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_INV_SPLIT:[[I

    .line 158
    .line 159
    aget-object v10, v10, v7

    .line 160
    .line 161
    rsub-int/lit8 v11, v9, 0x3

    .line 162
    .line 163
    mul-int/2addr v11, v1

    .line 164
    invoke-virtual {v8, v11}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 165
    .line 166
    .line 167
    move-result-object v11

    .line 168
    invoke-virtual {v11}, Ljava/math/BigInteger;->intValue()I

    .line 169
    .line 170
    .line 171
    move-result v11

    .line 172
    aput v11, v10, v9

    .line 173
    .line 174
    goto :goto_4

    .line 175
    :cond_2
    sget-object v10, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_INV_SPLIT:[[I

    .line 176
    .line 177
    aget-object v10, v10, v7

    .line 178
    .line 179
    rsub-int/lit8 v11, v9, 0x3

    .line 180
    .line 181
    mul-int/2addr v11, v1

    .line 182
    invoke-virtual {v8, v11}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-virtual {v11, v0}, Ljava/math/BigInteger;->and(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 187
    .line 188
    .line 189
    move-result-object v11

    .line 190
    invoke-virtual {v11}, Ljava/math/BigInteger;->intValue()I

    .line 191
    .line 192
    .line 193
    move-result v11

    .line 194
    aput v11, v10, v9

    .line 195
    .line 196
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 204
    .line 205
    new-instance v1, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v2, " != "

    .line 214
    .line 215
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    throw v0

    .line 229
    :cond_5
    return-void
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

.method public static toString(D[CI)I
    .locals 55

    .line 1
    invoke-static/range {p0 .. p1}, Ljava/lang/Double;->isNaN(D)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    add-int/lit8 v0, p3, 0x1

    .line 8
    .line 9
    const/16 v1, 0x4e

    .line 10
    .line 11
    aput-char v1, p2, p3

    .line 12
    .line 13
    add-int/lit8 v2, p3, 0x2

    .line 14
    .line 15
    const/16 v3, 0x61

    .line 16
    .line 17
    aput-char v3, p2, v0

    .line 18
    .line 19
    add-int/lit8 v0, p3, 0x3

    .line 20
    .line 21
    aput-char v1, p2, v2

    .line 22
    .line 23
    :goto_0
    sub-int v0, v0, p3

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 27
    .line 28
    cmpl-double v0, p0, v0

    .line 29
    .line 30
    const/16 v1, 0x74

    .line 31
    .line 32
    const/16 v2, 0x66

    .line 33
    .line 34
    const/16 v3, 0x49

    .line 35
    .line 36
    const/16 v4, 0x79

    .line 37
    .line 38
    const/16 v5, 0x69

    .line 39
    .line 40
    const/16 v6, 0x6e

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    add-int/lit8 v0, p3, 0x1

    .line 45
    .line 46
    aput-char v3, p2, p3

    .line 47
    .line 48
    add-int/lit8 v3, p3, 0x2

    .line 49
    .line 50
    aput-char v6, p2, v0

    .line 51
    .line 52
    add-int/lit8 v0, p3, 0x3

    .line 53
    .line 54
    aput-char v2, p2, v3

    .line 55
    .line 56
    add-int/lit8 v2, p3, 0x4

    .line 57
    .line 58
    aput-char v5, p2, v0

    .line 59
    .line 60
    add-int/lit8 v0, p3, 0x5

    .line 61
    .line 62
    aput-char v6, p2, v2

    .line 63
    .line 64
    add-int/lit8 v2, p3, 0x6

    .line 65
    .line 66
    aput-char v5, p2, v0

    .line 67
    .line 68
    add-int/lit8 v0, p3, 0x7

    .line 69
    .line 70
    aput-char v1, p2, v2

    .line 71
    .line 72
    add-int/lit8 v1, p3, 0x8

    .line 73
    .line 74
    aput-char v4, p2, v0

    .line 75
    .line 76
    :goto_1
    sub-int v1, v1, p3

    .line 77
    .line 78
    return v1

    .line 79
    :cond_1
    const-wide/high16 v7, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 80
    .line 81
    cmpl-double v0, p0, v7

    .line 82
    .line 83
    const/16 v7, 0x2d

    .line 84
    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    add-int/lit8 v0, p3, 0x1

    .line 88
    .line 89
    aput-char v7, p2, p3

    .line 90
    .line 91
    add-int/lit8 v7, p3, 0x2

    .line 92
    .line 93
    aput-char v3, p2, v0

    .line 94
    .line 95
    add-int/lit8 v0, p3, 0x3

    .line 96
    .line 97
    aput-char v6, p2, v7

    .line 98
    .line 99
    add-int/lit8 v3, p3, 0x4

    .line 100
    .line 101
    aput-char v2, p2, v0

    .line 102
    .line 103
    add-int/lit8 v0, p3, 0x5

    .line 104
    .line 105
    aput-char v5, p2, v3

    .line 106
    .line 107
    add-int/lit8 v2, p3, 0x6

    .line 108
    .line 109
    aput-char v6, p2, v0

    .line 110
    .line 111
    add-int/lit8 v0, p3, 0x7

    .line 112
    .line 113
    aput-char v5, p2, v2

    .line 114
    .line 115
    add-int/lit8 v2, p3, 0x8

    .line 116
    .line 117
    aput-char v1, p2, v0

    .line 118
    .line 119
    add-int/lit8 v0, p3, 0x9

    .line 120
    .line 121
    aput-char v4, p2, v2

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    invoke-static/range {p0 .. p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 125
    .line 126
    .line 127
    move-result-wide v0

    .line 128
    const-wide/16 v2, 0x0

    .line 129
    .line 130
    cmp-long v5, v0, v2

    .line 131
    .line 132
    const/16 v6, 0x2e

    .line 133
    .line 134
    const/16 v8, 0x30

    .line 135
    .line 136
    if-nez v5, :cond_3

    .line 137
    .line 138
    add-int/lit8 v0, p3, 0x1

    .line 139
    .line 140
    aput-char v8, p2, p3

    .line 141
    .line 142
    add-int/lit8 v1, p3, 0x2

    .line 143
    .line 144
    aput-char v6, p2, v0

    .line 145
    .line 146
    add-int/lit8 v0, p3, 0x3

    .line 147
    .line 148
    aput-char v8, p2, v1

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_3
    const-wide/high16 v9, -0x8000000000000000L

    .line 152
    .line 153
    cmp-long v9, v0, v9

    .line 154
    .line 155
    if-nez v9, :cond_4

    .line 156
    .line 157
    add-int/lit8 v0, p3, 0x1

    .line 158
    .line 159
    aput-char v7, p2, p3

    .line 160
    .line 161
    add-int/lit8 v1, p3, 0x2

    .line 162
    .line 163
    aput-char v8, p2, v0

    .line 164
    .line 165
    add-int/lit8 v0, p3, 0x3

    .line 166
    .line 167
    aput-char v6, p2, v1

    .line 168
    .line 169
    add-int/lit8 v1, p3, 0x4

    .line 170
    .line 171
    aput-char v8, p2, v0

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_4
    const/16 v9, 0x34

    .line 175
    .line 176
    ushr-long v9, v0, v9

    .line 177
    .line 178
    const-wide/16 v11, 0x7ff

    .line 179
    .line 180
    and-long/2addr v9, v11

    .line 181
    long-to-int v9, v9

    .line 182
    const-wide v10, 0xfffffffffffffL

    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    and-long/2addr v0, v10

    .line 188
    const-wide/high16 v10, 0x10000000000000L

    .line 189
    .line 190
    if-nez v9, :cond_5

    .line 191
    .line 192
    const/16 v12, -0x432

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_5
    add-int/lit16 v12, v9, -0x433

    .line 196
    .line 197
    or-long/2addr v0, v10

    .line 198
    :goto_2
    const/4 v13, 0x0

    .line 199
    const/4 v14, 0x1

    .line 200
    if-gez v5, :cond_6

    .line 201
    .line 202
    move v5, v14

    .line 203
    goto :goto_3

    .line 204
    :cond_6
    move v5, v13

    .line 205
    :goto_3
    const-wide/16 v15, 0x1

    .line 206
    .line 207
    and-long v17, v0, v15

    .line 208
    .line 209
    cmp-long v17, v17, v2

    .line 210
    .line 211
    if-nez v17, :cond_7

    .line 212
    .line 213
    move/from16 v17, v14

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_7
    move/from16 v17, v13

    .line 217
    .line 218
    :goto_4
    const-wide/16 v18, 0x4

    .line 219
    .line 220
    mul-long v18, v18, v0

    .line 221
    .line 222
    const-wide/16 v20, 0x2

    .line 223
    .line 224
    add-long v22, v18, v20

    .line 225
    .line 226
    cmp-long v0, v0, v10

    .line 227
    .line 228
    if-nez v0, :cond_9

    .line 229
    .line 230
    if-gt v9, v14, :cond_8

    .line 231
    .line 232
    goto :goto_5

    .line 233
    :cond_8
    move v0, v13

    .line 234
    goto :goto_6

    .line 235
    :cond_9
    :goto_5
    move v0, v14

    .line 236
    :goto_6
    sub-long v9, v18, v15

    .line 237
    .line 238
    move-wide/from16 p0, v2

    .line 239
    .line 240
    int-to-long v2, v0

    .line 241
    sub-long/2addr v9, v2

    .line 242
    add-int/lit8 v12, v12, -0x2

    .line 243
    .line 244
    const-string v1, ""

    .line 245
    .line 246
    const-wide/32 v24, 0x1624c50

    .line 247
    .line 248
    .line 249
    const-wide/32 v26, 0x989680

    .line 250
    .line 251
    .line 252
    const-wide/32 v28, 0x7fffffff

    .line 253
    .line 254
    .line 255
    const/16 v30, 0x4

    .line 256
    .line 257
    const-wide/32 v31, 0x98967f

    .line 258
    .line 259
    .line 260
    const/16 v33, 0x2

    .line 261
    .line 262
    const/16 v34, 0x1f

    .line 263
    .line 264
    if-ltz v12, :cond_23

    .line 265
    .line 266
    move/from16 v35, v4

    .line 267
    .line 268
    const/16 v36, 0x3

    .line 269
    .line 270
    int-to-long v3, v12

    .line 271
    const-wide/32 v37, 0x2deefb

    .line 272
    .line 273
    .line 274
    mul-long v3, v3, v37

    .line 275
    .line 276
    div-long v3, v3, v26

    .line 277
    .line 278
    long-to-int v0, v3

    .line 279
    sub-int/2addr v0, v14

    .line 280
    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-nez v0, :cond_a

    .line 285
    .line 286
    move v3, v14

    .line 287
    goto :goto_7

    .line 288
    :cond_a
    int-to-long v3, v0

    .line 289
    mul-long v3, v3, v24

    .line 290
    .line 291
    add-long v3, v3, v31

    .line 292
    .line 293
    div-long v3, v3, v26

    .line 294
    .line 295
    long-to-int v3, v3

    .line 296
    :goto_7
    add-int/lit8 v3, v3, 0x79

    .line 297
    .line 298
    neg-int v4, v12

    .line 299
    add-int/2addr v4, v0

    .line 300
    add-int/2addr v4, v3

    .line 301
    add-int/lit8 v4, v4, -0x72

    .line 302
    .line 303
    if-ltz v4, :cond_22

    .line 304
    .line 305
    sget-object v1, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_INV_SPLIT:[[I

    .line 306
    .line 307
    aget-object v1, v1, v0

    .line 308
    .line 309
    ushr-long v24, v18, v34

    .line 310
    .line 311
    and-long v31, v18, v28

    .line 312
    .line 313
    aget v3, v1, v13

    .line 314
    .line 315
    move/from16 v38, v6

    .line 316
    .line 317
    move/from16 v37, v7

    .line 318
    .line 319
    int-to-long v6, v3

    .line 320
    mul-long v6, v6, v24

    .line 321
    .line 322
    move/from16 v39, v8

    .line 323
    .line 324
    move-wide/from16 v40, v9

    .line 325
    .line 326
    int-to-long v8, v3

    .line 327
    mul-long v8, v8, v31

    .line 328
    .line 329
    aget v10, v1, v14

    .line 330
    .line 331
    move/from16 v42, v14

    .line 332
    .line 333
    move-wide/from16 v43, v15

    .line 334
    .line 335
    int-to-long v14, v10

    .line 336
    mul-long v14, v14, v24

    .line 337
    .line 338
    move/from16 v16, v13

    .line 339
    .line 340
    move-wide/from16 v45, v14

    .line 341
    .line 342
    int-to-long v13, v10

    .line 343
    mul-long v13, v13, v31

    .line 344
    .line 345
    aget v12, v1, v33

    .line 346
    .line 347
    move/from16 v35, v3

    .line 348
    .line 349
    const/16 v15, 0xa

    .line 350
    .line 351
    int-to-long v2, v12

    .line 352
    mul-long v2, v2, v24

    .line 353
    .line 354
    move-object/from16 v47, v1

    .line 355
    .line 356
    move-wide/from16 v48, v2

    .line 357
    .line 358
    int-to-long v1, v12

    .line 359
    mul-long v1, v1, v31

    .line 360
    .line 361
    aget v3, v47, v36

    .line 362
    .line 363
    move/from16 v50, v12

    .line 364
    .line 365
    const/16 v47, 0x15

    .line 366
    .line 367
    int-to-long v11, v3

    .line 368
    mul-long v24, v24, v11

    .line 369
    .line 370
    int-to-long v11, v3

    .line 371
    mul-long v31, v31, v11

    .line 372
    .line 373
    ushr-long v11, v31, v34

    .line 374
    .line 375
    add-long/2addr v11, v1

    .line 376
    add-long v11, v11, v24

    .line 377
    .line 378
    ushr-long v1, v11, v34

    .line 379
    .line 380
    add-long/2addr v1, v13

    .line 381
    add-long v1, v1, v48

    .line 382
    .line 383
    ushr-long v1, v1, v34

    .line 384
    .line 385
    add-long/2addr v1, v8

    .line 386
    add-long v1, v1, v45

    .line 387
    .line 388
    ushr-long v1, v1, v47

    .line 389
    .line 390
    shl-long/2addr v6, v15

    .line 391
    add-long/2addr v1, v6

    .line 392
    ushr-long/2addr v1, v4

    .line 393
    ushr-long v6, v22, v34

    .line 394
    .line 395
    and-long v8, v22, v28

    .line 396
    .line 397
    move/from16 v11, v35

    .line 398
    .line 399
    int-to-long v12, v11

    .line 400
    mul-long/2addr v12, v6

    .line 401
    move-wide/from16 v24, v1

    .line 402
    .line 403
    int-to-long v1, v11

    .line 404
    mul-long/2addr v1, v8

    .line 405
    move-wide/from16 v31, v1

    .line 406
    .line 407
    int-to-long v1, v10

    .line 408
    mul-long/2addr v1, v6

    .line 409
    move-wide/from16 v45, v1

    .line 410
    .line 411
    int-to-long v1, v10

    .line 412
    mul-long/2addr v1, v8

    .line 413
    move-wide/from16 v48, v1

    .line 414
    .line 415
    move/from16 v14, v50

    .line 416
    .line 417
    int-to-long v1, v14

    .line 418
    mul-long/2addr v1, v6

    .line 419
    move-wide/from16 v50, v1

    .line 420
    .line 421
    int-to-long v1, v14

    .line 422
    mul-long/2addr v1, v8

    .line 423
    move-wide/from16 v52, v1

    .line 424
    .line 425
    int-to-long v1, v3

    .line 426
    mul-long/2addr v6, v1

    .line 427
    int-to-long v1, v3

    .line 428
    mul-long/2addr v8, v1

    .line 429
    ushr-long v1, v8, v34

    .line 430
    .line 431
    add-long v1, v1, v52

    .line 432
    .line 433
    add-long/2addr v1, v6

    .line 434
    ushr-long v1, v1, v34

    .line 435
    .line 436
    add-long v1, v1, v48

    .line 437
    .line 438
    add-long v1, v1, v50

    .line 439
    .line 440
    ushr-long v1, v1, v34

    .line 441
    .line 442
    add-long v1, v1, v31

    .line 443
    .line 444
    add-long v1, v1, v45

    .line 445
    .line 446
    ushr-long v1, v1, v47

    .line 447
    .line 448
    shl-long v6, v12, v15

    .line 449
    .line 450
    add-long/2addr v1, v6

    .line 451
    ushr-long/2addr v1, v4

    .line 452
    ushr-long v6, v40, v34

    .line 453
    .line 454
    and-long v8, v40, v28

    .line 455
    .line 456
    int-to-long v12, v11

    .line 457
    mul-long/2addr v12, v6

    .line 458
    move-wide/from16 v31, v1

    .line 459
    .line 460
    int-to-long v1, v11

    .line 461
    mul-long/2addr v1, v8

    .line 462
    move-wide/from16 v28, v1

    .line 463
    .line 464
    int-to-long v1, v10

    .line 465
    mul-long/2addr v1, v6

    .line 466
    int-to-long v10, v10

    .line 467
    mul-long/2addr v10, v8

    .line 468
    move-wide/from16 v45, v1

    .line 469
    .line 470
    int-to-long v1, v14

    .line 471
    mul-long/2addr v1, v6

    .line 472
    move-wide/from16 v48, v1

    .line 473
    .line 474
    int-to-long v1, v14

    .line 475
    mul-long/2addr v1, v8

    .line 476
    move-wide/from16 v50, v1

    .line 477
    .line 478
    int-to-long v1, v3

    .line 479
    mul-long/2addr v6, v1

    .line 480
    int-to-long v1, v3

    .line 481
    mul-long/2addr v8, v1

    .line 482
    ushr-long v1, v8, v34

    .line 483
    .line 484
    add-long v1, v1, v50

    .line 485
    .line 486
    add-long/2addr v1, v6

    .line 487
    ushr-long v1, v1, v34

    .line 488
    .line 489
    add-long/2addr v1, v10

    .line 490
    add-long v1, v1, v48

    .line 491
    .line 492
    ushr-long v1, v1, v34

    .line 493
    .line 494
    add-long v1, v1, v28

    .line 495
    .line 496
    add-long v1, v1, v45

    .line 497
    .line 498
    ushr-long v1, v1, v47

    .line 499
    .line 500
    shl-long v6, v12, v15

    .line 501
    .line 502
    add-long/2addr v1, v6

    .line 503
    ushr-long/2addr v1, v4

    .line 504
    move/from16 v3, v47

    .line 505
    .line 506
    if-gt v0, v3, :cond_21

    .line 507
    .line 508
    const-wide/16 v3, 0x5

    .line 509
    .line 510
    rem-long v6, v18, v3

    .line 511
    .line 512
    cmp-long v6, v6, p0

    .line 513
    .line 514
    const-wide/16 v7, 0x7d

    .line 515
    .line 516
    const-wide/16 v9, 0x19

    .line 517
    .line 518
    const-wide/16 v11, 0x271

    .line 519
    .line 520
    if-nez v6, :cond_12

    .line 521
    .line 522
    if-eqz v6, :cond_b

    .line 523
    .line 524
    move/from16 v6, v16

    .line 525
    .line 526
    goto :goto_9

    .line 527
    :cond_b
    rem-long v9, v18, v9

    .line 528
    .line 529
    cmp-long v6, v9, p0

    .line 530
    .line 531
    if-eqz v6, :cond_c

    .line 532
    .line 533
    move/from16 v6, v42

    .line 534
    .line 535
    goto :goto_9

    .line 536
    :cond_c
    rem-long v6, v18, v7

    .line 537
    .line 538
    cmp-long v6, v6, p0

    .line 539
    .line 540
    if-eqz v6, :cond_d

    .line 541
    .line 542
    move/from16 v6, v33

    .line 543
    .line 544
    goto :goto_9

    .line 545
    :cond_d
    rem-long v6, v18, v11

    .line 546
    .line 547
    cmp-long v6, v6, p0

    .line 548
    .line 549
    if-eqz v6, :cond_e

    .line 550
    .line 551
    move/from16 v6, v36

    .line 552
    .line 553
    goto :goto_9

    .line 554
    :cond_e
    div-long v18, v18, v11

    .line 555
    .line 556
    move/from16 v6, v30

    .line 557
    .line 558
    :goto_8
    cmp-long v7, v18, p0

    .line 559
    .line 560
    if-lez v7, :cond_10

    .line 561
    .line 562
    rem-long v7, v18, v3

    .line 563
    .line 564
    cmp-long v7, v7, p0

    .line 565
    .line 566
    if-eqz v7, :cond_f

    .line 567
    .line 568
    goto :goto_9

    .line 569
    :cond_f
    div-long v18, v18, v3

    .line 570
    .line 571
    add-int/lit8 v6, v6, 0x1

    .line 572
    .line 573
    goto :goto_8

    .line 574
    :cond_10
    :goto_9
    if-lt v6, v0, :cond_11

    .line 575
    .line 576
    move/from16 v3, v42

    .line 577
    .line 578
    goto :goto_a

    .line 579
    :cond_11
    move/from16 v3, v16

    .line 580
    .line 581
    :goto_a
    move v4, v3

    .line 582
    move/from16 v3, v16

    .line 583
    .line 584
    goto/16 :goto_10

    .line 585
    .line 586
    :cond_12
    if-eqz v17, :cond_1a

    .line 587
    .line 588
    rem-long v13, v40, v3

    .line 589
    .line 590
    cmp-long v6, v13, p0

    .line 591
    .line 592
    if-eqz v6, :cond_13

    .line 593
    .line 594
    move/from16 v6, v16

    .line 595
    .line 596
    goto :goto_c

    .line 597
    :cond_13
    rem-long v9, v40, v9

    .line 598
    .line 599
    cmp-long v6, v9, p0

    .line 600
    .line 601
    if-eqz v6, :cond_14

    .line 602
    .line 603
    move/from16 v6, v42

    .line 604
    .line 605
    goto :goto_c

    .line 606
    :cond_14
    rem-long v9, v40, v7

    .line 607
    .line 608
    cmp-long v6, v9, p0

    .line 609
    .line 610
    if-eqz v6, :cond_15

    .line 611
    .line 612
    move/from16 v6, v33

    .line 613
    .line 614
    goto :goto_c

    .line 615
    :cond_15
    rem-long v9, v40, v11

    .line 616
    .line 617
    cmp-long v6, v9, p0

    .line 618
    .line 619
    if-eqz v6, :cond_16

    .line 620
    .line 621
    move/from16 v6, v36

    .line 622
    .line 623
    goto :goto_c

    .line 624
    :cond_16
    div-long v9, v40, v11

    .line 625
    .line 626
    move/from16 v6, v30

    .line 627
    .line 628
    :goto_b
    cmp-long v7, v9, p0

    .line 629
    .line 630
    if-lez v7, :cond_18

    .line 631
    .line 632
    rem-long v7, v9, v3

    .line 633
    .line 634
    cmp-long v7, v7, p0

    .line 635
    .line 636
    if-eqz v7, :cond_17

    .line 637
    .line 638
    goto :goto_c

    .line 639
    :cond_17
    div-long/2addr v9, v3

    .line 640
    add-int/lit8 v6, v6, 0x1

    .line 641
    .line 642
    goto :goto_b

    .line 643
    :cond_18
    :goto_c
    if-lt v6, v0, :cond_19

    .line 644
    .line 645
    move/from16 v3, v42

    .line 646
    .line 647
    goto :goto_d

    .line 648
    :cond_19
    move/from16 v3, v16

    .line 649
    .line 650
    :goto_d
    move/from16 v4, v16

    .line 651
    .line 652
    goto :goto_10

    .line 653
    :cond_1a
    rem-long v13, v22, v3

    .line 654
    .line 655
    cmp-long v6, v13, p0

    .line 656
    .line 657
    if-eqz v6, :cond_1b

    .line 658
    .line 659
    move/from16 v6, v16

    .line 660
    .line 661
    goto :goto_f

    .line 662
    :cond_1b
    rem-long v9, v22, v9

    .line 663
    .line 664
    cmp-long v6, v9, p0

    .line 665
    .line 666
    if-eqz v6, :cond_1c

    .line 667
    .line 668
    move/from16 v6, v42

    .line 669
    .line 670
    goto :goto_f

    .line 671
    :cond_1c
    rem-long v6, v22, v7

    .line 672
    .line 673
    cmp-long v6, v6, p0

    .line 674
    .line 675
    if-eqz v6, :cond_1d

    .line 676
    .line 677
    move/from16 v6, v33

    .line 678
    .line 679
    goto :goto_f

    .line 680
    :cond_1d
    rem-long v6, v22, v11

    .line 681
    .line 682
    cmp-long v6, v6, p0

    .line 683
    .line 684
    if-eqz v6, :cond_1e

    .line 685
    .line 686
    move/from16 v6, v36

    .line 687
    .line 688
    goto :goto_f

    .line 689
    :cond_1e
    div-long v22, v22, v11

    .line 690
    .line 691
    move/from16 v6, v30

    .line 692
    .line 693
    :goto_e
    cmp-long v7, v22, p0

    .line 694
    .line 695
    if-lez v7, :cond_20

    .line 696
    .line 697
    rem-long v7, v22, v3

    .line 698
    .line 699
    cmp-long v7, v7, p0

    .line 700
    .line 701
    if-eqz v7, :cond_1f

    .line 702
    .line 703
    goto :goto_f

    .line 704
    :cond_1f
    div-long v22, v22, v3

    .line 705
    .line 706
    add-int/lit8 v6, v6, 0x1

    .line 707
    .line 708
    goto :goto_e

    .line 709
    :cond_20
    :goto_f
    if-lt v6, v0, :cond_21

    .line 710
    .line 711
    sub-long v3, v31, v43

    .line 712
    .line 713
    move-wide/from16 v31, v3

    .line 714
    .line 715
    :cond_21
    move/from16 v3, v16

    .line 716
    .line 717
    move v4, v3

    .line 718
    :goto_10
    move v6, v4

    .line 719
    move/from16 v54, v5

    .line 720
    .line 721
    move v5, v3

    .line 722
    move-wide v3, v1

    .line 723
    move-wide/from16 v1, v24

    .line 724
    .line 725
    move/from16 v25, v54

    .line 726
    .line 727
    move/from16 v24, v15

    .line 728
    .line 729
    goto/16 :goto_16

    .line 730
    .line 731
    :cond_22
    move/from16 v16, v13

    .line 732
    .line 733
    invoke-static {v1, v4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 734
    .line 735
    .line 736
    return v16

    .line 737
    :cond_23
    move/from16 v35, v4

    .line 738
    .line 739
    move/from16 v38, v6

    .line 740
    .line 741
    move/from16 v37, v7

    .line 742
    .line 743
    move/from16 v39, v8

    .line 744
    .line 745
    move-wide/from16 v40, v9

    .line 746
    .line 747
    move/from16 v42, v14

    .line 748
    .line 749
    move-wide/from16 v43, v15

    .line 750
    .line 751
    const/16 v15, 0xa

    .line 752
    .line 753
    const/16 v36, 0x3

    .line 754
    .line 755
    move/from16 v16, v13

    .line 756
    .line 757
    neg-int v2, v12

    .line 758
    int-to-long v3, v2

    .line 759
    const-wide/32 v6, 0x6aa784

    .line 760
    .line 761
    .line 762
    mul-long/2addr v3, v6

    .line 763
    div-long v3, v3, v26

    .line 764
    .line 765
    long-to-int v3, v3

    .line 766
    add-int/lit8 v3, v3, -0x1

    .line 767
    .line 768
    move/from16 v4, v16

    .line 769
    .line 770
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 771
    .line 772
    .line 773
    move-result v3

    .line 774
    sub-int/2addr v2, v3

    .line 775
    if-nez v2, :cond_24

    .line 776
    .line 777
    move/from16 v4, v42

    .line 778
    .line 779
    goto :goto_11

    .line 780
    :cond_24
    int-to-long v6, v2

    .line 781
    mul-long v6, v6, v24

    .line 782
    .line 783
    add-long v6, v6, v31

    .line 784
    .line 785
    div-long v6, v6, v26

    .line 786
    .line 787
    long-to-int v4, v6

    .line 788
    :goto_11
    add-int/lit8 v4, v4, -0x79

    .line 789
    .line 790
    sub-int v4, v3, v4

    .line 791
    .line 792
    add-int/lit8 v4, v4, -0x72

    .line 793
    .line 794
    if-ltz v4, :cond_5e

    .line 795
    .line 796
    sget-object v1, Lcom/alibaba/fastjson/util/RyuDouble;->POW5_SPLIT:[[I

    .line 797
    .line 798
    aget-object v1, v1, v2

    .line 799
    .line 800
    ushr-long v6, v18, v34

    .line 801
    .line 802
    and-long v8, v18, v28

    .line 803
    .line 804
    const/16 v16, 0x0

    .line 805
    .line 806
    aget v2, v1, v16

    .line 807
    .line 808
    int-to-long v10, v2

    .line 809
    mul-long/2addr v10, v6

    .line 810
    int-to-long v13, v2

    .line 811
    mul-long/2addr v13, v8

    .line 812
    move/from16 v24, v15

    .line 813
    .line 814
    aget v15, v1, v42

    .line 815
    .line 816
    move/from16 v25, v5

    .line 817
    .line 818
    move-wide/from16 v31, v6

    .line 819
    .line 820
    int-to-long v5, v15

    .line 821
    mul-long v6, v31, v5

    .line 822
    .line 823
    move-wide/from16 v45, v6

    .line 824
    .line 825
    int-to-long v5, v15

    .line 826
    mul-long/2addr v5, v8

    .line 827
    aget v7, v1, v33

    .line 828
    .line 829
    move-wide/from16 v48, v5

    .line 830
    .line 831
    int-to-long v5, v7

    .line 832
    mul-long v5, v5, v31

    .line 833
    .line 834
    move-wide/from16 v50, v5

    .line 835
    .line 836
    int-to-long v5, v7

    .line 837
    mul-long/2addr v5, v8

    .line 838
    aget v1, v1, v36

    .line 839
    .line 840
    move-wide/from16 v52, v5

    .line 841
    .line 842
    int-to-long v5, v1

    .line 843
    mul-long v5, v5, v31

    .line 844
    .line 845
    move-wide/from16 v31, v5

    .line 846
    .line 847
    int-to-long v5, v1

    .line 848
    mul-long/2addr v8, v5

    .line 849
    ushr-long v5, v8, v34

    .line 850
    .line 851
    add-long v5, v5, v52

    .line 852
    .line 853
    add-long v5, v5, v31

    .line 854
    .line 855
    ushr-long v5, v5, v34

    .line 856
    .line 857
    add-long v5, v5, v48

    .line 858
    .line 859
    add-long v5, v5, v50

    .line 860
    .line 861
    ushr-long v5, v5, v34

    .line 862
    .line 863
    add-long/2addr v5, v13

    .line 864
    add-long v5, v5, v45

    .line 865
    .line 866
    const/16 v47, 0x15

    .line 867
    .line 868
    ushr-long v5, v5, v47

    .line 869
    .line 870
    shl-long v8, v10, v24

    .line 871
    .line 872
    add-long/2addr v5, v8

    .line 873
    ushr-long/2addr v5, v4

    .line 874
    ushr-long v8, v22, v34

    .line 875
    .line 876
    and-long v10, v22, v28

    .line 877
    .line 878
    int-to-long v13, v2

    .line 879
    mul-long/2addr v13, v8

    .line 880
    move-wide/from16 v22, v5

    .line 881
    .line 882
    int-to-long v5, v2

    .line 883
    mul-long/2addr v5, v10

    .line 884
    move-wide/from16 v31, v5

    .line 885
    .line 886
    int-to-long v5, v15

    .line 887
    mul-long/2addr v5, v8

    .line 888
    move-wide/from16 v45, v5

    .line 889
    .line 890
    int-to-long v5, v15

    .line 891
    mul-long/2addr v5, v10

    .line 892
    move-wide/from16 v48, v5

    .line 893
    .line 894
    int-to-long v5, v7

    .line 895
    mul-long/2addr v5, v8

    .line 896
    move-wide/from16 v50, v5

    .line 897
    .line 898
    int-to-long v5, v7

    .line 899
    mul-long/2addr v5, v10

    .line 900
    move-wide/from16 v52, v5

    .line 901
    .line 902
    int-to-long v5, v1

    .line 903
    mul-long/2addr v8, v5

    .line 904
    int-to-long v5, v1

    .line 905
    mul-long/2addr v10, v5

    .line 906
    ushr-long v5, v10, v34

    .line 907
    .line 908
    add-long v5, v5, v52

    .line 909
    .line 910
    add-long/2addr v5, v8

    .line 911
    ushr-long v5, v5, v34

    .line 912
    .line 913
    add-long v5, v5, v48

    .line 914
    .line 915
    add-long v5, v5, v50

    .line 916
    .line 917
    ushr-long v5, v5, v34

    .line 918
    .line 919
    add-long v5, v5, v31

    .line 920
    .line 921
    add-long v5, v5, v45

    .line 922
    .line 923
    const/16 v47, 0x15

    .line 924
    .line 925
    ushr-long v5, v5, v47

    .line 926
    .line 927
    shl-long v8, v13, v24

    .line 928
    .line 929
    add-long/2addr v5, v8

    .line 930
    ushr-long v31, v5, v4

    .line 931
    .line 932
    ushr-long v5, v40, v34

    .line 933
    .line 934
    and-long v8, v40, v28

    .line 935
    .line 936
    int-to-long v10, v2

    .line 937
    mul-long/2addr v10, v5

    .line 938
    int-to-long v13, v2

    .line 939
    mul-long/2addr v13, v8

    .line 940
    move-wide/from16 v28, v5

    .line 941
    .line 942
    int-to-long v5, v15

    .line 943
    mul-long v5, v5, v28

    .line 944
    .line 945
    move-wide/from16 v40, v5

    .line 946
    .line 947
    int-to-long v5, v15

    .line 948
    mul-long/2addr v5, v8

    .line 949
    move-wide/from16 v45, v5

    .line 950
    .line 951
    int-to-long v5, v7

    .line 952
    mul-long v5, v5, v28

    .line 953
    .line 954
    move-wide/from16 v48, v5

    .line 955
    .line 956
    int-to-long v5, v7

    .line 957
    mul-long/2addr v5, v8

    .line 958
    move-wide/from16 v50, v5

    .line 959
    .line 960
    int-to-long v5, v1

    .line 961
    mul-long v5, v5, v28

    .line 962
    .line 963
    int-to-long v1, v1

    .line 964
    mul-long/2addr v8, v1

    .line 965
    ushr-long v1, v8, v34

    .line 966
    .line 967
    add-long v1, v1, v50

    .line 968
    .line 969
    add-long/2addr v1, v5

    .line 970
    ushr-long v1, v1, v34

    .line 971
    .line 972
    add-long v1, v1, v45

    .line 973
    .line 974
    add-long v1, v1, v48

    .line 975
    .line 976
    ushr-long v1, v1, v34

    .line 977
    .line 978
    add-long/2addr v1, v13

    .line 979
    add-long v1, v1, v40

    .line 980
    .line 981
    const/16 v47, 0x15

    .line 982
    .line 983
    ushr-long v1, v1, v47

    .line 984
    .line 985
    shl-long v5, v10, v24

    .line 986
    .line 987
    add-long/2addr v1, v5

    .line 988
    ushr-long/2addr v1, v4

    .line 989
    add-int v4, v3, v12

    .line 990
    .line 991
    move/from16 v5, v42

    .line 992
    .line 993
    if-gt v3, v5, :cond_27

    .line 994
    .line 995
    if-eqz v17, :cond_26

    .line 996
    .line 997
    if-ne v0, v5, :cond_25

    .line 998
    .line 999
    move/from16 v42, v5

    .line 1000
    .line 1001
    goto :goto_12

    .line 1002
    :cond_25
    const/16 v42, 0x0

    .line 1003
    .line 1004
    :goto_12
    move v0, v4

    .line 1005
    move v6, v5

    .line 1006
    move/from16 v5, v42

    .line 1007
    .line 1008
    :goto_13
    move-wide v3, v1

    .line 1009
    move-wide/from16 v1, v22

    .line 1010
    .line 1011
    goto :goto_16

    .line 1012
    :cond_26
    sub-long v31, v31, v43

    .line 1013
    .line 1014
    move v0, v4

    .line 1015
    move v6, v5

    .line 1016
    :goto_14
    const/4 v5, 0x0

    .line 1017
    goto :goto_13

    .line 1018
    :cond_27
    const/16 v0, 0x3f

    .line 1019
    .line 1020
    if-ge v3, v0, :cond_29

    .line 1021
    .line 1022
    sub-int/2addr v3, v5

    .line 1023
    shl-long v5, v43, v3

    .line 1024
    .line 1025
    sub-long v5, v5, v43

    .line 1026
    .line 1027
    and-long v5, v18, v5

    .line 1028
    .line 1029
    cmp-long v0, v5, p0

    .line 1030
    .line 1031
    if-nez v0, :cond_28

    .line 1032
    .line 1033
    const/4 v0, 0x1

    .line 1034
    goto :goto_15

    .line 1035
    :cond_28
    const/4 v0, 0x0

    .line 1036
    :goto_15
    move v6, v0

    .line 1037
    move v0, v4

    .line 1038
    goto :goto_14

    .line 1039
    :cond_29
    move v0, v4

    .line 1040
    const/4 v5, 0x0

    .line 1041
    const/4 v6, 0x0

    .line 1042
    goto :goto_13

    .line 1043
    :goto_16
    const-wide v7, 0xde0b6b3a7640000L

    .line 1044
    .line 1045
    .line 1046
    .line 1047
    .line 1048
    cmp-long v7, v31, v7

    .line 1049
    .line 1050
    const-wide/16 v8, 0x64

    .line 1051
    .line 1052
    const/4 v10, 0x7

    .line 1053
    const/4 v11, 0x5

    .line 1054
    const-wide/16 v12, 0xa

    .line 1055
    .line 1056
    if-ltz v7, :cond_2a

    .line 1057
    .line 1058
    const/16 v7, 0x13

    .line 1059
    .line 1060
    goto/16 :goto_17

    .line 1061
    .line 1062
    :cond_2a
    const-wide v14, 0x16345785d8a0000L

    .line 1063
    .line 1064
    .line 1065
    .line 1066
    .line 1067
    cmp-long v7, v31, v14

    .line 1068
    .line 1069
    if-ltz v7, :cond_2b

    .line 1070
    .line 1071
    const/16 v7, 0x12

    .line 1072
    .line 1073
    goto/16 :goto_17

    .line 1074
    .line 1075
    :cond_2b
    const-wide v14, 0x2386f26fc10000L

    .line 1076
    .line 1077
    .line 1078
    .line 1079
    .line 1080
    cmp-long v7, v31, v14

    .line 1081
    .line 1082
    if-ltz v7, :cond_2c

    .line 1083
    .line 1084
    const/16 v7, 0x11

    .line 1085
    .line 1086
    goto/16 :goto_17

    .line 1087
    .line 1088
    :cond_2c
    const-wide v14, 0x38d7ea4c68000L

    .line 1089
    .line 1090
    .line 1091
    .line 1092
    .line 1093
    cmp-long v7, v31, v14

    .line 1094
    .line 1095
    if-ltz v7, :cond_2d

    .line 1096
    .line 1097
    const/16 v7, 0x10

    .line 1098
    .line 1099
    goto/16 :goto_17

    .line 1100
    .line 1101
    :cond_2d
    const-wide v14, 0x5af3107a4000L

    .line 1102
    .line 1103
    .line 1104
    .line 1105
    .line 1106
    cmp-long v7, v31, v14

    .line 1107
    .line 1108
    if-ltz v7, :cond_2e

    .line 1109
    .line 1110
    const/16 v7, 0xf

    .line 1111
    .line 1112
    goto/16 :goto_17

    .line 1113
    .line 1114
    :cond_2e
    const-wide v14, 0x9184e72a000L

    .line 1115
    .line 1116
    .line 1117
    .line 1118
    .line 1119
    cmp-long v7, v31, v14

    .line 1120
    .line 1121
    if-ltz v7, :cond_2f

    .line 1122
    .line 1123
    const/16 v7, 0xe

    .line 1124
    .line 1125
    goto/16 :goto_17

    .line 1126
    .line 1127
    :cond_2f
    const-wide v14, 0xe8d4a51000L

    .line 1128
    .line 1129
    .line 1130
    .line 1131
    .line 1132
    cmp-long v7, v31, v14

    .line 1133
    .line 1134
    if-ltz v7, :cond_30

    .line 1135
    .line 1136
    const/16 v7, 0xd

    .line 1137
    .line 1138
    goto/16 :goto_17

    .line 1139
    .line 1140
    :cond_30
    const-wide v14, 0x174876e800L

    .line 1141
    .line 1142
    .line 1143
    .line 1144
    .line 1145
    cmp-long v7, v31, v14

    .line 1146
    .line 1147
    if-ltz v7, :cond_31

    .line 1148
    .line 1149
    const/16 v7, 0xc

    .line 1150
    .line 1151
    goto/16 :goto_17

    .line 1152
    .line 1153
    :cond_31
    const-wide v14, 0x2540be400L

    .line 1154
    .line 1155
    .line 1156
    .line 1157
    .line 1158
    cmp-long v7, v31, v14

    .line 1159
    .line 1160
    if-ltz v7, :cond_32

    .line 1161
    .line 1162
    const/16 v7, 0xb

    .line 1163
    .line 1164
    goto :goto_17

    .line 1165
    :cond_32
    const-wide/32 v14, 0x3b9aca00

    .line 1166
    .line 1167
    .line 1168
    cmp-long v7, v31, v14

    .line 1169
    .line 1170
    if-ltz v7, :cond_33

    .line 1171
    .line 1172
    move/from16 v7, v24

    .line 1173
    .line 1174
    goto :goto_17

    .line 1175
    :cond_33
    const-wide/32 v14, 0x5f5e100

    .line 1176
    .line 1177
    .line 1178
    cmp-long v7, v31, v14

    .line 1179
    .line 1180
    if-ltz v7, :cond_34

    .line 1181
    .line 1182
    const/16 v7, 0x9

    .line 1183
    .line 1184
    goto :goto_17

    .line 1185
    :cond_34
    cmp-long v7, v31, v26

    .line 1186
    .line 1187
    if-ltz v7, :cond_35

    .line 1188
    .line 1189
    const/16 v7, 0x8

    .line 1190
    .line 1191
    goto :goto_17

    .line 1192
    :cond_35
    const-wide/32 v14, 0xf4240

    .line 1193
    .line 1194
    .line 1195
    cmp-long v7, v31, v14

    .line 1196
    .line 1197
    if-ltz v7, :cond_36

    .line 1198
    .line 1199
    move v7, v10

    .line 1200
    goto :goto_17

    .line 1201
    :cond_36
    const-wide/32 v14, 0x186a0

    .line 1202
    .line 1203
    .line 1204
    cmp-long v7, v31, v14

    .line 1205
    .line 1206
    if-ltz v7, :cond_37

    .line 1207
    .line 1208
    const/4 v7, 0x6

    .line 1209
    goto :goto_17

    .line 1210
    :cond_37
    const-wide/16 v14, 0x2710

    .line 1211
    .line 1212
    cmp-long v7, v31, v14

    .line 1213
    .line 1214
    if-ltz v7, :cond_38

    .line 1215
    .line 1216
    move v7, v11

    .line 1217
    goto :goto_17

    .line 1218
    :cond_38
    const-wide/16 v14, 0x3e8

    .line 1219
    .line 1220
    cmp-long v7, v31, v14

    .line 1221
    .line 1222
    if-ltz v7, :cond_39

    .line 1223
    .line 1224
    move/from16 v7, v30

    .line 1225
    .line 1226
    goto :goto_17

    .line 1227
    :cond_39
    cmp-long v7, v31, v8

    .line 1228
    .line 1229
    if-ltz v7, :cond_3a

    .line 1230
    .line 1231
    move/from16 v7, v36

    .line 1232
    .line 1233
    goto :goto_17

    .line 1234
    :cond_3a
    cmp-long v7, v31, v12

    .line 1235
    .line 1236
    if-ltz v7, :cond_3b

    .line 1237
    .line 1238
    move/from16 v7, v33

    .line 1239
    .line 1240
    goto :goto_17

    .line 1241
    :cond_3b
    const/4 v7, 0x1

    .line 1242
    :goto_17
    add-int/2addr v0, v7

    .line 1243
    add-int/lit8 v14, v0, -0x1

    .line 1244
    .line 1245
    const/4 v15, -0x3

    .line 1246
    if-lt v14, v15, :cond_3d

    .line 1247
    .line 1248
    if-lt v14, v10, :cond_3c

    .line 1249
    .line 1250
    goto :goto_18

    .line 1251
    :cond_3c
    const/4 v10, 0x0

    .line 1252
    goto :goto_19

    .line 1253
    :cond_3d
    :goto_18
    const/4 v10, 0x1

    .line 1254
    :goto_19
    if-nez v5, :cond_43

    .line 1255
    .line 1256
    if-eqz v6, :cond_3e

    .line 1257
    .line 1258
    goto :goto_1e

    .line 1259
    :cond_3e
    const/4 v5, 0x0

    .line 1260
    const/4 v6, 0x0

    .line 1261
    :goto_1a
    div-long v17, v31, v12

    .line 1262
    .line 1263
    div-long v19, v3, v12

    .line 1264
    .line 1265
    cmp-long v15, v17, v19

    .line 1266
    .line 1267
    if-lez v15, :cond_40

    .line 1268
    .line 1269
    cmp-long v15, v31, v8

    .line 1270
    .line 1271
    if-gez v15, :cond_3f

    .line 1272
    .line 1273
    if-eqz v10, :cond_3f

    .line 1274
    .line 1275
    goto :goto_1b

    .line 1276
    :cond_3f
    rem-long v3, v1, v12

    .line 1277
    .line 1278
    long-to-int v6, v3

    .line 1279
    div-long/2addr v1, v12

    .line 1280
    add-int/lit8 v5, v5, 0x1

    .line 1281
    .line 1282
    move-wide/from16 v31, v17

    .line 1283
    .line 1284
    move-wide/from16 v3, v19

    .line 1285
    .line 1286
    goto :goto_1a

    .line 1287
    :cond_40
    :goto_1b
    cmp-long v3, v1, v3

    .line 1288
    .line 1289
    if-eqz v3, :cond_42

    .line 1290
    .line 1291
    if-lt v6, v11, :cond_41

    .line 1292
    .line 1293
    goto :goto_1c

    .line 1294
    :cond_41
    const/4 v3, 0x0

    .line 1295
    goto :goto_1d

    .line 1296
    :cond_42
    :goto_1c
    const/4 v3, 0x1

    .line 1297
    :goto_1d
    int-to-long v3, v3

    .line 1298
    add-long/2addr v1, v3

    .line 1299
    goto/16 :goto_27

    .line 1300
    .line 1301
    :cond_43
    :goto_1e
    move v15, v5

    .line 1302
    move/from16 v18, v6

    .line 1303
    .line 1304
    const/4 v5, 0x0

    .line 1305
    const/4 v6, 0x0

    .line 1306
    :goto_1f
    div-long v22, v31, v12

    .line 1307
    .line 1308
    div-long v26, v3, v12

    .line 1309
    .line 1310
    cmp-long v19, v22, v26

    .line 1311
    .line 1312
    if-lez v19, :cond_47

    .line 1313
    .line 1314
    cmp-long v19, v31, v8

    .line 1315
    .line 1316
    if-gez v19, :cond_44

    .line 1317
    .line 1318
    if-eqz v10, :cond_44

    .line 1319
    .line 1320
    goto :goto_22

    .line 1321
    :cond_44
    rem-long/2addr v3, v12

    .line 1322
    cmp-long v3, v3, p0

    .line 1323
    .line 1324
    if-nez v3, :cond_45

    .line 1325
    .line 1326
    const/4 v3, 0x1

    .line 1327
    goto :goto_20

    .line 1328
    :cond_45
    const/4 v3, 0x0

    .line 1329
    :goto_20
    and-int/2addr v15, v3

    .line 1330
    if-nez v5, :cond_46

    .line 1331
    .line 1332
    const/4 v3, 0x1

    .line 1333
    goto :goto_21

    .line 1334
    :cond_46
    const/4 v3, 0x0

    .line 1335
    :goto_21
    and-int v18, v18, v3

    .line 1336
    .line 1337
    rem-long v3, v1, v12

    .line 1338
    .line 1339
    long-to-int v5, v3

    .line 1340
    div-long/2addr v1, v12

    .line 1341
    add-int/lit8 v6, v6, 0x1

    .line 1342
    .line 1343
    move-wide/from16 v31, v22

    .line 1344
    .line 1345
    move-wide/from16 v3, v26

    .line 1346
    .line 1347
    goto :goto_1f

    .line 1348
    :cond_47
    :goto_22
    if-eqz v15, :cond_4a

    .line 1349
    .line 1350
    if-eqz v17, :cond_4a

    .line 1351
    .line 1352
    :goto_23
    rem-long v22, v3, v12

    .line 1353
    .line 1354
    cmp-long v19, v22, p0

    .line 1355
    .line 1356
    if-nez v19, :cond_4a

    .line 1357
    .line 1358
    cmp-long v19, v31, v8

    .line 1359
    .line 1360
    if-gez v19, :cond_48

    .line 1361
    .line 1362
    if-eqz v10, :cond_48

    .line 1363
    .line 1364
    goto :goto_25

    .line 1365
    :cond_48
    if-nez v5, :cond_49

    .line 1366
    .line 1367
    const/4 v5, 0x1

    .line 1368
    goto :goto_24

    .line 1369
    :cond_49
    const/4 v5, 0x0

    .line 1370
    :goto_24
    and-int v18, v18, v5

    .line 1371
    .line 1372
    rem-long v8, v1, v12

    .line 1373
    .line 1374
    long-to-int v5, v8

    .line 1375
    div-long v31, v31, v12

    .line 1376
    .line 1377
    div-long/2addr v1, v12

    .line 1378
    div-long/2addr v3, v12

    .line 1379
    add-int/lit8 v6, v6, 0x1

    .line 1380
    .line 1381
    const-wide/16 v8, 0x64

    .line 1382
    .line 1383
    goto :goto_23

    .line 1384
    :cond_4a
    :goto_25
    if-eqz v18, :cond_4b

    .line 1385
    .line 1386
    if-ne v5, v11, :cond_4b

    .line 1387
    .line 1388
    rem-long v8, v1, v20

    .line 1389
    .line 1390
    cmp-long v8, v8, p0

    .line 1391
    .line 1392
    if-nez v8, :cond_4b

    .line 1393
    .line 1394
    move/from16 v5, v30

    .line 1395
    .line 1396
    :cond_4b
    cmp-long v3, v1, v3

    .line 1397
    .line 1398
    if-nez v3, :cond_4c

    .line 1399
    .line 1400
    if-eqz v15, :cond_4d

    .line 1401
    .line 1402
    if-eqz v17, :cond_4d

    .line 1403
    .line 1404
    :cond_4c
    if-lt v5, v11, :cond_4e

    .line 1405
    .line 1406
    :cond_4d
    const/4 v3, 0x1

    .line 1407
    goto :goto_26

    .line 1408
    :cond_4e
    const/4 v3, 0x0

    .line 1409
    :goto_26
    int-to-long v3, v3

    .line 1410
    add-long/2addr v1, v3

    .line 1411
    move v5, v6

    .line 1412
    :goto_27
    sub-int/2addr v7, v5

    .line 1413
    if-eqz v25, :cond_4f

    .line 1414
    .line 1415
    add-int/lit8 v3, p3, 0x1

    .line 1416
    .line 1417
    aput-char v37, p2, p3

    .line 1418
    .line 1419
    goto :goto_28

    .line 1420
    :cond_4f
    move/from16 v3, p3

    .line 1421
    .line 1422
    :goto_28
    const-wide/16 v4, 0x30

    .line 1423
    .line 1424
    if-eqz v10, :cond_55

    .line 1425
    .line 1426
    const/4 v0, 0x0

    .line 1427
    :goto_29
    add-int/lit8 v6, v7, -0x1

    .line 1428
    .line 1429
    if-ge v0, v6, :cond_50

    .line 1430
    .line 1431
    rem-long v8, v1, v12

    .line 1432
    .line 1433
    long-to-int v6, v8

    .line 1434
    div-long/2addr v1, v12

    .line 1435
    add-int v8, v3, v7

    .line 1436
    .line 1437
    sub-int/2addr v8, v0

    .line 1438
    add-int/lit8 v6, v6, 0x30

    .line 1439
    .line 1440
    int-to-char v6, v6

    .line 1441
    aput-char v6, p2, v8

    .line 1442
    .line 1443
    add-int/lit8 v0, v0, 0x1

    .line 1444
    .line 1445
    goto :goto_29

    .line 1446
    :cond_50
    rem-long/2addr v1, v12

    .line 1447
    add-long/2addr v1, v4

    .line 1448
    long-to-int v0, v1

    .line 1449
    int-to-char v0, v0

    .line 1450
    aput-char v0, p2, v3

    .line 1451
    .line 1452
    add-int/lit8 v0, v3, 0x1

    .line 1453
    .line 1454
    aput-char v38, p2, v0

    .line 1455
    .line 1456
    add-int/lit8 v0, v7, 0x1

    .line 1457
    .line 1458
    add-int/2addr v3, v0

    .line 1459
    const/4 v5, 0x1

    .line 1460
    if-ne v7, v5, :cond_51

    .line 1461
    .line 1462
    add-int/lit8 v0, v3, 0x1

    .line 1463
    .line 1464
    aput-char v39, p2, v3

    .line 1465
    .line 1466
    move v3, v0

    .line 1467
    :cond_51
    add-int/lit8 v0, v3, 0x1

    .line 1468
    .line 1469
    const/16 v1, 0x45

    .line 1470
    .line 1471
    aput-char v1, p2, v3

    .line 1472
    .line 1473
    if-gez v14, :cond_52

    .line 1474
    .line 1475
    add-int/lit8 v3, v3, 0x2

    .line 1476
    .line 1477
    aput-char v37, p2, v0

    .line 1478
    .line 1479
    neg-int v14, v14

    .line 1480
    move v0, v3

    .line 1481
    :cond_52
    const/16 v1, 0x64

    .line 1482
    .line 1483
    if-lt v14, v1, :cond_53

    .line 1484
    .line 1485
    add-int/lit8 v1, v0, 0x1

    .line 1486
    .line 1487
    div-int/lit8 v2, v14, 0x64

    .line 1488
    .line 1489
    add-int/lit8 v2, v2, 0x30

    .line 1490
    .line 1491
    int-to-char v2, v2

    .line 1492
    aput-char v2, p2, v0

    .line 1493
    .line 1494
    rem-int/lit8 v14, v14, 0x64

    .line 1495
    .line 1496
    add-int/lit8 v0, v0, 0x2

    .line 1497
    .line 1498
    div-int/lit8 v2, v14, 0xa

    .line 1499
    .line 1500
    add-int/lit8 v2, v2, 0x30

    .line 1501
    .line 1502
    int-to-char v2, v2

    .line 1503
    aput-char v2, p2, v1

    .line 1504
    .line 1505
    goto :goto_2a

    .line 1506
    :cond_53
    move/from16 v15, v24

    .line 1507
    .line 1508
    if-lt v14, v15, :cond_54

    .line 1509
    .line 1510
    add-int/lit8 v1, v0, 0x1

    .line 1511
    .line 1512
    div-int/lit8 v2, v14, 0xa

    .line 1513
    .line 1514
    add-int/lit8 v2, v2, 0x30

    .line 1515
    .line 1516
    int-to-char v2, v2

    .line 1517
    aput-char v2, p2, v0

    .line 1518
    .line 1519
    move v0, v1

    .line 1520
    :cond_54
    :goto_2a
    add-int/lit8 v1, v0, 0x1

    .line 1521
    .line 1522
    const/16 v15, 0xa

    .line 1523
    .line 1524
    rem-int/2addr v14, v15

    .line 1525
    add-int/lit8 v14, v14, 0x30

    .line 1526
    .line 1527
    int-to-char v2, v14

    .line 1528
    aput-char v2, p2, v0

    .line 1529
    .line 1530
    goto/16 :goto_1

    .line 1531
    .line 1532
    :cond_55
    if-gez v14, :cond_57

    .line 1533
    .line 1534
    add-int/lit8 v0, v3, 0x1

    .line 1535
    .line 1536
    aput-char v39, p2, v3

    .line 1537
    .line 1538
    add-int/lit8 v3, v3, 0x2

    .line 1539
    .line 1540
    aput-char v38, p2, v0

    .line 1541
    .line 1542
    const/4 v0, -0x1

    .line 1543
    :goto_2b
    if-le v0, v14, :cond_56

    .line 1544
    .line 1545
    add-int/lit8 v6, v3, 0x1

    .line 1546
    .line 1547
    aput-char v39, p2, v3

    .line 1548
    .line 1549
    add-int/lit8 v0, v0, -0x1

    .line 1550
    .line 1551
    move v3, v6

    .line 1552
    goto :goto_2b

    .line 1553
    :cond_56
    move v6, v3

    .line 1554
    const/4 v0, 0x0

    .line 1555
    :goto_2c
    if-ge v0, v7, :cond_5d

    .line 1556
    .line 1557
    add-int v8, v3, v7

    .line 1558
    .line 1559
    sub-int/2addr v8, v0

    .line 1560
    const/16 v42, 0x1

    .line 1561
    .line 1562
    add-int/lit8 v8, v8, -0x1

    .line 1563
    .line 1564
    rem-long v9, v1, v12

    .line 1565
    .line 1566
    add-long/2addr v9, v4

    .line 1567
    long-to-int v9, v9

    .line 1568
    int-to-char v9, v9

    .line 1569
    aput-char v9, p2, v8

    .line 1570
    .line 1571
    div-long/2addr v1, v12

    .line 1572
    add-int/lit8 v6, v6, 0x1

    .line 1573
    .line 1574
    add-int/lit8 v0, v0, 0x1

    .line 1575
    .line 1576
    goto :goto_2c

    .line 1577
    :cond_57
    if-lt v0, v7, :cond_5a

    .line 1578
    .line 1579
    const/4 v6, 0x0

    .line 1580
    :goto_2d
    if-ge v6, v7, :cond_58

    .line 1581
    .line 1582
    add-int v8, v3, v7

    .line 1583
    .line 1584
    sub-int/2addr v8, v6

    .line 1585
    const/16 v42, 0x1

    .line 1586
    .line 1587
    add-int/lit8 v8, v8, -0x1

    .line 1588
    .line 1589
    rem-long v9, v1, v12

    .line 1590
    .line 1591
    add-long/2addr v9, v4

    .line 1592
    long-to-int v9, v9

    .line 1593
    int-to-char v9, v9

    .line 1594
    aput-char v9, p2, v8

    .line 1595
    .line 1596
    div-long/2addr v1, v12

    .line 1597
    add-int/lit8 v6, v6, 0x1

    .line 1598
    .line 1599
    goto :goto_2d

    .line 1600
    :cond_58
    add-int/2addr v3, v7

    .line 1601
    :goto_2e
    if-ge v7, v0, :cond_59

    .line 1602
    .line 1603
    add-int/lit8 v1, v3, 0x1

    .line 1604
    .line 1605
    aput-char v39, p2, v3

    .line 1606
    .line 1607
    add-int/lit8 v7, v7, 0x1

    .line 1608
    .line 1609
    move v3, v1

    .line 1610
    goto :goto_2e

    .line 1611
    :cond_59
    add-int/lit8 v0, v3, 0x1

    .line 1612
    .line 1613
    aput-char v38, p2, v3

    .line 1614
    .line 1615
    add-int/lit8 v6, v3, 0x2

    .line 1616
    .line 1617
    aput-char v39, p2, v0

    .line 1618
    .line 1619
    goto :goto_30

    .line 1620
    :cond_5a
    add-int/lit8 v0, v3, 0x1

    .line 1621
    .line 1622
    const/4 v6, 0x0

    .line 1623
    :goto_2f
    if-ge v6, v7, :cond_5c

    .line 1624
    .line 1625
    sub-int v8, v7, v6

    .line 1626
    .line 1627
    const/16 v42, 0x1

    .line 1628
    .line 1629
    add-int/lit8 v8, v8, -0x1

    .line 1630
    .line 1631
    if-ne v8, v14, :cond_5b

    .line 1632
    .line 1633
    add-int v8, v0, v7

    .line 1634
    .line 1635
    sub-int/2addr v8, v6

    .line 1636
    add-int/lit8 v8, v8, -0x1

    .line 1637
    .line 1638
    aput-char v38, p2, v8

    .line 1639
    .line 1640
    add-int/lit8 v0, v0, -0x1

    .line 1641
    .line 1642
    :cond_5b
    add-int v8, v0, v7

    .line 1643
    .line 1644
    sub-int/2addr v8, v6

    .line 1645
    add-int/lit8 v8, v8, -0x1

    .line 1646
    .line 1647
    rem-long v9, v1, v12

    .line 1648
    .line 1649
    add-long/2addr v9, v4

    .line 1650
    long-to-int v9, v9

    .line 1651
    int-to-char v9, v9

    .line 1652
    aput-char v9, p2, v8

    .line 1653
    .line 1654
    div-long/2addr v1, v12

    .line 1655
    add-int/lit8 v6, v6, 0x1

    .line 1656
    .line 1657
    goto :goto_2f

    .line 1658
    :cond_5c
    const/16 v42, 0x1

    .line 1659
    .line 1660
    add-int/lit8 v7, v7, 0x1

    .line 1661
    .line 1662
    add-int v6, v3, v7

    .line 1663
    .line 1664
    :cond_5d
    :goto_30
    sub-int v6, v6, p3

    .line 1665
    .line 1666
    return v6

    .line 1667
    :cond_5e
    invoke-static {v1, v4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 1668
    .line 1669
    .line 1670
    const/16 v16, 0x0

    .line 1671
    .line 1672
    return v16
.end method

.method public static toString(D)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x18

    .line 1673
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 1674
    invoke-static {p0, p1, v0, v1}, Lcom/alibaba/fastjson/util/RyuDouble;->toString(D[CI)I

    move-result p0

    .line 1675
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0, v1, p0}, Ljava/lang/String;-><init>([CII)V

    return-object p1
.end method
