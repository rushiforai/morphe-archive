.class final Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish256Cipher;
.super Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/engines/ThreefishEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Threefish256Cipher"
.end annotation


# static fields
.field private static final ROTATION_0_0:I = 0xe

.field private static final ROTATION_0_1:I = 0x10

.field private static final ROTATION_1_0:I = 0x34

.field private static final ROTATION_1_1:I = 0x39

.field private static final ROTATION_2_0:I = 0x17

.field private static final ROTATION_2_1:I = 0x28

.field private static final ROTATION_3_0:I = 0x5

.field private static final ROTATION_3_1:I = 0x25

.field private static final ROTATION_4_0:I = 0x19

.field private static final ROTATION_4_1:I = 0x21

.field private static final ROTATION_5_0:I = 0x2e

.field private static final ROTATION_5_1:I = 0xc

.field private static final ROTATION_6_0:I = 0x3a

.field private static final ROTATION_6_1:I = 0x16

.field private static final ROTATION_7_0:I = 0x20

.field private static final ROTATION_7_1:I = 0x20


# direct methods
.method public constructor <init>([J[J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;-><init>([J[J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decryptBlock([J[J)V
    .locals 33

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->kw:[J

    .line 4
    .line 5
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->t:[J

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$000()[I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    array-length v4, v1

    .line 16
    const/16 v5, 0x9

    .line 17
    .line 18
    if-ne v4, v5, :cond_2

    .line 19
    .line 20
    array-length v4, v0

    .line 21
    const/4 v5, 0x5

    .line 22
    if-ne v4, v5, :cond_1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aget-wide v6, p1, v4

    .line 26
    .line 27
    const/4 v8, 0x1

    .line 28
    aget-wide v9, p1, v8

    .line 29
    .line 30
    const/4 v11, 0x2

    .line 31
    aget-wide v12, p1, v11

    .line 32
    .line 33
    const/4 v14, 0x3

    .line 34
    aget-wide v15, p1, v14

    .line 35
    .line 36
    const/16 v17, 0x11

    .line 37
    .line 38
    move/from16 p0, v4

    .line 39
    .line 40
    move/from16 v4, v17

    .line 41
    .line 42
    :goto_0
    if-lt v4, v8, :cond_0

    .line 43
    .line 44
    aget v17, v2, v4

    .line 45
    .line 46
    aget v18, v3, v4

    .line 47
    .line 48
    add-int/lit8 v19, v17, 0x1

    .line 49
    .line 50
    aget-wide v20, v1, v19

    .line 51
    .line 52
    sub-long v6, v6, v20

    .line 53
    .line 54
    add-int/lit8 v20, v17, 0x2

    .line 55
    .line 56
    aget-wide v21, v1, v20

    .line 57
    .line 58
    add-int/lit8 v23, v18, 0x1

    .line 59
    .line 60
    aget-wide v24, v0, v23

    .line 61
    .line 62
    add-long v21, v21, v24

    .line 63
    .line 64
    sub-long v9, v9, v21

    .line 65
    .line 66
    add-int/lit8 v21, v17, 0x3

    .line 67
    .line 68
    aget-wide v24, v1, v21

    .line 69
    .line 70
    add-int/lit8 v22, v18, 0x2

    .line 71
    .line 72
    aget-wide v26, v0, v22

    .line 73
    .line 74
    add-long v24, v24, v26

    .line 75
    .line 76
    sub-long v12, v12, v24

    .line 77
    .line 78
    add-int/lit8 v22, v17, 0x4

    .line 79
    .line 80
    aget-wide v24, v1, v22

    .line 81
    .line 82
    move/from16 v22, v14

    .line 83
    .line 84
    move-wide/from16 v26, v15

    .line 85
    .line 86
    int-to-long v14, v4

    .line 87
    add-long v24, v24, v14

    .line 88
    .line 89
    const-wide/16 v28, 0x1

    .line 90
    .line 91
    add-long v24, v24, v28

    .line 92
    .line 93
    move/from16 v16, v8

    .line 94
    .line 95
    move-wide/from16 v28, v9

    .line 96
    .line 97
    sub-long v8, v26, v24

    .line 98
    .line 99
    const/16 v10, 0x20

    .line 100
    .line 101
    invoke-static {v8, v9, v10, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 102
    .line 103
    .line 104
    move-result-wide v8

    .line 105
    sub-long/2addr v6, v8

    .line 106
    move-wide/from16 v25, v6

    .line 107
    .line 108
    move-wide/from16 v5, v28

    .line 109
    .line 110
    invoke-static {v5, v6, v10, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 111
    .line 112
    .line 113
    move-result-wide v5

    .line 114
    sub-long/2addr v12, v5

    .line 115
    const/16 v7, 0x3a

    .line 116
    .line 117
    move/from16 v28, v11

    .line 118
    .line 119
    move-wide/from16 v29, v12

    .line 120
    .line 121
    move-wide/from16 v11, v25

    .line 122
    .line 123
    invoke-static {v5, v6, v7, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 124
    .line 125
    .line 126
    move-result-wide v5

    .line 127
    sub-long v10, v11, v5

    .line 128
    .line 129
    const/16 v7, 0x16

    .line 130
    .line 131
    move-wide/from16 v12, v29

    .line 132
    .line 133
    invoke-static {v8, v9, v7, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 134
    .line 135
    .line 136
    move-result-wide v7

    .line 137
    sub-long/2addr v12, v7

    .line 138
    const/16 v9, 0x2e

    .line 139
    .line 140
    invoke-static {v7, v8, v9, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 141
    .line 142
    .line 143
    move-result-wide v7

    .line 144
    sub-long/2addr v10, v7

    .line 145
    const/16 v9, 0xc

    .line 146
    .line 147
    invoke-static {v5, v6, v9, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 148
    .line 149
    .line 150
    move-result-wide v5

    .line 151
    sub-long/2addr v12, v5

    .line 152
    const/16 v9, 0x19

    .line 153
    .line 154
    invoke-static {v5, v6, v9, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 155
    .line 156
    .line 157
    move-result-wide v5

    .line 158
    sub-long/2addr v10, v5

    .line 159
    const/16 v9, 0x21

    .line 160
    .line 161
    invoke-static {v7, v8, v9, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 162
    .line 163
    .line 164
    move-result-wide v7

    .line 165
    sub-long/2addr v12, v7

    .line 166
    aget-wide v25, v1, v17

    .line 167
    .line 168
    sub-long v10, v10, v25

    .line 169
    .line 170
    aget-wide v25, v1, v19

    .line 171
    .line 172
    aget-wide v17, v0, v18

    .line 173
    .line 174
    add-long v25, v25, v17

    .line 175
    .line 176
    sub-long v5, v5, v25

    .line 177
    .line 178
    aget-wide v17, v1, v20

    .line 179
    .line 180
    aget-wide v19, v0, v23

    .line 181
    .line 182
    add-long v17, v17, v19

    .line 183
    .line 184
    sub-long v12, v12, v17

    .line 185
    .line 186
    aget-wide v17, v1, v21

    .line 187
    .line 188
    add-long v17, v17, v14

    .line 189
    .line 190
    sub-long v7, v7, v17

    .line 191
    .line 192
    const/4 v14, 0x5

    .line 193
    invoke-static {v7, v8, v14, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 194
    .line 195
    .line 196
    move-result-wide v7

    .line 197
    sub-long/2addr v10, v7

    .line 198
    const/16 v9, 0x25

    .line 199
    .line 200
    invoke-static {v5, v6, v9, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 201
    .line 202
    .line 203
    move-result-wide v5

    .line 204
    sub-long/2addr v12, v5

    .line 205
    const/16 v9, 0x17

    .line 206
    .line 207
    invoke-static {v5, v6, v9, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 208
    .line 209
    .line 210
    move-result-wide v5

    .line 211
    sub-long/2addr v10, v5

    .line 212
    const/16 v9, 0x28

    .line 213
    .line 214
    invoke-static {v7, v8, v9, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 215
    .line 216
    .line 217
    move-result-wide v7

    .line 218
    sub-long/2addr v12, v7

    .line 219
    const/16 v9, 0x34

    .line 220
    .line 221
    invoke-static {v7, v8, v9, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 222
    .line 223
    .line 224
    move-result-wide v7

    .line 225
    sub-long/2addr v10, v7

    .line 226
    const/16 v9, 0x39

    .line 227
    .line 228
    invoke-static {v5, v6, v9, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 229
    .line 230
    .line 231
    move-result-wide v5

    .line 232
    sub-long/2addr v12, v5

    .line 233
    const/16 v9, 0xe

    .line 234
    .line 235
    invoke-static {v5, v6, v9, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 236
    .line 237
    .line 238
    move-result-wide v5

    .line 239
    sub-long v9, v10, v5

    .line 240
    .line 241
    const/16 v11, 0x10

    .line 242
    .line 243
    invoke-static {v7, v8, v11, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 244
    .line 245
    .line 246
    move-result-wide v7

    .line 247
    sub-long/2addr v12, v7

    .line 248
    add-int/lit8 v4, v4, -0x2

    .line 249
    .line 250
    move-wide/from16 v31, v7

    .line 251
    .line 252
    move/from16 v8, v16

    .line 253
    .line 254
    move-wide/from16 v15, v31

    .line 255
    .line 256
    move/from16 v11, v28

    .line 257
    .line 258
    move-wide/from16 v31, v5

    .line 259
    .line 260
    move v5, v14

    .line 261
    move-wide v6, v9

    .line 262
    move/from16 v14, v22

    .line 263
    .line 264
    move-wide/from16 v9, v31

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :cond_0
    move/from16 v28, v11

    .line 269
    .line 270
    move/from16 v22, v14

    .line 271
    .line 272
    move-wide/from16 v26, v15

    .line 273
    .line 274
    move/from16 v16, v8

    .line 275
    .line 276
    aget-wide v2, v1, p0

    .line 277
    .line 278
    sub-long/2addr v6, v2

    .line 279
    aget-wide v2, v1, v16

    .line 280
    .line 281
    aget-wide v4, v0, p0

    .line 282
    .line 283
    add-long/2addr v2, v4

    .line 284
    sub-long/2addr v9, v2

    .line 285
    aget-wide v2, v1, v28

    .line 286
    .line 287
    aget-wide v4, v0, v16

    .line 288
    .line 289
    add-long/2addr v2, v4

    .line 290
    sub-long/2addr v12, v2

    .line 291
    aget-wide v0, v1, v22

    .line 292
    .line 293
    sub-long v0, v26, v0

    .line 294
    .line 295
    aput-wide v6, p2, p0

    .line 296
    .line 297
    aput-wide v9, p2, v16

    .line 298
    .line 299
    aput-wide v12, p2, v28

    .line 300
    .line 301
    aput-wide v0, p2, v22

    .line 302
    .line 303
    return-void

    .line 304
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 305
    .line 306
    .line 307
    return-void

    .line 308
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 309
    .line 310
    .line 311
    return-void
.end method

.method public encryptBlock([J[J)V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->kw:[J

    .line 4
    .line 5
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->t:[J

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$000()[I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    array-length v4, v1

    .line 16
    const/16 v5, 0x9

    .line 17
    .line 18
    if-ne v4, v5, :cond_2

    .line 19
    .line 20
    array-length v4, v0

    .line 21
    const/4 v5, 0x5

    .line 22
    if-ne v4, v5, :cond_1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aget-wide v6, p1, v4

    .line 26
    .line 27
    const/4 v8, 0x1

    .line 28
    aget-wide v9, p1, v8

    .line 29
    .line 30
    const/4 v11, 0x2

    .line 31
    aget-wide v12, p1, v11

    .line 32
    .line 33
    const/4 v14, 0x3

    .line 34
    aget-wide v15, p1, v14

    .line 35
    .line 36
    aget-wide v17, v1, v4

    .line 37
    .line 38
    add-long v6, v6, v17

    .line 39
    .line 40
    aget-wide v17, v1, v8

    .line 41
    .line 42
    aget-wide v19, v0, v4

    .line 43
    .line 44
    add-long v17, v17, v19

    .line 45
    .line 46
    add-long v9, v9, v17

    .line 47
    .line 48
    aget-wide v17, v1, v11

    .line 49
    .line 50
    aget-wide v19, v0, v8

    .line 51
    .line 52
    add-long v17, v17, v19

    .line 53
    .line 54
    add-long v12, v12, v17

    .line 55
    .line 56
    aget-wide v17, v1, v14

    .line 57
    .line 58
    add-long v15, v15, v17

    .line 59
    .line 60
    move/from16 v17, v4

    .line 61
    .line 62
    move/from16 p0, v11

    .line 63
    .line 64
    move-wide/from16 v28, v12

    .line 65
    .line 66
    move v13, v8

    .line 67
    move-wide v11, v15

    .line 68
    move-wide/from16 v15, v28

    .line 69
    .line 70
    :goto_0
    const/16 v4, 0x12

    .line 71
    .line 72
    if-ge v13, v4, :cond_0

    .line 73
    .line 74
    aget v4, v2, v13

    .line 75
    .line 76
    aget v18, v3, v13

    .line 77
    .line 78
    add-long/2addr v6, v9

    .line 79
    move/from16 v19, v8

    .line 80
    .line 81
    const/16 v8, 0xe

    .line 82
    .line 83
    invoke-static {v9, v10, v8, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 84
    .line 85
    .line 86
    move-result-wide v8

    .line 87
    move/from16 v20, v14

    .line 88
    .line 89
    add-long v14, v15, v11

    .line 90
    .line 91
    const/16 v10, 0x10

    .line 92
    .line 93
    invoke-static {v11, v12, v10, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    add-long/2addr v6, v10

    .line 98
    const/16 v12, 0x34

    .line 99
    .line 100
    invoke-static {v10, v11, v12, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 101
    .line 102
    .line 103
    move-result-wide v10

    .line 104
    add-long/2addr v14, v8

    .line 105
    const/16 v12, 0x39

    .line 106
    .line 107
    invoke-static {v8, v9, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    add-long/2addr v6, v8

    .line 112
    const/16 v12, 0x17

    .line 113
    .line 114
    invoke-static {v8, v9, v12, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 115
    .line 116
    .line 117
    move-result-wide v8

    .line 118
    add-long/2addr v14, v10

    .line 119
    const/16 v12, 0x28

    .line 120
    .line 121
    invoke-static {v10, v11, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 122
    .line 123
    .line 124
    move-result-wide v10

    .line 125
    add-long/2addr v6, v10

    .line 126
    invoke-static {v10, v11, v5, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 127
    .line 128
    .line 129
    move-result-wide v10

    .line 130
    add-long/2addr v14, v8

    .line 131
    const/16 v12, 0x25

    .line 132
    .line 133
    invoke-static {v8, v9, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 134
    .line 135
    .line 136
    move-result-wide v8

    .line 137
    aget-wide v21, v1, v4

    .line 138
    .line 139
    add-long v6, v6, v21

    .line 140
    .line 141
    add-int/lit8 v12, v4, 0x1

    .line 142
    .line 143
    aget-wide v21, v1, v12

    .line 144
    .line 145
    aget-wide v23, v0, v18

    .line 146
    .line 147
    add-long v21, v21, v23

    .line 148
    .line 149
    add-long v8, v8, v21

    .line 150
    .line 151
    add-int/lit8 v16, v4, 0x2

    .line 152
    .line 153
    aget-wide v21, v1, v16

    .line 154
    .line 155
    add-int/lit8 v23, v18, 0x1

    .line 156
    .line 157
    aget-wide v24, v0, v23

    .line 158
    .line 159
    add-long v21, v21, v24

    .line 160
    .line 161
    add-long v14, v14, v21

    .line 162
    .line 163
    add-int/lit8 v21, v4, 0x3

    .line 164
    .line 165
    aget-wide v24, v1, v21

    .line 166
    .line 167
    move-wide/from16 v26, v6

    .line 168
    .line 169
    int-to-long v5, v13

    .line 170
    add-long v24, v24, v5

    .line 171
    .line 172
    add-long v10, v10, v24

    .line 173
    .line 174
    move-object/from16 v25, v0

    .line 175
    .line 176
    move-object/from16 v24, v1

    .line 177
    .line 178
    add-long v0, v26, v8

    .line 179
    .line 180
    const/16 v7, 0x19

    .line 181
    .line 182
    invoke-static {v8, v9, v7, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 183
    .line 184
    .line 185
    move-result-wide v7

    .line 186
    add-long/2addr v14, v10

    .line 187
    const/16 v9, 0x21

    .line 188
    .line 189
    invoke-static {v10, v11, v9, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 190
    .line 191
    .line 192
    move-result-wide v9

    .line 193
    add-long/2addr v0, v9

    .line 194
    const/16 v11, 0x2e

    .line 195
    .line 196
    invoke-static {v9, v10, v11, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 197
    .line 198
    .line 199
    move-result-wide v9

    .line 200
    add-long/2addr v14, v7

    .line 201
    const/16 v11, 0xc

    .line 202
    .line 203
    invoke-static {v7, v8, v11, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 204
    .line 205
    .line 206
    move-result-wide v7

    .line 207
    add-long/2addr v0, v7

    .line 208
    const/16 v11, 0x3a

    .line 209
    .line 210
    invoke-static {v7, v8, v11, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 211
    .line 212
    .line 213
    move-result-wide v7

    .line 214
    add-long/2addr v14, v9

    .line 215
    const/16 v11, 0x16

    .line 216
    .line 217
    invoke-static {v9, v10, v11, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 218
    .line 219
    .line 220
    move-result-wide v9

    .line 221
    add-long/2addr v0, v9

    .line 222
    const/16 v11, 0x20

    .line 223
    .line 224
    invoke-static {v9, v10, v11, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 225
    .line 226
    .line 227
    move-result-wide v9

    .line 228
    add-long/2addr v14, v7

    .line 229
    invoke-static {v7, v8, v11, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 230
    .line 231
    .line 232
    move-result-wide v7

    .line 233
    aget-wide v11, v24, v12

    .line 234
    .line 235
    add-long/2addr v0, v11

    .line 236
    aget-wide v11, v24, v16

    .line 237
    .line 238
    aget-wide v26, v25, v23

    .line 239
    .line 240
    add-long v11, v11, v26

    .line 241
    .line 242
    add-long/2addr v7, v11

    .line 243
    aget-wide v11, v24, v21

    .line 244
    .line 245
    add-int/lit8 v18, v18, 0x2

    .line 246
    .line 247
    aget-wide v26, v25, v18

    .line 248
    .line 249
    add-long v11, v11, v26

    .line 250
    .line 251
    add-long v15, v14, v11

    .line 252
    .line 253
    add-int/lit8 v4, v4, 0x4

    .line 254
    .line 255
    aget-wide v11, v24, v4

    .line 256
    .line 257
    add-long/2addr v11, v5

    .line 258
    const-wide/16 v4, 0x1

    .line 259
    .line 260
    add-long/2addr v11, v4

    .line 261
    add-long/2addr v11, v9

    .line 262
    add-int/lit8 v13, v13, 0x2

    .line 263
    .line 264
    move-wide v9, v7

    .line 265
    move/from16 v8, v19

    .line 266
    .line 267
    move/from16 v14, v20

    .line 268
    .line 269
    const/4 v5, 0x5

    .line 270
    move-wide v6, v0

    .line 271
    move-object/from16 v1, v24

    .line 272
    .line 273
    move-object/from16 v0, v25

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_0
    move/from16 v19, v8

    .line 278
    .line 279
    move/from16 v20, v14

    .line 280
    .line 281
    aput-wide v6, p2, v17

    .line 282
    .line 283
    aput-wide v9, p2, v19

    .line 284
    .line 285
    aput-wide v15, p2, p0

    .line 286
    .line 287
    aput-wide v11, p2, v20

    .line 288
    .line 289
    return-void

    .line 290
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 295
    .line 296
    .line 297
    return-void
.end method
