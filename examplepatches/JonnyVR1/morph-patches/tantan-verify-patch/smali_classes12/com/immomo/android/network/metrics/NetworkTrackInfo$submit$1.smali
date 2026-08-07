.class final Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkTrackInfo;->Y(Ll/ry3;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic $call:Ll/ry3;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/NetworkTrackInfo;Ll/ry3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->$call:Ll/ry3;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 718
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/android/network/metrics/StrategyFetcher;->INSTANCE:Lcom/immomo/android/network/metrics/StrategyFetcher;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/StrategyFetcher;->e()Ljava/util/concurrent/atomic/AtomicReference;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/immomo/android/network/metrics/Strategy;

    .line 14
    .line 15
    iget-object v2, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const/4 v3, 0x1

    .line 22
    const-string v4, "momo_net_metrics"

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/x1d0;->k()Ll/rnl;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/rnl;->C()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-ne v2, v3, :cond_0

    .line 43
    .line 44
    goto/16 :goto_8

    .line 45
    .line 46
    :cond_0
    iget-object v2, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-eqz v2, :cond_c

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/x1d0;->k()Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-eqz v2, :cond_c

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/rnl;->m()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-eqz v2, :cond_c

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/Strategy;->o(Ljava/lang/String;)Lkotlin/Pair;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-nez v5, :cond_1

    .line 81
    .line 82
    goto/16 :goto_8

    .line 83
    .line 84
    :cond_1
    sget-object v5, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 85
    .line 86
    invoke-virtual {v5}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->d()Ll/vv5;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-static {v6}, Ll/ok20;->b(Ll/vv5;)Ljava/util/Map;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    .line 98
    .line 99
    const-string v8, "os_ver"

    .line 100
    .line 101
    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    sget-object v7, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->Companion:Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;

    .line 105
    .line 106
    iget-object v8, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 107
    .line 108
    invoke-virtual {v8}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u()Ljava/lang/Throwable;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    invoke-virtual {v7, v8}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;->c(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    const-string v9, "err"

    .line 117
    .line 118
    invoke-interface {v6, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    iget-object v8, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 122
    .line 123
    invoke-virtual {v8}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u()Ljava/lang/Throwable;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    invoke-virtual {v7, v8}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    const-string v9, "err_code"

    .line 132
    .line 133
    invoke-interface {v6, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    iget-object v8, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 137
    .line 138
    invoke-virtual {v8}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->r()J

    .line 139
    .line 140
    .line 141
    move-result-wide v8

    .line 142
    iget-object v10, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 143
    .line 144
    invoke-virtual {v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->m()J

    .line 145
    .line 146
    .line 147
    move-result-wide v10

    .line 148
    sub-long/2addr v8, v10

    .line 149
    const-wide/16 v10, 0x0

    .line 150
    .line 151
    invoke-static {v8, v9, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 152
    .line 153
    .line 154
    move-result-wide v8

    .line 155
    iget-object v12, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 156
    .line 157
    invoke-virtual {v12}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->l()J

    .line 158
    .line 159
    .line 160
    move-result-wide v12

    .line 161
    iget-object v14, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 162
    .line 163
    invoke-virtual {v14}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->i()J

    .line 164
    .line 165
    .line 166
    move-result-wide v14

    .line 167
    sub-long/2addr v12, v14

    .line 168
    invoke-static {v12, v13, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 169
    .line 170
    .line 171
    move-result-wide v12

    .line 172
    iget-object v14, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 173
    .line 174
    invoke-virtual {v14}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->s()J

    .line 175
    .line 176
    .line 177
    move-result-wide v14

    .line 178
    iget-object v3, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 179
    .line 180
    invoke-virtual {v3}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->t()J

    .line 181
    .line 182
    .line 183
    move-result-wide v17

    .line 184
    sub-long v14, v14, v17

    .line 185
    .line 186
    invoke-static {v14, v15, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 187
    .line 188
    .line 189
    move-result-wide v14

    .line 190
    iget-object v3, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 191
    .line 192
    invoke-virtual {v3}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->f()J

    .line 193
    .line 194
    .line 195
    move-result-wide v17

    .line 196
    iget-object v3, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 197
    .line 198
    invoke-virtual {v3}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->g()J

    .line 199
    .line 200
    .line 201
    move-result-wide v19

    .line 202
    move-object v3, v1

    .line 203
    move-object/from16 v21, v2

    .line 204
    .line 205
    sub-long v1, v17, v19

    .line 206
    .line 207
    invoke-static {v1, v2, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 208
    .line 209
    .line 210
    move-result-wide v1

    .line 211
    iget-object v10, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 212
    .line 213
    invoke-virtual {v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->h()J

    .line 214
    .line 215
    .line 216
    move-result-wide v10

    .line 217
    move-wide/from16 v19, v1

    .line 218
    .line 219
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->i()J

    .line 222
    .line 223
    .line 224
    move-result-wide v1

    .line 225
    sub-long/2addr v10, v1

    .line 226
    const-wide/16 v1, 0x0

    .line 227
    .line 228
    invoke-static {v10, v11, v1, v2}, Lkotlin/ranges/a;->c(JJ)J

    .line 229
    .line 230
    .line 231
    move-result-wide v10

    .line 232
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->n()J

    .line 235
    .line 236
    .line 237
    move-result-wide v1

    .line 238
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    const-string v2, "ts"

    .line 243
    .line 244
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    const-string v1, "t_conn_acquired"

    .line 248
    .line 249
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    const-string v1, "t_all"

    .line 257
    .line 258
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 266
    .line 267
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->j()J

    .line 268
    .line 269
    .line 270
    move-result-wide v1

    .line 271
    iget-object v10, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 272
    .line 273
    invoke-virtual {v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->k()J

    .line 274
    .line 275
    .line 276
    move-result-wide v10

    .line 277
    sub-long/2addr v1, v10

    .line 278
    const-wide/16 v10, 0x0

    .line 279
    .line 280
    invoke-static {v1, v2, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 281
    .line 282
    .line 283
    move-result-wide v1

    .line 284
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    const-string v2, "t_dns"

    .line 289
    .line 290
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    sub-long v1, v19, v14

    .line 294
    .line 295
    invoke-static {v1, v2, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 296
    .line 297
    .line 298
    move-result-wide v1

    .line 299
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    const-string v2, "t_conn"

    .line 304
    .line 305
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    const-string v1, "t_ssl"

    .line 309
    .line 310
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 318
    .line 319
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->o()Ll/i5d0;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    const/4 v10, 0x0

    .line 324
    if-eqz v2, :cond_2

    .line 325
    .line 326
    invoke-virtual {v2}, Ll/i5d0;->S()Lokhttp3/Protocol;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    goto :goto_0

    .line 331
    :cond_2
    move-object v2, v10

    .line 332
    :goto_0
    invoke-static {v7, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;->a(Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;Lokhttp3/Protocol;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    const-string v2, "http_ver"

    .line 341
    .line 342
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 346
    .line 347
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->v()Lokhttp3/TlsVersion;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    if-eqz v2, :cond_3

    .line 352
    .line 353
    invoke-virtual {v2}, Lokhttp3/TlsVersion;->javaName()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    goto :goto_1

    .line 358
    :cond_3
    move-object v2, v10

    .line 359
    :goto_1
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    const-string v2, "tls_ver"

    .line 364
    .line 365
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 369
    .line 370
    invoke-virtual/range {v21 .. v21}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    check-cast v2, Ljava/lang/String;

    .line 375
    .line 376
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    const-string v2, "type"

    .line 381
    .line 382
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 386
    .line 387
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    if-eqz v1, :cond_4

    .line 392
    .line 393
    invoke-virtual {v1}, Ll/x1d0;->k()Ll/rnl;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    goto :goto_2

    .line 398
    :cond_4
    move-object v1, v10

    .line 399
    :goto_2
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    const-string v2, "url"

    .line 404
    .line 405
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 409
    .line 410
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    if-eqz v2, :cond_5

    .line 415
    .line 416
    invoke-virtual {v2}, Ll/x1d0;->k()Ll/rnl;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    if-eqz v2, :cond_5

    .line 421
    .line 422
    invoke-virtual {v2}, Ll/rnl;->I()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v2

    .line 426
    goto :goto_3

    .line 427
    :cond_5
    move-object v2, v10

    .line 428
    :goto_3
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v1

    .line 432
    const-string v2, "scheme"

    .line 433
    .line 434
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    .line 436
    .line 437
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 438
    .line 439
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->b(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ll/x1d0;

    .line 440
    .line 441
    .line 442
    move-result-object v2

    .line 443
    if-eqz v2, :cond_6

    .line 444
    .line 445
    invoke-virtual {v2}, Ll/x1d0;->g()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v10

    .line 449
    :cond_6
    invoke-virtual {v1, v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    const-string v2, "op"

    .line 454
    .line 455
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 459
    .line 460
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u()Ljava/lang/Throwable;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    instance-of v1, v1, Lcom/immomo/android/network/metrics/ActiveCancelException;

    .line 465
    .line 466
    const-string v2, "code"

    .line 467
    .line 468
    if-eqz v1, :cond_7

    .line 469
    .line 470
    const-string v1, "600"

    .line 471
    .line 472
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    goto :goto_4

    .line 476
    :cond_7
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 477
    .line 478
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->e(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v10

    .line 482
    invoke-virtual {v1, v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v1

    .line 486
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    .line 488
    .line 489
    :goto_4
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 490
    .line 491
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->a(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    const-string v2, "rip"

    .line 500
    .line 501
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 505
    .line 506
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->p()J

    .line 507
    .line 508
    .line 509
    move-result-wide v1

    .line 510
    iget-object v10, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 511
    .line 512
    invoke-virtual {v10}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->q()J

    .line 513
    .line 514
    .line 515
    move-result-wide v10

    .line 516
    sub-long/2addr v1, v10

    .line 517
    const-wide/16 v10, 0x0

    .line 518
    .line 519
    invoke-static {v1, v2, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 520
    .line 521
    .line 522
    move-result-wide v1

    .line 523
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    const-string v2, "t_req"

    .line 528
    .line 529
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    .line 531
    .line 532
    const-string v1, "t_start"

    .line 533
    .line 534
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    sub-long v1, v12, v8

    .line 542
    .line 543
    invoke-static {v1, v2, v10, v11}, Lkotlin/ranges/a;->c(JJ)J

    .line 544
    .line 545
    .line 546
    move-result-wide v1

    .line 547
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v1

    .line 551
    const-string v2, "t_rsp"

    .line 552
    .line 553
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 557
    .line 558
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->d(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;

    .line 559
    .line 560
    .line 561
    move-result-object v2

    .line 562
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object v1

    .line 566
    const-string v2, "s_up"

    .line 567
    .line 568
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    iget-object v1, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 572
    .line 573
    invoke-static {v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->c(Lcom/immomo/android/network/metrics/NetworkTrackInfo;)Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v2

    .line 577
    invoke-virtual {v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    const-string v2, "s_down"

    .line 582
    .line 583
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v7}, Lcom/immomo/android/network/metrics/NetworkTrackInfo$a;->e()Z

    .line 587
    .line 588
    .line 589
    move-result v1

    .line 590
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    const-string v2, "is_proxy"

    .line 595
    .line 596
    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    .line 598
    .line 599
    const-string v1, "true"

    .line 600
    .line 601
    invoke-interface {v6, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 602
    .line 603
    .line 604
    :try_start_0
    invoke-virtual {v5}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->d()Ll/vv5;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    if-eqz v1, :cond_9

    .line 609
    .line 610
    invoke-virtual {v1}, Ll/vv5;->d()Lkotlin/jvm/functions/Function1;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    if-eqz v1, :cond_9

    .line 615
    .line 616
    iget-object v2, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->$call:Ll/ry3;

    .line 617
    .line 618
    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    check-cast v1, Ljava/util/Map;

    .line 623
    .line 624
    if-eqz v1, :cond_9

    .line 625
    .line 626
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    :cond_8
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 635
    .line 636
    .line 637
    move-result v2

    .line 638
    if-eqz v2, :cond_9

    .line 639
    .line 640
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object v2

    .line 644
    check-cast v2, Ljava/util/Map$Entry;

    .line 645
    .line 646
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 647
    .line 648
    .line 649
    move-result-object v4

    .line 650
    check-cast v4, Ljava/lang/String;

    .line 651
    .line 652
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    move-result-object v2

    .line 656
    check-cast v2, Ljava/lang/String;

    .line 657
    .line 658
    if-eqz v2, :cond_8

    .line 659
    .line 660
    new-instance v5, Ljava/lang/StringBuilder;

    .line 661
    .line 662
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 663
    .line 664
    .line 665
    const-string v7, "extra_"

    .line 666
    .line 667
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 668
    .line 669
    .line 670
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 671
    .line 672
    .line 673
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 674
    .line 675
    .line 676
    move-result-object v4

    .line 677
    invoke-interface {v6, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 678
    .line 679
    .line 680
    goto :goto_5

    .line 681
    :catch_0
    sget-object v1, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 682
    .line 683
    invoke-virtual {v1}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->f()Lcom/immomo/android/network/metrics/NetworkMetricsStatistics$a;

    .line 684
    .line 685
    .line 686
    :cond_9
    iget-object v0, v0, Lcom/immomo/android/network/metrics/NetworkTrackInfo$submit$1;->this$0:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 687
    .line 688
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->u()Ljava/lang/Throwable;

    .line 689
    .line 690
    .line 691
    move-result-object v0

    .line 692
    const/4 v1, 0x0

    .line 693
    if-eqz v0, :cond_a

    .line 694
    .line 695
    move/from16 v16, v1

    .line 696
    .line 697
    goto :goto_6

    .line 698
    :cond_a
    const/16 v16, 0x1

    .line 699
    .line 700
    :goto_6
    invoke-virtual {v3}, Lcom/immomo/android/network/metrics/Strategy;->j()I

    .line 701
    .line 702
    .line 703
    move-result v0

    .line 704
    int-to-long v2, v0

    .line 705
    cmp-long v0, v12, v2

    .line 706
    .line 707
    if-lez v0, :cond_b

    .line 708
    .line 709
    goto :goto_7

    .line 710
    :cond_b
    move/from16 v1, v16

    .line 711
    .line 712
    :goto_7
    sget-object v0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 713
    .line 714
    invoke-virtual {v0, v1, v12, v13, v6}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->j(ZJLjava/util/Map;)V

    .line 715
    .line 716
    .line 717
    :cond_c
    :goto_8
    return-void
.end method
