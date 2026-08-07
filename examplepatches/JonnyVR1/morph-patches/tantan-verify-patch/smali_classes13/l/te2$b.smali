.class public Ll/te2$b;
.super Ll/te2$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/te2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final j:[B

.field public static final k:[B


# instance fields
.field public final c:[B

.field public d:I

.field public e:I

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/te2$b;->j:[B

    .line 9
    .line 10
    const/16 v0, 0x40

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/te2$b;->k:[B

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    :array_1
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data
.end method

.method public constructor <init>(I[B)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/te2$a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/te2$a;->a:[B

    .line 5
    .line 6
    and-int/lit8 p2, p1, 0x1

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    move p2, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p2, v0

    .line 15
    :goto_0
    iput-boolean p2, p0, Ll/te2$b;->f:Z

    .line 16
    .line 17
    and-int/lit8 p2, p1, 0x2

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    move p2, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move p2, v0

    .line 24
    :goto_1
    iput-boolean p2, p0, Ll/te2$b;->g:Z

    .line 25
    .line 26
    and-int/lit8 v2, p1, 0x4

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    move v1, v0

    .line 32
    :goto_2
    iput-boolean v1, p0, Ll/te2$b;->h:Z

    .line 33
    .line 34
    and-int/lit8 p1, p1, 0x8

    .line 35
    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    sget-object p1, Ll/te2$b;->j:[B

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_3
    sget-object p1, Ll/te2$b;->k:[B

    .line 42
    .line 43
    :goto_3
    iput-object p1, p0, Ll/te2$b;->i:[B

    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    new-array p1, p1, [B

    .line 47
    .line 48
    iput-object p1, p0, Ll/te2$b;->c:[B

    .line 49
    .line 50
    iput v0, p0, Ll/te2$b;->d:I

    .line 51
    .line 52
    if-eqz p2, :cond_4

    .line 53
    .line 54
    const/16 p1, 0x13

    .line 55
    .line 56
    goto :goto_4

    .line 57
    :cond_4
    const/4 p1, -0x1

    .line 58
    :goto_4
    iput p1, p0, Ll/te2$b;->e:I

    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public a([BIIZ)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/te2$b;->i:[B

    .line 4
    .line 5
    iget-object v2, v0, Ll/te2$a;->a:[B

    .line 6
    .line 7
    iget v3, v0, Ll/te2$b;->e:I

    .line 8
    .line 9
    add-int v4, p3, p2

    .line 10
    .line 11
    iget v5, v0, Ll/te2$b;->d:I

    .line 12
    .line 13
    const/4 v6, 0x2

    .line 14
    const/4 v7, 0x0

    .line 15
    const/4 v8, -0x1

    .line 16
    const/4 v9, 0x1

    .line 17
    if-eq v5, v9, :cond_1

    .line 18
    .line 19
    if-eq v5, v6, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    add-int/lit8 v5, p2, 0x1

    .line 23
    .line 24
    if-gt v5, v4, :cond_2

    .line 25
    .line 26
    iget-object v10, v0, Ll/te2$b;->c:[B

    .line 27
    .line 28
    aget-byte v11, v10, v7

    .line 29
    .line 30
    and-int/lit16 v11, v11, 0xff

    .line 31
    .line 32
    shl-int/lit8 v11, v11, 0x10

    .line 33
    .line 34
    aget-byte v10, v10, v9

    .line 35
    .line 36
    and-int/lit16 v10, v10, 0xff

    .line 37
    .line 38
    shl-int/lit8 v10, v10, 0x8

    .line 39
    .line 40
    or-int/2addr v10, v11

    .line 41
    aget-byte v11, p1, p2

    .line 42
    .line 43
    and-int/lit16 v11, v11, 0xff

    .line 44
    .line 45
    or-int/2addr v10, v11

    .line 46
    iput v7, v0, Ll/te2$b;->d:I

    .line 47
    .line 48
    move v11, v5

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    add-int/lit8 v5, p2, 0x2

    .line 51
    .line 52
    if-gt v5, v4, :cond_2

    .line 53
    .line 54
    iget-object v5, v0, Ll/te2$b;->c:[B

    .line 55
    .line 56
    aget-byte v5, v5, v7

    .line 57
    .line 58
    and-int/lit16 v5, v5, 0xff

    .line 59
    .line 60
    shl-int/lit8 v5, v5, 0x10

    .line 61
    .line 62
    add-int/lit8 v10, p2, 0x1

    .line 63
    .line 64
    aget-byte v11, p1, p2

    .line 65
    .line 66
    and-int/lit16 v11, v11, 0xff

    .line 67
    .line 68
    shl-int/lit8 v11, v11, 0x8

    .line 69
    .line 70
    or-int/2addr v5, v11

    .line 71
    add-int/lit8 v11, p2, 0x2

    .line 72
    .line 73
    aget-byte v10, p1, v10

    .line 74
    .line 75
    and-int/lit16 v10, v10, 0xff

    .line 76
    .line 77
    or-int/2addr v10, v5

    .line 78
    iput v7, v0, Ll/te2$b;->d:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    move/from16 v11, p2

    .line 82
    .line 83
    move v10, v8

    .line 84
    :goto_1
    const/16 v5, 0x13

    .line 85
    .line 86
    const/16 v12, 0xd

    .line 87
    .line 88
    const/4 v13, 0x4

    .line 89
    const/16 v14, 0xa

    .line 90
    .line 91
    if-eq v10, v8, :cond_5

    .line 92
    .line 93
    shr-int/lit8 v8, v10, 0x12

    .line 94
    .line 95
    and-int/lit8 v8, v8, 0x3f

    .line 96
    .line 97
    aget-byte v8, v1, v8

    .line 98
    .line 99
    aput-byte v8, v2, v7

    .line 100
    .line 101
    shr-int/lit8 v8, v10, 0xc

    .line 102
    .line 103
    and-int/lit8 v8, v8, 0x3f

    .line 104
    .line 105
    aget-byte v8, v1, v8

    .line 106
    .line 107
    aput-byte v8, v2, v9

    .line 108
    .line 109
    shr-int/lit8 v8, v10, 0x6

    .line 110
    .line 111
    and-int/lit8 v8, v8, 0x3f

    .line 112
    .line 113
    aget-byte v8, v1, v8

    .line 114
    .line 115
    aput-byte v8, v2, v6

    .line 116
    .line 117
    and-int/lit8 v8, v10, 0x3f

    .line 118
    .line 119
    aget-byte v8, v1, v8

    .line 120
    .line 121
    const/4 v10, 0x3

    .line 122
    aput-byte v8, v2, v10

    .line 123
    .line 124
    add-int/lit8 v3, v3, -0x1

    .line 125
    .line 126
    if-nez v3, :cond_4

    .line 127
    .line 128
    iget-boolean v3, v0, Ll/te2$b;->h:Z

    .line 129
    .line 130
    if-eqz v3, :cond_3

    .line 131
    .line 132
    aput-byte v12, v2, v13

    .line 133
    .line 134
    const/4 v3, 0x5

    .line 135
    goto :goto_2

    .line 136
    :cond_3
    move v3, v13

    .line 137
    :goto_2
    add-int/lit8 v8, v3, 0x1

    .line 138
    .line 139
    aput-byte v14, v2, v3

    .line 140
    .line 141
    move v3, v5

    .line 142
    goto :goto_3

    .line 143
    :cond_4
    move v8, v13

    .line 144
    goto :goto_3

    .line 145
    :cond_5
    move v8, v7

    .line 146
    :goto_3
    add-int/lit8 v10, v11, 0x3

    .line 147
    .line 148
    if-gt v10, v4, :cond_8

    .line 149
    .line 150
    aget-byte v15, p1, v11

    .line 151
    .line 152
    and-int/lit16 v15, v15, 0xff

    .line 153
    .line 154
    shl-int/lit8 v15, v15, 0x10

    .line 155
    .line 156
    add-int/lit8 v16, v11, 0x1

    .line 157
    .line 158
    move/from16 p3, v6

    .line 159
    .line 160
    aget-byte v6, p1, v16

    .line 161
    .line 162
    and-int/lit16 v6, v6, 0xff

    .line 163
    .line 164
    shl-int/lit8 v6, v6, 0x8

    .line 165
    .line 166
    or-int/2addr v6, v15

    .line 167
    add-int/lit8 v11, v11, 0x2

    .line 168
    .line 169
    aget-byte v11, p1, v11

    .line 170
    .line 171
    and-int/lit16 v11, v11, 0xff

    .line 172
    .line 173
    or-int/2addr v6, v11

    .line 174
    shr-int/lit8 v11, v6, 0x12

    .line 175
    .line 176
    and-int/lit8 v11, v11, 0x3f

    .line 177
    .line 178
    aget-byte v11, v1, v11

    .line 179
    .line 180
    aput-byte v11, v2, v8

    .line 181
    .line 182
    add-int/lit8 v11, v8, 0x1

    .line 183
    .line 184
    shr-int/lit8 v15, v6, 0xc

    .line 185
    .line 186
    and-int/lit8 v15, v15, 0x3f

    .line 187
    .line 188
    aget-byte v15, v1, v15

    .line 189
    .line 190
    aput-byte v15, v2, v11

    .line 191
    .line 192
    add-int/lit8 v11, v8, 0x2

    .line 193
    .line 194
    shr-int/lit8 v15, v6, 0x6

    .line 195
    .line 196
    and-int/lit8 v15, v15, 0x3f

    .line 197
    .line 198
    aget-byte v15, v1, v15

    .line 199
    .line 200
    aput-byte v15, v2, v11

    .line 201
    .line 202
    add-int/lit8 v11, v8, 0x3

    .line 203
    .line 204
    and-int/lit8 v6, v6, 0x3f

    .line 205
    .line 206
    aget-byte v6, v1, v6

    .line 207
    .line 208
    aput-byte v6, v2, v11

    .line 209
    .line 210
    add-int/lit8 v6, v8, 0x4

    .line 211
    .line 212
    add-int/lit8 v3, v3, -0x1

    .line 213
    .line 214
    if-nez v3, :cond_7

    .line 215
    .line 216
    iget-boolean v3, v0, Ll/te2$b;->h:Z

    .line 217
    .line 218
    if-eqz v3, :cond_6

    .line 219
    .line 220
    add-int/lit8 v8, v8, 0x5

    .line 221
    .line 222
    aput-byte v12, v2, v6

    .line 223
    .line 224
    move v6, v8

    .line 225
    :cond_6
    add-int/lit8 v8, v6, 0x1

    .line 226
    .line 227
    aput-byte v14, v2, v6

    .line 228
    .line 229
    move/from16 v6, p3

    .line 230
    .line 231
    move v3, v5

    .line 232
    move v11, v10

    .line 233
    goto :goto_3

    .line 234
    :cond_7
    move v8, v6

    .line 235
    move v11, v10

    .line 236
    move/from16 v6, p3

    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_8
    move/from16 p3, v6

    .line 240
    .line 241
    if-eqz p4, :cond_15

    .line 242
    .line 243
    iget v6, v0, Ll/te2$b;->d:I

    .line 244
    .line 245
    sub-int v10, v11, v6

    .line 246
    .line 247
    add-int/lit8 v15, v4, -0x1

    .line 248
    .line 249
    const/16 v16, 0x3d

    .line 250
    .line 251
    if-ne v10, v15, :cond_d

    .line 252
    .line 253
    if-lez v6, :cond_9

    .line 254
    .line 255
    iget-object v4, v0, Ll/te2$b;->c:[B

    .line 256
    .line 257
    aget-byte v4, v4, v7

    .line 258
    .line 259
    move v7, v9

    .line 260
    goto :goto_4

    .line 261
    :cond_9
    aget-byte v4, p1, v11

    .line 262
    .line 263
    :goto_4
    and-int/lit16 v4, v4, 0xff

    .line 264
    .line 265
    shl-int/2addr v4, v13

    .line 266
    sub-int/2addr v6, v7

    .line 267
    iput v6, v0, Ll/te2$b;->d:I

    .line 268
    .line 269
    add-int/lit8 v5, v8, 0x1

    .line 270
    .line 271
    shr-int/lit8 v6, v4, 0x6

    .line 272
    .line 273
    and-int/lit8 v6, v6, 0x3f

    .line 274
    .line 275
    aget-byte v6, v1, v6

    .line 276
    .line 277
    aput-byte v6, v2, v8

    .line 278
    .line 279
    add-int/lit8 v6, v8, 0x2

    .line 280
    .line 281
    and-int/lit8 v4, v4, 0x3f

    .line 282
    .line 283
    aget-byte v1, v1, v4

    .line 284
    .line 285
    aput-byte v1, v2, v5

    .line 286
    .line 287
    iget-boolean v1, v0, Ll/te2$b;->f:Z

    .line 288
    .line 289
    if-eqz v1, :cond_a

    .line 290
    .line 291
    add-int/lit8 v1, v8, 0x3

    .line 292
    .line 293
    aput-byte v16, v2, v6

    .line 294
    .line 295
    add-int/lit8 v6, v8, 0x4

    .line 296
    .line 297
    aput-byte v16, v2, v1

    .line 298
    .line 299
    :cond_a
    iget-boolean v1, v0, Ll/te2$b;->g:Z

    .line 300
    .line 301
    if-eqz v1, :cond_c

    .line 302
    .line 303
    iget-boolean v1, v0, Ll/te2$b;->h:Z

    .line 304
    .line 305
    if-eqz v1, :cond_b

    .line 306
    .line 307
    add-int/lit8 v1, v6, 0x1

    .line 308
    .line 309
    aput-byte v12, v2, v6

    .line 310
    .line 311
    move v6, v1

    .line 312
    :cond_b
    add-int/lit8 v1, v6, 0x1

    .line 313
    .line 314
    aput-byte v14, v2, v6

    .line 315
    .line 316
    :goto_5
    move v8, v1

    .line 317
    goto/16 :goto_8

    .line 318
    .line 319
    :cond_c
    move v8, v6

    .line 320
    goto/16 :goto_8

    .line 321
    .line 322
    :cond_d
    sub-int v10, v11, v6

    .line 323
    .line 324
    add-int/lit8 v4, v4, -0x2

    .line 325
    .line 326
    if-ne v10, v4, :cond_13

    .line 327
    .line 328
    if-le v6, v9, :cond_e

    .line 329
    .line 330
    iget-object v4, v0, Ll/te2$b;->c:[B

    .line 331
    .line 332
    aget-byte v4, v4, v7

    .line 333
    .line 334
    move v7, v9

    .line 335
    goto :goto_6

    .line 336
    :cond_e
    add-int/lit8 v4, v11, 0x1

    .line 337
    .line 338
    aget-byte v5, p1, v11

    .line 339
    .line 340
    move v11, v4

    .line 341
    move v4, v5

    .line 342
    :goto_6
    and-int/lit16 v4, v4, 0xff

    .line 343
    .line 344
    shl-int/2addr v4, v14

    .line 345
    if-lez v6, :cond_f

    .line 346
    .line 347
    iget-object v5, v0, Ll/te2$b;->c:[B

    .line 348
    .line 349
    add-int/lit8 v10, v7, 0x1

    .line 350
    .line 351
    aget-byte v5, v5, v7

    .line 352
    .line 353
    move v7, v10

    .line 354
    goto :goto_7

    .line 355
    :cond_f
    aget-byte v5, p1, v11

    .line 356
    .line 357
    :goto_7
    and-int/lit16 v5, v5, 0xff

    .line 358
    .line 359
    shl-int/lit8 v5, v5, 0x2

    .line 360
    .line 361
    or-int/2addr v4, v5

    .line 362
    sub-int/2addr v6, v7

    .line 363
    iput v6, v0, Ll/te2$b;->d:I

    .line 364
    .line 365
    add-int/lit8 v5, v8, 0x1

    .line 366
    .line 367
    shr-int/lit8 v6, v4, 0xc

    .line 368
    .line 369
    and-int/lit8 v6, v6, 0x3f

    .line 370
    .line 371
    aget-byte v6, v1, v6

    .line 372
    .line 373
    aput-byte v6, v2, v8

    .line 374
    .line 375
    add-int/lit8 v6, v8, 0x2

    .line 376
    .line 377
    shr-int/lit8 v7, v4, 0x6

    .line 378
    .line 379
    and-int/lit8 v7, v7, 0x3f

    .line 380
    .line 381
    aget-byte v7, v1, v7

    .line 382
    .line 383
    aput-byte v7, v2, v5

    .line 384
    .line 385
    add-int/lit8 v5, v8, 0x3

    .line 386
    .line 387
    and-int/lit8 v4, v4, 0x3f

    .line 388
    .line 389
    aget-byte v1, v1, v4

    .line 390
    .line 391
    aput-byte v1, v2, v6

    .line 392
    .line 393
    iget-boolean v1, v0, Ll/te2$b;->f:Z

    .line 394
    .line 395
    if-eqz v1, :cond_10

    .line 396
    .line 397
    add-int/lit8 v8, v8, 0x4

    .line 398
    .line 399
    aput-byte v16, v2, v5

    .line 400
    .line 401
    move v5, v8

    .line 402
    :cond_10
    iget-boolean v1, v0, Ll/te2$b;->g:Z

    .line 403
    .line 404
    if-eqz v1, :cond_12

    .line 405
    .line 406
    iget-boolean v1, v0, Ll/te2$b;->h:Z

    .line 407
    .line 408
    if-eqz v1, :cond_11

    .line 409
    .line 410
    add-int/lit8 v1, v5, 0x1

    .line 411
    .line 412
    aput-byte v12, v2, v5

    .line 413
    .line 414
    move v5, v1

    .line 415
    :cond_11
    add-int/lit8 v1, v5, 0x1

    .line 416
    .line 417
    aput-byte v14, v2, v5

    .line 418
    .line 419
    goto :goto_5

    .line 420
    :cond_12
    move v8, v5

    .line 421
    goto :goto_8

    .line 422
    :cond_13
    iget-boolean v1, v0, Ll/te2$b;->g:Z

    .line 423
    .line 424
    if-eqz v1, :cond_17

    .line 425
    .line 426
    if-lez v8, :cond_17

    .line 427
    .line 428
    if-eq v3, v5, :cond_17

    .line 429
    .line 430
    iget-boolean v1, v0, Ll/te2$b;->h:Z

    .line 431
    .line 432
    if-eqz v1, :cond_14

    .line 433
    .line 434
    add-int/lit8 v1, v8, 0x1

    .line 435
    .line 436
    aput-byte v12, v2, v8

    .line 437
    .line 438
    move v8, v1

    .line 439
    :cond_14
    add-int/lit8 v1, v8, 0x1

    .line 440
    .line 441
    aput-byte v14, v2, v8

    .line 442
    .line 443
    goto :goto_5

    .line 444
    :cond_15
    add-int/lit8 v1, v4, -0x1

    .line 445
    .line 446
    if-ne v11, v1, :cond_16

    .line 447
    .line 448
    iget-object v1, v0, Ll/te2$b;->c:[B

    .line 449
    .line 450
    iget v2, v0, Ll/te2$b;->d:I

    .line 451
    .line 452
    add-int/lit8 v4, v2, 0x1

    .line 453
    .line 454
    iput v4, v0, Ll/te2$b;->d:I

    .line 455
    .line 456
    aget-byte v4, p1, v11

    .line 457
    .line 458
    aput-byte v4, v1, v2

    .line 459
    .line 460
    goto :goto_8

    .line 461
    :cond_16
    add-int/lit8 v4, v4, -0x2

    .line 462
    .line 463
    if-ne v11, v4, :cond_17

    .line 464
    .line 465
    iget-object v1, v0, Ll/te2$b;->c:[B

    .line 466
    .line 467
    iget v2, v0, Ll/te2$b;->d:I

    .line 468
    .line 469
    add-int/lit8 v4, v2, 0x1

    .line 470
    .line 471
    iput v4, v0, Ll/te2$b;->d:I

    .line 472
    .line 473
    aget-byte v5, p1, v11

    .line 474
    .line 475
    aput-byte v5, v1, v2

    .line 476
    .line 477
    add-int/lit8 v2, v2, 0x2

    .line 478
    .line 479
    iput v2, v0, Ll/te2$b;->d:I

    .line 480
    .line 481
    add-int/2addr v11, v9

    .line 482
    aget-byte v2, p1, v11

    .line 483
    .line 484
    aput-byte v2, v1, v4

    .line 485
    .line 486
    :cond_17
    :goto_8
    iput v8, v0, Ll/te2$a;->b:I

    .line 487
    .line 488
    iput v3, v0, Ll/te2$b;->e:I

    .line 489
    .line 490
    return v9
.end method
