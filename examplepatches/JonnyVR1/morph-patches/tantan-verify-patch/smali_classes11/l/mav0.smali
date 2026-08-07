.class public final Ll/mav0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fcs0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/l9v0;

.field public final d:Lcom/google/android/gms/internal/ads/zzcei;

.field public final e:Ljava/lang/String;

.field public final f:Ll/vcw0;

.field public final g:Ll/grw0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/fcs0;Ll/l9v0;Ljava/lang/String;Ll/vcw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mav0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mav0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mav0;->a:Ll/fcs0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mav0;->c:Ll/l9v0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/mav0;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Ll/mav0;->f:Ll/vcw0;

    .line 15
    .line 16
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/ebt0;->i()Ll/grw0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/mav0;->g:Ll/grw0;

    .line 25
    .line 26
    return-void
.end method

.method public static final c(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/ArrayList;)V
    .locals 9

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    move-wide v4, v1

    .line 9
    :goto_0
    if-ge v3, v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    check-cast v6, Lcom/google/android/gms/internal/ads/o0;

    .line 16
    .line 17
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/o0;->j0()I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v8, 0x2

    .line 22
    if-ne v7, v8, :cond_0

    .line 23
    .line 24
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/o0;->R()J

    .line 25
    .line 26
    .line 27
    move-result-wide v7

    .line 28
    cmp-long v7, v7, v4

    .line 29
    .line 30
    if-lez v7, :cond_0

    .line 31
    .line 32
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/o0;->R()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    cmp-long p1, v4, v1

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    new-instance p1, Landroid/content/ContentValues;

    .line 44
    .line 45
    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v0, "value"

    .line 49
    .line 50
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "offline_signal_statistics"

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    const-string v2, "statistic_name = \'last_successful_request_time\'"

    .line 61
    .line 62
    invoke-virtual {p0, v0, p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method


# virtual methods
.method public final synthetic a(ZLandroid/database/sqlite/SQLiteDatabase;)Ljava/lang/Void;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/mav0;->b:Landroid/content/Context;

    .line 4
    .line 5
    const-string p1, "OfflineUpload.db"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    sget-object p1, Ll/sgs0;->z8:Ll/dgs0;

    .line 13
    .line 14
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 v0, 0x2

    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz p1, :cond_5

    .line 32
    .line 33
    const-string p1, "oa_upload"

    .line 34
    .line 35
    invoke-static {p1}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p2, v2}, Ll/fav0;->a(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "oa_failed_reqs"

    .line 48
    .line 49
    invoke-virtual {p1, v4, v3}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 50
    .line 51
    .line 52
    invoke-static {p2, v1}, Ll/fav0;->a(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v3, "oa_total_reqs"

    .line 61
    .line 62
    invoke-virtual {p1, v3, v1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 70
    .line 71
    .line 72
    move-result-wide v3

    .line 73
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v3, "oa_upload_time"

    .line 78
    .line 79
    invoke-virtual {p1, v3, v1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 80
    .line 81
    .line 82
    invoke-static {p2, v0}, Ll/fav0;->b(Landroid/database/sqlite/SQLiteDatabase;I)J

    .line 83
    .line 84
    .line 85
    move-result-wide v3

    .line 86
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v3, "oa_last_successful_time"

    .line 91
    .line 92
    invoke-virtual {p1, v3, v1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/mav0;->g:Ll/grw0;

    .line 96
    .line 97
    invoke-interface {v1}, Ll/grw0;->f()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    const-string v3, ""

    .line 102
    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    move-object v1, v3

    .line 106
    goto :goto_0

    .line 107
    :cond_1
    iget-object v1, p0, Ll/mav0;->e:Ljava/lang/String;

    .line 108
    .line 109
    :goto_0
    const-string v4, "oa_session_id"

    .line 110
    .line 111
    invoke-virtual {p1, v4, v1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Ll/mav0;->f:Ll/vcw0;

    .line 115
    .line 116
    invoke-interface {v1, p1}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p2}, Ll/fav0;->c(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/ArrayList;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p2, p1}, Ll/mav0;->c(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/ArrayList;)V

    .line 124
    .line 125
    .line 126
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    :goto_1
    if-ge v2, v1, :cond_7

    .line 131
    .line 132
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    check-cast v5, Lcom/google/android/gms/internal/ads/o0;

    .line 137
    .line 138
    iget-object v6, p0, Ll/mav0;->g:Ll/grw0;

    .line 139
    .line 140
    const-string v7, "oa_signals"

    .line 141
    .line 142
    invoke-static {v7}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    invoke-interface {v6}, Ll/grw0;->f()Z

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    if-eqz v6, :cond_2

    .line 151
    .line 152
    move-object v6, v3

    .line 153
    goto :goto_2

    .line 154
    :cond_2
    iget-object v6, p0, Ll/mav0;->e:Ljava/lang/String;

    .line 155
    .line 156
    :goto_2
    invoke-virtual {v7, v4, v6}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->S()Lcom/google/android/gms/internal/ads/m0;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->P()Z

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    if-eqz v8, :cond_3

    .line 168
    .line 169
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->R()I

    .line 170
    .line 171
    .line 172
    move-result v8

    .line 173
    add-int/lit8 v8, v8, -0x1

    .line 174
    .line 175
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    goto :goto_3

    .line 180
    :cond_3
    const-string v8, "-1"

    .line 181
    .line 182
    :goto_3
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->X()Ljava/util/List;

    .line 183
    .line 184
    .line 185
    move-result-object v9

    .line 186
    sget-object v10, Ll/lav0;->a:Ll/lav0;

    .line 187
    .line 188
    invoke-static {v9, v10}, Lcom/google/android/gms/internal/ads/z2;->b(Ljava/util/List;Ll/eow0;)Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v9

    .line 196
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->R()J

    .line 197
    .line 198
    .line 199
    move-result-wide v10

    .line 200
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v10

    .line 204
    const-string v11, "oa_sig_ts"

    .line 205
    .line 206
    invoke-virtual {v7, v11, v10}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->j0()I

    .line 210
    .line 211
    .line 212
    move-result v10

    .line 213
    add-int/lit8 v10, v10, -0x1

    .line 214
    .line 215
    const-string v11, "oa_sig_status"

    .line 216
    .line 217
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v10

    .line 221
    invoke-virtual {v7, v11, v10}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->Q()J

    .line 225
    .line 226
    .line 227
    move-result-wide v10

    .line 228
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v10

    .line 232
    const-string v11, "oa_sig_resp_lat"

    .line 233
    .line 234
    invoke-virtual {v7, v11, v10}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->P()J

    .line 238
    .line 239
    .line 240
    move-result-wide v10

    .line 241
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v10

    .line 245
    const-string v11, "oa_sig_render_lat"

    .line 246
    .line 247
    invoke-virtual {v7, v11, v10}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 248
    .line 249
    .line 250
    const-string v10, "oa_sig_formats"

    .line 251
    .line 252
    invoke-virtual {v7, v10, v9}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 253
    .line 254
    .line 255
    const-string v9, "oa_sig_nw_type"

    .line 256
    .line 257
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->k0()I

    .line 261
    .line 262
    .line 263
    move-result v8

    .line 264
    add-int/lit8 v8, v8, -0x1

    .line 265
    .line 266
    const-string v9, "oa_sig_wifi"

    .line 267
    .line 268
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v8

    .line 272
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->g0()I

    .line 276
    .line 277
    .line 278
    move-result v8

    .line 279
    add-int/lit8 v8, v8, -0x1

    .line 280
    .line 281
    const-string v9, "oa_sig_airplane"

    .line 282
    .line 283
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v8

    .line 287
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->h0()I

    .line 291
    .line 292
    .line 293
    move-result v8

    .line 294
    add-int/lit8 v8, v8, -0x1

    .line 295
    .line 296
    const-string v9, "oa_sig_data"

    .line 297
    .line 298
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v8

    .line 302
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->O()I

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v8

    .line 313
    const-string v9, "oa_sig_nw_resp"

    .line 314
    .line 315
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->i0()I

    .line 319
    .line 320
    .line 321
    move-result v8

    .line 322
    add-int/lit8 v8, v8, -0x1

    .line 323
    .line 324
    const-string v9, "oa_sig_offline"

    .line 325
    .line 326
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v8

    .line 330
    invoke-virtual {v7, v9, v8}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 331
    .line 332
    .line 333
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/o0;->W()Lcom/google/android/gms/internal/ads/zzbec;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    invoke-virtual {v5}, Lcom/google/android/gms/internal/ads/zzbec;->zza()I

    .line 338
    .line 339
    .line 340
    move-result v5

    .line 341
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v5

    .line 345
    const-string v8, "oa_sig_nw_state"

    .line 346
    .line 347
    invoke-virtual {v7, v8, v5}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->O()Z

    .line 351
    .line 352
    .line 353
    move-result v5

    .line 354
    if-eqz v5, :cond_4

    .line 355
    .line 356
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->P()Z

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    if-eqz v5, :cond_4

    .line 361
    .line 362
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->R()I

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    if-ne v5, v0, :cond_4

    .line 367
    .line 368
    invoke-virtual {v6}, Lcom/google/android/gms/internal/ads/m0;->Q()I

    .line 369
    .line 370
    .line 371
    move-result v5

    .line 372
    add-int/lit8 v5, v5, -0x1

    .line 373
    .line 374
    const-string v6, "oa_sig_cell_type"

    .line 375
    .line 376
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    invoke-virtual {v7, v6, v5}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 381
    .line 382
    .line 383
    :cond_4
    iget-object v5, p0, Ll/mav0;->f:Ll/vcw0;

    .line 384
    .line 385
    invoke-interface {v5, v7}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 386
    .line 387
    .line 388
    add-int/lit8 v2, v2, 0x1

    .line 389
    .line 390
    goto/16 :goto_1

    .line 391
    .line 392
    :cond_5
    invoke-static {p2}, Ll/fav0;->c(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/ArrayList;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    iget-object v3, p0, Ll/mav0;->b:Landroid/content/Context;

    .line 397
    .line 398
    invoke-static {}, Lcom/google/android/gms/internal/ads/p0;->L()Ll/mes0;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v3

    .line 406
    invoke-virtual {v4, v3}, Ll/mes0;->r(Ljava/lang/String;)Ll/mes0;

    .line 407
    .line 408
    .line 409
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {v4, v3}, Ll/mes0;->t(Ljava/lang/String;)Ll/mes0;

    .line 412
    .line 413
    .line 414
    invoke-static {p2, v2}, Ll/fav0;->a(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 415
    .line 416
    .line 417
    move-result v3

    .line 418
    invoke-virtual {v4, v3}, Ll/mes0;->u(I)Ll/mes0;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v4, p1}, Ll/mes0;->q(Ljava/lang/Iterable;)Ll/mes0;

    .line 422
    .line 423
    .line 424
    invoke-static {p2, v1}, Ll/fav0;->a(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 425
    .line 426
    .line 427
    move-result v3

    .line 428
    invoke-virtual {v4, v3}, Ll/mes0;->w(I)Ll/mes0;

    .line 429
    .line 430
    .line 431
    const/4 v3, 0x3

    .line 432
    invoke-static {p2, v3}, Ll/fav0;->a(Landroid/database/sqlite/SQLiteDatabase;I)I

    .line 433
    .line 434
    .line 435
    move-result v3

    .line 436
    invoke-virtual {v4, v3}, Ll/mes0;->s(I)Ll/mes0;

    .line 437
    .line 438
    .line 439
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 440
    .line 441
    .line 442
    move-result-object v3

    .line 443
    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 444
    .line 445
    .line 446
    move-result-wide v5

    .line 447
    invoke-virtual {v4, v5, v6}, Ll/mes0;->x(J)Ll/mes0;

    .line 448
    .line 449
    .line 450
    invoke-static {p2, v0}, Ll/fav0;->b(Landroid/database/sqlite/SQLiteDatabase;I)J

    .line 451
    .line 452
    .line 453
    move-result-wide v5

    .line 454
    invoke-virtual {v4, v5, v6}, Ll/mes0;->v(J)Ll/mes0;

    .line 455
    .line 456
    .line 457
    invoke-virtual {v4}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 458
    .line 459
    .line 460
    move-result-object v3

    .line 461
    check-cast v3, Lcom/google/android/gms/internal/ads/p0;

    .line 462
    .line 463
    invoke-static {p2, p1}, Ll/mav0;->c(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/ArrayList;)V

    .line 464
    .line 465
    .line 466
    iget-object p1, p0, Ll/mav0;->a:Ll/fcs0;

    .line 467
    .line 468
    new-instance v4, Ll/jav0;

    .line 469
    .line 470
    invoke-direct {v4, v3}, Ll/jav0;-><init>(Lcom/google/android/gms/internal/ads/p0;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {p1, v4}, Ll/fcs0;->b(Ll/ecs0;)V

    .line 474
    .line 475
    .line 476
    iget-object p1, p0, Ll/mav0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 477
    .line 478
    invoke-static {}, Lcom/google/android/gms/internal/ads/v0;->L()Ll/bfs0;

    .line 479
    .line 480
    .line 481
    move-result-object v3

    .line 482
    iget p1, p1, Lcom/google/android/gms/internal/ads/zzcei;->zzb:I

    .line 483
    .line 484
    invoke-virtual {v3, p1}, Ll/bfs0;->q(I)Ll/bfs0;

    .line 485
    .line 486
    .line 487
    iget-object p1, p0, Ll/mav0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 488
    .line 489
    iget p1, p1, Lcom/google/android/gms/internal/ads/zzcei;->zzc:I

    .line 490
    .line 491
    invoke-virtual {v3, p1}, Ll/bfs0;->s(I)Ll/bfs0;

    .line 492
    .line 493
    .line 494
    iget-object p1, p0, Ll/mav0;->d:Lcom/google/android/gms/internal/ads/zzcei;

    .line 495
    .line 496
    iget-boolean p1, p1, Lcom/google/android/gms/internal/ads/zzcei;->zzd:Z

    .line 497
    .line 498
    if-eq v1, p1, :cond_6

    .line 499
    .line 500
    goto :goto_4

    .line 501
    :cond_6
    move v0, v2

    .line 502
    :goto_4
    invoke-virtual {v3, v0}, Ll/bfs0;->r(I)Ll/bfs0;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v3}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 506
    .line 507
    .line 508
    move-result-object p1

    .line 509
    check-cast p1, Lcom/google/android/gms/internal/ads/v0;

    .line 510
    .line 511
    iget-object v0, p0, Ll/mav0;->a:Ll/fcs0;

    .line 512
    .line 513
    new-instance v1, Ll/kav0;

    .line 514
    .line 515
    invoke-direct {v1, p1}, Ll/kav0;-><init>(Lcom/google/android/gms/internal/ads/v0;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v0, v1}, Ll/fcs0;->b(Ll/ecs0;)V

    .line 519
    .line 520
    .line 521
    iget-object p0, p0, Ll/mav0;->a:Ll/fcs0;

    .line 522
    .line 523
    const/16 p1, 0x2714

    .line 524
    .line 525
    invoke-virtual {p0, p1}, Ll/fcs0;->c(I)V

    .line 526
    .line 527
    .line 528
    :cond_7
    invoke-static {p2}, Ll/fav0;->f(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 529
    .line 530
    .line 531
    :goto_5
    const/4 p0, 0x0

    .line 532
    return-object p0
.end method

.method public final b(Z)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/mav0;->c:Ll/l9v0;

    .line 2
    .line 3
    new-instance v1, Ll/iav0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/iav0;-><init>(Ll/mav0;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/l9v0;->a(Ll/kbw0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "Error in offline signals database startup: "

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
