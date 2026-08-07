.class public Lorg/spongycastle/crypto/macs/Poly1305;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private final cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private final currentBlock:[B

.field private currentBlockOffset:I

.field private h0:I

.field private h1:I

.field private h2:I

.field private h3:I

.field private h4:I

.field private k0:I

.field private k1:I

.field private k2:I

.field private k3:I

.field private r0:I

.field private r1:I

.field private r2:I

.field private r3:I

.field private r4:I

.field private s1:I

.field private s2:I

.field private s3:I

.field private s4:I

.field private final singleByte:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 35
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    const/16 v0, 0x10

    .line 36
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    .line 8
    .line 9
    const/16 v0, 0x10

    .line 10
    .line 11
    new-array v1, v0, [B

    .line 12
    .line 13
    iput-object v1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 17
    .line 18
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ne v1, v0, :cond_0

    .line 23
    .line 24
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "Poly1305 requires a 128 bit block cipher."

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0
.end method

.method private static final mul32x32_64(II)J
    .locals 2

    int-to-long v0, p0

    int-to-long p0, p1

    mul-long/2addr v0, p0

    return-wide v0
.end method

.method private processBlock()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/16 v3, 0x10

    .line 7
    .line 8
    if-ge v1, v3, :cond_0

    .line 9
    .line 10
    iget-object v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    aput-byte v5, v4, v1

    .line 14
    .line 15
    add-int/2addr v1, v5

    .line 16
    :goto_0
    if-ge v1, v3, :cond_0

    .line 17
    .line 18
    iget-object v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 19
    .line 20
    aput-byte v2, v4, v1

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 26
    .line 27
    invoke-static {v1, v2}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-long v1, v1

    .line 32
    const-wide v4, 0xffffffffL

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long v6, v1, v4

    .line 38
    .line 39
    iget-object v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 40
    .line 41
    const/4 v9, 0x4

    .line 42
    invoke-static {v8, v9}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    int-to-long v8, v8

    .line 47
    and-long/2addr v8, v4

    .line 48
    iget-object v10, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 49
    .line 50
    const/16 v11, 0x8

    .line 51
    .line 52
    invoke-static {v10, v11}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 53
    .line 54
    .line 55
    move-result v10

    .line 56
    int-to-long v12, v10

    .line 57
    and-long/2addr v12, v4

    .line 58
    iget-object v10, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 59
    .line 60
    const/16 v14, 0xc

    .line 61
    .line 62
    invoke-static {v10, v14}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    int-to-long v14, v10

    .line 67
    and-long/2addr v4, v14

    .line 68
    iget v10, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 69
    .line 70
    int-to-long v14, v10

    .line 71
    const-wide/32 v16, 0x3ffffff

    .line 72
    .line 73
    .line 74
    and-long v1, v1, v16

    .line 75
    .line 76
    add-long/2addr v14, v1

    .line 77
    long-to-int v1, v14

    .line 78
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 79
    .line 80
    iget v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 81
    .line 82
    int-to-long v14, v2

    .line 83
    const/16 v2, 0x20

    .line 84
    .line 85
    shl-long v18, v8, v2

    .line 86
    .line 87
    or-long v6, v18, v6

    .line 88
    .line 89
    const/16 v10, 0x1a

    .line 90
    .line 91
    ushr-long/2addr v6, v10

    .line 92
    and-long v6, v6, v16

    .line 93
    .line 94
    add-long/2addr v14, v6

    .line 95
    long-to-int v6, v14

    .line 96
    iput v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 97
    .line 98
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 99
    .line 100
    int-to-long v6, v6

    .line 101
    shl-long v14, v12, v2

    .line 102
    .line 103
    or-long/2addr v8, v14

    .line 104
    const/16 v14, 0x14

    .line 105
    .line 106
    ushr-long/2addr v8, v14

    .line 107
    and-long v8, v8, v16

    .line 108
    .line 109
    add-long/2addr v6, v8

    .line 110
    long-to-int v6, v6

    .line 111
    iput v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 112
    .line 113
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 114
    .line 115
    int-to-long v6, v6

    .line 116
    shl-long v8, v4, v2

    .line 117
    .line 118
    or-long/2addr v8, v12

    .line 119
    const/16 v2, 0xe

    .line 120
    .line 121
    ushr-long/2addr v8, v2

    .line 122
    and-long v8, v8, v16

    .line 123
    .line 124
    add-long/2addr v6, v8

    .line 125
    long-to-int v2, v6

    .line 126
    iput v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 127
    .line 128
    iget v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 129
    .line 130
    int-to-long v6, v2

    .line 131
    ushr-long/2addr v4, v11

    .line 132
    add-long/2addr v6, v4

    .line 133
    long-to-int v2, v6

    .line 134
    iput v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 135
    .line 136
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 137
    .line 138
    if-ne v4, v3, :cond_1

    .line 139
    .line 140
    const/high16 v3, 0x1000000

    .line 141
    .line 142
    add-int/2addr v2, v3

    .line 143
    iput v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 144
    .line 145
    :cond_1
    iget v2, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 146
    .line 147
    invoke-static {v1, v2}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 148
    .line 149
    .line 150
    move-result-wide v1

    .line 151
    iget v3, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 152
    .line 153
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 154
    .line 155
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 156
    .line 157
    .line 158
    move-result-wide v3

    .line 159
    add-long/2addr v1, v3

    .line 160
    iget v3, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 161
    .line 162
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    .line 163
    .line 164
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 165
    .line 166
    .line 167
    move-result-wide v3

    .line 168
    add-long/2addr v1, v3

    .line 169
    iget v3, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 170
    .line 171
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    .line 172
    .line 173
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 174
    .line 175
    .line 176
    move-result-wide v3

    .line 177
    add-long/2addr v1, v3

    .line 178
    iget v3, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 179
    .line 180
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s1:I

    .line 181
    .line 182
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 183
    .line 184
    .line 185
    move-result-wide v3

    .line 186
    add-long/2addr v1, v3

    .line 187
    iget v3, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 188
    .line 189
    iget v4, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    .line 190
    .line 191
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 192
    .line 193
    .line 194
    move-result-wide v3

    .line 195
    iget v5, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 196
    .line 197
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 198
    .line 199
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 200
    .line 201
    .line 202
    move-result-wide v5

    .line 203
    add-long/2addr v3, v5

    .line 204
    iget v5, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 205
    .line 206
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 207
    .line 208
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 209
    .line 210
    .line 211
    move-result-wide v5

    .line 212
    add-long/2addr v3, v5

    .line 213
    iget v5, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 214
    .line 215
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    .line 216
    .line 217
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 218
    .line 219
    .line 220
    move-result-wide v5

    .line 221
    add-long/2addr v3, v5

    .line 222
    iget v5, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 223
    .line 224
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    .line 225
    .line 226
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 227
    .line 228
    .line 229
    move-result-wide v5

    .line 230
    add-long/2addr v3, v5

    .line 231
    iget v5, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 232
    .line 233
    iget v6, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    .line 234
    .line 235
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 236
    .line 237
    .line 238
    move-result-wide v5

    .line 239
    iget v7, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 240
    .line 241
    iget v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    .line 242
    .line 243
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 244
    .line 245
    .line 246
    move-result-wide v7

    .line 247
    add-long/2addr v5, v7

    .line 248
    iget v7, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 249
    .line 250
    iget v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 251
    .line 252
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 253
    .line 254
    .line 255
    move-result-wide v7

    .line 256
    add-long/2addr v5, v7

    .line 257
    iget v7, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 258
    .line 259
    iget v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 260
    .line 261
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 262
    .line 263
    .line 264
    move-result-wide v7

    .line 265
    add-long/2addr v5, v7

    .line 266
    iget v7, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 267
    .line 268
    iget v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    .line 269
    .line 270
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 271
    .line 272
    .line 273
    move-result-wide v7

    .line 274
    add-long/2addr v5, v7

    .line 275
    iget v7, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 276
    .line 277
    iget v8, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    .line 278
    .line 279
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 280
    .line 281
    .line 282
    move-result-wide v7

    .line 283
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 284
    .line 285
    iget v11, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    .line 286
    .line 287
    invoke-static {v9, v11}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 288
    .line 289
    .line 290
    move-result-wide v11

    .line 291
    add-long/2addr v7, v11

    .line 292
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 293
    .line 294
    iget v11, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    .line 295
    .line 296
    invoke-static {v9, v11}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 297
    .line 298
    .line 299
    move-result-wide v11

    .line 300
    add-long/2addr v7, v11

    .line 301
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 302
    .line 303
    iget v11, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 304
    .line 305
    invoke-static {v9, v11}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 306
    .line 307
    .line 308
    move-result-wide v11

    .line 309
    add-long/2addr v7, v11

    .line 310
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 311
    .line 312
    iget v11, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 313
    .line 314
    invoke-static {v9, v11}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 315
    .line 316
    .line 317
    move-result-wide v11

    .line 318
    add-long/2addr v7, v11

    .line 319
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 320
    .line 321
    iget v11, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r4:I

    .line 322
    .line 323
    invoke-static {v9, v11}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 324
    .line 325
    .line 326
    move-result-wide v11

    .line 327
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 328
    .line 329
    iget v13, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    .line 330
    .line 331
    invoke-static {v9, v13}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 332
    .line 333
    .line 334
    move-result-wide v13

    .line 335
    add-long/2addr v11, v13

    .line 336
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 337
    .line 338
    iget v13, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    .line 339
    .line 340
    invoke-static {v9, v13}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 341
    .line 342
    .line 343
    move-result-wide v13

    .line 344
    add-long/2addr v11, v13

    .line 345
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 346
    .line 347
    iget v13, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    .line 348
    .line 349
    invoke-static {v9, v13}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 350
    .line 351
    .line 352
    move-result-wide v13

    .line 353
    add-long/2addr v11, v13

    .line 354
    iget v9, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 355
    .line 356
    iget v13, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 357
    .line 358
    invoke-static {v9, v13}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    .line 359
    .line 360
    .line 361
    move-result-wide v13

    .line 362
    add-long/2addr v11, v13

    .line 363
    long-to-int v9, v1

    .line 364
    const v13, 0x3ffffff

    .line 365
    .line 366
    .line 367
    and-int/2addr v9, v13

    .line 368
    ushr-long/2addr v1, v10

    .line 369
    add-long/2addr v3, v1

    .line 370
    long-to-int v1, v3

    .line 371
    and-int/2addr v1, v13

    .line 372
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 373
    .line 374
    ushr-long v1, v3, v10

    .line 375
    .line 376
    add-long/2addr v5, v1

    .line 377
    long-to-int v1, v5

    .line 378
    and-int/2addr v1, v13

    .line 379
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 380
    .line 381
    ushr-long v1, v5, v10

    .line 382
    .line 383
    add-long/2addr v7, v1

    .line 384
    long-to-int v1, v7

    .line 385
    and-int/2addr v1, v13

    .line 386
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 387
    .line 388
    ushr-long v1, v7, v10

    .line 389
    .line 390
    add-long/2addr v11, v1

    .line 391
    long-to-int v1, v11

    .line 392
    and-int/2addr v1, v13

    .line 393
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 394
    .line 395
    ushr-long v1, v11, v10

    .line 396
    .line 397
    int-to-long v3, v9

    .line 398
    const-wide/16 v5, 0x5

    .line 399
    .line 400
    mul-long/2addr v1, v5

    .line 401
    add-long/2addr v3, v1

    .line 402
    long-to-int v1, v3

    .line 403
    iput v1, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 404
    .line 405
    return-void
.end method

.method private setKey([B[B)V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    array-length v0, p2

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "Poly1305 requires a 128 bit IV."

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkKey([B)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/16 v2, 0x14

    .line 27
    .line 28
    invoke-static {p1, v2}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/16 v4, 0x18

    .line 33
    .line 34
    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const/16 v5, 0x1c

    .line 39
    .line 40
    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    const v6, 0x3ffffff

    .line 45
    .line 46
    .line 47
    and-int/2addr v6, v0

    .line 48
    iput v6, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    .line 49
    .line 50
    ushr-int/lit8 v0, v0, 0x1a

    .line 51
    .line 52
    shl-int/lit8 v6, v3, 0x6

    .line 53
    .line 54
    or-int/2addr v0, v6

    .line 55
    const v6, 0x3ffff03

    .line 56
    .line 57
    .line 58
    and-int/2addr v0, v6

    .line 59
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    .line 60
    .line 61
    ushr-int/lit8 v2, v3, 0x14

    .line 62
    .line 63
    shl-int/lit8 v3, v4, 0xc

    .line 64
    .line 65
    or-int/2addr v2, v3

    .line 66
    const v3, 0x3ffc0ff

    .line 67
    .line 68
    .line 69
    and-int/2addr v2, v3

    .line 70
    iput v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    .line 71
    .line 72
    ushr-int/lit8 v3, v4, 0xe

    .line 73
    .line 74
    shl-int/lit8 v4, v5, 0x12

    .line 75
    .line 76
    or-int/2addr v3, v4

    .line 77
    const v4, 0x3f03fff

    .line 78
    .line 79
    .line 80
    and-int/2addr v3, v4

    .line 81
    iput v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    .line 82
    .line 83
    const/16 v4, 0x8

    .line 84
    .line 85
    ushr-int/2addr v5, v4

    .line 86
    const v6, 0xfffff

    .line 87
    .line 88
    .line 89
    and-int/2addr v5, v6

    .line 90
    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r4:I

    .line 91
    .line 92
    mul-int/lit8 v0, v0, 0x5

    .line 93
    .line 94
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s1:I

    .line 95
    .line 96
    mul-int/lit8 v2, v2, 0x5

    .line 97
    .line 98
    iput v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    .line 99
    .line 100
    mul-int/lit8 v3, v3, 0x5

    .line 101
    .line 102
    iput v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    .line 103
    .line 104
    mul-int/lit8 v5, v5, 0x5

    .line 105
    .line 106
    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 107
    .line 108
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 109
    .line 110
    const/4 v2, 0x0

    .line 111
    if-nez v0, :cond_2

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    new-array v3, v1, [B

    .line 115
    .line 116
    new-instance v5, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 117
    .line 118
    invoke-direct {v5, p1, v2, v1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 119
    .line 120
    .line 121
    const/4 p1, 0x1

    .line 122
    invoke-interface {v0, p1, v5}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 126
    .line 127
    invoke-interface {p1, p2, v2, v3, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 128
    .line 129
    .line 130
    move-object p1, v3

    .line 131
    :goto_1
    invoke-static {p1, v2}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    iput p2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k0:I

    .line 136
    .line 137
    const/4 p2, 0x4

    .line 138
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    iput p2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k1:I

    .line 143
    .line 144
    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    iput p2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k2:I

    .line 149
    .line 150
    const/16 p2, 0xc

    .line 151
    .line 152
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput p1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k3:I

    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    add-int/lit8 v0, p2, 0x10

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    if-gt v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 7
    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->processBlock()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 14
    .line 15
    ushr-int/lit8 v1, v0, 0x1a

    .line 16
    .line 17
    const v2, 0x3ffffff

    .line 18
    .line 19
    .line 20
    and-int/2addr v0, v2

    .line 21
    iget v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 22
    .line 23
    add-int/2addr v3, v1

    .line 24
    ushr-int/lit8 v1, v3, 0x1a

    .line 25
    .line 26
    and-int/2addr v3, v2

    .line 27
    iget v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 28
    .line 29
    add-int/2addr v4, v1

    .line 30
    ushr-int/lit8 v1, v4, 0x1a

    .line 31
    .line 32
    and-int/2addr v4, v2

    .line 33
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 34
    .line 35
    add-int/2addr v5, v1

    .line 36
    ushr-int/lit8 v1, v5, 0x1a

    .line 37
    .line 38
    and-int/2addr v5, v2

    .line 39
    iget v6, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 40
    .line 41
    add-int/2addr v6, v1

    .line 42
    ushr-int/lit8 v1, v6, 0x1a

    .line 43
    .line 44
    and-int/2addr v6, v2

    .line 45
    mul-int/lit8 v1, v1, 0x5

    .line 46
    .line 47
    add-int/2addr v0, v1

    .line 48
    add-int/lit8 v1, v0, 0x5

    .line 49
    .line 50
    ushr-int/lit8 v7, v1, 0x1a

    .line 51
    .line 52
    and-int/2addr v1, v2

    .line 53
    add-int/2addr v7, v3

    .line 54
    ushr-int/lit8 v8, v7, 0x1a

    .line 55
    .line 56
    and-int/2addr v7, v2

    .line 57
    add-int/2addr v8, v4

    .line 58
    ushr-int/lit8 v9, v8, 0x1a

    .line 59
    .line 60
    and-int/2addr v8, v2

    .line 61
    add-int/2addr v9, v5

    .line 62
    ushr-int/lit8 v10, v9, 0x1a

    .line 63
    .line 64
    and-int/2addr v2, v9

    .line 65
    add-int/2addr v10, v6

    .line 66
    const/high16 v9, 0x4000000

    .line 67
    .line 68
    sub-int/2addr v10, v9

    .line 69
    ushr-int/lit8 v9, v10, 0x1f

    .line 70
    .line 71
    add-int/lit8 v9, v9, -0x1

    .line 72
    .line 73
    not-int v11, v9

    .line 74
    and-int/2addr v0, v11

    .line 75
    and-int/2addr v1, v9

    .line 76
    or-int/2addr v0, v1

    .line 77
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 78
    .line 79
    and-int v1, v3, v11

    .line 80
    .line 81
    and-int v3, v7, v9

    .line 82
    .line 83
    or-int/2addr v1, v3

    .line 84
    iput v1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 85
    .line 86
    and-int v3, v4, v11

    .line 87
    .line 88
    and-int v4, v8, v9

    .line 89
    .line 90
    or-int/2addr v3, v4

    .line 91
    iput v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 92
    .line 93
    and-int v4, v5, v11

    .line 94
    .line 95
    and-int/2addr v2, v9

    .line 96
    or-int/2addr v2, v4

    .line 97
    iput v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 98
    .line 99
    and-int v4, v6, v11

    .line 100
    .line 101
    and-int v5, v10, v9

    .line 102
    .line 103
    or-int/2addr v4, v5

    .line 104
    iput v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 105
    .line 106
    shl-int/lit8 v5, v1, 0x1a

    .line 107
    .line 108
    or-int/2addr v0, v5

    .line 109
    int-to-long v5, v0

    .line 110
    const-wide v7, 0xffffffffL

    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    and-long/2addr v5, v7

    .line 116
    iget v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k0:I

    .line 117
    .line 118
    int-to-long v9, v0

    .line 119
    and-long/2addr v9, v7

    .line 120
    add-long/2addr v5, v9

    .line 121
    ushr-int/lit8 v0, v1, 0x6

    .line 122
    .line 123
    shl-int/lit8 v1, v3, 0x14

    .line 124
    .line 125
    or-int/2addr v0, v1

    .line 126
    int-to-long v0, v0

    .line 127
    and-long/2addr v0, v7

    .line 128
    iget v9, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k1:I

    .line 129
    .line 130
    int-to-long v9, v9

    .line 131
    and-long/2addr v9, v7

    .line 132
    add-long/2addr v0, v9

    .line 133
    ushr-int/lit8 v3, v3, 0xc

    .line 134
    .line 135
    shl-int/lit8 v9, v2, 0xe

    .line 136
    .line 137
    or-int/2addr v3, v9

    .line 138
    int-to-long v9, v3

    .line 139
    and-long/2addr v9, v7

    .line 140
    iget v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k2:I

    .line 141
    .line 142
    int-to-long v11, v3

    .line 143
    and-long/2addr v11, v7

    .line 144
    add-long/2addr v9, v11

    .line 145
    ushr-int/lit8 v2, v2, 0x12

    .line 146
    .line 147
    shl-int/lit8 v3, v4, 0x8

    .line 148
    .line 149
    or-int/2addr v2, v3

    .line 150
    int-to-long v2, v2

    .line 151
    and-long/2addr v2, v7

    .line 152
    iget v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k3:I

    .line 153
    .line 154
    int-to-long v11, v4

    .line 155
    and-long/2addr v7, v11

    .line 156
    add-long/2addr v2, v7

    .line 157
    long-to-int v4, v5

    .line 158
    invoke-static {v4, p1, p2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 159
    .line 160
    .line 161
    const/16 v4, 0x20

    .line 162
    .line 163
    ushr-long/2addr v5, v4

    .line 164
    add-long/2addr v0, v5

    .line 165
    long-to-int v5, v0

    .line 166
    add-int/lit8 v6, p2, 0x4

    .line 167
    .line 168
    invoke-static {v5, p1, v6}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 169
    .line 170
    .line 171
    ushr-long/2addr v0, v4

    .line 172
    add-long/2addr v9, v0

    .line 173
    long-to-int v0, v9

    .line 174
    add-int/lit8 v1, p2, 0x8

    .line 175
    .line 176
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 177
    .line 178
    .line 179
    ushr-long v0, v9, v4

    .line 180
    .line 181
    add-long/2addr v2, v0

    .line 182
    long-to-int v0, v2

    .line 183
    add-int/lit8 p2, p2, 0xc

    .line 184
    .line 185
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->reset()V

    .line 189
    .line 190
    .line 191
    const/16 p0, 0x10

    .line 192
    .line 193
    return p0

    .line 194
    :cond_1
    const-string p0, "Output buffer is too short."

    .line 195
    .line 196
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const/4 p0, 0x0

    .line 200
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "Poly1305"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "Poly1305-"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 16
    .line 17
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 10
    .line 11
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "Poly1305 requires an IV when used with a block cipher."

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_0
    instance-of v1, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 32
    .line 33
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/macs/Poly1305;->setKey([B[B)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->reset()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    const-string p0, "Poly1305 requires a key."

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 3
    .line 4
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 7
    .line 8
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 9
    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 13
    .line 14
    return-void
.end method

.method public update(B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    const/4 p1, 0x1

    .line 43
    invoke-virtual {p0, v0, v1, p1}, Lorg/spongycastle/crypto/macs/Poly1305;->update([BII)V

    return-void
.end method

.method public update([BII)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-le p3, v1, :cond_1

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 6
    .line 7
    const/16 v3, 0x10

    .line 8
    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->processBlock()V

    .line 12
    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 15
    .line 16
    :cond_0
    sub-int v2, p3, v1

    .line 17
    .line 18
    iget v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 19
    .line 20
    sub-int/2addr v3, v4

    .line 21
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int v3, v1, p2

    .line 26
    .line 27
    iget-object v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 28
    .line 29
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 30
    .line 31
    invoke-static {p1, v3, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    add-int/2addr v1, v2

    .line 35
    iget v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 36
    .line 37
    add-int/2addr v3, v2

    .line 38
    iput v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method
