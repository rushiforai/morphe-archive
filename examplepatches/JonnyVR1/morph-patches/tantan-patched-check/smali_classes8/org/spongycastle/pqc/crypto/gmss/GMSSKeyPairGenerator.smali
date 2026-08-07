.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;


# static fields
.field public static final OID:Ljava/lang/String; = "1.3.6.1.4.1.8301.3.1.3.3"


# instance fields
.field private K:[I

.field private currentRootSigs:[[B

.field private currentSeeds:[[B

.field private digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

.field private gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

.field private gmssParams:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

.field private gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

.field private heightOfTrees:[I

.field private initialized:Z

.field private mdLength:I

.field private messDigestTree:Lorg/spongycastle/crypto/Digest;

.field private nextNextSeeds:[[B

.field private numLayer:I

.field private otsIndex:[I


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialized:Z

    .line 6
    .line 7
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 8
    .line 9
    invoke-interface {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 20
    .line 21
    new-instance p1, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 22
    .line 23
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->messDigestTree:Lorg/spongycastle/crypto/Digest;

    .line 24
    .line 25
    invoke-direct {p1, v0}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 29
    .line 30
    return-void
.end method

.method private genKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-boolean v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialized:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initializeDefault()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 11
    .line 12
    new-array v4, v0, [[[B

    .line 13
    .line 14
    add-int/lit8 v2, v0, -0x1

    .line 15
    .line 16
    new-array v5, v2, [[[B

    .line 17
    .line 18
    new-array v6, v0, [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 19
    .line 20
    add-int/lit8 v2, v0, -0x1

    .line 21
    .line 22
    new-array v7, v2, [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 23
    .line 24
    new-array v8, v0, [Ljava/util/Vector;

    .line 25
    .line 26
    add-int/lit8 v2, v0, -0x1

    .line 27
    .line 28
    new-array v9, v2, [Ljava/util/Vector;

    .line 29
    .line 30
    new-array v10, v0, [[Ljava/util/Vector;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    sub-int/2addr v0, v2

    .line 34
    new-array v11, v0, [[Ljava/util/Vector;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    move v0, v3

    .line 38
    :goto_0
    iget v12, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 39
    .line 40
    sget-object v13, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 41
    .line 42
    const/4 v14, 0x2

    .line 43
    if-ge v0, v12, :cond_3

    .line 44
    .line 45
    iget-object v12, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 46
    .line 47
    aget v12, v12, v0

    .line 48
    .line 49
    iget v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 50
    .line 51
    move/from16 v16, v2

    .line 52
    .line 53
    new-array v2, v14, [I

    .line 54
    .line 55
    aput v15, v2, v16

    .line 56
    .line 57
    aput v12, v2, v3

    .line 58
    .line 59
    invoke-static {v13, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, [[B

    .line 64
    .line 65
    aput-object v2, v4, v0

    .line 66
    .line 67
    iget-object v2, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 68
    .line 69
    aget v2, v2, v0

    .line 70
    .line 71
    iget-object v12, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 72
    .line 73
    aget v12, v12, v0

    .line 74
    .line 75
    sub-int v12, v2, v12

    .line 76
    .line 77
    new-array v12, v12, [Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 78
    .line 79
    aput-object v12, v6, v0

    .line 80
    .line 81
    if-lez v0, :cond_1

    .line 82
    .line 83
    add-int/lit8 v12, v0, -0x1

    .line 84
    .line 85
    iget v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 86
    .line 87
    new-array v14, v14, [I

    .line 88
    .line 89
    aput v15, v14, v16

    .line 90
    .line 91
    aput v2, v14, v3

    .line 92
    .line 93
    invoke-static {v13, v14}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, [[B

    .line 98
    .line 99
    aput-object v2, v5, v12

    .line 100
    .line 101
    iget-object v2, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 102
    .line 103
    aget v2, v2, v0

    .line 104
    .line 105
    iget-object v13, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 106
    .line 107
    aget v13, v13, v0

    .line 108
    .line 109
    sub-int/2addr v2, v13

    .line 110
    new-array v2, v2, [Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 111
    .line 112
    aput-object v2, v7, v12

    .line 113
    .line 114
    :cond_1
    new-instance v2, Ljava/util/Vector;

    .line 115
    .line 116
    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 117
    .line 118
    .line 119
    aput-object v2, v8, v0

    .line 120
    .line 121
    if-lez v0, :cond_2

    .line 122
    .line 123
    add-int/lit8 v2, v0, -0x1

    .line 124
    .line 125
    new-instance v12, Ljava/util/Vector;

    .line 126
    .line 127
    invoke-direct {v12}, Ljava/util/Vector;-><init>()V

    .line 128
    .line 129
    .line 130
    aput-object v12, v9, v2

    .line 131
    .line 132
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 133
    .line 134
    move/from16 v2, v16

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    move/from16 v16, v2

    .line 138
    .line 139
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 140
    .line 141
    new-array v2, v14, [I

    .line 142
    .line 143
    aput v0, v2, v16

    .line 144
    .line 145
    aput v12, v2, v3

    .line 146
    .line 147
    invoke-static {v13, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    move-object v2, v0

    .line 152
    check-cast v2, [[B

    .line 153
    .line 154
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 155
    .line 156
    add-int/lit8 v0, v0, -0x1

    .line 157
    .line 158
    iget v12, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 159
    .line 160
    new-array v15, v14, [I

    .line 161
    .line 162
    aput v12, v15, v16

    .line 163
    .line 164
    aput v0, v15, v3

    .line 165
    .line 166
    invoke-static {v13, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    move-object v12, v0

    .line 171
    check-cast v12, [[B

    .line 172
    .line 173
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 174
    .line 175
    iget v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 176
    .line 177
    move/from16 v17, v3

    .line 178
    .line 179
    new-array v3, v14, [I

    .line 180
    .line 181
    aput v15, v3, v16

    .line 182
    .line 183
    aput v0, v3, v17

    .line 184
    .line 185
    invoke-static {v13, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    move-object v3, v0

    .line 190
    check-cast v3, [[B

    .line 191
    .line 192
    move/from16 v0, v17

    .line 193
    .line 194
    :goto_1
    iget v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 195
    .line 196
    if-ge v0, v15, :cond_4

    .line 197
    .line 198
    iget-object v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentSeeds:[[B

    .line 199
    .line 200
    aget-object v15, v15, v0

    .line 201
    .line 202
    aget-object v14, v3, v0

    .line 203
    .line 204
    move/from16 v19, v0

    .line 205
    .line 206
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 207
    .line 208
    move-object/from16 v20, v2

    .line 209
    .line 210
    move/from16 v2, v17

    .line 211
    .line 212
    invoke-static {v15, v2, v14, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    .line 214
    .line 215
    add-int/lit8 v0, v19, 0x1

    .line 216
    .line 217
    move-object/from16 v2, v20

    .line 218
    .line 219
    const/4 v14, 0x2

    .line 220
    goto :goto_1

    .line 221
    :cond_4
    move-object/from16 v20, v2

    .line 222
    .line 223
    move/from16 v2, v17

    .line 224
    .line 225
    add-int/lit8 v15, v15, -0x1

    .line 226
    .line 227
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 228
    .line 229
    const/4 v14, 0x2

    .line 230
    new-array v2, v14, [I

    .line 231
    .line 232
    aput v0, v2, v16

    .line 233
    .line 234
    aput v15, v2, v17

    .line 235
    .line 236
    invoke-static {v13, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    check-cast v0, [[B

    .line 241
    .line 242
    iput-object v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentRootSigs:[[B

    .line 243
    .line 244
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 245
    .line 246
    add-int/lit8 v0, v0, -0x1

    .line 247
    .line 248
    move v2, v0

    .line 249
    :goto_2
    if-ltz v2, :cond_7

    .line 250
    .line 251
    new-instance v13, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 252
    .line 253
    iget-object v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 254
    .line 255
    aget v0, v0, v2

    .line 256
    .line 257
    iget-object v14, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 258
    .line 259
    aget v14, v14, v2

    .line 260
    .line 261
    iget-object v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 262
    .line 263
    invoke-direct {v13, v0, v14, v15}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;-><init>(IILorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V

    .line 264
    .line 265
    .line 266
    :try_start_0
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 267
    .line 268
    add-int/lit8 v0, v0, -0x1

    .line 269
    .line 270
    if-ne v2, v0, :cond_5

    .line 271
    .line 272
    aget-object v0, v8, v2

    .line 273
    .line 274
    aget-object v14, v3, v2

    .line 275
    .line 276
    const/4 v15, 0x0

    .line 277
    invoke-direct {v1, v15, v0, v14, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->generateCurrentAuthpathAndRoot([BLjava/util/Vector;[BI)Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    :goto_3
    move-object v13, v0

    .line 282
    goto :goto_5

    .line 283
    :catch_0
    move-exception v0

    .line 284
    goto :goto_4

    .line 285
    :cond_5
    add-int/lit8 v0, v2, 0x1

    .line 286
    .line 287
    aget-object v0, v20, v0

    .line 288
    .line 289
    aget-object v14, v8, v2

    .line 290
    .line 291
    aget-object v15, v3, v2

    .line 292
    .line 293
    invoke-direct {v1, v0, v14, v15, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->generateCurrentAuthpathAndRoot([BLjava/util/Vector;[BI)Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 294
    .line 295
    .line 296
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    goto :goto_3

    .line 298
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 299
    .line 300
    .line 301
    :goto_5
    const/4 v0, 0x0

    .line 302
    :goto_6
    iget-object v14, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 303
    .line 304
    aget v14, v14, v2

    .line 305
    .line 306
    if-ge v0, v14, :cond_6

    .line 307
    .line 308
    invoke-virtual {v13}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getAuthPath()[[B

    .line 309
    .line 310
    .line 311
    move-result-object v14

    .line 312
    aget-object v14, v14, v0

    .line 313
    .line 314
    aget-object v15, v4, v2

    .line 315
    .line 316
    aget-object v15, v15, v0

    .line 317
    .line 318
    move/from16 v19, v0

    .line 319
    .line 320
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 321
    .line 322
    move/from16 v21, v2

    .line 323
    .line 324
    const/4 v2, 0x0

    .line 325
    invoke-static {v14, v2, v15, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    .line 327
    .line 328
    add-int/lit8 v0, v19, 0x1

    .line 329
    .line 330
    move/from16 v2, v21

    .line 331
    .line 332
    goto :goto_6

    .line 333
    :cond_6
    move/from16 v21, v2

    .line 334
    .line 335
    const/4 v2, 0x0

    .line 336
    invoke-virtual {v13}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getRetain()[Ljava/util/Vector;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    aput-object v0, v10, v21

    .line 341
    .line 342
    invoke-virtual {v13}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getTreehash()[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    aput-object v0, v6, v21

    .line 347
    .line 348
    invoke-virtual {v13}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getRoot()[B

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    aget-object v13, v20, v21

    .line 353
    .line 354
    iget v14, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 355
    .line 356
    invoke-static {v0, v2, v13, v2, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 357
    .line 358
    .line 359
    add-int/lit8 v2, v21, -0x1

    .line 360
    .line 361
    goto :goto_2

    .line 362
    :cond_7
    iget v0, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 363
    .line 364
    const/16 v18, 0x2

    .line 365
    .line 366
    add-int/lit8 v0, v0, -0x2

    .line 367
    .line 368
    :goto_7
    if-ltz v0, :cond_9

    .line 369
    .line 370
    aget-object v2, v9, v0

    .line 371
    .line 372
    add-int/lit8 v13, v0, 0x1

    .line 373
    .line 374
    aget-object v14, v3, v13

    .line 375
    .line 376
    invoke-direct {v1, v2, v14, v13}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->generateNextAuthpathAndRoot(Ljava/util/Vector;[BI)Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    const/4 v14, 0x0

    .line 381
    :goto_8
    iget-object v15, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 382
    .line 383
    aget v15, v15, v13

    .line 384
    .line 385
    if-ge v14, v15, :cond_8

    .line 386
    .line 387
    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getAuthPath()[[B

    .line 388
    .line 389
    .line 390
    move-result-object v15

    .line 391
    aget-object v15, v15, v14

    .line 392
    .line 393
    aget-object v16, v5, v0

    .line 394
    .line 395
    move/from16 v18, v0

    .line 396
    .line 397
    aget-object v0, v16, v14

    .line 398
    .line 399
    move-object/from16 v16, v2

    .line 400
    .line 401
    iget v2, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 402
    .line 403
    move-object/from16 v19, v3

    .line 404
    .line 405
    const/4 v3, 0x0

    .line 406
    invoke-static {v15, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    .line 408
    .line 409
    add-int/lit8 v14, v14, 0x1

    .line 410
    .line 411
    move-object/from16 v2, v16

    .line 412
    .line 413
    move/from16 v0, v18

    .line 414
    .line 415
    move-object/from16 v3, v19

    .line 416
    .line 417
    goto :goto_8

    .line 418
    :cond_8
    move/from16 v18, v0

    .line 419
    .line 420
    move-object/from16 v16, v2

    .line 421
    .line 422
    move-object/from16 v19, v3

    .line 423
    .line 424
    const/4 v3, 0x0

    .line 425
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getRetain()[Ljava/util/Vector;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    aput-object v0, v11, v18

    .line 430
    .line 431
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getTreehash()[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    aput-object v0, v7, v18

    .line 436
    .line 437
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->getRoot()[B

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    aget-object v2, v12, v18

    .line 442
    .line 443
    iget v14, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 444
    .line 445
    invoke-static {v0, v3, v2, v3, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 446
    .line 447
    .line 448
    aget-object v0, v19, v13

    .line 449
    .line 450
    iget-object v2, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->nextNextSeeds:[[B

    .line 451
    .line 452
    aget-object v2, v2, v18

    .line 453
    .line 454
    iget v13, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 455
    .line 456
    invoke-static {v0, v3, v2, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 457
    .line 458
    .line 459
    add-int/lit8 v0, v18, -0x1

    .line 460
    .line 461
    move-object/from16 v3, v19

    .line 462
    .line 463
    goto :goto_7

    .line 464
    :cond_9
    const/4 v3, 0x0

    .line 465
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;

    .line 466
    .line 467
    aget-object v2, v20, v3

    .line 468
    .line 469
    iget-object v3, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 470
    .line 471
    invoke-direct {v0, v2, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters;-><init>([BLorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    .line 472
    .line 473
    .line 474
    new-instance v2, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;

    .line 475
    .line 476
    move-object v3, v2

    .line 477
    iget-object v2, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentSeeds:[[B

    .line 478
    .line 479
    move-object v13, v3

    .line 480
    iget-object v3, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->nextNextSeeds:[[B

    .line 481
    .line 482
    move-object v14, v13

    .line 483
    iget-object v13, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentRootSigs:[[B

    .line 484
    .line 485
    move-object v15, v14

    .line 486
    iget-object v14, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 487
    .line 488
    iget-object v1, v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 489
    .line 490
    move-object/from16 v22, v15

    .line 491
    .line 492
    move-object v15, v1

    .line 493
    move-object/from16 v1, v22

    .line 494
    .line 495
    invoke-direct/range {v1 .. v15}, Lorg/spongycastle/pqc/crypto/gmss/GMSSPrivateKeyParameters;-><init>([[B[[B[[[B[[[B[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;[Ljava/util/Vector;[Ljava/util/Vector;[[Ljava/util/Vector;[[Ljava/util/Vector;[[B[[BLorg/spongycastle/pqc/crypto/gmss/GMSSParameters;Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V

    .line 496
    .line 497
    .line 498
    move-object v15, v1

    .line 499
    new-instance v1, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 500
    .line 501
    invoke-direct {v1, v0, v15}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;-><init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V

    .line 502
    .line 503
    .line 504
    return-object v1
.end method

.method private generateCurrentAuthpathAndRoot([BLjava/util/Vector;[BI)Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    .locals 7

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 14
    .line 15
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 16
    .line 17
    aget v2, v2, p4

    .line 18
    .line 19
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 20
    .line 21
    aget v3, v3, p4

    .line 22
    .line 23
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 24
    .line 25
    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;-><init>(IILorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->initialize(Ljava/util/Vector;)V

    .line 29
    .line 30
    .line 31
    iget p2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    sub-int/2addr p2, v2

    .line 35
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 36
    .line 37
    if-ne p4, p2, :cond_0

    .line 38
    .line 39
    new-instance p1, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 40
    .line 41
    invoke-interface {v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 46
    .line 47
    aget v3, v3, p4

    .line 48
    .line 49
    invoke-direct {p1, v0, p2, v3}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;-><init>([BLorg/spongycastle/crypto/Digest;I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getPublicKey()[B

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    new-instance p2, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 58
    .line 59
    invoke-interface {v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 64
    .line 65
    aget v4, v4, p4

    .line 66
    .line 67
    invoke-direct {p2, v0, v3, v4}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;-><init>([BLorg/spongycastle/crypto/Digest;I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentRootSigs:[[B

    .line 71
    .line 72
    invoke-virtual {p2, p1}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getSignature([B)[B

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    aput-object p2, v0, p4

    .line 77
    .line 78
    new-instance p2, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;

    .line 79
    .line 80
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 81
    .line 82
    invoke-interface {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 87
    .line 88
    aget v3, v3, p4

    .line 89
    .line 90
    invoke-direct {p2, v0, v3}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;-><init>(Lorg/spongycastle/crypto/Digest;I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentRootSigs:[[B

    .line 94
    .line 95
    aget-object v0, v0, p4

    .line 96
    .line 97
    invoke-virtual {p2, p1, v0}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->Verify([B[B)[B

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    :goto_0
    invoke-virtual {v1, p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->update([B)V

    .line 102
    .line 103
    .line 104
    const/4 p1, 0x3

    .line 105
    const/4 p2, 0x0

    .line 106
    move v0, v2

    .line 107
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 108
    .line 109
    aget v3, v3, p4

    .line 110
    .line 111
    shl-int v4, v2, v3

    .line 112
    .line 113
    if-ge v0, v4, :cond_2

    .line 114
    .line 115
    if-ne v0, p1, :cond_1

    .line 116
    .line 117
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 118
    .line 119
    aget v4, v4, p4

    .line 120
    .line 121
    sub-int/2addr v3, v4

    .line 122
    if-ge p2, v3, :cond_1

    .line 123
    .line 124
    invoke-virtual {v1, p3, p2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->initializeTreehashSeed([BI)V

    .line 125
    .line 126
    .line 127
    mul-int/lit8 p1, p1, 0x2

    .line 128
    .line 129
    add-int/lit8 p2, p2, 0x1

    .line 130
    .line 131
    :cond_1
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 132
    .line 133
    invoke-virtual {v3, p3}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    new-instance v4, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 138
    .line 139
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 140
    .line 141
    invoke-interface {v5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 146
    .line 147
    aget v6, v6, p4

    .line 148
    .line 149
    invoke-direct {v4, v3, v5, v6}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;-><init>([BLorg/spongycastle/crypto/Digest;I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getPublicKey()[B

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->update([B)V

    .line 157
    .line 158
    .line 159
    add-int/lit8 v0, v0, 0x1

    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_2
    invoke-virtual {v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->wasFinished()Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-eqz p0, :cond_3

    .line 167
    .line 168
    return-object v1

    .line 169
    :cond_3
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 170
    .line 171
    const-string p1, "Baum noch nicht fertig konstruiert!!!"

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    const/4 p0, 0x0

    .line 177
    return-object p0
.end method

.method private generateNextAuthpathAndRoot(Ljava/util/Vector;[BI)Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    .locals 7

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 8
    .line 9
    aget v1, v1, p3

    .line 10
    .line 11
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 12
    .line 13
    aget v2, v2, p3

    .line 14
    .line 15
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;-><init>(IILorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->initialize(Ljava/util/Vector;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x3

    .line 24
    const/4 v1, 0x0

    .line 25
    move v2, v1

    .line 26
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 27
    .line 28
    aget v3, v3, p3

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    shl-int/2addr v4, v3

    .line 32
    if-ge v1, v4, :cond_1

    .line 33
    .line 34
    if-ne v1, p1, :cond_0

    .line 35
    .line 36
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 37
    .line 38
    aget v4, v4, p3

    .line 39
    .line 40
    sub-int/2addr v3, v4

    .line 41
    if-ge v2, v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0, p2, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->initializeTreehashSeed([BI)V

    .line 44
    .line 45
    .line 46
    mul-int/lit8 p1, p1, 0x2

    .line 47
    .line 48
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    :cond_0
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 51
    .line 52
    invoke-virtual {v3, p2}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    new-instance v4, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;

    .line 57
    .line 58
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->digestProvider:Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;

    .line 59
    .line 60
    invoke-interface {v5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSDigestProvider;->get()Lorg/spongycastle/crypto/Digest;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 65
    .line 66
    aget v6, v6, p3

    .line 67
    .line 68
    invoke-direct {v4, v3, v5, v6}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;-><init>([BLorg/spongycastle/crypto/Digest;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSignature;->getPublicKey()[B

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v0, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->update([B)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;->wasFinished()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    return-object v0

    .line 88
    :cond_2
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 89
    .line 90
    const-string p1, "N\ufffdchster Baum noch nicht fertig konstruiert!!!"

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    return-object p0
.end method

.method private initializeDefault()V
    .locals 7

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    filled-new-array {v0, v0, v0, v0}, [I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x3

    .line 8
    filled-new-array {v1, v1, v1, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x2

    .line 13
    filled-new-array {v2, v2, v2, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 18
    .line 19
    new-instance v4, Ljava/security/SecureRandom;

    .line 20
    .line 21
    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v5, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 25
    .line 26
    const/4 v6, 0x4

    .line 27
    invoke-direct {v5, v6, v0, v1, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;-><init>(I[I[I[I)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v3, v4, v5}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->genKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

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
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initialize(ILjava/security/SecureRandom;)V
    .locals 5

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/16 v2, 0xa

    if-gt p1, v2, :cond_0

    .line 153
    filled-new-array {v2}, [I

    move-result-object p1

    .line 154
    filled-new-array {v0}, [I

    move-result-object v0

    .line 155
    filled-new-array {v1}, [I

    move-result-object v1

    .line 156
    new-instance v2, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    const/4 v4, 0x1

    invoke-direct {v3, v4, p1, v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;-><init>(I[I[I[I)V

    invoke-direct {v2, p2, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    goto :goto_0

    :cond_0
    const/16 v3, 0x14

    const/4 v4, 0x4

    if-gt p1, v3, :cond_1

    .line 157
    filled-new-array {v2, v2}, [I

    move-result-object p1

    const/4 v0, 0x5

    .line 158
    filled-new-array {v0, v4}, [I

    move-result-object v0

    .line 159
    filled-new-array {v1, v1}, [I

    move-result-object v2

    .line 160
    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    new-instance v4, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    invoke-direct {v4, v1, p1, v0, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;-><init>(I[I[I[I)V

    invoke-direct {v3, p2, v4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    move-object v2, v3

    goto :goto_0

    .line 161
    :cond_1
    filled-new-array {v2, v2, v2, v2}, [I

    move-result-object p1

    const/16 v2, 0x9

    .line 162
    filled-new-array {v2, v2, v2, v0}, [I

    move-result-object v0

    .line 163
    filled-new-array {v1, v1, v1, v1}, [I

    move-result-object v1

    .line 164
    new-instance v2, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    new-instance v3, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    invoke-direct {v3, v4, p1, v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;-><init>(I[I[I[I)V

    invoke-direct {v2, p2, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V

    .line 165
    :goto_0
    invoke-virtual {p0, v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    return-void
.end method

.method public initialize(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .locals 5

    .line 1
    check-cast p1, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 2
    .line 3
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssParams:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getNumOfLayers()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssParams:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 16
    .line 17
    invoke-virtual {v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getHeightOfTrees()[I

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssParams:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 26
    .line 27
    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getWinternitzParameter()[I

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssParams:Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;

    .line 36
    .line 37
    invoke-virtual {v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyGenerationParameters;->getParameters()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getK()[I

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-direct {v0, p1, v1, v2, v3}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;-><init>(I[I[I[I)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 49
    .line 50
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getNumOfLayers()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 55
    .line 56
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 57
    .line 58
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getHeightOfTrees()[I

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->heightOfTrees:[I

    .line 63
    .line 64
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 65
    .line 66
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getWinternitzParameter()[I

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->otsIndex:[I

    .line 71
    .line 72
    iget-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 73
    .line 74
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->getK()[I

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->K:[I

    .line 79
    .line 80
    iget p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 81
    .line 82
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 83
    .line 84
    const/4 v1, 0x2

    .line 85
    new-array v2, v1, [I

    .line 86
    .line 87
    const/4 v3, 0x1

    .line 88
    aput v0, v2, v3

    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    aput p1, v2, v0

    .line 92
    .line 93
    sget-object p1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 94
    .line 95
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, [[B

    .line 100
    .line 101
    iput-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentSeeds:[[B

    .line 102
    .line 103
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 104
    .line 105
    sub-int/2addr v2, v3

    .line 106
    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->mdLength:I

    .line 107
    .line 108
    new-array v1, v1, [I

    .line 109
    .line 110
    aput v4, v1, v3

    .line 111
    .line 112
    aput v2, v1, v0

    .line 113
    .line 114
    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, [[B

    .line 119
    .line 120
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->nextNextSeeds:[[B

    .line 121
    .line 122
    new-instance p1, Ljava/security/SecureRandom;

    .line 123
    .line 124
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 125
    .line 126
    .line 127
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->numLayer:I

    .line 128
    .line 129
    if-ge v0, v1, :cond_0

    .line 130
    .line 131
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentSeeds:[[B

    .line 132
    .line 133
    aget-object v1, v1, v0

    .line 134
    .line 135
    invoke-virtual {p1, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->gmssRandom:Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;

    .line 139
    .line 140
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->currentSeeds:[[B

    .line 141
    .line 142
    aget-object v2, v2, v0

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/crypto/gmss/util/GMSSRandom;->nextSeed([B)[B

    .line 145
    .line 146
    .line 147
    add-int/lit8 v0, v0, 0x1

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_0
    iput-boolean v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSKeyPairGenerator;->initialized:Z

    .line 151
    .line 152
    return-void
.end method
