.class public final Ll/wgy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/c9y0;

.field public final b:Landroid/app/Activity;

.field public final c:Ll/ux5;

.field public final d:Ll/wx5;


# direct methods
.method public synthetic constructor <init>(Ll/c9y0;Landroid/app/Activity;Ll/ux5;Ll/wx5;Ll/mdy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wgy0;->b:Landroid/app/Activity;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wgy0;->c:Ll/ux5;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wgy0;->d:Ll/wx5;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/wgy0;)Ll/cdt0;
    .locals 9

    .line 1
    new-instance v0, Ll/cdt0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cdt0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wgy0;->d:Ll/wx5;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/wx5;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x3

    .line 17
    const/4 v4, 0x0

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :try_start_0
    iget-object v2, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 22
    .line 23
    invoke-static {v2}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v5, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 32
    .line 33
    invoke-static {v5}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const/16 v6, 0x80

    .line 42
    .line 43
    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-object v2, v4

    .line 51
    :goto_0
    if-eqz v2, :cond_1

    .line 52
    .line 53
    const-string v1, "com.google.android.gms.ads.APPLICATION_ID"

    .line 54
    .line 55
    invoke-virtual {v2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_12

    .line 64
    .line 65
    :goto_1
    iput-object v1, v0, Ll/cdt0;->a:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p0, Ll/wgy0;->c:Ll/ux5;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/ux5;->b()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v2, 0x2

    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    iget-object v5, p0, Ll/wgy0;->c:Ll/ux5;

    .line 85
    .line 86
    invoke-virtual {v5}, Ll/ux5;->a()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    const/4 v6, 0x1

    .line 91
    if-eq v5, v6, :cond_6

    .line 92
    .line 93
    if-eq v5, v2, :cond_5

    .line 94
    .line 95
    if-eq v5, v3, :cond_4

    .line 96
    .line 97
    const/4 v3, 0x4

    .line 98
    if-eq v5, v3, :cond_3

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    sget-object v3, Lcom/google/android/gms/internal/consent_sdk/zzca;->zze:Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 102
    .line 103
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_4
    sget-object v3, Lcom/google/android/gms/internal/consent_sdk/zzca;->zzd:Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 108
    .line 109
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_5
    sget-object v3, Lcom/google/android/gms/internal/consent_sdk/zzca;->zzf:Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 114
    .line 115
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_6
    sget-object v3, Lcom/google/android/gms/internal/consent_sdk/zzca;->zzc:Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 120
    .line 121
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :goto_2
    sget-object v3, Lcom/google/android/gms/internal/consent_sdk/zzca;->zzg:Lcom/google/android/gms/internal/consent_sdk/zzca;

    .line 125
    .line 126
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    :goto_3
    iput-object v1, v0, Ll/cdt0;->i:Ljava/util/List;

    .line 130
    .line 131
    iget-object v1, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 132
    .line 133
    invoke-static {v1}, Ll/c9y0;->b(Ll/c9y0;)Ll/tqr0;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1}, Ll/tqr0;->b()Ljava/util/Map;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iput-object v1, v0, Ll/cdt0;->e:Ljava/util/Map;

    .line 142
    .line 143
    iget-object v1, p0, Ll/wgy0;->d:Ll/wx5;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/wx5;->b()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Ll/cdt0;->d:Ljava/lang/Boolean;

    .line 154
    .line 155
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, v0, Ll/cdt0;->c:Ljava/lang/String;

    .line 164
    .line 165
    new-instance v1, Ll/b8t0;

    .line 166
    .line 167
    invoke-direct {v1}, Ll/b8t0;-><init>()V

    .line 168
    .line 169
    .line 170
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 171
    .line 172
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    iput-object v5, v1, Ll/b8t0;->b:Ljava/lang/Integer;

    .line 177
    .line 178
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v5, v1, Ll/b8t0;->a:Ljava/lang/String;

    .line 181
    .line 182
    iput v2, v1, Ll/b8t0;->c:I

    .line 183
    .line 184
    iput-object v1, v0, Ll/cdt0;->b:Ll/b8t0;

    .line 185
    .line 186
    iget-object v1, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 187
    .line 188
    invoke-static {v1}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    iget-object v2, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 201
    .line 202
    invoke-static {v2}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 211
    .line 212
    .line 213
    new-instance v2, Ll/nat0;

    .line 214
    .line 215
    invoke-direct {v2}, Ll/nat0;-><init>()V

    .line 216
    .line 217
    .line 218
    iget v5, v1, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 219
    .line 220
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    iput-object v5, v2, Ll/nat0;->a:Ljava/lang/Integer;

    .line 225
    .line 226
    iget v1, v1, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 227
    .line 228
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    iput-object v1, v2, Ll/nat0;->b:Ljava/lang/Integer;

    .line 233
    .line 234
    iget-object v1, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 235
    .line 236
    invoke-static {v1}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 249
    .line 250
    float-to-double v5, v1

    .line 251
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iput-object v1, v2, Ll/nat0;->c:Ljava/lang/Double;

    .line 256
    .line 257
    const/16 v1, 0x1c

    .line 258
    .line 259
    if-ge v3, v1, :cond_7

    .line 260
    .line 261
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 262
    .line 263
    goto/16 :goto_9

    .line 264
    .line 265
    :cond_7
    iget-object v3, p0, Ll/wgy0;->b:Landroid/app/Activity;

    .line 266
    .line 267
    if-nez v3, :cond_8

    .line 268
    .line 269
    move-object v3, v4

    .line 270
    goto :goto_4

    .line 271
    :cond_8
    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    :goto_4
    if-nez v3, :cond_9

    .line 276
    .line 277
    move-object v3, v4

    .line 278
    goto :goto_5

    .line 279
    :cond_9
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    :goto_5
    if-nez v3, :cond_a

    .line 284
    .line 285
    move-object v3, v4

    .line 286
    goto :goto_6

    .line 287
    :cond_a
    invoke-virtual {v3}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    :goto_6
    if-nez v3, :cond_b

    .line 292
    .line 293
    move-object v3, v4

    .line 294
    goto :goto_7

    .line 295
    :cond_b
    invoke-static {v3}, Ll/mgq0;->a(Landroid/view/WindowInsets;)Landroid/view/DisplayCutout;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    :goto_7
    if-nez v3, :cond_c

    .line 300
    .line 301
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_c
    invoke-static {v3}, Ll/tgy0;->a(Landroid/view/DisplayCutout;)I

    .line 305
    .line 306
    .line 307
    new-instance v5, Ljava/util/ArrayList;

    .line 308
    .line 309
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 310
    .line 311
    .line 312
    invoke-static {v3}, Ll/n4z0;->a(Landroid/view/DisplayCutout;)Ljava/util/List;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    :cond_d
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 321
    .line 322
    .line 323
    move-result v6

    .line 324
    if-eqz v6, :cond_e

    .line 325
    .line 326
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v6

    .line 330
    check-cast v6, Landroid/graphics/Rect;

    .line 331
    .line 332
    if-eqz v6, :cond_d

    .line 333
    .line 334
    new-instance v7, Ll/f9t0;

    .line 335
    .line 336
    invoke-direct {v7}, Ll/f9t0;-><init>()V

    .line 337
    .line 338
    .line 339
    iget v8, v6, Landroid/graphics/Rect;->left:I

    .line 340
    .line 341
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v8

    .line 345
    iput-object v8, v7, Ll/f9t0;->b:Ljava/lang/Integer;

    .line 346
    .line 347
    iget v8, v6, Landroid/graphics/Rect;->right:I

    .line 348
    .line 349
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 350
    .line 351
    .line 352
    move-result-object v8

    .line 353
    iput-object v8, v7, Ll/f9t0;->c:Ljava/lang/Integer;

    .line 354
    .line 355
    iget v8, v6, Landroid/graphics/Rect;->top:I

    .line 356
    .line 357
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 358
    .line 359
    .line 360
    move-result-object v8

    .line 361
    iput-object v8, v7, Ll/f9t0;->a:Ljava/lang/Integer;

    .line 362
    .line 363
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 364
    .line 365
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 366
    .line 367
    .line 368
    move-result-object v6

    .line 369
    iput-object v6, v7, Ll/f9t0;->d:Ljava/lang/Integer;

    .line 370
    .line 371
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    goto :goto_8

    .line 375
    :cond_e
    move-object v3, v5

    .line 376
    :goto_9
    iput-object v3, v2, Ll/nat0;->d:Ljava/util/List;

    .line 377
    .line 378
    iput-object v2, v0, Ll/cdt0;->f:Ll/nat0;

    .line 379
    .line 380
    iget-object v2, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 381
    .line 382
    invoke-static {v2}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    :try_start_1
    invoke-static {v2}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v5

    .line 398
    const/4 v6, 0x0

    .line 399
    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 400
    .line 401
    .line 402
    move-result-object v2
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 403
    goto :goto_a

    .line 404
    :catch_1
    move-object v2, v4

    .line 405
    :goto_a
    new-instance v5, Ll/f4t0;

    .line 406
    .line 407
    invoke-direct {v5}, Ll/f4t0;-><init>()V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    iput-object v3, v5, Ll/f4t0;->a:Ljava/lang/String;

    .line 415
    .line 416
    iget-object v3, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 417
    .line 418
    invoke-static {v3}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    iget-object p0, p0, Ll/wgy0;->a:Ll/c9y0;

    .line 427
    .line 428
    invoke-static {p0}, Ll/c9y0;->a(Ll/c9y0;)Landroid/app/Application;

    .line 429
    .line 430
    .line 431
    move-result-object p0

    .line 432
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 433
    .line 434
    .line 435
    move-result-object p0

    .line 436
    invoke-virtual {v3, p0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    if-eqz p0, :cond_f

    .line 441
    .line 442
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v4

    .line 446
    :cond_f
    iput-object v4, v5, Ll/f4t0;->b:Ljava/lang/String;

    .line 447
    .line 448
    if-eqz v2, :cond_11

    .line 449
    .line 450
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 451
    .line 452
    if-lt p0, v1, :cond_10

    .line 453
    .line 454
    invoke-static {v2}, Lcom/appsflyer/internal/h;->a(Landroid/content/pm/PackageInfo;)J

    .line 455
    .line 456
    .line 457
    move-result-wide v1

    .line 458
    goto :goto_b

    .line 459
    :cond_10
    iget p0, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 460
    .line 461
    int-to-long v1, p0

    .line 462
    :goto_b
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    iput-object p0, v5, Ll/f4t0;->c:Ljava/lang/String;

    .line 467
    .line 468
    :cond_11
    iput-object v5, v0, Ll/cdt0;->g:Ll/f4t0;

    .line 469
    .line 470
    new-instance p0, Ll/vbt0;

    .line 471
    .line 472
    invoke-direct {p0}, Ll/vbt0;-><init>()V

    .line 473
    .line 474
    .line 475
    const-string v1, "3.1.0"

    .line 476
    .line 477
    iput-object v1, p0, Ll/vbt0;->a:Ljava/lang/String;

    .line 478
    .line 479
    iput-object p0, v0, Ll/cdt0;->h:Ll/vbt0;

    .line 480
    .line 481
    return-object v0

    .line 482
    :cond_12
    new-instance p0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 483
    .line 484
    const-string v0, "The UMP SDK requires a valid application ID in your AndroidManifest.xml through a com.google.android.gms.ads.APPLICATION_ID meta-data tag.\nExample AndroidManifest:\n    <meta-data\n        android:name=\"com.google.android.gms.ads.APPLICATION_ID\"\n        android:value=\"ca-app-pub-0000000000000000~0000000000\">"

    .line 485
    .line 486
    invoke-direct {p0, v3, v0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 487
    .line 488
    .line 489
    throw p0
.end method
