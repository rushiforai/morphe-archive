.class public final Ll/f6z0;
.super Ll/qar0;
.source "SourceFile"


# instance fields
.field public g:Lcom/google/android/gms/internal/measurement/e;

.field public final synthetic h:Ll/pwy0;


# direct methods
.method public constructor <init>(Ll/pwy0;Ljava/lang/String;ILcom/google/android/gms/internal/measurement/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/qar0;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iput-object p4, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/e;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final k(Ljava/lang/Long;Ljava/lang/Long;Lcom/google/android/gms/internal/measurement/f0;Z)Z
    .locals 10

    .line 1
    invoke-static {}, Ll/rly0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v3, p0, Ll/qar0;->a:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v4, Ll/whs0;->o0:Ll/zpw0;

    .line 18
    .line 19
    invoke-virtual {v0, v3, v4}, Ll/ajr0;->B(Ljava/lang/String;Ll/zpw0;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    move v0, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v1

    .line 28
    :goto_0
    iget-object v3, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/google/android/gms/internal/measurement/e;->I()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 35
    .line 36
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/e;->K()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iget-object v5, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 41
    .line 42
    invoke-virtual {v5}, Lcom/google/android/gms/internal/measurement/e;->L()Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-nez v3, :cond_2

    .line 47
    .line 48
    if-nez v4, :cond_2

    .line 49
    .line 50
    if-eqz v5, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v3, v1

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_1
    move v3, v2

    .line 56
    :goto_2
    const/4 v4, 0x0

    .line 57
    if-eqz p4, :cond_4

    .line 58
    .line 59
    if-nez v3, :cond_4

    .line 60
    .line 61
    iget-object p1, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/d6x0;->E()Ll/l8x0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget p2, p0, Ll/qar0;->b:I

    .line 72
    .line 73
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object p3, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 78
    .line 79
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/e;->M()Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-eqz p3, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/e;->h()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    :cond_3
    const-string p0, "Property filter already evaluated true and it is not associated with an enhanced audience. audience ID, filter ID"

    .line 96
    .line 97
    invoke-virtual {p1, p0, p2, v4}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return v2

    .line 101
    :cond_4
    iget-object v6, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 102
    .line 103
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/e;->C()Lcom/google/android/gms/internal/measurement/d;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->K()Z

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->b0()Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-eqz v8, :cond_6

    .line 116
    .line 117
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    .line 118
    .line 119
    .line 120
    move-result v8

    .line 121
    if-nez v8, :cond_5

    .line 122
    .line 123
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 124
    .line 125
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v6}, Ll/d6x0;->F()Ll/l8x0;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    iget-object v7, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 134
    .line 135
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->X()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v8

    .line 143
    invoke-virtual {v7, v8}, Ll/wxw0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    const-string v8, "No number filter for long property. property"

    .line 148
    .line 149
    invoke-virtual {v6, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    goto/16 :goto_3

    .line 153
    .line 154
    :cond_5
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->N()J

    .line 155
    .line 156
    .line 157
    move-result-wide v8

    .line 158
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-static {v8, v9, v4}, Ll/qar0;->c(JLcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-static {v4, v7}, Ll/qar0;->d(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    goto/16 :goto_3

    .line 171
    .line 172
    :cond_6
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->Z()Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_8

    .line 177
    .line 178
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    .line 179
    .line 180
    .line 181
    move-result v8

    .line 182
    if-nez v8, :cond_7

    .line 183
    .line 184
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 185
    .line 186
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v6}, Ll/d6x0;->F()Ll/l8x0;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    iget-object v7, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 195
    .line 196
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->X()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    invoke-virtual {v7, v8}, Ll/wxw0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v7

    .line 208
    const-string v8, "No number filter for double property. property"

    .line 209
    .line 210
    invoke-virtual {v6, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    goto/16 :goto_3

    .line 214
    .line 215
    :cond_7
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->B()D

    .line 216
    .line 217
    .line 218
    move-result-wide v8

    .line 219
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    invoke-static {v8, v9, v4}, Ll/qar0;->b(DLcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    .line 224
    .line 225
    .line 226
    move-result-object v4

    .line 227
    invoke-static {v4, v7}, Ll/qar0;->d(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    goto/16 :goto_3

    .line 232
    .line 233
    :cond_8
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->d0()Z

    .line 234
    .line 235
    .line 236
    move-result v8

    .line 237
    if-eqz v8, :cond_c

    .line 238
    .line 239
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->T()Z

    .line 240
    .line 241
    .line 242
    move-result v8

    .line 243
    if-nez v8, :cond_b

    .line 244
    .line 245
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->M()Z

    .line 246
    .line 247
    .line 248
    move-result v8

    .line 249
    if-nez v8, :cond_9

    .line 250
    .line 251
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 252
    .line 253
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 254
    .line 255
    .line 256
    move-result-object v6

    .line 257
    invoke-virtual {v6}, Ll/d6x0;->F()Ll/l8x0;

    .line 258
    .line 259
    .line 260
    move-result-object v6

    .line 261
    iget-object v7, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 262
    .line 263
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    .line 264
    .line 265
    .line 266
    move-result-object v7

    .line 267
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->X()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v8

    .line 271
    invoke-virtual {v7, v8}, Ll/wxw0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v7

    .line 275
    const-string v8, "No string or number filter defined. property"

    .line 276
    .line 277
    invoke-virtual {v6, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_9
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->Y()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v8

    .line 285
    invoke-static {v8}, Ll/vmy0;->a0(Ljava/lang/String;)Z

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    if-eqz v8, :cond_a

    .line 290
    .line 291
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->Y()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->E()Lcom/google/android/gms/internal/measurement/zzfo$zzd;

    .line 296
    .line 297
    .line 298
    move-result-object v6

    .line 299
    invoke-static {v4, v6}, Ll/qar0;->e(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzfo$zzd;)Ljava/lang/Boolean;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    invoke-static {v4, v7}, Ll/qar0;->d(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    goto :goto_3

    .line 308
    :cond_a
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 309
    .line 310
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 311
    .line 312
    .line 313
    move-result-object v6

    .line 314
    invoke-virtual {v6}, Ll/d6x0;->F()Ll/l8x0;

    .line 315
    .line 316
    .line 317
    move-result-object v6

    .line 318
    iget-object v7, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 319
    .line 320
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->X()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    invoke-virtual {v7, v8}, Ll/wxw0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v7

    .line 332
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->Y()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v8

    .line 336
    const-string v9, "Invalid user property value for Numeric number filter. property, value"

    .line 337
    .line 338
    invoke-virtual {v6, v9, v7, v8}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 339
    .line 340
    .line 341
    goto :goto_3

    .line 342
    :cond_b
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->Y()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/d;->G()Lcom/google/android/gms/internal/measurement/zzfo$zzf;

    .line 347
    .line 348
    .line 349
    move-result-object v6

    .line 350
    iget-object v8, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 351
    .line 352
    invoke-virtual {v8}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 353
    .line 354
    .line 355
    move-result-object v8

    .line 356
    invoke-static {v4, v6, v8}, Ll/qar0;->g(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzfo$zzf;Ll/d6x0;)Ljava/lang/Boolean;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    invoke-static {v4, v7}, Ll/qar0;->d(Ljava/lang/Boolean;Z)Ljava/lang/Boolean;

    .line 361
    .line 362
    .line 363
    move-result-object v4

    .line 364
    goto :goto_3

    .line 365
    :cond_c
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 366
    .line 367
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 368
    .line 369
    .line 370
    move-result-object v6

    .line 371
    invoke-virtual {v6}, Ll/d6x0;->F()Ll/l8x0;

    .line 372
    .line 373
    .line 374
    move-result-object v6

    .line 375
    iget-object v7, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 376
    .line 377
    invoke-virtual {v7}, Ll/yyx0;->c()Ll/wxw0;

    .line 378
    .line 379
    .line 380
    move-result-object v7

    .line 381
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->X()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v8

    .line 385
    invoke-virtual {v7, v8}, Ll/wxw0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v7

    .line 389
    const-string v8, "User property has no value, property"

    .line 390
    .line 391
    invoke-virtual {v6, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 392
    .line 393
    .line 394
    :goto_3
    iget-object v6, p0, Ll/f6z0;->h:Ll/pwy0;

    .line 395
    .line 396
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 397
    .line 398
    .line 399
    move-result-object v6

    .line 400
    invoke-virtual {v6}, Ll/d6x0;->E()Ll/l8x0;

    .line 401
    .line 402
    .line 403
    move-result-object v6

    .line 404
    if-nez v4, :cond_d

    .line 405
    .line 406
    const-string v7, "null"

    .line 407
    .line 408
    goto :goto_4

    .line 409
    :cond_d
    move-object v7, v4

    .line 410
    :goto_4
    const-string v8, "Property filter result"

    .line 411
    .line 412
    invoke-virtual {v6, v8, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 413
    .line 414
    .line 415
    if-nez v4, :cond_e

    .line 416
    .line 417
    return v1

    .line 418
    :cond_e
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 419
    .line 420
    iput-object v1, p0, Ll/qar0;->c:Ljava/lang/Boolean;

    .line 421
    .line 422
    if-eqz v5, :cond_f

    .line 423
    .line 424
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    if-nez v1, :cond_f

    .line 429
    .line 430
    return v2

    .line 431
    :cond_f
    if-eqz p4, :cond_10

    .line 432
    .line 433
    iget-object p4, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 434
    .line 435
    invoke-virtual {p4}, Lcom/google/android/gms/internal/measurement/e;->I()Z

    .line 436
    .line 437
    .line 438
    move-result p4

    .line 439
    if-eqz p4, :cond_11

    .line 440
    .line 441
    :cond_10
    iput-object v4, p0, Ll/qar0;->d:Ljava/lang/Boolean;

    .line 442
    .line 443
    :cond_11
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 444
    .line 445
    .line 446
    move-result p4

    .line 447
    if-eqz p4, :cond_15

    .line 448
    .line 449
    if-eqz v3, :cond_15

    .line 450
    .line 451
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->c0()Z

    .line 452
    .line 453
    .line 454
    move-result p4

    .line 455
    if-eqz p4, :cond_15

    .line 456
    .line 457
    invoke-virtual {p3}, Lcom/google/android/gms/internal/measurement/f0;->U()J

    .line 458
    .line 459
    .line 460
    move-result-wide p3

    .line 461
    if-eqz p1, :cond_12

    .line 462
    .line 463
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 464
    .line 465
    .line 466
    move-result-wide p3

    .line 467
    :cond_12
    if-eqz v0, :cond_13

    .line 468
    .line 469
    iget-object p1, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 470
    .line 471
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/e;->I()Z

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    if-eqz p1, :cond_13

    .line 476
    .line 477
    iget-object p1, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 478
    .line 479
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/e;->K()Z

    .line 480
    .line 481
    .line 482
    move-result p1

    .line 483
    if-nez p1, :cond_13

    .line 484
    .line 485
    if-eqz p2, :cond_13

    .line 486
    .line 487
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 488
    .line 489
    .line 490
    move-result-wide p3

    .line 491
    :cond_13
    iget-object p1, p0, Ll/f6z0;->g:Lcom/google/android/gms/internal/measurement/e;

    .line 492
    .line 493
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/e;->K()Z

    .line 494
    .line 495
    .line 496
    move-result p1

    .line 497
    if-eqz p1, :cond_14

    .line 498
    .line 499
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 500
    .line 501
    .line 502
    move-result-object p1

    .line 503
    iput-object p1, p0, Ll/qar0;->f:Ljava/lang/Long;

    .line 504
    .line 505
    goto :goto_5

    .line 506
    :cond_14
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    iput-object p1, p0, Ll/qar0;->e:Ljava/lang/Long;

    .line 511
    .line 512
    :cond_15
    :goto_5
    return v2
.end method
