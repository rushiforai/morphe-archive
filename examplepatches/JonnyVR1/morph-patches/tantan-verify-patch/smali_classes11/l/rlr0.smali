.class public final Ll/rlr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final q:Ll/ifr0;

.field public static final r:Ll/sjr0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/vfr0;

.field public final c:Ll/rfr0;

.field public final d:Ll/tfr0;

.field public final e:Ll/sgr0;

.field public f:Ll/ser0;

.field public g:Ll/sgr0;

.field public h:Ll/sgr0;

.field public i:I

.field public j:Lcom/google/android/gms/internal/ads/zzby;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:J

.field public l:J

.field public m:J

.field public n:I

.field public o:Ll/tlr0;

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/plr0;->b:Ll/plr0;

    .line 2
    .line 3
    sput-object v0, Ll/rlr0;->q:Ll/ifr0;

    .line 4
    .line 5
    sget-object v0, Ll/qlr0;->a:Ll/qlr0;

    .line 6
    .line 7
    sput-object v0, Ll/rlr0;->r:Ll/sjr0;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, v0}, Ll/rlr0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/bgw0;

    .line 5
    .line 6
    const/16 v0, 0xa

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 12
    .line 13
    new-instance p1, Ll/vfr0;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/vfr0;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/rlr0;->b:Ll/vfr0;

    .line 19
    .line 20
    new-instance p1, Ll/rfr0;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/rfr0;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/rlr0;->c:Ll/rfr0;

    .line 26
    .line 27
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    iput-wide v0, p0, Ll/rlr0;->k:J

    .line 33
    .line 34
    new-instance p1, Ll/tfr0;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/tfr0;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/rlr0;->d:Ll/tfr0;

    .line 40
    .line 41
    new-instance p1, Ll/oer0;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/oer0;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/rlr0;->e:Ll/sgr0;

    .line 47
    .line 48
    iput-object p1, p0, Ll/rlr0;->h:Ll/sgr0;

    .line 49
    .line 50
    return-void
.end method

.method public static i(IJ)Z
    .locals 4

    .line 1
    const v0, -0x1f400

    .line 2
    .line 3
    .line 4
    and-int/2addr p0, v0

    .line 5
    int-to-long v0, p0

    .line 6
    const-wide/32 v2, -0x1f400

    .line 7
    .line 8
    .line 9
    and-long p0, p1, v2

    .line 10
    .line 11
    cmp-long p0, v0, p0

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rlr0;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public final b(Ll/qer0;)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "extractorOutput",
            "realTrackOutput"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ll/rlr0;->i:I

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-virtual {v0, v1, v4}, Ll/rlr0;->k(Ll/qer0;Z)Z
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    return v3

    .line 16
    :cond_0
    :goto_0
    iget-object v2, v0, Ll/rlr0;->o:Ll/tlr0;

    .line 17
    .line 18
    const/4 v7, 0x0

    .line 19
    const/4 v8, 0x1

    .line 20
    if-nez v2, :cond_13

    .line 21
    .line 22
    iget-object v2, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 23
    .line 24
    new-instance v14, Ll/bgw0;

    .line 25
    .line 26
    iget v2, v2, Ll/vfr0;->c:I

    .line 27
    .line 28
    invoke-direct {v14, v2}, Ll/bgw0;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v14}, Ll/bgw0;->m()[B

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v9, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 36
    .line 37
    iget v9, v9, Ll/vfr0;->c:I

    .line 38
    .line 39
    move-object v10, v1

    .line 40
    check-cast v10, Ll/fer0;

    .line 41
    .line 42
    invoke-virtual {v10, v2, v4, v9, v4}, Ll/fer0;->c([BIIZ)Z

    .line 43
    .line 44
    .line 45
    iget-object v2, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 46
    .line 47
    iget v9, v2, Ll/vfr0;->a:I

    .line 48
    .line 49
    and-int/2addr v9, v8

    .line 50
    iget v2, v2, Ll/vfr0;->e:I

    .line 51
    .line 52
    const/16 v10, 0x15

    .line 53
    .line 54
    const/16 v11, 0x24

    .line 55
    .line 56
    if-eqz v9, :cond_1

    .line 57
    .line 58
    if-eq v2, v8, :cond_3

    .line 59
    .line 60
    move v10, v11

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    if-eq v2, v8, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const/16 v10, 0xd

    .line 66
    .line 67
    :cond_3
    :goto_1
    invoke-virtual {v14}, Ll/bgw0;->t()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    add-int/lit8 v9, v10, 0x4

    .line 72
    .line 73
    const v12, 0x58696e67

    .line 74
    .line 75
    .line 76
    const v13, 0x56425249

    .line 77
    .line 78
    .line 79
    const v15, 0x496e666f

    .line 80
    .line 81
    .line 82
    if-lt v2, v9, :cond_4

    .line 83
    .line 84
    invoke-virtual {v14, v10}, Ll/bgw0;->k(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v14}, Ll/bgw0;->v()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eq v2, v12, :cond_6

    .line 92
    .line 93
    if-ne v2, v15, :cond_4

    .line 94
    .line 95
    move v2, v15

    .line 96
    goto :goto_2

    .line 97
    :cond_4
    invoke-virtual {v14}, Ll/bgw0;->t()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    const/16 v9, 0x28

    .line 102
    .line 103
    if-lt v2, v9, :cond_5

    .line 104
    .line 105
    invoke-virtual {v14, v11}, Ll/bgw0;->k(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v14}, Ll/bgw0;->v()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-ne v2, v13, :cond_5

    .line 113
    .line 114
    move v2, v13

    .line 115
    goto :goto_2

    .line 116
    :cond_5
    move v2, v4

    .line 117
    :cond_6
    :goto_2
    if-eq v2, v15, :cond_8

    .line 118
    .line 119
    if-eq v2, v13, :cond_7

    .line 120
    .line 121
    if-eq v2, v12, :cond_8

    .line 122
    .line 123
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 124
    .line 125
    .line 126
    move-object v2, v7

    .line 127
    goto :goto_3

    .line 128
    :cond_7
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 129
    .line 130
    .line 131
    move-result-wide v9

    .line 132
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 133
    .line 134
    .line 135
    move-result-wide v11

    .line 136
    iget-object v13, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 137
    .line 138
    invoke-static/range {v9 .. v14}, Ll/ulr0;->c(JJLl/vfr0;Ll/bgw0;)Ll/ulr0;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iget-object v9, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 143
    .line 144
    iget v9, v9, Ll/vfr0;->c:I

    .line 145
    .line 146
    move-object v10, v1

    .line 147
    check-cast v10, Ll/fer0;

    .line 148
    .line 149
    invoke-virtual {v10, v9, v4}, Ll/fer0;->k(IZ)Z

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_8
    iget-object v9, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 154
    .line 155
    invoke-static {v9, v14}, Ll/vlr0;->a(Ll/vfr0;Ll/bgw0;)Ll/vlr0;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    iget-object v10, v0, Ll/rlr0;->c:Ll/rfr0;

    .line 160
    .line 161
    invoke-virtual {v10}, Ll/rfr0;->a()Z

    .line 162
    .line 163
    .line 164
    move-result v11

    .line 165
    if-nez v11, :cond_9

    .line 166
    .line 167
    iget v11, v9, Ll/vlr0;->d:I

    .line 168
    .line 169
    if-eq v11, v3, :cond_9

    .line 170
    .line 171
    iget v12, v9, Ll/vlr0;->e:I

    .line 172
    .line 173
    if-eq v12, v3, :cond_9

    .line 174
    .line 175
    iput v11, v10, Ll/rfr0;->a:I

    .line 176
    .line 177
    iput v12, v10, Ll/rfr0;->b:I

    .line 178
    .line 179
    :cond_9
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 180
    .line 181
    .line 182
    move-result-wide v10

    .line 183
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 184
    .line 185
    .line 186
    move-result-wide v12

    .line 187
    invoke-static {v10, v11, v9, v12, v13}, Ll/wlr0;->c(JLl/vlr0;J)Ll/wlr0;

    .line 188
    .line 189
    .line 190
    move-result-object v9

    .line 191
    iget-object v10, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 192
    .line 193
    iget v10, v10, Ll/vfr0;->c:I

    .line 194
    .line 195
    move-object v11, v1

    .line 196
    check-cast v11, Ll/fer0;

    .line 197
    .line 198
    invoke-virtual {v11, v10, v4}, Ll/fer0;->k(IZ)Z

    .line 199
    .line 200
    .line 201
    invoke-interface {v9}, Ll/bgr0;->zzh()Z

    .line 202
    .line 203
    .line 204
    move-result v10

    .line 205
    if-nez v10, :cond_a

    .line 206
    .line 207
    if-ne v2, v15, :cond_a

    .line 208
    .line 209
    invoke-virtual {v0, v1, v4}, Ll/rlr0;->h(Ll/qer0;Z)Ll/tlr0;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    goto :goto_3

    .line 214
    :cond_a
    move-object v2, v9

    .line 215
    :goto_3
    iget-object v9, v0, Ll/rlr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 216
    .line 217
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 218
    .line 219
    .line 220
    move-result-wide v10

    .line 221
    if-eqz v9, :cond_e

    .line 222
    .line 223
    invoke-virtual {v9}, Lcom/google/android/gms/internal/ads/zzby;->a()I

    .line 224
    .line 225
    .line 226
    move-result v12

    .line 227
    move v13, v4

    .line 228
    :goto_4
    if-ge v13, v12, :cond_e

    .line 229
    .line 230
    invoke-virtual {v9, v13}, Lcom/google/android/gms/internal/ads/zzby;->b(I)Lcom/google/android/gms/internal/ads/zzbx;

    .line 231
    .line 232
    .line 233
    move-result-object v14

    .line 234
    instance-of v15, v14, Lcom/google/android/gms/internal/ads/zzagv;

    .line 235
    .line 236
    if-eqz v15, :cond_d

    .line 237
    .line 238
    check-cast v14, Lcom/google/android/gms/internal/ads/zzagv;

    .line 239
    .line 240
    invoke-virtual {v9}, Lcom/google/android/gms/internal/ads/zzby;->a()I

    .line 241
    .line 242
    .line 243
    move-result v12

    .line 244
    move v13, v4

    .line 245
    :goto_5
    if-ge v13, v12, :cond_c

    .line 246
    .line 247
    invoke-virtual {v9, v13}, Lcom/google/android/gms/internal/ads/zzby;->b(I)Lcom/google/android/gms/internal/ads/zzbx;

    .line 248
    .line 249
    .line 250
    move-result-object v15

    .line 251
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    instance-of v5, v15, Lcom/google/android/gms/internal/ads/zzagz;

    .line 257
    .line 258
    if-eqz v5, :cond_b

    .line 259
    .line 260
    check-cast v15, Lcom/google/android/gms/internal/ads/zzagz;

    .line 261
    .line 262
    iget-object v5, v15, Lcom/google/android/gms/internal/ads/zzagr;->zzf:Ljava/lang/String;

    .line 263
    .line 264
    const-string v6, "TLEN"

    .line 265
    .line 266
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    if-eqz v5, :cond_b

    .line 271
    .line 272
    iget-object v5, v15, Lcom/google/android/gms/internal/ads/zzagz;->zzc:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 273
    .line 274
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    check-cast v5, Ljava/lang/String;

    .line 279
    .line 280
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 281
    .line 282
    .line 283
    move-result-wide v5

    .line 284
    invoke-static {v5, v6}, Ll/mpw0;->F(J)J

    .line 285
    .line 286
    .line 287
    move-result-wide v5

    .line 288
    goto :goto_6

    .line 289
    :cond_b
    add-int/lit8 v13, v13, 0x1

    .line 290
    .line 291
    goto :goto_5

    .line 292
    :cond_c
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    move-wide/from16 v5, v16

    .line 298
    .line 299
    :goto_6
    invoke-static {v10, v11, v14, v5, v6}, Ll/olr0;->c(JLcom/google/android/gms/internal/ads/zzagv;J)Ll/olr0;

    .line 300
    .line 301
    .line 302
    move-result-object v5

    .line 303
    goto :goto_7

    .line 304
    :cond_d
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    add-int/lit8 v13, v13, 0x1

    .line 310
    .line 311
    goto :goto_4

    .line 312
    :cond_e
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    move-object v5, v7

    .line 318
    :goto_7
    iget-boolean v6, v0, Ll/rlr0;->p:Z

    .line 319
    .line 320
    if-eqz v6, :cond_f

    .line 321
    .line 322
    new-instance v2, Ll/slr0;

    .line 323
    .line 324
    invoke-direct {v2}, Ll/slr0;-><init>()V

    .line 325
    .line 326
    .line 327
    goto :goto_9

    .line 328
    :cond_f
    if-eqz v5, :cond_10

    .line 329
    .line 330
    move-object v2, v5

    .line 331
    goto :goto_8

    .line 332
    :cond_10
    if-nez v2, :cond_11

    .line 333
    .line 334
    move-object v2, v7

    .line 335
    :cond_11
    :goto_8
    if-eqz v2, :cond_12

    .line 336
    .line 337
    invoke-interface {v2}, Ll/bgr0;->zzh()Z

    .line 338
    .line 339
    .line 340
    goto :goto_9

    .line 341
    :cond_12
    invoke-virtual {v0, v1, v4}, Ll/rlr0;->h(Ll/qer0;Z)Ll/tlr0;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    :goto_9
    iput-object v2, v0, Ll/rlr0;->o:Ll/tlr0;

    .line 346
    .line 347
    iget-object v5, v0, Ll/rlr0;->f:Ll/ser0;

    .line 348
    .line 349
    invoke-interface {v5, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 350
    .line 351
    .line 352
    iget-object v2, v0, Ll/rlr0;->h:Ll/sgr0;

    .line 353
    .line 354
    new-instance v5, Ll/znr0;

    .line 355
    .line 356
    invoke-direct {v5}, Ll/znr0;-><init>()V

    .line 357
    .line 358
    .line 359
    iget-object v6, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 360
    .line 361
    iget-object v6, v6, Ll/vfr0;->b:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v5, v6}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 364
    .line 365
    .line 366
    const/16 v6, 0x1000

    .line 367
    .line 368
    invoke-virtual {v5, v6}, Ll/znr0;->o(I)Ll/znr0;

    .line 369
    .line 370
    .line 371
    iget-object v6, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 372
    .line 373
    iget v6, v6, Ll/vfr0;->e:I

    .line 374
    .line 375
    invoke-virtual {v5, v6}, Ll/znr0;->k0(I)Ll/znr0;

    .line 376
    .line 377
    .line 378
    iget-object v6, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 379
    .line 380
    iget v6, v6, Ll/vfr0;->d:I

    .line 381
    .line 382
    invoke-virtual {v5, v6}, Ll/znr0;->x(I)Ll/znr0;

    .line 383
    .line 384
    .line 385
    iget-object v6, v0, Ll/rlr0;->c:Ll/rfr0;

    .line 386
    .line 387
    iget v6, v6, Ll/rfr0;->a:I

    .line 388
    .line 389
    invoke-virtual {v5, v6}, Ll/znr0;->f(I)Ll/znr0;

    .line 390
    .line 391
    .line 392
    iget-object v6, v0, Ll/rlr0;->c:Ll/rfr0;

    .line 393
    .line 394
    iget v6, v6, Ll/rfr0;->b:I

    .line 395
    .line 396
    invoke-virtual {v5, v6}, Ll/znr0;->g(I)Ll/znr0;

    .line 397
    .line 398
    .line 399
    iget-object v6, v0, Ll/rlr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 400
    .line 401
    invoke-virtual {v5, v6}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 402
    .line 403
    .line 404
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    invoke-interface {v2, v5}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 409
    .line 410
    .line 411
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 412
    .line 413
    .line 414
    move-result-wide v5

    .line 415
    iput-wide v5, v0, Ll/rlr0;->m:J

    .line 416
    .line 417
    goto :goto_a

    .line 418
    :cond_13
    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    iget-wide v5, v0, Ll/rlr0;->m:J

    .line 424
    .line 425
    const-wide/16 v9, 0x0

    .line 426
    .line 427
    cmp-long v2, v5, v9

    .line 428
    .line 429
    if-eqz v2, :cond_14

    .line 430
    .line 431
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 432
    .line 433
    .line 434
    move-result-wide v9

    .line 435
    cmp-long v2, v9, v5

    .line 436
    .line 437
    if-gez v2, :cond_14

    .line 438
    .line 439
    sub-long/2addr v5, v9

    .line 440
    move-object v2, v1

    .line 441
    check-cast v2, Ll/fer0;

    .line 442
    .line 443
    long-to-int v5, v5

    .line 444
    invoke-virtual {v2, v5, v4}, Ll/fer0;->k(IZ)Z

    .line 445
    .line 446
    .line 447
    :cond_14
    :goto_a
    iget v2, v0, Ll/rlr0;->n:I

    .line 448
    .line 449
    if-nez v2, :cond_1a

    .line 450
    .line 451
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 452
    .line 453
    .line 454
    invoke-virtual/range {p0 .. p1}, Ll/rlr0;->j(Ll/qer0;)Z

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    if-eqz v2, :cond_15

    .line 459
    .line 460
    return v3

    .line 461
    :cond_15
    iget-object v2, v0, Ll/rlr0;->a:Ll/bgw0;

    .line 462
    .line 463
    invoke-virtual {v2, v4}, Ll/bgw0;->k(I)V

    .line 464
    .line 465
    .line 466
    iget-object v2, v0, Ll/rlr0;->a:Ll/bgw0;

    .line 467
    .line 468
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    iget v5, v0, Ll/rlr0;->i:I

    .line 473
    .line 474
    int-to-long v5, v5

    .line 475
    invoke-static {v2, v5, v6}, Ll/rlr0;->i(IJ)Z

    .line 476
    .line 477
    .line 478
    move-result v5

    .line 479
    if-eqz v5, :cond_19

    .line 480
    .line 481
    invoke-static {v2}, Ll/wfr0;->b(I)I

    .line 482
    .line 483
    .line 484
    move-result v5

    .line 485
    if-ne v5, v3, :cond_16

    .line 486
    .line 487
    goto :goto_b

    .line 488
    :cond_16
    iget-object v5, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 489
    .line 490
    invoke-virtual {v5, v2}, Ll/vfr0;->a(I)Z

    .line 491
    .line 492
    .line 493
    iget-wide v5, v0, Ll/rlr0;->k:J

    .line 494
    .line 495
    cmp-long v2, v5, v16

    .line 496
    .line 497
    if-nez v2, :cond_17

    .line 498
    .line 499
    iget-object v2, v0, Ll/rlr0;->o:Ll/tlr0;

    .line 500
    .line 501
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 502
    .line 503
    .line 504
    move-result-wide v5

    .line 505
    invoke-interface {v2, v5, v6}, Ll/tlr0;->b(J)J

    .line 506
    .line 507
    .line 508
    move-result-wide v5

    .line 509
    iput-wide v5, v0, Ll/rlr0;->k:J

    .line 510
    .line 511
    :cond_17
    iget-object v2, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 512
    .line 513
    iget v5, v2, Ll/vfr0;->c:I

    .line 514
    .line 515
    iput v5, v0, Ll/rlr0;->n:I

    .line 516
    .line 517
    iget-object v6, v0, Ll/rlr0;->o:Ll/tlr0;

    .line 518
    .line 519
    instance-of v6, v6, Ll/nlr0;

    .line 520
    .line 521
    if-nez v6, :cond_18

    .line 522
    .line 523
    move v2, v5

    .line 524
    goto :goto_c

    .line 525
    :cond_18
    iget-wide v3, v0, Ll/rlr0;->l:J

    .line 526
    .line 527
    iget v1, v2, Ll/vfr0;->g:I

    .line 528
    .line 529
    int-to-long v1, v1

    .line 530
    add-long/2addr v3, v1

    .line 531
    invoke-virtual {v0, v3, v4}, Ll/rlr0;->g(J)J

    .line 532
    .line 533
    .line 534
    throw v7

    .line 535
    :cond_19
    :goto_b
    check-cast v1, Ll/fer0;

    .line 536
    .line 537
    invoke-virtual {v1, v8, v4}, Ll/fer0;->k(IZ)Z

    .line 538
    .line 539
    .line 540
    iput v4, v0, Ll/rlr0;->i:I

    .line 541
    .line 542
    return v4

    .line 543
    :cond_1a
    :goto_c
    iget-object v5, v0, Ll/rlr0;->h:Ll/sgr0;

    .line 544
    .line 545
    invoke-interface {v5, v1, v2, v8}, Ll/sgr0;->e(Ll/nyy0;IZ)I

    .line 546
    .line 547
    .line 548
    move-result v1

    .line 549
    if-ne v1, v3, :cond_1b

    .line 550
    .line 551
    return v3

    .line 552
    :cond_1b
    iget v2, v0, Ll/rlr0;->n:I

    .line 553
    .line 554
    sub-int/2addr v2, v1

    .line 555
    iput v2, v0, Ll/rlr0;->n:I

    .line 556
    .line 557
    if-lez v2, :cond_1c

    .line 558
    .line 559
    return v4

    .line 560
    :cond_1c
    iget-object v5, v0, Ll/rlr0;->h:Ll/sgr0;

    .line 561
    .line 562
    iget-wide v1, v0, Ll/rlr0;->l:J

    .line 563
    .line 564
    invoke-virtual {v0, v1, v2}, Ll/rlr0;->g(J)J

    .line 565
    .line 566
    .line 567
    move-result-wide v6

    .line 568
    iget-object v1, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 569
    .line 570
    iget v9, v1, Ll/vfr0;->c:I

    .line 571
    .line 572
    const/4 v10, 0x0

    .line 573
    const/4 v11, 0x0

    .line 574
    const/4 v8, 0x1

    .line 575
    invoke-interface/range {v5 .. v11}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 576
    .line 577
    .line 578
    iget-wide v1, v0, Ll/rlr0;->l:J

    .line 579
    .line 580
    iget-object v3, v0, Ll/rlr0;->b:Ll/vfr0;

    .line 581
    .line 582
    iget v3, v3, Ll/vfr0;->g:I

    .line 583
    .line 584
    int-to-long v5, v3

    .line 585
    add-long/2addr v1, v5

    .line 586
    iput-wide v1, v0, Ll/rlr0;->l:J

    .line 587
    .line 588
    iput v4, v0, Ll/rlr0;->n:I

    .line 589
    .line 590
    return v4
.end method

.method public final c(JJ)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Ll/rlr0;->i:I

    .line 3
    .line 4
    const-wide p2, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide p2, p0, Ll/rlr0;->k:J

    .line 10
    .line 11
    const-wide/16 p2, 0x0

    .line 12
    .line 13
    iput-wide p2, p0, Ll/rlr0;->l:J

    .line 14
    .line 15
    iput p1, p0, Ll/rlr0;->n:I

    .line 16
    .line 17
    iget-object p0, p0, Ll/rlr0;->o:Ll/tlr0;

    .line 18
    .line 19
    instance-of p0, p0, Ll/nlr0;

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    throw p0
.end method

.method public final d(Ll/qer0;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/rlr0;->k(Ll/qer0;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/rlr0;->f:Ll/ser0;

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
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/rlr0;->g:Ll/sgr0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/rlr0;->h:Ll/sgr0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/rlr0;->f:Ll/ser0;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/ser0;->c()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/rlr0;->g:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    sget p2, Ll/mpw0;->a:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/rlr0;->b(Ll/qer0;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 p2, -0x1

    .line 13
    if-ne p1, p2, :cond_1

    .line 14
    .line 15
    iget-object p2, p0, Ll/rlr0;->o:Ll/tlr0;

    .line 16
    .line 17
    instance-of p2, p2, Ll/nlr0;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    iget-wide v0, p0, Ll/rlr0;->l:J

    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Ll/rlr0;->g(J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iget-object p2, p0, Ll/rlr0;->o:Ll/tlr0;

    .line 28
    .line 29
    invoke-interface {p2}, Ll/bgr0;->zza()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    cmp-long p2, v2, v0

    .line 34
    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p0, p0, Ll/rlr0;->o:Ll/tlr0;

    .line 39
    .line 40
    check-cast p0, Ll/nlr0;

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    throw p0

    .line 44
    :cond_1
    :goto_0
    return p1
.end method

.method public final g(J)J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/rlr0;->b:Ll/vfr0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/rlr0;->k:J

    .line 4
    .line 5
    iget p0, v0, Ll/vfr0;->d:I

    .line 6
    .line 7
    int-to-long v3, p0

    .line 8
    const-wide/32 v5, 0xf4240

    .line 9
    .line 10
    .line 11
    mul-long/2addr p1, v5

    .line 12
    div-long/2addr p1, v3

    .line 13
    add-long/2addr v1, p1

    .line 14
    return-wide v1
.end method

.method public final h(Ll/qer0;Z)Ll/tlr0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/fer0;

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, p2, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 16
    .line 17
    invoke-virtual {p2, v2}, Ll/bgw0;->k(I)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/rlr0;->b:Ll/vfr0;

    .line 21
    .line 22
    iget-object v0, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p2, v0}, Ll/vfr0;->a(I)Z

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/mlr0;

    .line 32
    .line 33
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    iget-object v6, p0, Ll/rlr0;->b:Ll/vfr0;

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    invoke-direct/range {v1 .. v7}, Ll/mlr0;-><init>(JJLl/vfr0;Z)V

    .line 45
    .line 46
    .line 47
    return-object v1
.end method

.method public final j(Ll/qer0;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rlr0;->o:Ll/tlr0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Ll/tlr0;->zzc()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    const-wide/16 v4, -0x1

    .line 11
    .line 12
    cmp-long v0, v2, v4

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    const-wide/16 v6, -0x4

    .line 21
    .line 22
    add-long/2addr v2, v6

    .line 23
    cmp-long v0, v4, v2

    .line 24
    .line 25
    if-gtz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return v1

    .line 29
    :cond_1
    :goto_0
    :try_start_0
    iget-object p0, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v0, 0x4

    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-interface {p1, p0, v2, v0, v1}, Ll/qer0;->c([BIIZ)Z

    .line 38
    .line 39
    .line 40
    move-result p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    return v2

    .line 45
    :catch_0
    return v1
.end method

.method public final k(Ll/qer0;Z)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Ll/rlr0;->d:Ll/tfr0;

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1}, Ll/tfr0;->a(Ll/qer0;Ll/sjr0;)Lcom/google/android/gms/internal/ads/zzby;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/rlr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v3, p0, Ll/rlr0;->c:Ll/rfr0;

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Ll/rfr0;->b(Lcom/google/android/gms/internal/ads/zzby;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-interface {p1}, Ll/qer0;->zze()J

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    long-to-int v0, v3

    .line 36
    if-nez p2, :cond_1

    .line 37
    .line 38
    move-object v3, p1

    .line 39
    check-cast v3, Ll/fer0;

    .line 40
    .line 41
    invoke-virtual {v3, v0, v2}, Ll/fer0;->k(IZ)Z

    .line 42
    .line 43
    .line 44
    :cond_1
    move v3, v2

    .line 45
    :goto_0
    move v4, v3

    .line 46
    move v5, v4

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    move v0, v2

    .line 49
    move v3, v0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    invoke-virtual {p0, p1}, Ll/rlr0;->j(Ll/qer0;)Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    const/4 v7, 0x1

    .line 56
    if-eqz v6, :cond_4

    .line 57
    .line 58
    if-lez v4, :cond_3

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :cond_4
    iget-object v6, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 66
    .line 67
    invoke-virtual {v6, v2}, Ll/bgw0;->k(I)V

    .line 68
    .line 69
    .line 70
    iget-object v6, p0, Ll/rlr0;->a:Ll/bgw0;

    .line 71
    .line 72
    invoke-virtual {v6}, Ll/bgw0;->v()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v3, :cond_5

    .line 77
    .line 78
    int-to-long v8, v3

    .line 79
    invoke-static {v6, v8, v9}, Ll/rlr0;->i(IJ)Z

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    if-eqz v8, :cond_6

    .line 84
    .line 85
    :cond_5
    invoke-static {v6}, Ll/wfr0;->b(I)I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    const/4 v9, -0x1

    .line 90
    if-ne v8, v9, :cond_b

    .line 91
    .line 92
    :cond_6
    if-eq v7, p2, :cond_7

    .line 93
    .line 94
    const/high16 v3, 0x20000

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_7
    const v3, 0x8000

    .line 98
    .line 99
    .line 100
    :goto_2
    add-int/lit8 v4, v5, 0x1

    .line 101
    .line 102
    if-ne v5, v3, :cond_9

    .line 103
    .line 104
    if-eqz p2, :cond_8

    .line 105
    .line 106
    return v2

    .line 107
    :cond_8
    const-string p0, "Searched too many bytes."

    .line 108
    .line 109
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    throw p0

    .line 114
    :cond_9
    if-eqz p2, :cond_a

    .line 115
    .line 116
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 117
    .line 118
    .line 119
    add-int v3, v0, v4

    .line 120
    .line 121
    move-object v5, p1

    .line 122
    check-cast v5, Ll/fer0;

    .line 123
    .line 124
    invoke-virtual {v5, v3, v2}, Ll/fer0;->j(IZ)Z

    .line 125
    .line 126
    .line 127
    :goto_3
    move v3, v2

    .line 128
    move v5, v4

    .line 129
    move v4, v3

    .line 130
    goto :goto_1

    .line 131
    :cond_a
    move-object v3, p1

    .line 132
    check-cast v3, Ll/fer0;

    .line 133
    .line 134
    invoke-virtual {v3, v7, v2}, Ll/fer0;->k(IZ)Z

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_b
    add-int/lit8 v4, v4, 0x1

    .line 139
    .line 140
    if-ne v4, v7, :cond_c

    .line 141
    .line 142
    iget-object v3, p0, Ll/rlr0;->b:Ll/vfr0;

    .line 143
    .line 144
    invoke-virtual {v3, v6}, Ll/vfr0;->a(I)Z

    .line 145
    .line 146
    .line 147
    move v3, v6

    .line 148
    goto :goto_6

    .line 149
    :cond_c
    const/4 v6, 0x4

    .line 150
    if-ne v4, v6, :cond_e

    .line 151
    .line 152
    :goto_4
    if-eqz p2, :cond_d

    .line 153
    .line 154
    add-int/2addr v0, v5

    .line 155
    check-cast p1, Ll/fer0;

    .line 156
    .line 157
    invoke-virtual {p1, v0, v2}, Ll/fer0;->k(IZ)Z

    .line 158
    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_d
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 162
    .line 163
    .line 164
    :goto_5
    iput v3, p0, Ll/rlr0;->i:I

    .line 165
    .line 166
    return v7

    .line 167
    :cond_e
    :goto_6
    add-int/lit8 v8, v8, -0x4

    .line 168
    .line 169
    move-object v6, p1

    .line 170
    check-cast v6, Ll/fer0;

    .line 171
    .line 172
    invoke-virtual {v6, v8, v2}, Ll/fer0;->j(IZ)Z

    .line 173
    .line 174
    .line 175
    goto :goto_1
.end method
