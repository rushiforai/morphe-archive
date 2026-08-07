.class public final Ll/sny0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dgy0;
.implements Ll/uny0;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1f
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/wny0;

.field public final c:Landroid/media/metrics/PlaybackSession;

.field public final d:J

.field public final e:Ll/wyt0;

.field public final f:Ll/hwt0;

.field public final g:Ljava/util/HashMap;

.field public final h:Ljava/util/HashMap;

.field public i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Landroid/media/metrics/PlaybackMetrics$Builder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:I

.field public l:I

.field public m:I

.field public n:Lcom/google/android/gms/internal/ads/zzce;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:Ll/qny0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Ll/qny0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:Ll/qny0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public t:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public u:Z

.field public v:Z

.field public w:I

.field public x:I

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/media/metrics/PlaybackSession;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/sny0;->a:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 11
    .line 12
    new-instance p1, Ll/wyt0;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/wyt0;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 18
    .line 19
    new-instance p1, Ll/hwt0;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/hwt0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/sny0;->f:Ll/hwt0;

    .line 25
    .line 26
    new-instance p1, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/sny0;->h:Ljava/util/HashMap;

    .line 32
    .line 33
    new-instance p1, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/sny0;->g:Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide p1

    .line 44
    iput-wide p1, p0, Ll/sny0;->d:J

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    iput p1, p0, Ll/sny0;->l:I

    .line 48
    .line 49
    iput p1, p0, Ll/sny0;->m:I

    .line 50
    .line 51
    new-instance p1, Ll/ony0;

    .line 52
    .line 53
    sget-object p2, Ll/ony0;->i:Ll/fpw0;

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ll/ony0;-><init>(Ll/fpw0;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/sny0;->b:Ll/wny0;

    .line 59
    .line 60
    invoke-interface {p1, p0}, Ll/wny0;->c(Ll/uny0;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static n(Landroid/content/Context;)Ll/sny0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "media_metrics"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/vxx;->a(Ljava/lang/Object;)Landroid/media/metrics/MediaMetricsManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance v1, Ll/sny0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wxx;->a(Landroid/media/metrics/MediaMetricsManager;)Landroid/media/metrics/PlaybackSession;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {v1, p0, v0}, Ll/sny0;-><init>(Landroid/content/Context;Landroid/media/metrics/PlaybackSession;)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method

.method public static r(I)I
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/mpw0;->x(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    packed-switch p0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    const/16 p0, 0x1b

    .line 9
    .line 10
    return p0

    .line 11
    :pswitch_0
    const/16 p0, 0x1a

    .line 12
    .line 13
    return p0

    .line 14
    :pswitch_1
    const/16 p0, 0x19

    .line 15
    .line 16
    return p0

    .line 17
    :pswitch_2
    const/16 p0, 0x1c

    .line 18
    .line 19
    return p0

    .line 20
    :pswitch_3
    const/16 p0, 0x18

    .line 21
    .line 22
    return p0

    :pswitch_data_0
    .packed-switch 0x1772
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final synthetic a(Ll/yfy0;Ll/sqr0;Ll/zwx0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic b(Ll/yfy0;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public final c(Ll/yfy0;Lcom/google/android/gms/internal/ads/zzce;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/sny0;->n:Lcom/google/android/gms/internal/ads/zzce;

    .line 2
    .line 3
    return-void
.end method

.method public final d(Ll/oot0;Ll/bgy0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bgy0;->b()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_11

    .line 12
    .line 13
    :cond_0
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    :goto_0
    invoke-virtual {v1}, Ll/bgy0;->b()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/16 v5, 0xb

    .line 20
    .line 21
    if-ge v3, v4, :cond_3

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ll/bgy0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {v1, v4}, Ll/bgy0;->c(I)Ll/yfy0;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    if-nez v4, :cond_1

    .line 32
    .line 33
    iget-object v4, v0, Ll/sny0;->b:Ll/wny0;

    .line 34
    .line 35
    invoke-interface {v4, v6}, Ll/wny0;->d(Ll/yfy0;)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object v7, v0, Ll/sny0;->b:Ll/wny0;

    .line 40
    .line 41
    if-ne v4, v5, :cond_2

    .line 42
    .line 43
    iget v4, v0, Ll/sny0;->k:I

    .line 44
    .line 45
    invoke-interface {v7, v6, v4}, Ll/wny0;->f(Ll/yfy0;I)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    invoke-interface {v7, v6}, Ll/wny0;->b(Ll/yfy0;)V

    .line 50
    .line 51
    .line 52
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    invoke-virtual {v1, v2}, Ll/bgy0;->d(I)Z

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-eqz v6, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ll/bgy0;->c(I)Ll/yfy0;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    iget-object v7, v0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 70
    .line 71
    if-eqz v7, :cond_4

    .line 72
    .line 73
    iget-object v7, v6, Ll/yfy0;->b:Ll/d0u0;

    .line 74
    .line 75
    iget-object v6, v6, Ll/yfy0;->d:Ll/kzy0;

    .line 76
    .line 77
    invoke-virtual {v0, v7, v6}, Ll/sny0;->v(Ll/d0u0;Ll/kzy0;)V

    .line 78
    .line 79
    .line 80
    :cond_4
    const/4 v6, 0x2

    .line 81
    invoke-virtual {v1, v6}, Ll/bgy0;->d(I)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    const/4 v9, 0x3

    .line 86
    const/4 v10, 0x0

    .line 87
    const/4 v11, 0x1

    .line 88
    if-eqz v7, :cond_c

    .line 89
    .line 90
    iget-object v7, v0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 91
    .line 92
    if-eqz v7, :cond_c

    .line 93
    .line 94
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzo()Ll/uhu0;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    invoke-virtual {v7}, Ll/uhu0;->a()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v12

    .line 106
    move v13, v2

    .line 107
    :goto_2
    if-ge v13, v12, :cond_7

    .line 108
    .line 109
    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v14

    .line 113
    check-cast v14, Ll/mgu0;

    .line 114
    .line 115
    move v15, v2

    .line 116
    :goto_3
    iget v5, v14, Ll/mgu0;->a:I

    .line 117
    .line 118
    add-int/lit8 v5, v13, 0x1

    .line 119
    .line 120
    if-gtz v15, :cond_6

    .line 121
    .line 122
    invoke-virtual {v14, v2}, Ll/mgu0;->d(I)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_5

    .line 127
    .line 128
    invoke-virtual {v14, v2}, Ll/mgu0;->b(I)Ll/sqr0;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    iget-object v5, v5, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 133
    .line 134
    if-eqz v5, :cond_5

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_5
    move v15, v11

    .line 138
    goto :goto_3

    .line 139
    :cond_6
    move v13, v5

    .line 140
    const/16 v5, 0xb

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_7
    move-object v5, v10

    .line 144
    :goto_4
    if-eqz v5, :cond_c

    .line 145
    .line 146
    iget-object v7, v0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 147
    .line 148
    sget v12, Ll/mpw0;->a:I

    .line 149
    .line 150
    move v12, v2

    .line 151
    :goto_5
    iget v13, v5, Lcom/google/android/gms/internal/ads/zzae;->zzb:I

    .line 152
    .line 153
    if-ge v12, v13, :cond_b

    .line 154
    .line 155
    invoke-virtual {v5, v12}, Lcom/google/android/gms/internal/ads/zzae;->a(I)Lcom/google/android/gms/internal/ads/zzad;

    .line 156
    .line 157
    .line 158
    move-result-object v13

    .line 159
    iget-object v13, v13, Lcom/google/android/gms/internal/ads/zzad;->zza:Ljava/util/UUID;

    .line 160
    .line 161
    sget-object v14, Ll/cly0;->d:Ljava/util/UUID;

    .line 162
    .line 163
    invoke-virtual {v13, v14}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v14

    .line 167
    if-eqz v14, :cond_8

    .line 168
    .line 169
    move v5, v9

    .line 170
    goto :goto_6

    .line 171
    :cond_8
    sget-object v14, Ll/cly0;->e:Ljava/util/UUID;

    .line 172
    .line 173
    invoke-virtual {v13, v14}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v14

    .line 177
    if-eqz v14, :cond_9

    .line 178
    .line 179
    move v5, v6

    .line 180
    goto :goto_6

    .line 181
    :cond_9
    sget-object v14, Ll/cly0;->c:Ljava/util/UUID;

    .line 182
    .line 183
    invoke-virtual {v13, v14}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v13

    .line 187
    if-eqz v13, :cond_a

    .line 188
    .line 189
    const/4 v5, 0x6

    .line 190
    goto :goto_6

    .line 191
    :cond_a
    add-int/lit8 v12, v12, 0x1

    .line 192
    .line 193
    goto :goto_5

    .line 194
    :cond_b
    move v5, v11

    .line 195
    :goto_6
    invoke-static {v7, v5}, Ll/cwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 196
    .line 197
    .line 198
    :cond_c
    const/16 v5, 0x3f3

    .line 199
    .line 200
    invoke-virtual {v1, v5}, Ll/bgy0;->d(I)Z

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-eqz v5, :cond_d

    .line 205
    .line 206
    iget v5, v0, Ll/sny0;->y:I

    .line 207
    .line 208
    add-int/2addr v5, v11

    .line 209
    iput v5, v0, Ll/sny0;->y:I

    .line 210
    .line 211
    :cond_d
    iget-object v5, v0, Ll/sny0;->n:Lcom/google/android/gms/internal/ads/zzce;

    .line 212
    .line 213
    const/16 v16, 0x9

    .line 214
    .line 215
    if-nez v5, :cond_e

    .line 216
    .line 217
    goto/16 :goto_d

    .line 218
    .line 219
    :cond_e
    iget-object v7, v0, Ll/sny0;->a:Landroid/content/Context;

    .line 220
    .line 221
    iget v8, v5, Lcom/google/android/gms/internal/ads/zzce;->zzb:I

    .line 222
    .line 223
    const/16 v12, 0x3e9

    .line 224
    .line 225
    if-ne v8, v12, :cond_10

    .line 226
    .line 227
    const/16 v7, 0x14

    .line 228
    .line 229
    :cond_f
    :goto_7
    move v8, v2

    .line 230
    goto/16 :goto_c

    .line 231
    .line 232
    :cond_10
    move-object v8, v5

    .line 233
    check-cast v8, Lcom/google/android/gms/internal/ads/zziz;

    .line 234
    .line 235
    iget v12, v8, Lcom/google/android/gms/internal/ads/zziz;->zze:I

    .line 236
    .line 237
    if-ne v12, v11, :cond_11

    .line 238
    .line 239
    move v12, v11

    .line 240
    goto :goto_8

    .line 241
    :cond_11
    move v12, v2

    .line 242
    :goto_8
    iget v8, v8, Lcom/google/android/gms/internal/ads/zziz;->zzi:I

    .line 243
    .line 244
    invoke-virtual {v5}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 245
    .line 246
    .line 247
    move-result-object v13

    .line 248
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 249
    .line 250
    .line 251
    instance-of v14, v13, Ljava/io/IOException;

    .line 252
    .line 253
    const/16 v15, 0x17

    .line 254
    .line 255
    if-eqz v14, :cond_25

    .line 256
    .line 257
    instance-of v8, v13, Lcom/google/android/gms/internal/ads/zzhr;

    .line 258
    .line 259
    if-eqz v8, :cond_12

    .line 260
    .line 261
    check-cast v13, Lcom/google/android/gms/internal/ads/zzhr;

    .line 262
    .line 263
    iget v7, v13, Lcom/google/android/gms/internal/ads/zzhr;->zzd:I

    .line 264
    .line 265
    move v8, v7

    .line 266
    const/4 v7, 0x5

    .line 267
    goto/16 :goto_c

    .line 268
    .line 269
    :cond_12
    instance-of v8, v13, Lcom/google/android/gms/internal/ads/zzhq;

    .line 270
    .line 271
    if-nez v8, :cond_13

    .line 272
    .line 273
    instance-of v8, v13, Lcom/google/android/gms/internal/ads/zzcc;

    .line 274
    .line 275
    if-eqz v8, :cond_14

    .line 276
    .line 277
    :cond_13
    move v8, v2

    .line 278
    const/16 v7, 0xb

    .line 279
    .line 280
    goto/16 :goto_c

    .line 281
    .line 282
    :cond_14
    instance-of v8, v13, Lcom/google/android/gms/internal/ads/zzhp;

    .line 283
    .line 284
    if-nez v8, :cond_20

    .line 285
    .line 286
    instance-of v12, v13, Lcom/google/android/gms/internal/ads/zzhz;

    .line 287
    .line 288
    if-eqz v12, :cond_15

    .line 289
    .line 290
    goto/16 :goto_b

    .line 291
    .line 292
    :cond_15
    iget v7, v5, Lcom/google/android/gms/internal/ads/zzce;->zzb:I

    .line 293
    .line 294
    const/16 v8, 0x3ea

    .line 295
    .line 296
    if-ne v7, v8, :cond_16

    .line 297
    .line 298
    const/16 v7, 0x15

    .line 299
    .line 300
    goto :goto_7

    .line 301
    :cond_16
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzrq;

    .line 302
    .line 303
    if-eqz v7, :cond_1d

    .line 304
    .line 305
    invoke-virtual {v13}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 306
    .line 307
    .line 308
    move-result-object v7

    .line 309
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 310
    .line 311
    .line 312
    sget v8, Ll/mpw0;->a:I

    .line 313
    .line 314
    instance-of v8, v7, Landroid/media/MediaDrm$MediaDrmStateException;

    .line 315
    .line 316
    if-eqz v8, :cond_17

    .line 317
    .line 318
    check-cast v7, Landroid/media/MediaDrm$MediaDrmStateException;

    .line 319
    .line 320
    invoke-virtual {v7}, Landroid/media/MediaDrm$MediaDrmStateException;->getDiagnosticInfo()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    invoke-static {v7}, Ll/mpw0;->y(Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    move-result v7

    .line 328
    invoke-static {v7}, Ll/sny0;->r(I)I

    .line 329
    .line 330
    .line 331
    move-result v8

    .line 332
    :goto_9
    move/from16 v17, v8

    .line 333
    .line 334
    move v8, v7

    .line 335
    move/from16 v7, v17

    .line 336
    .line 337
    goto/16 :goto_c

    .line 338
    .line 339
    :cond_17
    sget v8, Ll/mpw0;->a:I

    .line 340
    .line 341
    if-lt v8, v15, :cond_18

    .line 342
    .line 343
    instance-of v8, v7, Landroid/media/MediaDrmResetException;

    .line 344
    .line 345
    if-eqz v8, :cond_18

    .line 346
    .line 347
    const/16 v7, 0x1b

    .line 348
    .line 349
    goto :goto_7

    .line 350
    :cond_18
    instance-of v8, v7, Landroid/media/NotProvisionedException;

    .line 351
    .line 352
    if-eqz v8, :cond_19

    .line 353
    .line 354
    const/16 v7, 0x18

    .line 355
    .line 356
    goto :goto_7

    .line 357
    :cond_19
    instance-of v8, v7, Landroid/media/DeniedByServerException;

    .line 358
    .line 359
    if-eqz v8, :cond_1a

    .line 360
    .line 361
    const/16 v7, 0x1d

    .line 362
    .line 363
    goto/16 :goto_7

    .line 364
    .line 365
    :cond_1a
    instance-of v8, v7, Lcom/google/android/gms/internal/ads/zzsb;

    .line 366
    .line 367
    if-eqz v8, :cond_1b

    .line 368
    .line 369
    :goto_a
    move v8, v2

    .line 370
    move v7, v15

    .line 371
    goto/16 :goto_c

    .line 372
    .line 373
    :cond_1b
    instance-of v7, v7, Lcom/google/android/gms/internal/ads/zzro;

    .line 374
    .line 375
    if-eqz v7, :cond_1c

    .line 376
    .line 377
    const/16 v7, 0x1c

    .line 378
    .line 379
    goto/16 :goto_7

    .line 380
    .line 381
    :cond_1c
    const/16 v7, 0x1e

    .line 382
    .line 383
    goto/16 :goto_7

    .line 384
    .line 385
    :cond_1d
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzhl;

    .line 386
    .line 387
    if-eqz v7, :cond_1f

    .line 388
    .line 389
    invoke-virtual {v13}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 390
    .line 391
    .line 392
    move-result-object v7

    .line 393
    instance-of v7, v7, Ljava/io/FileNotFoundException;

    .line 394
    .line 395
    if-eqz v7, :cond_1f

    .line 396
    .line 397
    invoke-virtual {v13}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 398
    .line 399
    .line 400
    move-result-object v7

    .line 401
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 402
    .line 403
    .line 404
    invoke-virtual {v7}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 405
    .line 406
    .line 407
    move-result-object v7

    .line 408
    sget v8, Ll/mpw0;->a:I

    .line 409
    .line 410
    instance-of v8, v7, Landroid/system/ErrnoException;

    .line 411
    .line 412
    const/16 v12, 0x1f

    .line 413
    .line 414
    if-eqz v8, :cond_1e

    .line 415
    .line 416
    check-cast v7, Landroid/system/ErrnoException;

    .line 417
    .line 418
    iget v7, v7, Landroid/system/ErrnoException;->errno:I

    .line 419
    .line 420
    sget v8, Landroid/system/OsConstants;->EACCES:I

    .line 421
    .line 422
    if-ne v7, v8, :cond_1e

    .line 423
    .line 424
    const/16 v7, 0x20

    .line 425
    .line 426
    goto/16 :goto_7

    .line 427
    .line 428
    :cond_1e
    move v8, v2

    .line 429
    move v7, v12

    .line 430
    goto/16 :goto_c

    .line 431
    .line 432
    :cond_1f
    move v8, v2

    .line 433
    move/from16 v7, v16

    .line 434
    .line 435
    goto/16 :goto_c

    .line 436
    .line 437
    :cond_20
    :goto_b
    invoke-static {v7}, Lcom/google/android/gms/internal/ads/o1;->b(Landroid/content/Context;)Lcom/google/android/gms/internal/ads/o1;

    .line 438
    .line 439
    .line 440
    move-result-object v7

    .line 441
    invoke-virtual {v7}, Lcom/google/android/gms/internal/ads/o1;->a()I

    .line 442
    .line 443
    .line 444
    move-result v7

    .line 445
    if-ne v7, v11, :cond_21

    .line 446
    .line 447
    move v8, v2

    .line 448
    move v7, v9

    .line 449
    goto/16 :goto_c

    .line 450
    .line 451
    :cond_21
    invoke-virtual {v13}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 452
    .line 453
    .line 454
    move-result-object v7

    .line 455
    instance-of v12, v7, Ljava/net/UnknownHostException;

    .line 456
    .line 457
    if-eqz v12, :cond_22

    .line 458
    .line 459
    move v8, v2

    .line 460
    const/4 v7, 0x6

    .line 461
    goto/16 :goto_c

    .line 462
    .line 463
    :cond_22
    instance-of v7, v7, Ljava/net/SocketTimeoutException;

    .line 464
    .line 465
    if-eqz v7, :cond_23

    .line 466
    .line 467
    move v8, v2

    .line 468
    const/4 v7, 0x7

    .line 469
    goto/16 :goto_c

    .line 470
    .line 471
    :cond_23
    if-eqz v8, :cond_24

    .line 472
    .line 473
    check-cast v13, Lcom/google/android/gms/internal/ads/zzhp;

    .line 474
    .line 475
    iget v7, v13, Lcom/google/android/gms/internal/ads/zzhp;->zzc:I

    .line 476
    .line 477
    if-ne v7, v11, :cond_24

    .line 478
    .line 479
    move v8, v2

    .line 480
    const/4 v7, 0x4

    .line 481
    goto/16 :goto_c

    .line 482
    .line 483
    :cond_24
    move v8, v2

    .line 484
    const/16 v7, 0x8

    .line 485
    .line 486
    goto/16 :goto_c

    .line 487
    .line 488
    :cond_25
    if-eqz v12, :cond_26

    .line 489
    .line 490
    const/16 v7, 0x23

    .line 491
    .line 492
    if-eqz v8, :cond_f

    .line 493
    .line 494
    if-ne v8, v11, :cond_26

    .line 495
    .line 496
    goto/16 :goto_7

    .line 497
    .line 498
    :cond_26
    if-eqz v12, :cond_27

    .line 499
    .line 500
    if-ne v8, v9, :cond_27

    .line 501
    .line 502
    const/16 v7, 0xf

    .line 503
    .line 504
    goto/16 :goto_7

    .line 505
    .line 506
    :cond_27
    if-eqz v12, :cond_28

    .line 507
    .line 508
    if-ne v8, v6, :cond_28

    .line 509
    .line 510
    goto/16 :goto_a

    .line 511
    .line 512
    :cond_28
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzsx;

    .line 513
    .line 514
    if-eqz v7, :cond_29

    .line 515
    .line 516
    check-cast v13, Lcom/google/android/gms/internal/ads/zzsx;

    .line 517
    .line 518
    iget-object v7, v13, Lcom/google/android/gms/internal/ads/zzsx;->zzd:Ljava/lang/String;

    .line 519
    .line 520
    invoke-static {v7}, Ll/mpw0;->y(Ljava/lang/String;)I

    .line 521
    .line 522
    .line 523
    move-result v7

    .line 524
    move v8, v7

    .line 525
    const/16 v7, 0xd

    .line 526
    .line 527
    goto :goto_c

    .line 528
    :cond_29
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzst;

    .line 529
    .line 530
    const/16 v8, 0xe

    .line 531
    .line 532
    if-eqz v7, :cond_2a

    .line 533
    .line 534
    check-cast v13, Lcom/google/android/gms/internal/ads/zzst;

    .line 535
    .line 536
    iget-object v7, v13, Lcom/google/android/gms/internal/ads/zzst;->zzb:Ljava/lang/String;

    .line 537
    .line 538
    invoke-static {v7}, Ll/mpw0;->y(Ljava/lang/String;)I

    .line 539
    .line 540
    .line 541
    move-result v7

    .line 542
    goto/16 :goto_9

    .line 543
    .line 544
    :cond_2a
    instance-of v7, v13, Ljava/lang/OutOfMemoryError;

    .line 545
    .line 546
    if-eqz v7, :cond_2b

    .line 547
    .line 548
    move v7, v8

    .line 549
    goto/16 :goto_7

    .line 550
    .line 551
    :cond_2b
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzpx;

    .line 552
    .line 553
    if-eqz v7, :cond_2c

    .line 554
    .line 555
    check-cast v13, Lcom/google/android/gms/internal/ads/zzpx;

    .line 556
    .line 557
    iget v7, v13, Lcom/google/android/gms/internal/ads/zzpx;->zza:I

    .line 558
    .line 559
    const/16 v8, 0x11

    .line 560
    .line 561
    goto/16 :goto_9

    .line 562
    .line 563
    :cond_2c
    instance-of v7, v13, Lcom/google/android/gms/internal/ads/zzqa;

    .line 564
    .line 565
    if-eqz v7, :cond_2d

    .line 566
    .line 567
    check-cast v13, Lcom/google/android/gms/internal/ads/zzqa;

    .line 568
    .line 569
    iget v7, v13, Lcom/google/android/gms/internal/ads/zzqa;->zza:I

    .line 570
    .line 571
    const/16 v8, 0x12

    .line 572
    .line 573
    goto/16 :goto_9

    .line 574
    .line 575
    :cond_2d
    sget v7, Ll/mpw0;->a:I

    .line 576
    .line 577
    instance-of v7, v13, Landroid/media/MediaCodec$CryptoException;

    .line 578
    .line 579
    if-eqz v7, :cond_2e

    .line 580
    .line 581
    check-cast v13, Landroid/media/MediaCodec$CryptoException;

    .line 582
    .line 583
    invoke-virtual {v13}, Landroid/media/MediaCodec$CryptoException;->getErrorCode()I

    .line 584
    .line 585
    .line 586
    move-result v7

    .line 587
    invoke-static {v7}, Ll/sny0;->r(I)I

    .line 588
    .line 589
    .line 590
    move-result v8

    .line 591
    goto/16 :goto_9

    .line 592
    .line 593
    :cond_2e
    const/16 v7, 0x16

    .line 594
    .line 595
    goto/16 :goto_7

    .line 596
    .line 597
    :goto_c
    iget-object v12, v0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 598
    .line 599
    invoke-static {}, Ll/kwx;->a()Landroid/media/metrics/PlaybackErrorEvent$Builder;

    .line 600
    .line 601
    .line 602
    move-result-object v13

    .line 603
    iget-wide v14, v0, Ll/sny0;->d:J

    .line 604
    .line 605
    sub-long v14, v3, v14

    .line 606
    .line 607
    invoke-static {v13, v14, v15}, Ll/mwx;->a(Landroid/media/metrics/PlaybackErrorEvent$Builder;J)Landroid/media/metrics/PlaybackErrorEvent$Builder;

    .line 608
    .line 609
    .line 610
    move-result-object v13

    .line 611
    invoke-static {v13, v7}, Ll/nwx;->a(Landroid/media/metrics/PlaybackErrorEvent$Builder;I)Landroid/media/metrics/PlaybackErrorEvent$Builder;

    .line 612
    .line 613
    .line 614
    move-result-object v7

    .line 615
    invoke-static {v7, v8}, Ll/owx;->a(Landroid/media/metrics/PlaybackErrorEvent$Builder;I)Landroid/media/metrics/PlaybackErrorEvent$Builder;

    .line 616
    .line 617
    .line 618
    move-result-object v7

    .line 619
    invoke-static {v7, v5}, Ll/pwx;->a(Landroid/media/metrics/PlaybackErrorEvent$Builder;Ljava/lang/Exception;)Landroid/media/metrics/PlaybackErrorEvent$Builder;

    .line 620
    .line 621
    .line 622
    move-result-object v5

    .line 623
    invoke-static {v5}, Ll/qwx;->a(Landroid/media/metrics/PlaybackErrorEvent$Builder;)Landroid/media/metrics/PlaybackErrorEvent;

    .line 624
    .line 625
    .line 626
    move-result-object v5

    .line 627
    invoke-static {v12, v5}, Ll/rwx;->a(Landroid/media/metrics/PlaybackSession;Landroid/media/metrics/PlaybackErrorEvent;)V

    .line 628
    .line 629
    .line 630
    iput-boolean v11, v0, Ll/sny0;->z:Z

    .line 631
    .line 632
    iput-object v10, v0, Ll/sny0;->n:Lcom/google/android/gms/internal/ads/zzce;

    .line 633
    .line 634
    :goto_d
    invoke-virtual {v1, v6}, Ll/bgy0;->d(I)Z

    .line 635
    .line 636
    .line 637
    move-result v5

    .line 638
    if-eqz v5, :cond_32

    .line 639
    .line 640
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzo()Ll/uhu0;

    .line 641
    .line 642
    .line 643
    move-result-object v5

    .line 644
    invoke-virtual {v5, v6}, Ll/uhu0;->b(I)Z

    .line 645
    .line 646
    .line 647
    move-result v7

    .line 648
    invoke-virtual {v5, v11}, Ll/uhu0;->b(I)Z

    .line 649
    .line 650
    .line 651
    move-result v8

    .line 652
    invoke-virtual {v5, v9}, Ll/uhu0;->b(I)Z

    .line 653
    .line 654
    .line 655
    move-result v5

    .line 656
    if-nez v7, :cond_2f

    .line 657
    .line 658
    if-nez v8, :cond_2f

    .line 659
    .line 660
    if-eqz v5, :cond_32

    .line 661
    .line 662
    move v5, v11

    .line 663
    :cond_2f
    if-nez v7, :cond_30

    .line 664
    .line 665
    invoke-virtual {v0, v3, v4, v10, v2}, Ll/sny0;->w(JLl/sqr0;I)V

    .line 666
    .line 667
    .line 668
    :cond_30
    if-nez v8, :cond_31

    .line 669
    .line 670
    invoke-virtual {v0, v3, v4, v10, v2}, Ll/sny0;->t(JLl/sqr0;I)V

    .line 671
    .line 672
    .line 673
    :cond_31
    if-nez v5, :cond_32

    .line 674
    .line 675
    invoke-virtual {v0, v3, v4, v10, v2}, Ll/sny0;->u(JLl/sqr0;I)V

    .line 676
    .line 677
    .line 678
    :cond_32
    iget-object v5, v0, Ll/sny0;->o:Ll/qny0;

    .line 679
    .line 680
    invoke-virtual {v0, v5}, Ll/sny0;->y(Ll/qny0;)Z

    .line 681
    .line 682
    .line 683
    move-result v5

    .line 684
    if-eqz v5, :cond_33

    .line 685
    .line 686
    iget-object v5, v0, Ll/sny0;->o:Ll/qny0;

    .line 687
    .line 688
    iget-object v5, v5, Ll/qny0;->a:Ll/sqr0;

    .line 689
    .line 690
    iget v7, v5, Ll/sqr0;->r:I

    .line 691
    .line 692
    const/4 v8, -0x1

    .line 693
    if-eq v7, v8, :cond_33

    .line 694
    .line 695
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/sny0;->w(JLl/sqr0;I)V

    .line 696
    .line 697
    .line 698
    iput-object v10, v0, Ll/sny0;->o:Ll/qny0;

    .line 699
    .line 700
    :cond_33
    iget-object v5, v0, Ll/sny0;->p:Ll/qny0;

    .line 701
    .line 702
    invoke-virtual {v0, v5}, Ll/sny0;->y(Ll/qny0;)Z

    .line 703
    .line 704
    .line 705
    move-result v5

    .line 706
    if-eqz v5, :cond_34

    .line 707
    .line 708
    iget-object v5, v0, Ll/sny0;->p:Ll/qny0;

    .line 709
    .line 710
    iget-object v5, v5, Ll/qny0;->a:Ll/sqr0;

    .line 711
    .line 712
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/sny0;->t(JLl/sqr0;I)V

    .line 713
    .line 714
    .line 715
    iput-object v10, v0, Ll/sny0;->p:Ll/qny0;

    .line 716
    .line 717
    :cond_34
    iget-object v5, v0, Ll/sny0;->q:Ll/qny0;

    .line 718
    .line 719
    invoke-virtual {v0, v5}, Ll/sny0;->y(Ll/qny0;)Z

    .line 720
    .line 721
    .line 722
    move-result v5

    .line 723
    if-eqz v5, :cond_35

    .line 724
    .line 725
    iget-object v5, v0, Ll/sny0;->q:Ll/qny0;

    .line 726
    .line 727
    iget-object v5, v5, Ll/qny0;->a:Ll/sqr0;

    .line 728
    .line 729
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/sny0;->u(JLl/sqr0;I)V

    .line 730
    .line 731
    .line 732
    iput-object v10, v0, Ll/sny0;->q:Ll/qny0;

    .line 733
    .line 734
    :cond_35
    iget-object v5, v0, Ll/sny0;->a:Landroid/content/Context;

    .line 735
    .line 736
    invoke-static {v5}, Lcom/google/android/gms/internal/ads/o1;->b(Landroid/content/Context;)Lcom/google/android/gms/internal/ads/o1;

    .line 737
    .line 738
    .line 739
    move-result-object v5

    .line 740
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o1;->a()I

    .line 741
    .line 742
    .line 743
    move-result v5

    .line 744
    packed-switch v5, :pswitch_data_0

    .line 745
    .line 746
    .line 747
    :pswitch_0
    move v12, v11

    .line 748
    goto :goto_e

    .line 749
    :pswitch_1
    const/4 v12, 0x7

    .line 750
    goto :goto_e

    .line 751
    :pswitch_2
    const/16 v12, 0x8

    .line 752
    .line 753
    goto :goto_e

    .line 754
    :pswitch_3
    move v12, v9

    .line 755
    goto :goto_e

    .line 756
    :pswitch_4
    const/4 v12, 0x6

    .line 757
    goto :goto_e

    .line 758
    :pswitch_5
    const/4 v12, 0x5

    .line 759
    goto :goto_e

    .line 760
    :pswitch_6
    const/4 v12, 0x4

    .line 761
    goto :goto_e

    .line 762
    :pswitch_7
    move v12, v6

    .line 763
    goto :goto_e

    .line 764
    :pswitch_8
    move/from16 v12, v16

    .line 765
    .line 766
    goto :goto_e

    .line 767
    :pswitch_9
    move v12, v2

    .line 768
    :goto_e
    iget v5, v0, Ll/sny0;->m:I

    .line 769
    .line 770
    if-eq v12, v5, :cond_36

    .line 771
    .line 772
    iput v12, v0, Ll/sny0;->m:I

    .line 773
    .line 774
    iget-object v5, v0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 775
    .line 776
    invoke-static {}, Ll/gxx;->a()Landroid/media/metrics/NetworkEvent$Builder;

    .line 777
    .line 778
    .line 779
    move-result-object v7

    .line 780
    invoke-static {v7, v12}, Ll/kxx;->a(Landroid/media/metrics/NetworkEvent$Builder;I)Landroid/media/metrics/NetworkEvent$Builder;

    .line 781
    .line 782
    .line 783
    move-result-object v7

    .line 784
    iget-wide v12, v0, Ll/sny0;->d:J

    .line 785
    .line 786
    sub-long v12, v3, v12

    .line 787
    .line 788
    invoke-static {v7, v12, v13}, Ll/lxx;->a(Landroid/media/metrics/NetworkEvent$Builder;J)Landroid/media/metrics/NetworkEvent$Builder;

    .line 789
    .line 790
    .line 791
    move-result-object v7

    .line 792
    invoke-static {v7}, Ll/mxx;->a(Landroid/media/metrics/NetworkEvent$Builder;)Landroid/media/metrics/NetworkEvent;

    .line 793
    .line 794
    .line 795
    move-result-object v7

    .line 796
    invoke-static {v5, v7}, Ll/nxx;->a(Landroid/media/metrics/PlaybackSession;Landroid/media/metrics/NetworkEvent;)V

    .line 797
    .line 798
    .line 799
    :cond_36
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzf()I

    .line 800
    .line 801
    .line 802
    move-result v5

    .line 803
    if-eq v5, v6, :cond_37

    .line 804
    .line 805
    iput-boolean v2, v0, Ll/sny0;->u:Z

    .line 806
    .line 807
    :cond_37
    move-object/from16 v5, p1

    .line 808
    .line 809
    check-cast v5, Ll/mfy0;

    .line 810
    .line 811
    invoke-virtual {v5}, Ll/mfy0;->l()Lcom/google/android/gms/internal/ads/zziz;

    .line 812
    .line 813
    .line 814
    move-result-object v5

    .line 815
    const/16 v7, 0xa

    .line 816
    .line 817
    if-nez v5, :cond_38

    .line 818
    .line 819
    iput-boolean v2, v0, Ll/sny0;->v:Z

    .line 820
    .line 821
    goto :goto_f

    .line 822
    :cond_38
    invoke-virtual {v1, v7}, Ll/bgy0;->d(I)Z

    .line 823
    .line 824
    .line 825
    move-result v2

    .line 826
    if-eqz v2, :cond_39

    .line 827
    .line 828
    iput-boolean v11, v0, Ll/sny0;->v:Z

    .line 829
    .line 830
    :cond_39
    :goto_f
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzf()I

    .line 831
    .line 832
    .line 833
    move-result v2

    .line 834
    iget-boolean v5, v0, Ll/sny0;->u:Z

    .line 835
    .line 836
    if-eqz v5, :cond_3a

    .line 837
    .line 838
    const/4 v5, 0x5

    .line 839
    goto :goto_10

    .line 840
    :cond_3a
    iget-boolean v5, v0, Ll/sny0;->v:Z

    .line 841
    .line 842
    if-eqz v5, :cond_3b

    .line 843
    .line 844
    const/16 v5, 0xd

    .line 845
    .line 846
    goto :goto_10

    .line 847
    :cond_3b
    const/4 v5, 0x4

    .line 848
    if-ne v2, v5, :cond_3c

    .line 849
    .line 850
    const/16 v5, 0xb

    .line 851
    .line 852
    goto :goto_10

    .line 853
    :cond_3c
    if-ne v2, v6, :cond_41

    .line 854
    .line 855
    iget v2, v0, Ll/sny0;->l:I

    .line 856
    .line 857
    if-eqz v2, :cond_3d

    .line 858
    .line 859
    if-ne v2, v6, :cond_3e

    .line 860
    .line 861
    :cond_3d
    move v5, v6

    .line 862
    goto :goto_10

    .line 863
    :cond_3e
    invoke-interface/range {p1 .. p1}, Ll/oot0;->b()Z

    .line 864
    .line 865
    .line 866
    move-result v2

    .line 867
    if-nez v2, :cond_3f

    .line 868
    .line 869
    const/4 v5, 0x7

    .line 870
    goto :goto_10

    .line 871
    :cond_3f
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzg()I

    .line 872
    .line 873
    .line 874
    move-result v2

    .line 875
    if-eqz v2, :cond_40

    .line 876
    .line 877
    move v5, v7

    .line 878
    goto :goto_10

    .line 879
    :cond_40
    const/4 v5, 0x6

    .line 880
    goto :goto_10

    .line 881
    :cond_41
    if-ne v2, v9, :cond_44

    .line 882
    .line 883
    invoke-interface/range {p1 .. p1}, Ll/oot0;->b()Z

    .line 884
    .line 885
    .line 886
    move-result v2

    .line 887
    if-nez v2, :cond_42

    .line 888
    .line 889
    goto :goto_10

    .line 890
    :cond_42
    invoke-interface/range {p1 .. p1}, Ll/oot0;->zzg()I

    .line 891
    .line 892
    .line 893
    move-result v2

    .line 894
    if-eqz v2, :cond_43

    .line 895
    .line 896
    move/from16 v5, v16

    .line 897
    .line 898
    goto :goto_10

    .line 899
    :cond_43
    move v5, v9

    .line 900
    goto :goto_10

    .line 901
    :cond_44
    if-ne v2, v11, :cond_45

    .line 902
    .line 903
    iget v2, v0, Ll/sny0;->l:I

    .line 904
    .line 905
    if-eqz v2, :cond_45

    .line 906
    .line 907
    const/16 v5, 0xc

    .line 908
    .line 909
    goto :goto_10

    .line 910
    :cond_45
    iget v5, v0, Ll/sny0;->l:I

    .line 911
    .line 912
    :goto_10
    iget v2, v0, Ll/sny0;->l:I

    .line 913
    .line 914
    if-eq v2, v5, :cond_46

    .line 915
    .line 916
    iput v5, v0, Ll/sny0;->l:I

    .line 917
    .line 918
    iput-boolean v11, v0, Ll/sny0;->z:Z

    .line 919
    .line 920
    iget-object v2, v0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 921
    .line 922
    invoke-static {}, Ll/zvx;->a()Landroid/media/metrics/PlaybackStateEvent$Builder;

    .line 923
    .line 924
    .line 925
    move-result-object v5

    .line 926
    iget v6, v0, Ll/sny0;->l:I

    .line 927
    .line 928
    invoke-static {v5, v6}, Ll/xxx;->a(Landroid/media/metrics/PlaybackStateEvent$Builder;I)Landroid/media/metrics/PlaybackStateEvent$Builder;

    .line 929
    .line 930
    .line 931
    move-result-object v5

    .line 932
    iget-wide v6, v0, Ll/sny0;->d:J

    .line 933
    .line 934
    sub-long/2addr v3, v6

    .line 935
    invoke-static {v5, v3, v4}, Ll/yxx;->a(Landroid/media/metrics/PlaybackStateEvent$Builder;J)Landroid/media/metrics/PlaybackStateEvent$Builder;

    .line 936
    .line 937
    .line 938
    move-result-object v3

    .line 939
    invoke-static {v3}, Ll/zxx;->a(Landroid/media/metrics/PlaybackStateEvent$Builder;)Landroid/media/metrics/PlaybackStateEvent;

    .line 940
    .line 941
    .line 942
    move-result-object v3

    .line 943
    invoke-static {v2, v3}, Ll/awx;->a(Landroid/media/metrics/PlaybackSession;Landroid/media/metrics/PlaybackStateEvent;)V

    .line 944
    .line 945
    .line 946
    :cond_46
    const/16 v2, 0x404

    .line 947
    .line 948
    invoke-virtual {v1, v2}, Ll/bgy0;->d(I)Z

    .line 949
    .line 950
    .line 951
    move-result v3

    .line 952
    if-eqz v3, :cond_47

    .line 953
    .line 954
    iget-object v0, v0, Ll/sny0;->b:Ll/wny0;

    .line 955
    .line 956
    invoke-virtual {v1, v2}, Ll/bgy0;->c(I)Ll/yfy0;

    .line 957
    .line 958
    .line 959
    move-result-object v1

    .line 960
    invoke-interface {v0, v1}, Ll/wny0;->a(Ll/yfy0;)V

    .line 961
    .line 962
    .line 963
    :cond_47
    :goto_11
    return-void

    .line 964
    nop

    .line 965
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final e(Ll/yfy0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Ll/yfy0;Ll/gzy0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p2, Ll/gzy0;->b:Ll/sqr0;

    .line 7
    .line 8
    new-instance v2, Ll/qny0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iget-object v3, p0, Ll/sny0;->b:Ll/wny0;

    .line 14
    .line 15
    iget-object p1, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 16
    .line 17
    invoke-interface {v3, p1, v0}, Ll/wny0;->e(Ll/d0u0;Ll/kzy0;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {v2, v1, v0, p1}, Ll/qny0;-><init>(Ll/sqr0;ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget p1, p2, Ll/gzy0;->a:I

    .line 26
    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    if-eq p1, p2, :cond_2

    .line 31
    .line 32
    const/4 p2, 0x2

    .line 33
    if-eq p1, p2, :cond_3

    .line 34
    .line 35
    const/4 p2, 0x3

    .line 36
    if-eq p1, p2, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    iput-object v2, p0, Ll/sny0;->q:Ll/qny0;

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    iput-object v2, p0, Ll/sny0;->p:Ll/qny0;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    iput-object v2, p0, Ll/sny0;->o:Ll/qny0;

    .line 46
    .line 47
    return-void
.end method

.method public final synthetic g(Ll/yfy0;Ll/sqr0;Ll/zwx0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final h(Ll/yfy0;IJJ)V
    .locals 5

    .line 1
    iget-object p5, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 2
    .line 3
    if-eqz p5, :cond_2

    .line 4
    .line 5
    iget-object p6, p0, Ll/sny0;->b:Ll/wny0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 8
    .line 9
    iget-object v0, p0, Ll/sny0;->h:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-interface {p6, p1, p5}, Ll/wny0;->e(Ll/d0u0;Ll/kzy0;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p5

    .line 19
    check-cast p5, Ljava/lang/Long;

    .line 20
    .line 21
    iget-object p6, p0, Ll/sny0;->g:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {p6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p6

    .line 27
    check-cast p6, Ljava/lang/Long;

    .line 28
    .line 29
    iget-object v0, p0, Ll/sny0;->h:Ljava/util/HashMap;

    .line 30
    .line 31
    const-wide/16 v1, 0x0

    .line 32
    .line 33
    if-nez p5, :cond_0

    .line 34
    .line 35
    move-wide v3, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    :goto_0
    add-long/2addr v3, p3

    .line 42
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/sny0;->g:Ljava/util/HashMap;

    .line 50
    .line 51
    if-nez p6, :cond_1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    invoke-virtual {p6}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v1

    .line 58
    :goto_1
    int-to-long p2, p2

    .line 59
    add-long/2addr v1, p2

    .line 60
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public final i(Ll/yfy0;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/kzy0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Ll/sny0;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/sny0;->s()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p1, p0, Ll/sny0;->g:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/sny0;->h:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic j(Ll/yfy0;IJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k(Ll/yfy0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kzy0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/sny0;->s()V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Ll/sny0;->i:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Ll/rxx;->a()Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v0, "AndroidXMedia3"

    .line 22
    .line 23
    invoke-static {p2, v0}, Ll/oxx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;Ljava/lang/String;)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "1.2.1"

    .line 28
    .line 29
    invoke-static {p2, v0}, Ll/pxx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;Ljava/lang/String;)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iput-object p2, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 34
    .line 35
    iget-object p2, p1, Ll/yfy0;->b:Ll/d0u0;

    .line 36
    .line 37
    iget-object p1, p1, Ll/yfy0;->d:Ll/kzy0;

    .line 38
    .line 39
    invoke-virtual {p0, p2, p1}, Ll/sny0;->v(Ll/d0u0;Ll/kzy0;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final l()Landroid/media/metrics/LogSessionId;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 2
    .line 3
    invoke-static {p0}, Ll/qxx;->a(Landroid/media/metrics/PlaybackSession;)Landroid/media/metrics/LogSessionId;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final m(Ll/yfy0;Ll/gnt0;Ll/gnt0;I)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    if-ne p4, p1, :cond_0

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/sny0;->u:Z

    .line 5
    .line 6
    move p4, p1

    .line 7
    :cond_0
    iput p4, p0, Ll/sny0;->k:I

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o(Ll/yfy0;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final p(Ll/yfy0;Ll/vwx0;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/sny0;->w:I

    .line 2
    .line 3
    iget v0, p2, Ll/vwx0;->g:I

    .line 4
    .line 5
    add-int/2addr p1, v0

    .line 6
    iput p1, p0, Ll/sny0;->w:I

    .line 7
    .line 8
    iget p1, p0, Ll/sny0;->x:I

    .line 9
    .line 10
    iget p2, p2, Ll/vwx0;->e:I

    .line 11
    .line 12
    add-int/2addr p1, p2

    .line 13
    iput p1, p0, Ll/sny0;->x:I

    .line 14
    .line 15
    return-void
.end method

.method public final q(Ll/yfy0;Ll/aou0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/sny0;->o:Ll/qny0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/qny0;->a:Ll/sqr0;

    .line 6
    .line 7
    iget v1, v0, Ll/sqr0;->r:I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sqr0;->b()Ll/znr0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v1, p2, Ll/aou0;->a:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/znr0;->C(I)Ll/znr0;

    .line 19
    .line 20
    .line 21
    iget p2, p2, Ll/aou0;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ll/znr0;->i(I)Ll/znr0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object p1, p1, Ll/qny0;->c:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v0, Ll/qny0;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-direct {v0, p2, v1, p1}, Ll/qny0;-><init>(Ll/sqr0;ILjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/sny0;->o:Ll/qny0;

    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final s()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-boolean v2, p0, Ll/sny0;->z:Z

    .line 7
    .line 8
    if-eqz v2, :cond_3

    .line 9
    .line 10
    iget v2, p0, Ll/sny0;->y:I

    .line 11
    .line 12
    invoke-static {v0, v2}, Ll/dwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 16
    .line 17
    iget v2, p0, Ll/sny0;->w:I

    .line 18
    .line 19
    invoke-static {v0, v2}, Ll/ewx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 23
    .line 24
    iget v2, p0, Ll/sny0;->x:I

    .line 25
    .line 26
    invoke-static {v0, v2}, Ll/fwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/sny0;->g:Ljava/util/HashMap;

    .line 30
    .line 31
    iget-object v2, p0, Ll/sny0;->i:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Long;

    .line 38
    .line 39
    iget-object v2, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 40
    .line 41
    const-wide/16 v3, 0x0

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    move-wide v5, v3

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 48
    .line 49
    .line 50
    move-result-wide v5

    .line 51
    :goto_0
    invoke-static {v2, v5, v6}, Ll/gwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;J)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/sny0;->h:Ljava/util/HashMap;

    .line 55
    .line 56
    iget-object v2, p0, Ll/sny0;->i:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ljava/lang/Long;

    .line 63
    .line 64
    iget-object v2, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 65
    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    move-wide v5, v3

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 71
    .line 72
    .line 73
    move-result-wide v5

    .line 74
    :goto_1
    invoke-static {v2, v5, v6}, Ll/hwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;J)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide v5

    .line 85
    cmp-long v0, v5, v3

    .line 86
    .line 87
    if-lez v0, :cond_2

    .line 88
    .line 89
    const/4 v0, 0x1

    .line 90
    goto :goto_2

    .line 91
    :cond_2
    move v0, v1

    .line 92
    :goto_2
    invoke-static {v2, v0}, Ll/iwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 96
    .line 97
    iget-object v2, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 98
    .line 99
    invoke-static {v2}, Ll/jwx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;)Landroid/media/metrics/PlaybackMetrics;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v0, v2}, Ll/lwx;->a(Landroid/media/metrics/PlaybackSession;Landroid/media/metrics/PlaybackMetrics;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 108
    .line 109
    iput-object v0, p0, Ll/sny0;->i:Ljava/lang/String;

    .line 110
    .line 111
    iput v1, p0, Ll/sny0;->y:I

    .line 112
    .line 113
    iput v1, p0, Ll/sny0;->w:I

    .line 114
    .line 115
    iput v1, p0, Ll/sny0;->x:I

    .line 116
    .line 117
    iput-object v0, p0, Ll/sny0;->r:Ll/sqr0;

    .line 118
    .line 119
    iput-object v0, p0, Ll/sny0;->s:Ll/sqr0;

    .line 120
    .line 121
    iput-object v0, p0, Ll/sny0;->t:Ll/sqr0;

    .line 122
    .line 123
    iput-boolean v1, p0, Ll/sny0;->z:Z

    .line 124
    .line 125
    return-void
.end method

.method public final t(JLl/sqr0;I)V
    .locals 6
    .param p3    # Ll/sqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p4, p0, Ll/sny0;->s:Ll/sqr0;

    .line 2
    .line 3
    invoke-static {p4, p3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p4, p0, Ll/sny0;->s:Ll/sqr0;

    .line 11
    .line 12
    if-nez p4, :cond_1

    .line 13
    .line 14
    const/4 p4, 0x1

    .line 15
    :goto_0
    move v5, p4

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/4 p4, 0x0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    iput-object p3, p0, Ll/sny0;->s:Ll/sqr0;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    move-object v0, p0

    .line 23
    move-wide v2, p1

    .line 24
    move-object v4, p3

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/sny0;->x(IJLl/sqr0;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final u(JLl/sqr0;I)V
    .locals 6
    .param p3    # Ll/sqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p4, p0, Ll/sny0;->t:Ll/sqr0;

    .line 2
    .line 3
    invoke-static {p4, p3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p4, p0, Ll/sny0;->t:Ll/sqr0;

    .line 11
    .line 12
    if-nez p4, :cond_1

    .line 13
    .line 14
    const/4 p4, 0x1

    .line 15
    :goto_0
    move v5, p4

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/4 p4, 0x0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    iput-object p3, p0, Ll/sny0;->t:Ll/sqr0;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    move-object v0, p0

    .line 23
    move-wide v2, p1

    .line 24
    move-object v4, p3

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/sny0;->x(IJLl/sqr0;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final v(Ll/d0u0;Ll/kzy0;)V
    .locals 6
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "metricsBuilder"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sny0;->j:Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    iget-object p2, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 v1, -0x1

    .line 14
    if-eq p2, v1, :cond_7

    .line 15
    .line 16
    iget-object v1, p0, Ll/sny0;->f:Ll/hwt0;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p1, p2, v1, v2}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/sny0;->f:Ll/hwt0;

    .line 23
    .line 24
    iget-object v1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 25
    .line 26
    iget p2, p2, Ll/hwt0;->c:I

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    invoke-virtual {p1, p2, v1, v3, v4}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 34
    .line 35
    iget-object p1, p1, Ll/wyt0;->c:Ll/trs0;

    .line 36
    .line 37
    iget-object p1, p1, Ll/trs0;->b:Ll/zis0;

    .line 38
    .line 39
    const/4 p2, 0x2

    .line 40
    const/4 v1, 0x1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object p1, p1, Ll/zis0;->a:Landroid/net/Uri;

    .line 45
    .line 46
    invoke-static {p1}, Ll/mpw0;->B(Landroid/net/Uri;)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    if-eq p1, v1, :cond_3

    .line 53
    .line 54
    if-eq p1, p2, :cond_2

    .line 55
    .line 56
    move v2, v1

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v2, 0x4

    .line 59
    goto :goto_0

    .line 60
    :cond_3
    const/4 v2, 0x5

    .line 61
    goto :goto_0

    .line 62
    :cond_4
    const/4 v2, 0x3

    .line 63
    :goto_0
    invoke-static {v0, v2}, Ll/sxx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 67
    .line 68
    iget-wide v2, p1, Ll/wyt0;->m:J

    .line 69
    .line 70
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    cmp-long v2, v2, v4

    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    iget-boolean v2, p1, Ll/wyt0;->k:Z

    .line 80
    .line 81
    if-nez v2, :cond_5

    .line 82
    .line 83
    iget-boolean v2, p1, Ll/wyt0;->h:Z

    .line 84
    .line 85
    if-nez v2, :cond_5

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/wyt0;->b()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_5

    .line 92
    .line 93
    iget-object p1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 94
    .line 95
    iget-wide v2, p1, Ll/wyt0;->m:J

    .line 96
    .line 97
    invoke-static {v2, v3}, Ll/mpw0;->I(J)J

    .line 98
    .line 99
    .line 100
    move-result-wide v2

    .line 101
    invoke-static {v0, v2, v3}, Ll/txx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;J)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 102
    .line 103
    .line 104
    :cond_5
    iget-object p1, p0, Ll/sny0;->e:Ll/wyt0;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/wyt0;->b()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eq v1, p1, :cond_6

    .line 111
    .line 112
    move p2, v1

    .line 113
    :cond_6
    invoke-static {v0, p2}, Ll/uxx;->a(Landroid/media/metrics/PlaybackMetrics$Builder;I)Landroid/media/metrics/PlaybackMetrics$Builder;

    .line 114
    .line 115
    .line 116
    iput-boolean v1, p0, Ll/sny0;->z:Z

    .line 117
    .line 118
    :cond_7
    :goto_1
    return-void
.end method

.method public final w(JLl/sqr0;I)V
    .locals 6
    .param p3    # Ll/sqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p4, p0, Ll/sny0;->r:Ll/sqr0;

    .line 2
    .line 3
    invoke-static {p4, p3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p4, p0, Ll/sny0;->r:Ll/sqr0;

    .line 11
    .line 12
    if-nez p4, :cond_1

    .line 13
    .line 14
    const/4 p4, 0x1

    .line 15
    :goto_0
    move v5, p4

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/4 p4, 0x0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    iput-object p3, p0, Ll/sny0;->r:Ll/sqr0;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    move-object v0, p0

    .line 23
    move-wide v2, p1

    .line 24
    move-object v4, p3

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/sny0;->x(IJLl/sqr0;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final x(IJLl/sqr0;I)V
    .locals 3
    .param p4    # Ll/sqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/vwx;->a(I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-wide v0, p0, Ll/sny0;->d:J

    .line 6
    .line 7
    sub-long/2addr p2, v0

    .line 8
    invoke-static {p1, p2, p3}, Ll/swx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;J)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 p2, 0x0

    .line 13
    const/4 p3, 0x1

    .line 14
    if-eqz p4, :cond_b

    .line 15
    .line 16
    invoke-static {p1, p3}, Ll/ywx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-eq p5, p3, :cond_0

    .line 21
    .line 22
    move p5, p3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move p5, v0

    .line 25
    :goto_0
    invoke-static {p1, p5}, Ll/bxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 26
    .line 27
    .line 28
    iget-object p5, p4, Ll/sqr0;->k:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p5, :cond_1

    .line 31
    .line 32
    invoke-static {p1, p5}, Ll/cxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;Ljava/lang/String;)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p5, p4, Ll/sqr0;->l:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p5, :cond_2

    .line 38
    .line 39
    invoke-static {p1, p5}, Ll/dxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;Ljava/lang/String;)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p5, p4, Ll/sqr0;->i:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz p5, :cond_3

    .line 45
    .line 46
    invoke-static {p1, p5}, Ll/exx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;Ljava/lang/String;)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 47
    .line 48
    .line 49
    :cond_3
    iget p5, p4, Ll/sqr0;->h:I

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    if-eq p5, v1, :cond_4

    .line 53
    .line 54
    invoke-static {p1, p5}, Ll/fxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 55
    .line 56
    .line 57
    :cond_4
    iget p5, p4, Ll/sqr0;->q:I

    .line 58
    .line 59
    if-eq p5, v1, :cond_5

    .line 60
    .line 61
    invoke-static {p1, p5}, Ll/hxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 62
    .line 63
    .line 64
    :cond_5
    iget p5, p4, Ll/sqr0;->r:I

    .line 65
    .line 66
    if-eq p5, v1, :cond_6

    .line 67
    .line 68
    invoke-static {p1, p5}, Ll/ixx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 69
    .line 70
    .line 71
    :cond_6
    iget p5, p4, Ll/sqr0;->y:I

    .line 72
    .line 73
    if-eq p5, v1, :cond_7

    .line 74
    .line 75
    invoke-static {p1, p5}, Ll/jxx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 76
    .line 77
    .line 78
    :cond_7
    iget p5, p4, Ll/sqr0;->z:I

    .line 79
    .line 80
    if-eq p5, v1, :cond_8

    .line 81
    .line 82
    invoke-static {p1, p5}, Ll/twx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 83
    .line 84
    .line 85
    :cond_8
    iget-object p5, p4, Ll/sqr0;->c:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p5, :cond_a

    .line 88
    .line 89
    sget v2, Ll/mpw0;->a:I

    .line 90
    .line 91
    const-string v2, "-"

    .line 92
    .line 93
    invoke-virtual {p5, v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p5

    .line 97
    aget-object p2, p5, p2

    .line 98
    .line 99
    array-length v1, p5

    .line 100
    if-lt v1, v0, :cond_9

    .line 101
    .line 102
    aget-object p5, p5, p3

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_9
    const/4 p5, 0x0

    .line 106
    :goto_1
    invoke-static {p2, p5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    iget-object p5, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast p5, Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p1, p5}, Ll/uwx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;Ljava/lang/String;)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 115
    .line 116
    .line 117
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 118
    .line 119
    if-eqz p2, :cond_a

    .line 120
    .line 121
    check-cast p2, Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p1, p2}, Ll/wwx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;Ljava/lang/String;)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 124
    .line 125
    .line 126
    :cond_a
    iget p2, p4, Ll/sqr0;->s:F

    .line 127
    .line 128
    const/high16 p4, -0x40800000    # -1.0f

    .line 129
    .line 130
    cmpl-float p4, p2, p4

    .line 131
    .line 132
    if-eqz p4, :cond_c

    .line 133
    .line 134
    invoke-static {p1, p2}, Ll/xwx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;F)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_b
    invoke-static {p1, p2}, Ll/ywx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;I)Landroid/media/metrics/TrackChangeEvent$Builder;

    .line 139
    .line 140
    .line 141
    :cond_c
    :goto_2
    iput-boolean p3, p0, Ll/sny0;->z:Z

    .line 142
    .line 143
    iget-object p0, p0, Ll/sny0;->c:Landroid/media/metrics/PlaybackSession;

    .line 144
    .line 145
    invoke-static {p1}, Ll/zwx;->a(Landroid/media/metrics/TrackChangeEvent$Builder;)Landroid/media/metrics/TrackChangeEvent;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {p0, p1}, Ll/axx;->a(Landroid/media/metrics/PlaybackSession;Landroid/media/metrics/TrackChangeEvent;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final y(Ll/qny0;)Z
    .locals 0
    .param p1    # Ll/qny0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "#1"
        }
        result = true
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/sny0;->b:Ll/wny0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/qny0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/wny0;->zze()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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
