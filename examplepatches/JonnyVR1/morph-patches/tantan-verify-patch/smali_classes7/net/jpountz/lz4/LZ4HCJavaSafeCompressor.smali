.class final Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;
.super Lnet/jpountz/lz4/LZ4Compressor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final INSTANCE:Lnet/jpountz/lz4/LZ4Compressor;


# instance fields
.field final compressionLevel:I

.field private final maxAttempts:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    .line 2
    .line 3
    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->INSTANCE:Lnet/jpountz/lz4/LZ4Compressor;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x9

    .line 14
    invoke-direct {p0, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4Compressor;-><init>()V

    .line 2
    .line 3
    .line 4
    add-int/lit8 v0, p1, -0x1

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    shl-int v0, v1, v0

    .line 8
    .line 9
    iput v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->maxAttempts:I

    .line 10
    .line 11
    iput p1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->compressionLevel:I

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$000(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;)I
    .locals 0

    .line 1
    iget p0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->maxAttempts:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public compress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 20

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    move/from16 v2, p5

    .line 16
    .line 17
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int/2addr v0, v3

    .line 26
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->array()[B

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int v5, v2, v3

    .line 35
    .line 36
    move/from16 v3, p3

    .line 37
    .line 38
    move/from16 v6, p6

    .line 39
    .line 40
    move v2, v0

    .line 41
    move-object/from16 v0, p0

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->compress([BII[BII)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    return v0

    .line 48
    :cond_0
    move/from16 v3, p3

    .line 49
    .line 50
    move/from16 v2, p5

    .line 51
    .line 52
    move/from16 v6, p6

    .line 53
    .line 54
    invoke-static/range {p1 .. p1}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-static/range {p4 .. p4}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v4, v0, v3}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2, v6}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 66
    .line 67
    .line 68
    add-int v11, v0, v3

    .line 69
    .line 70
    add-int v10, v2, v6

    .line 71
    .line 72
    add-int/lit8 v12, v11, -0xc

    .line 73
    .line 74
    add-int/lit8 v7, v11, -0x5

    .line 75
    .line 76
    add-int/lit8 v3, v0, 0x1

    .line 77
    .line 78
    move v5, v3

    .line 79
    new-instance v3, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;

    .line 80
    .line 81
    move-object/from16 v6, p0

    .line 82
    .line 83
    invoke-direct {v3, v6, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;-><init>(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;I)V

    .line 84
    .line 85
    .line 86
    new-instance v13, Lnet/jpountz/lz4/LZ4Utils$Match;

    .line 87
    .line 88
    invoke-direct {v13}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 89
    .line 90
    .line 91
    new-instance v14, Lnet/jpountz/lz4/LZ4Utils$Match;

    .line 92
    .line 93
    invoke-direct {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 94
    .line 95
    .line 96
    new-instance v9, Lnet/jpountz/lz4/LZ4Utils$Match;

    .line 97
    .line 98
    invoke-direct {v9}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v15, Lnet/jpountz/lz4/LZ4Utils$Match;

    .line 102
    .line 103
    invoke-direct {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 104
    .line 105
    .line 106
    move v6, v2

    .line 107
    :goto_0
    if-ge v5, v12, :cond_14

    .line 108
    .line 109
    invoke-virtual {v3, v4, v5, v7, v14}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindBestMatch(Ljava/nio/ByteBuffer;IILnet/jpountz/lz4/LZ4Utils$Match;)Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-nez v8, :cond_1

    .line 114
    .line 115
    add-int/lit8 v5, v5, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    invoke-static {v14, v13}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 119
    .line 120
    .line 121
    move/from16 v16, v6

    .line 122
    .line 123
    :goto_1
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-ge v5, v12, :cond_13

    .line 128
    .line 129
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    add-int/lit8 v5, v5, -0x2

    .line 134
    .line 135
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 136
    .line 137
    add-int/lit8 v6, v6, 0x1

    .line 138
    .line 139
    iget v8, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 140
    .line 141
    invoke-virtual/range {v3 .. v9}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindWiderMatch(Ljava/nio/ByteBuffer;IIIILnet/jpountz/lz4/LZ4Utils$Match;)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    move-object v6, v4

    .line 146
    move-object v4, v3

    .line 147
    move-object v3, v6

    .line 148
    move-object v6, v9

    .line 149
    if-nez v5, :cond_2

    .line 150
    .line 151
    move-object v8, v1

    .line 152
    move-object/from16 v19, v4

    .line 153
    .line 154
    move-object v1, v15

    .line 155
    move-object v15, v6

    .line 156
    :goto_2
    move/from16 v18, v7

    .line 157
    .line 158
    goto/16 :goto_a

    .line 159
    .line 160
    :cond_2
    iget v5, v13, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 161
    .line 162
    iget v8, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 163
    .line 164
    if-ge v5, v8, :cond_3

    .line 165
    .line 166
    iget v5, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 167
    .line 168
    iget v9, v13, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 169
    .line 170
    add-int/2addr v8, v9

    .line 171
    if-ge v5, v8, :cond_3

    .line 172
    .line 173
    invoke-static {v13, v14}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 174
    .line 175
    .line 176
    :cond_3
    iget v5, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 177
    .line 178
    iget v8, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 179
    .line 180
    sub-int/2addr v5, v8

    .line 181
    const/4 v8, 0x3

    .line 182
    if-ge v5, v8, :cond_4

    .line 183
    .line 184
    invoke-static {v6, v14}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 185
    .line 186
    .line 187
    move-object v9, v4

    .line 188
    move-object v4, v3

    .line 189
    move-object v3, v9

    .line 190
    move-object v9, v6

    .line 191
    goto :goto_1

    .line 192
    :cond_4
    :goto_3
    iget v5, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 193
    .line 194
    iget v9, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 195
    .line 196
    sub-int/2addr v5, v9

    .line 197
    move/from16 p0, v0

    .line 198
    .line 199
    const/16 p1, 0x4

    .line 200
    .line 201
    const/16 v0, 0x12

    .line 202
    .line 203
    if-ge v5, v0, :cond_7

    .line 204
    .line 205
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 206
    .line 207
    if-le v5, v0, :cond_5

    .line 208
    .line 209
    move v5, v0

    .line 210
    :cond_5
    add-int/2addr v9, v5

    .line 211
    invoke-virtual {v6}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 212
    .line 213
    .line 214
    move-result v17

    .line 215
    move/from16 p2, v8

    .line 216
    .line 217
    add-int/lit8 v8, v17, -0x4

    .line 218
    .line 219
    if-le v9, v8, :cond_6

    .line 220
    .line 221
    iget v5, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 222
    .line 223
    iget v8, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 224
    .line 225
    sub-int/2addr v5, v8

    .line 226
    iget v8, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 227
    .line 228
    add-int/2addr v5, v8

    .line 229
    add-int/lit8 v5, v5, -0x4

    .line 230
    .line 231
    :cond_6
    iget v8, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 232
    .line 233
    iget v9, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 234
    .line 235
    sub-int/2addr v8, v9

    .line 236
    sub-int/2addr v5, v8

    .line 237
    if-lez v5, :cond_8

    .line 238
    .line 239
    invoke-virtual {v6, v5}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    .line 240
    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_7
    move/from16 p2, v8

    .line 244
    .line 245
    :cond_8
    :goto_4
    iget v5, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 246
    .line 247
    iget v8, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 248
    .line 249
    add-int/2addr v5, v8

    .line 250
    if-ge v5, v12, :cond_11

    .line 251
    .line 252
    invoke-virtual {v6}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    add-int/lit8 v5, v5, -0x3

    .line 257
    .line 258
    iget v8, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 259
    .line 260
    move v9, v8

    .line 261
    iget v8, v6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 262
    .line 263
    move-object/from16 v17, v4

    .line 264
    .line 265
    move-object v4, v3

    .line 266
    move-object/from16 v3, v17

    .line 267
    .line 268
    move-object/from16 v17, v15

    .line 269
    .line 270
    move-object v15, v6

    .line 271
    move v6, v9

    .line 272
    move-object/from16 v9, v17

    .line 273
    .line 274
    move/from16 v17, p2

    .line 275
    .line 276
    invoke-virtual/range {v3 .. v9}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindWiderMatch(Ljava/nio/ByteBuffer;IIIILnet/jpountz/lz4/LZ4Utils$Match;)Z

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    move-object/from16 v19, v3

    .line 281
    .line 282
    move-object v3, v4

    .line 283
    move/from16 v18, v7

    .line 284
    .line 285
    move-object v4, v9

    .line 286
    if-nez v5, :cond_9

    .line 287
    .line 288
    move-object v8, v1

    .line 289
    move-object v1, v4

    .line 290
    :goto_5
    move/from16 v9, v16

    .line 291
    .line 292
    move/from16 v4, p0

    .line 293
    .line 294
    goto/16 :goto_8

    .line 295
    .line 296
    :cond_9
    iget v5, v4, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 297
    .line 298
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 299
    .line 300
    .line 301
    move-result v6

    .line 302
    add-int/lit8 v6, v6, 0x3

    .line 303
    .line 304
    if-ge v5, v6, :cond_c

    .line 305
    .line 306
    iget v0, v4, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 307
    .line 308
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 309
    .line 310
    .line 311
    move-result v5

    .line 312
    if-lt v0, v5, :cond_b

    .line 313
    .line 314
    iget v0, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 315
    .line 316
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    if-ge v0, v5, :cond_a

    .line 321
    .line 322
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 327
    .line 328
    sub-int/2addr v0, v5

    .line 329
    invoke-virtual {v15, v0}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    .line 330
    .line 331
    .line 332
    iget v0, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 333
    .line 334
    move/from16 v5, p1

    .line 335
    .line 336
    if-ge v0, v5, :cond_a

    .line 337
    .line 338
    invoke-static {v4, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 339
    .line 340
    .line 341
    :cond_a
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 342
    .line 343
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 344
    .line 345
    iget v7, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 346
    .line 347
    move-object v8, v1

    .line 348
    move-object v1, v4

    .line 349
    move/from16 v9, v16

    .line 350
    .line 351
    move/from16 v4, p0

    .line 352
    .line 353
    invoke-static/range {v3 .. v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I

    .line 354
    .line 355
    .line 356
    move-result v16

    .line 357
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    invoke-static {v1, v14}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 362
    .line 363
    .line 364
    invoke-static {v15, v13}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 365
    .line 366
    .line 367
    move-object v4, v3

    .line 368
    move-object v9, v15

    .line 369
    move/from16 v7, v18

    .line 370
    .line 371
    move-object/from16 v3, v19

    .line 372
    .line 373
    move-object v15, v1

    .line 374
    move-object v1, v8

    .line 375
    goto/16 :goto_1

    .line 376
    .line 377
    :cond_b
    move-object v8, v1

    .line 378
    move-object v1, v4

    .line 379
    move/from16 v9, v16

    .line 380
    .line 381
    move/from16 v4, p0

    .line 382
    .line 383
    invoke-static {v1, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 384
    .line 385
    .line 386
    move v0, v4

    .line 387
    :goto_6
    move-object v6, v15

    .line 388
    move/from16 v7, v18

    .line 389
    .line 390
    move-object/from16 v4, v19

    .line 391
    .line 392
    move-object v15, v1

    .line 393
    move-object v1, v8

    .line 394
    move/from16 v8, v17

    .line 395
    .line 396
    goto/16 :goto_3

    .line 397
    .line 398
    :cond_c
    move-object v8, v1

    .line 399
    move-object v1, v4

    .line 400
    move/from16 v9, v16

    .line 401
    .line 402
    move/from16 v4, p0

    .line 403
    .line 404
    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 405
    .line 406
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 407
    .line 408
    .line 409
    move-result v6

    .line 410
    if-ge v5, v6, :cond_10

    .line 411
    .line 412
    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 413
    .line 414
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 415
    .line 416
    sub-int v7, v5, v6

    .line 417
    .line 418
    const/16 v0, 0xf

    .line 419
    .line 420
    if-ge v7, v0, :cond_f

    .line 421
    .line 422
    iget v0, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 423
    .line 424
    const/16 v5, 0x12

    .line 425
    .line 426
    if-le v0, v5, :cond_d

    .line 427
    .line 428
    iput v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 429
    .line 430
    :cond_d
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 431
    .line 432
    .line 433
    move-result v0

    .line 434
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 435
    .line 436
    .line 437
    move-result v5

    .line 438
    const/4 v6, 0x4

    .line 439
    sub-int/2addr v5, v6

    .line 440
    if-le v0, v5, :cond_e

    .line 441
    .line 442
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 447
    .line 448
    sub-int/2addr v0, v5

    .line 449
    sub-int/2addr v0, v6

    .line 450
    iput v0, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 451
    .line 452
    :cond_e
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 457
    .line 458
    sub-int/2addr v0, v5

    .line 459
    invoke-virtual {v15, v0}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    .line 460
    .line 461
    .line 462
    goto :goto_7

    .line 463
    :cond_f
    sub-int/2addr v5, v6

    .line 464
    iput v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 465
    .line 466
    :cond_10
    :goto_7
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 467
    .line 468
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 469
    .line 470
    iget v7, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 471
    .line 472
    invoke-static/range {v3 .. v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I

    .line 473
    .line 474
    .line 475
    move-result v16

    .line 476
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    invoke-static {v15, v14}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 481
    .line 482
    .line 483
    invoke-static {v1, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 484
    .line 485
    .line 486
    goto :goto_6

    .line 487
    :cond_11
    move-object v8, v1

    .line 488
    move-object/from16 v19, v4

    .line 489
    .line 490
    move/from16 v18, v7

    .line 491
    .line 492
    move-object v1, v15

    .line 493
    move-object v15, v6

    .line 494
    goto/16 :goto_5

    .line 495
    .line 496
    :goto_8
    iget v0, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 497
    .line 498
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 499
    .line 500
    .line 501
    move-result v5

    .line 502
    if-ge v0, v5, :cond_12

    .line 503
    .line 504
    iget v0, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 505
    .line 506
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 507
    .line 508
    sub-int/2addr v0, v5

    .line 509
    iput v0, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 510
    .line 511
    :cond_12
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 512
    .line 513
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 514
    .line 515
    iget v7, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 516
    .line 517
    invoke-static/range {v3 .. v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I

    .line 518
    .line 519
    .line 520
    move-result v9

    .line 521
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 522
    .line 523
    .line 524
    move-result v4

    .line 525
    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 526
    .line 527
    iget v6, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 528
    .line 529
    iget v7, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 530
    .line 531
    invoke-static/range {v3 .. v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I

    .line 532
    .line 533
    .line 534
    move-result v6

    .line 535
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 536
    .line 537
    .line 538
    move-result v5

    .line 539
    :goto_9
    move-object v4, v3

    .line 540
    move v0, v5

    .line 541
    move-object v9, v15

    .line 542
    move/from16 v7, v18

    .line 543
    .line 544
    move-object/from16 v3, v19

    .line 545
    .line 546
    move-object v15, v1

    .line 547
    move-object v1, v8

    .line 548
    goto/16 :goto_0

    .line 549
    .line 550
    :cond_13
    move-object v8, v1

    .line 551
    move-object/from16 v19, v3

    .line 552
    .line 553
    move-object v3, v4

    .line 554
    move-object v1, v15

    .line 555
    move-object v15, v9

    .line 556
    goto/16 :goto_2

    .line 557
    .line 558
    :goto_a
    iget v5, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 559
    .line 560
    iget v6, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 561
    .line 562
    iget v7, v14, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 563
    .line 564
    move v4, v0

    .line 565
    move/from16 v9, v16

    .line 566
    .line 567
    invoke-static/range {v3 .. v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I

    .line 568
    .line 569
    .line 570
    move-result v6

    .line 571
    invoke-virtual {v14}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    .line 572
    .line 573
    .line 574
    move-result v5

    .line 575
    goto :goto_9

    .line 576
    :cond_14
    move-object v8, v1

    .line 577
    move-object v3, v4

    .line 578
    sub-int v5, v11, v0

    .line 579
    .line 580
    move v4, v0

    .line 581
    move v7, v6

    .line 582
    move-object v6, v8

    .line 583
    move v8, v10

    .line 584
    invoke-static/range {v3 .. v8}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->lastLiterals(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    sub-int/2addr v0, v2

    .line 589
    return v0
.end method

.method public compress([BII[BII)I
    .locals 19

    move/from16 v0, p2

    .line 590
    invoke-static/range {p1 .. p3}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    .line 591
    invoke-static/range {p4 .. p6}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    add-int v1, v0, p3

    add-int v9, p5, p6

    add-int/lit8 v10, v1, -0xc

    add-int/lit8 v6, v1, -0x5

    add-int/lit8 v2, v0, 0x1

    move v3, v2

    .line 592
    new-instance v2, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;

    move-object/from16 v4, p0

    invoke-direct {v2, v4, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;-><init>(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;I)V

    .line 593
    new-instance v11, Lnet/jpountz/lz4/LZ4Utils$Match;

    invoke-direct {v11}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 594
    new-instance v12, Lnet/jpountz/lz4/LZ4Utils$Match;

    invoke-direct {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 595
    new-instance v8, Lnet/jpountz/lz4/LZ4Utils$Match;

    invoke-direct {v8}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    .line 596
    new-instance v13, Lnet/jpountz/lz4/LZ4Utils$Match;

    invoke-direct {v13}, Lnet/jpountz/lz4/LZ4Utils$Match;-><init>()V

    move v4, v3

    move v3, v0

    move v0, v4

    move/from16 v4, p5

    :goto_0
    if-ge v0, v10, :cond_13

    move-object/from16 v5, p1

    .line 597
    invoke-virtual {v2, v5, v0, v6, v12}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindBestMatch([BIILnet/jpountz/lz4/LZ4Utils$Match;)Z

    move-result v7

    if-nez v7, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 598
    :cond_0
    invoke-static {v12, v11}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    move v0, v3

    move v14, v4

    .line 599
    :goto_1
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v3

    if-ge v3, v10, :cond_12

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v3

    add-int/lit8 v4, v3, -0x2

    iget v3, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    add-int/lit8 v3, v3, 0x1

    iget v7, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object/from16 v18, v5

    move v5, v3

    move-object/from16 v3, v18

    invoke-virtual/range {v2 .. v8}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindWiderMatch([BIIIILnet/jpountz/lz4/LZ4Utils$Match;)Z

    move-result v4

    move-object v15, v8

    if-nez v4, :cond_1

    :goto_2
    move-object/from16 v17, v2

    move/from16 v16, v6

    goto/16 :goto_a

    .line 600
    :cond_1
    iget v3, v11, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    if-ge v3, v4, :cond_2

    .line 601
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v11, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    add-int/2addr v4, v5

    if-ge v3, v4, :cond_2

    .line 602
    invoke-static {v11, v12}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 603
    :cond_2
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v3, v4

    const/4 v4, 0x3

    if-ge v3, v4, :cond_3

    .line 604
    invoke-static {v15, v12}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    move-object/from16 v5, p1

    move-object v8, v15

    goto :goto_1

    .line 605
    :cond_3
    :goto_3
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v3, v5

    const/4 v7, 0x4

    const/16 v8, 0x12

    if-ge v3, v8, :cond_6

    .line 606
    iget v3, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-le v3, v8, :cond_4

    move v3, v8

    :cond_4
    add-int/2addr v5, v3

    .line 607
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v16

    move/from16 p0, v4

    add-int/lit8 v4, v16, -0x4

    if-le v5, v4, :cond_5

    .line 608
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v3, v4

    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    add-int/2addr v3, v4

    sub-int/2addr v3, v7

    .line 609
    :cond_5
    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v4, v5

    sub-int/2addr v3, v4

    if-lez v3, :cond_7

    .line 610
    invoke-virtual {v15, v3}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    goto :goto_4

    :cond_6
    move/from16 p0, v4

    .line 611
    :cond_7
    :goto_4
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    add-int/2addr v3, v4

    if-ge v3, v10, :cond_10

    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v3

    add-int/lit8 v4, v3, -0x3

    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    move v3, v7

    iget v7, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object v8, v13

    move v13, v3

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v8}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insertAndFindWiderMatch([BIIIILnet/jpountz/lz4/LZ4Utils$Match;)Z

    move-result v4

    move-object/from16 v17, v2

    move/from16 v16, v6

    move-object v2, v8

    if-nez v4, :cond_8

    move v3, v0

    move-object v0, v2

    :goto_5
    move v8, v14

    goto/16 :goto_8

    .line 612
    :cond_8
    iget v3, v2, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    add-int/lit8 v4, v4, 0x3

    if-ge v3, v4, :cond_b

    .line 613
    iget v3, v2, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    if-lt v3, v4, :cond_a

    .line 614
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    if-ge v3, v4, :cond_9

    .line 615
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v3

    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v3, v4

    .line 616
    invoke-virtual {v15, v3}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    .line 617
    iget v3, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-ge v3, v13, :cond_9

    .line 618
    invoke-static {v2, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 619
    :cond_9
    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    iget v6, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object/from16 v7, p4

    move v3, v0

    move-object v0, v2

    move v8, v14

    move-object/from16 v2, p1

    invoke-static/range {v2 .. v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->encodeSequence([BIIII[BII)I

    move-result v14

    .line 620
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    .line 621
    invoke-static {v0, v12}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 622
    invoke-static {v15, v11}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    move-object/from16 v5, p1

    move-object v13, v0

    move v0, v2

    move-object v8, v15

    move/from16 v6, v16

    move-object/from16 v2, v17

    goto/16 :goto_1

    :cond_a
    move v3, v0

    move-object v0, v2

    move v8, v14

    .line 623
    invoke-static {v0, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    move/from16 v4, p0

    move-object v13, v0

    move v0, v3

    :goto_6
    move/from16 v6, v16

    move-object/from16 v2, v17

    goto/16 :goto_3

    :cond_b
    move v3, v0

    move-object v0, v2

    move v8, v14

    .line 624
    iget v2, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    if-ge v2, v4, :cond_f

    .line 625
    iget v2, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int v5, v2, v4

    const/16 v6, 0xf

    if-ge v5, v6, :cond_e

    .line 626
    iget v2, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    const/16 v4, 0x12

    if-le v2, v4, :cond_c

    .line 627
    iput v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 628
    :cond_c
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    sub-int/2addr v4, v13

    if-le v2, v4, :cond_d

    .line 629
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v2, v4

    sub-int/2addr v2, v13

    iput v2, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 630
    :cond_d
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v2, v4

    .line 631
    invoke-virtual {v15, v2}, Lnet/jpountz/lz4/LZ4Utils$Match;->fix(I)V

    goto :goto_7

    :cond_e
    sub-int/2addr v2, v4

    .line 632
    iput v2, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 633
    :cond_f
    :goto_7
    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    iget v6, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object/from16 v2, p1

    move-object/from16 v7, p4

    invoke-static/range {v2 .. v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->encodeSequence([BIIII[BII)I

    move-result v14

    .line 634
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    .line 635
    invoke-static {v15, v12}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    .line 636
    invoke-static {v0, v15}, Lnet/jpountz/lz4/LZ4Utils;->copyTo(Lnet/jpountz/lz4/LZ4Utils$Match;Lnet/jpountz/lz4/LZ4Utils$Match;)V

    move/from16 v4, p0

    move-object v13, v0

    move v0, v2

    goto :goto_6

    :cond_10
    move v3, v0

    move-object/from16 v17, v2

    move/from16 v16, v6

    move-object v0, v13

    goto/16 :goto_5

    .line 637
    :goto_8
    iget v2, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v4

    if-ge v2, v4, :cond_11

    .line 638
    iget v2, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    sub-int/2addr v2, v4

    iput v2, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 639
    :cond_11
    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    iget v6, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object/from16 v2, p1

    move-object/from16 v7, p4

    invoke-static/range {v2 .. v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->encodeSequence([BIIII[BII)I

    move-result v8

    .line 640
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v3

    .line 641
    iget v4, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    iget v6, v15, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    invoke-static/range {v2 .. v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->encodeSequence([BIIII[BII)I

    move-result v4

    .line 642
    invoke-virtual {v15}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v2

    move-object v13, v0

    move v0, v2

    :goto_9
    move v3, v0

    move-object v8, v15

    move/from16 v6, v16

    move-object/from16 v2, v17

    goto/16 :goto_0

    :cond_12
    move-object v15, v8

    goto/16 :goto_2

    .line 643
    :goto_a
    iget v4, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    iget v5, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    iget v6, v12, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    move-object/from16 v2, p1

    move-object/from16 v7, p4

    move v3, v0

    move v8, v14

    invoke-static/range {v2 .. v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->encodeSequence([BIIII[BII)I

    move-result v4

    .line 644
    invoke-virtual {v12}, Lnet/jpountz/lz4/LZ4Utils$Match;->end()I

    move-result v0

    goto :goto_9

    :cond_13
    sub-int/2addr v1, v3

    move-object/from16 v2, p1

    move-object/from16 v5, p4

    move v6, v4

    move v7, v9

    move v4, v1

    .line 645
    invoke-static/range {v2 .. v7}, Lnet/jpountz/lz4/LZ4SafeUtils;->lastLiterals([BII[BII)I

    move-result v0

    sub-int v0, v0, p5

    return v0
.end method
