.class public final Ll/t6w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:J

.field public final g:Z

.field public final h:Ljava/lang/String;

.field public final i:Ll/s6w0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:Landroid/os/Bundle;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Lorg/json/JSONObject;

.field public final o:Ljava/lang/String;

.field public final p:I


# direct methods
.method public constructor <init>(Landroid/util/JsonReader;)V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 7
    .line 8
    new-instance v2, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v3, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->beginObject()V

    .line 19
    .line 20
    .line 21
    const-string v5, ""

    .line 22
    .line 23
    const/4 v6, 0x0

    .line 24
    const/4 v7, 0x0

    .line 25
    move-object v10, v5

    .line 26
    move-object v11, v10

    .line 27
    move-object v12, v11

    .line 28
    move-object v13, v12

    .line 29
    move v8, v6

    .line 30
    move v14, v8

    .line 31
    move v15, v14

    .line 32
    move-object v9, v7

    .line 33
    const-wide/16 v16, 0x0

    .line 34
    .line 35
    const-wide/16 v18, 0x0

    .line 36
    .line 37
    const/16 v20, 0x1

    .line 38
    .line 39
    move-object v6, v13

    .line 40
    move-object v7, v6

    .line 41
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v21

    .line 45
    if-eqz v21, :cond_15

    .line 46
    .line 47
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    move-object/from16 v22, v13

    .line 52
    .line 53
    const-string v13, "nofill_urls"

    .line 54
    .line 55
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    if-eqz v13, :cond_0

    .line 60
    .line 61
    invoke-static/range {p1 .. p1}, Ll/v0t0;->d(Landroid/util/JsonReader;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :goto_1
    move-object/from16 v13, v22

    .line 66
    .line 67
    :goto_2
    const/4 v4, 0x1

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const-string v13, "refresh_interval"

    .line 70
    .line 71
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v13

    .line 75
    if-eqz v13, :cond_1

    .line 76
    .line 77
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextInt()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    move v14, v4

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    const-string v13, "gws_query_id"

    .line 84
    .line 85
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    if-eqz v13, :cond_2

    .line 90
    .line 91
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    move-object v5, v4

    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const-string v13, "analytics_query_ad_event_id"

    .line 98
    .line 99
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v13

    .line 103
    if-eqz v13, :cond_3

    .line 104
    .line 105
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    move-object v6, v4

    .line 110
    goto :goto_1

    .line 111
    :cond_3
    const-string v13, "is_idless"

    .line 112
    .line 113
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v13

    .line 117
    if-eqz v13, :cond_4

    .line 118
    .line 119
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextBoolean()Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    move v8, v4

    .line 124
    goto :goto_1

    .line 125
    :cond_4
    const-string v13, "response_code"

    .line 126
    .line 127
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v13

    .line 131
    if-eqz v13, :cond_5

    .line 132
    .line 133
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextInt()I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    move v15, v4

    .line 138
    goto :goto_1

    .line 139
    :cond_5
    const-string v13, "latency"

    .line 140
    .line 141
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v13

    .line 145
    if-eqz v13, :cond_6

    .line 146
    .line 147
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextLong()J

    .line 148
    .line 149
    .line 150
    move-result-wide v18

    .line 151
    goto :goto_1

    .line 152
    :cond_6
    sget-object v13, Ll/sgs0;->g8:Ll/dgs0;

    .line 153
    .line 154
    move-object/from16 v23, v3

    .line 155
    .line 156
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-virtual {v3, v13}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    check-cast v3, Ljava/lang/Boolean;

    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    if-eqz v3, :cond_8

    .line 171
    .line 172
    const-string v3, "public_error"

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-eqz v3, :cond_8

    .line 179
    .line 180
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->peek()Landroid/util/JsonToken;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    sget-object v13, Landroid/util/JsonToken;->BEGIN_OBJECT:Landroid/util/JsonToken;

    .line 185
    .line 186
    if-ne v3, v13, :cond_8

    .line 187
    .line 188
    new-instance v3, Ll/s6w0;

    .line 189
    .line 190
    move-object/from16 v13, p1

    .line 191
    .line 192
    invoke-direct {v3, v13}, Ll/s6w0;-><init>(Landroid/util/JsonReader;)V

    .line 193
    .line 194
    .line 195
    move-object v9, v3

    .line 196
    :cond_7
    :goto_3
    move-object/from16 v13, v22

    .line 197
    .line 198
    :goto_4
    move-object/from16 v3, v23

    .line 199
    .line 200
    goto/16 :goto_2

    .line 201
    .line 202
    :cond_8
    move-object/from16 v13, p1

    .line 203
    .line 204
    const-string v3, "bidding_data"

    .line 205
    .line 206
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-eqz v3, :cond_9

    .line 211
    .line 212
    invoke-virtual {v13}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    move-object v7, v3

    .line 217
    goto :goto_3

    .line 218
    :cond_9
    sget-object v3, Ll/sgs0;->U9:Ll/dgs0;

    .line 219
    .line 220
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 221
    .line 222
    .line 223
    move-result-object v13

    .line 224
    invoke-virtual {v13, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    check-cast v3, Ljava/lang/Boolean;

    .line 229
    .line 230
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    if-eqz v3, :cond_a

    .line 235
    .line 236
    const-string v3, "topics_should_record_observation"

    .line 237
    .line 238
    invoke-static {v4, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-eqz v3, :cond_a

    .line 243
    .line 244
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextBoolean()Z

    .line 245
    .line 246
    .line 247
    :catch_0
    :goto_5
    const/4 v4, 0x1

    .line 248
    goto/16 :goto_6

    .line 249
    .line 250
    :cond_a
    const-string v3, "adapter_response_replacement_key"

    .line 251
    .line 252
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-eqz v3, :cond_b

    .line 257
    .line 258
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    move-object v13, v3

    .line 263
    goto :goto_4

    .line 264
    :cond_b
    const-string v3, "response_info_extras"

    .line 265
    .line 266
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_d

    .line 271
    .line 272
    sget-object v3, Ll/sgs0;->Q6:Ll/dgs0;

    .line 273
    .line 274
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    check-cast v3, Ljava/lang/Boolean;

    .line 283
    .line 284
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    if-eqz v3, :cond_c

    .line 289
    .line 290
    :try_start_0
    invoke-static/range {p1 .. p1}, Ll/v0t0;->h(Landroid/util/JsonReader;)Lorg/json/JSONObject;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-static {v3}, Ll/v0t0;->a(Lorg/json/JSONObject;)Landroid/os/Bundle;

    .line 295
    .line 296
    .line 297
    move-result-object v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 298
    if-eqz v3, :cond_7

    .line 299
    .line 300
    move-object v2, v3

    .line 301
    goto :goto_3

    .line 302
    :catch_1
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->skipValue()V

    .line 303
    .line 304
    .line 305
    goto :goto_5

    .line 306
    :cond_c
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->skipValue()V

    .line 307
    .line 308
    .line 309
    goto :goto_5

    .line 310
    :cond_d
    const-string v3, "adRequestPostBody"

    .line 311
    .line 312
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-eqz v3, :cond_f

    .line 317
    .line 318
    sget-object v3, Ll/sgs0;->g9:Ll/dgs0;

    .line 319
    .line 320
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    check-cast v3, Ljava/lang/Boolean;

    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    if-eqz v3, :cond_e

    .line 335
    .line 336
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    move-object v11, v3

    .line 341
    goto/16 :goto_3

    .line 342
    .line 343
    :cond_e
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->skipValue()V

    .line 344
    .line 345
    .line 346
    goto :goto_5

    .line 347
    :cond_f
    const-string v3, "adRequestUrl"

    .line 348
    .line 349
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v3

    .line 353
    if-eqz v3, :cond_11

    .line 354
    .line 355
    sget-object v3, Ll/sgs0;->g9:Ll/dgs0;

    .line 356
    .line 357
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    check-cast v3, Ljava/lang/Boolean;

    .line 366
    .line 367
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 368
    .line 369
    .line 370
    move-result v3

    .line 371
    if-eqz v3, :cond_10

    .line 372
    .line 373
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    move-object v10, v3

    .line 378
    goto/16 :goto_3

    .line 379
    .line 380
    :cond_10
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->skipValue()V

    .line 381
    .line 382
    .line 383
    goto/16 :goto_5

    .line 384
    .line 385
    :cond_11
    sget-object v3, Ll/sgs0;->h9:Ll/dgs0;

    .line 386
    .line 387
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 388
    .line 389
    .line 390
    move-result-object v13

    .line 391
    invoke-virtual {v13, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v13

    .line 395
    check-cast v13, Ljava/lang/Boolean;

    .line 396
    .line 397
    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    .line 398
    .line 399
    .line 400
    move-result v13

    .line 401
    if-eqz v13, :cond_12

    .line 402
    .line 403
    const-string v13, "adResponseBody"

    .line 404
    .line 405
    invoke-static {v4, v13}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result v13

    .line 409
    if-eqz v13, :cond_12

    .line 410
    .line 411
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    move-object v12, v3

    .line 416
    goto/16 :goto_3

    .line 417
    .line 418
    :cond_12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 419
    .line 420
    .line 421
    move-result-object v13

    .line 422
    invoke-virtual {v13, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    check-cast v3, Ljava/lang/Boolean;

    .line 427
    .line 428
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 429
    .line 430
    .line 431
    move-result v3

    .line 432
    if-eqz v3, :cond_13

    .line 433
    .line 434
    const-string v3, "adResponseHeaders"

    .line 435
    .line 436
    invoke-static {v4, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v3

    .line 440
    if-eqz v3, :cond_13

    .line 441
    .line 442
    invoke-static/range {p1 .. p1}, Ll/v0t0;->h(Landroid/util/JsonReader;)Lorg/json/JSONObject;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    goto/16 :goto_1

    .line 447
    .line 448
    :cond_13
    const-string v3, "max_parallel_renderers"

    .line 449
    .line 450
    invoke-static {v4, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result v3

    .line 454
    if-eqz v3, :cond_14

    .line 455
    .line 456
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->nextInt()I

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    const/4 v4, 0x1

    .line 461
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    .line 462
    .line 463
    .line 464
    move-result v20

    .line 465
    :goto_6
    move-object/from16 v13, v22

    .line 466
    .line 467
    move-object/from16 v3, v23

    .line 468
    .line 469
    goto/16 :goto_0

    .line 470
    .line 471
    :cond_14
    const/4 v4, 0x1

    .line 472
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->skipValue()V

    .line 473
    .line 474
    .line 475
    goto :goto_6

    .line 476
    :cond_15
    move-object/from16 v23, v3

    .line 477
    .line 478
    move-object/from16 v22, v13

    .line 479
    .line 480
    invoke-virtual/range {p1 .. p1}, Landroid/util/JsonReader;->endObject()V

    .line 481
    .line 482
    .line 483
    iput-object v1, v0, Ll/t6w0;->a:Ljava/util/List;

    .line 484
    .line 485
    iput v14, v0, Ll/t6w0;->c:I

    .line 486
    .line 487
    iput-object v5, v0, Ll/t6w0;->b:Ljava/lang/String;

    .line 488
    .line 489
    iput-object v6, v0, Ll/t6w0;->d:Ljava/lang/String;

    .line 490
    .line 491
    iput v15, v0, Ll/t6w0;->e:I

    .line 492
    .line 493
    move-wide/from16 v3, v18

    .line 494
    .line 495
    iput-wide v3, v0, Ll/t6w0;->f:J

    .line 496
    .line 497
    iput-object v9, v0, Ll/t6w0;->i:Ll/s6w0;

    .line 498
    .line 499
    iput-boolean v8, v0, Ll/t6w0;->g:Z

    .line 500
    .line 501
    iput-object v7, v0, Ll/t6w0;->h:Ljava/lang/String;

    .line 502
    .line 503
    iput-object v2, v0, Ll/t6w0;->j:Landroid/os/Bundle;

    .line 504
    .line 505
    iput-object v10, v0, Ll/t6w0;->k:Ljava/lang/String;

    .line 506
    .line 507
    iput-object v11, v0, Ll/t6w0;->l:Ljava/lang/String;

    .line 508
    .line 509
    iput-object v12, v0, Ll/t6w0;->m:Ljava/lang/String;

    .line 510
    .line 511
    move-object/from16 v3, v23

    .line 512
    .line 513
    iput-object v3, v0, Ll/t6w0;->n:Lorg/json/JSONObject;

    .line 514
    .line 515
    move-object/from16 v5, v22

    .line 516
    .line 517
    iput-object v5, v0, Ll/t6w0;->o:Ljava/lang/String;

    .line 518
    .line 519
    sget-object v1, Ll/mjs0;->a:Ll/kis0;

    .line 520
    .line 521
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    check-cast v2, Ljava/lang/Long;

    .line 526
    .line 527
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 528
    .line 529
    .line 530
    move-result-wide v2

    .line 531
    cmp-long v2, v2, v16

    .line 532
    .line 533
    if-lez v2, :cond_16

    .line 534
    .line 535
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    check-cast v1, Ljava/lang/Long;

    .line 540
    .line 541
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 542
    .line 543
    .line 544
    move-result v20

    .line 545
    :cond_16
    move/from16 v1, v20

    .line 546
    .line 547
    iput v1, v0, Ll/t6w0;->p:I

    .line 548
    .line 549
    return-void
.end method
