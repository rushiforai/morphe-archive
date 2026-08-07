.class public final Ll/nay0;
.super Ll/njy0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/njy0;-><init>(Lcom/google/android/gms/measurement/internal/j;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/SecurityException;

    .line 2
    .line 3
    const-string p1, "This implementation should not be used."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method


# virtual methods
.method public final r()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final s(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)[B
    .locals 29
    .param p1    # Lcom/google/android/gms/measurement/internal/zzbf;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Size;
            min = 0x1L
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const-string v2, "_r"

    .line 8
    .line 9
    const-wide/16 v4, 0x1

    .line 10
    .line 11
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    invoke-virtual {v1}, Ll/yyx0;->h()V

    .line 16
    .line 17
    .line 18
    iget-object v7, v1, Ll/yyx0;->a:Ll/atx0;

    .line 19
    .line 20
    invoke-virtual {v7}, Ll/atx0;->L()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    sget-object v8, Ll/whs0;->m0:Ll/zpw0;

    .line 34
    .line 35
    invoke-virtual {v7, v3, v8}, Ll/ajr0;->z(Ljava/lang/String;Ll/zpw0;)Z

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    const/4 v8, 0x0

    .line 40
    if-nez v7, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "Generating ScionPayload disabled. packageName"

    .line 51
    .line 52
    invoke-virtual {v0, v1, v3}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    new-array v0, v8, [B

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_0
    const-string v7, "_iap"

    .line 59
    .line 60
    iget-object v9, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    const/4 v9, 0x0

    .line 67
    if-nez v7, :cond_1

    .line 68
    .line 69
    const-string v7, "_iapx"

    .line 70
    .line 71
    iget-object v10, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    if-nez v7, :cond_1

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Ll/d6x0;->z()Ll/l8x0;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "Generating a payload for this event is not available. package_name, event_name"

    .line 88
    .line 89
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v1, v2, v3, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-object v9

    .line 95
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfy$zzj;->I()Lcom/google/android/gms/internal/measurement/zzfy$zzj$a;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    invoke-virtual {v10}, Ll/opr0;->W0()V

    .line 104
    .line 105
    .line 106
    :try_start_0
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 107
    .line 108
    .line 109
    move-result-object v10

    .line 110
    invoke-virtual {v10, v3}, Ll/opr0;->G0(Ljava/lang/String;)Ll/zqw0;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    if-nez v10, :cond_2

    .line 115
    .line 116
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v2, "Log and bundle not available. package_name"

    .line 125
    .line 126
    invoke-virtual {v0, v2, v3}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    new-array v0, v8, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Ll/opr0;->c1()V

    .line 136
    .line 137
    .line 138
    return-object v0

    .line 139
    :catchall_0
    move-exception v0

    .line 140
    goto/16 :goto_b

    .line 141
    .line 142
    :cond_2
    :try_start_1
    invoke-virtual {v10}, Ll/zqw0;->A()Z

    .line 143
    .line 144
    .line 145
    move-result v11

    .line 146
    if-nez v11, :cond_3

    .line 147
    .line 148
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    const-string v2, "Log and bundle disabled. package_name"

    .line 157
    .line 158
    invoke-virtual {v0, v2, v3}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    new-array v0, v8, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    .line 163
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Ll/opr0;->c1()V

    .line 168
    .line 169
    .line 170
    return-object v0

    .line 171
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/google/android/gms/internal/measurement/c0;->x2()Lcom/google/android/gms/internal/measurement/c0$a;

    .line 172
    .line 173
    .line 174
    move-result-object v11

    .line 175
    const/4 v12, 0x1

    .line 176
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->E0(I)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 177
    .line 178
    .line 179
    move-result-object v11

    .line 180
    const-string v13, "android"

    .line 181
    .line 182
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->d1(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-virtual {v10}, Ll/zqw0;->l()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v13

    .line 190
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result v13

    .line 194
    if-nez v13, :cond_4

    .line 195
    .line 196
    invoke-virtual {v10}, Ll/zqw0;->l()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v13

    .line 200
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->c0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 201
    .line 202
    .line 203
    :cond_4
    invoke-virtual {v10}, Ll/zqw0;->n()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v13

    .line 207
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 208
    .line 209
    .line 210
    move-result v13

    .line 211
    if-nez v13, :cond_5

    .line 212
    .line 213
    invoke-virtual {v10}, Ll/zqw0;->n()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v13

    .line 217
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v13

    .line 221
    check-cast v13, Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->o0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 224
    .line 225
    .line 226
    :cond_5
    invoke-virtual {v10}, Ll/zqw0;->o()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v13

    .line 230
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result v13

    .line 234
    if-nez v13, :cond_6

    .line 235
    .line 236
    invoke-virtual {v10}, Ll/zqw0;->o()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v13

    .line 240
    invoke-static {v13}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v13

    .line 244
    check-cast v13, Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->u0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 247
    .line 248
    .line 249
    :cond_6
    invoke-virtual {v10}, Ll/zqw0;->U()J

    .line 250
    .line 251
    .line 252
    move-result-wide v13

    .line 253
    const-wide/32 v15, -0x80000000

    .line 254
    .line 255
    .line 256
    cmp-long v13, v13, v15

    .line 257
    .line 258
    if-eqz v13, :cond_7

    .line 259
    .line 260
    invoke-virtual {v10}, Ll/zqw0;->U()J

    .line 261
    .line 262
    .line 263
    move-result-wide v13

    .line 264
    long-to-int v13, v13

    .line 265
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->r0(I)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 266
    .line 267
    .line 268
    :cond_7
    invoke-virtual {v10}, Ll/zqw0;->z0()J

    .line 269
    .line 270
    .line 271
    move-result-wide v13

    .line 272
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/measurement/c0$a;->x0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 273
    .line 274
    .line 275
    move-result-object v13

    .line 276
    invoke-virtual {v10}, Ll/zqw0;->v0()J

    .line 277
    .line 278
    .line 279
    move-result-wide v14

    .line 280
    invoke-virtual {v13, v14, v15}, Lcom/google/android/gms/internal/measurement/c0$a;->m0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v10}, Ll/zqw0;->q()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v13

    .line 287
    invoke-virtual {v10}, Ll/zqw0;->j()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v14

    .line 291
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 292
    .line 293
    .line 294
    move-result v15

    .line 295
    if-nez v15, :cond_8

    .line 296
    .line 297
    invoke-virtual {v11, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->X0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 298
    .line 299
    .line 300
    goto :goto_0

    .line 301
    :cond_8
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 302
    .line 303
    .line 304
    move-result v13

    .line 305
    if-nez v13, :cond_9

    .line 306
    .line 307
    invoke-virtual {v11, v14}, Lcom/google/android/gms/internal/measurement/c0$a;->M(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 308
    .line 309
    .line 310
    :cond_9
    :goto_0
    invoke-virtual {v10}, Ll/zqw0;->J0()J

    .line 311
    .line 312
    .line 313
    move-result-wide v13

    .line 314
    invoke-virtual {v11, v13, v14}, Lcom/google/android/gms/internal/measurement/c0$a;->N0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 315
    .line 316
    .line 317
    iget-object v13, v1, Ll/qjy0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 318
    .line 319
    invoke-virtual {v13, v3}, Lcom/google/android/gms/measurement/internal/j;->P(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzje;

    .line 320
    .line 321
    .line 322
    move-result-object v13

    .line 323
    invoke-virtual {v10}, Ll/zqw0;->t0()J

    .line 324
    .line 325
    .line 326
    move-result-wide v14

    .line 327
    invoke-virtual {v11, v14, v15}, Lcom/google/android/gms/internal/measurement/c0$a;->g0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 328
    .line 329
    .line 330
    iget-object v14, v1, Ll/yyx0;->a:Ll/atx0;

    .line 331
    .line 332
    invoke-virtual {v14}, Ll/atx0;->k()Z

    .line 333
    .line 334
    .line 335
    move-result v14

    .line 336
    if-eqz v14, :cond_a

    .line 337
    .line 338
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 339
    .line 340
    .line 341
    move-result-object v14

    .line 342
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/c0$a;->k1()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v15

    .line 346
    invoke-virtual {v14, v15}, Ll/ajr0;->H(Ljava/lang/String;)Z

    .line 347
    .line 348
    .line 349
    move-result v14

    .line 350
    if-eqz v14, :cond_a

    .line 351
    .line 352
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzje;->y()Z

    .line 353
    .line 354
    .line 355
    move-result v14

    .line 356
    if-eqz v14, :cond_a

    .line 357
    .line 358
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 359
    .line 360
    .line 361
    move-result v14

    .line 362
    if-nez v14, :cond_a

    .line 363
    .line 364
    invoke-virtual {v11, v9}, Lcom/google/android/gms/internal/measurement/c0$a;->O0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 365
    .line 366
    .line 367
    :cond_a
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzje;->w()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v14

    .line 371
    invoke-virtual {v11, v14}, Lcom/google/android/gms/internal/measurement/c0$a;->C0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v13}, Lcom/google/android/gms/measurement/internal/zzje;->y()Z

    .line 375
    .line 376
    .line 377
    move-result v14

    .line 378
    if-eqz v14, :cond_b

    .line 379
    .line 380
    invoke-virtual {v10}, Ll/zqw0;->z()Z

    .line 381
    .line 382
    .line 383
    move-result v14

    .line 384
    if-eqz v14, :cond_b

    .line 385
    .line 386
    invoke-virtual {v1}, Ll/qjy0;->m()Ll/kgy0;

    .line 387
    .line 388
    .line 389
    move-result-object v14

    .line 390
    invoke-virtual {v10}, Ll/zqw0;->l()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v15

    .line 394
    invoke-virtual {v14, v15, v13}, Ll/kgy0;->t(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzje;)Landroid/util/Pair;

    .line 395
    .line 396
    .line 397
    move-result-object v14

    .line 398
    invoke-virtual {v10}, Ll/zqw0;->z()Z

    .line 399
    .line 400
    .line 401
    move-result v15

    .line 402
    if-eqz v15, :cond_b

    .line 403
    .line 404
    if-eqz v14, :cond_b

    .line 405
    .line 406
    iget-object v15, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 407
    .line 408
    check-cast v15, Ljava/lang/CharSequence;

    .line 409
    .line 410
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 411
    .line 412
    .line 413
    move-result v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 414
    if-nez v15, :cond_b

    .line 415
    .line 416
    :try_start_3
    iget-object v15, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 417
    .line 418
    check-cast v15, Ljava/lang/String;

    .line 419
    .line 420
    move-object/from16 v17, v13

    .line 421
    .line 422
    iget-wide v12, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzd:J

    .line 423
    .line 424
    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v12

    .line 428
    invoke-static {v15, v12}, Ll/nay0;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v12

    .line 432
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->f1(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 433
    .line 434
    .line 435
    :try_start_4
    iget-object v12, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 436
    .line 437
    if-eqz v12, :cond_c

    .line 438
    .line 439
    check-cast v12, Ljava/lang/Boolean;

    .line 440
    .line 441
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 442
    .line 443
    .line 444
    move-result v12

    .line 445
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->j0(Z)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 446
    .line 447
    .line 448
    goto :goto_1

    .line 449
    :catch_0
    move-exception v0

    .line 450
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    invoke-virtual {v2}, Ll/d6x0;->z()Ll/l8x0;

    .line 455
    .line 456
    .line 457
    move-result-object v2

    .line 458
    const-string v3, "Resettable device id encryption failed"

    .line 459
    .line 460
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    invoke-virtual {v2, v3, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 465
    .line 466
    .line 467
    new-array v0, v8, [B
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 468
    .line 469
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 470
    .line 471
    .line 472
    move-result-object v1

    .line 473
    invoke-virtual {v1}, Ll/opr0;->c1()V

    .line 474
    .line 475
    .line 476
    return-object v0

    .line 477
    :cond_b
    move-object/from16 v17, v13

    .line 478
    .line 479
    :cond_c
    :goto_1
    :try_start_5
    invoke-virtual {v1}, Ll/yyx0;->b()Ll/o7s0;

    .line 480
    .line 481
    .line 482
    move-result-object v12

    .line 483
    invoke-virtual {v12}, Ll/mzx0;->j()V

    .line 484
    .line 485
    .line 486
    sget-object v12, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 487
    .line 488
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->K0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 489
    .line 490
    .line 491
    move-result-object v12

    .line 492
    invoke-virtual {v1}, Ll/yyx0;->b()Ll/o7s0;

    .line 493
    .line 494
    .line 495
    move-result-object v13

    .line 496
    invoke-virtual {v13}, Ll/mzx0;->j()V

    .line 497
    .line 498
    .line 499
    sget-object v13, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 500
    .line 501
    invoke-virtual {v12, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->b1(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 502
    .line 503
    .line 504
    move-result-object v12

    .line 505
    invoke-virtual {v1}, Ll/yyx0;->b()Ll/o7s0;

    .line 506
    .line 507
    .line 508
    move-result-object v13

    .line 509
    invoke-virtual {v13}, Ll/o7s0;->o()J

    .line 510
    .line 511
    .line 512
    move-result-wide v13

    .line 513
    long-to-int v13, v13

    .line 514
    invoke-virtual {v12, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->M0(I)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 515
    .line 516
    .line 517
    move-result-object v12

    .line 518
    invoke-virtual {v1}, Ll/yyx0;->b()Ll/o7s0;

    .line 519
    .line 520
    .line 521
    move-result-object v13

    .line 522
    invoke-virtual {v13}, Ll/o7s0;->p()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v13

    .line 526
    invoke-virtual {v12, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->j1(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 527
    .line 528
    .line 529
    :try_start_6
    invoke-virtual/range {v17 .. v17}, Lcom/google/android/gms/measurement/internal/zzje;->z()Z

    .line 530
    .line 531
    .line 532
    move-result v12

    .line 533
    if-eqz v12, :cond_d

    .line 534
    .line 535
    invoke-virtual {v10}, Ll/zqw0;->m()Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object v12

    .line 539
    if-eqz v12, :cond_d

    .line 540
    .line 541
    invoke-virtual {v10}, Ll/zqw0;->m()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v12

    .line 545
    invoke-static {v12}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object v12

    .line 549
    check-cast v12, Ljava/lang/String;

    .line 550
    .line 551
    iget-wide v13, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzd:J

    .line 552
    .line 553
    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object v13

    .line 557
    invoke-static {v12, v13}, Ll/nay0;->zza(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v12

    .line 561
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->i0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 562
    .line 563
    .line 564
    goto :goto_2

    .line 565
    :catch_1
    move-exception v0

    .line 566
    move v2, v8

    .line 567
    goto/16 :goto_a

    .line 568
    .line 569
    :cond_d
    :goto_2
    :try_start_7
    invoke-virtual {v10}, Ll/zqw0;->p()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v12

    .line 573
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 574
    .line 575
    .line 576
    move-result v12

    .line 577
    if-nez v12, :cond_e

    .line 578
    .line 579
    invoke-virtual {v10}, Ll/zqw0;->p()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v12

    .line 583
    invoke-static {v12}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v12

    .line 587
    check-cast v12, Ljava/lang/String;

    .line 588
    .line 589
    invoke-virtual {v11, v12}, Lcom/google/android/gms/internal/measurement/c0$a;->V0(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 590
    .line 591
    .line 592
    :cond_e
    invoke-virtual {v10}, Ll/zqw0;->l()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v12

    .line 596
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 597
    .line 598
    .line 599
    move-result-object v13

    .line 600
    invoke-virtual {v13, v12}, Ll/opr0;->S0(Ljava/lang/String;)Ljava/util/List;

    .line 601
    .line 602
    .line 603
    move-result-object v13

    .line 604
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 605
    .line 606
    .line 607
    move-result-object v14

    .line 608
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 609
    .line 610
    .line 611
    move-result v15

    .line 612
    if-eqz v15, :cond_10

    .line 613
    .line 614
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v15

    .line 618
    check-cast v15, Ll/ymy0;

    .line 619
    .line 620
    const-string v8, "_lte"

    .line 621
    .line 622
    iget-object v9, v15, Ll/ymy0;->c:Ljava/lang/String;

    .line 623
    .line 624
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 625
    .line 626
    .line 627
    move-result v8

    .line 628
    if-eqz v8, :cond_f

    .line 629
    .line 630
    goto :goto_4

    .line 631
    :cond_f
    const/4 v8, 0x0

    .line 632
    const/4 v9, 0x0

    .line 633
    goto :goto_3

    .line 634
    :cond_10
    const/4 v15, 0x0

    .line 635
    :goto_4
    const-wide/16 v25, 0x0

    .line 636
    .line 637
    if-eqz v15, :cond_11

    .line 638
    .line 639
    iget-object v8, v15, Ll/ymy0;->e:Ljava/lang/Object;

    .line 640
    .line 641
    if-nez v8, :cond_12

    .line 642
    .line 643
    :cond_11
    new-instance v17, Ll/ymy0;

    .line 644
    .line 645
    const-string v19, "auto"

    .line 646
    .line 647
    const-string v20, "_lte"

    .line 648
    .line 649
    invoke-virtual {v1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 650
    .line 651
    .line 652
    move-result-object v8

    .line 653
    invoke-interface {v8}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 654
    .line 655
    .line 656
    move-result-wide v21

    .line 657
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 658
    .line 659
    .line 660
    move-result-object v23

    .line 661
    move-object/from16 v18, v12

    .line 662
    .line 663
    invoke-direct/range {v17 .. v23}, Ll/ymy0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Object;)V

    .line 664
    .line 665
    .line 666
    move-object/from16 v8, v17

    .line 667
    .line 668
    invoke-interface {v13, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    .line 670
    .line 671
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 672
    .line 673
    .line 674
    move-result-object v9

    .line 675
    invoke-virtual {v9, v8}, Ll/opr0;->h0(Ll/ymy0;)Z

    .line 676
    .line 677
    .line 678
    :cond_12
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 679
    .line 680
    .line 681
    move-result v8

    .line 682
    new-array v8, v8, [Lcom/google/android/gms/internal/measurement/f0;

    .line 683
    .line 684
    const/4 v9, 0x0

    .line 685
    :goto_5
    invoke-interface {v13}, Ljava/util/List;->size()I

    .line 686
    .line 687
    .line 688
    move-result v12

    .line 689
    if-ge v9, v12, :cond_13

    .line 690
    .line 691
    invoke-static {}, Lcom/google/android/gms/internal/measurement/f0;->V()Lcom/google/android/gms/internal/measurement/f0$a;

    .line 692
    .line 693
    .line 694
    move-result-object v12

    .line 695
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 696
    .line 697
    .line 698
    move-result-object v14

    .line 699
    check-cast v14, Ll/ymy0;

    .line 700
    .line 701
    iget-object v14, v14, Ll/ymy0;->c:Ljava/lang/String;

    .line 702
    .line 703
    invoke-virtual {v12, v14}, Lcom/google/android/gms/internal/measurement/f0$a;->y(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/f0$a;

    .line 704
    .line 705
    .line 706
    move-result-object v12

    .line 707
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 708
    .line 709
    .line 710
    move-result-object v14

    .line 711
    check-cast v14, Ll/ymy0;

    .line 712
    .line 713
    iget-wide v14, v14, Ll/ymy0;->d:J

    .line 714
    .line 715
    invoke-virtual {v12, v14, v15}, Lcom/google/android/gms/internal/measurement/f0$a;->A(J)Lcom/google/android/gms/internal/measurement/f0$a;

    .line 716
    .line 717
    .line 718
    move-result-object v12

    .line 719
    invoke-virtual {v1}, Ll/qjy0;->i()Ll/vmy0;

    .line 720
    .line 721
    .line 722
    move-result-object v14

    .line 723
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object v15

    .line 727
    check-cast v15, Ll/ymy0;

    .line 728
    .line 729
    iget-object v15, v15, Ll/ymy0;->e:Ljava/lang/Object;

    .line 730
    .line 731
    invoke-virtual {v14, v12, v15}, Ll/vmy0;->P(Lcom/google/android/gms/internal/measurement/f0$a;Ljava/lang/Object;)V

    .line 732
    .line 733
    .line 734
    invoke-virtual {v12}, Lcom/google/android/gms/internal/measurement/u0$b;->H()Ll/m9y0;

    .line 735
    .line 736
    .line 737
    move-result-object v12

    .line 738
    check-cast v12, Lcom/google/android/gms/internal/measurement/u0;

    .line 739
    .line 740
    check-cast v12, Lcom/google/android/gms/internal/measurement/f0;

    .line 741
    .line 742
    aput-object v12, v8, v9

    .line 743
    .line 744
    add-int/lit8 v9, v9, 0x1

    .line 745
    .line 746
    goto :goto_5

    .line 747
    :cond_13
    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 748
    .line 749
    .line 750
    move-result-object v8

    .line 751
    invoke-virtual {v11, v8}, Lcom/google/android/gms/internal/measurement/c0$a;->t0(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 752
    .line 753
    .line 754
    iget-object v8, v1, Ll/qjy0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 755
    .line 756
    invoke-virtual {v8, v10, v11}, Lcom/google/android/gms/measurement/internal/j;->E(Ll/zqw0;Lcom/google/android/gms/internal/measurement/c0$a;)V

    .line 757
    .line 758
    .line 759
    invoke-static {}, Ll/nny0;->a()Z

    .line 760
    .line 761
    .line 762
    move-result v8

    .line 763
    if-eqz v8, :cond_14

    .line 764
    .line 765
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 766
    .line 767
    .line 768
    move-result-object v8

    .line 769
    sget-object v9, Ll/whs0;->V0:Ll/zpw0;

    .line 770
    .line 771
    invoke-virtual {v8, v9}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 772
    .line 773
    .line 774
    move-result v8

    .line 775
    if-eqz v8, :cond_14

    .line 776
    .line 777
    iget-object v8, v1, Ll/qjy0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 778
    .line 779
    invoke-virtual {v8, v10, v11}, Lcom/google/android/gms/measurement/internal/j;->W(Ll/zqw0;Lcom/google/android/gms/internal/measurement/c0$a;)V

    .line 780
    .line 781
    .line 782
    :cond_14
    invoke-static {v0}, Ll/tax0;->b(Lcom/google/android/gms/measurement/internal/zzbf;)Ll/tax0;

    .line 783
    .line 784
    .line 785
    move-result-object v8

    .line 786
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 787
    .line 788
    .line 789
    move-result-object v9

    .line 790
    iget-object v12, v8, Ll/tax0;->d:Landroid/os/Bundle;

    .line 791
    .line 792
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 793
    .line 794
    .line 795
    move-result-object v13

    .line 796
    invoke-virtual {v13, v3}, Ll/opr0;->E0(Ljava/lang/String;)Landroid/os/Bundle;

    .line 797
    .line 798
    .line 799
    move-result-object v13

    .line 800
    invoke-virtual {v9, v12, v13}, Ll/hny0;->H(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 801
    .line 802
    .line 803
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 804
    .line 805
    .line 806
    move-result-object v9

    .line 807
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 808
    .line 809
    .line 810
    move-result-object v12

    .line 811
    invoke-virtual {v12, v3}, Ll/ajr0;->p(Ljava/lang/String;)I

    .line 812
    .line 813
    .line 814
    move-result v12

    .line 815
    invoke-virtual {v9, v8, v12}, Ll/hny0;->R(Ll/tax0;I)V

    .line 816
    .line 817
    .line 818
    iget-object v8, v8, Ll/tax0;->d:Landroid/os/Bundle;

    .line 819
    .line 820
    const-string v9, "_c"

    .line 821
    .line 822
    invoke-virtual {v8, v9, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 823
    .line 824
    .line 825
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 826
    .line 827
    .line 828
    move-result-object v9

    .line 829
    invoke-virtual {v9}, Ll/d6x0;->z()Ll/l8x0;

    .line 830
    .line 831
    .line 832
    move-result-object v9

    .line 833
    const-string v12, "Marking in-app purchase as real-time"

    .line 834
    .line 835
    invoke-virtual {v9, v12}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 836
    .line 837
    .line 838
    invoke-virtual {v8, v2, v4, v5}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 839
    .line 840
    .line 841
    const-string v4, "_o"

    .line 842
    .line 843
    iget-object v5, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzc:Ljava/lang/String;

    .line 844
    .line 845
    invoke-virtual {v8, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 846
    .line 847
    .line 848
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 849
    .line 850
    .line 851
    move-result-object v4

    .line 852
    invoke-virtual {v11}, Lcom/google/android/gms/internal/measurement/c0$a;->k1()Ljava/lang/String;

    .line 853
    .line 854
    .line 855
    move-result-object v5

    .line 856
    invoke-virtual {v10}, Ll/zqw0;->v()Ljava/lang/String;

    .line 857
    .line 858
    .line 859
    move-result-object v9

    .line 860
    invoke-virtual {v4, v5, v9}, Ll/hny0;->y0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 861
    .line 862
    .line 863
    move-result v4

    .line 864
    if-eqz v4, :cond_15

    .line 865
    .line 866
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 867
    .line 868
    .line 869
    move-result-object v4

    .line 870
    const-string v5, "_dbg"

    .line 871
    .line 872
    invoke-virtual {v4, v8, v5, v6}, Ll/hny0;->I(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 873
    .line 874
    .line 875
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 876
    .line 877
    .line 878
    move-result-object v4

    .line 879
    invoke-virtual {v4, v8, v2, v6}, Ll/hny0;->I(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 880
    .line 881
    .line 882
    :cond_15
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 883
    .line 884
    .line 885
    move-result-object v2

    .line 886
    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 887
    .line 888
    invoke-virtual {v2, v3, v4}, Ll/opr0;->F0(Ljava/lang/String;Ljava/lang/String;)Ll/pbs0;

    .line 889
    .line 890
    .line 891
    move-result-object v2

    .line 892
    if-nez v2, :cond_16

    .line 893
    .line 894
    new-instance v2, Ll/pbs0;

    .line 895
    .line 896
    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 897
    .line 898
    move-object v5, v10

    .line 899
    iget-wide v9, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzd:J

    .line 900
    .line 901
    const/4 v15, 0x0

    .line 902
    const/4 v6, 0x1

    .line 903
    const/16 v16, 0x0

    .line 904
    .line 905
    move-object v12, v5

    .line 906
    move v13, v6

    .line 907
    const-wide/16 v5, 0x0

    .line 908
    .line 909
    move-object v14, v7

    .line 910
    move-object/from16 v17, v8

    .line 911
    .line 912
    const-wide/16 v7, 0x0

    .line 913
    .line 914
    move-object/from16 v19, v11

    .line 915
    .line 916
    move-object/from16 v18, v12

    .line 917
    .line 918
    const-wide/16 v11, 0x0

    .line 919
    .line 920
    move/from16 v20, v13

    .line 921
    .line 922
    const/4 v13, 0x0

    .line 923
    move-object/from16 v21, v14

    .line 924
    .line 925
    const/4 v14, 0x0

    .line 926
    move-object/from16 v28, v19

    .line 927
    .line 928
    move-object/from16 v27, v21

    .line 929
    .line 930
    const/16 v24, 0x0

    .line 931
    .line 932
    invoke-direct/range {v2 .. v16}, Ll/pbs0;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    .line 933
    .line 934
    .line 935
    move-wide/from16 v9, v25

    .line 936
    .line 937
    :goto_6
    move-object v12, v2

    .line 938
    goto :goto_7

    .line 939
    :cond_16
    move-object/from16 v27, v7

    .line 940
    .line 941
    move-object/from16 v17, v8

    .line 942
    .line 943
    move-object/from16 v18, v10

    .line 944
    .line 945
    move-object/from16 v28, v11

    .line 946
    .line 947
    const/16 v24, 0x0

    .line 948
    .line 949
    iget-wide v3, v2, Ll/pbs0;->f:J

    .line 950
    .line 951
    iget-wide v5, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzd:J

    .line 952
    .line 953
    invoke-virtual {v2, v5, v6}, Ll/pbs0;->a(J)Ll/pbs0;

    .line 954
    .line 955
    .line 956
    move-result-object v2

    .line 957
    move-wide v9, v3

    .line 958
    goto :goto_6

    .line 959
    :goto_7
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 960
    .line 961
    .line 962
    move-result-object v2

    .line 963
    invoke-virtual {v2, v12}, Ll/opr0;->W(Ll/pbs0;)V

    .line 964
    .line 965
    .line 966
    new-instance v2, Ll/wcs0;

    .line 967
    .line 968
    iget-object v3, v1, Ll/yyx0;->a:Ll/atx0;

    .line 969
    .line 970
    iget-object v4, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzc:Ljava/lang/String;

    .line 971
    .line 972
    iget-object v6, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 973
    .line 974
    iget-wide v7, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zzd:J

    .line 975
    .line 976
    move-object/from16 v5, p2

    .line 977
    .line 978
    move-object/from16 v11, v17

    .line 979
    .line 980
    invoke-direct/range {v2 .. v11}, Ll/wcs0;-><init>(Ll/atx0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    .line 981
    .line 982
    .line 983
    move-object v3, v5

    .line 984
    invoke-static {}, Lcom/google/android/gms/internal/measurement/y;->V()Lcom/google/android/gms/internal/measurement/y$a;

    .line 985
    .line 986
    .line 987
    move-result-object v4

    .line 988
    iget-wide v5, v2, Ll/wcs0;->d:J

    .line 989
    .line 990
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/y$a;->G(J)Lcom/google/android/gms/internal/measurement/y$a;

    .line 991
    .line 992
    .line 993
    move-result-object v4

    .line 994
    iget-object v5, v2, Ll/wcs0;->b:Ljava/lang/String;

    .line 995
    .line 996
    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/measurement/y$a;->D(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/y$a;

    .line 997
    .line 998
    .line 999
    move-result-object v4

    .line 1000
    iget-wide v5, v2, Ll/wcs0;->e:J

    .line 1001
    .line 1002
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/measurement/y$a;->z(J)Lcom/google/android/gms/internal/measurement/y$a;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v4

    .line 1006
    iget-object v5, v2, Ll/wcs0;->f:Lcom/google/android/gms/measurement/internal/zzbe;

    .line 1007
    .line 1008
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzbe;->iterator()Ljava/util/Iterator;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v5

    .line 1012
    :cond_17
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 1013
    .line 1014
    .line 1015
    move-result v6

    .line 1016
    if-eqz v6, :cond_18

    .line 1017
    .line 1018
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v6

    .line 1022
    check-cast v6, Ljava/lang/String;

    .line 1023
    .line 1024
    invoke-static {}, Lcom/google/android/gms/internal/measurement/a0;->X()Lcom/google/android/gms/internal/measurement/a0$a;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v7

    .line 1028
    invoke-virtual {v7, v6}, Lcom/google/android/gms/internal/measurement/a0$a;->A(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/a0$a;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v7

    .line 1032
    iget-object v8, v2, Ll/wcs0;->f:Lcom/google/android/gms/measurement/internal/zzbe;

    .line 1033
    .line 1034
    invoke-virtual {v8, v6}, Lcom/google/android/gms/measurement/internal/zzbe;->I(Ljava/lang/String;)Ljava/lang/Object;

    .line 1035
    .line 1036
    .line 1037
    move-result-object v6

    .line 1038
    if-eqz v6, :cond_17

    .line 1039
    .line 1040
    invoke-virtual {v1}, Ll/qjy0;->i()Ll/vmy0;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v8

    .line 1044
    invoke-virtual {v8, v7, v6}, Ll/vmy0;->O(Lcom/google/android/gms/internal/measurement/a0$a;Ljava/lang/Object;)V

    .line 1045
    .line 1046
    .line 1047
    invoke-virtual {v4, v7}, Lcom/google/android/gms/internal/measurement/y$a;->A(Lcom/google/android/gms/internal/measurement/a0$a;)Lcom/google/android/gms/internal/measurement/y$a;

    .line 1048
    .line 1049
    .line 1050
    goto :goto_8

    .line 1051
    :cond_18
    move-object/from16 v2, v28

    .line 1052
    .line 1053
    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/measurement/c0$a;->D(Lcom/google/android/gms/internal/measurement/y$a;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1054
    .line 1055
    .line 1056
    move-result-object v5

    .line 1057
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzfy$zzl;->B()Lcom/google/android/gms/internal/measurement/zzfy$zzl$a;

    .line 1058
    .line 1059
    .line 1060
    move-result-object v6

    .line 1061
    invoke-static {}, Lcom/google/android/gms/internal/measurement/z;->B()Lcom/google/android/gms/internal/measurement/z$a;

    .line 1062
    .line 1063
    .line 1064
    move-result-object v7

    .line 1065
    iget-wide v8, v12, Ll/pbs0;->c:J

    .line 1066
    .line 1067
    invoke-virtual {v7, v8, v9}, Lcom/google/android/gms/internal/measurement/z$a;->v(J)Lcom/google/android/gms/internal/measurement/z$a;

    .line 1068
    .line 1069
    .line 1070
    move-result-object v7

    .line 1071
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzbf;->zza:Ljava/lang/String;

    .line 1072
    .line 1073
    invoke-virtual {v7, v0}, Lcom/google/android/gms/internal/measurement/z$a;->w(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/z$a;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v0

    .line 1077
    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/measurement/zzfy$zzl$a;->v(Lcom/google/android/gms/internal/measurement/z$a;)Lcom/google/android/gms/internal/measurement/zzfy$zzl$a;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v0

    .line 1081
    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/measurement/c0$a;->E(Lcom/google/android/gms/internal/measurement/zzfy$zzl$a;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1082
    .line 1083
    .line 1084
    invoke-virtual {v1}, Ll/qjy0;->j()Ll/pwy0;

    .line 1085
    .line 1086
    .line 1087
    move-result-object v6

    .line 1088
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->l()Ljava/lang/String;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v7

    .line 1092
    sget-object v8, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 1093
    .line 1094
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/c0$a;->U()Ljava/util/List;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v9

    .line 1098
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/y$a;->L()J

    .line 1099
    .line 1100
    .line 1101
    move-result-wide v10

    .line 1102
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v10

    .line 1106
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/y$a;->L()J

    .line 1107
    .line 1108
    .line 1109
    move-result-wide v11

    .line 1110
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v11

    .line 1114
    invoke-virtual/range {v6 .. v11}, Ll/pwy0;->s(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;)Ljava/util/List;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v0

    .line 1118
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/measurement/c0$a;->L(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1119
    .line 1120
    .line 1121
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/y$a;->U()Z

    .line 1122
    .line 1123
    .line 1124
    move-result v0

    .line 1125
    if-eqz v0, :cond_19

    .line 1126
    .line 1127
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/y$a;->L()J

    .line 1128
    .line 1129
    .line 1130
    move-result-wide v5

    .line 1131
    invoke-virtual {v2, v5, v6}, Lcom/google/android/gms/internal/measurement/c0$a;->J0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v0

    .line 1135
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/y$a;->L()J

    .line 1136
    .line 1137
    .line 1138
    move-result-wide v4

    .line 1139
    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/measurement/c0$a;->s0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1140
    .line 1141
    .line 1142
    :cond_19
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->D0()J

    .line 1143
    .line 1144
    .line 1145
    move-result-wide v4

    .line 1146
    cmp-long v0, v4, v25

    .line 1147
    .line 1148
    if-eqz v0, :cond_1a

    .line 1149
    .line 1150
    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/internal/measurement/c0$a;->B0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1151
    .line 1152
    .line 1153
    :cond_1a
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->H0()J

    .line 1154
    .line 1155
    .line 1156
    move-result-wide v6

    .line 1157
    cmp-long v8, v6, v25

    .line 1158
    .line 1159
    if-eqz v8, :cond_1b

    .line 1160
    .line 1161
    invoke-virtual {v2, v6, v7}, Lcom/google/android/gms/internal/measurement/c0$a;->F0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1162
    .line 1163
    .line 1164
    goto :goto_9

    .line 1165
    :cond_1b
    if-eqz v0, :cond_1c

    .line 1166
    .line 1167
    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/internal/measurement/c0$a;->F0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1168
    .line 1169
    .line 1170
    :cond_1c
    :goto_9
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->u()Ljava/lang/String;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v0

    .line 1174
    invoke-static {}, Ll/upy0;->a()Z

    .line 1175
    .line 1176
    .line 1177
    move-result v4

    .line 1178
    if-eqz v4, :cond_1d

    .line 1179
    .line 1180
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v4

    .line 1184
    sget-object v5, Ll/whs0;->x0:Ll/zpw0;

    .line 1185
    .line 1186
    invoke-virtual {v4, v3, v5}, Ll/ajr0;->z(Ljava/lang/String;Ll/zpw0;)Z

    .line 1187
    .line 1188
    .line 1189
    move-result v4

    .line 1190
    if-eqz v4, :cond_1d

    .line 1191
    .line 1192
    if-eqz v0, :cond_1d

    .line 1193
    .line 1194
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/measurement/c0$a;->h1(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1195
    .line 1196
    .line 1197
    :cond_1d
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->y()V

    .line 1198
    .line 1199
    .line 1200
    invoke-virtual/range {v18 .. v18}, Ll/zqw0;->F0()J

    .line 1201
    .line 1202
    .line 1203
    move-result-wide v4

    .line 1204
    long-to-int v0, v4

    .line 1205
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/measurement/c0$a;->w0(I)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v0

    .line 1209
    const-wide/32 v4, 0x19e10

    .line 1210
    .line 1211
    .line 1212
    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/measurement/c0$a;->U0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1213
    .line 1214
    .line 1215
    move-result-object v0

    .line 1216
    invoke-virtual {v1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v4

    .line 1220
    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 1221
    .line 1222
    .line 1223
    move-result-wide v4

    .line 1224
    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/measurement/c0$a;->Q0(J)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1225
    .line 1226
    .line 1227
    move-result-object v0

    .line 1228
    const/4 v13, 0x1

    .line 1229
    invoke-virtual {v0, v13}, Lcom/google/android/gms/internal/measurement/c0$a;->p0(Z)Lcom/google/android/gms/internal/measurement/c0$a;

    .line 1230
    .line 1231
    .line 1232
    iget-object v0, v1, Ll/qjy0;->b:Lcom/google/android/gms/measurement/internal/j;

    .line 1233
    .line 1234
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/c0$a;->k1()Ljava/lang/String;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v4

    .line 1238
    invoke-virtual {v0, v4, v2}, Lcom/google/android/gms/measurement/internal/j;->y(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/c0$a;)V

    .line 1239
    .line 1240
    .line 1241
    move-object/from16 v14, v27

    .line 1242
    .line 1243
    invoke-virtual {v14, v2}, Lcom/google/android/gms/internal/measurement/zzfy$zzj$a;->w(Lcom/google/android/gms/internal/measurement/c0$a;)Lcom/google/android/gms/internal/measurement/zzfy$zzj$a;

    .line 1244
    .line 1245
    .line 1246
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/c0$a;->v0()J

    .line 1247
    .line 1248
    .line 1249
    move-result-wide v4

    .line 1250
    move-object/from16 v12, v18

    .line 1251
    .line 1252
    invoke-virtual {v12, v4, v5}, Ll/zqw0;->C0(J)V

    .line 1253
    .line 1254
    .line 1255
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/c0$a;->q0()J

    .line 1256
    .line 1257
    .line 1258
    move-result-wide v4

    .line 1259
    invoke-virtual {v12, v4, v5}, Ll/zqw0;->y0(J)V

    .line 1260
    .line 1261
    .line 1262
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 1263
    .line 1264
    .line 1265
    move-result-object v0

    .line 1266
    const/4 v2, 0x0

    .line 1267
    invoke-virtual {v0, v12, v2, v2}, Ll/opr0;->X(Ll/zqw0;ZZ)V

    .line 1268
    .line 1269
    .line 1270
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 1271
    .line 1272
    .line 1273
    move-result-object v0

    .line 1274
    invoke-virtual {v0}, Ll/opr0;->e1()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1275
    .line 1276
    .line 1277
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 1278
    .line 1279
    .line 1280
    move-result-object v0

    .line 1281
    invoke-virtual {v0}, Ll/opr0;->c1()V

    .line 1282
    .line 1283
    .line 1284
    :try_start_8
    invoke-virtual {v1}, Ll/qjy0;->i()Ll/vmy0;

    .line 1285
    .line 1286
    .line 1287
    move-result-object v0

    .line 1288
    invoke-virtual {v14}, Lcom/google/android/gms/internal/measurement/u0$b;->H()Ll/m9y0;

    .line 1289
    .line 1290
    .line 1291
    move-result-object v2

    .line 1292
    check-cast v2, Lcom/google/android/gms/internal/measurement/u0;

    .line 1293
    .line 1294
    check-cast v2, Lcom/google/android/gms/internal/measurement/zzfy$zzj;

    .line 1295
    .line 1296
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/o0;->g()[B

    .line 1297
    .line 1298
    .line 1299
    move-result-object v2

    .line 1300
    invoke-virtual {v0, v2}, Ll/vmy0;->b0([B)[B

    .line 1301
    .line 1302
    .line 1303
    move-result-object v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    .line 1304
    return-object v0

    .line 1305
    :catch_2
    move-exception v0

    .line 1306
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v1

    .line 1310
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 1311
    .line 1312
    .line 1313
    move-result-object v1

    .line 1314
    const-string v2, "Data loss. Failed to bundle and serialize. appId"

    .line 1315
    .line 1316
    invoke-static {v3}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 1317
    .line 1318
    .line 1319
    move-result-object v3

    .line 1320
    invoke-virtual {v1, v2, v3, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1321
    .line 1322
    .line 1323
    return-object v24

    .line 1324
    :goto_a
    :try_start_9
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 1325
    .line 1326
    .line 1327
    move-result-object v3

    .line 1328
    invoke-virtual {v3}, Ll/d6x0;->z()Ll/l8x0;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v3

    .line 1332
    const-string v4, "app instance id encryption failed"

    .line 1333
    .line 1334
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v0

    .line 1338
    invoke-virtual {v3, v4, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1339
    .line 1340
    .line 1341
    new-array v0, v2, [B
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 1342
    .line 1343
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 1344
    .line 1345
    .line 1346
    move-result-object v1

    .line 1347
    invoke-virtual {v1}, Ll/opr0;->c1()V

    .line 1348
    .line 1349
    .line 1350
    return-object v0

    .line 1351
    :goto_b
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 1352
    .line 1353
    .line 1354
    move-result-object v1

    .line 1355
    invoke-virtual {v1}, Ll/opr0;->c1()V

    .line 1356
    .line 1357
    .line 1358
    throw v0
.end method
