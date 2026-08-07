.class public final Ll/f4v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/dlt0;

.field public final b:Landroid/content/Context;

.field public final c:Lcom/google/android/gms/internal/ads/zzcei;

.field public final d:Ll/o7w0;

.field public final e:Ljava/util/concurrent/Executor;

.field public final f:Ljava/lang/String;

.field public final g:Ll/cew0;

.field public final h:Ll/c8w0;

.field public final i:Ll/swu0;


# direct methods
.method public constructor <init>(Ll/dlt0;Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/o7w0;Ljava/util/concurrent/Executor;Ljava/lang/String;Ll/cew0;Ll/swu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f4v0;->a:Ll/dlt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f4v0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/f4v0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 9
    .line 10
    iput-object p4, p0, Ll/f4v0;->d:Ll/o7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/f4v0;->e:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    iput-object p6, p0, Ll/f4v0;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, Ll/f4v0;->g:Ll/cew0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/dlt0;->A()Ll/c8w0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/f4v0;->h:Ll/c8w0;

    .line 23
    .line 24
    iput-object p8, p0, Ll/f4v0;->i:Ll/swu0;

    .line 25
    .line 26
    return-void
.end method

.method public static final e(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    const-string p0, "request_id"

    .line 9
    .line 10
    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :catch_0
    return-object v0
.end method


# virtual methods
.method public final a()Ll/hpr;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/f4v0;->d:Ll/o7w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzx:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "true"

    .line 12
    .line 13
    if-nez v1, :cond_9

    .line 14
    .line 15
    sget-object v1, Ll/sgs0;->X6:Ll/dgs0;

    .line 16
    .line 17
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_9

    .line 32
    .line 33
    invoke-static {v0}, Ll/f4v0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v3, Ll/sgs0;->i7:Ll/dgs0;

    .line 38
    .line 39
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    const/4 v5, -0x1

    .line 54
    if-eqz v4, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    const-string v1, "&request_id="

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eq v1, v5, :cond_0

    .line 69
    .line 70
    add-int/lit8 v1, v1, 0xc

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const-string v1, ""

    .line 78
    .line 79
    :cond_1
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 86
    .line 87
    const/16 v0, 0xf

    .line 88
    .line 89
    const-string v1, "Invalid ad string."

    .line 90
    .line 91
    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_2
    iget-object v4, p0, Ll/f4v0;->a:Ll/dlt0;

    .line 100
    .line 101
    iget-object v6, p0, Ll/f4v0;->i:Ll/swu0;

    .line 102
    .line 103
    invoke-virtual {v4}, Ll/dlt0;->s()Lcom/google/android/gms/ads/nonagon/signalgeneration/a;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4, v1, v6}, Lcom/google/android/gms/ads/nonagon/signalgeneration/a;->b(Ljava/lang/String;Ll/swu0;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-virtual {v6, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/Boolean;

    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_7

    .line 126
    .line 127
    iget-object v3, p0, Ll/f4v0;->i:Ll/swu0;

    .line 128
    .line 129
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    if-nez v6, :cond_7

    .line 134
    .line 135
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    .line 136
    .line 137
    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    const-string v7, "is_gbid"

    .line 141
    .line 142
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    if-eqz v6, :cond_3

    .line 151
    .line 152
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :catch_0
    :cond_3
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 156
    .line 157
    :goto_1
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    if-nez v6, :cond_4

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_4
    const-string v6, "&"

    .line 165
    .line 166
    invoke-virtual {v0, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    const/4 v7, 0x0

    .line 171
    if-eq v6, v5, :cond_5

    .line 172
    .line 173
    const/4 v5, 0x0

    .line 174
    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    goto :goto_2

    .line 179
    :cond_5
    move-object v5, v7

    .line 180
    :goto_2
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    if-eqz v6, :cond_6

    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_6
    const/16 v6, 0xb

    .line 188
    .line 189
    :try_start_1
    invoke-static {v5, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    const-string v6, "UTF-8"

    .line 194
    .line 195
    invoke-virtual {v1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 196
    .line 197
    .line 198
    move-result-object v1
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 199
    :try_start_2
    new-instance v6, Lorg/json/JSONObject;

    .line 200
    .line 201
    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    const-string v8, "arek"

    .line 205
    .line 206
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v7
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    .line 210
    goto :goto_3

    .line 211
    :catch_1
    move-exception v1

    .line 212
    goto :goto_4

    .line 213
    :catch_2
    move-exception v6

    .line 214
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    const-string v9, "Failed to get key from QueryJSONMap"

    .line 219
    .line 220
    invoke-virtual {v9, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    invoke-static {v8}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 228
    .line 229
    .line 230
    move-result-object v8

    .line 231
    const-string v9, "CryptoUtils.getKeyFromQueryJsonMap"

    .line 232
    .line 233
    invoke-virtual {v8, v6, v9}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :goto_3
    invoke-static {v5, v1, v7, v3}, Ll/c8w0;->b([B[BLjava/lang/String;Ll/swu0;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    .line 240
    goto :goto_5

    .line 241
    :goto_4
    const-string v3, "Failed to decode the adResponse. "

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    invoke-virtual {v3, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-static {v3}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    const-string v3, "PreloadedLoader.decryptAdResponseIfNecessary"

    .line 255
    .line 256
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 257
    .line 258
    .line 259
    move-result-object v5

    .line 260
    invoke-virtual {v5, v1, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    :cond_7
    :goto_5
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_8

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_8
    invoke-virtual {p0, v4}, Ll/f4v0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-virtual {p0, v0, v1}, Ll/f4v0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/hpr;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    return-object p0

    .line 279
    :cond_9
    :goto_6
    iget-object v0, p0, Ll/f4v0;->d:Ll/o7w0;

    .line 280
    .line 281
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 282
    .line 283
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzs:Lcom/google/android/gms/ads/internal/client/zzc;

    .line 284
    .line 285
    if-eqz v0, :cond_c

    .line 286
    .line 287
    sget-object v1, Ll/sgs0;->V6:Ll/dgs0;

    .line 288
    .line 289
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-virtual {v3, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    check-cast v1, Ljava/lang/Boolean;

    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-nez v1, :cond_a

    .line 304
    .line 305
    goto :goto_7

    .line 306
    :cond_a
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/client/zzc;->zza:Ljava/lang/String;

    .line 307
    .line 308
    iget-object v3, v0, Lcom/google/android/gms/ads/internal/client/zzc;->zzb:Ljava/lang/String;

    .line 309
    .line 310
    invoke-static {v1}, Ll/f4v0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-static {v3}, Ll/f4v0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    if-nez v4, :cond_b

    .line 323
    .line 324
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    if-eqz v3, :cond_b

    .line 329
    .line 330
    iget-object v2, p0, Ll/f4v0;->a:Ll/dlt0;

    .line 331
    .line 332
    invoke-virtual {v2}, Ll/dlt0;->s()Lcom/google/android/gms/ads/nonagon/signalgeneration/a;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    invoke-virtual {v2, v1}, Lcom/google/android/gms/ads/nonagon/signalgeneration/a;->f(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    iget-object v2, p0, Ll/f4v0;->i:Ll/swu0;

    .line 340
    .line 341
    invoke-virtual {v2}, Ll/swu0;->a()Ljava/util/Map;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    const-string v3, "rid"

    .line 346
    .line 347
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    :goto_7
    iget-object v1, v0, Lcom/google/android/gms/ads/internal/client/zzc;->zza:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v0, v0, Lcom/google/android/gms/ads/internal/client/zzc;->zzb:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {p0, v0}, Ll/f4v0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-virtual {p0, v1, v0}, Ll/f4v0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/hpr;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    return-object p0

    .line 363
    :cond_b
    iget-object p0, p0, Ll/f4v0;->i:Ll/swu0;

    .line 364
    .line 365
    invoke-virtual {p0}, Ll/swu0;->a()Ljava/util/Map;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    const-string v0, "ridmm"

    .line 370
    .line 371
    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    :cond_c
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 375
    .line 376
    const/16 v0, 0xe

    .line 377
    .line 378
    const-string v1, "Mismatch request IDs."

    .line 379
    .line 380
    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 381
    .line 382
    .line 383
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    return-object p0
.end method

.method public final synthetic b(Lorg/json/JSONObject;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b7w0;

    .line 2
    .line 3
    new-instance v1, Ll/y6w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/f4v0;->d:Ll/o7w0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y6w0;-><init>(Ll/o7w0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ljava/io/StringReader;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ll/a7w0;->a(Ljava/io/Reader;)Ll/a7w0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, v1, p0}, Ll/b7w0;-><init>(Ll/y6w0;Ll/a7w0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)Ll/hpr;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/f4v0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Ll/f4v0;->a:Ll/dlt0;

    .line 17
    .line 18
    iget-object v3, p0, Ll/f4v0;->b:Landroid/content/Context;

    .line 19
    .line 20
    iget-object v4, p0, Ll/f4v0;->c:Lcom/google/android/gms/internal/ads/zzcei;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/dlt0;->D()Ll/hew0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v3, v4, v2}, Ll/fvs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "google.afma.response.normalize"

    .line 31
    .line 32
    sget-object v3, Ll/lvs0;->b:Ll/ivs0;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3, v3}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, ""

    .line 39
    .line 40
    invoke-static {v2}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v3, Ll/c4v0;

    .line 45
    .line 46
    invoke-direct {v3, p0, p1, p2}, Ll/c4v0;-><init>(Ll/f4v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/f4v0;->e:Ljava/util/concurrent/Executor;

    .line 50
    .line 51
    invoke-static {v2, v3, p1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance p2, Ll/d4v0;

    .line 56
    .line 57
    invoke-direct {p2, v1}, Ll/d4v0;-><init>(Ll/evs0;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/f4v0;->e:Ljava/util/concurrent/Executor;

    .line 61
    .line 62
    invoke-static {p1, p2, v1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/e4v0;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/e4v0;-><init>(Ll/f4v0;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/f4v0;->e:Ljava/util/concurrent/Executor;

    .line 72
    .line 73
    invoke-static {p1, p2, v1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p0, p0, Ll/f4v0;->g:Ll/cew0;

    .line 78
    .line 79
    invoke-static {p1, p0, v0}, Ll/bew0;->a(Ll/hpr;Ll/cew0;Ll/rdw0;)V

    .line 80
    .line 81
    .line 82
    return-object p1
.end method

.method public final d(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "ad_types"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const-string v3, "unknown"

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    new-instance v2, Lorg/json/JSONArray;

    .line 28
    .line 29
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/f4v0;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    return-object p0

    .line 49
    :goto_1
    const-string v0, "Failed to update the ad types for rendering. "

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method
