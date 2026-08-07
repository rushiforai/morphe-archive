.class public final Ll/jnv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vuv0;


# instance fields
.field public final a:Ll/o7w0;

.field public final b:J


# direct methods
.method public constructor <init>(Ll/o7w0;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "the targeting must not be null"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/jnv0;->a:Ll/o7w0;

    .line 10
    .line 11
    iput-wide p2, p0, Ll/jnv0;->b:J

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)V
    .locals 14

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    iget-object v0, p0, Ll/jnv0;->a:Ll/o7w0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 6
    .line 7
    const-string v1, "http_timeout_millis"

    .line 8
    .line 9
    iget v2, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzw:I

    .line 10
    .line 11
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/jnv0;->a:Ll/o7w0;

    .line 15
    .line 16
    const-string v2, "slotname"

    .line 17
    .line 18
    iget-object v1, v1, Ll/o7w0;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/jnv0;->a:Ll/o7w0;

    .line 24
    .line 25
    iget-object v1, v1, Ll/o7w0;->o:Ll/x6w0;

    .line 26
    .line 27
    iget v1, v1, Ll/x6w0;->a:I

    .line 28
    .line 29
    if-eqz v1, :cond_c

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    add-int/2addr v1, v2

    .line 33
    const/4 v3, 0x2

    .line 34
    const/4 v4, 0x1

    .line 35
    if-eq v1, v4, :cond_1

    .line 36
    .line 37
    if-eq v1, v3, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string v1, "is_rewarded_interstitial"

    .line 41
    .line 42
    invoke-virtual {p1, v1, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-string v1, "is_new_rewarded"

    .line 47
    .line 48
    invoke-virtual {p1, v1, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iget-wide v5, p0, Ll/jnv0;->b:J

    .line 52
    .line 53
    const-string p0, "start_signals_timestamp"

    .line 54
    .line 55
    invoke-virtual {p1, p0, v5, v6}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 59
    .line 60
    const-string v1, "yyyyMMdd"

    .line 61
    .line 62
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 63
    .line 64
    invoke-direct {p0, v1, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 65
    .line 66
    .line 67
    iget-wide v5, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzb:J

    .line 68
    .line 69
    new-instance v1, Ljava/util/Date;

    .line 70
    .line 71
    invoke-direct {v1, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-wide v5, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzb:J

    .line 79
    .line 80
    const-wide/16 v7, -0x1

    .line 81
    .line 82
    cmp-long v1, v5, v7

    .line 83
    .line 84
    const/4 v5, 0x0

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    move v1, v4

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    move v1, v5

    .line 90
    :goto_1
    const-string v6, "cust_age"

    .line 91
    .line 92
    invoke-static {p1, v6, p0, v1}, Ll/b8w0;->f(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzc:Landroid/os/Bundle;

    .line 96
    .line 97
    const-string v1, "extras"

    .line 98
    .line 99
    invoke-static {p1, v1, p0}, Ll/b8w0;->b(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 100
    .line 101
    .line 102
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzd:I

    .line 103
    .line 104
    if-eq p0, v2, :cond_3

    .line 105
    .line 106
    move v1, v4

    .line 107
    goto :goto_2

    .line 108
    :cond_3
    move v1, v5

    .line 109
    :goto_2
    const-string v6, "cust_gender"

    .line 110
    .line 111
    invoke-static {p1, v6, p0, v1}, Ll/b8w0;->e(Landroid/os/Bundle;Ljava/lang/String;IZ)V

    .line 112
    .line 113
    .line 114
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zze:Ljava/util/List;

    .line 115
    .line 116
    const-string v1, "kw"

    .line 117
    .line 118
    invoke-static {p1, v1, p0}, Ll/b8w0;->d(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzg:I

    .line 122
    .line 123
    if-eq p0, v2, :cond_4

    .line 124
    .line 125
    move v1, v4

    .line 126
    goto :goto_3

    .line 127
    :cond_4
    move v1, v5

    .line 128
    :goto_3
    const-string v6, "tag_for_child_directed_treatment"

    .line 129
    .line 130
    invoke-static {p1, v6, p0, v1}, Ll/b8w0;->e(Landroid/os/Bundle;Ljava/lang/String;IZ)V

    .line 131
    .line 132
    .line 133
    iget-boolean p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzf:Z

    .line 134
    .line 135
    if-eqz p0, :cond_5

    .line 136
    .line 137
    const-string p0, "test_request"

    .line 138
    .line 139
    invoke-virtual {p1, p0, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 140
    .line 141
    .line 142
    :cond_5
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzy:I

    .line 143
    .line 144
    const-string v1, "ppt_p13n"

    .line 145
    .line 146
    invoke-virtual {p1, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zza:I

    .line 150
    .line 151
    if-lt p0, v3, :cond_6

    .line 152
    .line 153
    iget-boolean p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzh:Z

    .line 154
    .line 155
    if-eqz p0, :cond_6

    .line 156
    .line 157
    move p0, v4

    .line 158
    goto :goto_4

    .line 159
    :cond_6
    move p0, v5

    .line 160
    :goto_4
    const-string v1, "d_imp_hdr"

    .line 161
    .line 162
    invoke-static {p1, v1, v4, p0}, Ll/b8w0;->e(Landroid/os/Bundle;Ljava/lang/String;IZ)V

    .line 163
    .line 164
    .line 165
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzi:Ljava/lang/String;

    .line 166
    .line 167
    iget v1, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zza:I

    .line 168
    .line 169
    if-lt v1, v3, :cond_7

    .line 170
    .line 171
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-nez v1, :cond_7

    .line 176
    .line 177
    move v1, v4

    .line 178
    goto :goto_5

    .line 179
    :cond_7
    move v1, v5

    .line 180
    :goto_5
    const-string v3, "ppid"

    .line 181
    .line 182
    invoke-static {p1, v3, p0, v1}, Ll/b8w0;->f(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 183
    .line 184
    .line 185
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzk:Landroid/location/Location;

    .line 186
    .line 187
    if-eqz p0, :cond_8

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/location/Location;->getAccuracy()F

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 194
    .line 195
    mul-float/2addr v1, v3

    .line 196
    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    .line 197
    .line 198
    .line 199
    move-result-wide v6

    .line 200
    const-wide/16 v8, 0x3e8

    .line 201
    .line 202
    mul-long/2addr v6, v8

    .line 203
    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    .line 204
    .line 205
    .line 206
    move-result-wide v8

    .line 207
    const-wide v10, 0x416312d000000000L    # 1.0E7

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    mul-double/2addr v8, v10

    .line 213
    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    .line 214
    .line 215
    .line 216
    move-result-wide v12

    .line 217
    mul-double/2addr v12, v10

    .line 218
    new-instance p0, Landroid/os/Bundle;

    .line 219
    .line 220
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string v3, "radius"

    .line 224
    .line 225
    invoke-virtual {p0, v3, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 226
    .line 227
    .line 228
    const-string v1, "lat"

    .line 229
    .line 230
    double-to-long v8, v8

    .line 231
    invoke-virtual {p0, v1, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 232
    .line 233
    .line 234
    const-string v1, "long"

    .line 235
    .line 236
    double-to-long v8, v12

    .line 237
    invoke-virtual {p0, v1, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 238
    .line 239
    .line 240
    const-string v1, "time"

    .line 241
    .line 242
    invoke-virtual {p0, v1, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 243
    .line 244
    .line 245
    const-string v1, "uule"

    .line 246
    .line 247
    invoke-virtual {p1, v1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 248
    .line 249
    .line 250
    :cond_8
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzl:Ljava/lang/String;

    .line 251
    .line 252
    const-string v1, "url"

    .line 253
    .line 254
    invoke-static {p1, v1, p0}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzv:Ljava/util/List;

    .line 258
    .line 259
    const-string v1, "neighboring_content_urls"

    .line 260
    .line 261
    invoke-static {p1, v1, p0}, Ll/b8w0;->d(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/List;)V

    .line 262
    .line 263
    .line 264
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzn:Landroid/os/Bundle;

    .line 265
    .line 266
    const-string v1, "custom_targeting"

    .line 267
    .line 268
    invoke-static {p1, v1, p0}, Ll/b8w0;->b(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 269
    .line 270
    .line 271
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzo:Ljava/util/List;

    .line 272
    .line 273
    const-string v1, "category_exclusions"

    .line 274
    .line 275
    invoke-static {p1, v1, p0}, Ll/b8w0;->d(Landroid/os/Bundle;Ljava/lang/String;Ljava/util/List;)V

    .line 276
    .line 277
    .line 278
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzp:Ljava/lang/String;

    .line 279
    .line 280
    const-string v1, "request_agent"

    .line 281
    .line 282
    invoke-static {p1, v1, p0}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzq:Ljava/lang/String;

    .line 286
    .line 287
    const-string v1, "request_pkg"

    .line 288
    .line 289
    invoke-static {p1, v1, p0}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-boolean p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzr:Z

    .line 293
    .line 294
    iget v1, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zza:I

    .line 295
    .line 296
    const/4 v3, 0x7

    .line 297
    if-lt v1, v3, :cond_9

    .line 298
    .line 299
    move v1, v4

    .line 300
    goto :goto_6

    .line 301
    :cond_9
    move v1, v5

    .line 302
    :goto_6
    const-string v3, "is_designed_for_families"

    .line 303
    .line 304
    invoke-static {p1, v3, p0, v1}, Ll/b8w0;->g(Landroid/os/Bundle;Ljava/lang/String;ZZ)V

    .line 305
    .line 306
    .line 307
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zza:I

    .line 308
    .line 309
    const/16 v1, 0x8

    .line 310
    .line 311
    if-lt p0, v1, :cond_b

    .line 312
    .line 313
    iget p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzt:I

    .line 314
    .line 315
    if-eq p0, v2, :cond_a

    .line 316
    .line 317
    goto :goto_7

    .line 318
    :cond_a
    move v4, v5

    .line 319
    :goto_7
    const-string v1, "tag_for_under_age_of_consent"

    .line 320
    .line 321
    invoke-static {p1, v1, p0, v4}, Ll/b8w0;->e(Landroid/os/Bundle;Ljava/lang/String;IZ)V

    .line 322
    .line 323
    .line 324
    iget-object p0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzu:Ljava/lang/String;

    .line 325
    .line 326
    const-string v0, "max_ad_content_rating"

    .line 327
    .line 328
    invoke-static {p1, v0, p0}, Ll/b8w0;->c(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    :cond_b
    return-void

    .line 332
    :cond_c
    const/4 p0, 0x0

    .line 333
    throw p0
.end method
