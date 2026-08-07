.class public final Ll/k8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation build Landroidx/annotation/MainThread;
.end annotation

.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/k8y0;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    const-string v3, "https://google.com/search?"

    .line 8
    .line 9
    iget-object v4, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 10
    .line 11
    invoke-virtual {v4}, Ll/yyx0;->h()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    iget-object v4, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 15
    .line 16
    invoke-virtual {v4}, Ll/yyx0;->e()Ll/hny0;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-static {}, Ll/nny0;->a()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const/4 v7, 0x1

    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    iget-object v5, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 28
    .line 29
    invoke-virtual {v5}, Ll/yyx0;->a()Ll/ajr0;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    sget-object v8, Ll/whs0;->U0:Ll/zpw0;

    .line 34
    .line 35
    invoke-virtual {v5, v8}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-eqz v5, :cond_0

    .line 40
    .line 41
    move v5, v7

    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception v0

    .line 44
    goto/16 :goto_7

    .line 45
    .line 46
    :cond_0
    const/4 v5, 0x0

    .line 47
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v8
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    const-string v9, "_cis"

    .line 52
    .line 53
    const-string v10, "Activity created with data \'referrer\' without required params"

    .line 54
    .line 55
    const-string v11, "utm_medium"

    .line 56
    .line 57
    const-string v12, "utm_source"

    .line 58
    .line 59
    const-string v13, "utm_campaign"

    .line 60
    .line 61
    const/4 v14, 0x0

    .line 62
    const-string v15, "gclid"

    .line 63
    .line 64
    if-eqz v8, :cond_1

    .line 65
    .line 66
    :goto_1
    move-object v3, v14

    .line 67
    goto :goto_2

    .line 68
    :cond_1
    :try_start_1
    invoke-virtual {v2, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-nez v8, :cond_3

    .line 73
    .line 74
    if-eqz v5, :cond_2

    .line 75
    .line 76
    const-string v8, "gbraid"

    .line 77
    .line 78
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    if-nez v8, :cond_3

    .line 83
    .line 84
    :cond_2
    invoke-virtual {v2, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    if-nez v8, :cond_3

    .line 89
    .line 90
    invoke-virtual {v2, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    if-nez v8, :cond_3

    .line 95
    .line 96
    invoke-virtual {v2, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-nez v8, :cond_3

    .line 101
    .line 102
    const-string v8, "utm_id"

    .line 103
    .line 104
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    if-nez v8, :cond_3

    .line 109
    .line 110
    const-string v8, "dclid"

    .line 111
    .line 112
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    if-nez v8, :cond_3

    .line 117
    .line 118
    const-string v8, "srsltid"

    .line 119
    .line 120
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v8

    .line 124
    if-nez v8, :cond_3

    .line 125
    .line 126
    const-string v8, "sfmc_id"

    .line 127
    .line 128
    invoke-virtual {v2, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    if-nez v8, :cond_3

    .line 133
    .line 134
    invoke-virtual {v4}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v3}, Ll/d6x0;->z()Ll/l8x0;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3, v10}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v4, v3, v5}, Ll/hny0;->w(Landroid/net/Uri;Z)Landroid/os/Bundle;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    if-eqz v3, :cond_4

    .line 159
    .line 160
    const-string v4, "referrer"

    .line 161
    .line 162
    invoke-virtual {v3, v9, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 163
    .line 164
    .line 165
    :cond_4
    :goto_2
    const-string v4, "_cmp"

    .line 166
    .line 167
    if-eqz p1, :cond_7

    .line 168
    .line 169
    :try_start_2
    iget-object v5, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 170
    .line 171
    invoke-virtual {v5}, Ll/yyx0;->e()Ll/hny0;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-static {}, Ll/nny0;->a()Z

    .line 176
    .line 177
    .line 178
    move-result v8

    .line 179
    if-eqz v8, :cond_5

    .line 180
    .line 181
    iget-object v8, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 182
    .line 183
    invoke-virtual {v8}, Ll/yyx0;->a()Ll/ajr0;

    .line 184
    .line 185
    .line 186
    move-result-object v8

    .line 187
    sget-object v6, Ll/whs0;->U0:Ll/zpw0;

    .line 188
    .line 189
    invoke-virtual {v8, v6}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 190
    .line 191
    .line 192
    move-result v6

    .line 193
    if-eqz v6, :cond_5

    .line 194
    .line 195
    move v6, v7

    .line 196
    :goto_3
    move-object/from16 v8, p2

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_5
    const/4 v6, 0x0

    .line 200
    goto :goto_3

    .line 201
    :goto_4
    invoke-virtual {v5, v8, v6}, Ll/hny0;->w(Landroid/net/Uri;Z)Landroid/os/Bundle;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    if-eqz v5, :cond_7

    .line 206
    .line 207
    const-string v6, "intent"

    .line 208
    .line 209
    invoke-virtual {v5, v9, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, v15}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v6

    .line 216
    if-nez v6, :cond_6

    .line 217
    .line 218
    if-eqz v3, :cond_6

    .line 219
    .line 220
    invoke-virtual {v3, v15}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    if-eqz v6, :cond_6

    .line 225
    .line 226
    const-string v6, "_cer"

    .line 227
    .line 228
    const-string v8, "gclid=%s"

    .line 229
    .line 230
    invoke-virtual {v3, v15}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v9

    .line 234
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v9

    .line 238
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v8

    .line 242
    invoke-virtual {v5, v6, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :cond_6
    iget-object v6, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 246
    .line 247
    invoke-virtual {v6, v0, v4, v5}, Lcom/google/android/gms/measurement/internal/g;->V0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 248
    .line 249
    .line 250
    iget-object v6, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 251
    .line 252
    iget-object v6, v6, Lcom/google/android/gms/measurement/internal/g;->q:Ll/gyy0;

    .line 253
    .line 254
    invoke-virtual {v6, v0, v5}, Ll/gyy0;->b(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 255
    .line 256
    .line 257
    :cond_7
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    if-eqz v5, :cond_8

    .line 262
    .line 263
    goto/16 :goto_6

    .line 264
    .line 265
    :cond_8
    iget-object v5, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 266
    .line 267
    invoke-virtual {v5}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    invoke-virtual {v5}, Ll/d6x0;->z()Ll/l8x0;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    const-string v6, "Activity created with referrer"

    .line 276
    .line 277
    invoke-virtual {v5, v6, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    iget-object v5, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 281
    .line 282
    invoke-virtual {v5}, Ll/yyx0;->a()Ll/ajr0;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    sget-object v6, Ll/whs0;->r0:Ll/zpw0;

    .line 287
    .line 288
    invoke-virtual {v5, v6}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 289
    .line 290
    .line 291
    move-result v5
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 292
    const-string v6, "_ldl"

    .line 293
    .line 294
    const-string v8, "auto"

    .line 295
    .line 296
    if-eqz v5, :cond_a

    .line 297
    .line 298
    iget-object v5, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 299
    .line 300
    if-eqz v3, :cond_9

    .line 301
    .line 302
    :try_start_3
    invoke-virtual {v5, v0, v4, v3}, Lcom/google/android/gms/measurement/internal/g;->V0(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 303
    .line 304
    .line 305
    iget-object v2, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 306
    .line 307
    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/g;->q:Ll/gyy0;

    .line 308
    .line 309
    invoke-virtual {v2, v0, v3}, Ll/gyy0;->b(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 310
    .line 311
    .line 312
    goto :goto_5

    .line 313
    :cond_9
    invoke-virtual {v5}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    const-string v3, "Referrer does not contain valid parameters"

    .line 322
    .line 323
    invoke-virtual {v0, v3, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    :goto_5
    iget-object v0, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 327
    .line 328
    invoke-virtual {v0, v8, v6, v14, v7}, Lcom/google/android/gms/measurement/internal/g;->c0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 329
    .line 330
    .line 331
    return-void

    .line 332
    :cond_a
    invoke-virtual {v2, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-eqz v0, :cond_d

    .line 337
    .line 338
    invoke-virtual {v2, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    if-nez v0, :cond_b

    .line 343
    .line 344
    invoke-virtual {v2, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-nez v0, :cond_b

    .line 349
    .line 350
    invoke-virtual {v2, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    if-nez v0, :cond_b

    .line 355
    .line 356
    const-string v0, "utm_term"

    .line 357
    .line 358
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-nez v0, :cond_b

    .line 363
    .line 364
    const-string v0, "utm_content"

    .line 365
    .line 366
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_d

    .line 371
    .line 372
    :cond_b
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-nez v0, :cond_c

    .line 377
    .line 378
    iget-object v0, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 379
    .line 380
    invoke-virtual {v0, v8, v6, v2, v7}, Lcom/google/android/gms/measurement/internal/g;->c0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 381
    .line 382
    .line 383
    :cond_c
    :goto_6
    return-void

    .line 384
    :cond_d
    iget-object v0, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 385
    .line 386
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {v0}, Ll/d6x0;->z()Ll/l8x0;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-virtual {v0, v10}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 395
    .line 396
    .line 397
    return-void

    .line 398
    :goto_7
    iget-object v1, v1, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 399
    .line 400
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    const-string v2, "Throwable caught in handleReferrerForOnActivityCreated"

    .line 409
    .line 410
    invoke-virtual {v1, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 411
    .line 412
    .line 413
    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "onActivityCreated"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1, p2}, Ll/say0;->z(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/net/Uri;->isHierarchical()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    :goto_0
    move-object v5, v1

    .line 45
    goto :goto_1

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    move-object v3, p0

    .line 48
    goto/16 :goto_8

    .line 49
    .line 50
    :catch_0
    move-exception v0

    .line 51
    move-object v3, p0

    .line 52
    goto/16 :goto_7

    .line 53
    .line 54
    :cond_1
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    const-string v2, "com.android.vending.referral_url"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const/4 v1, 0x0

    .line 78
    goto :goto_0

    .line 79
    :goto_1
    if-eqz v5, :cond_3

    .line 80
    .line 81
    invoke-virtual {v5}, Landroid/net/Uri;->isHierarchical()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_4

    .line 86
    .line 87
    :cond_3
    move-object v3, p0

    .line 88
    goto :goto_6

    .line 89
    :cond_4
    iget-object v1, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Ll/hny0;->Z(Landroid/content/Intent;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    const-string v0, "gs"

    .line 101
    .line 102
    :goto_2
    move-object v6, v0

    .line 103
    goto :goto_3

    .line 104
    :cond_5
    const-string v0, "auto"

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :goto_3
    const-string v0, "referrer"

    .line 108
    .line 109
    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    if-nez p2, :cond_6

    .line 114
    .line 115
    const/4 v0, 0x1

    .line 116
    :goto_4
    move v4, v0

    .line 117
    goto :goto_5

    .line 118
    :cond_6
    const/4 v0, 0x0

    .line 119
    goto :goto_4

    .line 120
    :goto_5
    iget-object v0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v2, Ll/p9y0;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    .line 128
    move-object v3, p0

    .line 129
    :try_start_2
    invoke-direct/range {v2 .. v7}, Ll/p9y0;-><init>(Ll/k8y0;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ll/qsx0;->w(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 133
    .line 134
    .line 135
    iget-object p0, v3, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, p1, p2}, Ll/say0;->z(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catchall_1
    move-exception v0

    .line 146
    goto :goto_8

    .line 147
    :catch_1
    move-exception v0

    .line 148
    goto :goto_7

    .line 149
    :goto_6
    iget-object p0, v3, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 150
    .line 151
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, p1, p2}, Ll/say0;->z(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :goto_7
    :try_start_3
    iget-object p0, v3, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    const-string v1, "Throwable caught in onActivityCreated"

    .line 170
    .line 171
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 172
    .line 173
    .line 174
    iget-object p0, v3, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p0, p1, p2}, Ll/say0;->z(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :goto_8
    iget-object p0, v3, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-virtual {p0, p1, p2}, Ll/say0;->z(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 191
    .line 192
    .line 193
    throw v0
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/say0;->y(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v1v0;->m()Ll/say0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/say0;->K(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/v1v0;->o()Ll/thy0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    invoke-virtual {p0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v2, Ll/zhy0;

    .line 29
    .line 30
    invoke-direct {v2, p0, v0, v1}, Ll/zhy0;-><init>(Ll/thy0;J)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v2}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 5
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v1v0;->o()Ll/thy0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    new-instance v4, Ll/ciy0;

    .line 20
    .line 21
    invoke-direct {v4, v0, v1, v2}, Ll/ciy0;-><init>(Ll/thy0;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Ll/say0;->M(Landroid/app/Activity;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k8y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/v1v0;->m()Ll/say0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/say0;->L(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method
