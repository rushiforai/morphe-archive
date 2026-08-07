.class public final Ll/our0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final h:Ll/ifr0;


# instance fields
.field public a:Ll/ser0;

.field public b:Ll/sgr0;

.field public c:I

.field public d:J

.field public e:Ll/mur0;

.field public f:I

.field public g:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/kur0;->b:Ll/kur0;

    .line 2
    .line 3
    sput-object v0, Ll/our0;->h:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/our0;->c:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/our0;->d:J

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    iput v2, p0, Ll/our0;->f:I

    .line 13
    .line 14
    iput-wide v0, p0, Ll/our0;->g:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x4

    .line 10
    :goto_0
    iput p1, p0, Ll/our0;->c:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/our0;->e:Ll/mur0;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p3, p4}, Ll/mur0;->a(J)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/rur0;->c(Ll/qer0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/our0;->a:Ll/ser0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/our0;->b:Ll/sgr0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/ser0;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/our0;->b:Ll/sgr0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    sget v2, Ll/mpw0;->a:I

    .line 11
    .line 12
    iget v2, v0, Ll/our0;->c:I

    .line 13
    .line 14
    const/4 v3, -0x1

    .line 15
    const/4 v4, 0x4

    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x0

    .line 18
    if-eqz v2, :cond_f

    .line 19
    .line 20
    const/4 v7, 0x2

    .line 21
    const-wide/16 v8, -0x1

    .line 22
    .line 23
    if-eq v2, v5, :cond_d

    .line 24
    .line 25
    const/4 v10, 0x3

    .line 26
    if-eq v2, v7, :cond_5

    .line 27
    .line 28
    if-eq v2, v10, :cond_2

    .line 29
    .line 30
    iget-wide v10, v0, Ll/our0;->g:J

    .line 31
    .line 32
    cmp-long v2, v10, v8

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v5, v6

    .line 38
    :goto_0
    invoke-static {v5}, Ll/lev0;->f(Z)V

    .line 39
    .line 40
    .line 41
    iget-wide v4, v0, Ll/our0;->g:J

    .line 42
    .line 43
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 44
    .line 45
    .line 46
    move-result-wide v7

    .line 47
    sub-long/2addr v4, v7

    .line 48
    iget-object v0, v0, Ll/our0;->e:Ll/mur0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v1, v4, v5}, Ll/mur0;->c(Ll/qer0;J)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    return v3

    .line 60
    :cond_1
    return v6

    .line 61
    :cond_2
    invoke-static {v1}, Ll/rur0;->a(Ll/qer0;)Landroid/util/Pair;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v3, Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Long;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    iput v3, v0, Ll/our0;->f:I

    .line 74
    .line 75
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v2, Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    iget-wide v10, v0, Ll/our0;->d:J

    .line 84
    .line 85
    cmp-long v5, v10, v8

    .line 86
    .line 87
    if-eqz v5, :cond_3

    .line 88
    .line 89
    const-wide v12, 0xffffffffL

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    cmp-long v5, v2, v12

    .line 95
    .line 96
    if-nez v5, :cond_3

    .line 97
    .line 98
    move-wide v2, v10

    .line 99
    :cond_3
    iget v5, v0, Ll/our0;->f:I

    .line 100
    .line 101
    int-to-long v10, v5

    .line 102
    add-long/2addr v10, v2

    .line 103
    iput-wide v10, v0, Ll/our0;->g:J

    .line 104
    .line 105
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    cmp-long v3, v1, v8

    .line 110
    .line 111
    if-eqz v3, :cond_4

    .line 112
    .line 113
    cmp-long v3, v10, v1

    .line 114
    .line 115
    if-lez v3, :cond_4

    .line 116
    .line 117
    new-instance v3, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v5, "Data exceeds input length: "

    .line 120
    .line 121
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v3, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v5, ", "

    .line 128
    .line 129
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    const-string v5, "WavExtractor"

    .line 140
    .line 141
    invoke-static {v5, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iput-wide v1, v0, Ll/our0;->g:J

    .line 145
    .line 146
    move-wide v10, v1

    .line 147
    :cond_4
    iget-object v1, v0, Ll/our0;->e:Ll/mur0;

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    .line 151
    .line 152
    iget v2, v0, Ll/our0;->f:I

    .line 153
    .line 154
    invoke-interface {v1, v2, v10, v11}, Ll/mur0;->b(IJ)V

    .line 155
    .line 156
    .line 157
    iput v4, v0, Ll/our0;->c:I

    .line 158
    .line 159
    return v6

    .line 160
    :cond_5
    invoke-static {v1}, Ll/rur0;->b(Ll/qer0;)Ll/pur0;

    .line 161
    .line 162
    .line 163
    move-result-object v15

    .line 164
    iget v1, v15, Ll/pur0;->a:I

    .line 165
    .line 166
    const/16 v2, 0x11

    .line 167
    .line 168
    if-ne v1, v2, :cond_6

    .line 169
    .line 170
    new-instance v1, Ll/lur0;

    .line 171
    .line 172
    iget-object v2, v0, Ll/our0;->a:Ll/ser0;

    .line 173
    .line 174
    iget-object v3, v0, Ll/our0;->b:Ll/sgr0;

    .line 175
    .line 176
    invoke-direct {v1, v2, v3, v15}, Ll/lur0;-><init>(Ll/ser0;Ll/sgr0;Ll/pur0;)V

    .line 177
    .line 178
    .line 179
    iput-object v1, v0, Ll/our0;->e:Ll/mur0;

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_6
    const/4 v2, 0x6

    .line 183
    if-ne v1, v2, :cond_7

    .line 184
    .line 185
    new-instance v12, Ll/nur0;

    .line 186
    .line 187
    iget-object v13, v0, Ll/our0;->a:Ll/ser0;

    .line 188
    .line 189
    iget-object v14, v0, Ll/our0;->b:Ll/sgr0;

    .line 190
    .line 191
    const-string v16, "audio/g711-alaw"

    .line 192
    .line 193
    const/16 v17, -0x1

    .line 194
    .line 195
    invoke-direct/range {v12 .. v17}, Ll/nur0;-><init>(Ll/ser0;Ll/sgr0;Ll/pur0;Ljava/lang/String;I)V

    .line 196
    .line 197
    .line 198
    iput-object v12, v0, Ll/our0;->e:Ll/mur0;

    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_7
    const/4 v2, 0x7

    .line 202
    if-ne v1, v2, :cond_8

    .line 203
    .line 204
    new-instance v12, Ll/nur0;

    .line 205
    .line 206
    iget-object v13, v0, Ll/our0;->a:Ll/ser0;

    .line 207
    .line 208
    iget-object v14, v0, Ll/our0;->b:Ll/sgr0;

    .line 209
    .line 210
    const-string v16, "audio/g711-mlaw"

    .line 211
    .line 212
    const/16 v17, -0x1

    .line 213
    .line 214
    invoke-direct/range {v12 .. v17}, Ll/nur0;-><init>(Ll/ser0;Ll/sgr0;Ll/pur0;Ljava/lang/String;I)V

    .line 215
    .line 216
    .line 217
    iput-object v12, v0, Ll/our0;->e:Ll/mur0;

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_8
    iget v2, v15, Ll/pur0;->e:I

    .line 221
    .line 222
    if-eq v1, v5, :cond_b

    .line 223
    .line 224
    if-eq v1, v10, :cond_a

    .line 225
    .line 226
    const v3, 0xfffe

    .line 227
    .line 228
    .line 229
    if-eq v1, v3, :cond_b

    .line 230
    .line 231
    :cond_9
    move/from16 v17, v6

    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_a
    const/16 v3, 0x20

    .line 235
    .line 236
    if-ne v2, v3, :cond_9

    .line 237
    .line 238
    :goto_1
    move/from16 v17, v4

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_b
    invoke-static {v2}, Ll/mpw0;->z(I)I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    goto :goto_1

    .line 246
    :goto_2
    if-eqz v17, :cond_c

    .line 247
    .line 248
    new-instance v12, Ll/nur0;

    .line 249
    .line 250
    iget-object v13, v0, Ll/our0;->a:Ll/ser0;

    .line 251
    .line 252
    iget-object v14, v0, Ll/our0;->b:Ll/sgr0;

    .line 253
    .line 254
    const-string v16, "audio/raw"

    .line 255
    .line 256
    invoke-direct/range {v12 .. v17}, Ll/nur0;-><init>(Ll/ser0;Ll/sgr0;Ll/pur0;Ljava/lang/String;I)V

    .line 257
    .line 258
    .line 259
    iput-object v12, v0, Ll/our0;->e:Ll/mur0;

    .line 260
    .line 261
    :goto_3
    iput v10, v0, Ll/our0;->c:I

    .line 262
    .line 263
    return v6

    .line 264
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    const-string v2, "Unsupported WAV format type: "

    .line 267
    .line 268
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    throw v0

    .line 283
    :cond_d
    new-instance v2, Ll/bgw0;

    .line 284
    .line 285
    const/16 v3, 0x8

    .line 286
    .line 287
    invoke-direct {v2, v3}, Ll/bgw0;-><init>(I)V

    .line 288
    .line 289
    .line 290
    invoke-static {v1, v2}, Ll/qur0;->a(Ll/qer0;Ll/bgw0;)Ll/qur0;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    iget v5, v4, Ll/qur0;->a:I

    .line 295
    .line 296
    const v10, 0x64733634

    .line 297
    .line 298
    .line 299
    if-eq v5, v10, :cond_e

    .line 300
    .line 301
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 302
    .line 303
    .line 304
    goto :goto_4

    .line 305
    :cond_e
    check-cast v1, Ll/fer0;

    .line 306
    .line 307
    invoke-virtual {v1, v3, v6}, Ll/fer0;->j(IZ)Z

    .line 308
    .line 309
    .line 310
    invoke-virtual {v2, v6}, Ll/bgw0;->k(I)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    invoke-virtual {v1, v5, v6, v3, v6}, Ll/fer0;->c([BIIZ)Z

    .line 318
    .line 319
    .line 320
    invoke-virtual {v2}, Ll/bgw0;->G()J

    .line 321
    .line 322
    .line 323
    move-result-wide v8

    .line 324
    iget-wide v4, v4, Ll/qur0;->b:J

    .line 325
    .line 326
    long-to-int v2, v4

    .line 327
    add-int/2addr v2, v3

    .line 328
    invoke-virtual {v1, v2, v6}, Ll/fer0;->k(IZ)Z

    .line 329
    .line 330
    .line 331
    :goto_4
    iput-wide v8, v0, Ll/our0;->d:J

    .line 332
    .line 333
    iput v7, v0, Ll/our0;->c:I

    .line 334
    .line 335
    return v6

    .line 336
    :cond_f
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 337
    .line 338
    .line 339
    move-result-wide v7

    .line 340
    const-wide/16 v9, 0x0

    .line 341
    .line 342
    cmp-long v2, v7, v9

    .line 343
    .line 344
    if-nez v2, :cond_10

    .line 345
    .line 346
    move v2, v5

    .line 347
    goto :goto_5

    .line 348
    :cond_10
    move v2, v6

    .line 349
    :goto_5
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 350
    .line 351
    .line 352
    iget v2, v0, Ll/our0;->f:I

    .line 353
    .line 354
    if-eq v2, v3, :cond_11

    .line 355
    .line 356
    check-cast v1, Ll/fer0;

    .line 357
    .line 358
    invoke-virtual {v1, v2, v6}, Ll/fer0;->k(IZ)Z

    .line 359
    .line 360
    .line 361
    iput v4, v0, Ll/our0;->c:I

    .line 362
    .line 363
    goto :goto_6

    .line 364
    :cond_11
    invoke-static {v1}, Ll/rur0;->c(Ll/qer0;)Z

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    if-eqz v2, :cond_12

    .line 369
    .line 370
    invoke-interface {v1}, Ll/qer0;->zze()J

    .line 371
    .line 372
    .line 373
    move-result-wide v2

    .line 374
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 375
    .line 376
    .line 377
    move-result-wide v7

    .line 378
    sub-long/2addr v2, v7

    .line 379
    check-cast v1, Ll/fer0;

    .line 380
    .line 381
    long-to-int v2, v2

    .line 382
    invoke-virtual {v1, v2, v6}, Ll/fer0;->k(IZ)Z

    .line 383
    .line 384
    .line 385
    iput v5, v0, Ll/our0;->c:I

    .line 386
    .line 387
    :goto_6
    return v6

    .line 388
    :cond_12
    const-string v0, "Unsupported or unrecognized wav file type."

    .line 389
    .line 390
    const/4 v1, 0x0

    .line 391
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    throw v0
.end method
