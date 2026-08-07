.class public Lorg/spongycastle/crypto/engines/RC2Engine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x8

.field private static piTable:[B


# instance fields
.field private encrypting:Z

.field private workingKey:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/RC2Engine;->piTable:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        -0x27t
        0x78t
        -0x7t
        -0x3ct
        0x19t
        -0x23t
        -0x4bt
        -0x13t
        0x28t
        -0x17t
        -0x3t
        0x79t
        0x4at
        -0x60t
        -0x28t
        -0x63t
        -0x3at
        0x7et
        0x37t
        -0x7dt
        0x2bt
        0x76t
        0x53t
        -0x72t
        0x62t
        0x4ct
        0x64t
        -0x78t
        0x44t
        -0x75t
        -0x5t
        -0x5et
        0x17t
        -0x66t
        0x59t
        -0xbt
        -0x79t
        -0x4dt
        0x4ft
        0x13t
        0x61t
        0x45t
        0x6dt
        -0x73t
        0x9t
        -0x7ft
        0x7dt
        0x32t
        -0x43t
        -0x71t
        0x40t
        -0x15t
        -0x7at
        -0x49t
        0x7bt
        0xbt
        -0x10t
        -0x6bt
        0x21t
        0x22t
        0x5ct
        0x6bt
        0x4et
        -0x7et
        0x54t
        -0x2at
        0x65t
        -0x6dt
        -0x32t
        0x60t
        -0x4et
        0x1ct
        0x73t
        0x56t
        -0x40t
        0x14t
        -0x59t
        -0x74t
        -0xft
        -0x24t
        0x12t
        0x75t
        -0x36t
        0x1ft
        0x3bt
        -0x42t
        -0x1ct
        -0x2ft
        0x42t
        0x3dt
        -0x2ct
        0x30t
        -0x5dt
        0x3ct
        -0x4at
        0x26t
        0x6ft
        -0x41t
        0xet
        -0x26t
        0x46t
        0x69t
        0x7t
        0x57t
        0x27t
        -0xet
        0x1dt
        -0x65t
        -0x44t
        -0x6ct
        0x43t
        0x3t
        -0x8t
        0x11t
        -0x39t
        -0xat
        -0x70t
        -0x11t
        0x3et
        -0x19t
        0x6t
        -0x3dt
        -0x2bt
        0x2ft
        -0x38t
        0x66t
        0x1et
        -0x29t
        0x8t
        -0x18t
        -0x16t
        -0x22t
        -0x80t
        0x52t
        -0x12t
        -0x9t
        -0x7ct
        -0x56t
        0x72t
        -0x54t
        0x35t
        0x4dt
        0x6at
        0x2at
        -0x6at
        0x1at
        -0x2et
        0x71t
        0x5at
        0x15t
        0x49t
        0x74t
        0x4bt
        -0x61t
        -0x30t
        0x5et
        0x4t
        0x18t
        -0x5ct
        -0x14t
        -0x3et
        -0x20t
        0x41t
        0x6et
        0xft
        0x51t
        -0x35t
        -0x34t
        0x24t
        -0x6ft
        -0x51t
        0x50t
        -0x5ft
        -0xct
        0x70t
        0x39t
        -0x67t
        0x7ct
        0x3at
        -0x7bt
        0x23t
        -0x48t
        -0x4ct
        0x7at
        -0x4t
        0x2t
        0x36t
        0x5bt
        0x25t
        0x55t
        -0x69t
        0x31t
        0x2dt
        0x5dt
        -0x6t
        -0x68t
        -0x1dt
        -0x76t
        -0x6et
        -0x52t
        0x5t
        -0x21t
        0x29t
        0x10t
        0x67t
        0x6ct
        -0x46t
        -0x37t
        -0x2dt
        0x0t
        -0x1at
        -0x31t
        -0x1ft
        -0x62t
        -0x58t
        0x2ct
        0x63t
        0x16t
        0x1t
        0x3ft
        0x58t
        -0x1et
        -0x77t
        -0x57t
        0xdt
        0x38t
        0x34t
        0x1bt
        -0x55t
        0x33t
        -0x1t
        -0x50t
        -0x45t
        0x48t
        0xct
        0x5ft
        -0x47t
        -0x4ft
        -0x33t
        0x2et
        -0x3bt
        -0xdt
        -0x25t
        0x47t
        -0x1bt
        -0x5bt
        -0x64t
        0x77t
        0xat
        -0x5at
        0x20t
        0x68t
        -0x2t
        0x7ft
        -0x3ft
        -0x53t
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

.method private decryptBlock([BI[BI)V
    .locals 10

    .line 1
    add-int/lit8 v0, p2, 0x7

    .line 2
    .line 3
    aget-byte v0, p1, v0

    .line 4
    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    add-int/lit8 v1, p2, 0x6

    .line 10
    .line 11
    aget-byte v1, p1, v1

    .line 12
    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    add-int/2addr v0, v1

    .line 16
    add-int/lit8 v1, p2, 0x5

    .line 17
    .line 18
    aget-byte v1, p1, v1

    .line 19
    .line 20
    and-int/lit16 v1, v1, 0xff

    .line 21
    .line 22
    shl-int/lit8 v1, v1, 0x8

    .line 23
    .line 24
    add-int/lit8 v2, p2, 0x4

    .line 25
    .line 26
    aget-byte v2, p1, v2

    .line 27
    .line 28
    and-int/lit16 v2, v2, 0xff

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    add-int/lit8 v2, p2, 0x3

    .line 32
    .line 33
    aget-byte v2, p1, v2

    .line 34
    .line 35
    and-int/lit16 v2, v2, 0xff

    .line 36
    .line 37
    shl-int/lit8 v2, v2, 0x8

    .line 38
    .line 39
    add-int/lit8 v3, p2, 0x2

    .line 40
    .line 41
    aget-byte v3, p1, v3

    .line 42
    .line 43
    and-int/lit16 v3, v3, 0xff

    .line 44
    .line 45
    add-int/2addr v2, v3

    .line 46
    add-int/lit8 v3, p2, 0x1

    .line 47
    .line 48
    aget-byte v3, p1, v3

    .line 49
    .line 50
    and-int/lit16 v3, v3, 0xff

    .line 51
    .line 52
    shl-int/lit8 v3, v3, 0x8

    .line 53
    .line 54
    aget-byte p1, p1, p2

    .line 55
    .line 56
    and-int/lit16 p1, p1, 0xff

    .line 57
    .line 58
    add-int/2addr v3, p1

    .line 59
    const/16 p1, 0x3c

    .line 60
    .line 61
    :goto_0
    const/16 p2, 0x2c

    .line 62
    .line 63
    const/16 v4, 0xf

    .line 64
    .line 65
    const/16 v5, 0xe

    .line 66
    .line 67
    const/16 v6, 0xd

    .line 68
    .line 69
    const/16 v7, 0xb

    .line 70
    .line 71
    if-lt p1, p2, :cond_0

    .line 72
    .line 73
    invoke-direct {p0, v0, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    not-int v0, v1

    .line 78
    and-int/2addr v0, v3

    .line 79
    and-int v7, v2, v1

    .line 80
    .line 81
    add-int/2addr v0, v7

    .line 82
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 83
    .line 84
    add-int/lit8 v8, p1, 0x3

    .line 85
    .line 86
    aget v7, v7, v8

    .line 87
    .line 88
    add-int/2addr v0, v7

    .line 89
    sub-int v0, p2, v0

    .line 90
    .line 91
    invoke-direct {p0, v1, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    not-int v1, v2

    .line 96
    and-int/2addr v1, v0

    .line 97
    and-int v6, v3, v2

    .line 98
    .line 99
    add-int/2addr v1, v6

    .line 100
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 101
    .line 102
    add-int/lit8 v7, p1, 0x2

    .line 103
    .line 104
    aget v6, v6, v7

    .line 105
    .line 106
    add-int/2addr v1, v6

    .line 107
    sub-int v1, p2, v1

    .line 108
    .line 109
    invoke-direct {p0, v2, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    not-int v2, v3

    .line 114
    and-int/2addr v2, v1

    .line 115
    and-int v5, v0, v3

    .line 116
    .line 117
    add-int/2addr v2, v5

    .line 118
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 119
    .line 120
    add-int/lit8 v6, p1, 0x1

    .line 121
    .line 122
    aget v5, v5, v6

    .line 123
    .line 124
    add-int/2addr v2, v5

    .line 125
    sub-int v2, p2, v2

    .line 126
    .line 127
    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    not-int v3, v0

    .line 132
    and-int/2addr v3, v2

    .line 133
    and-int v4, v1, v0

    .line 134
    .line 135
    add-int/2addr v3, v4

    .line 136
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 137
    .line 138
    aget v4, v4, p1

    .line 139
    .line 140
    add-int/2addr v3, v4

    .line 141
    sub-int v3, p2, v3

    .line 142
    .line 143
    add-int/lit8 p1, p1, -0x4

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_0
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 147
    .line 148
    and-int/lit8 p2, v1, 0x3f

    .line 149
    .line 150
    aget p2, p1, p2

    .line 151
    .line 152
    sub-int/2addr v0, p2

    .line 153
    and-int/lit8 p2, v2, 0x3f

    .line 154
    .line 155
    aget p2, p1, p2

    .line 156
    .line 157
    sub-int/2addr v1, p2

    .line 158
    and-int/lit8 p2, v3, 0x3f

    .line 159
    .line 160
    aget p2, p1, p2

    .line 161
    .line 162
    sub-int/2addr v2, p2

    .line 163
    and-int/lit8 p2, v0, 0x3f

    .line 164
    .line 165
    aget p1, p1, p2

    .line 166
    .line 167
    sub-int/2addr v3, p1

    .line 168
    const/16 p1, 0x28

    .line 169
    .line 170
    :goto_1
    const/16 p2, 0x14

    .line 171
    .line 172
    if-lt p1, p2, :cond_1

    .line 173
    .line 174
    invoke-direct {p0, v0, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    not-int v0, v1

    .line 179
    and-int/2addr v0, v3

    .line 180
    and-int v8, v2, v1

    .line 181
    .line 182
    add-int/2addr v0, v8

    .line 183
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 184
    .line 185
    add-int/lit8 v9, p1, 0x3

    .line 186
    .line 187
    aget v8, v8, v9

    .line 188
    .line 189
    add-int/2addr v0, v8

    .line 190
    sub-int v0, p2, v0

    .line 191
    .line 192
    invoke-direct {p0, v1, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    not-int v1, v2

    .line 197
    and-int/2addr v1, v0

    .line 198
    and-int v8, v3, v2

    .line 199
    .line 200
    add-int/2addr v1, v8

    .line 201
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 202
    .line 203
    add-int/lit8 v9, p1, 0x2

    .line 204
    .line 205
    aget v8, v8, v9

    .line 206
    .line 207
    add-int/2addr v1, v8

    .line 208
    sub-int v1, p2, v1

    .line 209
    .line 210
    invoke-direct {p0, v2, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    not-int v2, v3

    .line 215
    and-int/2addr v2, v1

    .line 216
    and-int v8, v0, v3

    .line 217
    .line 218
    add-int/2addr v2, v8

    .line 219
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 220
    .line 221
    add-int/lit8 v9, p1, 0x1

    .line 222
    .line 223
    aget v8, v8, v9

    .line 224
    .line 225
    add-int/2addr v2, v8

    .line 226
    sub-int v2, p2, v2

    .line 227
    .line 228
    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 229
    .line 230
    .line 231
    move-result p2

    .line 232
    not-int v3, v0

    .line 233
    and-int/2addr v3, v2

    .line 234
    and-int v8, v1, v0

    .line 235
    .line 236
    add-int/2addr v3, v8

    .line 237
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 238
    .line 239
    aget v8, v8, p1

    .line 240
    .line 241
    add-int/2addr v3, v8

    .line 242
    sub-int v3, p2, v3

    .line 243
    .line 244
    add-int/lit8 p1, p1, -0x4

    .line 245
    .line 246
    goto :goto_1

    .line 247
    :cond_1
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 248
    .line 249
    and-int/lit8 p2, v1, 0x3f

    .line 250
    .line 251
    aget p2, p1, p2

    .line 252
    .line 253
    sub-int/2addr v0, p2

    .line 254
    and-int/lit8 p2, v2, 0x3f

    .line 255
    .line 256
    aget p2, p1, p2

    .line 257
    .line 258
    sub-int/2addr v1, p2

    .line 259
    and-int/lit8 p2, v3, 0x3f

    .line 260
    .line 261
    aget p2, p1, p2

    .line 262
    .line 263
    sub-int/2addr v2, p2

    .line 264
    and-int/lit8 p2, v0, 0x3f

    .line 265
    .line 266
    aget p1, p1, p2

    .line 267
    .line 268
    sub-int/2addr v3, p1

    .line 269
    const/16 p1, 0x10

    .line 270
    .line 271
    :goto_2
    if-ltz p1, :cond_2

    .line 272
    .line 273
    invoke-direct {p0, v0, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    not-int v0, v1

    .line 278
    and-int/2addr v0, v3

    .line 279
    and-int v8, v2, v1

    .line 280
    .line 281
    add-int/2addr v0, v8

    .line 282
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 283
    .line 284
    add-int/lit8 v9, p1, 0x3

    .line 285
    .line 286
    aget v8, v8, v9

    .line 287
    .line 288
    add-int/2addr v0, v8

    .line 289
    sub-int v0, p2, v0

    .line 290
    .line 291
    invoke-direct {p0, v1, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 292
    .line 293
    .line 294
    move-result p2

    .line 295
    not-int v1, v2

    .line 296
    and-int/2addr v1, v0

    .line 297
    and-int v8, v3, v2

    .line 298
    .line 299
    add-int/2addr v1, v8

    .line 300
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 301
    .line 302
    add-int/lit8 v9, p1, 0x2

    .line 303
    .line 304
    aget v8, v8, v9

    .line 305
    .line 306
    add-int/2addr v1, v8

    .line 307
    sub-int v1, p2, v1

    .line 308
    .line 309
    invoke-direct {p0, v2, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    not-int v2, v3

    .line 314
    and-int/2addr v2, v1

    .line 315
    and-int v8, v0, v3

    .line 316
    .line 317
    add-int/2addr v2, v8

    .line 318
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 319
    .line 320
    add-int/lit8 v9, p1, 0x1

    .line 321
    .line 322
    aget v8, v8, v9

    .line 323
    .line 324
    add-int/2addr v2, v8

    .line 325
    sub-int v2, p2, v2

    .line 326
    .line 327
    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 328
    .line 329
    .line 330
    move-result p2

    .line 331
    not-int v3, v0

    .line 332
    and-int/2addr v3, v2

    .line 333
    and-int v8, v1, v0

    .line 334
    .line 335
    add-int/2addr v3, v8

    .line 336
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 337
    .line 338
    aget v8, v8, p1

    .line 339
    .line 340
    add-int/2addr v3, v8

    .line 341
    sub-int v3, p2, v3

    .line 342
    .line 343
    add-int/lit8 p1, p1, -0x4

    .line 344
    .line 345
    goto :goto_2

    .line 346
    :cond_2
    int-to-byte p0, v3

    .line 347
    aput-byte p0, p3, p4

    .line 348
    .line 349
    add-int/lit8 p0, p4, 0x1

    .line 350
    .line 351
    shr-int/lit8 p1, v3, 0x8

    .line 352
    .line 353
    int-to-byte p1, p1

    .line 354
    aput-byte p1, p3, p0

    .line 355
    .line 356
    add-int/lit8 p0, p4, 0x2

    .line 357
    .line 358
    int-to-byte p1, v2

    .line 359
    aput-byte p1, p3, p0

    .line 360
    .line 361
    add-int/lit8 p0, p4, 0x3

    .line 362
    .line 363
    shr-int/lit8 p1, v2, 0x8

    .line 364
    .line 365
    int-to-byte p1, p1

    .line 366
    aput-byte p1, p3, p0

    .line 367
    .line 368
    add-int/lit8 p0, p4, 0x4

    .line 369
    .line 370
    int-to-byte p1, v1

    .line 371
    aput-byte p1, p3, p0

    .line 372
    .line 373
    add-int/lit8 p0, p4, 0x5

    .line 374
    .line 375
    shr-int/lit8 p1, v1, 0x8

    .line 376
    .line 377
    int-to-byte p1, p1

    .line 378
    aput-byte p1, p3, p0

    .line 379
    .line 380
    add-int/lit8 p0, p4, 0x6

    .line 381
    .line 382
    int-to-byte p1, v0

    .line 383
    aput-byte p1, p3, p0

    .line 384
    .line 385
    add-int/lit8 p4, p4, 0x7

    .line 386
    .line 387
    shr-int/lit8 p0, v0, 0x8

    .line 388
    .line 389
    int-to-byte p0, p0

    .line 390
    aput-byte p0, p3, p4

    .line 391
    .line 392
    return-void
.end method

.method private encryptBlock([BI[BI)V
    .locals 9

    .line 1
    add-int/lit8 v0, p2, 0x7

    .line 2
    .line 3
    aget-byte v0, p1, v0

    .line 4
    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    add-int/lit8 v1, p2, 0x6

    .line 10
    .line 11
    aget-byte v1, p1, v1

    .line 12
    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    add-int/2addr v0, v1

    .line 16
    add-int/lit8 v1, p2, 0x5

    .line 17
    .line 18
    aget-byte v1, p1, v1

    .line 19
    .line 20
    and-int/lit16 v1, v1, 0xff

    .line 21
    .line 22
    shl-int/lit8 v1, v1, 0x8

    .line 23
    .line 24
    add-int/lit8 v2, p2, 0x4

    .line 25
    .line 26
    aget-byte v2, p1, v2

    .line 27
    .line 28
    and-int/lit16 v2, v2, 0xff

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    add-int/lit8 v2, p2, 0x3

    .line 32
    .line 33
    aget-byte v2, p1, v2

    .line 34
    .line 35
    and-int/lit16 v2, v2, 0xff

    .line 36
    .line 37
    shl-int/lit8 v2, v2, 0x8

    .line 38
    .line 39
    add-int/lit8 v3, p2, 0x2

    .line 40
    .line 41
    aget-byte v3, p1, v3

    .line 42
    .line 43
    and-int/lit16 v3, v3, 0xff

    .line 44
    .line 45
    add-int/2addr v2, v3

    .line 46
    add-int/lit8 v3, p2, 0x1

    .line 47
    .line 48
    aget-byte v3, p1, v3

    .line 49
    .line 50
    and-int/lit16 v3, v3, 0xff

    .line 51
    .line 52
    shl-int/lit8 v3, v3, 0x8

    .line 53
    .line 54
    aget-byte p1, p1, p2

    .line 55
    .line 56
    and-int/lit16 p1, p1, 0xff

    .line 57
    .line 58
    add-int/2addr v3, p1

    .line 59
    const/4 p1, 0x0

    .line 60
    :goto_0
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 61
    .line 62
    const/4 v4, 0x5

    .line 63
    const/4 v5, 0x3

    .line 64
    const/4 v6, 0x2

    .line 65
    const/4 v7, 0x1

    .line 66
    const/16 v8, 0x10

    .line 67
    .line 68
    if-gt p1, v8, :cond_0

    .line 69
    .line 70
    not-int v8, v0

    .line 71
    and-int/2addr v8, v2

    .line 72
    add-int/2addr v3, v8

    .line 73
    and-int v8, v1, v0

    .line 74
    .line 75
    add-int/2addr v3, v8

    .line 76
    aget p2, p2, p1

    .line 77
    .line 78
    add-int/2addr v3, p2

    .line 79
    invoke-direct {p0, v3, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    not-int p2, v3

    .line 84
    and-int/2addr p2, v1

    .line 85
    add-int/2addr v2, p2

    .line 86
    and-int p2, v0, v3

    .line 87
    .line 88
    add-int/2addr v2, p2

    .line 89
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 90
    .line 91
    add-int/lit8 v7, p1, 0x1

    .line 92
    .line 93
    aget p2, p2, v7

    .line 94
    .line 95
    add-int/2addr v2, p2

    .line 96
    invoke-direct {p0, v2, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    not-int p2, v2

    .line 101
    and-int/2addr p2, v0

    .line 102
    add-int/2addr v1, p2

    .line 103
    and-int p2, v3, v2

    .line 104
    .line 105
    add-int/2addr v1, p2

    .line 106
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 107
    .line 108
    add-int/lit8 v6, p1, 0x2

    .line 109
    .line 110
    aget p2, p2, v6

    .line 111
    .line 112
    add-int/2addr v1, p2

    .line 113
    invoke-direct {p0, v1, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    not-int p2, v1

    .line 118
    and-int/2addr p2, v3

    .line 119
    add-int/2addr v0, p2

    .line 120
    and-int p2, v2, v1

    .line 121
    .line 122
    add-int/2addr v0, p2

    .line 123
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 124
    .line 125
    add-int/lit8 v5, p1, 0x3

    .line 126
    .line 127
    aget p2, p2, v5

    .line 128
    .line 129
    add-int/2addr v0, p2

    .line 130
    invoke-direct {p0, v0, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/lit8 p1, p1, 0x4

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_0
    and-int/lit8 p1, v0, 0x3f

    .line 138
    .line 139
    aget p1, p2, p1

    .line 140
    .line 141
    add-int/2addr v3, p1

    .line 142
    and-int/lit8 p1, v3, 0x3f

    .line 143
    .line 144
    aget p1, p2, p1

    .line 145
    .line 146
    add-int/2addr v2, p1

    .line 147
    and-int/lit8 p1, v2, 0x3f

    .line 148
    .line 149
    aget p1, p2, p1

    .line 150
    .line 151
    add-int/2addr v1, p1

    .line 152
    and-int/lit8 p1, v1, 0x3f

    .line 153
    .line 154
    aget p1, p2, p1

    .line 155
    .line 156
    add-int/2addr v0, p1

    .line 157
    const/16 p1, 0x14

    .line 158
    .line 159
    :goto_1
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 160
    .line 161
    const/16 v8, 0x28

    .line 162
    .line 163
    if-gt p1, v8, :cond_1

    .line 164
    .line 165
    not-int v8, v0

    .line 166
    and-int/2addr v8, v2

    .line 167
    add-int/2addr v3, v8

    .line 168
    and-int v8, v1, v0

    .line 169
    .line 170
    add-int/2addr v3, v8

    .line 171
    aget p2, p2, p1

    .line 172
    .line 173
    add-int/2addr v3, p2

    .line 174
    invoke-direct {p0, v3, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    not-int p2, v3

    .line 179
    and-int/2addr p2, v1

    .line 180
    add-int/2addr v2, p2

    .line 181
    and-int p2, v0, v3

    .line 182
    .line 183
    add-int/2addr v2, p2

    .line 184
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 185
    .line 186
    add-int/lit8 v8, p1, 0x1

    .line 187
    .line 188
    aget p2, p2, v8

    .line 189
    .line 190
    add-int/2addr v2, p2

    .line 191
    invoke-direct {p0, v2, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    not-int p2, v2

    .line 196
    and-int/2addr p2, v0

    .line 197
    add-int/2addr v1, p2

    .line 198
    and-int p2, v3, v2

    .line 199
    .line 200
    add-int/2addr v1, p2

    .line 201
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 202
    .line 203
    add-int/lit8 v8, p1, 0x2

    .line 204
    .line 205
    aget p2, p2, v8

    .line 206
    .line 207
    add-int/2addr v1, p2

    .line 208
    invoke-direct {p0, v1, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    not-int p2, v1

    .line 213
    and-int/2addr p2, v3

    .line 214
    add-int/2addr v0, p2

    .line 215
    and-int p2, v2, v1

    .line 216
    .line 217
    add-int/2addr v0, p2

    .line 218
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 219
    .line 220
    add-int/lit8 v8, p1, 0x3

    .line 221
    .line 222
    aget p2, p2, v8

    .line 223
    .line 224
    add-int/2addr v0, p2

    .line 225
    invoke-direct {p0, v0, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    add-int/lit8 p1, p1, 0x4

    .line 230
    .line 231
    goto :goto_1

    .line 232
    :cond_1
    and-int/lit8 p1, v0, 0x3f

    .line 233
    .line 234
    aget p1, p2, p1

    .line 235
    .line 236
    add-int/2addr v3, p1

    .line 237
    and-int/lit8 p1, v3, 0x3f

    .line 238
    .line 239
    aget p1, p2, p1

    .line 240
    .line 241
    add-int/2addr v2, p1

    .line 242
    and-int/lit8 p1, v2, 0x3f

    .line 243
    .line 244
    aget p1, p2, p1

    .line 245
    .line 246
    add-int/2addr v1, p1

    .line 247
    and-int/lit8 p1, v1, 0x3f

    .line 248
    .line 249
    aget p1, p2, p1

    .line 250
    .line 251
    add-int/2addr v0, p1

    .line 252
    const/16 p1, 0x2c

    .line 253
    .line 254
    :goto_2
    const/16 p2, 0x40

    .line 255
    .line 256
    if-ge p1, p2, :cond_2

    .line 257
    .line 258
    not-int p2, v0

    .line 259
    and-int/2addr p2, v2

    .line 260
    add-int/2addr v3, p2

    .line 261
    and-int p2, v1, v0

    .line 262
    .line 263
    add-int/2addr v3, p2

    .line 264
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 265
    .line 266
    aget p2, p2, p1

    .line 267
    .line 268
    add-int/2addr v3, p2

    .line 269
    invoke-direct {p0, v3, v7}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    not-int p2, v3

    .line 274
    and-int/2addr p2, v1

    .line 275
    add-int/2addr v2, p2

    .line 276
    and-int p2, v0, v3

    .line 277
    .line 278
    add-int/2addr v2, p2

    .line 279
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 280
    .line 281
    add-int/lit8 v8, p1, 0x1

    .line 282
    .line 283
    aget p2, p2, v8

    .line 284
    .line 285
    add-int/2addr v2, p2

    .line 286
    invoke-direct {p0, v2, v6}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    not-int p2, v2

    .line 291
    and-int/2addr p2, v0

    .line 292
    add-int/2addr v1, p2

    .line 293
    and-int p2, v3, v2

    .line 294
    .line 295
    add-int/2addr v1, p2

    .line 296
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 297
    .line 298
    add-int/lit8 v8, p1, 0x2

    .line 299
    .line 300
    aget p2, p2, v8

    .line 301
    .line 302
    add-int/2addr v1, p2

    .line 303
    invoke-direct {p0, v1, v5}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    not-int p2, v1

    .line 308
    and-int/2addr p2, v3

    .line 309
    add-int/2addr v0, p2

    .line 310
    and-int p2, v2, v1

    .line 311
    .line 312
    add-int/2addr v0, p2

    .line 313
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 314
    .line 315
    add-int/lit8 v8, p1, 0x3

    .line 316
    .line 317
    aget p2, p2, v8

    .line 318
    .line 319
    add-int/2addr v0, p2

    .line 320
    invoke-direct {p0, v0, v4}, Lorg/spongycastle/crypto/engines/RC2Engine;->rotateWordLeft(II)I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    add-int/lit8 p1, p1, 0x4

    .line 325
    .line 326
    goto :goto_2

    .line 327
    :cond_2
    int-to-byte p0, v3

    .line 328
    aput-byte p0, p3, p4

    .line 329
    .line 330
    add-int/lit8 p0, p4, 0x1

    .line 331
    .line 332
    shr-int/lit8 p1, v3, 0x8

    .line 333
    .line 334
    int-to-byte p1, p1

    .line 335
    aput-byte p1, p3, p0

    .line 336
    .line 337
    add-int/lit8 p0, p4, 0x2

    .line 338
    .line 339
    int-to-byte p1, v2

    .line 340
    aput-byte p1, p3, p0

    .line 341
    .line 342
    add-int/lit8 p0, p4, 0x3

    .line 343
    .line 344
    shr-int/lit8 p1, v2, 0x8

    .line 345
    .line 346
    int-to-byte p1, p1

    .line 347
    aput-byte p1, p3, p0

    .line 348
    .line 349
    add-int/lit8 p0, p4, 0x4

    .line 350
    .line 351
    int-to-byte p1, v1

    .line 352
    aput-byte p1, p3, p0

    .line 353
    .line 354
    add-int/lit8 p0, p4, 0x5

    .line 355
    .line 356
    shr-int/lit8 p1, v1, 0x8

    .line 357
    .line 358
    int-to-byte p1, p1

    .line 359
    aput-byte p1, p3, p0

    .line 360
    .line 361
    add-int/lit8 p0, p4, 0x6

    .line 362
    .line 363
    int-to-byte p1, v0

    .line 364
    aput-byte p1, p3, p0

    .line 365
    .line 366
    add-int/lit8 p4, p4, 0x7

    .line 367
    .line 368
    shr-int/lit8 p0, v0, 0x8

    .line 369
    .line 370
    int-to-byte p0, p0

    .line 371
    aput-byte p0, p3, p4

    .line 372
    .line 373
    return-void
.end method

.method private generateWorkingKey([BI)[I
    .locals 7

    .line 1
    const/16 p0, 0x80

    .line 2
    .line 3
    new-array v0, p0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    array-length v3, p1

    .line 8
    const/16 v4, 0xff

    .line 9
    .line 10
    if-eq v2, v3, :cond_0

    .line 11
    .line 12
    aget-byte v3, p1, v2

    .line 13
    .line 14
    and-int/2addr v3, v4

    .line 15
    aput v3, v0, v2

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    array-length p1, p1

    .line 21
    if-ge p1, p0, :cond_2

    .line 22
    .line 23
    add-int/lit8 v2, p1, -0x1

    .line 24
    .line 25
    aget v2, v0, v2

    .line 26
    .line 27
    move v3, v1

    .line 28
    :goto_1
    sget-object v5, Lorg/spongycastle/crypto/engines/RC2Engine;->piTable:[B

    .line 29
    .line 30
    add-int/lit8 v6, v3, 0x1

    .line 31
    .line 32
    aget v3, v0, v3

    .line 33
    .line 34
    add-int/2addr v2, v3

    .line 35
    and-int/2addr v2, v4

    .line 36
    aget-byte v2, v5, v2

    .line 37
    .line 38
    and-int/2addr v2, v4

    .line 39
    add-int/lit8 v3, p1, 0x1

    .line 40
    .line 41
    aput v2, v0, p1

    .line 42
    .line 43
    if-lt v3, p0, :cond_1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    move p1, v3

    .line 47
    move v3, v6

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :goto_2
    add-int/lit8 p0, p2, 0x7

    .line 50
    .line 51
    shr-int/lit8 p0, p0, 0x3

    .line 52
    .line 53
    sget-object p1, Lorg/spongycastle/crypto/engines/RC2Engine;->piTable:[B

    .line 54
    .line 55
    rsub-int v2, p0, 0x80

    .line 56
    .line 57
    aget v3, v0, v2

    .line 58
    .line 59
    neg-int p2, p2

    .line 60
    and-int/lit8 p2, p2, 0x7

    .line 61
    .line 62
    shr-int p2, v4, p2

    .line 63
    .line 64
    and-int/2addr p2, v3

    .line 65
    aget-byte p1, p1, p2

    .line 66
    .line 67
    and-int/2addr p1, v4

    .line 68
    aput p1, v0, v2

    .line 69
    .line 70
    rsub-int/lit8 p2, p0, 0x7f

    .line 71
    .line 72
    :goto_3
    if-ltz p2, :cond_3

    .line 73
    .line 74
    sget-object v2, Lorg/spongycastle/crypto/engines/RC2Engine;->piTable:[B

    .line 75
    .line 76
    add-int v3, p2, p0

    .line 77
    .line 78
    aget v3, v0, v3

    .line 79
    .line 80
    xor-int/2addr p1, v3

    .line 81
    aget-byte p1, v2, p1

    .line 82
    .line 83
    and-int/2addr p1, v4

    .line 84
    aput p1, v0, p2

    .line 85
    .line 86
    add-int/lit8 p2, p2, -0x1

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_3
    const/16 p0, 0x40

    .line 90
    .line 91
    new-array p1, p0, [I

    .line 92
    .line 93
    :goto_4
    if-eq v1, p0, :cond_4

    .line 94
    .line 95
    mul-int/lit8 p2, v1, 0x2

    .line 96
    .line 97
    aget v2, v0, p2

    .line 98
    .line 99
    add-int/lit8 p2, p2, 0x1

    .line 100
    .line 101
    aget p2, v0, p2

    .line 102
    .line 103
    shl-int/lit8 p2, p2, 0x8

    .line 104
    .line 105
    add-int/2addr v2, p2

    .line 106
    aput v2, p1, v1

    .line 107
    .line 108
    add-int/lit8 v1, v1, 0x1

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_4
    return-object p1
.end method

.method private rotateWordLeft(II)I
    .locals 0

    const p0, 0xffff

    and-int/2addr p0, p1

    shl-int p1, p0, p2

    rsub-int/lit8 p2, p2, 0x10

    shr-int/2addr p0, p2

    or-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "RC2"

    .line 2
    .line 3
    return-object p0
.end method

.method public getBlockSize()I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->encrypting:Z

    .line 2
    .line 3
    instance-of p1, p2, Lorg/spongycastle/crypto/params/RC2Parameters;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/RC2Parameters;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/RC2Parameters;->getEffectiveKeyBits()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC2Engine;->generateWorkingKey([BI)[I

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    instance-of p1, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 29
    .line 30
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    array-length p2, p1

    .line 35
    mul-int/lit8 p2, p2, 0x8

    .line 36
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC2Engine;->generateWorkingKey([BI)[I

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "invalid parameter passed to RC2 init - "

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final processBlock([BI[BI)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->workingKey:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int/lit8 v0, p2, 0x8

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int/lit8 v0, p4, 0x8

    .line 12
    .line 13
    array-length v2, p3

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RC2Engine;->encrypting:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC2Engine;->encryptBlock([BI[BI)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC2Engine;->decryptBlock([BI[BI)V

    .line 25
    .line 26
    .line 27
    :goto_0
    const/16 p0, 0x8

    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    const-string p0, "output buffer too short"

    .line 31
    .line 32
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    const-string p0, "input buffer too short"

    .line 37
    .line 38
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_3
    const-string p0, "RC2 engine not initialised"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v1
.end method

.method public reset()V
    .locals 0

    return-void
.end method
