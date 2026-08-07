.class public Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ONE:Ljava/math/BigInteger;

.field private static final ZERO:Ljava/math/BigInteger;

.field static final oidBase:Ljava/lang/String;

.field static final oids:[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final params:[Lorg/spongycastle/crypto/params/ECDomainParameters;


# direct methods
.method static constructor <clinit>()V
    .locals 33

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    sput-object v5, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->ZERO:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v11

    .line 15
    sput-object v11, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->ONE:Ljava/math/BigInteger;

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    new-array v1, v0, [Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 20
    .line 21
    sput-object v1, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->params:[Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 22
    .line 23
    new-array v0, v0, [Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 24
    .line 25
    sput-object v0, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oids:[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    sget-object v1, Lorg/spongycastle/asn1/ua/UAObjectIdentifiers;->dstu4145le:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    .line 34
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, ".2."

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oidBase:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v12, Ljava/math/BigInteger;

    .line 53
    .line 54
    const-string v0, "400000000000000000002BEC12BE2262D39BCF14D"

    .line 55
    .line 56
    const/16 v1, 0x10

    .line 57
    .line 58
    invoke-direct {v12, v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    new-instance v13, Ljava/math/BigInteger;

    .line 62
    .line 63
    const-string v0, "3FFFFFFFFFFFFFFFFFFFFFB12EBCC7D7F29FF7701F"

    .line 64
    .line 65
    invoke-direct {v13, v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    new-instance v14, Ljava/math/BigInteger;

    .line 69
    .line 70
    const-string v0, "800000000000000000000189B4E67606E3825BB2831"

    .line 71
    .line 72
    invoke-direct {v14, v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    new-instance v15, Ljava/math/BigInteger;

    .line 76
    .line 77
    const-string v0, "3FFFFFFFFFFFFFFFFFFFFFFB981960435FE5AB64236EF"

    .line 78
    .line 79
    invoke-direct {v15, v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    new-instance v0, Ljava/math/BigInteger;

    .line 83
    .line 84
    const-string v2, "40000000000000000000000069A779CAC1DABC6788F7474F"

    .line 85
    .line 86
    invoke-direct {v0, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    new-instance v2, Ljava/math/BigInteger;

    .line 90
    .line 91
    const-string v3, "1000000000000000000000000000013E974E72F8A6922031D2603CFE0D7"

    .line 92
    .line 93
    invoke-direct {v2, v3, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    new-instance v3, Ljava/math/BigInteger;

    .line 97
    .line 98
    const-string v4, "800000000000000000000000000000006759213AF182E987D3E17714907D470D"

    .line 99
    .line 100
    invoke-direct {v3, v4, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 101
    .line 102
    .line 103
    new-instance v4, Ljava/math/BigInteger;

    .line 104
    .line 105
    const-string v6, "3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC079C2F3825DA70D390FBBA588D4604022B7B7"

    .line 106
    .line 107
    invoke-direct {v4, v6, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    new-instance v6, Ljava/math/BigInteger;

    .line 111
    .line 112
    const-string v7, "40000000000000000000000000000000000000000000009C300B75A3FA824F22428FD28CE8812245EF44049B2D49"

    .line 113
    .line 114
    invoke-direct {v6, v7, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    new-instance v7, Ljava/math/BigInteger;

    .line 118
    .line 119
    const-string v8, "3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA3175458009A8C0A724F02F81AA8A1FCBAF80D90C7A95110504CF"

    .line 120
    .line 121
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
    move-object/from16 v16, v0

    .line 125
    .line 126
    move-object/from16 v17, v2

    .line 127
    .line 128
    move-object/from16 v18, v3

    .line 129
    .line 130
    move-object/from16 v19, v4

    .line 131
    .line 132
    move-object/from16 v20, v6

    .line 133
    .line 134
    move-object/from16 v21, v7

    .line 135
    .line 136
    filled-new-array/range {v12 .. v21}, [Ljava/math/BigInteger;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const-wide/16 v2, 0x2

    .line 141
    .line 142
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 143
    .line 144
    .line 145
    move-result-object v12

    .line 146
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 147
    .line 148
    .line 149
    move-result-object v13

    .line 150
    const-wide/16 v6, 0x4

    .line 151
    .line 152
    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 153
    .line 154
    .line 155
    move-result-object v14

    .line 156
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 157
    .line 158
    .line 159
    move-result-object v15

    .line 160
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 161
    .line 162
    .line 163
    move-result-object v16

    .line 164
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 165
    .line 166
    .line 167
    move-result-object v17

    .line 168
    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 169
    .line 170
    .line 171
    move-result-object v18

    .line 172
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 173
    .line 174
    .line 175
    move-result-object v19

    .line 176
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 177
    .line 178
    .line 179
    move-result-object v20

    .line 180
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 181
    .line 182
    .line 183
    move-result-object v21

    .line 184
    filled-new-array/range {v12 .. v21}, [Ljava/math/BigInteger;

    .line 185
    .line 186
    .line 187
    move-result-object v15

    .line 188
    new-instance v16, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 189
    .line 190
    new-instance v12, Ljava/math/BigInteger;

    .line 191
    .line 192
    const-string v2, "5FF6108462A2DC8210AB403925E638A19C1455D21"

    .line 193
    .line 194
    invoke-direct {v12, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    const/16 v26, 0x0

    .line 198
    .line 199
    aget-object v13, v0, v26

    .line 200
    .line 201
    aget-object v14, v15, v26

    .line 202
    .line 203
    const/16 v7, 0xa3

    .line 204
    .line 205
    const/4 v8, 0x3

    .line 206
    const/4 v9, 0x6

    .line 207
    const/4 v10, 0x7

    .line 208
    move-object/from16 v6, v16

    .line 209
    .line 210
    invoke-direct/range {v6 .. v14}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 211
    .line 212
    .line 213
    new-instance v17, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 214
    .line 215
    new-instance v10, Ljava/math/BigInteger;

    .line 216
    .line 217
    const-string v2, "6EE3CEEB230811759F20518A0930F1A4315A827DAC"

    .line 218
    .line 219
    invoke-direct {v10, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 220
    .line 221
    .line 222
    const/16 v27, 0x1

    .line 223
    .line 224
    move-object v9, v11

    .line 225
    aget-object v11, v0, v27

    .line 226
    .line 227
    aget-object v12, v15, v27

    .line 228
    .line 229
    const/16 v7, 0xa7

    .line 230
    .line 231
    const/4 v8, 0x6

    .line 232
    move-object/from16 v6, v17

    .line 233
    .line 234
    invoke-direct/range {v6 .. v12}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 235
    .line 236
    .line 237
    move-object v11, v9

    .line 238
    new-instance v2, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 239
    .line 240
    new-instance v8, Ljava/math/BigInteger;

    .line 241
    .line 242
    const-string v3, "108576C80499DB2FC16EDDF6853BBB278F6B6FB437D9"

    .line 243
    .line 244
    invoke-direct {v8, v3, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 245
    .line 246
    .line 247
    const/16 v28, 0x2

    .line 248
    .line 249
    aget-object v9, v0, v28

    .line 250
    .line 251
    aget-object v10, v15, v28

    .line 252
    .line 253
    const/16 v3, 0xad

    .line 254
    .line 255
    const/4 v4, 0x1

    .line 256
    move-object v7, v5

    .line 257
    const/4 v5, 0x2

    .line 258
    const/16 v6, 0xa

    .line 259
    .line 260
    invoke-direct/range {v2 .. v10}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 261
    .line 262
    .line 263
    move-object/from16 v18, v2

    .line 264
    .line 265
    move-object v5, v7

    .line 266
    new-instance v19, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 267
    .line 268
    new-instance v12, Ljava/math/BigInteger;

    .line 269
    .line 270
    const-string v2, "4A6E0856526436F2F88DD07A341E32D04184572BEB710"

    .line 271
    .line 272
    invoke-direct {v12, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 273
    .line 274
    .line 275
    const/16 v29, 0x3

    .line 276
    .line 277
    aget-object v13, v0, v29

    .line 278
    .line 279
    aget-object v14, v15, v29

    .line 280
    .line 281
    const/16 v7, 0xb3

    .line 282
    .line 283
    const/4 v8, 0x1

    .line 284
    const/4 v9, 0x2

    .line 285
    const/4 v10, 0x4

    .line 286
    move-object/from16 v6, v19

    .line 287
    .line 288
    invoke-direct/range {v6 .. v14}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 289
    .line 290
    .line 291
    new-instance v20, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 292
    .line 293
    new-instance v10, Ljava/math/BigInteger;

    .line 294
    .line 295
    const-string v2, "7BC86E2102902EC4D5890E8B6B4981ff27E0482750FEFC03"

    .line 296
    .line 297
    invoke-direct {v10, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 298
    .line 299
    .line 300
    const/16 v30, 0x4

    .line 301
    .line 302
    move-object v9, v11

    .line 303
    aget-object v11, v0, v30

    .line 304
    .line 305
    aget-object v12, v15, v30

    .line 306
    .line 307
    const/16 v7, 0xbf

    .line 308
    .line 309
    const/16 v8, 0x9

    .line 310
    .line 311
    move-object/from16 v6, v20

    .line 312
    .line 313
    invoke-direct/range {v6 .. v12}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 314
    .line 315
    .line 316
    move-object v11, v9

    .line 317
    new-instance v21, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 318
    .line 319
    new-instance v12, Ljava/math/BigInteger;

    .line 320
    .line 321
    const-string v2, "06973B15095675534C7CF7E64A21BD54EF5DD3B8A0326AA936ECE454D2C"

    .line 322
    .line 323
    invoke-direct {v12, v2, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 324
    .line 325
    .line 326
    const/16 v31, 0x5

    .line 327
    .line 328
    aget-object v13, v0, v31

    .line 329
    .line 330
    aget-object v14, v15, v31

    .line 331
    .line 332
    const/16 v7, 0xe9

    .line 333
    .line 334
    const/4 v8, 0x1

    .line 335
    const/4 v9, 0x4

    .line 336
    const/16 v10, 0x9

    .line 337
    .line 338
    move-object/from16 v6, v21

    .line 339
    .line 340
    invoke-direct/range {v6 .. v14}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 341
    .line 342
    .line 343
    new-instance v2, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 344
    .line 345
    new-instance v6, Ljava/math/BigInteger;

    .line 346
    .line 347
    const-string v3, "1CEF494720115657E18F938D7A7942394FF9425C1458C57861F9EEA6ADBE3BE10"

    .line 348
    .line 349
    invoke-direct {v6, v3, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 350
    .line 351
    .line 352
    const/16 v32, 0x6

    .line 353
    .line 354
    aget-object v7, v0, v32

    .line 355
    .line 356
    aget-object v8, v15, v32

    .line 357
    .line 358
    const/16 v3, 0x101

    .line 359
    .line 360
    const/16 v4, 0xc

    .line 361
    .line 362
    invoke-direct/range {v2 .. v8}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 363
    .line 364
    .line 365
    new-instance v6, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 366
    .line 367
    new-instance v12, Ljava/math/BigInteger;

    .line 368
    .line 369
    const-string v3, "393C7F7D53666B5054B5E6C6D3DE94F4296C0C599E2E2E241050DF18B6090BDC90186904968BB"

    .line 370
    .line 371
    invoke-direct {v12, v3, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 372
    .line 373
    .line 374
    const/4 v3, 0x7

    .line 375
    aget-object v13, v0, v3

    .line 376
    .line 377
    aget-object v14, v15, v3

    .line 378
    .line 379
    const/16 v7, 0x133

    .line 380
    .line 381
    const/4 v8, 0x2

    .line 382
    const/16 v10, 0x8

    .line 383
    .line 384
    invoke-direct/range {v6 .. v14}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 385
    .line 386
    .line 387
    move-object/from16 v23, v6

    .line 388
    .line 389
    new-instance v6, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 390
    .line 391
    new-instance v10, Ljava/math/BigInteger;

    .line 392
    .line 393
    const-string v4, "43FC8AD242B0B7A6F3D1627AD5654447556B47BF6AA4A64B0C2AFE42CADAB8F93D92394C79A79755437B56995136"

    .line 394
    .line 395
    invoke-direct {v10, v4, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 396
    .line 397
    .line 398
    const/16 v4, 0x8

    .line 399
    .line 400
    move-object v9, v11

    .line 401
    aget-object v11, v0, v4

    .line 402
    .line 403
    aget-object v12, v15, v4

    .line 404
    .line 405
    const/16 v7, 0x16f

    .line 406
    .line 407
    const/16 v8, 0x15

    .line 408
    .line 409
    invoke-direct/range {v6 .. v12}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 410
    .line 411
    .line 412
    move-object/from16 v24, v6

    .line 413
    .line 414
    move-object v11, v9

    .line 415
    new-instance v6, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 416
    .line 417
    new-instance v12, Ljava/math/BigInteger;

    .line 418
    .line 419
    const-string v5, "03CE10490F6A708FC26DFE8C3D27C4F94E690134D5BFF988D8D28AAEAEDE975936C66BAC536B18AE2DC312CA493117DAA469C640CAF3"

    .line 420
    .line 421
    invoke-direct {v12, v5, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 422
    .line 423
    .line 424
    const/16 v5, 0x9

    .line 425
    .line 426
    aget-object v13, v0, v5

    .line 427
    .line 428
    aget-object v14, v15, v5

    .line 429
    .line 430
    const/16 v7, 0x1af

    .line 431
    .line 432
    const/4 v8, 0x1

    .line 433
    const/4 v9, 0x3

    .line 434
    const/4 v10, 0x5

    .line 435
    invoke-direct/range {v6 .. v14}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 436
    .line 437
    .line 438
    move-object/from16 v22, v2

    .line 439
    .line 440
    move-object/from16 v25, v6

    .line 441
    .line 442
    filled-new-array/range {v16 .. v25}, [Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    aget-object v6, v2, v26

    .line 447
    .line 448
    new-instance v7, Ljava/math/BigInteger;

    .line 449
    .line 450
    const-string v8, "2E2F85F5DD74CE983A5C4237229DAF8A3F35823BE"

    .line 451
    .line 452
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 453
    .line 454
    .line 455
    new-instance v8, Ljava/math/BigInteger;

    .line 456
    .line 457
    const-string v9, "3826F008A8C51D7B95284D9D03FF0E00CE2CD723A"

    .line 458
    .line 459
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 463
    .line 464
    .line 465
    move-result-object v16

    .line 466
    aget-object v6, v2, v27

    .line 467
    .line 468
    new-instance v7, Ljava/math/BigInteger;

    .line 469
    .line 470
    const-string v8, "7A1F6653786A68192803910A3D30B2A2018B21CD54"

    .line 471
    .line 472
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 473
    .line 474
    .line 475
    new-instance v8, Ljava/math/BigInteger;

    .line 476
    .line 477
    const-string v9, "5F49EB26781C0EC6B8909156D98ED435E45FD59918"

    .line 478
    .line 479
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 483
    .line 484
    .line 485
    move-result-object v17

    .line 486
    aget-object v6, v2, v28

    .line 487
    .line 488
    new-instance v7, Ljava/math/BigInteger;

    .line 489
    .line 490
    const-string v8, "4D41A619BCC6EADF0448FA22FAD567A9181D37389CA"

    .line 491
    .line 492
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 493
    .line 494
    .line 495
    new-instance v8, Ljava/math/BigInteger;

    .line 496
    .line 497
    const-string v9, "10B51CC12849B234C75E6DD2028BF7FF5C1CE0D991A1"

    .line 498
    .line 499
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 500
    .line 501
    .line 502
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 503
    .line 504
    .line 505
    move-result-object v18

    .line 506
    aget-object v6, v2, v29

    .line 507
    .line 508
    new-instance v7, Ljava/math/BigInteger;

    .line 509
    .line 510
    const-string v8, "6BA06FE51464B2BD26DC57F48819BA9954667022C7D03"

    .line 511
    .line 512
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 513
    .line 514
    .line 515
    new-instance v8, Ljava/math/BigInteger;

    .line 516
    .line 517
    const-string v9, "25FBC363582DCEC065080CA8287AAFF09788A66DC3A9E"

    .line 518
    .line 519
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 523
    .line 524
    .line 525
    move-result-object v19

    .line 526
    aget-object v6, v2, v30

    .line 527
    .line 528
    new-instance v7, Ljava/math/BigInteger;

    .line 529
    .line 530
    const-string v8, "714114B762F2FF4A7912A6D2AC58B9B5C2FCFE76DAEB7129"

    .line 531
    .line 532
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 533
    .line 534
    .line 535
    new-instance v8, Ljava/math/BigInteger;

    .line 536
    .line 537
    const-string v9, "29C41E568B77C617EFE5902F11DB96FA9613CD8D03DB08DA"

    .line 538
    .line 539
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 540
    .line 541
    .line 542
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 543
    .line 544
    .line 545
    move-result-object v20

    .line 546
    aget-object v6, v2, v31

    .line 547
    .line 548
    new-instance v7, Ljava/math/BigInteger;

    .line 549
    .line 550
    const-string v8, "3FCDA526B6CDF83BA1118DF35B3C31761D3545F32728D003EEB25EFE96"

    .line 551
    .line 552
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 553
    .line 554
    .line 555
    new-instance v8, Ljava/math/BigInteger;

    .line 556
    .line 557
    const-string v9, "9CA8B57A934C54DEEDA9E54A7BBAD95E3B2E91C54D32BE0B9DF96D8D35"

    .line 558
    .line 559
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 563
    .line 564
    .line 565
    move-result-object v21

    .line 566
    aget-object v6, v2, v32

    .line 567
    .line 568
    new-instance v7, Ljava/math/BigInteger;

    .line 569
    .line 570
    const-string v8, "02A29EF207D0E9B6C55CD260B306C7E007AC491CA1B10C62334A9E8DCD8D20FB7"

    .line 571
    .line 572
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 573
    .line 574
    .line 575
    new-instance v8, Ljava/math/BigInteger;

    .line 576
    .line 577
    const-string v9, "10686D41FF744D4449FCCF6D8EEA03102E6812C93A9D60B978B702CF156D814EF"

    .line 578
    .line 579
    invoke-direct {v8, v9, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 580
    .line 581
    .line 582
    invoke-virtual {v6, v7, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 583
    .line 584
    .line 585
    move-result-object v22

    .line 586
    aget-object v3, v2, v3

    .line 587
    .line 588
    new-instance v6, Ljava/math/BigInteger;

    .line 589
    .line 590
    const-string v7, "216EE8B189D291A0224984C1E92F1D16BF75CCD825A087A239B276D3167743C52C02D6E7232AA"

    .line 591
    .line 592
    invoke-direct {v6, v7, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 593
    .line 594
    .line 595
    new-instance v7, Ljava/math/BigInteger;

    .line 596
    .line 597
    const-string v8, "5D9306BACD22B7FAEB09D2E049C6E2866C5D1677762A8F2F2DC9A11C7F7BE8340AB2237C7F2A0"

    .line 598
    .line 599
    invoke-direct {v7, v8, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 600
    .line 601
    .line 602
    invoke-virtual {v3, v6, v7}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 603
    .line 604
    .line 605
    move-result-object v23

    .line 606
    aget-object v3, v2, v4

    .line 607
    .line 608
    new-instance v4, Ljava/math/BigInteger;

    .line 609
    .line 610
    const-string v6, "324A6EDDD512F08C49A99AE0D3F961197A76413E7BE81A400CA681E09639B5FE12E59A109F78BF4A373541B3B9A1"

    .line 611
    .line 612
    invoke-direct {v4, v6, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 613
    .line 614
    .line 615
    new-instance v6, Ljava/math/BigInteger;

    .line 616
    .line 617
    const-string v7, "1AB597A5B4477F59E39539007C7F977D1A567B92B043A49C6B61984C3FE3481AAF454CD41BA1F051626442B3C10"

    .line 618
    .line 619
    invoke-direct {v6, v7, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 620
    .line 621
    .line 622
    invoke-virtual {v3, v4, v6}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 623
    .line 624
    .line 625
    move-result-object v24

    .line 626
    aget-object v3, v2, v5

    .line 627
    .line 628
    new-instance v4, Ljava/math/BigInteger;

    .line 629
    .line 630
    const-string v5, "1A62BA79D98133A16BBAE7ED9A8E03C32E0824D57AEF72F88986874E5AAE49C27BED49A2A95058068426C2171E99FD3B43C5947C857D"

    .line 631
    .line 632
    invoke-direct {v4, v5, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 633
    .line 634
    .line 635
    new-instance v5, Ljava/math/BigInteger;

    .line 636
    .line 637
    const-string v6, "70B5E1E14031C1F70BBEFE96BDDE66F451754B4CA5F48DA241F331AA396B8D1839A855C1769B1EA14BA53308B5E2723724E090E02DB9"

    .line 638
    .line 639
    invoke-direct {v5, v6, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 640
    .line 641
    .line 642
    invoke-virtual {v3, v4, v5}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 643
    .line 644
    .line 645
    move-result-object v25

    .line 646
    filled-new-array/range {v16 .. v25}, [Lorg/spongycastle/math/ec/ECPoint;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    move/from16 v3, v26

    .line 651
    .line 652
    :goto_0
    sget-object v4, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->params:[Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 653
    .line 654
    array-length v5, v4

    .line 655
    if-ge v3, v5, :cond_0

    .line 656
    .line 657
    new-instance v5, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 658
    .line 659
    aget-object v6, v2, v3

    .line 660
    .line 661
    aget-object v7, v1, v3

    .line 662
    .line 663
    aget-object v8, v0, v3

    .line 664
    .line 665
    aget-object v9, v15, v3

    .line 666
    .line 667
    invoke-direct {v5, v6, v7, v8, v9}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 668
    .line 669
    .line 670
    aput-object v5, v4, v3

    .line 671
    .line 672
    add-int/lit8 v3, v3, 0x1

    .line 673
    .line 674
    goto :goto_0

    .line 675
    :cond_0
    move/from16 v0, v26

    .line 676
    .line 677
    :goto_1
    sget-object v1, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oids:[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 678
    .line 679
    array-length v2, v1

    .line 680
    if-ge v0, v2, :cond_1

    .line 681
    .line 682
    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 683
    .line 684
    new-instance v3, Ljava/lang/StringBuilder;

    .line 685
    .line 686
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 687
    .line 688
    .line 689
    sget-object v4, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oidBase:Ljava/lang/String;

    .line 690
    .line 691
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 692
    .line 693
    .line 694
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 695
    .line 696
    .line 697
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 698
    .line 699
    .line 700
    move-result-object v3

    .line 701
    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 702
    .line 703
    .line 704
    aput-object v2, v1, v0

    .line 705
    .line 706
    add-int/lit8 v0, v0, 0x1

    .line 707
    .line 708
    goto :goto_1

    .line 709
    :cond_1
    return-void
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

.method public static getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/crypto/params/ECDomainParameters;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oidBase:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->params:[Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 28
    .line 29
    aget-object p0, v0, p0

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public static getOIDs()[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145NamedCurves;->oids:[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    return-object v0
.end method
