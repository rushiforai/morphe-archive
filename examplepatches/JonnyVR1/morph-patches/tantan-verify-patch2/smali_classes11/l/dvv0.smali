.class public final Ll/dvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dvv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dvv0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method

.method public static b(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.VIEW"

    .line 4
    .line 5
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    const/high16 p1, 0x10000

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method


# virtual methods
.method public final synthetic a()Ll/bvv0;
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "com.google.unity.ads.UNITY_VERSION"

    .line 4
    .line 5
    iget-object v2, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v4, "geo:0,0?q=donuts"

    .line 16
    .line 17
    invoke-static {v2, v4}, Ll/dvv0;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const-string v5, "http://www.google.com"

    .line 22
    .line 23
    invoke-static {v2, v5}, Ll/dvv0;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/obt0;->t()Z

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    iget-object v6, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {v6}, Lcom/google/android/gms/common/util/DeviceProperties;->isLatchsky(Landroid/content/Context;)Z

    .line 44
    .line 45
    .line 46
    move-result v11

    .line 47
    invoke-static {v6}, Lcom/google/android/gms/common/util/DeviceProperties;->isSidewinder(Landroid/content/Context;)Z

    .line 48
    .line 49
    .line 50
    move-result v12

    .line 51
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v13

    .line 55
    new-instance v14, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const/4 v6, 0x0

    .line 65
    move v7, v6

    .line 66
    :goto_0
    invoke-virtual {v3}, Landroid/os/LocaleList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v8

    .line 70
    if-ge v7, v8, :cond_0

    .line 71
    .line 72
    invoke-virtual {v3, v7}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    invoke-virtual {v14, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    add-int/lit8 v7, v7, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iget-object v3, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 87
    .line 88
    const-string v7, "market://details?id=com.google.android.gms.ads"

    .line 89
    .line 90
    invoke-static {v2, v7}, Ll/dvv0;->b(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    const-string v8, "."

    .line 95
    .line 96
    if-nez v7, :cond_2

    .line 97
    .line 98
    :catch_0
    :cond_1
    :goto_1
    const/4 v15, 0x0

    .line 99
    goto :goto_2

    .line 100
    :cond_2
    iget-object v7, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 101
    .line 102
    if-nez v7, :cond_3

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    :try_start_0
    invoke-static {v3}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    iget-object v15, v7, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v3, v15, v6}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    if-eqz v3, :cond_1

    .line 116
    .line 117
    iget v3, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 118
    .line 119
    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 120
    .line 121
    new-instance v15, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    move-object v15, v3

    .line 140
    :goto_2
    iget-object v3, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 141
    .line 142
    const/16 v7, 0x80

    .line 143
    .line 144
    :try_start_1
    invoke-static {v3}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    const-string v6, "com.android.vending"

    .line 149
    .line 150
    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    if-eqz v3, :cond_4

    .line 155
    .line 156
    iget v6, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 157
    .line 158
    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 159
    .line 160
    new-instance v7, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 178
    goto :goto_3

    .line 179
    :catch_1
    :cond_4
    const/4 v3, 0x0

    .line 180
    :goto_3
    iget-object v6, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 181
    .line 182
    const/4 v7, 0x0

    .line 183
    sget-object v17, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 184
    .line 185
    if-nez v2, :cond_5

    .line 186
    .line 187
    move-object/from16 v21, v3

    .line 188
    .line 189
    goto :goto_5

    .line 190
    :cond_5
    new-instance v8, Landroid/content/Intent;

    .line 191
    .line 192
    const-string v7, "android.intent.action.VIEW"

    .line 193
    .line 194
    const-string v20, "http://www.example.com"

    .line 195
    .line 196
    move-object/from16 v21, v3

    .line 197
    .line 198
    invoke-static/range {v20 .. v20}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-direct {v8, v7, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 203
    .line 204
    .line 205
    const/4 v7, 0x0

    .line 206
    invoke-virtual {v2, v8, v7}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    const/high16 v7, 0x10000

    .line 211
    .line 212
    invoke-virtual {v2, v8, v7}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    if-eqz v2, :cond_7

    .line 217
    .line 218
    if-eqz v3, :cond_7

    .line 219
    .line 220
    const/4 v7, 0x0

    .line 221
    :goto_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 222
    .line 223
    .line 224
    move-result v8

    .line 225
    if-ge v7, v8, :cond_7

    .line 226
    .line 227
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v8

    .line 231
    check-cast v8, Landroid/content/pm/ResolveInfo;

    .line 232
    .line 233
    move-object/from16 v20, v2

    .line 234
    .line 235
    iget-object v2, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 236
    .line 237
    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 238
    .line 239
    iget-object v8, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 240
    .line 241
    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_6

    .line 248
    .line 249
    iget-object v2, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 250
    .line 251
    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 252
    .line 253
    invoke-static {v6}, Ll/lqx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    goto :goto_5

    .line 262
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 263
    .line 264
    move-object/from16 v2, v20

    .line 265
    .line 266
    goto :goto_4

    .line 267
    :cond_7
    const/4 v7, 0x0

    .line 268
    :goto_5
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 269
    .line 270
    .line 271
    new-instance v2, Landroid/os/StatFs;

    .line 272
    .line 273
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-direct {v2, v3}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBytes()J

    .line 285
    .line 286
    .line 287
    move-result-wide v2

    .line 288
    const-wide/16 v22, 0x400

    .line 289
    .line 290
    div-long v2, v2, v22

    .line 291
    .line 292
    sget-object v6, Ll/sgs0;->Ma:Ll/dgs0;

    .line 293
    .line 294
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 295
    .line 296
    .line 297
    move-result-object v8

    .line 298
    invoke-virtual {v8, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    check-cast v6, Ljava/lang/Boolean;

    .line 303
    .line 304
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 305
    .line 306
    .line 307
    move-result v6

    .line 308
    if-eqz v6, :cond_8

    .line 309
    .line 310
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 311
    .line 312
    .line 313
    iget-object v6, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 314
    .line 315
    invoke-static {v6}, Lcom/google/android/gms/ads/internal/util/b;->a(Landroid/content/Context;)Z

    .line 316
    .line 317
    .line 318
    move-result v6

    .line 319
    if-eqz v6, :cond_8

    .line 320
    .line 321
    const/16 v22, 0x1

    .line 322
    .line 323
    goto :goto_6

    .line 324
    :cond_8
    const/16 v22, 0x0

    .line 325
    .line 326
    :goto_6
    sget-object v6, Ll/sgs0;->Oa:Ll/dgs0;

    .line 327
    .line 328
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 329
    .line 330
    .line 331
    move-result-object v8

    .line 332
    invoke-virtual {v8, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v6

    .line 336
    check-cast v6, Ljava/lang/Boolean;

    .line 337
    .line 338
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 339
    .line 340
    .line 341
    move-result v6

    .line 342
    if-eqz v6, :cond_a

    .line 343
    .line 344
    iget-object v0, v0, Ll/dvv0;->b:Landroid/content/Context;

    .line 345
    .line 346
    :try_start_2
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 347
    .line 348
    .line 349
    move-result-object v6

    .line 350
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    const/16 v8, 0x80

    .line 355
    .line 356
    invoke-virtual {v6, v0, v8}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 361
    .line 362
    if-eqz v0, :cond_9

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    if-eqz v6, :cond_9

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 374
    :goto_7
    move-object/from16 v23, v0

    .line 375
    .line 376
    goto :goto_8

    .line 377
    :catch_2
    :cond_9
    const/16 v23, 0x0

    .line 378
    .line 379
    goto :goto_8

    .line 380
    :cond_a
    const-string v0, ""

    .line 381
    .line 382
    goto :goto_7

    .line 383
    :goto_8
    if-eqz v5, :cond_b

    .line 384
    .line 385
    const/4 v8, 0x1

    .line 386
    goto :goto_9

    .line 387
    :cond_b
    const/4 v8, 0x0

    .line 388
    :goto_9
    if-eqz v4, :cond_c

    .line 389
    .line 390
    const/4 v6, 0x1

    .line 391
    goto :goto_a

    .line 392
    :cond_c
    const/4 v6, 0x0

    .line 393
    :goto_a
    new-instance v0, Ll/bvv0;

    .line 394
    .line 395
    sget-object v19, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 396
    .line 397
    sget v24, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 398
    .line 399
    move/from16 v18, v7

    .line 400
    .line 401
    move-object/from16 v16, v21

    .line 402
    .line 403
    move-wide/from16 v20, v2

    .line 404
    .line 405
    move v7, v6

    .line 406
    move-object v6, v0

    .line 407
    invoke-direct/range {v6 .. v24}, Ll/bvv0;-><init>(ZZLjava/lang/String;ZZZLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;JZLjava/lang/String;I)V

    .line 408
    .line 409
    .line 410
    return-object v6
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x26

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/cvv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cvv0;-><init>(Ll/dvv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dvv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
