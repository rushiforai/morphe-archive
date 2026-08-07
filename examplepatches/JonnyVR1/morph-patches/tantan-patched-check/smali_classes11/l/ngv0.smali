.class public abstract Ll/ngv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string p1, "pubid"

    .line 4
    .line 5
    const-string p2, ""

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 32

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v1, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 6
    .line 7
    const-string v3, "pubid"

    .line 8
    .line 9
    const-string v4, ""

    .line 10
    .line 11
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, v0, Ll/b7w0;->a:Ll/y6w0;

    .line 16
    .line 17
    iget-object v3, v3, Ll/y6w0;->a:Ll/o7w0;

    .line 18
    .line 19
    new-instance v4, Ll/m7w0;

    .line 20
    .line 21
    invoke-direct {v4}, Ll/m7w0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v4, v3}, Ll/m7w0;->G(Ll/o7w0;)Ll/m7w0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4, v2}, Ll/m7w0;->J(Ljava/lang/String;)Ll/m7w0;

    .line 28
    .line 29
    .line 30
    iget-object v2, v3, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/zzl;->zzm:Landroid/os/Bundle;

    .line 33
    .line 34
    invoke-static {v2}, Ll/ngv0;->d(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v5, "com.google.ads.mediation.admob.AdMobAdapter"

    .line 39
    .line 40
    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    invoke-static {v6}, Ll/ngv0;->d(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 45
    .line 46
    .line 47
    move-result-object v9

    .line 48
    const-string v6, "gw"

    .line 49
    .line 50
    const/4 v7, 0x1

    .line 51
    invoke-virtual {v9, v6, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iget-object v6, v1, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 55
    .line 56
    const-string v8, "mad_hac"

    .line 57
    .line 58
    const/4 v10, 0x0

    .line 59
    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    if-eqz v6, :cond_0

    .line 64
    .line 65
    invoke-virtual {v9, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v6, v1, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 69
    .line 70
    const-string v8, "adJson"

    .line 71
    .line 72
    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    if-eqz v6, :cond_1

    .line 77
    .line 78
    const-string v8, "_ad"

    .line 79
    .line 80
    invoke-virtual {v9, v8, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    const-string v6, "_noRefresh"

    .line 84
    .line 85
    invoke-virtual {v9, v6, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v6, v1, Ll/q6w0;->E:Lorg/json/JSONObject;

    .line 89
    .line 90
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_3

    .line 99
    .line 100
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    check-cast v7, Ljava/lang/String;

    .line 105
    .line 106
    iget-object v8, v1, Ll/q6w0;->E:Lorg/json/JSONObject;

    .line 107
    .line 108
    invoke-virtual {v8, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    if-eqz v7, :cond_2

    .line 113
    .line 114
    invoke-virtual {v9, v7, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    invoke-virtual {v2, v5, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 119
    .line 120
    .line 121
    iget-object v3, v3, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 122
    .line 123
    iget-object v5, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzn:Landroid/os/Bundle;

    .line 124
    .line 125
    iget-object v6, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzo:Ljava/util/List;

    .line 126
    .line 127
    iget-object v7, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzp:Ljava/lang/String;

    .line 128
    .line 129
    iget v10, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzd:I

    .line 130
    .line 131
    iget-object v8, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzq:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v11, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zze:Ljava/util/List;

    .line 134
    .line 135
    iget-boolean v12, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzr:Z

    .line 136
    .line 137
    move/from16 v24, v12

    .line 138
    .line 139
    iget-boolean v12, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzf:Z

    .line 140
    .line 141
    iget-object v13, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzs:Lcom/google/android/gms/ads/internal/client/zzc;

    .line 142
    .line 143
    move-object/from16 v25, v13

    .line 144
    .line 145
    iget v13, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 146
    .line 147
    iget v14, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 148
    .line 149
    move/from16 v26, v14

    .line 150
    .line 151
    iget-boolean v14, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzh:Z

    .line 152
    .line 153
    iget-object v15, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzu:Ljava/lang/String;

    .line 154
    .line 155
    move-object/from16 v27, v15

    .line 156
    .line 157
    iget-object v15, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzi:Ljava/lang/String;

    .line 158
    .line 159
    move-object/from16 v19, v2

    .line 160
    .line 161
    iget-object v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzv:Ljava/util/List;

    .line 162
    .line 163
    move-object/from16 v20, v5

    .line 164
    .line 165
    new-instance v5, Lcom/google/android/gms/ads/internal/client/zzl;

    .line 166
    .line 167
    move-object/from16 v28, v2

    .line 168
    .line 169
    iget-object v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzj:Lcom/google/android/gms/ads/internal/client/zzfh;

    .line 170
    .line 171
    move-object/from16 v16, v2

    .line 172
    .line 173
    iget v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzw:I

    .line 174
    .line 175
    move-object/from16 v21, v6

    .line 176
    .line 177
    iget v6, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zza:I

    .line 178
    .line 179
    move/from16 v29, v2

    .line 180
    .line 181
    iget-object v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 182
    .line 183
    move-object/from16 v17, v2

    .line 184
    .line 185
    iget-object v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzx:Ljava/lang/String;

    .line 186
    .line 187
    move-object/from16 v22, v7

    .line 188
    .line 189
    move-object/from16 v23, v8

    .line 190
    .line 191
    iget-wide v7, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzb:J

    .line 192
    .line 193
    move-object/from16 v30, v2

    .line 194
    .line 195
    iget-object v2, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzl:Ljava/lang/String;

    .line 196
    .line 197
    iget v3, v3, Lcom/google/android/gms/ads/internal/client/zzl;->zzy:I

    .line 198
    .line 199
    move-object/from16 v18, v2

    .line 200
    .line 201
    move/from16 v31, v3

    .line 202
    .line 203
    invoke-direct/range {v5 .. v31}, Lcom/google/android/gms/ads/internal/client/zzl;-><init>(IJLandroid/os/Bundle;ILjava/util/List;ZIZLjava/lang/String;Lcom/google/android/gms/ads/internal/client/zzfh;Landroid/location/Location;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/ads/internal/client/zzc;ILjava/lang/String;Ljava/util/List;ILjava/lang/String;I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v4, v5}, Ll/m7w0;->e(Lcom/google/android/gms/ads/internal/client/zzl;)Ll/m7w0;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v4}, Ll/m7w0;->g()Ll/o7w0;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    new-instance v3, Landroid/os/Bundle;

    .line 214
    .line 215
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 216
    .line 217
    .line 218
    iget-object v4, v0, Ll/b7w0;->b:Ll/a7w0;

    .line 219
    .line 220
    iget-object v4, v4, Ll/a7w0;->b:Ll/t6w0;

    .line 221
    .line 222
    new-instance v5, Landroid/os/Bundle;

    .line 223
    .line 224
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 225
    .line 226
    .line 227
    new-instance v6, Ljava/util/ArrayList;

    .line 228
    .line 229
    iget-object v7, v4, Ll/t6w0;->a:Ljava/util/List;

    .line 230
    .line 231
    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 232
    .line 233
    .line 234
    const-string v7, "nofill_urls"

    .line 235
    .line 236
    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 237
    .line 238
    .line 239
    const-string v6, "refresh_interval"

    .line 240
    .line 241
    iget v7, v4, Ll/t6w0;->c:I

    .line 242
    .line 243
    invoke-virtual {v5, v6, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 244
    .line 245
    .line 246
    const-string v6, "gws_query_id"

    .line 247
    .line 248
    iget-object v4, v4, Ll/t6w0;->b:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    const-string v4, "parent_common_config"

    .line 254
    .line 255
    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 256
    .line 257
    .line 258
    iget-object v4, v0, Ll/b7w0;->a:Ll/y6w0;

    .line 259
    .line 260
    iget-object v4, v4, Ll/y6w0;->a:Ll/o7w0;

    .line 261
    .line 262
    new-instance v5, Landroid/os/Bundle;

    .line 263
    .line 264
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 265
    .line 266
    .line 267
    const-string v6, "initial_ad_unit_id"

    .line 268
    .line 269
    iget-object v4, v4, Ll/o7w0;->f:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object v4, v1, Ll/q6w0;->x:Ljava/lang/String;

    .line 275
    .line 276
    const-string v6, "allocation_id"

    .line 277
    .line 278
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    new-instance v4, Ljava/util/ArrayList;

    .line 282
    .line 283
    iget-object v6, v1, Ll/q6w0;->c:Ljava/util/List;

    .line 284
    .line 285
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 286
    .line 287
    .line 288
    const-string v6, "click_urls"

    .line 289
    .line 290
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 291
    .line 292
    .line 293
    new-instance v4, Ljava/util/ArrayList;

    .line 294
    .line 295
    iget-object v6, v1, Ll/q6w0;->d:Ljava/util/List;

    .line 296
    .line 297
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 298
    .line 299
    .line 300
    const-string v6, "imp_urls"

    .line 301
    .line 302
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 303
    .line 304
    .line 305
    new-instance v4, Ljava/util/ArrayList;

    .line 306
    .line 307
    iget-object v6, v1, Ll/q6w0;->q:Ljava/util/List;

    .line 308
    .line 309
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 310
    .line 311
    .line 312
    const-string v6, "manual_tracking_urls"

    .line 313
    .line 314
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 315
    .line 316
    .line 317
    new-instance v4, Ljava/util/ArrayList;

    .line 318
    .line 319
    iget-object v6, v1, Ll/q6w0;->n:Ljava/util/List;

    .line 320
    .line 321
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 322
    .line 323
    .line 324
    const-string v6, "fill_urls"

    .line 325
    .line 326
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 327
    .line 328
    .line 329
    new-instance v4, Ljava/util/ArrayList;

    .line 330
    .line 331
    iget-object v6, v1, Ll/q6w0;->h:Ljava/util/List;

    .line 332
    .line 333
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 334
    .line 335
    .line 336
    const-string v6, "video_start_urls"

    .line 337
    .line 338
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 339
    .line 340
    .line 341
    new-instance v4, Ljava/util/ArrayList;

    .line 342
    .line 343
    iget-object v6, v1, Ll/q6w0;->i:Ljava/util/List;

    .line 344
    .line 345
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 346
    .line 347
    .line 348
    const-string v6, "video_reward_urls"

    .line 349
    .line 350
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 351
    .line 352
    .line 353
    new-instance v4, Ljava/util/ArrayList;

    .line 354
    .line 355
    iget-object v6, v1, Ll/q6w0;->j:Ljava/util/List;

    .line 356
    .line 357
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 358
    .line 359
    .line 360
    const-string v6, "video_complete_urls"

    .line 361
    .line 362
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 363
    .line 364
    .line 365
    iget-object v4, v1, Ll/q6w0;->k:Ljava/lang/String;

    .line 366
    .line 367
    const-string v6, "transaction_id"

    .line 368
    .line 369
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    iget-object v4, v1, Ll/q6w0;->l:Ljava/lang/String;

    .line 373
    .line 374
    const-string v6, "valid_from_timestamp"

    .line 375
    .line 376
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-boolean v4, v1, Ll/q6w0;->Q:Z

    .line 380
    .line 381
    const-string v6, "is_closable_area_disabled"

    .line 382
    .line 383
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 384
    .line 385
    .line 386
    iget-object v4, v1, Ll/q6w0;->p0:Ljava/lang/String;

    .line 387
    .line 388
    const-string v6, "recursive_server_response_data"

    .line 389
    .line 390
    invoke-virtual {v5, v6, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    iget-object v4, v1, Ll/q6w0;->m:Lcom/google/android/gms/internal/ads/zzcag;

    .line 394
    .line 395
    if-eqz v4, :cond_4

    .line 396
    .line 397
    new-instance v4, Landroid/os/Bundle;

    .line 398
    .line 399
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 400
    .line 401
    .line 402
    iget-object v6, v1, Ll/q6w0;->m:Lcom/google/android/gms/internal/ads/zzcag;

    .line 403
    .line 404
    iget v6, v6, Lcom/google/android/gms/internal/ads/zzcag;->zzb:I

    .line 405
    .line 406
    const-string v7, "rb_amount"

    .line 407
    .line 408
    invoke-virtual {v4, v7, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 409
    .line 410
    .line 411
    iget-object v6, v1, Ll/q6w0;->m:Lcom/google/android/gms/internal/ads/zzcag;

    .line 412
    .line 413
    iget-object v6, v6, Lcom/google/android/gms/internal/ads/zzcag;->zza:Ljava/lang/String;

    .line 414
    .line 415
    const-string v7, "rb_type"

    .line 416
    .line 417
    invoke-virtual {v4, v7, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    filled-new-array {v4}, [Landroid/os/Bundle;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    const-string v6, "rewards"

    .line 425
    .line 426
    invoke-virtual {v5, v6, v4}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 427
    .line 428
    .line 429
    :cond_4
    const-string v4, "parent_ad_config"

    .line 430
    .line 431
    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 432
    .line 433
    .line 434
    move-object/from16 v4, p0

    .line 435
    .line 436
    invoke-virtual {v4, v2, v3, v1, v0}, Ll/ngv0;->c(Ll/o7w0;Landroid/os/Bundle;Ll/q6w0;Ll/b7w0;)Ll/hpr;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    return-object v0
.end method

.method public abstract c(Ll/o7w0;Landroid/os/Bundle;Ll/q6w0;Ll/b7w0;)Ll/hpr;
.end method
