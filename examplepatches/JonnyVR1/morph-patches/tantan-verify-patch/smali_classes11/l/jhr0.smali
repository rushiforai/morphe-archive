.class public final Ll/jhr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bhr0;


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final b:I


# direct methods
.method public constructor <init>(ILcom/google/android/gms/internal/ads/zzgaa;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jhr0;->b:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/jhr0;->a:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 7
    .line 8
    return-void
.end method

.method public static b(ILl/bgw0;)Ll/jhr0;
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    new-instance v1, Ll/mqw0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/mqw0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, -0x2

    .line 13
    :goto_0
    invoke-virtual {v0}, Ll/bgw0;->q()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    if-le v4, v5, :cond_11

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v0}, Ll/bgw0;->s()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    add-int/2addr v6, v5

    .line 34
    invoke-virtual {v0, v6}, Ll/bgw0;->j(I)V

    .line 35
    .line 36
    .line 37
    const v5, 0x5453494c

    .line 38
    .line 39
    .line 40
    const/4 v7, 0x2

    .line 41
    const/4 v8, 0x1

    .line 42
    if-ne v4, v5, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-static {v4, v0}, Ll/jhr0;->b(ILl/bgw0;)Ll/jhr0;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_0
    const/4 v5, 0x0

    .line 55
    sparse-switch v4, :sswitch_data_0

    .line 56
    .line 57
    .line 58
    :goto_1
    move-object v4, v5

    .line 59
    goto/16 :goto_4

    .line 60
    .line 61
    :sswitch_0
    invoke-static {v0}, Ll/lhr0;->a(Ll/bgw0;)Ll/lhr0;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    goto/16 :goto_4

    .line 66
    .line 67
    :sswitch_1
    invoke-static {v0}, Ll/hhr0;->a(Ll/bgw0;)Ll/hhr0;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    goto/16 :goto_4

    .line 72
    .line 73
    :sswitch_2
    invoke-static {v0}, Ll/ghr0;->a(Ll/bgw0;)Ll/ghr0;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    goto/16 :goto_4

    .line 78
    .line 79
    :sswitch_3
    const-string v4, "StreamFormatChunk"

    .line 80
    .line 81
    if-ne v3, v7, :cond_2

    .line 82
    .line 83
    const/4 v9, 0x4

    .line 84
    invoke-virtual {v0, v9}, Ll/bgw0;->l(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 88
    .line 89
    .line 90
    move-result v10

    .line 91
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 92
    .line 93
    .line 94
    move-result v11

    .line 95
    invoke-virtual {v0, v9}, Ll/bgw0;->l(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    sparse-switch v9, :sswitch_data_1

    .line 103
    .line 104
    .line 105
    move-object v12, v5

    .line 106
    goto :goto_2

    .line 107
    :sswitch_4
    const-string v12, "video/mjpeg"

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :sswitch_5
    const-string v12, "video/mp43"

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :sswitch_6
    const-string v12, "video/mp42"

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :sswitch_7
    const-string v12, "video/avc"

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :sswitch_8
    const-string v12, "video/mp4v-es"

    .line 120
    .line 121
    :goto_2
    if-nez v12, :cond_1

    .line 122
    .line 123
    new-instance v10, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string v11, "Ignoring track with unsupported compression "

    .line 126
    .line 127
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    invoke-static {v4, v9}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_1
    new-instance v4, Ll/znr0;

    .line 142
    .line 143
    invoke-direct {v4}, Ll/znr0;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4, v10}, Ll/znr0;->C(I)Ll/znr0;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v4, v11}, Ll/znr0;->i(I)Ll/znr0;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4, v12}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 153
    .line 154
    .line 155
    new-instance v5, Ll/khr0;

    .line 156
    .line 157
    invoke-virtual {v4}, Ll/znr0;->D()Ll/sqr0;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-direct {v5, v4}, Ll/khr0;-><init>(Ll/sqr0;)V

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_2
    if-ne v3, v8, :cond_b

    .line 166
    .line 167
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 168
    .line 169
    .line 170
    move-result v9

    .line 171
    const-string v10, "audio/raw"

    .line 172
    .line 173
    const-string v11, "audio/mp4a-latm"

    .line 174
    .line 175
    if-eq v9, v8, :cond_7

    .line 176
    .line 177
    const/16 v12, 0x55

    .line 178
    .line 179
    if-eq v9, v12, :cond_6

    .line 180
    .line 181
    const/16 v12, 0xff

    .line 182
    .line 183
    if-eq v9, v12, :cond_5

    .line 184
    .line 185
    const/16 v12, 0x2000

    .line 186
    .line 187
    if-eq v9, v12, :cond_4

    .line 188
    .line 189
    const/16 v12, 0x2001

    .line 190
    .line 191
    if-eq v9, v12, :cond_3

    .line 192
    .line 193
    move-object v12, v5

    .line 194
    goto :goto_3

    .line 195
    :cond_3
    const-string v12, "audio/vnd.dts"

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_4
    const-string v12, "audio/ac3"

    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_5
    move-object v12, v11

    .line 202
    goto :goto_3

    .line 203
    :cond_6
    const-string v12, "audio/mpeg"

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_7
    move-object v12, v10

    .line 207
    :goto_3
    if-nez v12, :cond_8

    .line 208
    .line 209
    new-instance v10, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    const-string v11, "Ignoring track with unsupported format tag "

    .line 212
    .line 213
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v9

    .line 223
    invoke-static {v4, v9}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    goto/16 :goto_1

    .line 227
    .line 228
    :cond_8
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    const/4 v9, 0x6

    .line 237
    invoke-virtual {v0, v9}, Ll/bgw0;->l(I)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 241
    .line 242
    .line 243
    move-result v9

    .line 244
    invoke-static {v9}, Ll/mpw0;->z(I)I

    .line 245
    .line 246
    .line 247
    move-result v9

    .line 248
    invoke-virtual {v0}, Ll/bgw0;->z()I

    .line 249
    .line 250
    .line 251
    move-result v13

    .line 252
    new-array v14, v13, [B

    .line 253
    .line 254
    const/4 v15, 0x0

    .line 255
    invoke-virtual {v0, v14, v15, v13}, Ll/bgw0;->g([BII)V

    .line 256
    .line 257
    .line 258
    new-instance v15, Ll/znr0;

    .line 259
    .line 260
    invoke-direct {v15}, Ll/znr0;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v15, v12}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v15, v4}, Ll/znr0;->k0(I)Ll/znr0;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v15, v5}, Ll/znr0;->x(I)Ll/znr0;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    if-eqz v4, :cond_9

    .line 277
    .line 278
    if-eqz v9, :cond_9

    .line 279
    .line 280
    invoke-virtual {v15, v9}, Ll/znr0;->q(I)Ll/znr0;

    .line 281
    .line 282
    .line 283
    :cond_9
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    if-eqz v4, :cond_a

    .line 288
    .line 289
    if-lez v13, :cond_a

    .line 290
    .line 291
    invoke-static {v14}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    invoke-virtual {v15, v4}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 296
    .line 297
    .line 298
    :cond_a
    new-instance v4, Ll/khr0;

    .line 299
    .line 300
    invoke-virtual {v15}, Ll/znr0;->D()Ll/sqr0;

    .line 301
    .line 302
    .line 303
    move-result-object v5

    .line 304
    invoke-direct {v4, v5}, Ll/khr0;-><init>(Ll/sqr0;)V

    .line 305
    .line 306
    .line 307
    goto :goto_4

    .line 308
    :cond_b
    const-string v9, "Ignoring strf box for unsupported track type: "

    .line 309
    .line 310
    invoke-static {v3}, Ll/mpw0;->b(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v10

    .line 314
    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v9

    .line 318
    invoke-static {v4, v9}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    goto/16 :goto_1

    .line 322
    .line 323
    :goto_4
    if-eqz v4, :cond_10

    .line 324
    .line 325
    invoke-interface {v4}, Ll/bhr0;->zza()I

    .line 326
    .line 327
    .line 328
    move-result v5

    .line 329
    const v9, 0x68727473

    .line 330
    .line 331
    .line 332
    if-ne v5, v9, :cond_f

    .line 333
    .line 334
    move-object v3, v4

    .line 335
    check-cast v3, Ll/hhr0;

    .line 336
    .line 337
    iget v3, v3, Ll/hhr0;->a:I

    .line 338
    .line 339
    const v5, 0x73646976

    .line 340
    .line 341
    .line 342
    if-eq v3, v5, :cond_e

    .line 343
    .line 344
    const v5, 0x73647561

    .line 345
    .line 346
    .line 347
    if-eq v3, v5, :cond_d

    .line 348
    .line 349
    const v5, 0x73747874

    .line 350
    .line 351
    .line 352
    if-eq v3, v5, :cond_c

    .line 353
    .line 354
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    const-string v5, "AviStreamHeaderChunk"

    .line 363
    .line 364
    const-string v7, "Found unsupported streamType fourCC: "

    .line 365
    .line 366
    invoke-virtual {v7, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    invoke-static {v5, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    const/4 v3, -0x1

    .line 374
    goto :goto_5

    .line 375
    :cond_c
    const/4 v3, 0x3

    .line 376
    goto :goto_5

    .line 377
    :cond_d
    move v3, v8

    .line 378
    goto :goto_5

    .line 379
    :cond_e
    move v3, v7

    .line 380
    :cond_f
    :goto_5
    invoke-virtual {v1, v4}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 381
    .line 382
    .line 383
    :cond_10
    invoke-virtual {v0, v6}, Ll/bgw0;->k(I)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0, v2}, Ll/bgw0;->j(I)V

    .line 387
    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :cond_11
    new-instance v0, Ll/jhr0;

    .line 392
    .line 393
    invoke-virtual {v1}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    move/from16 v2, p0

    .line 398
    .line 399
    invoke-direct {v0, v2, v1}, Ll/jhr0;-><init>(ILcom/google/android/gms/internal/ads/zzgaa;)V

    .line 400
    .line 401
    .line 402
    return-object v0

    .line 403
    :sswitch_data_0
    .sparse-switch
        0x66727473 -> :sswitch_3
        0x68697661 -> :sswitch_2
        0x68727473 -> :sswitch_1
        0x6e727473 -> :sswitch_0
    .end sparse-switch

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    :sswitch_data_1
    .sparse-switch
        0x30355844 -> :sswitch_8
        0x31435641 -> :sswitch_7
        0x31637661 -> :sswitch_7
        0x3234504d -> :sswitch_6
        0x3334504d -> :sswitch_5
        0x34363248 -> :sswitch_7
        0x34504d46 -> :sswitch_8
        0x44495633 -> :sswitch_8
        0x44495658 -> :sswitch_8
        0x47504a4d -> :sswitch_4
        0x58564944 -> :sswitch_8
        0x64697678 -> :sswitch_8
        0x67706a6d -> :sswitch_4
        0x78766964 -> :sswitch_8
    .end sparse-switch
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll/bhr0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jhr0;->a:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Ll/bhr0;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    if-ne v3, p1, :cond_0

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    iget p0, p0, Ll/jhr0;->b:I

    .line 2
    .line 3
    return p0
.end method
