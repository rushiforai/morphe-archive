.class public final Lokio/Options$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokio/Options;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002JT\u0010\u0008\u001a\u00020\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\r2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\r2\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000fH\u0002J!\u0010\u0014\u001a\u00020\u00152\u0012\u0010\u000e\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00100\u0016\"\u00020\u0010H\u0007\u00a2\u0006\u0002\u0010\u0017R\u0018\u0010\u0003\u001a\u00020\u0004*\u00020\u00058BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0018"
    }
    d2 = {
        "Lokio/Options$Companion;",
        "",
        "()V",
        "intCount",
        "",
        "Lokio/Buffer;",
        "getIntCount",
        "(Lokio/Buffer;)J",
        "buildTrieRecursive",
        "",
        "nodeOffset",
        "node",
        "byteStringOffset",
        "",
        "byteStrings",
        "",
        "Lokio/ByteString;",
        "fromIndex",
        "toIndex",
        "indexes",
        "of",
        "Lokio/Options;",
        "",
        "([Lokio/ByteString;)Lokio/Options;",
        "jvm"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lokio/Options$Companion;-><init>()V

    return-void
.end method

.method private final buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lokio/Buffer;",
            "I",
            "Ljava/util/List<",
            "+",
            "Lokio/ByteString;",
            ">;II",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p3

    .line 4
    .line 5
    move/from16 v10, p4

    .line 6
    .line 7
    move-object/from16 v5, p5

    .line 8
    .line 9
    move/from16 v1, p6

    .line 10
    .line 11
    move/from16 v11, p7

    .line 12
    .line 13
    move-object/from16 v8, p8

    .line 14
    .line 15
    const-string v2, "Failed requirement."

    .line 16
    .line 17
    if-ge v1, v11, :cond_12

    .line 18
    .line 19
    move v3, v1

    .line 20
    :goto_0
    if-ge v3, v11, :cond_1

    .line 21
    .line 22
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Lokio/ByteString;

    .line 27
    .line 28
    invoke-virtual {v4}, Lokio/ByteString;->size()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-lt v4, v10, :cond_0

    .line 33
    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-interface/range {p5 .. p6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lokio/ByteString;

    .line 46
    .line 47
    add-int/lit8 v3, v11, -0x1

    .line 48
    .line 49
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lokio/ByteString;

    .line 54
    .line 55
    invoke-virtual {v2}, Lokio/ByteString;->size()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    const/4 v12, -0x1

    .line 60
    if-ne v10, v4, :cond_2

    .line 61
    .line 62
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ljava/lang/Number;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Lokio/ByteString;

    .line 79
    .line 80
    move v6, v1

    .line 81
    move v1, v2

    .line 82
    move-object v2, v4

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    move v6, v1

    .line 85
    move v1, v12

    .line 86
    :goto_1
    invoke-virtual {v2, v10}, Lokio/ByteString;->getByte(I)B

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    invoke-virtual {v3, v10}, Lokio/ByteString;->getByte(I)B

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    const-wide/16 v13, 0x2

    .line 95
    .line 96
    if-eq v4, v7, :cond_c

    .line 97
    .line 98
    add-int/lit8 v2, v6, 0x1

    .line 99
    .line 100
    const/4 v3, 0x1

    .line 101
    :goto_2
    if-ge v2, v11, :cond_4

    .line 102
    .line 103
    add-int/lit8 v4, v2, -0x1

    .line 104
    .line 105
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Lokio/ByteString;

    .line 110
    .line 111
    invoke-virtual {v4, v10}, Lokio/ByteString;->getByte(I)B

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    check-cast v7, Lokio/ByteString;

    .line 120
    .line 121
    invoke-virtual {v7, v10}, Lokio/ByteString;->getByte(I)B

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eq v4, v7, :cond_3

    .line 126
    .line 127
    add-int/lit8 v3, v3, 0x1

    .line 128
    .line 129
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    invoke-direct {v0, v9}, Lokio/Options$Companion;->getIntCount(Lokio/Buffer;)J

    .line 133
    .line 134
    .line 135
    move-result-wide v15

    .line 136
    add-long v15, p1, v15

    .line 137
    .line 138
    add-long/2addr v15, v13

    .line 139
    mul-int/lit8 v2, v3, 0x2

    .line 140
    .line 141
    int-to-long v13, v2

    .line 142
    add-long/2addr v15, v13

    .line 143
    invoke-virtual {v9, v3}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v9, v1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 147
    .line 148
    .line 149
    move v1, v6

    .line 150
    :goto_3
    if-ge v1, v11, :cond_7

    .line 151
    .line 152
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Lokio/ByteString;

    .line 157
    .line 158
    invoke-virtual {v2, v10}, Lokio/ByteString;->getByte(I)B

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eq v1, v6, :cond_5

    .line 163
    .line 164
    add-int/lit8 v3, v1, -0x1

    .line 165
    .line 166
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Lokio/ByteString;

    .line 171
    .line 172
    invoke-virtual {v3, v10}, Lokio/ByteString;->getByte(I)B

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eq v2, v3, :cond_6

    .line 177
    .line 178
    :cond_5
    and-int/lit16 v2, v2, 0xff

    .line 179
    .line 180
    invoke-virtual {v9, v2}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 181
    .line 182
    .line 183
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_7
    new-instance v3, Lokio/Buffer;

    .line 187
    .line 188
    invoke-direct {v3}, Lokio/Buffer;-><init>()V

    .line 189
    .line 190
    .line 191
    :goto_4
    if-ge v6, v11, :cond_b

    .line 192
    .line 193
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    check-cast v1, Lokio/ByteString;

    .line 198
    .line 199
    invoke-virtual {v1, v10}, Lokio/ByteString;->getByte(I)B

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    add-int/lit8 v2, v6, 0x1

    .line 204
    .line 205
    move v4, v2

    .line 206
    :goto_5
    if-ge v4, v11, :cond_9

    .line 207
    .line 208
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    check-cast v7, Lokio/ByteString;

    .line 213
    .line 214
    invoke-virtual {v7, v10}, Lokio/ByteString;->getByte(I)B

    .line 215
    .line 216
    .line 217
    move-result v7

    .line 218
    if-eq v1, v7, :cond_8

    .line 219
    .line 220
    move v7, v4

    .line 221
    goto :goto_6

    .line 222
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 223
    .line 224
    goto :goto_5

    .line 225
    :cond_9
    move v7, v11

    .line 226
    :goto_6
    if-ne v2, v7, :cond_a

    .line 227
    .line 228
    add-int/lit8 v1, v10, 0x1

    .line 229
    .line 230
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    check-cast v2, Lokio/ByteString;

    .line 235
    .line 236
    invoke-virtual {v2}, Lokio/ByteString;->size()I

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    if-ne v1, v2, :cond_a

    .line 241
    .line 242
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    check-cast v1, Ljava/lang/Number;

    .line 247
    .line 248
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-virtual {v9, v1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 253
    .line 254
    .line 255
    move-wide v1, v15

    .line 256
    goto :goto_7

    .line 257
    :cond_a
    invoke-direct {v0, v3}, Lokio/Options$Companion;->getIntCount(Lokio/Buffer;)J

    .line 258
    .line 259
    .line 260
    move-result-wide v1

    .line 261
    add-long/2addr v1, v15

    .line 262
    long-to-int v1, v1

    .line 263
    mul-int/2addr v1, v12

    .line 264
    invoke-virtual {v9, v1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 265
    .line 266
    .line 267
    add-int/lit8 v4, v10, 0x1

    .line 268
    .line 269
    move-wide v1, v15

    .line 270
    invoke-direct/range {v0 .. v8}, Lokio/Options$Companion;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 271
    .line 272
    .line 273
    :goto_7
    move-wide v15, v1

    .line 274
    move v6, v7

    .line 275
    goto :goto_4

    .line 276
    :cond_b
    invoke-virtual {v9, v3}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_c
    invoke-virtual {v2}, Lokio/ByteString;->size()I

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    invoke-virtual {v3}, Lokio/ByteString;->size()I

    .line 285
    .line 286
    .line 287
    move-result v7

    .line 288
    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    const/4 v7, 0x0

    .line 293
    move v15, v10

    .line 294
    :goto_8
    move/from16 v16, v12

    .line 295
    .line 296
    if-ge v15, v4, :cond_d

    .line 297
    .line 298
    invoke-virtual {v2, v15}, Lokio/ByteString;->getByte(I)B

    .line 299
    .line 300
    .line 301
    move-result v12

    .line 302
    move-wide/from16 v17, v13

    .line 303
    .line 304
    invoke-virtual {v3, v15}, Lokio/ByteString;->getByte(I)B

    .line 305
    .line 306
    .line 307
    move-result v13

    .line 308
    if-ne v12, v13, :cond_e

    .line 309
    .line 310
    add-int/lit8 v7, v7, 0x1

    .line 311
    .line 312
    add-int/lit8 v15, v15, 0x1

    .line 313
    .line 314
    move/from16 v12, v16

    .line 315
    .line 316
    move-wide/from16 v13, v17

    .line 317
    .line 318
    goto :goto_8

    .line 319
    :cond_d
    move-wide/from16 v17, v13

    .line 320
    .line 321
    :cond_e
    invoke-direct {v0, v9}, Lokio/Options$Companion;->getIntCount(Lokio/Buffer;)J

    .line 322
    .line 323
    .line 324
    move-result-wide v3

    .line 325
    add-long v3, p1, v3

    .line 326
    .line 327
    add-long v3, v3, v17

    .line 328
    .line 329
    int-to-long v12, v7

    .line 330
    add-long/2addr v3, v12

    .line 331
    const-wide/16 v12, 0x1

    .line 332
    .line 333
    add-long/2addr v3, v12

    .line 334
    neg-int v12, v7

    .line 335
    invoke-virtual {v9, v12}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v9, v1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 339
    .line 340
    .line 341
    add-int v1, v10, v7

    .line 342
    .line 343
    :goto_9
    if-ge v10, v1, :cond_f

    .line 344
    .line 345
    invoke-virtual {v2, v10}, Lokio/ByteString;->getByte(I)B

    .line 346
    .line 347
    .line 348
    move-result v7

    .line 349
    and-int/lit16 v7, v7, 0xff

    .line 350
    .line 351
    invoke-virtual {v9, v7}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 352
    .line 353
    .line 354
    add-int/lit8 v10, v10, 0x1

    .line 355
    .line 356
    goto :goto_9

    .line 357
    :cond_f
    add-int/lit8 v2, v6, 0x1

    .line 358
    .line 359
    if-ne v2, v11, :cond_11

    .line 360
    .line 361
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    check-cast v0, Lokio/ByteString;

    .line 366
    .line 367
    invoke-virtual {v0}, Lokio/ByteString;->size()I

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    if-ne v1, v0, :cond_10

    .line 372
    .line 373
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    check-cast v0, Ljava/lang/Number;

    .line 378
    .line 379
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    invoke-virtual {v9, v0}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 384
    .line 385
    .line 386
    return-void

    .line 387
    :cond_10
    const-string v0, "Check failed."

    .line 388
    .line 389
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    return-void

    .line 393
    :cond_11
    move-wide/from16 v19, v3

    .line 394
    .line 395
    move v4, v1

    .line 396
    move-wide/from16 v1, v19

    .line 397
    .line 398
    new-instance v3, Lokio/Buffer;

    .line 399
    .line 400
    invoke-direct {v3}, Lokio/Buffer;-><init>()V

    .line 401
    .line 402
    .line 403
    invoke-direct {v0, v3}, Lokio/Options$Companion;->getIntCount(Lokio/Buffer;)J

    .line 404
    .line 405
    .line 406
    move-result-wide v12

    .line 407
    add-long/2addr v12, v1

    .line 408
    long-to-int v7, v12

    .line 409
    mul-int/lit8 v7, v7, -0x1

    .line 410
    .line 411
    invoke-virtual {v9, v7}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 412
    .line 413
    .line 414
    move v7, v11

    .line 415
    invoke-direct/range {v0 .. v8}, Lokio/Options$Companion;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v9, v3}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 419
    .line 420
    .line 421
    return-void

    .line 422
    :cond_12
    invoke-static {v2}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    return-void
.end method

.method public static bridge synthetic buildTrieRecursive$default(Lokio/Options$Companion;JLokio/Buffer;ILjava/util/List;IILjava/util/List;ILjava/lang/Object;)V
    .locals 9

    .line 1
    and-int/lit8 v0, p9, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 p1, 0x0

    .line 6
    .line 7
    :cond_0
    move-wide v1, p1

    .line 8
    and-int/lit8 p1, p9, 0x4

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    move v4, p2

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    move v4, p4

    .line 16
    :goto_0
    and-int/lit8 p1, p9, 0x10

    .line 17
    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    move v6, p2

    .line 21
    goto :goto_1

    .line 22
    :cond_2
    move v6, p6

    .line 23
    :goto_1
    and-int/lit8 p1, p9, 0x20

    .line 24
    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    move v7, p1

    .line 32
    :goto_2
    move-object v0, p0

    .line 33
    move-object v3, p3

    .line 34
    move-object v5, p5

    .line 35
    move-object/from16 v8, p8

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_3
    move/from16 v7, p7

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :goto_3
    invoke-direct/range {v0 .. v8}, Lokio/Options$Companion;->buildTrieRecursive(JLokio/Buffer;ILjava/util/List;IILjava/util/List;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private final getIntCount(Lokio/Buffer;)J
    .locals 2
    .param p1    # Lokio/Buffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x4

    .line 6
    .line 7
    div-long/2addr p0, v0

    .line 8
    return-wide p0
.end method


# virtual methods
.method public final varargs of([Lokio/ByteString;)Lokio/Options;
    .locals 16
    .param p1    # [Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    array-length v1, v0

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, -0x1

    .line 9
    const/4 v4, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v0, Lokio/Options;

    .line 13
    .line 14
    new-array v1, v4, [Lokio/ByteString;

    .line 15
    .line 16
    filled-new-array {v4, v3}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v0, v1, v3, v2}, Lokio/Options;-><init>([Lokio/ByteString;[ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    invoke-static {v0}, Lkotlin/collections/ArraysKt;->toMutableList([Ljava/lang/Object;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->sort(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    array-length v6, v0

    .line 34
    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 35
    .line 36
    .line 37
    array-length v6, v0

    .line 38
    move v7, v4

    .line 39
    :goto_0
    if-ge v7, v6, :cond_1

    .line 40
    .line 41
    aget-object v8, v0, v7

    .line 42
    .line 43
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v8

    .line 47
    invoke-interface {v1, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    add-int/lit8 v7, v7, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    new-array v3, v4, [Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-interface {v1, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_a

    .line 60
    .line 61
    check-cast v1, [Ljava/lang/Integer;

    .line 62
    .line 63
    array-length v3, v1

    .line 64
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, [Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v13

    .line 74
    array-length v1, v0

    .line 75
    move v3, v4

    .line 76
    move v11, v3

    .line 77
    :goto_1
    if-ge v3, v1, :cond_2

    .line 78
    .line 79
    aget-object v6, v0, v3

    .line 80
    .line 81
    add-int/lit8 v12, v11, 0x1

    .line 82
    .line 83
    const/4 v9, 0x6

    .line 84
    const/4 v10, 0x0

    .line 85
    const/4 v7, 0x0

    .line 86
    const/4 v8, 0x0

    .line 87
    invoke-static/range {v5 .. v10}, Lkotlin/collections/CollectionsKt;->binarySearch$default(Ljava/util/List;Ljava/lang/Comparable;IIILjava/lang/Object;)I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-interface {v13, v6, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    add-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    move v11, v12

    .line 101
    goto :goto_1

    .line 102
    :cond_2
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lokio/ByteString;

    .line 107
    .line 108
    invoke-virtual {v1}, Lokio/ByteString;->size()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-lez v1, :cond_9

    .line 113
    .line 114
    move v1, v4

    .line 115
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-ge v1, v3, :cond_7

    .line 120
    .line 121
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Lokio/ByteString;

    .line 126
    .line 127
    add-int/lit8 v6, v1, 0x1

    .line 128
    .line 129
    move v7, v6

    .line 130
    :goto_3
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    if-ge v7, v8, :cond_6

    .line 135
    .line 136
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    check-cast v8, Lokio/ByteString;

    .line 141
    .line 142
    invoke-virtual {v8, v3}, Lokio/ByteString;->startsWith(Lokio/ByteString;)Z

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    if-nez v9, :cond_3

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_3
    invoke-virtual {v8}, Lokio/ByteString;->size()I

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    invoke-virtual {v3}, Lokio/ByteString;->size()I

    .line 154
    .line 155
    .line 156
    move-result v10

    .line 157
    if-eq v9, v10, :cond_5

    .line 158
    .line 159
    invoke-interface {v13, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v8

    .line 163
    check-cast v8, Ljava/lang/Number;

    .line 164
    .line 165
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    check-cast v9, Ljava/lang/Number;

    .line 174
    .line 175
    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    if-le v8, v9, :cond_4

    .line 180
    .line 181
    invoke-interface {v5, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    invoke-interface {v13, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_5
    const-string v0, "duplicate option: "

    .line 192
    .line 193
    invoke-static {v0, v8}, Ll/t560;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    return-object v2

    .line 197
    :cond_6
    :goto_4
    move v1, v6

    .line 198
    goto :goto_2

    .line 199
    :cond_7
    new-instance v8, Lokio/Buffer;

    .line 200
    .line 201
    invoke-direct {v8}, Lokio/Buffer;-><init>()V

    .line 202
    .line 203
    .line 204
    const/16 v14, 0x35

    .line 205
    .line 206
    const/4 v15, 0x0

    .line 207
    const-wide/16 v6, 0x0

    .line 208
    .line 209
    const/4 v9, 0x0

    .line 210
    const/4 v11, 0x0

    .line 211
    const/4 v12, 0x0

    .line 212
    move-object v10, v5

    .line 213
    move-object/from16 v5, p0

    .line 214
    .line 215
    invoke-static/range {v5 .. v15}, Lokio/Options$Companion;->buildTrieRecursive$default(Lokio/Options$Companion;JLokio/Buffer;ILjava/util/List;IILjava/util/List;ILjava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    invoke-direct {v5, v8}, Lokio/Options$Companion;->getIntCount(Lokio/Buffer;)J

    .line 219
    .line 220
    .line 221
    move-result-wide v5

    .line 222
    long-to-int v1, v5

    .line 223
    new-array v1, v1, [I

    .line 224
    .line 225
    :goto_5
    invoke-virtual {v8}, Lokio/Buffer;->exhausted()Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-nez v3, :cond_8

    .line 230
    .line 231
    add-int/lit8 v3, v4, 0x1

    .line 232
    .line 233
    invoke-virtual {v8}, Lokio/Buffer;->readInt()I

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    aput v5, v1, v4

    .line 238
    .line 239
    move v4, v3

    .line 240
    goto :goto_5

    .line 241
    :cond_8
    new-instance v3, Lokio/Options;

    .line 242
    .line 243
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, [Lokio/ByteString;

    .line 248
    .line 249
    invoke-direct {v3, v0, v1, v2}, Lokio/Options;-><init>([Lokio/ByteString;[ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 250
    .line 251
    .line 252
    return-object v3

    .line 253
    :cond_9
    const-string v0, "the empty byte string is not a supported option"

    .line 254
    .line 255
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    return-object v2

    .line 259
    :cond_a
    const-string v0, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 260
    .line 261
    invoke-static {v0}, Lb;->a(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    return-object v2
.end method
