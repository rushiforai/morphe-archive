.class public Lio/agora/base/ColorSpacePrimaries;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ADOBE_RGB:Lio/agora/base/ColorSpacePrimaries;

.field public static final APPLE_GENERIC_RGB:Lio/agora/base/ColorSpacePrimaries;

.field public static final BT2020:Lio/agora/base/ColorSpacePrimaries;

.field public static final BT470BG:Lio/agora/base/ColorSpacePrimaries;

.field public static final BT470M:Lio/agora/base/ColorSpacePrimaries;

.field public static final BT709:Lio/agora/base/ColorSpacePrimaries;

.field public static final FILM:Lio/agora/base/ColorSpacePrimaries;

.field public static final SMPTE170M:Lio/agora/base/ColorSpacePrimaries;

.field public static final SMPTE240M:Lio/agora/base/ColorSpacePrimaries;

.field public static final SMPTEST428_1:Lio/agora/base/ColorSpacePrimaries;

.field public static final SMPTEST431_2:Lio/agora/base/ColorSpacePrimaries;

.field public static final SMPTEST432_1:Lio/agora/base/ColorSpacePrimaries;

.field public static final WIDE_GAMUT_COLOR_SPIN:Lio/agora/base/ColorSpacePrimaries;

.field public static final XYZ_D50:Lio/agora/base/ColorSpacePrimaries;


# instance fields
.field public fBX:F

.field public fBY:F

.field public fGX:F

.field public fGY:F

.field public fRX:F

.field public fRY:F

.field public fWX:F

.field public fWY:F


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Lio/agora/base/ColorSpacePrimaries;

    .line 2
    .line 3
    const v7, 0x3ea01a37    # 0.3127f

    .line 4
    .line 5
    .line 6
    const v8, 0x3ea872b0    # 0.329f

    .line 7
    .line 8
    .line 9
    const v1, 0x3f23d70a    # 0.64f

    .line 10
    .line 11
    .line 12
    const v2, 0x3ea8f5c3    # 0.33f

    .line 13
    .line 14
    .line 15
    const v3, 0x3e99999a    # 0.3f

    .line 16
    .line 17
    .line 18
    const v4, 0x3f19999a    # 0.6f

    .line 19
    .line 20
    .line 21
    const v5, 0x3e19999a    # 0.15f

    .line 22
    .line 23
    .line 24
    const v6, 0x3d75c28f    # 0.06f

    .line 25
    .line 26
    .line 27
    invoke-direct/range {v0 .. v8}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lio/agora/base/ColorSpacePrimaries;->BT709:Lio/agora/base/ColorSpacePrimaries;

    .line 31
    .line 32
    new-instance v1, Lio/agora/base/ColorSpacePrimaries;

    .line 33
    .line 34
    const v8, 0x3e9eb852    # 0.31f

    .line 35
    .line 36
    .line 37
    const v9, 0x3ea1cac1    # 0.316f

    .line 38
    .line 39
    .line 40
    const v2, 0x3f2b851f    # 0.67f

    .line 41
    .line 42
    .line 43
    const v3, 0x3ea8f5c3    # 0.33f

    .line 44
    .line 45
    .line 46
    const v4, 0x3e570a3d    # 0.21f

    .line 47
    .line 48
    .line 49
    const v5, 0x3f35c28f    # 0.71f

    .line 50
    .line 51
    .line 52
    const v6, 0x3e0f5c29    # 0.14f

    .line 53
    .line 54
    .line 55
    const v7, 0x3da3d70a    # 0.08f

    .line 56
    .line 57
    .line 58
    invoke-direct/range {v1 .. v9}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 59
    .line 60
    .line 61
    sput-object v1, Lio/agora/base/ColorSpacePrimaries;->BT470M:Lio/agora/base/ColorSpacePrimaries;

    .line 62
    .line 63
    new-instance v2, Lio/agora/base/ColorSpacePrimaries;

    .line 64
    .line 65
    const v9, 0x3ea01a37    # 0.3127f

    .line 66
    .line 67
    .line 68
    const v10, 0x3ea872b0    # 0.329f

    .line 69
    .line 70
    .line 71
    const v3, 0x3f23d70a    # 0.64f

    .line 72
    .line 73
    .line 74
    const v4, 0x3ea8f5c3    # 0.33f

    .line 75
    .line 76
    .line 77
    const v5, 0x3e947ae1    # 0.29f

    .line 78
    .line 79
    .line 80
    const v6, 0x3f19999a    # 0.6f

    .line 81
    .line 82
    .line 83
    const v7, 0x3e19999a    # 0.15f

    .line 84
    .line 85
    .line 86
    const v8, 0x3d75c28f    # 0.06f

    .line 87
    .line 88
    .line 89
    invoke-direct/range {v2 .. v10}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 90
    .line 91
    .line 92
    sput-object v2, Lio/agora/base/ColorSpacePrimaries;->BT470BG:Lio/agora/base/ColorSpacePrimaries;

    .line 93
    .line 94
    new-instance v3, Lio/agora/base/ColorSpacePrimaries;

    .line 95
    .line 96
    const v10, 0x3ea01a37    # 0.3127f

    .line 97
    .line 98
    .line 99
    const v11, 0x3ea872b0    # 0.329f

    .line 100
    .line 101
    .line 102
    const v4, 0x3f2147ae    # 0.63f

    .line 103
    .line 104
    .line 105
    const v5, 0x3eae147b    # 0.34f

    .line 106
    .line 107
    .line 108
    const v6, 0x3e9eb852    # 0.31f

    .line 109
    .line 110
    .line 111
    const v7, 0x3f1851ec    # 0.595f

    .line 112
    .line 113
    .line 114
    const v8, 0x3e1eb852    # 0.155f

    .line 115
    .line 116
    .line 117
    const v9, 0x3d8f5c29    # 0.07f

    .line 118
    .line 119
    .line 120
    invoke-direct/range {v3 .. v11}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 121
    .line 122
    .line 123
    sput-object v3, Lio/agora/base/ColorSpacePrimaries;->SMPTE170M:Lio/agora/base/ColorSpacePrimaries;

    .line 124
    .line 125
    new-instance v4, Lio/agora/base/ColorSpacePrimaries;

    .line 126
    .line 127
    const v11, 0x3ea01a37    # 0.3127f

    .line 128
    .line 129
    .line 130
    const v12, 0x3ea872b0    # 0.329f

    .line 131
    .line 132
    .line 133
    const v5, 0x3f2147ae    # 0.63f

    .line 134
    .line 135
    .line 136
    const v6, 0x3eae147b    # 0.34f

    .line 137
    .line 138
    .line 139
    const v7, 0x3e9eb852    # 0.31f

    .line 140
    .line 141
    .line 142
    const v8, 0x3f1851ec    # 0.595f

    .line 143
    .line 144
    .line 145
    const v9, 0x3e1eb852    # 0.155f

    .line 146
    .line 147
    .line 148
    const v10, 0x3d8f5c29    # 0.07f

    .line 149
    .line 150
    .line 151
    invoke-direct/range {v4 .. v12}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 152
    .line 153
    .line 154
    sput-object v4, Lio/agora/base/ColorSpacePrimaries;->SMPTE240M:Lio/agora/base/ColorSpacePrimaries;

    .line 155
    .line 156
    new-instance v5, Lio/agora/base/ColorSpacePrimaries;

    .line 157
    .line 158
    const v12, 0x3ea01a37    # 0.3127f

    .line 159
    .line 160
    .line 161
    const v13, 0x3ea872b0    # 0.329f

    .line 162
    .line 163
    .line 164
    const v6, 0x3f2148fe

    .line 165
    .line 166
    .line 167
    const v7, 0x3eae147b    # 0.34f

    .line 168
    .line 169
    .line 170
    const v8, 0x3e9710cb    # 0.29505f

    .line 171
    .line 172
    .line 173
    const v9, 0x3f1adff8    # 0.60498f

    .line 174
    .line 175
    .line 176
    const v10, 0x3e1ebaf1    # 0.15501f

    .line 177
    .line 178
    .line 179
    const v11, 0x3d9db76b    # 0.07701f

    .line 180
    .line 181
    .line 182
    invoke-direct/range {v5 .. v13}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 183
    .line 184
    .line 185
    sput-object v5, Lio/agora/base/ColorSpacePrimaries;->APPLE_GENERIC_RGB:Lio/agora/base/ColorSpacePrimaries;

    .line 186
    .line 187
    new-instance v6, Lio/agora/base/ColorSpacePrimaries;

    .line 188
    .line 189
    const v13, 0x3ea01a37    # 0.3127f

    .line 190
    .line 191
    .line 192
    const v14, 0x3ea872b0    # 0.329f

    .line 193
    .line 194
    .line 195
    const v7, 0x3c23d70a    # 0.01f

    .line 196
    .line 197
    .line 198
    const v8, 0x3f7ae148    # 0.98f

    .line 199
    .line 200
    .line 201
    const v9, 0x3c23d70a    # 0.01f

    .line 202
    .line 203
    .line 204
    const v10, 0x3c23d70a    # 0.01f

    .line 205
    .line 206
    .line 207
    const v11, 0x3f7ae148    # 0.98f

    .line 208
    .line 209
    .line 210
    const v12, 0x3c23d70a    # 0.01f

    .line 211
    .line 212
    .line 213
    invoke-direct/range {v6 .. v14}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 214
    .line 215
    .line 216
    sput-object v6, Lio/agora/base/ColorSpacePrimaries;->WIDE_GAMUT_COLOR_SPIN:Lio/agora/base/ColorSpacePrimaries;

    .line 217
    .line 218
    new-instance v7, Lio/agora/base/ColorSpacePrimaries;

    .line 219
    .line 220
    const v14, 0x3e9eb852    # 0.31f

    .line 221
    .line 222
    .line 223
    const v15, 0x3e0b4396    # 0.136f

    .line 224
    .line 225
    .line 226
    const v8, 0x3f2e5604    # 0.681f

    .line 227
    .line 228
    .line 229
    const v9, 0x3ea353f8    # 0.319f

    .line 230
    .line 231
    .line 232
    const v10, 0x3e78d4fe    # 0.243f

    .line 233
    .line 234
    .line 235
    const v11, 0x3f3126e9    # 0.692f

    .line 236
    .line 237
    .line 238
    const v12, 0x3e147ae1    # 0.145f

    .line 239
    .line 240
    .line 241
    const v13, 0x3d48b439    # 0.049f

    .line 242
    .line 243
    .line 244
    invoke-direct/range {v7 .. v15}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 245
    .line 246
    .line 247
    sput-object v7, Lio/agora/base/ColorSpacePrimaries;->FILM:Lio/agora/base/ColorSpacePrimaries;

    .line 248
    .line 249
    new-instance v8, Lio/agora/base/ColorSpacePrimaries;

    .line 250
    .line 251
    const v15, 0x3ea01a37    # 0.3127f

    .line 252
    .line 253
    .line 254
    const v16, 0x3ea872b0    # 0.329f

    .line 255
    .line 256
    .line 257
    const v9, 0x3f353f7d    # 0.708f

    .line 258
    .line 259
    .line 260
    const v10, 0x3e958106    # 0.292f

    .line 261
    .line 262
    .line 263
    const v11, 0x3e2e147b    # 0.17f

    .line 264
    .line 265
    .line 266
    const v12, 0x3f4c0831    # 0.797f

    .line 267
    .line 268
    .line 269
    const v13, 0x3e0624dd    # 0.131f

    .line 270
    .line 271
    .line 272
    const v14, 0x3d3c6a7f    # 0.046f

    .line 273
    .line 274
    .line 275
    invoke-direct/range {v8 .. v16}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 276
    .line 277
    .line 278
    sput-object v8, Lio/agora/base/ColorSpacePrimaries;->BT2020:Lio/agora/base/ColorSpacePrimaries;

    .line 279
    .line 280
    new-instance v9, Lio/agora/base/ColorSpacePrimaries;

    .line 281
    .line 282
    const v16, 0x3eaaaaab

    .line 283
    .line 284
    .line 285
    const v17, 0x3eaaaaab

    .line 286
    .line 287
    .line 288
    const/high16 v10, 0x3f800000    # 1.0f

    .line 289
    .line 290
    const/4 v11, 0x0

    .line 291
    const/4 v12, 0x0

    .line 292
    const/high16 v13, 0x3f800000    # 1.0f

    .line 293
    .line 294
    const/4 v14, 0x0

    .line 295
    const/4 v15, 0x0

    .line 296
    invoke-direct/range {v9 .. v17}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 297
    .line 298
    .line 299
    sput-object v9, Lio/agora/base/ColorSpacePrimaries;->SMPTEST428_1:Lio/agora/base/ColorSpacePrimaries;

    .line 300
    .line 301
    new-instance v0, Lio/agora/base/ColorSpacePrimaries;

    .line 302
    .line 303
    const v7, 0x3ea0c49c    # 0.314f

    .line 304
    .line 305
    .line 306
    const v8, 0x3eb3b646    # 0.351f

    .line 307
    .line 308
    .line 309
    const v1, 0x3f2e147b    # 0.68f

    .line 310
    .line 311
    .line 312
    const v2, 0x3ea3d70a    # 0.32f

    .line 313
    .line 314
    .line 315
    const v3, 0x3e87ae14    # 0.265f

    .line 316
    .line 317
    .line 318
    const v4, 0x3f30a3d7    # 0.69f

    .line 319
    .line 320
    .line 321
    const v5, 0x3e19999a    # 0.15f

    .line 322
    .line 323
    .line 324
    const v6, 0x3d75c28f    # 0.06f

    .line 325
    .line 326
    .line 327
    invoke-direct/range {v0 .. v8}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 328
    .line 329
    .line 330
    sput-object v0, Lio/agora/base/ColorSpacePrimaries;->SMPTEST431_2:Lio/agora/base/ColorSpacePrimaries;

    .line 331
    .line 332
    new-instance v1, Lio/agora/base/ColorSpacePrimaries;

    .line 333
    .line 334
    const v8, 0x3ea01a37    # 0.3127f

    .line 335
    .line 336
    .line 337
    const v9, 0x3ea872b0    # 0.329f

    .line 338
    .line 339
    .line 340
    const v2, 0x3f2e147b    # 0.68f

    .line 341
    .line 342
    .line 343
    const v3, 0x3ea3d70a    # 0.32f

    .line 344
    .line 345
    .line 346
    const v4, 0x3e87ae14    # 0.265f

    .line 347
    .line 348
    .line 349
    const v5, 0x3f30a3d7    # 0.69f

    .line 350
    .line 351
    .line 352
    const v6, 0x3e19999a    # 0.15f

    .line 353
    .line 354
    .line 355
    const v7, 0x3d75c28f    # 0.06f

    .line 356
    .line 357
    .line 358
    invoke-direct/range {v1 .. v9}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 359
    .line 360
    .line 361
    sput-object v1, Lio/agora/base/ColorSpacePrimaries;->SMPTEST432_1:Lio/agora/base/ColorSpacePrimaries;

    .line 362
    .line 363
    new-instance v2, Lio/agora/base/ColorSpacePrimaries;

    .line 364
    .line 365
    const v9, 0x3eb0fba9

    .line 366
    .line 367
    .line 368
    const v10, 0x3eb78d50    # 0.3585f

    .line 369
    .line 370
    .line 371
    const/high16 v3, 0x3f800000    # 1.0f

    .line 372
    .line 373
    const/4 v4, 0x0

    .line 374
    const/4 v5, 0x0

    .line 375
    const/high16 v6, 0x3f800000    # 1.0f

    .line 376
    .line 377
    const/4 v7, 0x0

    .line 378
    const/4 v8, 0x0

    .line 379
    invoke-direct/range {v2 .. v10}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 380
    .line 381
    .line 382
    sput-object v2, Lio/agora/base/ColorSpacePrimaries;->XYZ_D50:Lio/agora/base/ColorSpacePrimaries;

    .line 383
    .line 384
    new-instance v3, Lio/agora/base/ColorSpacePrimaries;

    .line 385
    .line 386
    const v10, 0x3ea01a37    # 0.3127f

    .line 387
    .line 388
    .line 389
    const v11, 0x3ea872b0    # 0.329f

    .line 390
    .line 391
    .line 392
    const v4, 0x3f23d70a    # 0.64f

    .line 393
    .line 394
    .line 395
    const v5, 0x3ea8f5c3    # 0.33f

    .line 396
    .line 397
    .line 398
    const v6, 0x3e570a3d    # 0.21f

    .line 399
    .line 400
    .line 401
    const v7, 0x3f35c28f    # 0.71f

    .line 402
    .line 403
    .line 404
    const v8, 0x3e19999a    # 0.15f

    .line 405
    .line 406
    .line 407
    const v9, 0x3d75c28f    # 0.06f

    .line 408
    .line 409
    .line 410
    invoke-direct/range {v3 .. v11}, Lio/agora/base/ColorSpacePrimaries;-><init>(FFFFFFFF)V

    .line 411
    .line 412
    .line 413
    sput-object v3, Lio/agora/base/ColorSpacePrimaries;->ADOBE_RGB:Lio/agora/base/ColorSpacePrimaries;

    .line 414
    .line 415
    return-void
.end method

.method public constructor <init>(FFFFFFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/base/ColorSpacePrimaries;->fRX:F

    .line 5
    .line 6
    iput p2, p0, Lio/agora/base/ColorSpacePrimaries;->fRY:F

    .line 7
    .line 8
    iput p3, p0, Lio/agora/base/ColorSpacePrimaries;->fGX:F

    .line 9
    .line 10
    iput p4, p0, Lio/agora/base/ColorSpacePrimaries;->fGY:F

    .line 11
    .line 12
    iput p5, p0, Lio/agora/base/ColorSpacePrimaries;->fBX:F

    .line 13
    .line 14
    iput p6, p0, Lio/agora/base/ColorSpacePrimaries;->fBY:F

    .line 15
    .line 16
    iput p7, p0, Lio/agora/base/ColorSpacePrimaries;->fWX:F

    .line 17
    .line 18
    iput p8, p0, Lio/agora/base/ColorSpacePrimaries;->fWY:F

    .line 19
    .line 20
    return-void
.end method
