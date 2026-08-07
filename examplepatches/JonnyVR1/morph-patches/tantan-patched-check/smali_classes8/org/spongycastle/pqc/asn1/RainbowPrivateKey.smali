.class public Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# instance fields
.field private b1:[B

.field private b2:[B

.field private invA1:[[B

.field private invA2:[[B

.field private layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

.field private oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;

.field private vi:[B


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    instance-of v3, v3, Lorg/spongycastle/asn1/ASN1Integer;

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iput-object v3, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iput-object v3, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    .line 38
    :goto_0
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 44
    .line 45
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    new-array v5, v5, [[B

    .line 50
    .line 51
    iput-object v5, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA1:[[B

    .line 52
    .line 53
    move v5, v2

    .line 54
    :goto_1
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-ge v5, v6, :cond_1

    .line 59
    .line 60
    iget-object v6, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA1:[[B

    .line 61
    .line 62
    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    check-cast v7, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 67
    .line 68
    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    aput-object v7, v6, v5

    .line 73
    .line 74
    add-int/lit8 v5, v5, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    const/4 v4, 0x2

    .line 78
    invoke-virtual {v1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    check-cast v5, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 83
    .line 84
    invoke-virtual {v5, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 89
    .line 90
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    iput-object v5, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b1:[B

    .line 95
    .line 96
    const/4 v5, 0x3

    .line 97
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    check-cast v6, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 102
    .line 103
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    new-array v7, v7, [[B

    .line 108
    .line 109
    iput-object v7, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA2:[[B

    .line 110
    .line 111
    move v7, v2

    .line 112
    :goto_2
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    if-ge v7, v8, :cond_2

    .line 117
    .line 118
    iget-object v8, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA2:[[B

    .line 119
    .line 120
    invoke-virtual {v6, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    check-cast v9, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 125
    .line 126
    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    aput-object v9, v8, v7

    .line 131
    .line 132
    add-int/lit8 v7, v7, 0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_2
    const/4 v6, 0x4

    .line 136
    invoke-virtual {v1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    check-cast v6, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 141
    .line 142
    invoke-virtual {v6, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    check-cast v6, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 147
    .line 148
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    iput-object v6, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b2:[B

    .line 153
    .line 154
    const/4 v6, 0x5

    .line 155
    invoke-virtual {v1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    check-cast v6, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 160
    .line 161
    invoke-virtual {v6, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    check-cast v6, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 166
    .line 167
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    iput-object v6, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 172
    .line 173
    const/4 v6, 0x6

    .line 174
    invoke-virtual {v1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 179
    .line 180
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    new-array v6, v6, [[[[B

    .line 185
    .line 186
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    new-array v7, v7, [[[[B

    .line 191
    .line 192
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 193
    .line 194
    .line 195
    move-result v8

    .line 196
    new-array v8, v8, [[[B

    .line 197
    .line 198
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 199
    .line 200
    .line 201
    move-result v9

    .line 202
    new-array v9, v9, [[B

    .line 203
    .line 204
    move v10, v2

    .line 205
    :goto_3
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 206
    .line 207
    .line 208
    move-result v11

    .line 209
    if-ge v10, v11, :cond_8

    .line 210
    .line 211
    invoke-virtual {v1, v10}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 212
    .line 213
    .line 214
    move-result-object v11

    .line 215
    check-cast v11, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 216
    .line 217
    invoke-virtual {v11, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 218
    .line 219
    .line 220
    move-result-object v12

    .line 221
    check-cast v12, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 222
    .line 223
    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 224
    .line 225
    .line 226
    move-result v13

    .line 227
    new-array v13, v13, [[[B

    .line 228
    .line 229
    aput-object v13, v6, v10

    .line 230
    .line 231
    move v13, v2

    .line 232
    :goto_4
    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 233
    .line 234
    .line 235
    move-result v14

    .line 236
    if-ge v13, v14, :cond_4

    .line 237
    .line 238
    invoke-virtual {v12, v13}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 239
    .line 240
    .line 241
    move-result-object v14

    .line 242
    check-cast v14, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 243
    .line 244
    aget-object v15, v6, v10

    .line 245
    .line 246
    invoke-virtual {v14}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    new-array v2, v2, [[B

    .line 251
    .line 252
    aput-object v2, v15, v13

    .line 253
    .line 254
    const/4 v2, 0x0

    .line 255
    :goto_5
    invoke-virtual {v14}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 256
    .line 257
    .line 258
    move-result v15

    .line 259
    if-ge v2, v15, :cond_3

    .line 260
    .line 261
    aget-object v15, v6, v10

    .line 262
    .line 263
    aget-object v15, v15, v13

    .line 264
    .line 265
    invoke-virtual {v14, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 266
    .line 267
    .line 268
    move-result-object v17

    .line 269
    check-cast v17, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 270
    .line 271
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 272
    .line 273
    .line 274
    move-result-object v17

    .line 275
    aput-object v17, v15, v2

    .line 276
    .line 277
    add-int/lit8 v2, v2, 0x1

    .line 278
    .line 279
    goto :goto_5

    .line 280
    :cond_3
    add-int/lit8 v13, v13, 0x1

    .line 281
    .line 282
    const/4 v2, 0x0

    .line 283
    goto :goto_4

    .line 284
    :cond_4
    invoke-virtual {v11, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    check-cast v2, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 289
    .line 290
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 291
    .line 292
    .line 293
    move-result v12

    .line 294
    new-array v12, v12, [[[B

    .line 295
    .line 296
    aput-object v12, v7, v10

    .line 297
    .line 298
    const/4 v12, 0x0

    .line 299
    :goto_6
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 300
    .line 301
    .line 302
    move-result v13

    .line 303
    if-ge v12, v13, :cond_6

    .line 304
    .line 305
    invoke-virtual {v2, v12}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 306
    .line 307
    .line 308
    move-result-object v13

    .line 309
    check-cast v13, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 310
    .line 311
    aget-object v14, v7, v10

    .line 312
    .line 313
    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 314
    .line 315
    .line 316
    move-result v15

    .line 317
    new-array v15, v15, [[B

    .line 318
    .line 319
    aput-object v15, v14, v12

    .line 320
    .line 321
    const/4 v14, 0x0

    .line 322
    :goto_7
    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 323
    .line 324
    .line 325
    move-result v15

    .line 326
    if-ge v14, v15, :cond_5

    .line 327
    .line 328
    aget-object v15, v7, v10

    .line 329
    .line 330
    aget-object v15, v15, v12

    .line 331
    .line 332
    invoke-virtual {v13, v14}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 333
    .line 334
    .line 335
    move-result-object v17

    .line 336
    check-cast v17, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 337
    .line 338
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 339
    .line 340
    .line 341
    move-result-object v17

    .line 342
    aput-object v17, v15, v14

    .line 343
    .line 344
    add-int/lit8 v14, v14, 0x1

    .line 345
    .line 346
    goto :goto_7

    .line 347
    :cond_5
    add-int/lit8 v12, v12, 0x1

    .line 348
    .line 349
    goto :goto_6

    .line 350
    :cond_6
    invoke-virtual {v11, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    check-cast v2, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 355
    .line 356
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 357
    .line 358
    .line 359
    move-result v12

    .line 360
    new-array v12, v12, [[B

    .line 361
    .line 362
    aput-object v12, v8, v10

    .line 363
    .line 364
    const/4 v12, 0x0

    .line 365
    :goto_8
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 366
    .line 367
    .line 368
    move-result v13

    .line 369
    if-ge v12, v13, :cond_7

    .line 370
    .line 371
    aget-object v13, v8, v10

    .line 372
    .line 373
    invoke-virtual {v2, v12}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 374
    .line 375
    .line 376
    move-result-object v14

    .line 377
    check-cast v14, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 378
    .line 379
    invoke-virtual {v14}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 380
    .line 381
    .line 382
    move-result-object v14

    .line 383
    aput-object v14, v13, v12

    .line 384
    .line 385
    add-int/lit8 v12, v12, 0x1

    .line 386
    .line 387
    goto :goto_8

    .line 388
    :cond_7
    invoke-virtual {v11, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    check-cast v2, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 393
    .line 394
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    aput-object v2, v9, v10

    .line 399
    .line 400
    add-int/lit8 v10, v10, 0x1

    .line 401
    .line 402
    const/4 v2, 0x0

    .line 403
    goto/16 :goto_3

    .line 404
    .line 405
    :cond_8
    iget-object v1, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 406
    .line 407
    array-length v1, v1

    .line 408
    sub-int/2addr v1, v3

    .line 409
    new-array v2, v1, [Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 410
    .line 411
    iput-object v2, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 412
    .line 413
    const/4 v2, 0x0

    .line 414
    :goto_9
    if-ge v2, v1, :cond_9

    .line 415
    .line 416
    new-instance v10, Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 417
    .line 418
    iget-object v3, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 419
    .line 420
    aget-byte v11, v3, v2

    .line 421
    .line 422
    add-int/lit8 v4, v2, 0x1

    .line 423
    .line 424
    aget-byte v12, v3, v4

    .line 425
    .line 426
    aget-object v3, v6, v2

    .line 427
    .line 428
    invoke-static {v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[[B)[[[S

    .line 429
    .line 430
    .line 431
    move-result-object v13

    .line 432
    aget-object v3, v7, v2

    .line 433
    .line 434
    invoke-static {v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[[B)[[[S

    .line 435
    .line 436
    .line 437
    move-result-object v14

    .line 438
    aget-object v3, v8, v2

    .line 439
    .line 440
    invoke-static {v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[B)[[S

    .line 441
    .line 442
    .line 443
    move-result-object v15

    .line 444
    aget-object v3, v9, v2

    .line 445
    .line 446
    invoke-static {v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([B)[S

    .line 447
    .line 448
    .line 449
    move-result-object v16

    .line 450
    invoke-direct/range {v10 .. v16}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;-><init>(BB[[[S[[[S[[S[S)V

    .line 451
    .line 452
    .line 453
    iget-object v3, v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 454
    .line 455
    aput-object v10, v3, v2

    .line 456
    .line 457
    move v2, v4

    .line 458
    goto :goto_9

    .line 459
    :cond_9
    return-void
.end method

.method public constructor <init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V
    .locals 3

    .line 460
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 461
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 462
    invoke-static {p1}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[S)[[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA1:[[B

    .line 463
    invoke-static {p2}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([S)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b1:[B

    .line 464
    invoke-static {p3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[S)[[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA2:[[B

    .line 465
    invoke-static {p4}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([S)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b2:[B

    .line 466
    invoke-static {p5}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertIntArray([I)[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 467
    iput-object p6, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method


# virtual methods
.method public getB1()[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b1:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([B)[S

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getB2()[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b2:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([B)[S

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInvA1()[[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA1:[[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[B)[[S

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInvA2()[[S
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA2:[[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[B)[[S

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVi()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArraytoInt([B)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 12

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 20
    .line 21
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    move v3, v2

    .line 26
    :goto_1
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA1:[[B

    .line 27
    .line 28
    array-length v5, v4

    .line 29
    if-ge v3, v5, :cond_1

    .line 30
    .line 31
    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 32
    .line 33
    aget-object v4, v4, v3

    .line 34
    .line 35
    invoke-direct {v5, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 45
    .line 46
    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 53
    .line 54
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    .line 58
    .line 59
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b1:[B

    .line 60
    .line 61
    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 68
    .line 69
    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 76
    .line 77
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 78
    .line 79
    .line 80
    move v3, v2

    .line 81
    :goto_2
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->invA2:[[B

    .line 82
    .line 83
    array-length v5, v4

    .line 84
    if-ge v3, v5, :cond_2

    .line 85
    .line 86
    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 87
    .line 88
    aget-object v4, v4, v3

    .line 89
    .line 90
    invoke-direct {v5, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 94
    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_2
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 100
    .line 101
    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 105
    .line 106
    .line 107
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 108
    .line 109
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 110
    .line 111
    .line 112
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    .line 113
    .line 114
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->b2:[B

    .line 115
    .line 116
    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 120
    .line 121
    .line 122
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 123
    .line 124
    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 128
    .line 129
    .line 130
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 131
    .line 132
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 133
    .line 134
    .line 135
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    .line 136
    .line 137
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->vi:[B

    .line 138
    .line 139
    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 143
    .line 144
    .line 145
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    .line 146
    .line 147
    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 151
    .line 152
    .line 153
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 154
    .line 155
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 156
    .line 157
    .line 158
    move v3, v2

    .line 159
    :goto_3
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 160
    .line 161
    array-length v4, v4

    .line 162
    if-ge v3, v4, :cond_8

    .line 163
    .line 164
    new-instance v4, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 165
    .line 166
    invoke-direct {v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 167
    .line 168
    .line 169
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 170
    .line 171
    aget-object v5, v5, v3

    .line 172
    .line 173
    invoke-virtual {v5}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffAlpha()[[[S

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-static {v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[[S)[[[B

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    new-instance v6, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 182
    .line 183
    invoke-direct {v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 184
    .line 185
    .line 186
    move v7, v2

    .line 187
    :goto_4
    array-length v8, v5

    .line 188
    if-ge v7, v8, :cond_4

    .line 189
    .line 190
    new-instance v8, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 191
    .line 192
    invoke-direct {v8}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 193
    .line 194
    .line 195
    move v9, v2

    .line 196
    :goto_5
    aget-object v10, v5, v7

    .line 197
    .line 198
    array-length v11, v10

    .line 199
    if-ge v9, v11, :cond_3

    .line 200
    .line 201
    new-instance v11, Lorg/spongycastle/asn1/DEROctetString;

    .line 202
    .line 203
    aget-object v10, v10, v9

    .line 204
    .line 205
    invoke-direct {v11, v10}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v8, v11}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 209
    .line 210
    .line 211
    add-int/lit8 v9, v9, 0x1

    .line 212
    .line 213
    goto :goto_5

    .line 214
    :cond_3
    new-instance v9, Lorg/spongycastle/asn1/DERSequence;

    .line 215
    .line 216
    invoke-direct {v9, v8}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v6, v9}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 220
    .line 221
    .line 222
    add-int/lit8 v7, v7, 0x1

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_4
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    .line 226
    .line 227
    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 231
    .line 232
    .line 233
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 234
    .line 235
    aget-object v5, v5, v3

    .line 236
    .line 237
    invoke-virtual {v5}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffBeta()[[[S

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-static {v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[[S)[[[B

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    new-instance v6, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 246
    .line 247
    invoke-direct {v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 248
    .line 249
    .line 250
    move v7, v2

    .line 251
    :goto_6
    array-length v8, v5

    .line 252
    if-ge v7, v8, :cond_6

    .line 253
    .line 254
    new-instance v8, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 255
    .line 256
    invoke-direct {v8}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 257
    .line 258
    .line 259
    move v9, v2

    .line 260
    :goto_7
    aget-object v10, v5, v7

    .line 261
    .line 262
    array-length v11, v10

    .line 263
    if-ge v9, v11, :cond_5

    .line 264
    .line 265
    new-instance v11, Lorg/spongycastle/asn1/DEROctetString;

    .line 266
    .line 267
    aget-object v10, v10, v9

    .line 268
    .line 269
    invoke-direct {v11, v10}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v8, v11}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 273
    .line 274
    .line 275
    add-int/lit8 v9, v9, 0x1

    .line 276
    .line 277
    goto :goto_7

    .line 278
    :cond_5
    new-instance v9, Lorg/spongycastle/asn1/DERSequence;

    .line 279
    .line 280
    invoke-direct {v9, v8}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v6, v9}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 284
    .line 285
    .line 286
    add-int/lit8 v7, v7, 0x1

    .line 287
    .line 288
    goto :goto_6

    .line 289
    :cond_6
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    .line 290
    .line 291
    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 295
    .line 296
    .line 297
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 298
    .line 299
    aget-object v5, v5, v3

    .line 300
    .line 301
    invoke-virtual {v5}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffGamma()[[S

    .line 302
    .line 303
    .line 304
    move-result-object v5

    .line 305
    invoke-static {v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([[S)[[B

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    new-instance v6, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 310
    .line 311
    invoke-direct {v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 312
    .line 313
    .line 314
    move v7, v2

    .line 315
    :goto_8
    array-length v8, v5

    .line 316
    if-ge v7, v8, :cond_7

    .line 317
    .line 318
    new-instance v8, Lorg/spongycastle/asn1/DEROctetString;

    .line 319
    .line 320
    aget-object v9, v5, v7

    .line 321
    .line 322
    invoke-direct {v8, v9}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v6, v8}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 326
    .line 327
    .line 328
    add-int/lit8 v7, v7, 0x1

    .line 329
    .line 330
    goto :goto_8

    .line 331
    :cond_7
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    .line 332
    .line 333
    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 337
    .line 338
    .line 339
    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 340
    .line 341
    iget-object v6, p0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 342
    .line 343
    aget-object v6, v6, v3

    .line 344
    .line 345
    invoke-virtual {v6}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffEta()[S

    .line 346
    .line 347
    .line 348
    move-result-object v6

    .line 349
    invoke-static {v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->convertArray([S)[B

    .line 350
    .line 351
    .line 352
    move-result-object v6

    .line 353
    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 357
    .line 358
    .line 359
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    .line 360
    .line 361
    invoke-direct {v5, v4}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 365
    .line 366
    .line 367
    add-int/lit8 v3, v3, 0x1

    .line 368
    .line 369
    goto/16 :goto_3

    .line 370
    .line 371
    :cond_8
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 372
    .line 373
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 377
    .line 378
    .line 379
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 380
    .line 381
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 382
    .line 383
    .line 384
    return-object p0
.end method
