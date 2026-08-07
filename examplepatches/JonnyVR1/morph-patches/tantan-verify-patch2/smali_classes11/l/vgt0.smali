.class public final Ll/vgt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


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

.method public static final b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    return-object p0

    .line 24
    :catch_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "Precache invalid numeric parameter \'"

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, "\': "

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-object v1
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 16

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    check-cast v1, Ll/bft0;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    invoke-static {v2}, Ll/dct0;->j(I)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    new-instance v2, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    const-string v3, "google.afma.Notify_dt"

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "Precache GMSG: "

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/bxy0;->A()Ll/ngt0;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "abort"

    .line 42
    .line 43
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ll/ngt0;->g(Ll/bft0;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_15

    .line 54
    .line 55
    const-string v0, "Precache abort but no precache task running."

    .line 56
    .line 57
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const-string v3, "src"

    .line 62
    .line 63
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ljava/lang/String;

    .line 68
    .line 69
    const-string v4, "periodicReportIntervalMs"

    .line 70
    .line 71
    invoke-static {v0, v4}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const-string v5, "exoPlayerRenderingIntervalMs"

    .line 76
    .line 77
    invoke-static {v0, v5}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const-string v6, "exoPlayerIdleIntervalMs"

    .line 82
    .line 83
    invoke-static {v0, v6}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    new-instance v7, Ll/aft0;

    .line 88
    .line 89
    const-string v8, "flags"

    .line 90
    .line 91
    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    check-cast v8, Ljava/lang/String;

    .line 96
    .line 97
    invoke-direct {v7, v8}, Ll/aft0;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-boolean v8, v7, Ll/aft0;->l:Z

    .line 101
    .line 102
    if-eqz v3, :cond_11

    .line 103
    .line 104
    const/4 v9, 0x1

    .line 105
    new-array v10, v9, [Ljava/lang/String;

    .line 106
    .line 107
    const/4 v11, 0x0

    .line 108
    aput-object v3, v10, v11

    .line 109
    .line 110
    const-string v12, "demuxed"

    .line 111
    .line 112
    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v12

    .line 116
    check-cast v12, Ljava/lang/String;

    .line 117
    .line 118
    const/4 v13, 0x0

    .line 119
    if-eqz v12, :cond_3

    .line 120
    .line 121
    :try_start_0
    new-instance v10, Lorg/json/JSONArray;

    .line 122
    .line 123
    invoke-direct {v10, v12}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 127
    .line 128
    .line 129
    move-result v14

    .line 130
    new-array v14, v14, [Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .line 132
    move/from16 p0, v11

    .line 133
    .line 134
    move/from16 v15, p0

    .line 135
    .line 136
    :goto_0
    :try_start_1
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 137
    .line 138
    .line 139
    move-result v11

    .line 140
    if-ge v15, v11, :cond_2

    .line 141
    .line 142
    invoke-virtual {v10, v15}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v11

    .line 146
    aput-object v11, v14, v15
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    .line 148
    add-int/lit8 v15, v15, 0x1

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_2
    move-object v10, v14

    .line 152
    goto :goto_1

    .line 153
    :catch_0
    move/from16 p0, v11

    .line 154
    .line 155
    :catch_1
    const-string v10, "Malformed demuxed URL list for precache: "

    .line 156
    .line 157
    invoke-virtual {v10, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v10

    .line 161
    invoke-static {v10}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    move-object v10, v13

    .line 165
    goto :goto_1

    .line 166
    :cond_3
    move/from16 p0, v11

    .line 167
    .line 168
    :goto_1
    if-nez v10, :cond_4

    .line 169
    .line 170
    new-array v10, v9, [Ljava/lang/String;

    .line 171
    .line 172
    aput-object v3, v10, p0

    .line 173
    .line 174
    :cond_4
    if-eqz v8, :cond_6

    .line 175
    .line 176
    invoke-virtual {v2}, Ll/ngt0;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v8

    .line 184
    if-eqz v8, :cond_7

    .line 185
    .line 186
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    check-cast v8, Ll/mgt0;

    .line 191
    .line 192
    iget-object v9, v8, Ll/mgt0;->c:Ll/bft0;

    .line 193
    .line 194
    if-ne v9, v1, :cond_5

    .line 195
    .line 196
    invoke-virtual {v8}, Ll/mgt0;->e()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v9

    .line 200
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v9

    .line 204
    if-eqz v9, :cond_5

    .line 205
    .line 206
    move-object v13, v8

    .line 207
    goto :goto_2

    .line 208
    :cond_6
    invoke-virtual {v2, v1}, Ll/ngt0;->a(Ll/bft0;)Ll/mgt0;

    .line 209
    .line 210
    .line 211
    move-result-object v13

    .line 212
    :cond_7
    :goto_2
    if-eqz v13, :cond_8

    .line 213
    .line 214
    const-string v0, "Precache task is already running."

    .line 215
    .line 216
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_8
    invoke-interface {v1}, Ll/bft0;->zzj()Ll/far0;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    if-nez v2, :cond_9

    .line 225
    .line 226
    const-string v0, "Precache requires a dependency provider."

    .line 227
    .line 228
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_9
    const-string v2, "player"

    .line 233
    .line 234
    invoke-static {v0, v2}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    if-nez v2, :cond_a

    .line 239
    .line 240
    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    :cond_a
    if-eqz v4, :cond_b

    .line 245
    .line 246
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    invoke-interface {v1, v4}, Ll/bft0;->D(I)V

    .line 251
    .line 252
    .line 253
    :cond_b
    if-eqz v5, :cond_c

    .line 254
    .line 255
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    invoke-interface {v1, v4}, Ll/bft0;->h0(I)V

    .line 260
    .line 261
    .line 262
    :cond_c
    if-eqz v6, :cond_d

    .line 263
    .line 264
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    invoke-interface {v1, v4}, Ll/bft0;->f0(I)V

    .line 269
    .line 270
    .line 271
    :cond_d
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    invoke-interface {v1}, Ll/bft0;->zzj()Ll/far0;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    iget-object v4, v4, Ll/far0;->b:Ll/ggt0;

    .line 280
    .line 281
    if-lez v2, :cond_10

    .line 282
    .line 283
    iget v2, v7, Ll/aft0;->h:I

    .line 284
    .line 285
    invoke-static {}, Ll/set0;->Q()I

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    if-ge v4, v2, :cond_e

    .line 290
    .line 291
    new-instance v2, Ll/nht0;

    .line 292
    .line 293
    invoke-direct {v2, v1, v7}, Ll/nht0;-><init>(Ll/bft0;Ll/aft0;)V

    .line 294
    .line 295
    .line 296
    goto :goto_3

    .line 297
    :cond_e
    iget v2, v7, Ll/aft0;->b:I

    .line 298
    .line 299
    if-ge v4, v2, :cond_f

    .line 300
    .line 301
    new-instance v2, Ll/kht0;

    .line 302
    .line 303
    invoke-direct {v2, v1, v7}, Ll/kht0;-><init>(Ll/bft0;Ll/aft0;)V

    .line 304
    .line 305
    .line 306
    goto :goto_3

    .line 307
    :cond_f
    new-instance v2, Ll/iht0;

    .line 308
    .line 309
    invoke-direct {v2, v1}, Ll/iht0;-><init>(Ll/bft0;)V

    .line 310
    .line 311
    .line 312
    goto :goto_3

    .line 313
    :cond_10
    new-instance v2, Ll/xgt0;

    .line 314
    .line 315
    invoke-direct {v2, v1}, Ll/xgt0;-><init>(Ll/bft0;)V

    .line 316
    .line 317
    .line 318
    :goto_3
    new-instance v4, Ll/mgt0;

    .line 319
    .line 320
    invoke-direct {v4, v1, v2, v3, v10}, Ll/mgt0;-><init>(Ll/bft0;Ll/ugt0;Ljava/lang/String;[Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v4}, Ll/aas0;->b()Ll/hpr;

    .line 324
    .line 325
    .line 326
    goto :goto_4

    .line 327
    :cond_11
    invoke-virtual {v2, v1}, Ll/ngt0;->a(Ll/bft0;)Ll/mgt0;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    if-eqz v1, :cond_16

    .line 332
    .line 333
    iget-object v2, v1, Ll/mgt0;->d:Ll/ugt0;

    .line 334
    .line 335
    :goto_4
    const-string v1, "minBufferMs"

    .line 336
    .line 337
    invoke-static {v0, v1}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    if-eqz v1, :cond_12

    .line 342
    .line 343
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    invoke-virtual {v2, v1}, Ll/ugt0;->t(I)V

    .line 348
    .line 349
    .line 350
    :cond_12
    const-string v1, "maxBufferMs"

    .line 351
    .line 352
    invoke-static {v0, v1}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    if-eqz v1, :cond_13

    .line 357
    .line 358
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 359
    .line 360
    .line 361
    move-result v1

    .line 362
    invoke-virtual {v2, v1}, Ll/ugt0;->s(I)V

    .line 363
    .line 364
    .line 365
    :cond_13
    const-string v1, "bufferForPlaybackMs"

    .line 366
    .line 367
    invoke-static {v0, v1}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    if-eqz v1, :cond_14

    .line 372
    .line 373
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    invoke-virtual {v2, v1}, Ll/ugt0;->q(I)V

    .line 378
    .line 379
    .line 380
    :cond_14
    const-string v1, "bufferForPlaybackAfterRebufferMs"

    .line 381
    .line 382
    invoke-static {v0, v1}, Ll/vgt0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    if-eqz v0, :cond_15

    .line 387
    .line 388
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    invoke-virtual {v2, v0}, Ll/ugt0;->r(I)V

    .line 393
    .line 394
    .line 395
    :cond_15
    return-void

    .line 396
    :cond_16
    const-string v0, "Precache must specify a source."

    .line 397
    .line 398
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    return-void
.end method
