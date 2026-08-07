.class public final Ll/exw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ll/nax0;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/exw0;->a:Ljava/util/List;

    .line 10
    .line 11
    sget-object v0, Ll/nax0;->b:Ll/nax0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/exw0;->b:Ll/nax0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/exw0;->c:Z

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic c(Ll/exw0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/exw0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/cxw0;)Ll/exw0;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/cxw0;->g(Ll/cxw0;)Ll/exw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Ll/cxw0;->k(Ll/cxw0;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/exw0;->d()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p1, p0}, Ll/cxw0;->i(Ll/cxw0;Ll/exw0;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/exw0;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "Entry has already been added to a KeysetHandle.Builder"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final b()Ll/hxw0;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/exw0;->c:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_12

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Ll/exw0;->c:Z

    .line 10
    .line 11
    iget-object v3, v0, Ll/exw0;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {}, Lcom/google/android/gms/internal/ads/x4;->N()Ll/ndx0;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const/4 v5, 0x0

    .line 18
    move v6, v5

    .line 19
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    add-int/lit8 v7, v7, -0x1

    .line 24
    .line 25
    if-ge v6, v7, :cond_2

    .line 26
    .line 27
    add-int/lit8 v7, v6, 0x1

    .line 28
    .line 29
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    check-cast v6, Ll/cxw0;

    .line 34
    .line 35
    invoke-static {v6}, Ll/cxw0;->f(Ll/cxw0;)Ll/dxw0;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-static {}, Ll/dxw0;->a()Ll/dxw0;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    if-ne v6, v8, :cond_1

    .line 44
    .line 45
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Ll/cxw0;

    .line 50
    .line 51
    invoke-static {v6}, Ll/cxw0;->f(Ll/cxw0;)Ll/dxw0;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {}, Ll/dxw0;->a()Ll/dxw0;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    if-ne v6, v8, :cond_0

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    const-string v0, "Entries with \'withRandomId()\' may only be followed by other entries with \'withRandomId()\'."

    .line 63
    .line 64
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-object v2

    .line 68
    :cond_1
    :goto_1
    move v6, v7

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    new-instance v3, Ljava/util/HashSet;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v6, v0, Ll/exw0;->a:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    move-object v7, v2

    .line 82
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-eqz v8, :cond_10

    .line 87
    .line 88
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    check-cast v8, Ll/cxw0;

    .line 93
    .line 94
    invoke-static {v8}, Ll/cxw0;->b(Ll/cxw0;)Ll/zww0;

    .line 95
    .line 96
    .line 97
    invoke-static {v8}, Ll/cxw0;->f(Ll/cxw0;)Ll/dxw0;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    if-eqz v9, :cond_f

    .line 102
    .line 103
    invoke-static {v8}, Ll/cxw0;->f(Ll/cxw0;)Ll/dxw0;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    invoke-static {}, Ll/dxw0;->a()Ll/dxw0;

    .line 108
    .line 109
    .line 110
    move-result-object v10

    .line 111
    const/4 v11, 0x3

    .line 112
    const/4 v12, 0x4

    .line 113
    if-ne v9, v10, :cond_5

    .line 114
    .line 115
    move v9, v5

    .line 116
    :goto_3
    if-eqz v9, :cond_3

    .line 117
    .line 118
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v10

    .line 122
    invoke-interface {v3, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v10

    .line 126
    if-eqz v10, :cond_6

    .line 127
    .line 128
    :cond_3
    new-instance v9, Ljava/security/SecureRandom;

    .line 129
    .line 130
    invoke-direct {v9}, Ljava/security/SecureRandom;-><init>()V

    .line 131
    .line 132
    .line 133
    new-array v10, v12, [B

    .line 134
    .line 135
    move v13, v5

    .line 136
    :goto_4
    if-nez v13, :cond_4

    .line 137
    .line 138
    invoke-virtual {v9, v10}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 139
    .line 140
    .line 141
    aget-byte v13, v10, v5

    .line 142
    .line 143
    and-int/lit16 v13, v13, 0xff

    .line 144
    .line 145
    aget-byte v14, v10, v1

    .line 146
    .line 147
    and-int/lit16 v14, v14, 0xff

    .line 148
    .line 149
    const/4 v15, 0x2

    .line 150
    aget-byte v15, v10, v15

    .line 151
    .line 152
    and-int/lit16 v15, v15, 0xff

    .line 153
    .line 154
    aget-byte v1, v10, v11

    .line 155
    .line 156
    and-int/lit16 v1, v1, 0xff

    .line 157
    .line 158
    shl-int/lit8 v13, v13, 0x18

    .line 159
    .line 160
    shl-int/lit8 v14, v14, 0x10

    .line 161
    .line 162
    or-int/2addr v13, v14

    .line 163
    shl-int/lit8 v14, v15, 0x8

    .line 164
    .line 165
    or-int/2addr v13, v14

    .line 166
    or-int/2addr v13, v1

    .line 167
    const/4 v1, 0x1

    .line 168
    goto :goto_4

    .line 169
    :cond_4
    move v9, v13

    .line 170
    goto :goto_3

    .line 171
    :cond_5
    invoke-static {v8}, Ll/cxw0;->f(Ll/cxw0;)Ll/dxw0;

    .line 172
    .line 173
    .line 174
    move v9, v5

    .line 175
    :cond_6
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-interface {v3, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v10

    .line 183
    if-nez v10, :cond_e

    .line 184
    .line 185
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    invoke-static {v8}, Ll/cxw0;->a(Ll/cxw0;)Ll/xww0;

    .line 189
    .line 190
    .line 191
    invoke-static {v8}, Ll/cxw0;->h(Ll/cxw0;)Ll/lxw0;

    .line 192
    .line 193
    .line 194
    move-result-object v10

    .line 195
    invoke-virtual {v8}, Ll/cxw0;->c()Ll/zww0;

    .line 196
    .line 197
    .line 198
    move-result-object v13

    .line 199
    sget-object v14, Ll/zww0;->b:Ll/zww0;

    .line 200
    .line 201
    invoke-virtual {v14, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v15

    .line 205
    if-eqz v15, :cond_7

    .line 206
    .line 207
    goto :goto_5

    .line 208
    :cond_7
    sget-object v11, Ll/zww0;->c:Ll/zww0;

    .line 209
    .line 210
    invoke-virtual {v11, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v11

    .line 214
    if-eqz v11, :cond_8

    .line 215
    .line 216
    move v11, v12

    .line 217
    goto :goto_5

    .line 218
    :cond_8
    sget-object v11, Ll/zww0;->d:Ll/zww0;

    .line 219
    .line 220
    invoke-virtual {v11, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v11

    .line 224
    if-eqz v11, :cond_d

    .line 225
    .line 226
    const/4 v11, 0x5

    .line 227
    :goto_5
    instance-of v12, v10, Ll/r5x0;

    .line 228
    .line 229
    if-eqz v12, :cond_9

    .line 230
    .line 231
    check-cast v10, Ll/r5x0;

    .line 232
    .line 233
    invoke-virtual {v10}, Ll/r5x0;->b()Ll/d7x0;

    .line 234
    .line 235
    .line 236
    move-result-object v10

    .line 237
    goto :goto_6

    .line 238
    :cond_9
    const-class v12, Ll/d7x0;

    .line 239
    .line 240
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 241
    .line 242
    .line 243
    move-result-object v13

    .line 244
    invoke-virtual {v13, v10, v12}, Ll/j6x0;->f(Ll/lxw0;Ljava/lang/Class;)Ll/l7x0;

    .line 245
    .line 246
    .line 247
    move-result-object v10

    .line 248
    :goto_6
    check-cast v10, Ll/d7x0;

    .line 249
    .line 250
    invoke-virtual {v10}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 251
    .line 252
    .line 253
    move-result-object v12

    .line 254
    invoke-static {v12}, Ll/zxw0;->a(Lcom/google/android/gms/internal/ads/u4;)Lcom/google/android/gms/internal/ads/t4;

    .line 255
    .line 256
    .line 257
    move-result-object v12

    .line 258
    invoke-static {}, Lcom/google/android/gms/internal/ads/w4;->N()Ll/odx0;

    .line 259
    .line 260
    .line 261
    move-result-object v13

    .line 262
    invoke-virtual {v13, v9}, Ll/odx0;->r(I)Ll/odx0;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v13, v11}, Ll/odx0;->t(I)Ll/odx0;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v13, v12}, Ll/odx0;->q(Lcom/google/android/gms/internal/ads/t4;)Ll/odx0;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v10}, Ll/d7x0;->c()Lcom/google/android/gms/internal/ads/u4;

    .line 272
    .line 273
    .line 274
    move-result-object v9

    .line 275
    invoke-virtual {v9}, Lcom/google/android/gms/internal/ads/u4;->P()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 276
    .line 277
    .line 278
    move-result-object v9

    .line 279
    invoke-virtual {v13, v9}, Ll/odx0;->s(Lcom/google/android/gms/internal/ads/zzgvz;)Ll/odx0;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v13}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 283
    .line 284
    .line 285
    move-result-object v9

    .line 286
    check-cast v9, Lcom/google/android/gms/internal/ads/w4;

    .line 287
    .line 288
    invoke-virtual {v4, v9}, Ll/ndx0;->q(Lcom/google/android/gms/internal/ads/w4;)Ll/ndx0;

    .line 289
    .line 290
    .line 291
    invoke-static {v8}, Ll/cxw0;->k(Ll/cxw0;)Z

    .line 292
    .line 293
    .line 294
    move-result v9

    .line 295
    if-eqz v9, :cond_a

    .line 296
    .line 297
    if-nez v7, :cond_c

    .line 298
    .line 299
    invoke-static {v8}, Ll/cxw0;->b(Ll/cxw0;)Ll/zww0;

    .line 300
    .line 301
    .line 302
    move-result-object v7

    .line 303
    if-ne v7, v14, :cond_b

    .line 304
    .line 305
    move-object v7, v1

    .line 306
    :cond_a
    const/4 v1, 0x1

    .line 307
    goto/16 :goto_2

    .line 308
    .line 309
    :cond_b
    const-string v0, "Primary key is not enabled"

    .line 310
    .line 311
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    return-object v2

    .line 315
    :cond_c
    const-string v0, "Two primaries were set"

    .line 316
    .line 317
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    return-object v2

    .line 321
    :cond_d
    const-string v0, "Unknown key status"

    .line 322
    .line 323
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    return-object v2

    .line 327
    :cond_e
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 328
    .line 329
    new-instance v1, Ljava/lang/StringBuilder;

    .line 330
    .line 331
    const-string v2, "Id "

    .line 332
    .line 333
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    const-string v2, " is used twice in the keyset"

    .line 340
    .line 341
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    throw v0

    .line 352
    :cond_f
    const-string v0, "No ID was set (with withFixedId or withRandomId)"

    .line 353
    .line 354
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    return-object v2

    .line 358
    :cond_10
    if-eqz v7, :cond_11

    .line 359
    .line 360
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    invoke-virtual {v4, v1}, Ll/ndx0;->r(I)Ll/ndx0;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v4}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    check-cast v1, Lcom/google/android/gms/internal/ads/x4;

    .line 372
    .line 373
    iget-object v0, v0, Ll/exw0;->b:Ll/nax0;

    .line 374
    .line 375
    invoke-static {v1, v0}, Ll/hxw0;->b(Lcom/google/android/gms/internal/ads/x4;Ll/nax0;)Ll/hxw0;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    return-object v0

    .line 380
    :cond_11
    const-string v0, "No primary was set"

    .line 381
    .line 382
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    return-object v2

    .line 386
    :cond_12
    const-string v0, "KeysetHandle.Builder#build must only be called once"

    .line 387
    .line 388
    invoke-static {v0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    return-object v2
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/exw0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/cxw0;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/cxw0;->j(Ll/cxw0;Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method
