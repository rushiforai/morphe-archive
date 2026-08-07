.class public Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;


# instance fields
.field private A1:[[S

.field private A1inv:[[S

.field private A2:[[S

.field private A2inv:[[S

.field private b1:[S

.field private b2:[S

.field private initialized:Z

.field private layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

.field private numOfLayers:I

.field private pub_quadratic:[[S

.field private pub_scalar:[S

.field private pub_singular:[[S

.field private rainbowParams:Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

.field private sr:Ljava/security/SecureRandom;

.field private vi:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initialized:Z

    .line 6
    .line 7
    return-void
.end method

.method private compactPublicKey([[[S)V
    .locals 10

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    aget-object v2, p1, v1

    .line 4
    .line 5
    array-length v2, v2

    .line 6
    add-int/lit8 v3, v2, 0x1

    .line 7
    .line 8
    mul-int/2addr v3, v2

    .line 9
    const/4 v4, 0x2

    .line 10
    div-int/2addr v3, v4

    .line 11
    new-array v4, v4, [I

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    aput v3, v4, v5

    .line 15
    .line 16
    aput v0, v4, v1

    .line 17
    .line 18
    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 19
    .line 20
    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, [[S

    .line 25
    .line 26
    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_quadratic:[[S

    .line 27
    .line 28
    move v3, v1

    .line 29
    :goto_0
    if-ge v3, v0, :cond_3

    .line 30
    .line 31
    move v4, v1

    .line 32
    move v5, v4

    .line 33
    :goto_1
    if-ge v4, v2, :cond_2

    .line 34
    .line 35
    move v6, v4

    .line 36
    :goto_2
    if-ge v6, v2, :cond_1

    .line 37
    .line 38
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_quadratic:[[S

    .line 39
    .line 40
    if-ne v6, v4, :cond_0

    .line 41
    .line 42
    aget-object v7, v7, v3

    .line 43
    .line 44
    aget-object v8, p1, v3

    .line 45
    .line 46
    aget-object v8, v8, v4

    .line 47
    .line 48
    aget-short v8, v8, v6

    .line 49
    .line 50
    aput-short v8, v7, v5

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_0
    aget-object v7, v7, v3

    .line 54
    .line 55
    aget-object v8, p1, v3

    .line 56
    .line 57
    aget-object v9, v8, v4

    .line 58
    .line 59
    aget-short v9, v9, v6

    .line 60
    .line 61
    aget-object v8, v8, v6

    .line 62
    .line 63
    aget-short v8, v8, v4

    .line 64
    .line 65
    invoke-static {v9, v8}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 66
    .line 67
    .line 68
    move-result v8

    .line 69
    aput-short v8, v7, v5

    .line 70
    .line 71
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    add-int/lit8 v6, v6, 0x1

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    return-void
.end method

.method private computePublicKey()V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    const/4 v4, 0x1

    .line 12
    sub-int/2addr v3, v4

    .line 13
    aget v3, v2, v3

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    aget v6, v2, v5

    .line 17
    .line 18
    sub-int/2addr v3, v6

    .line 19
    array-length v6, v2

    .line 20
    sub-int/2addr v6, v4

    .line 21
    aget v2, v2, v6

    .line 22
    .line 23
    const/4 v6, 0x3

    .line 24
    new-array v7, v6, [I

    .line 25
    .line 26
    const/4 v8, 0x2

    .line 27
    aput v2, v7, v8

    .line 28
    .line 29
    aput v2, v7, v4

    .line 30
    .line 31
    aput v3, v7, v5

    .line 32
    .line 33
    sget-object v9, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 34
    .line 35
    invoke-static {v9, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    check-cast v7, [[[S

    .line 40
    .line 41
    new-array v10, v8, [I

    .line 42
    .line 43
    aput v2, v10, v4

    .line 44
    .line 45
    aput v3, v10, v5

    .line 46
    .line 47
    invoke-static {v9, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    check-cast v10, [[S

    .line 52
    .line 53
    iput-object v10, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 54
    .line 55
    new-array v10, v3, [S

    .line 56
    .line 57
    iput-object v10, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 58
    .line 59
    new-array v10, v2, [S

    .line 60
    .line 61
    move v10, v5

    .line 62
    move v11, v10

    .line 63
    :goto_0
    iget-object v12, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 64
    .line 65
    array-length v13, v12

    .line 66
    if-ge v10, v13, :cond_6

    .line 67
    .line 68
    aget-object v12, v12, v10

    .line 69
    .line 70
    invoke-virtual {v12}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffAlpha()[[[S

    .line 71
    .line 72
    .line 73
    move-result-object v12

    .line 74
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 75
    .line 76
    aget-object v13, v13, v10

    .line 77
    .line 78
    invoke-virtual {v13}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffBeta()[[[S

    .line 79
    .line 80
    .line 81
    move-result-object v13

    .line 82
    iget-object v14, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 83
    .line 84
    aget-object v14, v14, v10

    .line 85
    .line 86
    invoke-virtual {v14}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffGamma()[[S

    .line 87
    .line 88
    .line 89
    move-result-object v14

    .line 90
    iget-object v15, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 91
    .line 92
    aget-object v15, v15, v10

    .line 93
    .line 94
    invoke-virtual {v15}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffEta()[S

    .line 95
    .line 96
    .line 97
    move-result-object v15

    .line 98
    move/from16 v16, v4

    .line 99
    .line 100
    aget-object v4, v12, v5

    .line 101
    .line 102
    array-length v4, v4

    .line 103
    move/from16 v17, v5

    .line 104
    .line 105
    aget-object v5, v13, v17

    .line 106
    .line 107
    array-length v5, v5

    .line 108
    move/from16 v18, v8

    .line 109
    .line 110
    move/from16 v8, v17

    .line 111
    .line 112
    :goto_1
    if-ge v8, v4, :cond_5

    .line 113
    .line 114
    move/from16 v6, v17

    .line 115
    .line 116
    :goto_2
    if-ge v6, v4, :cond_1

    .line 117
    .line 118
    move/from16 v19, v2

    .line 119
    .line 120
    move/from16 v2, v17

    .line 121
    .line 122
    :goto_3
    if-ge v2, v5, :cond_0

    .line 123
    .line 124
    aget-object v20, v12, v8

    .line 125
    .line 126
    aget-object v20, v20, v6

    .line 127
    .line 128
    move/from16 v21, v2

    .line 129
    .line 130
    aget-short v2, v20, v21

    .line 131
    .line 132
    move/from16 v20, v4

    .line 133
    .line 134
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 135
    .line 136
    add-int v22, v6, v5

    .line 137
    .line 138
    aget-object v4, v4, v22

    .line 139
    .line 140
    invoke-virtual {v1, v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    add-int v4, v11, v8

    .line 145
    .line 146
    move/from16 v23, v4

    .line 147
    .line 148
    aget-object v4, v7, v23

    .line 149
    .line 150
    move/from16 v24, v6

    .line 151
    .line 152
    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 153
    .line 154
    aget-object v6, v6, v21

    .line 155
    .line 156
    invoke-virtual {v1, v2, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVects([S[S)[[S

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-virtual {v1, v4, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addSquareMatrix([[S[[S)[[S

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    aput-object v4, v7, v23

    .line 165
    .line 166
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 167
    .line 168
    aget-short v4, v4, v21

    .line 169
    .line 170
    invoke-virtual {v1, v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 175
    .line 176
    aget-object v6, v4, v23

    .line 177
    .line 178
    invoke-virtual {v1, v2, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    aput-object v2, v4, v23

    .line 183
    .line 184
    aget-object v2, v12, v8

    .line 185
    .line 186
    aget-object v2, v2, v24

    .line 187
    .line 188
    aget-short v2, v2, v21

    .line 189
    .line 190
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 191
    .line 192
    aget-object v4, v4, v21

    .line 193
    .line 194
    invoke-virtual {v1, v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 199
    .line 200
    aget-short v4, v4, v22

    .line 201
    .line 202
    invoke-virtual {v1, v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 207
    .line 208
    aget-object v6, v4, v23

    .line 209
    .line 210
    invoke-virtual {v1, v2, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    aput-object v2, v4, v23

    .line 215
    .line 216
    aget-object v2, v12, v8

    .line 217
    .line 218
    aget-object v2, v2, v24

    .line 219
    .line 220
    aget-short v2, v2, v21

    .line 221
    .line 222
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 223
    .line 224
    aget-short v4, v4, v22

    .line 225
    .line 226
    invoke-static {v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 231
    .line 232
    aget-short v6, v4, v23

    .line 233
    .line 234
    move-object/from16 v22, v4

    .line 235
    .line 236
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 237
    .line 238
    aget-short v4, v4, v21

    .line 239
    .line 240
    invoke-static {v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    invoke-static {v6, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    aput-short v2, v22, v23

    .line 249
    .line 250
    add-int/lit8 v2, v21, 0x1

    .line 251
    .line 252
    move/from16 v4, v20

    .line 253
    .line 254
    move/from16 v6, v24

    .line 255
    .line 256
    goto/16 :goto_3

    .line 257
    .line 258
    :cond_0
    move/from16 v20, v4

    .line 259
    .line 260
    move/from16 v24, v6

    .line 261
    .line 262
    add-int/lit8 v6, v24, 0x1

    .line 263
    .line 264
    move/from16 v2, v19

    .line 265
    .line 266
    goto/16 :goto_2

    .line 267
    .line 268
    :cond_1
    move/from16 v19, v2

    .line 269
    .line 270
    move/from16 v20, v4

    .line 271
    .line 272
    move/from16 v2, v17

    .line 273
    .line 274
    :goto_4
    if-ge v2, v5, :cond_3

    .line 275
    .line 276
    move/from16 v4, v17

    .line 277
    .line 278
    :goto_5
    if-ge v4, v5, :cond_2

    .line 279
    .line 280
    aget-object v6, v13, v8

    .line 281
    .line 282
    aget-object v6, v6, v2

    .line 283
    .line 284
    aget-short v6, v6, v4

    .line 285
    .line 286
    move/from16 v21, v2

    .line 287
    .line 288
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 289
    .line 290
    aget-object v2, v2, v21

    .line 291
    .line 292
    invoke-virtual {v1, v6, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    add-int v6, v11, v8

    .line 297
    .line 298
    move/from16 v22, v4

    .line 299
    .line 300
    aget-object v4, v7, v6

    .line 301
    .line 302
    move/from16 v23, v5

    .line 303
    .line 304
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 305
    .line 306
    aget-object v5, v5, v22

    .line 307
    .line 308
    invoke-virtual {v1, v2, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVects([S[S)[[S

    .line 309
    .line 310
    .line 311
    move-result-object v5

    .line 312
    invoke-virtual {v1, v4, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addSquareMatrix([[S[[S)[[S

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    aput-object v4, v7, v6

    .line 317
    .line 318
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 319
    .line 320
    aget-short v4, v4, v22

    .line 321
    .line 322
    invoke-virtual {v1, v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 327
    .line 328
    aget-object v5, v4, v6

    .line 329
    .line 330
    invoke-virtual {v1, v2, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    aput-object v2, v4, v6

    .line 335
    .line 336
    aget-object v2, v13, v8

    .line 337
    .line 338
    aget-object v2, v2, v21

    .line 339
    .line 340
    aget-short v2, v2, v22

    .line 341
    .line 342
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 343
    .line 344
    aget-object v4, v4, v22

    .line 345
    .line 346
    invoke-virtual {v1, v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 351
    .line 352
    aget-short v4, v4, v21

    .line 353
    .line 354
    invoke-virtual {v1, v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 359
    .line 360
    aget-object v5, v4, v6

    .line 361
    .line 362
    invoke-virtual {v1, v2, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    aput-object v2, v4, v6

    .line 367
    .line 368
    aget-object v2, v13, v8

    .line 369
    .line 370
    aget-object v2, v2, v21

    .line 371
    .line 372
    aget-short v2, v2, v22

    .line 373
    .line 374
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 375
    .line 376
    aget-short v4, v4, v21

    .line 377
    .line 378
    invoke-static {v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 379
    .line 380
    .line 381
    move-result v2

    .line 382
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 383
    .line 384
    aget-short v5, v4, v6

    .line 385
    .line 386
    move-object/from16 v24, v4

    .line 387
    .line 388
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 389
    .line 390
    aget-short v4, v4, v22

    .line 391
    .line 392
    invoke-static {v2, v4}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    invoke-static {v5, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 397
    .line 398
    .line 399
    move-result v2

    .line 400
    aput-short v2, v24, v6

    .line 401
    .line 402
    add-int/lit8 v4, v22, 0x1

    .line 403
    .line 404
    move/from16 v2, v21

    .line 405
    .line 406
    move/from16 v5, v23

    .line 407
    .line 408
    goto/16 :goto_5

    .line 409
    .line 410
    :cond_2
    move/from16 v21, v2

    .line 411
    .line 412
    move/from16 v23, v5

    .line 413
    .line 414
    add-int/lit8 v2, v21, 0x1

    .line 415
    .line 416
    goto/16 :goto_4

    .line 417
    .line 418
    :cond_3
    move/from16 v23, v5

    .line 419
    .line 420
    move/from16 v2, v17

    .line 421
    .line 422
    :goto_6
    add-int v5, v23, v20

    .line 423
    .line 424
    if-ge v2, v5, :cond_4

    .line 425
    .line 426
    aget-object v4, v14, v8

    .line 427
    .line 428
    aget-short v4, v4, v2

    .line 429
    .line 430
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 431
    .line 432
    aget-object v5, v5, v2

    .line 433
    .line 434
    invoke-virtual {v1, v4, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 439
    .line 440
    add-int v6, v11, v8

    .line 441
    .line 442
    move/from16 v21, v2

    .line 443
    .line 444
    aget-object v2, v5, v6

    .line 445
    .line 446
    invoke-virtual {v1, v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    aput-object v2, v5, v6

    .line 451
    .line 452
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 453
    .line 454
    aget-short v4, v2, v6

    .line 455
    .line 456
    aget-object v5, v14, v8

    .line 457
    .line 458
    aget-short v5, v5, v21

    .line 459
    .line 460
    move-object/from16 v22, v2

    .line 461
    .line 462
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 463
    .line 464
    aget-short v2, v2, v21

    .line 465
    .line 466
    invoke-static {v5, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 467
    .line 468
    .line 469
    move-result v2

    .line 470
    invoke-static {v4, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    aput-short v2, v22, v6

    .line 475
    .line 476
    add-int/lit8 v2, v21, 0x1

    .line 477
    .line 478
    goto :goto_6

    .line 479
    :cond_4
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 480
    .line 481
    add-int v4, v11, v8

    .line 482
    .line 483
    aget-short v5, v2, v4

    .line 484
    .line 485
    aget-short v6, v15, v8

    .line 486
    .line 487
    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 488
    .line 489
    .line 490
    move-result v5

    .line 491
    aput-short v5, v2, v4

    .line 492
    .line 493
    add-int/lit8 v8, v8, 0x1

    .line 494
    .line 495
    move/from16 v2, v19

    .line 496
    .line 497
    move/from16 v4, v20

    .line 498
    .line 499
    move/from16 v5, v23

    .line 500
    .line 501
    const/4 v6, 0x3

    .line 502
    goto/16 :goto_1

    .line 503
    .line 504
    :cond_5
    move/from16 v19, v2

    .line 505
    .line 506
    move/from16 v20, v4

    .line 507
    .line 508
    add-int v11, v11, v20

    .line 509
    .line 510
    add-int/lit8 v10, v10, 0x1

    .line 511
    .line 512
    move/from16 v4, v16

    .line 513
    .line 514
    move/from16 v5, v17

    .line 515
    .line 516
    move/from16 v8, v18

    .line 517
    .line 518
    const/4 v6, 0x3

    .line 519
    goto/16 :goto_0

    .line 520
    .line 521
    :cond_6
    move/from16 v19, v2

    .line 522
    .line 523
    move/from16 v16, v4

    .line 524
    .line 525
    move/from16 v17, v5

    .line 526
    .line 527
    move v2, v6

    .line 528
    move/from16 v18, v8

    .line 529
    .line 530
    new-array v2, v2, [I

    .line 531
    .line 532
    aput v19, v2, v18

    .line 533
    .line 534
    aput v19, v2, v16

    .line 535
    .line 536
    aput v3, v2, v17

    .line 537
    .line 538
    invoke-static {v9, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object v2

    .line 542
    check-cast v2, [[[S

    .line 543
    .line 544
    move/from16 v4, v18

    .line 545
    .line 546
    new-array v4, v4, [I

    .line 547
    .line 548
    aput v19, v4, v16

    .line 549
    .line 550
    aput v3, v4, v17

    .line 551
    .line 552
    invoke-static {v9, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    move-result-object v4

    .line 556
    check-cast v4, [[S

    .line 557
    .line 558
    new-array v5, v3, [S

    .line 559
    .line 560
    move/from16 v6, v17

    .line 561
    .line 562
    :goto_7
    if-ge v6, v3, :cond_8

    .line 563
    .line 564
    move/from16 v8, v17

    .line 565
    .line 566
    :goto_8
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 567
    .line 568
    array-length v10, v9

    .line 569
    if-ge v8, v10, :cond_7

    .line 570
    .line 571
    aget-object v10, v2, v6

    .line 572
    .line 573
    aget-object v9, v9, v6

    .line 574
    .line 575
    aget-short v9, v9, v8

    .line 576
    .line 577
    aget-object v11, v7, v8

    .line 578
    .line 579
    invoke-virtual {v1, v9, v11}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multMatrix(S[[S)[[S

    .line 580
    .line 581
    .line 582
    move-result-object v9

    .line 583
    invoke-virtual {v1, v10, v9}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addSquareMatrix([[S[[S)[[S

    .line 584
    .line 585
    .line 586
    move-result-object v9

    .line 587
    aput-object v9, v2, v6

    .line 588
    .line 589
    aget-object v9, v4, v6

    .line 590
    .line 591
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 592
    .line 593
    aget-object v10, v10, v6

    .line 594
    .line 595
    aget-short v10, v10, v8

    .line 596
    .line 597
    iget-object v11, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 598
    .line 599
    aget-object v11, v11, v8

    .line 600
    .line 601
    invoke-virtual {v1, v10, v11}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->multVect(S[S)[S

    .line 602
    .line 603
    .line 604
    move-result-object v10

    .line 605
    invoke-virtual {v1, v9, v10}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->addVect([S[S)[S

    .line 606
    .line 607
    .line 608
    move-result-object v9

    .line 609
    aput-object v9, v4, v6

    .line 610
    .line 611
    aget-short v9, v5, v6

    .line 612
    .line 613
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 614
    .line 615
    aget-object v10, v10, v6

    .line 616
    .line 617
    aget-short v10, v10, v8

    .line 618
    .line 619
    iget-object v11, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 620
    .line 621
    aget-short v11, v11, v8

    .line 622
    .line 623
    invoke-static {v10, v11}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    .line 624
    .line 625
    .line 626
    move-result v10

    .line 627
    invoke-static {v9, v10}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 628
    .line 629
    .line 630
    move-result v9

    .line 631
    aput-short v9, v5, v6

    .line 632
    .line 633
    add-int/lit8 v8, v8, 0x1

    .line 634
    .line 635
    goto :goto_8

    .line 636
    :cond_7
    aget-short v8, v5, v6

    .line 637
    .line 638
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b1:[S

    .line 639
    .line 640
    aget-short v9, v9, v6

    .line 641
    .line 642
    invoke-static {v8, v9}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    .line 643
    .line 644
    .line 645
    move-result v8

    .line 646
    aput-short v8, v5, v6

    .line 647
    .line 648
    add-int/lit8 v6, v6, 0x1

    .line 649
    .line 650
    goto :goto_7

    .line 651
    :cond_8
    iput-object v4, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 652
    .line 653
    iput-object v5, v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 654
    .line 655
    invoke-direct {v0, v2}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->compactPublicKey([[[S)V

    .line 656
    .line 657
    .line 658
    return-void
.end method

.method private generateF()V
    .locals 7

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->numOfLayers:I

    .line 2
    .line 3
    new-array v0, v0, [Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 4
    .line 5
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->numOfLayers:I

    .line 9
    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 13
    .line 14
    new-instance v2, Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 15
    .line 16
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 17
    .line 18
    aget v4, v3, v0

    .line 19
    .line 20
    add-int/lit8 v5, v0, 0x1

    .line 21
    .line 22
    aget v3, v3, v5

    .line 23
    .line 24
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 25
    .line 26
    invoke-direct {v2, v4, v3, v6}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;-><init>(IILjava/security/SecureRandom;)V

    .line 27
    .line 28
    .line 29
    aput-object v2, v1, v0

    .line 30
    .line 31
    move v0, v5

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method private generateL1()V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x1

    .line 5
    sub-int/2addr v1, v2

    .line 6
    aget v1, v0, v1

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aget v0, v0, v3

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    const/4 v0, 0x2

    .line 13
    new-array v0, v0, [I

    .line 14
    .line 15
    aput v1, v0, v2

    .line 16
    .line 17
    aput v1, v0, v3

    .line 18
    .line 19
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, [[S

    .line 26
    .line 27
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1inv:[[S

    .line 31
    .line 32
    new-instance v0, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;

    .line 33
    .line 34
    invoke-direct {v0}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;-><init>()V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1inv:[[S

    .line 38
    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    move v2, v3

    .line 42
    :goto_1
    if-ge v2, v1, :cond_1

    .line 43
    .line 44
    move v4, v3

    .line 45
    :goto_2
    if-ge v4, v1, :cond_0

    .line 46
    .line 47
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 48
    .line 49
    aget-object v5, v5, v2

    .line 50
    .line 51
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 52
    .line 53
    invoke-virtual {v6}, Ljava/util/Random;->nextInt()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    and-int/lit16 v6, v6, 0xff

    .line 58
    .line 59
    int-to-short v6, v6

    .line 60
    aput-short v6, v5, v4

    .line 61
    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1:[[S

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->inverse([[S)[[S

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1inv:[[S

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    new-array v0, v1, [S

    .line 78
    .line 79
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b1:[S

    .line 80
    .line 81
    :goto_3
    if-ge v3, v1, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b1:[S

    .line 84
    .line 85
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    and-int/lit16 v2, v2, 0xff

    .line 92
    .line 93
    int-to-short v2, v2

    .line 94
    aput-short v2, v0, v3

    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_3
    return-void
.end method

.method private generateL2()V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x1

    .line 5
    sub-int/2addr v1, v2

    .line 6
    aget v0, v0, v1

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v1, v1, [I

    .line 10
    .line 11
    aput v0, v1, v2

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    aput v0, v1, v2

    .line 15
    .line 16
    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 17
    .line 18
    invoke-static {v3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, [[S

    .line 23
    .line 24
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2inv:[[S

    .line 28
    .line 29
    new-instance v1, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;

    .line 30
    .line 31
    invoke-direct {v1}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;-><init>()V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2inv:[[S

    .line 35
    .line 36
    if-nez v3, :cond_2

    .line 37
    .line 38
    move v3, v2

    .line 39
    :goto_1
    if-ge v3, v0, :cond_1

    .line 40
    .line 41
    move v4, v2

    .line 42
    :goto_2
    if-ge v4, v0, :cond_0

    .line 43
    .line 44
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 45
    .line 46
    aget-object v5, v5, v3

    .line 47
    .line 48
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 49
    .line 50
    invoke-virtual {v6}, Ljava/util/Random;->nextInt()I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    and-int/lit16 v6, v6, 0xff

    .line 55
    .line 56
    int-to-short v6, v6

    .line 57
    aput-short v6, v5, v4

    .line 58
    .line 59
    add-int/lit8 v4, v4, 0x1

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2:[[S

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/ComputeInField;->inverse([[S)[[S

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2inv:[[S

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    new-array v1, v0, [S

    .line 75
    .line 76
    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 77
    .line 78
    :goto_3
    if-ge v2, v0, :cond_3

    .line 79
    .line 80
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 81
    .line 82
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/util/Random;->nextInt()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    and-int/lit16 v3, v3, 0xff

    .line 89
    .line 90
    int-to-short v3, v3

    .line 91
    aput-short v3, v1, v2

    .line 92
    .line 93
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_3
    return-void
.end method

.method private initializeDefault()V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

    .line 2
    .line 3
    new-instance v1, Ljava/security/SecureRandom;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;

    .line 9
    .line 10
    invoke-direct {v2}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private keygen()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->generateL1()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->generateL2()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->generateF()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->computePublicKey()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public genKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initialized:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initializeDefault()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->keygen()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;

    .line 12
    .line 13
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A1inv:[[S

    .line 14
    .line 15
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b1:[S

    .line 16
    .line 17
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->A2inv:[[S

    .line 18
    .line 19
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->b2:[S

    .line 20
    .line 21
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 22
    .line 23
    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 24
    .line 25
    invoke-direct/range {v1 .. v7}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;-><init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPublicKeyParameters;

    .line 29
    .line 30
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 31
    .line 32
    array-length v3, v2

    .line 33
    add-int/lit8 v3, v3, -0x1

    .line 34
    .line 35
    aget v3, v2, v3

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    aget v2, v2, v4

    .line 39
    .line 40
    sub-int/2addr v3, v2

    .line 41
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_quadratic:[[S

    .line 42
    .line 43
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_singular:[[S

    .line 44
    .line 45
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->pub_scalar:[S

    .line 46
    .line 47
    invoke-direct {v0, v3, v2, v4, p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPublicKeyParameters;-><init>(I[[S[[S[S)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 51
    .line 52
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;-><init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method public generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->genKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .locals 0

    .line 1
    check-cast p1, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->rainbowParams:Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

    .line 4
    .line 5
    new-instance p1, Ljava/security/SecureRandom;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->sr:Ljava/security/SecureRandom;

    .line 11
    .line 12
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->rainbowParams:Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

    .line 13
    .line 14
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->getVi()[I

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->vi:[I

    .line 23
    .line 24
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->rainbowParams:Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;

    .line 25
    .line 26
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->getNumOfLayers()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->numOfLayers:I

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowKeyPairGenerator;->initialized:Z

    .line 38
    .line 39
    return-void
.end method
