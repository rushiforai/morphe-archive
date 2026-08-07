.class public final Lorg/spongycastle/crypto/digests/WhirlpoolDigest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;
.implements Lorg/spongycastle/util/Memoable;


# static fields
.field private static final BITCOUNT_ARRAY_SIZE:I = 0x20

.field private static final BYTE_LENGTH:I = 0x40

.field private static final C0:[J

.field private static final C1:[J

.field private static final C2:[J

.field private static final C3:[J

.field private static final C4:[J

.field private static final C5:[J

.field private static final C6:[J

.field private static final C7:[J

.field private static final DIGEST_LENGTH_BYTES:I = 0x40

.field private static final EIGHT:[S

.field private static final REDUCTION_POLYNOMIAL:I = 0x11d

.field private static final ROUNDS:I = 0xa

.field private static final SBOX:[I


# instance fields
.field private _K:[J

.field private _L:[J

.field private _bitCount:[S

.field private _block:[J

.field private _buffer:[B

.field private _bufferPos:I

.field private _hash:[J

.field private final _rc:[J

.field private _state:[J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->SBOX:[I

    .line 9
    .line 10
    new-array v1, v0, [J

    .line 11
    .line 12
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C0:[J

    .line 13
    .line 14
    new-array v1, v0, [J

    .line 15
    .line 16
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C1:[J

    .line 17
    .line 18
    new-array v1, v0, [J

    .line 19
    .line 20
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C2:[J

    .line 21
    .line 22
    new-array v1, v0, [J

    .line 23
    .line 24
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C3:[J

    .line 25
    .line 26
    new-array v1, v0, [J

    .line 27
    .line 28
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C4:[J

    .line 29
    .line 30
    new-array v1, v0, [J

    .line 31
    .line 32
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C5:[J

    .line 33
    .line 34
    new-array v1, v0, [J

    .line 35
    .line 36
    sput-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C6:[J

    .line 37
    .line 38
    new-array v0, v0, [J

    .line 39
    .line 40
    sput-object v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C7:[J

    .line 41
    .line 42
    const/16 v0, 0x20

    .line 43
    .line 44
    new-array v0, v0, [S

    .line 45
    .line 46
    sput-object v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->EIGHT:[S

    .line 47
    .line 48
    const/16 v1, 0x1f

    .line 49
    .line 50
    const/16 v2, 0x8

    .line 51
    .line 52
    aput-short v2, v0, v1

    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 4
        0x18
        0x23
        0xc6
        0xe8
        0x87
        0xb8
        0x1
        0x4f
        0x36
        0xa6
        0xd2
        0xf5
        0x79
        0x6f
        0x91
        0x52
        0x60
        0xbc
        0x9b
        0x8e
        0xa3
        0xc
        0x7b
        0x35
        0x1d
        0xe0
        0xd7
        0xc2
        0x2e
        0x4b
        0xfe
        0x57
        0x15
        0x77
        0x37
        0xe5
        0x9f
        0xf0
        0x4a
        0xda
        0x58
        0xc9
        0x29
        0xa
        0xb1
        0xa0
        0x6b
        0x85
        0xbd
        0x5d
        0x10
        0xf4
        0xcb
        0x3e
        0x5
        0x67
        0xe4
        0x27
        0x41
        0x8b
        0xa7
        0x7d
        0x95
        0xd8
        0xfb
        0xee
        0x7c
        0x66
        0xdd
        0x17
        0x47
        0x9e
        0xca
        0x2d
        0xbf
        0x7
        0xad
        0x5a
        0x83
        0x33
        0x63
        0x2
        0xaa
        0x71
        0xc8
        0x19
        0x49
        0xd9
        0xf2
        0xe3
        0x5b
        0x88
        0x9a
        0x26
        0x32
        0xb0
        0xe9
        0xf
        0xd5
        0x80
        0xbe
        0xcd
        0x34
        0x48
        0xff
        0x7a
        0x90
        0x5f
        0x20
        0x68
        0x1a
        0xae
        0xb4
        0x54
        0x93
        0x22
        0x64
        0xf1
        0x73
        0x12
        0x40
        0x8
        0xc3
        0xec
        0xdb
        0xa1
        0x8d
        0x3d
        0x97
        0x0
        0xcf
        0x2b
        0x76
        0x82
        0xd6
        0x1b
        0xb5
        0xaf
        0x6a
        0x50
        0x45
        0xf3
        0x30
        0xef
        0x3f
        0x55
        0xa2
        0xea
        0x65
        0xba
        0x2f
        0xc0
        0xde
        0x1c
        0xfd
        0x4d
        0x92
        0x75
        0x6
        0x8a
        0xb2
        0xe6
        0xe
        0x1f
        0x62
        0xd4
        0xa8
        0x96
        0xf9
        0xc5
        0x25
        0x59
        0x84
        0x72
        0x39
        0x4c
        0x5e
        0x78
        0x38
        0x8c
        0xd1
        0xa5
        0xe2
        0x61
        0xb3
        0x21
        0x9c
        0x1e
        0x43
        0xc7
        0xfc
        0x4
        0x51
        0x99
        0x6d
        0xd
        0xfa
        0xdf
        0x7e
        0x24
        0x3b
        0xab
        0xce
        0x11
        0x8f
        0x4e
        0xb7
        0xeb
        0x3c
        0x81
        0x94
        0xf7
        0xb9
        0x13
        0x2c
        0xd3
        0xe7
        0x6e
        0xc4
        0x3
        0x56
        0x44
        0x7f
        0xa9
        0x2a
        0xbb
        0xc1
        0x53
        0xdc
        0xb
        0x9d
        0x6c
        0x31
        0x74
        0xf6
        0x46
        0xac
        0x89
        0x14
        0xe1
        0x16
        0x3a
        0x69
        0x9
        0x70
        0xb6
        0xd0
        0xed
        0xcc
        0x42
        0x98
        0xa4
        0x28
        0x5c
        0xf8
        0x86
    .end array-data
.end method

.method public constructor <init>()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xb

    .line 7
    .line 8
    new-array v1, v1, [J

    .line 9
    .line 10
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 11
    .line 12
    const/16 v1, 0x40

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 17
    .line 18
    const/4 v9, 0x0

    .line 19
    iput v9, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 20
    .line 21
    const/16 v1, 0x20

    .line 22
    .line 23
    new-array v1, v1, [S

    .line 24
    .line 25
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 26
    .line 27
    const/16 v10, 0x8

    .line 28
    .line 29
    new-array v1, v10, [J

    .line 30
    .line 31
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 32
    .line 33
    new-array v1, v10, [J

    .line 34
    .line 35
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 36
    .line 37
    new-array v1, v10, [J

    .line 38
    .line 39
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 40
    .line 41
    new-array v1, v10, [J

    .line 42
    .line 43
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 44
    .line 45
    new-array v1, v10, [J

    .line 46
    .line 47
    iput-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 48
    .line 49
    move v11, v9

    .line 50
    :goto_0
    const/16 v1, 0x100

    .line 51
    .line 52
    if-ge v11, v1, :cond_0

    .line 53
    .line 54
    sget-object v1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->SBOX:[I

    .line 55
    .line 56
    aget v1, v1, v11

    .line 57
    .line 58
    shl-int/lit8 v2, v1, 0x1

    .line 59
    .line 60
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->maskWithReductionPolynomial(I)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    shl-int/lit8 v3, v2, 0x1

    .line 65
    .line 66
    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->maskWithReductionPolynomial(I)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    xor-int v4, v3, v1

    .line 71
    .line 72
    shl-int/lit8 v5, v3, 0x1

    .line 73
    .line 74
    invoke-direct {v0, v5}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->maskWithReductionPolynomial(I)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    xor-int v6, v5, v1

    .line 79
    .line 80
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C0:[J

    .line 81
    .line 82
    move v7, v2

    .line 83
    move v2, v1

    .line 84
    move v8, v4

    .line 85
    move v4, v1

    .line 86
    move v15, v8

    .line 87
    move v8, v6

    .line 88
    move v6, v15

    .line 89
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 90
    .line 91
    .line 92
    move-result-wide v13

    .line 93
    move v2, v3

    .line 94
    move v3, v5

    .line 95
    move v4, v8

    .line 96
    move v8, v6

    .line 97
    aput-wide v13, v12, v11

    .line 98
    .line 99
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C1:[J

    .line 100
    .line 101
    move v3, v1

    .line 102
    move v6, v5

    .line 103
    move v5, v1

    .line 104
    move v0, v2

    .line 105
    move v2, v1

    .line 106
    move v1, v4

    .line 107
    move v4, v0

    .line 108
    move v0, v8

    .line 109
    move v8, v7

    .line 110
    move v7, v0

    .line 111
    move-object/from16 v0, p0

    .line 112
    .line 113
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 114
    .line 115
    .line 116
    move-result-wide v13

    .line 117
    move v3, v4

    .line 118
    move v4, v1

    .line 119
    move v1, v2

    .line 120
    move v2, v3

    .line 121
    move v3, v8

    .line 122
    move v8, v7

    .line 123
    move v7, v3

    .line 124
    move v3, v6

    .line 125
    aput-wide v13, v12, v11

    .line 126
    .line 127
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C2:[J

    .line 128
    .line 129
    move v5, v4

    .line 130
    move v4, v1

    .line 131
    move v6, v1

    .line 132
    move v0, v3

    .line 133
    move v3, v1

    .line 134
    move v1, v7

    .line 135
    move v7, v0

    .line 136
    move v0, v5

    .line 137
    move v5, v2

    .line 138
    move v2, v0

    .line 139
    move-object/from16 v0, p0

    .line 140
    .line 141
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 142
    .line 143
    .line 144
    move-result-wide v13

    .line 145
    move v4, v7

    .line 146
    move v7, v1

    .line 147
    move v1, v3

    .line 148
    move v3, v4

    .line 149
    move v4, v2

    .line 150
    move v2, v5

    .line 151
    aput-wide v13, v12, v11

    .line 152
    .line 153
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C3:[J

    .line 154
    .line 155
    move v5, v1

    .line 156
    move v6, v7

    .line 157
    move v7, v1

    .line 158
    move v0, v4

    .line 159
    move v4, v1

    .line 160
    move v1, v8

    .line 161
    move v8, v3

    .line 162
    move v3, v0

    .line 163
    move v0, v6

    .line 164
    move v6, v2

    .line 165
    move v2, v0

    .line 166
    move-object/from16 v0, p0

    .line 167
    .line 168
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 169
    .line 170
    .line 171
    move-result-wide v13

    .line 172
    move v7, v8

    .line 173
    move v8, v1

    .line 174
    move v1, v4

    .line 175
    move v4, v3

    .line 176
    move v3, v7

    .line 177
    move v7, v2

    .line 178
    move v2, v6

    .line 179
    aput-wide v13, v12, v11

    .line 180
    .line 181
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C4:[J

    .line 182
    .line 183
    move v6, v1

    .line 184
    move v5, v8

    .line 185
    move v8, v1

    .line 186
    move v0, v5

    .line 187
    move v5, v1

    .line 188
    move v1, v3

    .line 189
    move v3, v7

    .line 190
    move v7, v2

    .line 191
    move v2, v0

    .line 192
    move-object/from16 v0, p0

    .line 193
    .line 194
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 195
    .line 196
    .line 197
    move-result-wide v13

    .line 198
    move v8, v2

    .line 199
    move v2, v7

    .line 200
    move v7, v3

    .line 201
    move v3, v1

    .line 202
    move v1, v5

    .line 203
    aput-wide v13, v12, v11

    .line 204
    .line 205
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C5:[J

    .line 206
    .line 207
    move v6, v1

    .line 208
    move v5, v7

    .line 209
    move v7, v1

    .line 210
    move v0, v8

    .line 211
    move v8, v2

    .line 212
    move v2, v3

    .line 213
    move v3, v0

    .line 214
    move v0, v5

    .line 215
    move v5, v4

    .line 216
    move v4, v0

    .line 217
    move-object/from16 v0, p0

    .line 218
    .line 219
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 220
    .line 221
    .line 222
    move-result-wide v6

    .line 223
    move v15, v3

    .line 224
    move v3, v2

    .line 225
    move v2, v8

    .line 226
    move v8, v15

    .line 227
    move v15, v5

    .line 228
    move v5, v4

    .line 229
    move v4, v15

    .line 230
    aput-wide v6, v12, v11

    .line 231
    .line 232
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C6:[J

    .line 233
    .line 234
    move v7, v1

    .line 235
    move v6, v8

    .line 236
    move v8, v1

    .line 237
    move v0, v2

    .line 238
    move v2, v1

    .line 239
    move v1, v0

    .line 240
    move v0, v6

    .line 241
    move v6, v4

    .line 242
    move v4, v0

    .line 243
    move-object/from16 v0, p0

    .line 244
    .line 245
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 246
    .line 247
    .line 248
    move-result-wide v7

    .line 249
    move v15, v2

    .line 250
    move v2, v1

    .line 251
    move v1, v15

    .line 252
    move v15, v6

    .line 253
    move v6, v4

    .line 254
    move v4, v15

    .line 255
    aput-wide v7, v12, v11

    .line 256
    .line 257
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C7:[J

    .line 258
    .line 259
    move v7, v3

    .line 260
    move v3, v1

    .line 261
    move v8, v1

    .line 262
    move v0, v7

    .line 263
    move v7, v4

    .line 264
    move v4, v0

    .line 265
    move v0, v6

    .line 266
    move v6, v5

    .line 267
    move v5, v0

    .line 268
    move-object/from16 v0, p0

    .line 269
    .line 270
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->packIntoLong(IIIIIIII)J

    .line 271
    .line 272
    .line 273
    move-result-wide v1

    .line 274
    aput-wide v1, v12, v11

    .line 275
    .line 276
    add-int/lit8 v11, v11, 0x1

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :cond_0
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 281
    .line 282
    const-wide/16 v2, 0x0

    .line 283
    .line 284
    aput-wide v2, v1, v9

    .line 285
    .line 286
    const/4 v1, 0x1

    .line 287
    :goto_1
    const/16 v2, 0xa

    .line 288
    .line 289
    if-gt v1, v2, :cond_1

    .line 290
    .line 291
    add-int/lit8 v2, v1, -0x1

    .line 292
    .line 293
    mul-int/2addr v2, v10

    .line 294
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 295
    .line 296
    sget-object v4, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C0:[J

    .line 297
    .line 298
    aget-wide v5, v4, v2

    .line 299
    .line 300
    const-wide/high16 v7, -0x100000000000000L

    .line 301
    .line 302
    and-long v4, v5, v7

    .line 303
    .line 304
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C1:[J

    .line 305
    .line 306
    add-int/lit8 v7, v2, 0x1

    .line 307
    .line 308
    aget-wide v7, v6, v7

    .line 309
    .line 310
    const-wide/high16 v11, 0xff000000000000L

    .line 311
    .line 312
    and-long v6, v7, v11

    .line 313
    .line 314
    xor-long/2addr v4, v6

    .line 315
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C2:[J

    .line 316
    .line 317
    add-int/lit8 v7, v2, 0x2

    .line 318
    .line 319
    aget-wide v7, v6, v7

    .line 320
    .line 321
    const-wide v11, 0xff0000000000L

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    and-long v6, v7, v11

    .line 327
    .line 328
    xor-long/2addr v4, v6

    .line 329
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C3:[J

    .line 330
    .line 331
    add-int/lit8 v7, v2, 0x3

    .line 332
    .line 333
    aget-wide v7, v6, v7

    .line 334
    .line 335
    const-wide v11, 0xff00000000L

    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    and-long v6, v7, v11

    .line 341
    .line 342
    xor-long/2addr v4, v6

    .line 343
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C4:[J

    .line 344
    .line 345
    add-int/lit8 v7, v2, 0x4

    .line 346
    .line 347
    aget-wide v7, v6, v7

    .line 348
    .line 349
    const-wide v11, 0xff000000L

    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    and-long v6, v7, v11

    .line 355
    .line 356
    xor-long/2addr v4, v6

    .line 357
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C5:[J

    .line 358
    .line 359
    add-int/lit8 v7, v2, 0x5

    .line 360
    .line 361
    aget-wide v7, v6, v7

    .line 362
    .line 363
    const-wide/32 v11, 0xff0000

    .line 364
    .line 365
    .line 366
    and-long v6, v7, v11

    .line 367
    .line 368
    xor-long/2addr v4, v6

    .line 369
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C6:[J

    .line 370
    .line 371
    add-int/lit8 v7, v2, 0x6

    .line 372
    .line 373
    aget-wide v7, v6, v7

    .line 374
    .line 375
    const-wide/32 v11, 0xff00

    .line 376
    .line 377
    .line 378
    and-long v6, v7, v11

    .line 379
    .line 380
    xor-long/2addr v4, v6

    .line 381
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C7:[J

    .line 382
    .line 383
    add-int/lit8 v2, v2, 0x7

    .line 384
    .line 385
    aget-wide v7, v6, v2

    .line 386
    .line 387
    const-wide/16 v11, 0xff

    .line 388
    .line 389
    and-long v6, v7, v11

    .line 390
    .line 391
    xor-long/2addr v4, v6

    .line 392
    aput-wide v4, v3, v1

    .line 393
    .line 394
    add-int/lit8 v1, v1, 0x1

    .line 395
    .line 396
    goto :goto_1

    .line 397
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/WhirlpoolDigest;)V
    .locals 2

    .line 398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xb

    .line 399
    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    const/16 v0, 0x40

    .line 400
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    const/4 v0, 0x0

    .line 401
    iput v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    const/16 v0, 0x20

    .line 402
    new-array v0, v0, [S

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    const/16 v0, 0x8

    .line 403
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 404
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 405
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 406
    new-array v1, v0, [J

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 407
    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 408
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->reset(Lorg/spongycastle/util/Memoable;)V

    return-void
.end method

.method private bytesToLongFromBuffer([BI)J
    .locals 6

    .line 1
    aget-byte p0, p1, p2

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    const-wide/16 v2, 0xff

    .line 5
    .line 6
    and-long/2addr v0, v2

    .line 7
    const/16 p0, 0x38

    .line 8
    .line 9
    shl-long/2addr v0, p0

    .line 10
    add-int/lit8 p0, p2, 0x1

    .line 11
    .line 12
    aget-byte p0, p1, p0

    .line 13
    .line 14
    int-to-long v4, p0

    .line 15
    and-long/2addr v4, v2

    .line 16
    const/16 p0, 0x30

    .line 17
    .line 18
    shl-long/2addr v4, p0

    .line 19
    or-long/2addr v0, v4

    .line 20
    add-int/lit8 p0, p2, 0x2

    .line 21
    .line 22
    aget-byte p0, p1, p0

    .line 23
    .line 24
    int-to-long v4, p0

    .line 25
    and-long/2addr v4, v2

    .line 26
    const/16 p0, 0x28

    .line 27
    .line 28
    shl-long/2addr v4, p0

    .line 29
    or-long/2addr v0, v4

    .line 30
    add-int/lit8 p0, p2, 0x3

    .line 31
    .line 32
    aget-byte p0, p1, p0

    .line 33
    .line 34
    int-to-long v4, p0

    .line 35
    and-long/2addr v4, v2

    .line 36
    const/16 p0, 0x20

    .line 37
    .line 38
    shl-long/2addr v4, p0

    .line 39
    or-long/2addr v0, v4

    .line 40
    add-int/lit8 p0, p2, 0x4

    .line 41
    .line 42
    aget-byte p0, p1, p0

    .line 43
    .line 44
    int-to-long v4, p0

    .line 45
    and-long/2addr v4, v2

    .line 46
    const/16 p0, 0x18

    .line 47
    .line 48
    shl-long/2addr v4, p0

    .line 49
    or-long/2addr v0, v4

    .line 50
    add-int/lit8 p0, p2, 0x5

    .line 51
    .line 52
    aget-byte p0, p1, p0

    .line 53
    .line 54
    int-to-long v4, p0

    .line 55
    and-long/2addr v4, v2

    .line 56
    const/16 p0, 0x10

    .line 57
    .line 58
    shl-long/2addr v4, p0

    .line 59
    or-long/2addr v0, v4

    .line 60
    add-int/lit8 p0, p2, 0x6

    .line 61
    .line 62
    aget-byte p0, p1, p0

    .line 63
    .line 64
    int-to-long v4, p0

    .line 65
    and-long/2addr v4, v2

    .line 66
    const/16 p0, 0x8

    .line 67
    .line 68
    shl-long/2addr v4, p0

    .line 69
    or-long/2addr v0, v4

    .line 70
    add-int/lit8 p2, p2, 0x7

    .line 71
    .line 72
    aget-byte p0, p1, p2

    .line 73
    .line 74
    int-to-long p0, p0

    .line 75
    and-long/2addr p0, v2

    .line 76
    or-long/2addr p0, v0

    .line 77
    return-wide p0
.end method

.method private convertLongToByteArray(J[BI)V
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    const/16 v0, 0x8

    .line 3
    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    add-int v0, p4, p0

    .line 7
    .line 8
    mul-int/lit8 v1, p0, 0x8

    .line 9
    .line 10
    rsub-int/lit8 v1, v1, 0x38

    .line 11
    .line 12
    shr-long v1, p1, v1

    .line 13
    .line 14
    const-wide/16 v3, 0xff

    .line 15
    .line 16
    and-long/2addr v1, v3

    .line 17
    long-to-int v1, v1

    .line 18
    int-to-byte v1, v1

    .line 19
    aput-byte v1, p3, v0

    .line 20
    .line 21
    add-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method private copyBitLength()[B
    .locals 4

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 9
    .line 10
    aget-short v3, v3, v2

    .line 11
    .line 12
    and-int/lit16 v3, v3, 0xff

    .line 13
    .line 14
    int-to-byte v3, v3

    .line 15
    aput-byte v3, v1, v2

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-object v1
.end method

.method private finish()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->copyBitLength()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 8
    .line 9
    add-int/lit8 v3, v2, 0x1

    .line 10
    .line 11
    iput v3, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 12
    .line 13
    aget-byte v4, v1, v2

    .line 14
    .line 15
    or-int/lit16 v4, v4, 0x80

    .line 16
    .line 17
    int-to-byte v4, v4

    .line 18
    aput-byte v4, v1, v2

    .line 19
    .line 20
    array-length v2, v1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-ne v3, v2, :cond_0

    .line 23
    .line 24
    invoke-direct {p0, v1, v4}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->processFilledBuffer([BI)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 28
    .line 29
    const/16 v2, 0x20

    .line 30
    .line 31
    if-le v1, v2, :cond_1

    .line 32
    .line 33
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->update(B)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    iget v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 42
    .line 43
    if-gt v1, v2, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->update(B)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 50
    .line 51
    array-length v3, v0

    .line 52
    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 56
    .line 57
    invoke-direct {p0, v0, v4}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->processFilledBuffer([BI)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private increment()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 10
    .line 11
    aget-short v3, v2, v0

    .line 12
    .line 13
    and-int/lit16 v3, v3, 0xff

    .line 14
    .line 15
    sget-object v4, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->EIGHT:[S

    .line 16
    .line 17
    aget-short v4, v4, v0

    .line 18
    .line 19
    add-int/2addr v3, v4

    .line 20
    add-int/2addr v3, v1

    .line 21
    ushr-int/lit8 v1, v3, 0x8

    .line 22
    .line 23
    and-int/lit16 v3, v3, 0xff

    .line 24
    .line 25
    int-to-short v3, v3

    .line 26
    aput-short v3, v2, v0

    .line 27
    .line 28
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method private maskWithReductionPolynomial(I)I
    .locals 4

    int-to-long v0, p1

    const-wide/16 v2, 0x100

    cmp-long p0, v0, v2

    if-ltz p0, :cond_0

    xor-int/lit16 p0, p1, 0x11d

    return p0

    :cond_0
    return p1
.end method

.method private packIntoLong(IIIIIIII)J
    .locals 2

    int-to-long p0, p1

    const/16 v0, 0x38

    shl-long/2addr p0, v0

    int-to-long v0, p2

    const/16 p2, 0x30

    shl-long/2addr v0, p2

    xor-long/2addr p0, v0

    int-to-long p2, p3

    const/16 v0, 0x28

    shl-long/2addr p2, v0

    xor-long/2addr p0, p2

    int-to-long p2, p4

    const/16 p4, 0x20

    shl-long/2addr p2, p4

    xor-long/2addr p0, p2

    int-to-long p2, p5

    const/16 p4, 0x18

    shl-long/2addr p2, p4

    xor-long/2addr p0, p2

    int-to-long p2, p6

    const/16 p4, 0x10

    shl-long/2addr p2, p4

    xor-long/2addr p0, p2

    int-to-long p2, p7

    const/16 p4, 0x8

    shl-long/2addr p2, p4

    xor-long/2addr p0, p2

    int-to-long p2, p8

    xor-long/2addr p0, p2

    return-wide p0
.end method

.method private processFilledBuffer([BI)V
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    move p2, p1

    .line 3
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    if-ge p2, v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 9
    .line 10
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 11
    .line 12
    mul-int/lit8 v2, p2, 0x8

    .line 13
    .line 14
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->bytesToLongFromBuffer([BI)J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    aput-wide v1, v0, p2

    .line 19
    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->processBlock()V

    .line 24
    .line 25
    .line 26
    iput p1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 27
    .line 28
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 29
    .line 30
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;-><init>(Lorg/spongycastle/crypto/digests/WhirlpoolDigest;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public doFinal([BI)I
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->finish()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    const/16 v1, 0x8

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 10
    .line 11
    aget-wide v2, v1, v0

    .line 12
    .line 13
    mul-int/lit8 v1, v0, 0x8

    .line 14
    .line 15
    add-int/2addr v1, p2

    .line 16
    invoke-direct {p0, v2, v3, p1, v1}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->convertLongToByteArray(J[BI)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->reset()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->getDigestSize()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Whirlpool"

    .line 2
    .line 3
    return-object p0
.end method

.method public getByteLength()I
    .locals 0

    const/16 p0, 0x40

    return p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x40

    return p0
.end method

.method public processBlock()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/16 v3, 0x8

    .line 6
    .line 7
    if-ge v2, v3, :cond_0

    .line 8
    .line 9
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 10
    .line 11
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 12
    .line 13
    aget-wide v5, v4, v2

    .line 14
    .line 15
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 16
    .line 17
    iget-object v7, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 18
    .line 19
    aget-wide v8, v7, v2

    .line 20
    .line 21
    aput-wide v8, v4, v2

    .line 22
    .line 23
    xor-long v4, v5, v8

    .line 24
    .line 25
    aput-wide v4, v3, v2

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v2, 0x1

    .line 31
    :goto_1
    const/16 v4, 0xa

    .line 32
    .line 33
    if-gt v2, v4, :cond_3

    .line 34
    .line 35
    move v4, v1

    .line 36
    :goto_2
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 37
    .line 38
    const/16 v8, 0x20

    .line 39
    .line 40
    const/16 v9, 0x28

    .line 41
    .line 42
    const/16 v10, 0x30

    .line 43
    .line 44
    const/16 v11, 0x38

    .line 45
    .line 46
    if-ge v4, v3, :cond_1

    .line 47
    .line 48
    const-wide/16 v12, 0x0

    .line 49
    .line 50
    aput-wide v12, v5, v4

    .line 51
    .line 52
    sget-object v12, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C0:[J

    .line 53
    .line 54
    iget-object v13, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 55
    .line 56
    and-int/lit8 v14, v4, 0x7

    .line 57
    .line 58
    aget-wide v14, v13, v14

    .line 59
    .line 60
    ushr-long/2addr v14, v11

    .line 61
    long-to-int v11, v14

    .line 62
    and-int/lit16 v11, v11, 0xff

    .line 63
    .line 64
    aget-wide v11, v12, v11

    .line 65
    .line 66
    aput-wide v11, v5, v4

    .line 67
    .line 68
    sget-object v14, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C1:[J

    .line 69
    .line 70
    add-int/lit8 v15, v4, -0x1

    .line 71
    .line 72
    and-int/lit8 v15, v15, 0x7

    .line 73
    .line 74
    aget-wide v15, v13, v15

    .line 75
    .line 76
    const/16 v17, 0x10

    .line 77
    .line 78
    const/16 v18, 0x18

    .line 79
    .line 80
    ushr-long v6, v15, v10

    .line 81
    .line 82
    long-to-int v6, v6

    .line 83
    and-int/lit16 v6, v6, 0xff

    .line 84
    .line 85
    aget-wide v6, v14, v6

    .line 86
    .line 87
    xor-long/2addr v6, v11

    .line 88
    aput-wide v6, v5, v4

    .line 89
    .line 90
    sget-object v10, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C2:[J

    .line 91
    .line 92
    add-int/lit8 v11, v4, -0x2

    .line 93
    .line 94
    and-int/lit8 v11, v11, 0x7

    .line 95
    .line 96
    aget-wide v11, v13, v11

    .line 97
    .line 98
    ushr-long/2addr v11, v9

    .line 99
    long-to-int v9, v11

    .line 100
    and-int/lit16 v9, v9, 0xff

    .line 101
    .line 102
    aget-wide v9, v10, v9

    .line 103
    .line 104
    xor-long/2addr v6, v9

    .line 105
    aput-wide v6, v5, v4

    .line 106
    .line 107
    sget-object v9, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C3:[J

    .line 108
    .line 109
    add-int/lit8 v10, v4, -0x3

    .line 110
    .line 111
    and-int/lit8 v10, v10, 0x7

    .line 112
    .line 113
    aget-wide v10, v13, v10

    .line 114
    .line 115
    ushr-long/2addr v10, v8

    .line 116
    long-to-int v8, v10

    .line 117
    and-int/lit16 v8, v8, 0xff

    .line 118
    .line 119
    aget-wide v8, v9, v8

    .line 120
    .line 121
    xor-long/2addr v6, v8

    .line 122
    aput-wide v6, v5, v4

    .line 123
    .line 124
    sget-object v8, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C4:[J

    .line 125
    .line 126
    add-int/lit8 v9, v4, -0x4

    .line 127
    .line 128
    and-int/lit8 v9, v9, 0x7

    .line 129
    .line 130
    aget-wide v9, v13, v9

    .line 131
    .line 132
    ushr-long v9, v9, v18

    .line 133
    .line 134
    long-to-int v9, v9

    .line 135
    and-int/lit16 v9, v9, 0xff

    .line 136
    .line 137
    aget-wide v9, v8, v9

    .line 138
    .line 139
    xor-long/2addr v6, v9

    .line 140
    aput-wide v6, v5, v4

    .line 141
    .line 142
    sget-object v8, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C5:[J

    .line 143
    .line 144
    add-int/lit8 v9, v4, -0x5

    .line 145
    .line 146
    and-int/lit8 v9, v9, 0x7

    .line 147
    .line 148
    aget-wide v9, v13, v9

    .line 149
    .line 150
    ushr-long v9, v9, v17

    .line 151
    .line 152
    long-to-int v9, v9

    .line 153
    and-int/lit16 v9, v9, 0xff

    .line 154
    .line 155
    aget-wide v9, v8, v9

    .line 156
    .line 157
    xor-long/2addr v6, v9

    .line 158
    aput-wide v6, v5, v4

    .line 159
    .line 160
    sget-object v8, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C6:[J

    .line 161
    .line 162
    add-int/lit8 v9, v4, -0x6

    .line 163
    .line 164
    and-int/lit8 v9, v9, 0x7

    .line 165
    .line 166
    aget-wide v9, v13, v9

    .line 167
    .line 168
    ushr-long/2addr v9, v3

    .line 169
    long-to-int v9, v9

    .line 170
    and-int/lit16 v9, v9, 0xff

    .line 171
    .line 172
    aget-wide v9, v8, v9

    .line 173
    .line 174
    xor-long/2addr v6, v9

    .line 175
    aput-wide v6, v5, v4

    .line 176
    .line 177
    sget-object v8, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C7:[J

    .line 178
    .line 179
    add-int/lit8 v9, v4, -0x7

    .line 180
    .line 181
    and-int/lit8 v9, v9, 0x7

    .line 182
    .line 183
    aget-wide v9, v13, v9

    .line 184
    .line 185
    long-to-int v9, v9

    .line 186
    and-int/lit16 v9, v9, 0xff

    .line 187
    .line 188
    aget-wide v9, v8, v9

    .line 189
    .line 190
    xor-long/2addr v6, v9

    .line 191
    aput-wide v6, v5, v4

    .line 192
    .line 193
    add-int/lit8 v4, v4, 0x1

    .line 194
    .line 195
    goto/16 :goto_2

    .line 196
    .line 197
    :cond_1
    const/16 v17, 0x10

    .line 198
    .line 199
    const/16 v18, 0x18

    .line 200
    .line 201
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 202
    .line 203
    array-length v6, v4

    .line 204
    invoke-static {v5, v1, v4, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    .line 206
    .line 207
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 208
    .line 209
    aget-wide v5, v4, v1

    .line 210
    .line 211
    iget-object v7, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 212
    .line 213
    aget-wide v12, v7, v2

    .line 214
    .line 215
    xor-long/2addr v5, v12

    .line 216
    aput-wide v5, v4, v1

    .line 217
    .line 218
    move v4, v1

    .line 219
    :goto_3
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 220
    .line 221
    if-ge v4, v3, :cond_2

    .line 222
    .line 223
    iget-object v6, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 224
    .line 225
    aget-wide v12, v6, v4

    .line 226
    .line 227
    aput-wide v12, v5, v4

    .line 228
    .line 229
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C0:[J

    .line 230
    .line 231
    iget-object v7, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 232
    .line 233
    and-int/lit8 v14, v4, 0x7

    .line 234
    .line 235
    aget-wide v14, v7, v14

    .line 236
    .line 237
    ushr-long/2addr v14, v11

    .line 238
    long-to-int v14, v14

    .line 239
    and-int/lit16 v14, v14, 0xff

    .line 240
    .line 241
    aget-wide v14, v6, v14

    .line 242
    .line 243
    xor-long/2addr v12, v14

    .line 244
    aput-wide v12, v5, v4

    .line 245
    .line 246
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C1:[J

    .line 247
    .line 248
    add-int/lit8 v14, v4, -0x1

    .line 249
    .line 250
    and-int/lit8 v14, v14, 0x7

    .line 251
    .line 252
    aget-wide v14, v7, v14

    .line 253
    .line 254
    ushr-long/2addr v14, v10

    .line 255
    long-to-int v14, v14

    .line 256
    and-int/lit16 v14, v14, 0xff

    .line 257
    .line 258
    aget-wide v14, v6, v14

    .line 259
    .line 260
    xor-long/2addr v12, v14

    .line 261
    aput-wide v12, v5, v4

    .line 262
    .line 263
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C2:[J

    .line 264
    .line 265
    add-int/lit8 v14, v4, -0x2

    .line 266
    .line 267
    and-int/lit8 v14, v14, 0x7

    .line 268
    .line 269
    aget-wide v14, v7, v14

    .line 270
    .line 271
    ushr-long/2addr v14, v9

    .line 272
    long-to-int v14, v14

    .line 273
    and-int/lit16 v14, v14, 0xff

    .line 274
    .line 275
    aget-wide v14, v6, v14

    .line 276
    .line 277
    xor-long/2addr v12, v14

    .line 278
    aput-wide v12, v5, v4

    .line 279
    .line 280
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C3:[J

    .line 281
    .line 282
    add-int/lit8 v14, v4, -0x3

    .line 283
    .line 284
    and-int/lit8 v14, v14, 0x7

    .line 285
    .line 286
    aget-wide v14, v7, v14

    .line 287
    .line 288
    ushr-long/2addr v14, v8

    .line 289
    long-to-int v14, v14

    .line 290
    and-int/lit16 v14, v14, 0xff

    .line 291
    .line 292
    aget-wide v14, v6, v14

    .line 293
    .line 294
    xor-long/2addr v12, v14

    .line 295
    aput-wide v12, v5, v4

    .line 296
    .line 297
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C4:[J

    .line 298
    .line 299
    add-int/lit8 v14, v4, -0x4

    .line 300
    .line 301
    and-int/lit8 v14, v14, 0x7

    .line 302
    .line 303
    aget-wide v14, v7, v14

    .line 304
    .line 305
    ushr-long v14, v14, v18

    .line 306
    .line 307
    long-to-int v14, v14

    .line 308
    and-int/lit16 v14, v14, 0xff

    .line 309
    .line 310
    aget-wide v14, v6, v14

    .line 311
    .line 312
    xor-long/2addr v12, v14

    .line 313
    aput-wide v12, v5, v4

    .line 314
    .line 315
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C5:[J

    .line 316
    .line 317
    add-int/lit8 v14, v4, -0x5

    .line 318
    .line 319
    and-int/lit8 v14, v14, 0x7

    .line 320
    .line 321
    aget-wide v14, v7, v14

    .line 322
    .line 323
    ushr-long v14, v14, v17

    .line 324
    .line 325
    long-to-int v14, v14

    .line 326
    and-int/lit16 v14, v14, 0xff

    .line 327
    .line 328
    aget-wide v14, v6, v14

    .line 329
    .line 330
    xor-long/2addr v12, v14

    .line 331
    aput-wide v12, v5, v4

    .line 332
    .line 333
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C6:[J

    .line 334
    .line 335
    add-int/lit8 v14, v4, -0x6

    .line 336
    .line 337
    and-int/lit8 v14, v14, 0x7

    .line 338
    .line 339
    aget-wide v14, v7, v14

    .line 340
    .line 341
    ushr-long/2addr v14, v3

    .line 342
    long-to-int v14, v14

    .line 343
    and-int/lit16 v14, v14, 0xff

    .line 344
    .line 345
    aget-wide v14, v6, v14

    .line 346
    .line 347
    xor-long/2addr v12, v14

    .line 348
    aput-wide v12, v5, v4

    .line 349
    .line 350
    sget-object v6, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->C7:[J

    .line 351
    .line 352
    add-int/lit8 v14, v4, -0x7

    .line 353
    .line 354
    and-int/lit8 v14, v14, 0x7

    .line 355
    .line 356
    aget-wide v14, v7, v14

    .line 357
    .line 358
    long-to-int v7, v14

    .line 359
    and-int/lit16 v7, v7, 0xff

    .line 360
    .line 361
    aget-wide v14, v6, v7

    .line 362
    .line 363
    xor-long v6, v12, v14

    .line 364
    .line 365
    aput-wide v6, v5, v4

    .line 366
    .line 367
    add-int/lit8 v4, v4, 0x1

    .line 368
    .line 369
    goto/16 :goto_3

    .line 370
    .line 371
    :cond_2
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 372
    .line 373
    array-length v6, v4

    .line 374
    invoke-static {v5, v1, v4, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 375
    .line 376
    .line 377
    add-int/lit8 v2, v2, 0x1

    .line 378
    .line 379
    goto/16 :goto_1

    .line 380
    .line 381
    :cond_3
    :goto_4
    if-ge v1, v3, :cond_4

    .line 382
    .line 383
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 384
    .line 385
    aget-wide v4, v2, v1

    .line 386
    .line 387
    iget-object v6, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 388
    .line 389
    aget-wide v7, v6, v1

    .line 390
    .line 391
    iget-object v6, v0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 392
    .line 393
    aget-wide v9, v6, v1

    .line 394
    .line 395
    xor-long v6, v7, v9

    .line 396
    .line 397
    xor-long/2addr v4, v6

    .line 398
    aput-wide v4, v2, v1

    .line 399
    .line 400
    add-int/lit8 v1, v1, 0x1

    .line 401
    .line 402
    goto :goto_4

    .line 403
    :cond_4
    return-void
.end method

.method public reset()V
    .locals 3

    const/4 v0, 0x0

    .line 73
    iput v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 74
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    invoke-static {v1, v0}, Lorg/spongycastle/util/Arrays;->fill([SS)V

    .line 75
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    invoke-static {v1, v0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 76
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 77
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 78
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 79
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 80
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    invoke-static {p0, v1, v2}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 4

    .line 1
    check-cast p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;

    .line 2
    .line 3
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_rc:[J

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 13
    .line 14
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 15
    .line 16
    array-length v2, v1

    .line 17
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 23
    .line 24
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 25
    .line 26
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bitCount:[S

    .line 27
    .line 28
    array-length v2, v1

    .line 29
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 33
    .line 34
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_hash:[J

    .line 35
    .line 36
    array-length v2, v1

    .line 37
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 41
    .line 42
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_K:[J

    .line 43
    .line 44
    array-length v2, v1

    .line 45
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 49
    .line 50
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_L:[J

    .line 51
    .line 52
    array-length v2, v1

    .line 53
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 57
    .line 58
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_block:[J

    .line 59
    .line 60
    array-length v2, v1

    .line 61
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p1, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 65
    .line 66
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_state:[J

    .line 67
    .line 68
    array-length v0, p0

    .line 69
    invoke-static {p1, v3, p0, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public update(B)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_buffer:[B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 4
    .line 5
    aput-byte p1, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, p0, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->_bufferPos:I

    .line 10
    .line 11
    array-length p1, v0

    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->processFilledBuffer([BI)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->increment()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public update([BII)V
    .locals 1

    :goto_0
    if-lez p3, :cond_0

    .line 22
    aget-byte v0, p1, p2

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/WhirlpoolDigest;->update(B)V

    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method
