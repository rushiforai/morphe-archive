.class public final Lorg/spongycastle/crypto/engines/TnepresEngine;
.super Lorg/spongycastle/crypto/engines/SerpentEngineBase;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decryptBlock([BI[BI)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 2
    .line 3
    const/16 v1, 0x83

    .line 4
    .line 5
    aget v0, v0, v1

    .line 6
    .line 7
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    xor-int/2addr v0, v1

    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 13
    .line 14
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 15
    .line 16
    const/16 v1, 0x82

    .line 17
    .line 18
    aget v0, v0, v1

    .line 19
    .line 20
    add-int/lit8 v1, p2, 0x4

    .line 21
    .line 22
    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    xor-int/2addr v0, v1

    .line 27
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 28
    .line 29
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 30
    .line 31
    const/16 v1, 0x81

    .line 32
    .line 33
    aget v0, v0, v1

    .line 34
    .line 35
    add-int/lit8 v1, p2, 0x8

    .line 36
    .line 37
    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    xor-int/2addr v0, v1

    .line 42
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 43
    .line 44
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 45
    .line 46
    const/16 v1, 0x80

    .line 47
    .line 48
    aget v0, v0, v1

    .line 49
    .line 50
    const/16 v1, 0xc

    .line 51
    .line 52
    add-int/2addr p2, v1

    .line 53
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    xor-int/2addr p1, v0

    .line 58
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 59
    .line 60
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 61
    .line 62
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 63
    .line 64
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib7(IIII)V

    .line 67
    .line 68
    .line 69
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 70
    .line 71
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 72
    .line 73
    const/16 v0, 0x7c

    .line 74
    .line 75
    aget v0, p2, v0

    .line 76
    .line 77
    xor-int/2addr p1, v0

    .line 78
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 79
    .line 80
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 81
    .line 82
    const/16 v0, 0x7d

    .line 83
    .line 84
    aget v0, p2, v0

    .line 85
    .line 86
    xor-int/2addr p1, v0

    .line 87
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 88
    .line 89
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 90
    .line 91
    const/16 v0, 0x7e

    .line 92
    .line 93
    aget v0, p2, v0

    .line 94
    .line 95
    xor-int/2addr p1, v0

    .line 96
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 97
    .line 98
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 99
    .line 100
    const/16 v0, 0x7f

    .line 101
    .line 102
    aget p2, p2, v0

    .line 103
    .line 104
    xor-int/2addr p1, p2

    .line 105
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 106
    .line 107
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 108
    .line 109
    .line 110
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 111
    .line 112
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 113
    .line 114
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 115
    .line 116
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 117
    .line 118
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib6(IIII)V

    .line 119
    .line 120
    .line 121
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 122
    .line 123
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 124
    .line 125
    const/16 v0, 0x78

    .line 126
    .line 127
    aget v0, p2, v0

    .line 128
    .line 129
    xor-int/2addr p1, v0

    .line 130
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 131
    .line 132
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 133
    .line 134
    const/16 v0, 0x79

    .line 135
    .line 136
    aget v0, p2, v0

    .line 137
    .line 138
    xor-int/2addr p1, v0

    .line 139
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 140
    .line 141
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 142
    .line 143
    const/16 v0, 0x7a

    .line 144
    .line 145
    aget v0, p2, v0

    .line 146
    .line 147
    xor-int/2addr p1, v0

    .line 148
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 149
    .line 150
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 151
    .line 152
    const/16 v0, 0x7b

    .line 153
    .line 154
    aget p2, p2, v0

    .line 155
    .line 156
    xor-int/2addr p1, p2

    .line 157
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 158
    .line 159
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 160
    .line 161
    .line 162
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 163
    .line 164
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 165
    .line 166
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 167
    .line 168
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 169
    .line 170
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib5(IIII)V

    .line 171
    .line 172
    .line 173
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 174
    .line 175
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 176
    .line 177
    const/16 v0, 0x74

    .line 178
    .line 179
    aget v0, p2, v0

    .line 180
    .line 181
    xor-int/2addr p1, v0

    .line 182
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 183
    .line 184
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 185
    .line 186
    const/16 v0, 0x75

    .line 187
    .line 188
    aget v0, p2, v0

    .line 189
    .line 190
    xor-int/2addr p1, v0

    .line 191
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 192
    .line 193
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 194
    .line 195
    const/16 v0, 0x76

    .line 196
    .line 197
    aget v0, p2, v0

    .line 198
    .line 199
    xor-int/2addr p1, v0

    .line 200
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 201
    .line 202
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 203
    .line 204
    const/16 v0, 0x77

    .line 205
    .line 206
    aget p2, p2, v0

    .line 207
    .line 208
    xor-int/2addr p1, p2

    .line 209
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 210
    .line 211
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 212
    .line 213
    .line 214
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 215
    .line 216
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 217
    .line 218
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 219
    .line 220
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 221
    .line 222
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib4(IIII)V

    .line 223
    .line 224
    .line 225
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 226
    .line 227
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 228
    .line 229
    const/16 v0, 0x70

    .line 230
    .line 231
    aget v0, p2, v0

    .line 232
    .line 233
    xor-int/2addr p1, v0

    .line 234
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 235
    .line 236
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 237
    .line 238
    const/16 v0, 0x71

    .line 239
    .line 240
    aget v0, p2, v0

    .line 241
    .line 242
    xor-int/2addr p1, v0

    .line 243
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 244
    .line 245
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 246
    .line 247
    const/16 v0, 0x72

    .line 248
    .line 249
    aget v0, p2, v0

    .line 250
    .line 251
    xor-int/2addr p1, v0

    .line 252
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 253
    .line 254
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 255
    .line 256
    const/16 v0, 0x73

    .line 257
    .line 258
    aget p2, p2, v0

    .line 259
    .line 260
    xor-int/2addr p1, p2

    .line 261
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 262
    .line 263
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 264
    .line 265
    .line 266
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 267
    .line 268
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 269
    .line 270
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 271
    .line 272
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 273
    .line 274
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib3(IIII)V

    .line 275
    .line 276
    .line 277
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 278
    .line 279
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 280
    .line 281
    const/16 v0, 0x6c

    .line 282
    .line 283
    aget v0, p2, v0

    .line 284
    .line 285
    xor-int/2addr p1, v0

    .line 286
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 287
    .line 288
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 289
    .line 290
    const/16 v0, 0x6d

    .line 291
    .line 292
    aget v0, p2, v0

    .line 293
    .line 294
    xor-int/2addr p1, v0

    .line 295
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 296
    .line 297
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 298
    .line 299
    const/16 v0, 0x6e

    .line 300
    .line 301
    aget v0, p2, v0

    .line 302
    .line 303
    xor-int/2addr p1, v0

    .line 304
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 305
    .line 306
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 307
    .line 308
    const/16 v0, 0x6f

    .line 309
    .line 310
    aget p2, p2, v0

    .line 311
    .line 312
    xor-int/2addr p1, p2

    .line 313
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 314
    .line 315
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 316
    .line 317
    .line 318
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 319
    .line 320
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 321
    .line 322
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 323
    .line 324
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 325
    .line 326
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib2(IIII)V

    .line 327
    .line 328
    .line 329
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 330
    .line 331
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 332
    .line 333
    const/16 v0, 0x68

    .line 334
    .line 335
    aget v0, p2, v0

    .line 336
    .line 337
    xor-int/2addr p1, v0

    .line 338
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 339
    .line 340
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 341
    .line 342
    const/16 v0, 0x69

    .line 343
    .line 344
    aget v0, p2, v0

    .line 345
    .line 346
    xor-int/2addr p1, v0

    .line 347
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 348
    .line 349
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 350
    .line 351
    const/16 v0, 0x6a

    .line 352
    .line 353
    aget v0, p2, v0

    .line 354
    .line 355
    xor-int/2addr p1, v0

    .line 356
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 357
    .line 358
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 359
    .line 360
    const/16 v0, 0x6b

    .line 361
    .line 362
    aget p2, p2, v0

    .line 363
    .line 364
    xor-int/2addr p1, p2

    .line 365
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 366
    .line 367
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 368
    .line 369
    .line 370
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 371
    .line 372
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 373
    .line 374
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 375
    .line 376
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 377
    .line 378
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib1(IIII)V

    .line 379
    .line 380
    .line 381
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 382
    .line 383
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 384
    .line 385
    const/16 v0, 0x64

    .line 386
    .line 387
    aget v0, p2, v0

    .line 388
    .line 389
    xor-int/2addr p1, v0

    .line 390
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 391
    .line 392
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 393
    .line 394
    const/16 v0, 0x65

    .line 395
    .line 396
    aget v0, p2, v0

    .line 397
    .line 398
    xor-int/2addr p1, v0

    .line 399
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 400
    .line 401
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 402
    .line 403
    const/16 v0, 0x66

    .line 404
    .line 405
    aget v0, p2, v0

    .line 406
    .line 407
    xor-int/2addr p1, v0

    .line 408
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 409
    .line 410
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 411
    .line 412
    const/16 v0, 0x67

    .line 413
    .line 414
    aget p2, p2, v0

    .line 415
    .line 416
    xor-int/2addr p1, p2

    .line 417
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 418
    .line 419
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 420
    .line 421
    .line 422
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 423
    .line 424
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 425
    .line 426
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 427
    .line 428
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 429
    .line 430
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib0(IIII)V

    .line 431
    .line 432
    .line 433
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 434
    .line 435
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 436
    .line 437
    const/16 v0, 0x60

    .line 438
    .line 439
    aget v0, p2, v0

    .line 440
    .line 441
    xor-int/2addr p1, v0

    .line 442
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 443
    .line 444
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 445
    .line 446
    const/16 v0, 0x61

    .line 447
    .line 448
    aget v0, p2, v0

    .line 449
    .line 450
    xor-int/2addr p1, v0

    .line 451
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 452
    .line 453
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 454
    .line 455
    const/16 v0, 0x62

    .line 456
    .line 457
    aget v0, p2, v0

    .line 458
    .line 459
    xor-int/2addr p1, v0

    .line 460
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 461
    .line 462
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 463
    .line 464
    const/16 v0, 0x63

    .line 465
    .line 466
    aget p2, p2, v0

    .line 467
    .line 468
    xor-int/2addr p1, p2

    .line 469
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 470
    .line 471
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 472
    .line 473
    .line 474
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 475
    .line 476
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 477
    .line 478
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 479
    .line 480
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 481
    .line 482
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib7(IIII)V

    .line 483
    .line 484
    .line 485
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 486
    .line 487
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 488
    .line 489
    const/16 v0, 0x5c

    .line 490
    .line 491
    aget v0, p2, v0

    .line 492
    .line 493
    xor-int/2addr p1, v0

    .line 494
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 495
    .line 496
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 497
    .line 498
    const/16 v0, 0x5d

    .line 499
    .line 500
    aget v0, p2, v0

    .line 501
    .line 502
    xor-int/2addr p1, v0

    .line 503
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 504
    .line 505
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 506
    .line 507
    const/16 v0, 0x5e

    .line 508
    .line 509
    aget v0, p2, v0

    .line 510
    .line 511
    xor-int/2addr p1, v0

    .line 512
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 513
    .line 514
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 515
    .line 516
    const/16 v0, 0x5f

    .line 517
    .line 518
    aget p2, p2, v0

    .line 519
    .line 520
    xor-int/2addr p1, p2

    .line 521
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 522
    .line 523
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 524
    .line 525
    .line 526
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 527
    .line 528
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 529
    .line 530
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 531
    .line 532
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 533
    .line 534
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib6(IIII)V

    .line 535
    .line 536
    .line 537
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 538
    .line 539
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 540
    .line 541
    const/16 v0, 0x58

    .line 542
    .line 543
    aget v0, p2, v0

    .line 544
    .line 545
    xor-int/2addr p1, v0

    .line 546
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 547
    .line 548
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 549
    .line 550
    const/16 v0, 0x59

    .line 551
    .line 552
    aget v0, p2, v0

    .line 553
    .line 554
    xor-int/2addr p1, v0

    .line 555
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 556
    .line 557
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 558
    .line 559
    const/16 v0, 0x5a

    .line 560
    .line 561
    aget v0, p2, v0

    .line 562
    .line 563
    xor-int/2addr p1, v0

    .line 564
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 565
    .line 566
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 567
    .line 568
    const/16 v0, 0x5b

    .line 569
    .line 570
    aget p2, p2, v0

    .line 571
    .line 572
    xor-int/2addr p1, p2

    .line 573
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 574
    .line 575
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 576
    .line 577
    .line 578
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 579
    .line 580
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 581
    .line 582
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 583
    .line 584
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 585
    .line 586
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib5(IIII)V

    .line 587
    .line 588
    .line 589
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 590
    .line 591
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 592
    .line 593
    const/16 v0, 0x54

    .line 594
    .line 595
    aget v0, p2, v0

    .line 596
    .line 597
    xor-int/2addr p1, v0

    .line 598
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 599
    .line 600
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 601
    .line 602
    const/16 v0, 0x55

    .line 603
    .line 604
    aget v0, p2, v0

    .line 605
    .line 606
    xor-int/2addr p1, v0

    .line 607
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 608
    .line 609
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 610
    .line 611
    const/16 v0, 0x56

    .line 612
    .line 613
    aget v0, p2, v0

    .line 614
    .line 615
    xor-int/2addr p1, v0

    .line 616
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 617
    .line 618
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 619
    .line 620
    const/16 v0, 0x57

    .line 621
    .line 622
    aget p2, p2, v0

    .line 623
    .line 624
    xor-int/2addr p1, p2

    .line 625
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 626
    .line 627
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 628
    .line 629
    .line 630
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 631
    .line 632
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 633
    .line 634
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 635
    .line 636
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 637
    .line 638
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib4(IIII)V

    .line 639
    .line 640
    .line 641
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 642
    .line 643
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 644
    .line 645
    const/16 v0, 0x50

    .line 646
    .line 647
    aget v0, p2, v0

    .line 648
    .line 649
    xor-int/2addr p1, v0

    .line 650
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 651
    .line 652
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 653
    .line 654
    const/16 v0, 0x51

    .line 655
    .line 656
    aget v0, p2, v0

    .line 657
    .line 658
    xor-int/2addr p1, v0

    .line 659
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 660
    .line 661
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 662
    .line 663
    const/16 v0, 0x52

    .line 664
    .line 665
    aget v0, p2, v0

    .line 666
    .line 667
    xor-int/2addr p1, v0

    .line 668
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 669
    .line 670
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 671
    .line 672
    const/16 v0, 0x53

    .line 673
    .line 674
    aget p2, p2, v0

    .line 675
    .line 676
    xor-int/2addr p1, p2

    .line 677
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 678
    .line 679
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 680
    .line 681
    .line 682
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 683
    .line 684
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 685
    .line 686
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 687
    .line 688
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 689
    .line 690
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib3(IIII)V

    .line 691
    .line 692
    .line 693
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 694
    .line 695
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 696
    .line 697
    const/16 v0, 0x4c

    .line 698
    .line 699
    aget v0, p2, v0

    .line 700
    .line 701
    xor-int/2addr p1, v0

    .line 702
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 703
    .line 704
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 705
    .line 706
    const/16 v0, 0x4d

    .line 707
    .line 708
    aget v0, p2, v0

    .line 709
    .line 710
    xor-int/2addr p1, v0

    .line 711
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 712
    .line 713
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 714
    .line 715
    const/16 v0, 0x4e

    .line 716
    .line 717
    aget v0, p2, v0

    .line 718
    .line 719
    xor-int/2addr p1, v0

    .line 720
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 721
    .line 722
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 723
    .line 724
    const/16 v0, 0x4f

    .line 725
    .line 726
    aget p2, p2, v0

    .line 727
    .line 728
    xor-int/2addr p1, p2

    .line 729
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 730
    .line 731
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 732
    .line 733
    .line 734
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 735
    .line 736
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 737
    .line 738
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 739
    .line 740
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 741
    .line 742
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib2(IIII)V

    .line 743
    .line 744
    .line 745
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 746
    .line 747
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 748
    .line 749
    const/16 v0, 0x48

    .line 750
    .line 751
    aget v0, p2, v0

    .line 752
    .line 753
    xor-int/2addr p1, v0

    .line 754
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 755
    .line 756
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 757
    .line 758
    const/16 v0, 0x49

    .line 759
    .line 760
    aget v0, p2, v0

    .line 761
    .line 762
    xor-int/2addr p1, v0

    .line 763
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 764
    .line 765
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 766
    .line 767
    const/16 v0, 0x4a

    .line 768
    .line 769
    aget v0, p2, v0

    .line 770
    .line 771
    xor-int/2addr p1, v0

    .line 772
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 773
    .line 774
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 775
    .line 776
    const/16 v0, 0x4b

    .line 777
    .line 778
    aget p2, p2, v0

    .line 779
    .line 780
    xor-int/2addr p1, p2

    .line 781
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 782
    .line 783
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 784
    .line 785
    .line 786
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 787
    .line 788
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 789
    .line 790
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 791
    .line 792
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 793
    .line 794
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib1(IIII)V

    .line 795
    .line 796
    .line 797
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 798
    .line 799
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 800
    .line 801
    const/16 v0, 0x44

    .line 802
    .line 803
    aget v0, p2, v0

    .line 804
    .line 805
    xor-int/2addr p1, v0

    .line 806
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 807
    .line 808
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 809
    .line 810
    const/16 v0, 0x45

    .line 811
    .line 812
    aget v0, p2, v0

    .line 813
    .line 814
    xor-int/2addr p1, v0

    .line 815
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 816
    .line 817
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 818
    .line 819
    const/16 v0, 0x46

    .line 820
    .line 821
    aget v0, p2, v0

    .line 822
    .line 823
    xor-int/2addr p1, v0

    .line 824
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 825
    .line 826
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 827
    .line 828
    const/16 v0, 0x47

    .line 829
    .line 830
    aget p2, p2, v0

    .line 831
    .line 832
    xor-int/2addr p1, p2

    .line 833
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 834
    .line 835
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 836
    .line 837
    .line 838
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 839
    .line 840
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 841
    .line 842
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 843
    .line 844
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 845
    .line 846
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib0(IIII)V

    .line 847
    .line 848
    .line 849
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 850
    .line 851
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 852
    .line 853
    const/16 v0, 0x40

    .line 854
    .line 855
    aget v0, p2, v0

    .line 856
    .line 857
    xor-int/2addr p1, v0

    .line 858
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 859
    .line 860
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 861
    .line 862
    const/16 v0, 0x41

    .line 863
    .line 864
    aget v0, p2, v0

    .line 865
    .line 866
    xor-int/2addr p1, v0

    .line 867
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 868
    .line 869
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 870
    .line 871
    const/16 v0, 0x42

    .line 872
    .line 873
    aget v0, p2, v0

    .line 874
    .line 875
    xor-int/2addr p1, v0

    .line 876
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 877
    .line 878
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 879
    .line 880
    const/16 v0, 0x43

    .line 881
    .line 882
    aget p2, p2, v0

    .line 883
    .line 884
    xor-int/2addr p1, p2

    .line 885
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 886
    .line 887
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 888
    .line 889
    .line 890
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 891
    .line 892
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 893
    .line 894
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 895
    .line 896
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 897
    .line 898
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib7(IIII)V

    .line 899
    .line 900
    .line 901
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 902
    .line 903
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 904
    .line 905
    const/16 v0, 0x3c

    .line 906
    .line 907
    aget v0, p2, v0

    .line 908
    .line 909
    xor-int/2addr p1, v0

    .line 910
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 911
    .line 912
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 913
    .line 914
    const/16 v0, 0x3d

    .line 915
    .line 916
    aget v0, p2, v0

    .line 917
    .line 918
    xor-int/2addr p1, v0

    .line 919
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 920
    .line 921
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 922
    .line 923
    const/16 v0, 0x3e

    .line 924
    .line 925
    aget v0, p2, v0

    .line 926
    .line 927
    xor-int/2addr p1, v0

    .line 928
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 929
    .line 930
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 931
    .line 932
    const/16 v0, 0x3f

    .line 933
    .line 934
    aget p2, p2, v0

    .line 935
    .line 936
    xor-int/2addr p1, p2

    .line 937
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 938
    .line 939
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 940
    .line 941
    .line 942
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 943
    .line 944
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 945
    .line 946
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 947
    .line 948
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 949
    .line 950
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib6(IIII)V

    .line 951
    .line 952
    .line 953
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 954
    .line 955
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 956
    .line 957
    const/16 v0, 0x38

    .line 958
    .line 959
    aget v0, p2, v0

    .line 960
    .line 961
    xor-int/2addr p1, v0

    .line 962
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 963
    .line 964
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 965
    .line 966
    const/16 v0, 0x39

    .line 967
    .line 968
    aget v0, p2, v0

    .line 969
    .line 970
    xor-int/2addr p1, v0

    .line 971
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 972
    .line 973
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 974
    .line 975
    const/16 v0, 0x3a

    .line 976
    .line 977
    aget v0, p2, v0

    .line 978
    .line 979
    xor-int/2addr p1, v0

    .line 980
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 981
    .line 982
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 983
    .line 984
    const/16 v0, 0x3b

    .line 985
    .line 986
    aget p2, p2, v0

    .line 987
    .line 988
    xor-int/2addr p1, p2

    .line 989
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 990
    .line 991
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 992
    .line 993
    .line 994
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 995
    .line 996
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 997
    .line 998
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 999
    .line 1000
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1001
    .line 1002
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib5(IIII)V

    .line 1003
    .line 1004
    .line 1005
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1006
    .line 1007
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1008
    .line 1009
    const/16 v0, 0x34

    .line 1010
    .line 1011
    aget v0, p2, v0

    .line 1012
    .line 1013
    xor-int/2addr p1, v0

    .line 1014
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1015
    .line 1016
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1017
    .line 1018
    const/16 v0, 0x35

    .line 1019
    .line 1020
    aget v0, p2, v0

    .line 1021
    .line 1022
    xor-int/2addr p1, v0

    .line 1023
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1024
    .line 1025
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1026
    .line 1027
    const/16 v0, 0x36

    .line 1028
    .line 1029
    aget v0, p2, v0

    .line 1030
    .line 1031
    xor-int/2addr p1, v0

    .line 1032
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1033
    .line 1034
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1035
    .line 1036
    const/16 v0, 0x37

    .line 1037
    .line 1038
    aget p2, p2, v0

    .line 1039
    .line 1040
    xor-int/2addr p1, p2

    .line 1041
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1042
    .line 1043
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1044
    .line 1045
    .line 1046
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1047
    .line 1048
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1049
    .line 1050
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1051
    .line 1052
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1053
    .line 1054
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib4(IIII)V

    .line 1055
    .line 1056
    .line 1057
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1058
    .line 1059
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1060
    .line 1061
    const/16 v0, 0x30

    .line 1062
    .line 1063
    aget v0, p2, v0

    .line 1064
    .line 1065
    xor-int/2addr p1, v0

    .line 1066
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1067
    .line 1068
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1069
    .line 1070
    const/16 v0, 0x31

    .line 1071
    .line 1072
    aget v0, p2, v0

    .line 1073
    .line 1074
    xor-int/2addr p1, v0

    .line 1075
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1076
    .line 1077
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1078
    .line 1079
    const/16 v0, 0x32

    .line 1080
    .line 1081
    aget v0, p2, v0

    .line 1082
    .line 1083
    xor-int/2addr p1, v0

    .line 1084
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1085
    .line 1086
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1087
    .line 1088
    const/16 v0, 0x33

    .line 1089
    .line 1090
    aget p2, p2, v0

    .line 1091
    .line 1092
    xor-int/2addr p1, p2

    .line 1093
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1094
    .line 1095
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1096
    .line 1097
    .line 1098
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1099
    .line 1100
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1101
    .line 1102
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1103
    .line 1104
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1105
    .line 1106
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib3(IIII)V

    .line 1107
    .line 1108
    .line 1109
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1110
    .line 1111
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1112
    .line 1113
    const/16 v0, 0x2c

    .line 1114
    .line 1115
    aget v0, p2, v0

    .line 1116
    .line 1117
    xor-int/2addr p1, v0

    .line 1118
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1119
    .line 1120
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1121
    .line 1122
    const/16 v0, 0x2d

    .line 1123
    .line 1124
    aget v0, p2, v0

    .line 1125
    .line 1126
    xor-int/2addr p1, v0

    .line 1127
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1128
    .line 1129
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1130
    .line 1131
    const/16 v0, 0x2e

    .line 1132
    .line 1133
    aget v0, p2, v0

    .line 1134
    .line 1135
    xor-int/2addr p1, v0

    .line 1136
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1137
    .line 1138
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1139
    .line 1140
    const/16 v0, 0x2f

    .line 1141
    .line 1142
    aget p2, p2, v0

    .line 1143
    .line 1144
    xor-int/2addr p1, p2

    .line 1145
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1146
    .line 1147
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1148
    .line 1149
    .line 1150
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1151
    .line 1152
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1153
    .line 1154
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1155
    .line 1156
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1157
    .line 1158
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib2(IIII)V

    .line 1159
    .line 1160
    .line 1161
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1162
    .line 1163
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1164
    .line 1165
    const/16 v0, 0x28

    .line 1166
    .line 1167
    aget v0, p2, v0

    .line 1168
    .line 1169
    xor-int/2addr p1, v0

    .line 1170
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1171
    .line 1172
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1173
    .line 1174
    const/16 v0, 0x29

    .line 1175
    .line 1176
    aget v0, p2, v0

    .line 1177
    .line 1178
    xor-int/2addr p1, v0

    .line 1179
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1180
    .line 1181
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1182
    .line 1183
    const/16 v0, 0x2a

    .line 1184
    .line 1185
    aget v0, p2, v0

    .line 1186
    .line 1187
    xor-int/2addr p1, v0

    .line 1188
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1189
    .line 1190
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1191
    .line 1192
    const/16 v0, 0x2b

    .line 1193
    .line 1194
    aget p2, p2, v0

    .line 1195
    .line 1196
    xor-int/2addr p1, p2

    .line 1197
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1198
    .line 1199
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1200
    .line 1201
    .line 1202
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1203
    .line 1204
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1205
    .line 1206
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1207
    .line 1208
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1209
    .line 1210
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib1(IIII)V

    .line 1211
    .line 1212
    .line 1213
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1214
    .line 1215
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1216
    .line 1217
    const/16 v0, 0x24

    .line 1218
    .line 1219
    aget v0, p2, v0

    .line 1220
    .line 1221
    xor-int/2addr p1, v0

    .line 1222
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1223
    .line 1224
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1225
    .line 1226
    const/16 v0, 0x25

    .line 1227
    .line 1228
    aget v0, p2, v0

    .line 1229
    .line 1230
    xor-int/2addr p1, v0

    .line 1231
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1232
    .line 1233
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1234
    .line 1235
    const/16 v0, 0x26

    .line 1236
    .line 1237
    aget v0, p2, v0

    .line 1238
    .line 1239
    xor-int/2addr p1, v0

    .line 1240
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1241
    .line 1242
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1243
    .line 1244
    const/16 v0, 0x27

    .line 1245
    .line 1246
    aget p2, p2, v0

    .line 1247
    .line 1248
    xor-int/2addr p1, p2

    .line 1249
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1250
    .line 1251
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1252
    .line 1253
    .line 1254
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1255
    .line 1256
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1257
    .line 1258
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1259
    .line 1260
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1261
    .line 1262
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib0(IIII)V

    .line 1263
    .line 1264
    .line 1265
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1266
    .line 1267
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1268
    .line 1269
    const/16 v0, 0x20

    .line 1270
    .line 1271
    aget v0, p2, v0

    .line 1272
    .line 1273
    xor-int/2addr p1, v0

    .line 1274
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1275
    .line 1276
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1277
    .line 1278
    const/16 v0, 0x21

    .line 1279
    .line 1280
    aget v0, p2, v0

    .line 1281
    .line 1282
    xor-int/2addr p1, v0

    .line 1283
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1284
    .line 1285
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1286
    .line 1287
    const/16 v0, 0x22

    .line 1288
    .line 1289
    aget v0, p2, v0

    .line 1290
    .line 1291
    xor-int/2addr p1, v0

    .line 1292
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1293
    .line 1294
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1295
    .line 1296
    const/16 v0, 0x23

    .line 1297
    .line 1298
    aget p2, p2, v0

    .line 1299
    .line 1300
    xor-int/2addr p1, p2

    .line 1301
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1302
    .line 1303
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1304
    .line 1305
    .line 1306
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1307
    .line 1308
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1309
    .line 1310
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1311
    .line 1312
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1313
    .line 1314
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib7(IIII)V

    .line 1315
    .line 1316
    .line 1317
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1318
    .line 1319
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1320
    .line 1321
    const/16 v0, 0x1c

    .line 1322
    .line 1323
    aget v0, p2, v0

    .line 1324
    .line 1325
    xor-int/2addr p1, v0

    .line 1326
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1327
    .line 1328
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1329
    .line 1330
    const/16 v0, 0x1d

    .line 1331
    .line 1332
    aget v0, p2, v0

    .line 1333
    .line 1334
    xor-int/2addr p1, v0

    .line 1335
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1336
    .line 1337
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1338
    .line 1339
    const/16 v0, 0x1e

    .line 1340
    .line 1341
    aget v0, p2, v0

    .line 1342
    .line 1343
    xor-int/2addr p1, v0

    .line 1344
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1345
    .line 1346
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1347
    .line 1348
    const/16 v0, 0x1f

    .line 1349
    .line 1350
    aget p2, p2, v0

    .line 1351
    .line 1352
    xor-int/2addr p1, p2

    .line 1353
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1354
    .line 1355
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1356
    .line 1357
    .line 1358
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1359
    .line 1360
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1361
    .line 1362
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1363
    .line 1364
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1365
    .line 1366
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib6(IIII)V

    .line 1367
    .line 1368
    .line 1369
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1370
    .line 1371
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1372
    .line 1373
    const/16 v0, 0x18

    .line 1374
    .line 1375
    aget v0, p2, v0

    .line 1376
    .line 1377
    xor-int/2addr p1, v0

    .line 1378
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1379
    .line 1380
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1381
    .line 1382
    const/16 v0, 0x19

    .line 1383
    .line 1384
    aget v0, p2, v0

    .line 1385
    .line 1386
    xor-int/2addr p1, v0

    .line 1387
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1388
    .line 1389
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1390
    .line 1391
    const/16 v0, 0x1a

    .line 1392
    .line 1393
    aget v0, p2, v0

    .line 1394
    .line 1395
    xor-int/2addr p1, v0

    .line 1396
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1397
    .line 1398
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1399
    .line 1400
    const/16 v0, 0x1b

    .line 1401
    .line 1402
    aget p2, p2, v0

    .line 1403
    .line 1404
    xor-int/2addr p1, p2

    .line 1405
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1406
    .line 1407
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1408
    .line 1409
    .line 1410
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1411
    .line 1412
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1413
    .line 1414
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1415
    .line 1416
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1417
    .line 1418
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib5(IIII)V

    .line 1419
    .line 1420
    .line 1421
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1422
    .line 1423
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1424
    .line 1425
    const/16 v0, 0x14

    .line 1426
    .line 1427
    aget v0, p2, v0

    .line 1428
    .line 1429
    xor-int/2addr p1, v0

    .line 1430
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1431
    .line 1432
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1433
    .line 1434
    const/16 v0, 0x15

    .line 1435
    .line 1436
    aget v0, p2, v0

    .line 1437
    .line 1438
    xor-int/2addr p1, v0

    .line 1439
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1440
    .line 1441
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1442
    .line 1443
    const/16 v0, 0x16

    .line 1444
    .line 1445
    aget v0, p2, v0

    .line 1446
    .line 1447
    xor-int/2addr p1, v0

    .line 1448
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1449
    .line 1450
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1451
    .line 1452
    const/16 v0, 0x17

    .line 1453
    .line 1454
    aget p2, p2, v0

    .line 1455
    .line 1456
    xor-int/2addr p1, p2

    .line 1457
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1458
    .line 1459
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1460
    .line 1461
    .line 1462
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1463
    .line 1464
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1465
    .line 1466
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1467
    .line 1468
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1469
    .line 1470
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib4(IIII)V

    .line 1471
    .line 1472
    .line 1473
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1474
    .line 1475
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1476
    .line 1477
    const/16 v0, 0x10

    .line 1478
    .line 1479
    aget v0, p2, v0

    .line 1480
    .line 1481
    xor-int/2addr p1, v0

    .line 1482
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1483
    .line 1484
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1485
    .line 1486
    const/16 v0, 0x11

    .line 1487
    .line 1488
    aget v0, p2, v0

    .line 1489
    .line 1490
    xor-int/2addr p1, v0

    .line 1491
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1492
    .line 1493
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1494
    .line 1495
    const/16 v0, 0x12

    .line 1496
    .line 1497
    aget v0, p2, v0

    .line 1498
    .line 1499
    xor-int/2addr p1, v0

    .line 1500
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1501
    .line 1502
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1503
    .line 1504
    const/16 v0, 0x13

    .line 1505
    .line 1506
    aget p2, p2, v0

    .line 1507
    .line 1508
    xor-int/2addr p1, p2

    .line 1509
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1510
    .line 1511
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1512
    .line 1513
    .line 1514
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1515
    .line 1516
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1517
    .line 1518
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1519
    .line 1520
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1521
    .line 1522
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib3(IIII)V

    .line 1523
    .line 1524
    .line 1525
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1526
    .line 1527
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1528
    .line 1529
    aget v0, p2, v1

    .line 1530
    .line 1531
    xor-int/2addr p1, v0

    .line 1532
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1533
    .line 1534
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1535
    .line 1536
    const/16 v0, 0xd

    .line 1537
    .line 1538
    aget v0, p2, v0

    .line 1539
    .line 1540
    xor-int/2addr p1, v0

    .line 1541
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1542
    .line 1543
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1544
    .line 1545
    const/16 v0, 0xe

    .line 1546
    .line 1547
    aget v0, p2, v0

    .line 1548
    .line 1549
    xor-int/2addr p1, v0

    .line 1550
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1551
    .line 1552
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1553
    .line 1554
    const/16 v0, 0xf

    .line 1555
    .line 1556
    aget p2, p2, v0

    .line 1557
    .line 1558
    xor-int/2addr p1, p2

    .line 1559
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1560
    .line 1561
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1562
    .line 1563
    .line 1564
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1565
    .line 1566
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1567
    .line 1568
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1569
    .line 1570
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1571
    .line 1572
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib2(IIII)V

    .line 1573
    .line 1574
    .line 1575
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1576
    .line 1577
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1578
    .line 1579
    const/16 v0, 0x8

    .line 1580
    .line 1581
    aget v0, p2, v0

    .line 1582
    .line 1583
    xor-int/2addr p1, v0

    .line 1584
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1585
    .line 1586
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1587
    .line 1588
    const/16 v0, 0x9

    .line 1589
    .line 1590
    aget v0, p2, v0

    .line 1591
    .line 1592
    xor-int/2addr p1, v0

    .line 1593
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1594
    .line 1595
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1596
    .line 1597
    const/16 v0, 0xa

    .line 1598
    .line 1599
    aget v0, p2, v0

    .line 1600
    .line 1601
    xor-int/2addr p1, v0

    .line 1602
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1603
    .line 1604
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1605
    .line 1606
    const/16 v0, 0xb

    .line 1607
    .line 1608
    aget p2, p2, v0

    .line 1609
    .line 1610
    xor-int/2addr p1, p2

    .line 1611
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1612
    .line 1613
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1614
    .line 1615
    .line 1616
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1617
    .line 1618
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1619
    .line 1620
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1621
    .line 1622
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1623
    .line 1624
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib1(IIII)V

    .line 1625
    .line 1626
    .line 1627
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1628
    .line 1629
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1630
    .line 1631
    const/4 v0, 0x4

    .line 1632
    aget v0, p2, v0

    .line 1633
    .line 1634
    xor-int/2addr p1, v0

    .line 1635
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1636
    .line 1637
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1638
    .line 1639
    const/4 v0, 0x5

    .line 1640
    aget v0, p2, v0

    .line 1641
    .line 1642
    xor-int/2addr p1, v0

    .line 1643
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1644
    .line 1645
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1646
    .line 1647
    const/4 v0, 0x6

    .line 1648
    aget v0, p2, v0

    .line 1649
    .line 1650
    xor-int/2addr p1, v0

    .line 1651
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1652
    .line 1653
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1654
    .line 1655
    const/4 v0, 0x7

    .line 1656
    aget p2, p2, v0

    .line 1657
    .line 1658
    xor-int/2addr p1, p2

    .line 1659
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1660
    .line 1661
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->inverseLT()V

    .line 1662
    .line 1663
    .line 1664
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1665
    .line 1666
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1667
    .line 1668
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1669
    .line 1670
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1671
    .line 1672
    invoke-virtual {p0, p1, p2, v0, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->ib0(IIII)V

    .line 1673
    .line 1674
    .line 1675
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1676
    .line 1677
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1678
    .line 1679
    const/4 v0, 0x3

    .line 1680
    aget p2, p2, v0

    .line 1681
    .line 1682
    xor-int/2addr p1, p2

    .line 1683
    invoke-static {p1, p3, p4}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1684
    .line 1685
    .line 1686
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1687
    .line 1688
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1689
    .line 1690
    const/4 v0, 0x2

    .line 1691
    aget p2, p2, v0

    .line 1692
    .line 1693
    xor-int/2addr p1, p2

    .line 1694
    add-int/lit8 p2, p4, 0x4

    .line 1695
    .line 1696
    invoke-static {p1, p3, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1697
    .line 1698
    .line 1699
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1700
    .line 1701
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1702
    .line 1703
    const/4 v0, 0x1

    .line 1704
    aget p2, p2, v0

    .line 1705
    .line 1706
    xor-int/2addr p1, p2

    .line 1707
    add-int/lit8 p2, p4, 0x8

    .line 1708
    .line 1709
    invoke-static {p1, p3, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1710
    .line 1711
    .line 1712
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1713
    .line 1714
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1715
    .line 1716
    const/4 p2, 0x0

    .line 1717
    aget p0, p0, p2

    .line 1718
    .line 1719
    xor-int/2addr p0, p1

    .line 1720
    add-int/2addr p4, v1

    .line 1721
    invoke-static {p0, p3, p4}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1722
    .line 1723
    .line 1724
    return-void
.end method

.method public encryptBlock([BI[BI)V
    .locals 4

    .line 1
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 6
    .line 7
    add-int/lit8 v0, p2, 0x4

    .line 8
    .line 9
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 14
    .line 15
    add-int/lit8 v0, p2, 0x8

    .line 16
    .line 17
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 22
    .line 23
    const/16 v0, 0xc

    .line 24
    .line 25
    add-int/2addr p2, v0

    .line 26
    invoke-static {p1, p2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 31
    .line 32
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    aget v1, p2, v1

    .line 36
    .line 37
    xor-int/2addr p1, v1

    .line 38
    const/4 v1, 0x1

    .line 39
    aget v1, p2, v1

    .line 40
    .line 41
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 42
    .line 43
    xor-int/2addr v1, v2

    .line 44
    const/4 v2, 0x2

    .line 45
    aget v2, p2, v2

    .line 46
    .line 47
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 48
    .line 49
    xor-int/2addr v2, v3

    .line 50
    const/4 v3, 0x3

    .line 51
    aget p2, p2, v3

    .line 52
    .line 53
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 54
    .line 55
    xor-int/2addr p2, v3

    .line 56
    invoke-virtual {p0, p1, v1, v2, p2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 63
    .line 64
    const/4 p2, 0x4

    .line 65
    aget p2, p1, p2

    .line 66
    .line 67
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 68
    .line 69
    xor-int/2addr p2, v1

    .line 70
    const/4 v1, 0x5

    .line 71
    aget v1, p1, v1

    .line 72
    .line 73
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 74
    .line 75
    xor-int/2addr v1, v2

    .line 76
    const/4 v2, 0x6

    .line 77
    aget v2, p1, v2

    .line 78
    .line 79
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 80
    .line 81
    xor-int/2addr v2, v3

    .line 82
    const/4 v3, 0x7

    .line 83
    aget p1, p1, v3

    .line 84
    .line 85
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 86
    .line 87
    xor-int/2addr p1, v3

    .line 88
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 95
    .line 96
    const/16 p2, 0x8

    .line 97
    .line 98
    aget p2, p1, p2

    .line 99
    .line 100
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 101
    .line 102
    xor-int/2addr p2, v1

    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    aget v1, p1, v1

    .line 106
    .line 107
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 108
    .line 109
    xor-int/2addr v1, v2

    .line 110
    const/16 v2, 0xa

    .line 111
    .line 112
    aget v2, p1, v2

    .line 113
    .line 114
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 115
    .line 116
    xor-int/2addr v2, v3

    .line 117
    const/16 v3, 0xb

    .line 118
    .line 119
    aget p1, p1, v3

    .line 120
    .line 121
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 122
    .line 123
    xor-int/2addr p1, v3

    .line 124
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 131
    .line 132
    aget p2, p1, v0

    .line 133
    .line 134
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 135
    .line 136
    xor-int/2addr p2, v1

    .line 137
    const/16 v1, 0xd

    .line 138
    .line 139
    aget v1, p1, v1

    .line 140
    .line 141
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 142
    .line 143
    xor-int/2addr v1, v2

    .line 144
    const/16 v2, 0xe

    .line 145
    .line 146
    aget v2, p1, v2

    .line 147
    .line 148
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 149
    .line 150
    xor-int/2addr v2, v3

    .line 151
    const/16 v3, 0xf

    .line 152
    .line 153
    aget p1, p1, v3

    .line 154
    .line 155
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 156
    .line 157
    xor-int/2addr p1, v3

    .line 158
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 165
    .line 166
    const/16 p2, 0x10

    .line 167
    .line 168
    aget p2, p1, p2

    .line 169
    .line 170
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 171
    .line 172
    xor-int/2addr p2, v1

    .line 173
    const/16 v1, 0x11

    .line 174
    .line 175
    aget v1, p1, v1

    .line 176
    .line 177
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 178
    .line 179
    xor-int/2addr v1, v2

    .line 180
    const/16 v2, 0x12

    .line 181
    .line 182
    aget v2, p1, v2

    .line 183
    .line 184
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 185
    .line 186
    xor-int/2addr v2, v3

    .line 187
    const/16 v3, 0x13

    .line 188
    .line 189
    aget p1, p1, v3

    .line 190
    .line 191
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 192
    .line 193
    xor-int/2addr p1, v3

    .line 194
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 201
    .line 202
    const/16 p2, 0x14

    .line 203
    .line 204
    aget p2, p1, p2

    .line 205
    .line 206
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 207
    .line 208
    xor-int/2addr p2, v1

    .line 209
    const/16 v1, 0x15

    .line 210
    .line 211
    aget v1, p1, v1

    .line 212
    .line 213
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 214
    .line 215
    xor-int/2addr v1, v2

    .line 216
    const/16 v2, 0x16

    .line 217
    .line 218
    aget v2, p1, v2

    .line 219
    .line 220
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 221
    .line 222
    xor-int/2addr v2, v3

    .line 223
    const/16 v3, 0x17

    .line 224
    .line 225
    aget p1, p1, v3

    .line 226
    .line 227
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 228
    .line 229
    xor-int/2addr p1, v3

    .line 230
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 237
    .line 238
    const/16 p2, 0x18

    .line 239
    .line 240
    aget p2, p1, p2

    .line 241
    .line 242
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 243
    .line 244
    xor-int/2addr p2, v1

    .line 245
    const/16 v1, 0x19

    .line 246
    .line 247
    aget v1, p1, v1

    .line 248
    .line 249
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 250
    .line 251
    xor-int/2addr v1, v2

    .line 252
    const/16 v2, 0x1a

    .line 253
    .line 254
    aget v2, p1, v2

    .line 255
    .line 256
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 257
    .line 258
    xor-int/2addr v2, v3

    .line 259
    const/16 v3, 0x1b

    .line 260
    .line 261
    aget p1, p1, v3

    .line 262
    .line 263
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 264
    .line 265
    xor-int/2addr p1, v3

    .line 266
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 273
    .line 274
    const/16 p2, 0x1c

    .line 275
    .line 276
    aget p2, p1, p2

    .line 277
    .line 278
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 279
    .line 280
    xor-int/2addr p2, v1

    .line 281
    const/16 v1, 0x1d

    .line 282
    .line 283
    aget v1, p1, v1

    .line 284
    .line 285
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 286
    .line 287
    xor-int/2addr v1, v2

    .line 288
    const/16 v2, 0x1e

    .line 289
    .line 290
    aget v2, p1, v2

    .line 291
    .line 292
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 293
    .line 294
    xor-int/2addr v2, v3

    .line 295
    const/16 v3, 0x1f

    .line 296
    .line 297
    aget p1, p1, v3

    .line 298
    .line 299
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 300
    .line 301
    xor-int/2addr p1, v3

    .line 302
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 306
    .line 307
    .line 308
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 309
    .line 310
    const/16 p2, 0x20

    .line 311
    .line 312
    aget p2, p1, p2

    .line 313
    .line 314
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 315
    .line 316
    xor-int/2addr p2, v1

    .line 317
    const/16 v1, 0x21

    .line 318
    .line 319
    aget v1, p1, v1

    .line 320
    .line 321
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 322
    .line 323
    xor-int/2addr v1, v2

    .line 324
    const/16 v2, 0x22

    .line 325
    .line 326
    aget v2, p1, v2

    .line 327
    .line 328
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 329
    .line 330
    xor-int/2addr v2, v3

    .line 331
    const/16 v3, 0x23

    .line 332
    .line 333
    aget p1, p1, v3

    .line 334
    .line 335
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 336
    .line 337
    xor-int/2addr p1, v3

    .line 338
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 345
    .line 346
    const/16 p2, 0x24

    .line 347
    .line 348
    aget p2, p1, p2

    .line 349
    .line 350
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 351
    .line 352
    xor-int/2addr p2, v1

    .line 353
    const/16 v1, 0x25

    .line 354
    .line 355
    aget v1, p1, v1

    .line 356
    .line 357
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 358
    .line 359
    xor-int/2addr v1, v2

    .line 360
    const/16 v2, 0x26

    .line 361
    .line 362
    aget v2, p1, v2

    .line 363
    .line 364
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 365
    .line 366
    xor-int/2addr v2, v3

    .line 367
    const/16 v3, 0x27

    .line 368
    .line 369
    aget p1, p1, v3

    .line 370
    .line 371
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 372
    .line 373
    xor-int/2addr p1, v3

    .line 374
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 378
    .line 379
    .line 380
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 381
    .line 382
    const/16 p2, 0x28

    .line 383
    .line 384
    aget p2, p1, p2

    .line 385
    .line 386
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 387
    .line 388
    xor-int/2addr p2, v1

    .line 389
    const/16 v1, 0x29

    .line 390
    .line 391
    aget v1, p1, v1

    .line 392
    .line 393
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 394
    .line 395
    xor-int/2addr v1, v2

    .line 396
    const/16 v2, 0x2a

    .line 397
    .line 398
    aget v2, p1, v2

    .line 399
    .line 400
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 401
    .line 402
    xor-int/2addr v2, v3

    .line 403
    const/16 v3, 0x2b

    .line 404
    .line 405
    aget p1, p1, v3

    .line 406
    .line 407
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 408
    .line 409
    xor-int/2addr p1, v3

    .line 410
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 414
    .line 415
    .line 416
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 417
    .line 418
    const/16 p2, 0x2c

    .line 419
    .line 420
    aget p2, p1, p2

    .line 421
    .line 422
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 423
    .line 424
    xor-int/2addr p2, v1

    .line 425
    const/16 v1, 0x2d

    .line 426
    .line 427
    aget v1, p1, v1

    .line 428
    .line 429
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 430
    .line 431
    xor-int/2addr v1, v2

    .line 432
    const/16 v2, 0x2e

    .line 433
    .line 434
    aget v2, p1, v2

    .line 435
    .line 436
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 437
    .line 438
    xor-int/2addr v2, v3

    .line 439
    const/16 v3, 0x2f

    .line 440
    .line 441
    aget p1, p1, v3

    .line 442
    .line 443
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 444
    .line 445
    xor-int/2addr p1, v3

    .line 446
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 447
    .line 448
    .line 449
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 450
    .line 451
    .line 452
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 453
    .line 454
    const/16 p2, 0x30

    .line 455
    .line 456
    aget p2, p1, p2

    .line 457
    .line 458
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 459
    .line 460
    xor-int/2addr p2, v1

    .line 461
    const/16 v1, 0x31

    .line 462
    .line 463
    aget v1, p1, v1

    .line 464
    .line 465
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 466
    .line 467
    xor-int/2addr v1, v2

    .line 468
    const/16 v2, 0x32

    .line 469
    .line 470
    aget v2, p1, v2

    .line 471
    .line 472
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 473
    .line 474
    xor-int/2addr v2, v3

    .line 475
    const/16 v3, 0x33

    .line 476
    .line 477
    aget p1, p1, v3

    .line 478
    .line 479
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 480
    .line 481
    xor-int/2addr p1, v3

    .line 482
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    .line 483
    .line 484
    .line 485
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 486
    .line 487
    .line 488
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 489
    .line 490
    const/16 p2, 0x34

    .line 491
    .line 492
    aget p2, p1, p2

    .line 493
    .line 494
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 495
    .line 496
    xor-int/2addr p2, v1

    .line 497
    const/16 v1, 0x35

    .line 498
    .line 499
    aget v1, p1, v1

    .line 500
    .line 501
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 502
    .line 503
    xor-int/2addr v1, v2

    .line 504
    const/16 v2, 0x36

    .line 505
    .line 506
    aget v2, p1, v2

    .line 507
    .line 508
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 509
    .line 510
    xor-int/2addr v2, v3

    .line 511
    const/16 v3, 0x37

    .line 512
    .line 513
    aget p1, p1, v3

    .line 514
    .line 515
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 516
    .line 517
    xor-int/2addr p1, v3

    .line 518
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 522
    .line 523
    .line 524
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 525
    .line 526
    const/16 p2, 0x38

    .line 527
    .line 528
    aget p2, p1, p2

    .line 529
    .line 530
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 531
    .line 532
    xor-int/2addr p2, v1

    .line 533
    const/16 v1, 0x39

    .line 534
    .line 535
    aget v1, p1, v1

    .line 536
    .line 537
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 538
    .line 539
    xor-int/2addr v1, v2

    .line 540
    const/16 v2, 0x3a

    .line 541
    .line 542
    aget v2, p1, v2

    .line 543
    .line 544
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 545
    .line 546
    xor-int/2addr v2, v3

    .line 547
    const/16 v3, 0x3b

    .line 548
    .line 549
    aget p1, p1, v3

    .line 550
    .line 551
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 552
    .line 553
    xor-int/2addr p1, v3

    .line 554
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 558
    .line 559
    .line 560
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 561
    .line 562
    const/16 p2, 0x3c

    .line 563
    .line 564
    aget p2, p1, p2

    .line 565
    .line 566
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 567
    .line 568
    xor-int/2addr p2, v1

    .line 569
    const/16 v1, 0x3d

    .line 570
    .line 571
    aget v1, p1, v1

    .line 572
    .line 573
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 574
    .line 575
    xor-int/2addr v1, v2

    .line 576
    const/16 v2, 0x3e

    .line 577
    .line 578
    aget v2, p1, v2

    .line 579
    .line 580
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 581
    .line 582
    xor-int/2addr v2, v3

    .line 583
    const/16 v3, 0x3f

    .line 584
    .line 585
    aget p1, p1, v3

    .line 586
    .line 587
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 588
    .line 589
    xor-int/2addr p1, v3

    .line 590
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    .line 591
    .line 592
    .line 593
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 594
    .line 595
    .line 596
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 597
    .line 598
    const/16 p2, 0x40

    .line 599
    .line 600
    aget p2, p1, p2

    .line 601
    .line 602
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 603
    .line 604
    xor-int/2addr p2, v1

    .line 605
    const/16 v1, 0x41

    .line 606
    .line 607
    aget v1, p1, v1

    .line 608
    .line 609
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 610
    .line 611
    xor-int/2addr v1, v2

    .line 612
    const/16 v2, 0x42

    .line 613
    .line 614
    aget v2, p1, v2

    .line 615
    .line 616
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 617
    .line 618
    xor-int/2addr v2, v3

    .line 619
    const/16 v3, 0x43

    .line 620
    .line 621
    aget p1, p1, v3

    .line 622
    .line 623
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 624
    .line 625
    xor-int/2addr p1, v3

    .line 626
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    .line 627
    .line 628
    .line 629
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 630
    .line 631
    .line 632
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 633
    .line 634
    const/16 p2, 0x44

    .line 635
    .line 636
    aget p2, p1, p2

    .line 637
    .line 638
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 639
    .line 640
    xor-int/2addr p2, v1

    .line 641
    const/16 v1, 0x45

    .line 642
    .line 643
    aget v1, p1, v1

    .line 644
    .line 645
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 646
    .line 647
    xor-int/2addr v1, v2

    .line 648
    const/16 v2, 0x46

    .line 649
    .line 650
    aget v2, p1, v2

    .line 651
    .line 652
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 653
    .line 654
    xor-int/2addr v2, v3

    .line 655
    const/16 v3, 0x47

    .line 656
    .line 657
    aget p1, p1, v3

    .line 658
    .line 659
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 660
    .line 661
    xor-int/2addr p1, v3

    .line 662
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 663
    .line 664
    .line 665
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 666
    .line 667
    .line 668
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 669
    .line 670
    const/16 p2, 0x48

    .line 671
    .line 672
    aget p2, p1, p2

    .line 673
    .line 674
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 675
    .line 676
    xor-int/2addr p2, v1

    .line 677
    const/16 v1, 0x49

    .line 678
    .line 679
    aget v1, p1, v1

    .line 680
    .line 681
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 682
    .line 683
    xor-int/2addr v1, v2

    .line 684
    const/16 v2, 0x4a

    .line 685
    .line 686
    aget v2, p1, v2

    .line 687
    .line 688
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 689
    .line 690
    xor-int/2addr v2, v3

    .line 691
    const/16 v3, 0x4b

    .line 692
    .line 693
    aget p1, p1, v3

    .line 694
    .line 695
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 696
    .line 697
    xor-int/2addr p1, v3

    .line 698
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 702
    .line 703
    .line 704
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 705
    .line 706
    const/16 p2, 0x4c

    .line 707
    .line 708
    aget p2, p1, p2

    .line 709
    .line 710
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 711
    .line 712
    xor-int/2addr p2, v1

    .line 713
    const/16 v1, 0x4d

    .line 714
    .line 715
    aget v1, p1, v1

    .line 716
    .line 717
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 718
    .line 719
    xor-int/2addr v1, v2

    .line 720
    const/16 v2, 0x4e

    .line 721
    .line 722
    aget v2, p1, v2

    .line 723
    .line 724
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 725
    .line 726
    xor-int/2addr v2, v3

    .line 727
    const/16 v3, 0x4f

    .line 728
    .line 729
    aget p1, p1, v3

    .line 730
    .line 731
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 732
    .line 733
    xor-int/2addr p1, v3

    .line 734
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 735
    .line 736
    .line 737
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 738
    .line 739
    .line 740
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 741
    .line 742
    const/16 p2, 0x50

    .line 743
    .line 744
    aget p2, p1, p2

    .line 745
    .line 746
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 747
    .line 748
    xor-int/2addr p2, v1

    .line 749
    const/16 v1, 0x51

    .line 750
    .line 751
    aget v1, p1, v1

    .line 752
    .line 753
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 754
    .line 755
    xor-int/2addr v1, v2

    .line 756
    const/16 v2, 0x52

    .line 757
    .line 758
    aget v2, p1, v2

    .line 759
    .line 760
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 761
    .line 762
    xor-int/2addr v2, v3

    .line 763
    const/16 v3, 0x53

    .line 764
    .line 765
    aget p1, p1, v3

    .line 766
    .line 767
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 768
    .line 769
    xor-int/2addr p1, v3

    .line 770
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 774
    .line 775
    .line 776
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 777
    .line 778
    const/16 p2, 0x54

    .line 779
    .line 780
    aget p2, p1, p2

    .line 781
    .line 782
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 783
    .line 784
    xor-int/2addr p2, v1

    .line 785
    const/16 v1, 0x55

    .line 786
    .line 787
    aget v1, p1, v1

    .line 788
    .line 789
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 790
    .line 791
    xor-int/2addr v1, v2

    .line 792
    const/16 v2, 0x56

    .line 793
    .line 794
    aget v2, p1, v2

    .line 795
    .line 796
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 797
    .line 798
    xor-int/2addr v2, v3

    .line 799
    const/16 v3, 0x57

    .line 800
    .line 801
    aget p1, p1, v3

    .line 802
    .line 803
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 804
    .line 805
    xor-int/2addr p1, v3

    .line 806
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    .line 807
    .line 808
    .line 809
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 810
    .line 811
    .line 812
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 813
    .line 814
    const/16 p2, 0x58

    .line 815
    .line 816
    aget p2, p1, p2

    .line 817
    .line 818
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 819
    .line 820
    xor-int/2addr p2, v1

    .line 821
    const/16 v1, 0x59

    .line 822
    .line 823
    aget v1, p1, v1

    .line 824
    .line 825
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 826
    .line 827
    xor-int/2addr v1, v2

    .line 828
    const/16 v2, 0x5a

    .line 829
    .line 830
    aget v2, p1, v2

    .line 831
    .line 832
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 833
    .line 834
    xor-int/2addr v2, v3

    .line 835
    const/16 v3, 0x5b

    .line 836
    .line 837
    aget p1, p1, v3

    .line 838
    .line 839
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 840
    .line 841
    xor-int/2addr p1, v3

    .line 842
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    .line 843
    .line 844
    .line 845
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 846
    .line 847
    .line 848
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 849
    .line 850
    const/16 p2, 0x5c

    .line 851
    .line 852
    aget p2, p1, p2

    .line 853
    .line 854
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 855
    .line 856
    xor-int/2addr p2, v1

    .line 857
    const/16 v1, 0x5d

    .line 858
    .line 859
    aget v1, p1, v1

    .line 860
    .line 861
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 862
    .line 863
    xor-int/2addr v1, v2

    .line 864
    const/16 v2, 0x5e

    .line 865
    .line 866
    aget v2, p1, v2

    .line 867
    .line 868
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 869
    .line 870
    xor-int/2addr v2, v3

    .line 871
    const/16 v3, 0x5f

    .line 872
    .line 873
    aget p1, p1, v3

    .line 874
    .line 875
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 876
    .line 877
    xor-int/2addr p1, v3

    .line 878
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    .line 879
    .line 880
    .line 881
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 882
    .line 883
    .line 884
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 885
    .line 886
    const/16 p2, 0x60

    .line 887
    .line 888
    aget p2, p1, p2

    .line 889
    .line 890
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 891
    .line 892
    xor-int/2addr p2, v1

    .line 893
    const/16 v1, 0x61

    .line 894
    .line 895
    aget v1, p1, v1

    .line 896
    .line 897
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 898
    .line 899
    xor-int/2addr v1, v2

    .line 900
    const/16 v2, 0x62

    .line 901
    .line 902
    aget v2, p1, v2

    .line 903
    .line 904
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 905
    .line 906
    xor-int/2addr v2, v3

    .line 907
    const/16 v3, 0x63

    .line 908
    .line 909
    aget p1, p1, v3

    .line 910
    .line 911
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 912
    .line 913
    xor-int/2addr p1, v3

    .line 914
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    .line 915
    .line 916
    .line 917
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 918
    .line 919
    .line 920
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 921
    .line 922
    const/16 p2, 0x64

    .line 923
    .line 924
    aget p2, p1, p2

    .line 925
    .line 926
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 927
    .line 928
    xor-int/2addr p2, v1

    .line 929
    const/16 v1, 0x65

    .line 930
    .line 931
    aget v1, p1, v1

    .line 932
    .line 933
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 934
    .line 935
    xor-int/2addr v1, v2

    .line 936
    const/16 v2, 0x66

    .line 937
    .line 938
    aget v2, p1, v2

    .line 939
    .line 940
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 941
    .line 942
    xor-int/2addr v2, v3

    .line 943
    const/16 v3, 0x67

    .line 944
    .line 945
    aget p1, p1, v3

    .line 946
    .line 947
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 948
    .line 949
    xor-int/2addr p1, v3

    .line 950
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 951
    .line 952
    .line 953
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 954
    .line 955
    .line 956
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 957
    .line 958
    const/16 p2, 0x68

    .line 959
    .line 960
    aget p2, p1, p2

    .line 961
    .line 962
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 963
    .line 964
    xor-int/2addr p2, v1

    .line 965
    const/16 v1, 0x69

    .line 966
    .line 967
    aget v1, p1, v1

    .line 968
    .line 969
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 970
    .line 971
    xor-int/2addr v1, v2

    .line 972
    const/16 v2, 0x6a

    .line 973
    .line 974
    aget v2, p1, v2

    .line 975
    .line 976
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 977
    .line 978
    xor-int/2addr v2, v3

    .line 979
    const/16 v3, 0x6b

    .line 980
    .line 981
    aget p1, p1, v3

    .line 982
    .line 983
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 984
    .line 985
    xor-int/2addr p1, v3

    .line 986
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 987
    .line 988
    .line 989
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 990
    .line 991
    .line 992
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 993
    .line 994
    const/16 p2, 0x6c

    .line 995
    .line 996
    aget p2, p1, p2

    .line 997
    .line 998
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 999
    .line 1000
    xor-int/2addr p2, v1

    .line 1001
    const/16 v1, 0x6d

    .line 1002
    .line 1003
    aget v1, p1, v1

    .line 1004
    .line 1005
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1006
    .line 1007
    xor-int/2addr v1, v2

    .line 1008
    const/16 v2, 0x6e

    .line 1009
    .line 1010
    aget v2, p1, v2

    .line 1011
    .line 1012
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1013
    .line 1014
    xor-int/2addr v2, v3

    .line 1015
    const/16 v3, 0x6f

    .line 1016
    .line 1017
    aget p1, p1, v3

    .line 1018
    .line 1019
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1020
    .line 1021
    xor-int/2addr p1, v3

    .line 1022
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 1023
    .line 1024
    .line 1025
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 1026
    .line 1027
    .line 1028
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1029
    .line 1030
    const/16 p2, 0x70

    .line 1031
    .line 1032
    aget p2, p1, p2

    .line 1033
    .line 1034
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1035
    .line 1036
    xor-int/2addr p2, v1

    .line 1037
    const/16 v1, 0x71

    .line 1038
    .line 1039
    aget v1, p1, v1

    .line 1040
    .line 1041
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1042
    .line 1043
    xor-int/2addr v1, v2

    .line 1044
    const/16 v2, 0x72

    .line 1045
    .line 1046
    aget v2, p1, v2

    .line 1047
    .line 1048
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1049
    .line 1050
    xor-int/2addr v2, v3

    .line 1051
    const/16 v3, 0x73

    .line 1052
    .line 1053
    aget p1, p1, v3

    .line 1054
    .line 1055
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1056
    .line 1057
    xor-int/2addr p1, v3

    .line 1058
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    .line 1059
    .line 1060
    .line 1061
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 1062
    .line 1063
    .line 1064
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1065
    .line 1066
    const/16 p2, 0x74

    .line 1067
    .line 1068
    aget p2, p1, p2

    .line 1069
    .line 1070
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1071
    .line 1072
    xor-int/2addr p2, v1

    .line 1073
    const/16 v1, 0x75

    .line 1074
    .line 1075
    aget v1, p1, v1

    .line 1076
    .line 1077
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1078
    .line 1079
    xor-int/2addr v1, v2

    .line 1080
    const/16 v2, 0x76

    .line 1081
    .line 1082
    aget v2, p1, v2

    .line 1083
    .line 1084
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1085
    .line 1086
    xor-int/2addr v2, v3

    .line 1087
    const/16 v3, 0x77

    .line 1088
    .line 1089
    aget p1, p1, v3

    .line 1090
    .line 1091
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1092
    .line 1093
    xor-int/2addr p1, v3

    .line 1094
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    .line 1095
    .line 1096
    .line 1097
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 1098
    .line 1099
    .line 1100
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1101
    .line 1102
    const/16 p2, 0x78

    .line 1103
    .line 1104
    aget p2, p1, p2

    .line 1105
    .line 1106
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1107
    .line 1108
    xor-int/2addr p2, v1

    .line 1109
    const/16 v1, 0x79

    .line 1110
    .line 1111
    aget v1, p1, v1

    .line 1112
    .line 1113
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1114
    .line 1115
    xor-int/2addr v1, v2

    .line 1116
    const/16 v2, 0x7a

    .line 1117
    .line 1118
    aget v2, p1, v2

    .line 1119
    .line 1120
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1121
    .line 1122
    xor-int/2addr v2, v3

    .line 1123
    const/16 v3, 0x7b

    .line 1124
    .line 1125
    aget p1, p1, v3

    .line 1126
    .line 1127
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1128
    .line 1129
    xor-int/2addr p1, v3

    .line 1130
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    .line 1131
    .line 1132
    .line 1133
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->LT()V

    .line 1134
    .line 1135
    .line 1136
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1137
    .line 1138
    const/16 p2, 0x7c

    .line 1139
    .line 1140
    aget p2, p1, p2

    .line 1141
    .line 1142
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1143
    .line 1144
    xor-int/2addr p2, v1

    .line 1145
    const/16 v1, 0x7d

    .line 1146
    .line 1147
    aget v1, p1, v1

    .line 1148
    .line 1149
    iget v2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1150
    .line 1151
    xor-int/2addr v1, v2

    .line 1152
    const/16 v2, 0x7e

    .line 1153
    .line 1154
    aget v2, p1, v2

    .line 1155
    .line 1156
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1157
    .line 1158
    xor-int/2addr v2, v3

    .line 1159
    const/16 v3, 0x7f

    .line 1160
    .line 1161
    aget p1, p1, v3

    .line 1162
    .line 1163
    iget v3, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1164
    .line 1165
    xor-int/2addr p1, v3

    .line 1166
    invoke-virtual {p0, p2, v1, v2, p1}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    .line 1167
    .line 1168
    .line 1169
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1170
    .line 1171
    const/16 p2, 0x83

    .line 1172
    .line 1173
    aget p1, p1, p2

    .line 1174
    .line 1175
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    .line 1176
    .line 1177
    xor-int/2addr p1, p2

    .line 1178
    invoke-static {p1, p3, p4}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1179
    .line 1180
    .line 1181
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1182
    .line 1183
    const/16 p2, 0x82

    .line 1184
    .line 1185
    aget p1, p1, p2

    .line 1186
    .line 1187
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    .line 1188
    .line 1189
    xor-int/2addr p1, p2

    .line 1190
    add-int/lit8 p2, p4, 0x4

    .line 1191
    .line 1192
    invoke-static {p1, p3, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1193
    .line 1194
    .line 1195
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1196
    .line 1197
    const/16 p2, 0x81

    .line 1198
    .line 1199
    aget p1, p1, p2

    .line 1200
    .line 1201
    iget p2, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    .line 1202
    .line 1203
    xor-int/2addr p1, p2

    .line 1204
    add-int/lit8 p2, p4, 0x8

    .line 1205
    .line 1206
    invoke-static {p1, p3, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1207
    .line 1208
    .line 1209
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->wKey:[I

    .line 1210
    .line 1211
    const/16 p2, 0x80

    .line 1212
    .line 1213
    aget p1, p1, p2

    .line 1214
    .line 1215
    iget p0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    .line 1216
    .line 1217
    xor-int/2addr p0, p1

    .line 1218
    add-int/2addr p4, v0

    .line 1219
    invoke-static {p0, p3, p4}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1220
    .line 1221
    .line 1222
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Tnepres"

    .line 2
    .line 3
    return-object p0
.end method

.method public makeWorkingKey([B)[I
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/16 v0, 0x10

    .line 1
    new-array v1, v0, [I

    .line 2
    array-length v2, p1

    const/4 v3, 0x4

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-lez v2, :cond_0

    add-int/lit8 v6, v5, 0x1

    .line 3
    invoke-static {p1, v2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    move-result v7

    aput v7, v1, v5

    add-int/lit8 v2, v2, -0x4

    move v5, v6

    goto :goto_0

    :cond_0
    if-nez v2, :cond_4

    add-int/lit8 v2, v5, 0x1

    .line 4
    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    move-result p1

    aput p1, v1, v5

    const/16 p1, 0x8

    const/4 v5, 0x1

    if-ge v2, p1, :cond_1

    .line 5
    aput v5, v1, v2

    :cond_1
    const/16 v2, 0x84

    .line 6
    new-array v6, v2, [I

    move v7, p1

    :goto_1
    const v8, -0x61c88647

    const/16 v9, 0xb

    if-ge v7, v0, :cond_2

    add-int/lit8 v10, v7, -0x8

    .line 7
    aget v11, v1, v10

    add-int/lit8 v12, v7, -0x5

    aget v12, v1, v12

    xor-int/2addr v11, v12

    add-int/lit8 v12, v7, -0x3

    aget v12, v1, v12

    xor-int/2addr v11, v12

    add-int/lit8 v12, v7, -0x1

    aget v12, v1, v12

    xor-int/2addr v11, v12

    xor-int/2addr v8, v11

    xor-int/2addr v8, v10

    invoke-static {v8, v9}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->rotateLeft(II)I

    move-result v8

    aput v8, v1, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 8
    :cond_2
    invoke-static {v1, p1, v6, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v1, p1

    :goto_2
    if-ge v1, v2, :cond_3

    add-int/lit8 v7, v1, -0x8

    .line 9
    aget v7, v6, v7

    add-int/lit8 v10, v1, -0x5

    aget v10, v6, v10

    xor-int/2addr v7, v10

    add-int/lit8 v10, v1, -0x3

    aget v10, v6, v10

    xor-int/2addr v7, v10

    add-int/lit8 v10, v1, -0x1

    aget v10, v6, v10

    xor-int/2addr v7, v10

    xor-int/2addr v7, v8

    xor-int/2addr v7, v1

    invoke-static {v7, v9}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->rotateLeft(II)I

    move-result v7

    aput v7, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 10
    :cond_3
    aget v1, v6, v4

    aget v2, v6, v5

    const/4 v7, 0x2

    aget v8, v6, v7

    const/4 v10, 0x3

    aget v11, v6, v10

    invoke-virtual {p0, v1, v2, v8, v11}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 11
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v1, v6, v4

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v1, v6, v5

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v1, v6, v7

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v1, v6, v10

    .line 12
    aget v1, v6, v3

    const/4 v2, 0x5

    aget v4, v6, v2

    const/4 v5, 0x6

    aget v7, v6, v5

    const/4 v8, 0x7

    aget v10, v6, v8

    invoke-virtual {p0, v1, v4, v7, v10}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 13
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v1, v6, v3

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v1, v6, v2

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v1, v6, v5

    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v1, v6, v8

    .line 14
    aget v1, v6, p1

    const/16 v2, 0x9

    aget v3, v6, v2

    const/16 v4, 0xa

    aget v5, v6, v4

    aget v7, v6, v9

    invoke-virtual {p0, v1, v3, v5, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 15
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v1, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v2

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v4

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v9

    const/16 p1, 0xc

    .line 16
    aget v1, v6, p1

    const/16 v2, 0xd

    aget v3, v6, v2

    const/16 v4, 0xe

    aget v5, v6, v4

    const/16 v7, 0xf

    aget v8, v6, v7

    invoke-virtual {p0, v1, v3, v5, v8}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    .line 17
    iget v1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v1, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v2

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v4

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v7

    .line 18
    aget p1, v6, v0

    const/16 v1, 0x11

    aget v2, v6, v1

    const/16 v3, 0x12

    aget v4, v6, v3

    const/16 v5, 0x13

    aget v7, v6, v5

    invoke-virtual {p0, p1, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    .line 19
    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput p1, v6, v0

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x14

    .line 20
    aget v0, v6, p1

    const/16 v1, 0x15

    aget v2, v6, v1

    const/16 v3, 0x16

    aget v4, v6, v3

    const/16 v5, 0x17

    aget v7, v6, v5

    invoke-virtual {p0, v0, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    .line 21
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x18

    .line 22
    aget v0, v6, p1

    const/16 v1, 0x19

    aget v2, v6, v1

    const/16 v3, 0x1a

    aget v4, v6, v3

    const/16 v5, 0x1b

    aget v7, v6, v5

    invoke-virtual {p0, v0, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    .line 23
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x1c

    .line 24
    aget v0, v6, p1

    const/16 v1, 0x1d

    aget v2, v6, v1

    const/16 v3, 0x1e

    aget v4, v6, v3

    const/16 v5, 0x1f

    aget v7, v6, v5

    invoke-virtual {p0, v0, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    .line 25
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x20

    .line 26
    aget v0, v6, p1

    const/16 v1, 0x21

    aget v2, v6, v1

    const/16 v3, 0x22

    aget v4, v6, v3

    const/16 v5, 0x23

    aget v7, v6, v5

    invoke-virtual {p0, v0, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    .line 27
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x24

    .line 28
    aget v0, v6, p1

    const/16 v1, 0x25

    aget v2, v6, v1

    const/16 v3, 0x26

    aget v4, v6, v3

    const/16 v5, 0x27

    aget v7, v6, v5

    invoke-virtual {p0, v0, v2, v4, v7}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    .line 29
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p1, v6, v5

    const/16 p1, 0x28

    .line 30
    aget v0, v6, p1

    const/16 v1, 0x29

    aget v2, v6, v1

    const/16 v3, 0x2a

    aget v4, v6, v3

    const/16 v5, 0x2b

    aget v5, v6, v5

    invoke-virtual {p0, v0, v2, v4, v5}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    .line 31
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput p1, v6, v1

    iget p1, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput p1, v6, v3

    const/16 p1, 0x2b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x2c

    .line 32
    aget p1, v6, p1

    const/16 v0, 0x2d

    aget v0, v6, v0

    const/16 v1, 0x2e

    aget v1, v6, v1

    const/16 v2, 0x2f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    const/16 p1, 0x2c

    .line 33
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x2d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x2e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x2f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x30

    .line 34
    aget p1, v6, p1

    const/16 v0, 0x31

    aget v0, v6, v0

    const/16 v1, 0x32

    aget v1, v6, v1

    const/16 v2, 0x33

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    const/16 p1, 0x30

    .line 35
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x31

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x32

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x33

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x34

    .line 36
    aget p1, v6, p1

    const/16 v0, 0x35

    aget v0, v6, v0

    const/16 v1, 0x36

    aget v1, v6, v1

    const/16 v2, 0x37

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    const/16 p1, 0x34

    .line 37
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x35

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x36

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x37

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x38

    .line 38
    aget p1, v6, p1

    const/16 v0, 0x39

    aget v0, v6, v0

    const/16 v1, 0x3a

    aget v1, v6, v1

    const/16 v2, 0x3b

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    const/16 p1, 0x38

    .line 39
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x39

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x3a

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x3b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x3c

    .line 40
    aget p1, v6, p1

    const/16 v0, 0x3d

    aget v0, v6, v0

    const/16 v1, 0x3e

    aget v1, v6, v1

    const/16 v2, 0x3f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    const/16 p1, 0x3c

    .line 41
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x3d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x3e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x3f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x40

    .line 42
    aget p1, v6, p1

    const/16 v0, 0x41

    aget v0, v6, v0

    const/16 v1, 0x42

    aget v1, v6, v1

    const/16 v2, 0x43

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    const/16 p1, 0x40

    .line 43
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x41

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x42

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x43

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x44

    .line 44
    aget p1, v6, p1

    const/16 v0, 0x45

    aget v0, v6, v0

    const/16 v1, 0x46

    aget v1, v6, v1

    const/16 v2, 0x47

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    const/16 p1, 0x44

    .line 45
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x45

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x46

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x47

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x48

    .line 46
    aget p1, v6, p1

    const/16 v0, 0x49

    aget v0, v6, v0

    const/16 v1, 0x4a

    aget v1, v6, v1

    const/16 v2, 0x4b

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    const/16 p1, 0x48

    .line 47
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x49

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x4a

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x4b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x4c

    .line 48
    aget p1, v6, p1

    const/16 v0, 0x4d

    aget v0, v6, v0

    const/16 v1, 0x4e

    aget v1, v6, v1

    const/16 v2, 0x4f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    const/16 p1, 0x4c

    .line 49
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x4d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x4e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x4f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x50

    .line 50
    aget p1, v6, p1

    const/16 v0, 0x51

    aget v0, v6, v0

    const/16 v1, 0x52

    aget v1, v6, v1

    const/16 v2, 0x53

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    const/16 p1, 0x50

    .line 51
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x51

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x52

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x53

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x54

    .line 52
    aget p1, v6, p1

    const/16 v0, 0x55

    aget v0, v6, v0

    const/16 v1, 0x56

    aget v1, v6, v1

    const/16 v2, 0x57

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    const/16 p1, 0x54

    .line 53
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x55

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x56

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x57

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x58

    .line 54
    aget p1, v6, p1

    const/16 v0, 0x59

    aget v0, v6, v0

    const/16 v1, 0x5a

    aget v1, v6, v1

    const/16 v2, 0x5b

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    const/16 p1, 0x58

    .line 55
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x59

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x5a

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x5b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x5c

    .line 56
    aget p1, v6, p1

    const/16 v0, 0x5d

    aget v0, v6, v0

    const/16 v1, 0x5e

    aget v1, v6, v1

    const/16 v2, 0x5f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    const/16 p1, 0x5c

    .line 57
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x5d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x5e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x5f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x60

    .line 58
    aget p1, v6, p1

    const/16 v0, 0x61

    aget v0, v6, v0

    const/16 v1, 0x62

    aget v1, v6, v1

    const/16 v2, 0x63

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    const/16 p1, 0x60

    .line 59
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x61

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x62

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x63

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x64

    .line 60
    aget p1, v6, p1

    const/16 v0, 0x65

    aget v0, v6, v0

    const/16 v1, 0x66

    aget v1, v6, v1

    const/16 v2, 0x67

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb2(IIII)V

    const/16 p1, 0x64

    .line 61
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x65

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x66

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x67

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x68

    .line 62
    aget p1, v6, p1

    const/16 v0, 0x69

    aget v0, v6, v0

    const/16 v1, 0x6a

    aget v1, v6, v1

    const/16 v2, 0x6b

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb1(IIII)V

    const/16 p1, 0x68

    .line 63
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x69

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x6a

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x6b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x6c

    .line 64
    aget p1, v6, p1

    const/16 v0, 0x6d

    aget v0, v6, v0

    const/16 v1, 0x6e

    aget v1, v6, v1

    const/16 v2, 0x6f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb0(IIII)V

    const/16 p1, 0x6c

    .line 65
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x6d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x6e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x6f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x70

    .line 66
    aget p1, v6, p1

    const/16 v0, 0x71

    aget v0, v6, v0

    const/16 v1, 0x72

    aget v1, v6, v1

    const/16 v2, 0x73

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb7(IIII)V

    const/16 p1, 0x70

    .line 67
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x71

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x72

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x73

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x74

    .line 68
    aget p1, v6, p1

    const/16 v0, 0x75

    aget v0, v6, v0

    const/16 v1, 0x76

    aget v1, v6, v1

    const/16 v2, 0x77

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb6(IIII)V

    const/16 p1, 0x74

    .line 69
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x75

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x76

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x77

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x78

    .line 70
    aget p1, v6, p1

    const/16 v0, 0x79

    aget v0, v6, v0

    const/16 v1, 0x7a

    aget v1, v6, v1

    const/16 v2, 0x7b

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb5(IIII)V

    const/16 p1, 0x78

    .line 71
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x79

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x7a

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x7b

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x7c

    .line 72
    aget p1, v6, p1

    const/16 v0, 0x7d

    aget v0, v6, v0

    const/16 v1, 0x7e

    aget v1, v6, v1

    const/16 v2, 0x7f

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb4(IIII)V

    const/16 p1, 0x7c

    .line 73
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x7d

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x7e

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x7f

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput v0, v6, p1

    const/16 p1, 0x80

    .line 74
    aget p1, v6, p1

    const/16 v0, 0x81

    aget v0, v6, v0

    const/16 v1, 0x82

    aget v1, v6, v1

    const/16 v2, 0x83

    aget v2, v6, v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->sb3(IIII)V

    const/16 p1, 0x80

    .line 75
    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X0:I

    aput v0, v6, p1

    const/16 p1, 0x81

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X1:I

    aput v0, v6, p1

    const/16 p1, 0x82

    iget v0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X2:I

    aput v0, v6, p1

    const/16 p1, 0x83

    iget p0, p0, Lorg/spongycastle/crypto/engines/SerpentEngineBase;->X3:I

    aput p0, v6, p1

    return-object v6

    .line 76
    :cond_4
    const-string p0, "key must be a multiple of 4 bytes"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
