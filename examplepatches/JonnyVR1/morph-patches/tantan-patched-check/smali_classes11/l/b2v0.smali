.class public final Ll/b2v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/b2v0;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ljava/lang/Runnable;Ll/hew0;)V
    .locals 9
    .param p4    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v3, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v5, p3

    .line 8
    move-object v7, p4

    .line 9
    move-object v8, p5

    .line 10
    invoke-virtual/range {v0 .. v8}, Ll/b2v0;->b(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;ZLl/yat0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/hew0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final b(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;ZLl/yat0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/hew0;)V
    .locals 4
    .param p4    # Ll/yat0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/b2v0;->b:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x1388

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gez v0, :cond_0

    .line 17
    .line 18
    const-string p0, "Not retrying to fetch app settings"

    .line 19
    .line 20
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Ll/b2v0;->b:J

    .line 33
    .line 34
    if-eqz p4, :cond_2

    .line 35
    .line 36
    invoke-virtual {p4}, Ll/yat0;->c()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p4}, Ll/yat0;->a()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    sub-long/2addr v2, v0

    .line 60
    sget-object v0, Ll/sgs0;->Y3:Ll/dgs0;

    .line 61
    .line 62
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ljava/lang/Long;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 73
    .line 74
    .line 75
    move-result-wide v0

    .line 76
    cmp-long v0, v2, v0

    .line 77
    .line 78
    if-gtz v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p4}, Ll/yat0;->i()Z

    .line 81
    .line 82
    .line 83
    move-result p4

    .line 84
    if-eqz p4, :cond_2

    .line 85
    .line 86
    goto/16 :goto_4

    .line 87
    .line 88
    :cond_2
    :goto_0
    if-nez p1, :cond_3

    .line 89
    .line 90
    const-string p0, "Context not provided to fetch application settings"

    .line 91
    .line 92
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    if-eqz p4, :cond_5

    .line 101
    .line 102
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result p4

    .line 106
    if-nez p4, :cond_4

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    const-string p0, "App settings could not be fetched. Required parameters missing"

    .line 110
    .line 111
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    :goto_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p4

    .line 119
    if-nez p4, :cond_6

    .line 120
    .line 121
    move-object p4, p1

    .line 122
    :cond_6
    iput-object p4, p0, Ll/b2v0;->a:Landroid/content/Context;

    .line 123
    .line 124
    const/4 p4, 0x4

    .line 125
    invoke-static {p1, p4}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 126
    .line 127
    .line 128
    move-result-object p4

    .line 129
    invoke-interface {p4}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 130
    .line 131
    .line 132
    invoke-static {}, Ll/bxy0;->h()Ll/fvs0;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v1, p0, Ll/b2v0;->a:Landroid/content/Context;

    .line 137
    .line 138
    invoke-virtual {v0, v1, p2, p8}, Ll/fvs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hew0;)Ll/ovs0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v1, "google.afma.config.fetchAppSettings"

    .line 143
    .line 144
    sget-object v2, Ll/lvs0;->b:Ll/ivs0;

    .line 145
    .line 146
    invoke-virtual {v0, v1, v2, v2}, Ll/ovs0;->a(Ljava/lang/String;Ll/hvs0;Ll/gvs0;)Ll/evs0;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const/4 v1, 0x0

    .line 151
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 152
    .line 153
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_7

    .line 161
    .line 162
    const-string p6, "app_id"

    .line 163
    .line 164
    invoke-virtual {v2, p6, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :catch_0
    move-exception p0

    .line 169
    goto :goto_5

    .line 170
    :cond_7
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p5

    .line 174
    if-nez p5, :cond_8

    .line 175
    .line 176
    const-string p5, "ad_unit_id"

    .line 177
    .line 178
    invoke-virtual {v2, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    .line 180
    .line 181
    :cond_8
    :goto_2
    const-string p5, "is_init"

    .line 182
    .line 183
    invoke-virtual {v2, p5, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 184
    .line 185
    .line 186
    const-string p3, "pn"

    .line 187
    .line 188
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p5

    .line 192
    invoke-virtual {v2, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 193
    .line 194
    .line 195
    const-string p3, "experiment_ids"

    .line 196
    .line 197
    const-string p5, ","

    .line 198
    .line 199
    sget-object p6, Ll/sgs0;->a:Ll/dgs0;

    .line 200
    .line 201
    invoke-static {}, Ll/jas0;->a()Ll/egs0;

    .line 202
    .line 203
    .line 204
    move-result-object p6

    .line 205
    invoke-virtual {p6}, Ll/egs0;->a()Ljava/util/List;

    .line 206
    .line 207
    .line 208
    move-result-object p6

    .line 209
    invoke-static {p5, p6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p5

    .line 213
    invoke-virtual {v2, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    .line 215
    .line 216
    const-string p3, "js"

    .line 217
    .line 218
    iget-object p2, p2, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v2, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .line 222
    .line 223
    :try_start_1
    iget-object p0, p0, Ll/b2v0;->a:Landroid/content/Context;

    .line 224
    .line 225
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    if-eqz p0, :cond_9

    .line 230
    .line 231
    invoke-static {p1}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {p1, p0, v1}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    if-eqz p0, :cond_9

    .line 242
    .line 243
    const-string p1, "version"

    .line 244
    .line 245
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 246
    .line 247
    invoke-virtual {v2, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 248
    .line 249
    .line 250
    goto :goto_3

    .line 251
    :catch_1
    :try_start_2
    const-string p0, "Error fetching PackageInfo."

    .line 252
    .line 253
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :cond_9
    :goto_3
    invoke-interface {v0, v2}, Ll/evs0;->zzb(Ljava/lang/Object;)Ll/hpr;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    new-instance p1, Ll/w4u0;

    .line 261
    .line 262
    invoke-direct {p1, p8, p4}, Ll/w4u0;-><init>(Ll/hew0;Ll/rdw0;)V

    .line 263
    .line 264
    .line 265
    sget-object p2, Ll/oct0;->f:Ll/xvw0;

    .line 266
    .line 267
    invoke-static {p0, p1, p2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    if-eqz p7, :cond_a

    .line 272
    .line 273
    invoke-interface {p0, p7, p2}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 274
    .line 275
    .line 276
    :cond_a
    const-string p0, "ConfigLoader.maybeFetchNewAppSettings"

    .line 277
    .line 278
    invoke-static {p1, p0}, Ll/rct0;->a(Ll/hpr;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 279
    .line 280
    .line 281
    :goto_4
    return-void

    .line 282
    :goto_5
    const-string p1, "Error requesting application settings"

    .line 283
    .line 284
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    .line 286
    .line 287
    invoke-interface {p4, p0}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 288
    .line 289
    .line 290
    invoke-interface {p4, v1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 291
    .line 292
    .line 293
    invoke-interface {p4}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {p8, p0}, Ll/hew0;->b(Ll/vdw0;)V

    .line 298
    .line 299
    .line 300
    return-void
.end method

.method public final c(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ll/yat0;Ll/hew0;)V
    .locals 10

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    invoke-virtual {p4}, Ll/yat0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    move-object v6, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :goto_1
    const/4 v4, 0x0

    .line 12
    const/4 v8, 0x0

    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p2

    .line 16
    move-object v7, p3

    .line 17
    move-object v5, p4

    .line 18
    move-object v9, p5

    .line 19
    invoke-virtual/range {v1 .. v9}, Ll/b2v0;->b(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;ZLl/yat0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/hew0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
