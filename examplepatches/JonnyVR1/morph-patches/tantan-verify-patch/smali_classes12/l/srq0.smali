.class public abstract Ll/srq0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(B)I
    .locals 1

    .line 1
    shr-int/lit8 v0, p0, 0x4

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0xf

    .line 4
    .line 5
    and-int/lit8 p0, p0, 0xf

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x10

    .line 8
    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public static b([BIII)Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    const-string v0, "MD5"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz p3, :cond_8

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p3, v0, :cond_7

    .line 10
    .line 11
    const/4 v4, 0x4

    .line 12
    if-eq p3, v4, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    array-length p3, p0

    .line 16
    if-nez p3, :cond_1

    .line 17
    .line 18
    move-object v6, v1

    .line 19
    goto :goto_3

    .line 20
    :cond_1
    rem-int/lit8 v4, p3, 0x3

    .line 21
    .line 22
    if-eqz v4, :cond_2

    .line 23
    .line 24
    move v4, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    move v4, v2

    .line 27
    :goto_0
    div-int/2addr p3, v0

    .line 28
    add-int/2addr p3, v4

    .line 29
    new-array v0, p3, [I

    .line 30
    .line 31
    const/high16 v5, -0x1000000

    .line 32
    .line 33
    if-nez v4, :cond_3

    .line 34
    .line 35
    :goto_1
    if-ge v2, p3, :cond_5

    .line 36
    .line 37
    mul-int/lit8 v3, v2, 0x3

    .line 38
    .line 39
    aget-byte v4, p0, v3

    .line 40
    .line 41
    invoke-static {v4}, Ll/srq0;->a(B)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    add-int/lit8 v6, v3, 0x1

    .line 46
    .line 47
    aget-byte v6, p0, v6

    .line 48
    .line 49
    invoke-static {v6}, Ll/srq0;->a(B)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    add-int/lit8 v3, v3, 0x2

    .line 54
    .line 55
    aget-byte v3, p0, v3

    .line 56
    .line 57
    invoke-static {v3}, Ll/srq0;->a(B)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    shl-int/lit8 v4, v4, 0x10

    .line 62
    .line 63
    shl-int/lit8 v6, v6, 0x8

    .line 64
    .line 65
    or-int/2addr v4, v6

    .line 66
    or-int/2addr v3, v4

    .line 67
    or-int/2addr v3, v5

    .line 68
    aput v3, v0, v2

    .line 69
    .line 70
    add-int/lit8 v2, v2, 0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    :goto_2
    add-int/lit8 v4, p3, -0x1

    .line 74
    .line 75
    if-ge v2, v4, :cond_4

    .line 76
    .line 77
    mul-int/lit8 v4, v2, 0x3

    .line 78
    .line 79
    aget-byte v6, p0, v4

    .line 80
    .line 81
    invoke-static {v6}, Ll/srq0;->a(B)I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    add-int/lit8 v7, v4, 0x1

    .line 86
    .line 87
    aget-byte v7, p0, v7

    .line 88
    .line 89
    invoke-static {v7}, Ll/srq0;->a(B)I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    add-int/lit8 v4, v4, 0x2

    .line 94
    .line 95
    aget-byte v4, p0, v4

    .line 96
    .line 97
    invoke-static {v4}, Ll/srq0;->a(B)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    shl-int/lit8 v6, v6, 0x10

    .line 102
    .line 103
    shl-int/lit8 v7, v7, 0x8

    .line 104
    .line 105
    or-int/2addr v6, v7

    .line 106
    or-int/2addr v4, v6

    .line 107
    or-int/2addr v4, v5

    .line 108
    aput v4, v0, v2

    .line 109
    .line 110
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    aput v5, v0, v4

    .line 114
    .line 115
    :cond_5
    move-object v6, v0

    .line 116
    :goto_3
    if-nez v6, :cond_6

    .line 117
    .line 118
    return-object v1

    .line 119
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string p3, "RGBBytes2Bitmap colors length"

    .line 122
    .line 123
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    array-length p3, v6

    .line 127
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string p3, "  width:"

    .line 131
    .line 132
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string p3, "  height:"

    .line 139
    .line 140
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {p0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 154
    .line 155
    const/4 v7, 0x0

    .line 156
    move v9, p1

    .line 157
    move v8, p1

    .line 158
    move v10, p2

    .line 159
    invoke-static/range {v6 .. v11}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0

    .line 164
    :cond_7
    move v6, p1

    .line 165
    move v7, p2

    .line 166
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 167
    .line 168
    invoke-static {v6, v7, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p1, p0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 177
    .line 178
    .line 179
    return-object p1

    .line 180
    :cond_8
    move v6, p1

    .line 181
    move v7, p2

    .line 182
    new-instance p1, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    :try_start_0
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 188
    .line 189
    .line 190
    move-result-object p2
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :try_start_1
    invoke-virtual {p2, p0}, Ljava/security/MessageDigest;->update([B)V
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    .line 192
    .line 193
    .line 194
    goto :goto_4

    .line 195
    :catch_0
    move-object p2, v1

    .line 196
    :catch_1
    :goto_4
    const-string p3, "%02X"

    .line 197
    .line 198
    if-eqz p2, :cond_9

    .line 199
    .line 200
    invoke-virtual {p2}, Ljava/security/MessageDigest;->digest()[B

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    array-length v4, p2

    .line 205
    move v5, v2

    .line 206
    :goto_5
    if-ge v5, v4, :cond_9

    .line 207
    .line 208
    aget-byte v8, p2, v5

    .line 209
    .line 210
    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 211
    .line 212
    .line 213
    move-result-object v8

    .line 214
    filled-new-array {v8}, [Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    invoke-static {p3, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v8

    .line 222
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    add-int/lit8 v5, v5, 0x1

    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_9
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    move p2, v2

    .line 237
    :goto_6
    sget-object v4, Ll/rxk;->b:Ljava/util/List;

    .line 238
    .line 239
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    if-ge p2, v4, :cond_a

    .line 244
    .line 245
    sget-object v4, Ll/rxk;->b:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    check-cast v4, Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    if-eq v4, v3, :cond_b

    .line 258
    .line 259
    add-int/lit8 p2, p2, 0x1

    .line 260
    .line 261
    goto :goto_6

    .line 262
    :cond_a
    sget-object p1, Ll/rxk;->d:Ljava/util/List;

    .line 263
    .line 264
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    :cond_b
    new-instance v3, Landroid/graphics/YuvImage;

    .line 272
    .line 273
    const/16 v5, 0x11

    .line 274
    .line 275
    const/4 v8, 0x0

    .line 276
    move-object v4, p0

    .line 277
    invoke-direct/range {v3 .. v8}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 278
    .line 279
    .line 280
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    .line 281
    .line 282
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 283
    .line 284
    .line 285
    new-instance p1, Landroid/graphics/Rect;

    .line 286
    .line 287
    invoke-direct {p1, v2, v2, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 288
    .line 289
    .line 290
    const/16 p2, 0x64

    .line 291
    .line 292
    invoke-virtual {v3, p1, p2, p0}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 293
    .line 294
    .line 295
    :try_start_2
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    array-length p1, p0

    .line 300
    invoke-static {p0, v2, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 301
    .line 302
    .line 303
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_2

    .line 304
    goto :goto_7

    .line 305
    :catch_2
    move-object p0, v1

    .line 306
    :goto_7
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    new-instance p2, Ljava/lang/StringBuilder;

    .line 315
    .line 316
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 317
    .line 318
    .line 319
    :try_start_3
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    invoke-virtual {v1, p1}, Ljava/security/MessageDigest;->update([B)V
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_3

    .line 328
    .line 329
    .line 330
    :catch_3
    if-eqz v1, :cond_c

    .line 331
    .line 332
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    array-length v0, p1

    .line 337
    :goto_8
    if-ge v2, v0, :cond_c

    .line 338
    .line 339
    aget-byte v1, p1, v2

    .line 340
    .line 341
    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    invoke-static {p3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    add-int/lit8 v2, v2, 0x1

    .line 357
    .line 358
    goto :goto_8

    .line 359
    :cond_c
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    sget-object p2, Ll/rxk;->b:Ljava/util/List;

    .line 368
    .line 369
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    return-object p0
.end method
