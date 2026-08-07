.class public final Ll/qes0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/bir0;Ll/gix0;Ll/mpr0;)Ll/bir0;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, v0}, Ll/qes0;->b(Ll/bir0;Ll/gix0;Ll/mpr0;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/bir0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b(Ll/bir0;Ll/gix0;Ll/mpr0;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/bir0;
    .locals 7

    .line 1
    new-instance v0, Ll/bir0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p0, v2}, Ll/bir0;->r(I)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Ll/bir0;->g(I)Ll/ewr0;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    new-instance v4, Ll/glr0;

    .line 37
    .line 38
    int-to-double v5, v2

    .line 39
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-direct {v4, v5}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 44
    .line 45
    .line 46
    const/4 v5, 0x3

    .line 47
    new-array v5, v5, [Ll/ewr0;

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    aput-object v3, v5, v6

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    aput-object v4, v5, v3

    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    aput-object p0, v5, v3

    .line 57
    .line 58
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {p2, p1, v3}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-interface {v3}, Ll/ewr0;->zzd()Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v4, p3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    if-eqz p4, :cond_2

    .line 78
    .line 79
    invoke-interface {v3}, Ll/ewr0;->zzd()Ljava/lang/Boolean;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v4, p4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_0

    .line 88
    .line 89
    :cond_2
    invoke-virtual {v0, v2, v3}, Ll/bir0;->p(ILl/ewr0;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    :goto_1
    return-object v0
.end method

.method public static c(Ljava/lang/String;Ll/bir0;Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/bir0;",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    .line 4
    .line 5
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    const-string v6, "indexOf"

    .line 17
    .line 18
    const-string v7, "reverse"

    .line 19
    .line 20
    const-string v8, "slice"

    .line 21
    .line 22
    const-string v9, "shift"

    .line 23
    .line 24
    const-string v10, "every"

    .line 25
    .line 26
    const-string v11, "sort"

    .line 27
    .line 28
    const-string v12, "some"

    .line 29
    .line 30
    const-string v13, "join"

    .line 31
    .line 32
    const-string v14, "pop"

    .line 33
    .line 34
    const-string v15, "map"

    .line 35
    .line 36
    move/from16 v16, v5

    .line 37
    .line 38
    const-string v5, "lastIndexOf"

    .line 39
    .line 40
    const-string v1, "forEach"

    .line 41
    .line 42
    move-object/from16 v17, v4

    .line 43
    .line 44
    const-string v4, "filter"

    .line 45
    .line 46
    const-string v2, "toString"

    .line 47
    .line 48
    const/16 v20, -0x1

    .line 49
    .line 50
    sparse-switch v16, :sswitch_data_0

    .line 51
    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :sswitch_0
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :cond_0
    const/16 v0, 0x13

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :sswitch_1
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    goto/16 :goto_1

    .line 74
    .line 75
    :cond_1
    const/16 v0, 0x12

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_2
    const-string v3, "reduceRight"

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    goto/16 :goto_1

    .line 88
    .line 89
    :cond_2
    const/16 v0, 0x11

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :sswitch_3
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    goto/16 :goto_1

    .line 100
    .line 101
    :cond_3
    const/16 v0, 0x10

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :sswitch_4
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_4

    .line 110
    .line 111
    goto/16 :goto_1

    .line 112
    .line 113
    :cond_4
    const/16 v0, 0xf

    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :sswitch_5
    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_5

    .line 122
    .line 123
    goto/16 :goto_1

    .line 124
    .line 125
    :cond_5
    const/16 v0, 0xe

    .line 126
    .line 127
    goto/16 :goto_0

    .line 128
    .line 129
    :sswitch_6
    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_6

    .line 134
    .line 135
    goto/16 :goto_1

    .line 136
    .line 137
    :cond_6
    const/16 v0, 0xd

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_7
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_7

    .line 146
    .line 147
    goto/16 :goto_1

    .line 148
    .line 149
    :cond_7
    const/16 v0, 0xc

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :sswitch_8
    const-string v3, "push"

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_8

    .line 159
    .line 160
    goto/16 :goto_1

    .line 161
    .line 162
    :cond_8
    const/16 v0, 0xb

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :sswitch_9
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_9

    .line 170
    .line 171
    goto/16 :goto_1

    .line 172
    .line 173
    :cond_9
    const/16 v0, 0xa

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :sswitch_a
    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-nez v0, :cond_a

    .line 181
    .line 182
    goto/16 :goto_1

    .line 183
    .line 184
    :cond_a
    const/16 v0, 0x9

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :sswitch_b
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_b

    .line 192
    .line 193
    goto/16 :goto_1

    .line 194
    .line 195
    :cond_b
    const/16 v0, 0x8

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :sswitch_c
    const-string v3, "unshift"

    .line 199
    .line 200
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_c

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_c
    const/4 v0, 0x7

    .line 208
    goto :goto_0

    .line 209
    :sswitch_d
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_d

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_d
    const/4 v0, 0x6

    .line 217
    goto :goto_0

    .line 218
    :sswitch_e
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_e

    .line 223
    .line 224
    goto :goto_1

    .line 225
    :cond_e
    const/4 v0, 0x5

    .line 226
    goto :goto_0

    .line 227
    :sswitch_f
    const-string v3, "splice"

    .line 228
    .line 229
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-nez v0, :cond_f

    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_f
    const/4 v0, 0x4

    .line 237
    :goto_0
    move/from16 v20, v0

    .line 238
    .line 239
    goto :goto_1

    .line 240
    :sswitch_10
    const-string v3, "reduce"

    .line 241
    .line 242
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-nez v0, :cond_10

    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_10
    const/16 v20, 0x3

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :sswitch_11
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_11

    .line 257
    .line 258
    goto :goto_1

    .line 259
    :cond_11
    const/16 v20, 0x2

    .line 260
    .line 261
    goto :goto_1

    .line 262
    :sswitch_12
    const-string v3, "concat"

    .line 263
    .line 264
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-nez v0, :cond_12

    .line 269
    .line 270
    goto :goto_1

    .line 271
    :cond_12
    const/16 v20, 0x1

    .line 272
    .line 273
    goto :goto_1

    .line 274
    :sswitch_13
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-nez v0, :cond_13

    .line 279
    .line 280
    goto :goto_1

    .line 281
    :cond_13
    const/16 v20, 0x0

    .line 282
    .line 283
    :goto_1
    const-string v3, "Callback should be a method"

    .line 284
    .line 285
    move-object/from16 v21, v1

    .line 286
    .line 287
    const/16 p0, 0x0

    .line 288
    .line 289
    const-wide/16 v0, 0x0

    .line 290
    .line 291
    packed-switch v20, :pswitch_data_0

    .line 292
    .line 293
    .line 294
    const-string v0, "Command not supported"

    .line 295
    .line 296
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    return-object p0

    .line 300
    :pswitch_0
    move-object/from16 v2, p3

    .line 301
    .line 302
    const/4 v3, 0x2

    .line 303
    invoke-static {v6, v3, v2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 304
    .line 305
    .line 306
    sget-object v3, Ll/ewr0;->w0:Ll/ewr0;

    .line 307
    .line 308
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    if-nez v4, :cond_14

    .line 313
    .line 314
    const/4 v4, 0x0

    .line 315
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    check-cast v3, Ll/ewr0;

    .line 320
    .line 321
    move-object/from16 v6, p2

    .line 322
    .line 323
    invoke-virtual {v6, v3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    goto :goto_2

    .line 328
    :cond_14
    move-object/from16 v6, p2

    .line 329
    .line 330
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 331
    .line 332
    .line 333
    move-result v4

    .line 334
    const/4 v5, 0x1

    .line 335
    if-le v4, v5, :cond_17

    .line 336
    .line 337
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    check-cast v2, Ll/ewr0;

    .line 342
    .line 343
    invoke-virtual {v6, v2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-interface {v2}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 352
    .line 353
    .line 354
    move-result-wide v4

    .line 355
    invoke-static {v4, v5}, Ll/tqw0;->a(D)D

    .line 356
    .line 357
    .line 358
    move-result-wide v4

    .line 359
    invoke-virtual/range {p1 .. p1}, Ll/bir0;->j()I

    .line 360
    .line 361
    .line 362
    move-result v2

    .line 363
    int-to-double v6, v2

    .line 364
    cmpl-double v2, v4, v6

    .line 365
    .line 366
    if-ltz v2, :cond_15

    .line 367
    .line 368
    new-instance v0, Ll/glr0;

    .line 369
    .line 370
    move-object/from16 v7, v17

    .line 371
    .line 372
    invoke-direct {v0, v7}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 373
    .line 374
    .line 375
    return-object v0

    .line 376
    :cond_15
    move-object/from16 v7, v17

    .line 377
    .line 378
    cmpg-double v0, v4, v0

    .line 379
    .line 380
    if-gez v0, :cond_16

    .line 381
    .line 382
    invoke-virtual/range {p1 .. p1}, Ll/bir0;->j()I

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    int-to-double v0, v0

    .line 387
    add-double/2addr v0, v4

    .line 388
    goto :goto_3

    .line 389
    :cond_16
    move-wide v0, v4

    .line 390
    goto :goto_3

    .line 391
    :cond_17
    move-object/from16 v7, v17

    .line 392
    .line 393
    :goto_3
    invoke-virtual/range {p1 .. p1}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    :cond_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 398
    .line 399
    .line 400
    move-result v4

    .line 401
    if-eqz v4, :cond_19

    .line 402
    .line 403
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    check-cast v4, Ljava/lang/Integer;

    .line 408
    .line 409
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 410
    .line 411
    .line 412
    move-result v4

    .line 413
    int-to-double v5, v4

    .line 414
    cmpg-double v8, v5, v0

    .line 415
    .line 416
    move-object/from16 v15, p1

    .line 417
    .line 418
    if-ltz v8, :cond_18

    .line 419
    .line 420
    invoke-virtual {v15, v4}, Ll/bir0;->g(I)Ll/ewr0;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-static {v4, v3}, Ll/tqw0;->h(Ll/ewr0;Ll/ewr0;)Z

    .line 425
    .line 426
    .line 427
    move-result v4

    .line 428
    if-eqz v4, :cond_18

    .line 429
    .line 430
    new-instance v0, Ll/glr0;

    .line 431
    .line 432
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    invoke-direct {v0, v1}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 437
    .line 438
    .line 439
    return-object v0

    .line 440
    :cond_19
    new-instance v0, Ll/glr0;

    .line 441
    .line 442
    invoke-direct {v0, v7}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 443
    .line 444
    .line 445
    return-object v0

    .line 446
    :pswitch_1
    move-object/from16 v15, p1

    .line 447
    .line 448
    move-object/from16 v2, p3

    .line 449
    .line 450
    const/4 v4, 0x0

    .line 451
    invoke-static {v7, v4, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 455
    .line 456
    .line 457
    move-result v0

    .line 458
    if-eqz v0, :cond_1c

    .line 459
    .line 460
    const/4 v3, 0x0

    .line 461
    :goto_4
    div-int/lit8 v1, v0, 0x2

    .line 462
    .line 463
    if-ge v3, v1, :cond_1c

    .line 464
    .line 465
    invoke-virtual {v15, v3}, Ll/bir0;->r(I)Z

    .line 466
    .line 467
    .line 468
    move-result v1

    .line 469
    if-eqz v1, :cond_1b

    .line 470
    .line 471
    invoke-virtual {v15, v3}, Ll/bir0;->g(I)Ll/ewr0;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    move-object/from16 v2, p0

    .line 476
    .line 477
    invoke-virtual {v15, v3, v2}, Ll/bir0;->p(ILl/ewr0;)V

    .line 478
    .line 479
    .line 480
    add-int/lit8 v2, v0, -0x1

    .line 481
    .line 482
    sub-int/2addr v2, v3

    .line 483
    invoke-virtual {v15, v2}, Ll/bir0;->r(I)Z

    .line 484
    .line 485
    .line 486
    move-result v4

    .line 487
    if-eqz v4, :cond_1a

    .line 488
    .line 489
    invoke-virtual {v15, v2}, Ll/bir0;->g(I)Ll/ewr0;

    .line 490
    .line 491
    .line 492
    move-result-object v4

    .line 493
    invoke-virtual {v15, v3, v4}, Ll/bir0;->p(ILl/ewr0;)V

    .line 494
    .line 495
    .line 496
    :cond_1a
    invoke-virtual {v15, v2, v1}, Ll/bir0;->p(ILl/ewr0;)V

    .line 497
    .line 498
    .line 499
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    .line 500
    .line 501
    const/16 p0, 0x0

    .line 502
    .line 503
    goto :goto_4

    .line 504
    :cond_1c
    return-object v15

    .line 505
    :pswitch_2
    move-object/from16 v15, p1

    .line 506
    .line 507
    move-object/from16 v6, p2

    .line 508
    .line 509
    move-object/from16 v2, p3

    .line 510
    .line 511
    const/4 v4, 0x0

    .line 512
    invoke-static {v15, v6, v2, v4}, Ll/qes0;->d(Ll/bir0;Ll/gix0;Ljava/util/List;Z)Ll/ewr0;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    return-object v0

    .line 517
    :pswitch_3
    move-object/from16 v15, p1

    .line 518
    .line 519
    move-object/from16 v6, p2

    .line 520
    .line 521
    move-object/from16 v2, p3

    .line 522
    .line 523
    const/4 v3, 0x2

    .line 524
    const/4 v4, 0x0

    .line 525
    invoke-static {v8, v3, v2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 526
    .line 527
    .line 528
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 529
    .line 530
    .line 531
    move-result v3

    .line 532
    if-eqz v3, :cond_1d

    .line 533
    .line 534
    invoke-virtual {v15}, Ll/bir0;->zzc()Ll/ewr0;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    return-object v0

    .line 539
    :cond_1d
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 540
    .line 541
    .line 542
    move-result v3

    .line 543
    int-to-double v7, v3

    .line 544
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v3

    .line 548
    check-cast v3, Ll/ewr0;

    .line 549
    .line 550
    invoke-virtual {v6, v3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 551
    .line 552
    .line 553
    move-result-object v3

    .line 554
    invoke-interface {v3}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 555
    .line 556
    .line 557
    move-result-object v3

    .line 558
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 559
    .line 560
    .line 561
    move-result-wide v3

    .line 562
    invoke-static {v3, v4}, Ll/tqw0;->a(D)D

    .line 563
    .line 564
    .line 565
    move-result-wide v3

    .line 566
    cmpg-double v5, v3, v0

    .line 567
    .line 568
    if-gez v5, :cond_1e

    .line 569
    .line 570
    add-double/2addr v3, v7

    .line 571
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 572
    .line 573
    .line 574
    move-result-wide v3

    .line 575
    goto :goto_5

    .line 576
    :cond_1e
    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->min(DD)D

    .line 577
    .line 578
    .line 579
    move-result-wide v3

    .line 580
    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 581
    .line 582
    .line 583
    move-result v5

    .line 584
    const/4 v9, 0x2

    .line 585
    if-ne v5, v9, :cond_20

    .line 586
    .line 587
    const/4 v5, 0x1

    .line 588
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object v2

    .line 592
    check-cast v2, Ll/ewr0;

    .line 593
    .line 594
    invoke-virtual {v6, v2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 595
    .line 596
    .line 597
    move-result-object v2

    .line 598
    invoke-interface {v2}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 599
    .line 600
    .line 601
    move-result-object v2

    .line 602
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 603
    .line 604
    .line 605
    move-result-wide v5

    .line 606
    invoke-static {v5, v6}, Ll/tqw0;->a(D)D

    .line 607
    .line 608
    .line 609
    move-result-wide v5

    .line 610
    cmpg-double v2, v5, v0

    .line 611
    .line 612
    if-gez v2, :cond_1f

    .line 613
    .line 614
    add-double/2addr v7, v5

    .line 615
    invoke-static {v7, v8, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 616
    .line 617
    .line 618
    move-result-wide v7

    .line 619
    goto :goto_6

    .line 620
    :cond_1f
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(DD)D

    .line 621
    .line 622
    .line 623
    move-result-wide v7

    .line 624
    :cond_20
    :goto_6
    new-instance v0, Ll/bir0;

    .line 625
    .line 626
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 627
    .line 628
    .line 629
    double-to-int v1, v3

    .line 630
    :goto_7
    int-to-double v2, v1

    .line 631
    cmpg-double v2, v2, v7

    .line 632
    .line 633
    if-gez v2, :cond_21

    .line 634
    .line 635
    invoke-virtual {v15, v1}, Ll/bir0;->g(I)Ll/ewr0;

    .line 636
    .line 637
    .line 638
    move-result-object v2

    .line 639
    invoke-virtual {v0, v2}, Ll/bir0;->i(Ll/ewr0;)V

    .line 640
    .line 641
    .line 642
    add-int/lit8 v1, v1, 0x1

    .line 643
    .line 644
    goto :goto_7

    .line 645
    :cond_21
    return-object v0

    .line 646
    :pswitch_4
    move-object/from16 v15, p1

    .line 647
    .line 648
    move-object/from16 v2, p3

    .line 649
    .line 650
    const/4 v4, 0x0

    .line 651
    invoke-static {v9, v4, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 652
    .line 653
    .line 654
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    if-nez v0, :cond_22

    .line 659
    .line 660
    sget-object v0, Ll/ewr0;->w0:Ll/ewr0;

    .line 661
    .line 662
    return-object v0

    .line 663
    :cond_22
    invoke-virtual {v15, v4}, Ll/bir0;->g(I)Ll/ewr0;

    .line 664
    .line 665
    .line 666
    move-result-object v0

    .line 667
    invoke-virtual {v15, v4}, Ll/bir0;->o(I)V

    .line 668
    .line 669
    .line 670
    return-object v0

    .line 671
    :pswitch_5
    move-object/from16 v15, p1

    .line 672
    .line 673
    move-object/from16 v6, p2

    .line 674
    .line 675
    move-object/from16 v2, p3

    .line 676
    .line 677
    const/4 v4, 0x0

    .line 678
    const/4 v5, 0x1

    .line 679
    invoke-static {v10, v5, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 680
    .line 681
    .line 682
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    check-cast v0, Ll/ewr0;

    .line 687
    .line 688
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 689
    .line 690
    .line 691
    move-result-object v0

    .line 692
    instance-of v1, v0, Ll/pxr0;

    .line 693
    .line 694
    if-eqz v1, :cond_24

    .line 695
    .line 696
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 697
    .line 698
    .line 699
    move-result v1

    .line 700
    if-eqz v1, :cond_23

    .line 701
    .line 702
    check-cast v0, Ll/pxr0;

    .line 703
    .line 704
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 705
    .line 706
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 707
    .line 708
    invoke-static {v15, v6, v0, v1, v2}, Ll/qes0;->b(Ll/bir0;Ll/gix0;Ll/mpr0;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/bir0;

    .line 709
    .line 710
    .line 711
    move-result-object v0

    .line 712
    invoke-virtual {v0}, Ll/bir0;->j()I

    .line 713
    .line 714
    .line 715
    move-result v0

    .line 716
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 717
    .line 718
    .line 719
    move-result v1

    .line 720
    if-eq v0, v1, :cond_23

    .line 721
    .line 722
    sget-object v0, Ll/ewr0;->C0:Ll/ewr0;

    .line 723
    .line 724
    return-object v0

    .line 725
    :cond_23
    sget-object v0, Ll/ewr0;->B0:Ll/ewr0;

    .line 726
    .line 727
    return-object v0

    .line 728
    :cond_24
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 729
    .line 730
    .line 731
    :goto_8
    const/4 v2, 0x0

    .line 732
    return-object v2

    .line 733
    :pswitch_6
    move-object/from16 v15, p1

    .line 734
    .line 735
    move-object/from16 v6, p2

    .line 736
    .line 737
    move-object/from16 v2, p3

    .line 738
    .line 739
    const/4 v5, 0x1

    .line 740
    invoke-static {v11, v5, v2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 741
    .line 742
    .line 743
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 744
    .line 745
    .line 746
    move-result v0

    .line 747
    const/4 v3, 0x2

    .line 748
    if-lt v0, v3, :cond_27

    .line 749
    .line 750
    invoke-virtual {v15}, Ll/bir0;->v()Ljava/util/List;

    .line 751
    .line 752
    .line 753
    move-result-object v0

    .line 754
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 755
    .line 756
    .line 757
    move-result v1

    .line 758
    if-nez v1, :cond_26

    .line 759
    .line 760
    const/4 v4, 0x0

    .line 761
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    check-cast v1, Ll/ewr0;

    .line 766
    .line 767
    invoke-virtual {v6, v1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    instance-of v2, v1, Ll/mpr0;

    .line 772
    .line 773
    if-eqz v2, :cond_25

    .line 774
    .line 775
    check-cast v1, Ll/mpr0;

    .line 776
    .line 777
    goto :goto_9

    .line 778
    :cond_25
    const-string v0, "Comparator should be a method"

    .line 779
    .line 780
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 781
    .line 782
    .line 783
    goto :goto_8

    .line 784
    :cond_26
    const/4 v1, 0x0

    .line 785
    :goto_9
    new-instance v2, Ll/ths0;

    .line 786
    .line 787
    invoke-direct {v2, v1, v6}, Ll/ths0;-><init>(Ll/mpr0;Ll/gix0;)V

    .line 788
    .line 789
    .line 790
    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 791
    .line 792
    .line 793
    invoke-virtual {v15}, Ll/bir0;->w()V

    .line 794
    .line 795
    .line 796
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 797
    .line 798
    .line 799
    move-result-object v0

    .line 800
    const/4 v3, 0x0

    .line 801
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 802
    .line 803
    .line 804
    move-result v1

    .line 805
    if-eqz v1, :cond_27

    .line 806
    .line 807
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 808
    .line 809
    .line 810
    move-result-object v1

    .line 811
    check-cast v1, Ll/ewr0;

    .line 812
    .line 813
    add-int/lit8 v2, v3, 0x1

    .line 814
    .line 815
    invoke-virtual {v15, v3, v1}, Ll/bir0;->p(ILl/ewr0;)V

    .line 816
    .line 817
    .line 818
    move v3, v2

    .line 819
    goto :goto_a

    .line 820
    :cond_27
    return-object v15

    .line 821
    :pswitch_7
    move-object/from16 v15, p1

    .line 822
    .line 823
    move-object/from16 v6, p2

    .line 824
    .line 825
    move-object/from16 v2, p3

    .line 826
    .line 827
    const/4 v5, 0x1

    .line 828
    invoke-static {v12, v5, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 829
    .line 830
    .line 831
    const/4 v4, 0x0

    .line 832
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 833
    .line 834
    .line 835
    move-result-object v0

    .line 836
    check-cast v0, Ll/ewr0;

    .line 837
    .line 838
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 839
    .line 840
    .line 841
    move-result-object v0

    .line 842
    instance-of v1, v0, Ll/mpr0;

    .line 843
    .line 844
    if-eqz v1, :cond_2b

    .line 845
    .line 846
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 847
    .line 848
    .line 849
    move-result v1

    .line 850
    if-eqz v1, :cond_2a

    .line 851
    .line 852
    check-cast v0, Ll/mpr0;

    .line 853
    .line 854
    invoke-virtual {v15}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 855
    .line 856
    .line 857
    move-result-object v1

    .line 858
    :cond_28
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 859
    .line 860
    .line 861
    move-result v2

    .line 862
    if-eqz v2, :cond_2a

    .line 863
    .line 864
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 865
    .line 866
    .line 867
    move-result-object v2

    .line 868
    check-cast v2, Ljava/lang/Integer;

    .line 869
    .line 870
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 871
    .line 872
    .line 873
    move-result v2

    .line 874
    invoke-virtual {v15, v2}, Ll/bir0;->r(I)Z

    .line 875
    .line 876
    .line 877
    move-result v3

    .line 878
    if-eqz v3, :cond_29

    .line 879
    .line 880
    invoke-virtual {v15, v2}, Ll/bir0;->g(I)Ll/ewr0;

    .line 881
    .line 882
    .line 883
    move-result-object v3

    .line 884
    new-instance v4, Ll/glr0;

    .line 885
    .line 886
    int-to-double v7, v2

    .line 887
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 888
    .line 889
    .line 890
    move-result-object v2

    .line 891
    invoke-direct {v4, v2}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 892
    .line 893
    .line 894
    const/4 v2, 0x3

    .line 895
    new-array v5, v2, [Ll/ewr0;

    .line 896
    .line 897
    const/16 v19, 0x0

    .line 898
    .line 899
    aput-object v3, v5, v19

    .line 900
    .line 901
    const/16 v16, 0x1

    .line 902
    .line 903
    aput-object v4, v5, v16

    .line 904
    .line 905
    const/16 v18, 0x2

    .line 906
    .line 907
    aput-object v15, v5, v18

    .line 908
    .line 909
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 910
    .line 911
    .line 912
    move-result-object v3

    .line 913
    invoke-virtual {v0, v6, v3}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 914
    .line 915
    .line 916
    move-result-object v3

    .line 917
    invoke-interface {v3}, Ll/ewr0;->zzd()Ljava/lang/Boolean;

    .line 918
    .line 919
    .line 920
    move-result-object v3

    .line 921
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 922
    .line 923
    .line 924
    move-result v3

    .line 925
    if-eqz v3, :cond_28

    .line 926
    .line 927
    sget-object v0, Ll/ewr0;->B0:Ll/ewr0;

    .line 928
    .line 929
    return-object v0

    .line 930
    :cond_29
    const/4 v2, 0x3

    .line 931
    goto :goto_b

    .line 932
    :cond_2a
    sget-object v0, Ll/ewr0;->C0:Ll/ewr0;

    .line 933
    .line 934
    return-object v0

    .line 935
    :cond_2b
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 936
    .line 937
    .line 938
    goto/16 :goto_8

    .line 939
    .line 940
    :pswitch_8
    move-object/from16 v15, p1

    .line 941
    .line 942
    move-object/from16 v6, p2

    .line 943
    .line 944
    move-object/from16 v2, p3

    .line 945
    .line 946
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 947
    .line 948
    .line 949
    move-result v0

    .line 950
    if-nez v0, :cond_2c

    .line 951
    .line 952
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 953
    .line 954
    .line 955
    move-result-object v0

    .line 956
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 957
    .line 958
    .line 959
    move-result v1

    .line 960
    if-eqz v1, :cond_2c

    .line 961
    .line 962
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 963
    .line 964
    .line 965
    move-result-object v1

    .line 966
    check-cast v1, Ll/ewr0;

    .line 967
    .line 968
    invoke-virtual {v6, v1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 969
    .line 970
    .line 971
    move-result-object v1

    .line 972
    invoke-virtual {v15, v1}, Ll/bir0;->i(Ll/ewr0;)V

    .line 973
    .line 974
    .line 975
    goto :goto_c

    .line 976
    :cond_2c
    new-instance v0, Ll/glr0;

    .line 977
    .line 978
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 979
    .line 980
    .line 981
    move-result v1

    .line 982
    int-to-double v1, v1

    .line 983
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 984
    .line 985
    .line 986
    move-result-object v1

    .line 987
    invoke-direct {v0, v1}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 988
    .line 989
    .line 990
    return-object v0

    .line 991
    :pswitch_9
    move-object/from16 v15, p1

    .line 992
    .line 993
    move-object/from16 v6, p2

    .line 994
    .line 995
    move-object/from16 v2, p3

    .line 996
    .line 997
    const/4 v5, 0x1

    .line 998
    invoke-static {v13, v5, v2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 999
    .line 1000
    .line 1001
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 1002
    .line 1003
    .line 1004
    move-result v0

    .line 1005
    if-nez v0, :cond_2d

    .line 1006
    .line 1007
    sget-object v0, Ll/ewr0;->D0:Ll/ewr0;

    .line 1008
    .line 1009
    return-object v0

    .line 1010
    :cond_2d
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 1011
    .line 1012
    .line 1013
    move-result v0

    .line 1014
    if-nez v0, :cond_30

    .line 1015
    .line 1016
    const/4 v4, 0x0

    .line 1017
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    check-cast v0, Ll/ewr0;

    .line 1022
    .line 1023
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v0

    .line 1027
    instance-of v1, v0, Ll/str0;

    .line 1028
    .line 1029
    if-nez v1, :cond_2f

    .line 1030
    .line 1031
    instance-of v1, v0, Ll/w4s0;

    .line 1032
    .line 1033
    if-eqz v1, :cond_2e

    .line 1034
    .line 1035
    goto :goto_d

    .line 1036
    :cond_2e
    invoke-interface {v0}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v0

    .line 1040
    goto :goto_e

    .line 1041
    :cond_2f
    :goto_d
    const-string v0, ""

    .line 1042
    .line 1043
    goto :goto_e

    .line 1044
    :cond_30
    const-string v0, ","

    .line 1045
    .line 1046
    :goto_e
    new-instance v1, Ll/vyr0;

    .line 1047
    .line 1048
    invoke-virtual {v15, v0}, Ll/bir0;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v0

    .line 1052
    invoke-direct {v1, v0}, Ll/vyr0;-><init>(Ljava/lang/String;)V

    .line 1053
    .line 1054
    .line 1055
    return-object v1

    .line 1056
    :pswitch_a
    move-object/from16 v15, p1

    .line 1057
    .line 1058
    move-object/from16 v2, p3

    .line 1059
    .line 1060
    const/4 v4, 0x0

    .line 1061
    invoke-static {v14, v4, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 1062
    .line 1063
    .line 1064
    invoke-virtual {v15}, Ll/bir0;->j()I

    .line 1065
    .line 1066
    .line 1067
    move-result v0

    .line 1068
    if-nez v0, :cond_31

    .line 1069
    .line 1070
    sget-object v0, Ll/ewr0;->w0:Ll/ewr0;

    .line 1071
    .line 1072
    return-object v0

    .line 1073
    :cond_31
    const/4 v5, 0x1

    .line 1074
    sub-int/2addr v0, v5

    .line 1075
    invoke-virtual {v15, v0}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1076
    .line 1077
    .line 1078
    move-result-object v1

    .line 1079
    invoke-virtual {v15, v0}, Ll/bir0;->o(I)V

    .line 1080
    .line 1081
    .line 1082
    return-object v1

    .line 1083
    :pswitch_b
    move-object/from16 v8, p1

    .line 1084
    .line 1085
    move-object/from16 v6, p2

    .line 1086
    .line 1087
    move-object/from16 v2, p3

    .line 1088
    .line 1089
    const/4 v4, 0x0

    .line 1090
    const/4 v5, 0x1

    .line 1091
    invoke-static {v15, v5, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 1092
    .line 1093
    .line 1094
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v0

    .line 1098
    check-cast v0, Ll/ewr0;

    .line 1099
    .line 1100
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v0

    .line 1104
    instance-of v1, v0, Ll/pxr0;

    .line 1105
    .line 1106
    if-eqz v1, :cond_33

    .line 1107
    .line 1108
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1109
    .line 1110
    .line 1111
    move-result v1

    .line 1112
    if-nez v1, :cond_32

    .line 1113
    .line 1114
    new-instance v0, Ll/bir0;

    .line 1115
    .line 1116
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 1117
    .line 1118
    .line 1119
    return-object v0

    .line 1120
    :cond_32
    check-cast v0, Ll/pxr0;

    .line 1121
    .line 1122
    invoke-static {v8, v6, v0}, Ll/qes0;->a(Ll/bir0;Ll/gix0;Ll/mpr0;)Ll/bir0;

    .line 1123
    .line 1124
    .line 1125
    move-result-object v0

    .line 1126
    return-object v0

    .line 1127
    :cond_33
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 1128
    .line 1129
    .line 1130
    goto/16 :goto_8

    .line 1131
    .line 1132
    :pswitch_c
    move-object/from16 v8, p1

    .line 1133
    .line 1134
    move-object/from16 v6, p2

    .line 1135
    .line 1136
    move-object/from16 v2, p3

    .line 1137
    .line 1138
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 1139
    .line 1140
    .line 1141
    move-result v0

    .line 1142
    if-nez v0, :cond_37

    .line 1143
    .line 1144
    new-instance v0, Ll/bir0;

    .line 1145
    .line 1146
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 1147
    .line 1148
    .line 1149
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v1

    .line 1153
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1154
    .line 1155
    .line 1156
    move-result v2

    .line 1157
    if-eqz v2, :cond_35

    .line 1158
    .line 1159
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v2

    .line 1163
    check-cast v2, Ll/ewr0;

    .line 1164
    .line 1165
    invoke-virtual {v6, v2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v2

    .line 1169
    instance-of v3, v2, Ll/rmr0;

    .line 1170
    .line 1171
    if-nez v3, :cond_34

    .line 1172
    .line 1173
    invoke-virtual {v0, v2}, Ll/bir0;->i(Ll/ewr0;)V

    .line 1174
    .line 1175
    .line 1176
    goto :goto_f

    .line 1177
    :cond_34
    const-string v0, "Argument evaluation failed"

    .line 1178
    .line 1179
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 1180
    .line 1181
    .line 1182
    goto/16 :goto_8

    .line 1183
    .line 1184
    :cond_35
    invoke-virtual {v0}, Ll/bir0;->j()I

    .line 1185
    .line 1186
    .line 1187
    move-result v1

    .line 1188
    invoke-virtual {v8}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v2

    .line 1192
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 1193
    .line 1194
    .line 1195
    move-result v3

    .line 1196
    if-eqz v3, :cond_36

    .line 1197
    .line 1198
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1199
    .line 1200
    .line 1201
    move-result-object v3

    .line 1202
    check-cast v3, Ljava/lang/Integer;

    .line 1203
    .line 1204
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1205
    .line 1206
    .line 1207
    move-result v4

    .line 1208
    add-int/2addr v4, v1

    .line 1209
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1210
    .line 1211
    .line 1212
    move-result v3

    .line 1213
    invoke-virtual {v8, v3}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v3

    .line 1217
    invoke-virtual {v0, v4, v3}, Ll/bir0;->p(ILl/ewr0;)V

    .line 1218
    .line 1219
    .line 1220
    goto :goto_10

    .line 1221
    :cond_36
    invoke-virtual {v8}, Ll/bir0;->w()V

    .line 1222
    .line 1223
    .line 1224
    invoke-virtual {v0}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 1225
    .line 1226
    .line 1227
    move-result-object v1

    .line 1228
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1229
    .line 1230
    .line 1231
    move-result v2

    .line 1232
    if-eqz v2, :cond_37

    .line 1233
    .line 1234
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v2

    .line 1238
    check-cast v2, Ljava/lang/Integer;

    .line 1239
    .line 1240
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1241
    .line 1242
    .line 1243
    move-result v3

    .line 1244
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1245
    .line 1246
    .line 1247
    move-result v2

    .line 1248
    invoke-virtual {v0, v2}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1249
    .line 1250
    .line 1251
    move-result-object v2

    .line 1252
    invoke-virtual {v8, v3, v2}, Ll/bir0;->p(ILl/ewr0;)V

    .line 1253
    .line 1254
    .line 1255
    goto :goto_11

    .line 1256
    :cond_37
    new-instance v0, Ll/glr0;

    .line 1257
    .line 1258
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1259
    .line 1260
    .line 1261
    move-result v1

    .line 1262
    int-to-double v1, v1

    .line 1263
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1264
    .line 1265
    .line 1266
    move-result-object v1

    .line 1267
    invoke-direct {v0, v1}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 1268
    .line 1269
    .line 1270
    return-object v0

    .line 1271
    :pswitch_d
    move-object/from16 v8, p1

    .line 1272
    .line 1273
    move-object/from16 v6, p2

    .line 1274
    .line 1275
    move-object/from16 v2, p3

    .line 1276
    .line 1277
    move-object/from16 v7, v17

    .line 1278
    .line 1279
    const/4 v3, 0x2

    .line 1280
    invoke-static {v5, v3, v2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 1281
    .line 1282
    .line 1283
    sget-object v3, Ll/ewr0;->w0:Ll/ewr0;

    .line 1284
    .line 1285
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 1286
    .line 1287
    .line 1288
    move-result v4

    .line 1289
    if-nez v4, :cond_38

    .line 1290
    .line 1291
    const/4 v4, 0x0

    .line 1292
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1293
    .line 1294
    .line 1295
    move-result-object v3

    .line 1296
    check-cast v3, Ll/ewr0;

    .line 1297
    .line 1298
    invoke-virtual {v6, v3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1299
    .line 1300
    .line 1301
    move-result-object v3

    .line 1302
    :cond_38
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1303
    .line 1304
    .line 1305
    move-result v4

    .line 1306
    const/4 v5, 0x1

    .line 1307
    sub-int/2addr v4, v5

    .line 1308
    int-to-double v9, v4

    .line 1309
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 1310
    .line 1311
    .line 1312
    move-result v4

    .line 1313
    if-le v4, v5, :cond_3a

    .line 1314
    .line 1315
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1316
    .line 1317
    .line 1318
    move-result-object v2

    .line 1319
    check-cast v2, Ll/ewr0;

    .line 1320
    .line 1321
    invoke-virtual {v6, v2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1322
    .line 1323
    .line 1324
    move-result-object v2

    .line 1325
    invoke-interface {v2}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 1326
    .line 1327
    .line 1328
    move-result-object v4

    .line 1329
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 1330
    .line 1331
    .line 1332
    move-result-wide v9

    .line 1333
    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    .line 1334
    .line 1335
    .line 1336
    move-result v4

    .line 1337
    if-eqz v4, :cond_39

    .line 1338
    .line 1339
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1340
    .line 1341
    .line 1342
    move-result v2

    .line 1343
    sub-int/2addr v2, v5

    .line 1344
    int-to-double v4, v2

    .line 1345
    :goto_12
    move-wide v9, v4

    .line 1346
    goto :goto_13

    .line 1347
    :cond_39
    invoke-interface {v2}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 1348
    .line 1349
    .line 1350
    move-result-object v2

    .line 1351
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 1352
    .line 1353
    .line 1354
    move-result-wide v4

    .line 1355
    invoke-static {v4, v5}, Ll/tqw0;->a(D)D

    .line 1356
    .line 1357
    .line 1358
    move-result-wide v4

    .line 1359
    goto :goto_12

    .line 1360
    :goto_13
    cmpg-double v2, v9, v0

    .line 1361
    .line 1362
    if-gez v2, :cond_3a

    .line 1363
    .line 1364
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1365
    .line 1366
    .line 1367
    move-result v2

    .line 1368
    int-to-double v4, v2

    .line 1369
    add-double/2addr v9, v4

    .line 1370
    :cond_3a
    cmpg-double v0, v9, v0

    .line 1371
    .line 1372
    if-gez v0, :cond_3b

    .line 1373
    .line 1374
    new-instance v0, Ll/glr0;

    .line 1375
    .line 1376
    invoke-direct {v0, v7}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 1377
    .line 1378
    .line 1379
    return-object v0

    .line 1380
    :cond_3b
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1381
    .line 1382
    .line 1383
    move-result v0

    .line 1384
    int-to-double v0, v0

    .line 1385
    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->min(DD)D

    .line 1386
    .line 1387
    .line 1388
    move-result-wide v0

    .line 1389
    double-to-int v0, v0

    .line 1390
    :goto_14
    if-ltz v0, :cond_3d

    .line 1391
    .line 1392
    invoke-virtual {v8, v0}, Ll/bir0;->r(I)Z

    .line 1393
    .line 1394
    .line 1395
    move-result v1

    .line 1396
    if-eqz v1, :cond_3c

    .line 1397
    .line 1398
    invoke-virtual {v8, v0}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v1

    .line 1402
    invoke-static {v1, v3}, Ll/tqw0;->h(Ll/ewr0;Ll/ewr0;)Z

    .line 1403
    .line 1404
    .line 1405
    move-result v1

    .line 1406
    if-eqz v1, :cond_3c

    .line 1407
    .line 1408
    new-instance v1, Ll/glr0;

    .line 1409
    .line 1410
    int-to-double v2, v0

    .line 1411
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v0

    .line 1415
    invoke-direct {v1, v0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 1416
    .line 1417
    .line 1418
    return-object v1

    .line 1419
    :cond_3c
    add-int/lit8 v0, v0, -0x1

    .line 1420
    .line 1421
    goto :goto_14

    .line 1422
    :cond_3d
    new-instance v0, Ll/glr0;

    .line 1423
    .line 1424
    invoke-direct {v0, v7}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 1425
    .line 1426
    .line 1427
    return-object v0

    .line 1428
    :pswitch_e
    move-object/from16 v8, p1

    .line 1429
    .line 1430
    move-object/from16 v6, p2

    .line 1431
    .line 1432
    move-object/from16 v2, p3

    .line 1433
    .line 1434
    move-object/from16 v0, v21

    .line 1435
    .line 1436
    const/4 v5, 0x1

    .line 1437
    invoke-static {v0, v5, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 1438
    .line 1439
    .line 1440
    const/4 v4, 0x0

    .line 1441
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1442
    .line 1443
    .line 1444
    move-result-object v0

    .line 1445
    check-cast v0, Ll/ewr0;

    .line 1446
    .line 1447
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1448
    .line 1449
    .line 1450
    move-result-object v0

    .line 1451
    instance-of v1, v0, Ll/pxr0;

    .line 1452
    .line 1453
    if-eqz v1, :cond_3f

    .line 1454
    .line 1455
    invoke-virtual {v8}, Ll/bir0;->f()I

    .line 1456
    .line 1457
    .line 1458
    move-result v1

    .line 1459
    if-nez v1, :cond_3e

    .line 1460
    .line 1461
    sget-object v0, Ll/ewr0;->w0:Ll/ewr0;

    .line 1462
    .line 1463
    return-object v0

    .line 1464
    :cond_3e
    check-cast v0, Ll/pxr0;

    .line 1465
    .line 1466
    invoke-static {v8, v6, v0}, Ll/qes0;->a(Ll/bir0;Ll/gix0;Ll/mpr0;)Ll/bir0;

    .line 1467
    .line 1468
    .line 1469
    sget-object v0, Ll/ewr0;->w0:Ll/ewr0;

    .line 1470
    .line 1471
    return-object v0

    .line 1472
    :cond_3f
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 1473
    .line 1474
    .line 1475
    goto/16 :goto_8

    .line 1476
    .line 1477
    :pswitch_f
    move-object/from16 v8, p1

    .line 1478
    .line 1479
    move-object/from16 v6, p2

    .line 1480
    .line 1481
    move-object/from16 v2, p3

    .line 1482
    .line 1483
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 1484
    .line 1485
    .line 1486
    move-result v0

    .line 1487
    if-eqz v0, :cond_40

    .line 1488
    .line 1489
    new-instance v0, Ll/bir0;

    .line 1490
    .line 1491
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 1492
    .line 1493
    .line 1494
    return-object v0

    .line 1495
    :cond_40
    const/4 v4, 0x0

    .line 1496
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1497
    .line 1498
    .line 1499
    move-result-object v0

    .line 1500
    check-cast v0, Ll/ewr0;

    .line 1501
    .line 1502
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1503
    .line 1504
    .line 1505
    move-result-object v0

    .line 1506
    invoke-interface {v0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 1507
    .line 1508
    .line 1509
    move-result-object v0

    .line 1510
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 1511
    .line 1512
    .line 1513
    move-result-wide v0

    .line 1514
    invoke-static {v0, v1}, Ll/tqw0;->a(D)D

    .line 1515
    .line 1516
    .line 1517
    move-result-wide v0

    .line 1518
    double-to-int v0, v0

    .line 1519
    if-gez v0, :cond_41

    .line 1520
    .line 1521
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1522
    .line 1523
    .line 1524
    move-result v1

    .line 1525
    add-int/2addr v0, v1

    .line 1526
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 1527
    .line 1528
    .line 1529
    move-result v0

    .line 1530
    goto :goto_15

    .line 1531
    :cond_41
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1532
    .line 1533
    .line 1534
    move-result v1

    .line 1535
    if-le v0, v1, :cond_42

    .line 1536
    .line 1537
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1538
    .line 1539
    .line 1540
    move-result v0

    .line 1541
    :cond_42
    :goto_15
    invoke-virtual {v8}, Ll/bir0;->j()I

    .line 1542
    .line 1543
    .line 1544
    move-result v1

    .line 1545
    new-instance v3, Ll/bir0;

    .line 1546
    .line 1547
    invoke-direct {v3}, Ll/bir0;-><init>()V

    .line 1548
    .line 1549
    .line 1550
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 1551
    .line 1552
    .line 1553
    move-result v4

    .line 1554
    const/4 v5, 0x1

    .line 1555
    if-le v4, v5, :cond_45

    .line 1556
    .line 1557
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1558
    .line 1559
    .line 1560
    move-result-object v4

    .line 1561
    check-cast v4, Ll/ewr0;

    .line 1562
    .line 1563
    invoke-virtual {v6, v4}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1564
    .line 1565
    .line 1566
    move-result-object v4

    .line 1567
    invoke-interface {v4}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 1568
    .line 1569
    .line 1570
    move-result-object v4

    .line 1571
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 1572
    .line 1573
    .line 1574
    move-result-wide v4

    .line 1575
    invoke-static {v4, v5}, Ll/tqw0;->a(D)D

    .line 1576
    .line 1577
    .line 1578
    move-result-wide v4

    .line 1579
    double-to-int v4, v4

    .line 1580
    const/4 v5, 0x0

    .line 1581
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 1582
    .line 1583
    .line 1584
    move-result v4

    .line 1585
    if-lez v4, :cond_43

    .line 1586
    .line 1587
    move v5, v0

    .line 1588
    :goto_16
    add-int v7, v0, v4

    .line 1589
    .line 1590
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 1591
    .line 1592
    .line 1593
    move-result v7

    .line 1594
    if-ge v5, v7, :cond_43

    .line 1595
    .line 1596
    invoke-virtual {v8, v0}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1597
    .line 1598
    .line 1599
    move-result-object v7

    .line 1600
    invoke-virtual {v3, v7}, Ll/bir0;->i(Ll/ewr0;)V

    .line 1601
    .line 1602
    .line 1603
    invoke-virtual {v8, v0}, Ll/bir0;->o(I)V

    .line 1604
    .line 1605
    .line 1606
    add-int/lit8 v5, v5, 0x1

    .line 1607
    .line 1608
    goto :goto_16

    .line 1609
    :cond_43
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 1610
    .line 1611
    .line 1612
    move-result v1

    .line 1613
    const/4 v9, 0x2

    .line 1614
    if-le v1, v9, :cond_46

    .line 1615
    .line 1616
    move v1, v9

    .line 1617
    :goto_17
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 1618
    .line 1619
    .line 1620
    move-result v4

    .line 1621
    if-ge v1, v4, :cond_46

    .line 1622
    .line 1623
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1624
    .line 1625
    .line 1626
    move-result-object v4

    .line 1627
    check-cast v4, Ll/ewr0;

    .line 1628
    .line 1629
    invoke-virtual {v6, v4}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1630
    .line 1631
    .line 1632
    move-result-object v4

    .line 1633
    instance-of v5, v4, Ll/rmr0;

    .line 1634
    .line 1635
    if-nez v5, :cond_44

    .line 1636
    .line 1637
    add-int v5, v0, v1

    .line 1638
    .line 1639
    sub-int/2addr v5, v9

    .line 1640
    invoke-virtual {v8, v5, v4}, Ll/bir0;->h(ILl/ewr0;)V

    .line 1641
    .line 1642
    .line 1643
    add-int/lit8 v1, v1, 0x1

    .line 1644
    .line 1645
    goto :goto_17

    .line 1646
    :cond_44
    const-string v0, "Failed to parse elements to add"

    .line 1647
    .line 1648
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 1649
    .line 1650
    .line 1651
    goto/16 :goto_8

    .line 1652
    .line 1653
    :cond_45
    :goto_18
    const/4 v2, 0x0

    .line 1654
    if-ge v0, v1, :cond_46

    .line 1655
    .line 1656
    invoke-virtual {v8, v0}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1657
    .line 1658
    .line 1659
    move-result-object v4

    .line 1660
    invoke-virtual {v3, v4}, Ll/bir0;->i(Ll/ewr0;)V

    .line 1661
    .line 1662
    .line 1663
    invoke-virtual {v8, v0, v2}, Ll/bir0;->p(ILl/ewr0;)V

    .line 1664
    .line 1665
    .line 1666
    add-int/lit8 v0, v0, 0x1

    .line 1667
    .line 1668
    goto :goto_18

    .line 1669
    :cond_46
    return-object v3

    .line 1670
    :pswitch_10
    move-object/from16 v8, p1

    .line 1671
    .line 1672
    move-object/from16 v6, p2

    .line 1673
    .line 1674
    move-object/from16 v2, p3

    .line 1675
    .line 1676
    const/4 v5, 0x1

    .line 1677
    invoke-static {v8, v6, v2, v5}, Ll/qes0;->d(Ll/bir0;Ll/gix0;Ljava/util/List;Z)Ll/ewr0;

    .line 1678
    .line 1679
    .line 1680
    move-result-object v0

    .line 1681
    return-object v0

    .line 1682
    :pswitch_11
    move-object/from16 v8, p1

    .line 1683
    .line 1684
    move-object/from16 v6, p2

    .line 1685
    .line 1686
    move-object/from16 v2, p3

    .line 1687
    .line 1688
    const/4 v5, 0x1

    .line 1689
    invoke-static {v4, v5, v2}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 1690
    .line 1691
    .line 1692
    const/4 v4, 0x0

    .line 1693
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1694
    .line 1695
    .line 1696
    move-result-object v0

    .line 1697
    check-cast v0, Ll/ewr0;

    .line 1698
    .line 1699
    invoke-virtual {v6, v0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1700
    .line 1701
    .line 1702
    move-result-object v0

    .line 1703
    instance-of v1, v0, Ll/pxr0;

    .line 1704
    .line 1705
    if-eqz v1, :cond_49

    .line 1706
    .line 1707
    invoke-virtual {v8}, Ll/bir0;->f()I

    .line 1708
    .line 1709
    .line 1710
    move-result v1

    .line 1711
    if-nez v1, :cond_47

    .line 1712
    .line 1713
    new-instance v0, Ll/bir0;

    .line 1714
    .line 1715
    invoke-direct {v0}, Ll/bir0;-><init>()V

    .line 1716
    .line 1717
    .line 1718
    return-object v0

    .line 1719
    :cond_47
    invoke-virtual {v8}, Ll/bir0;->zzc()Ll/ewr0;

    .line 1720
    .line 1721
    .line 1722
    move-result-object v1

    .line 1723
    check-cast v1, Ll/bir0;

    .line 1724
    .line 1725
    check-cast v0, Ll/pxr0;

    .line 1726
    .line 1727
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1728
    .line 1729
    const/4 v3, 0x0

    .line 1730
    invoke-static {v8, v6, v0, v3, v2}, Ll/qes0;->b(Ll/bir0;Ll/gix0;Ll/mpr0;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/bir0;

    .line 1731
    .line 1732
    .line 1733
    move-result-object v0

    .line 1734
    new-instance v2, Ll/bir0;

    .line 1735
    .line 1736
    invoke-direct {v2}, Ll/bir0;-><init>()V

    .line 1737
    .line 1738
    .line 1739
    invoke-virtual {v0}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 1740
    .line 1741
    .line 1742
    move-result-object v0

    .line 1743
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1744
    .line 1745
    .line 1746
    move-result v3

    .line 1747
    if-eqz v3, :cond_48

    .line 1748
    .line 1749
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1750
    .line 1751
    .line 1752
    move-result-object v3

    .line 1753
    check-cast v3, Ljava/lang/Integer;

    .line 1754
    .line 1755
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1756
    .line 1757
    .line 1758
    move-result v3

    .line 1759
    invoke-virtual {v1, v3}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1760
    .line 1761
    .line 1762
    move-result-object v3

    .line 1763
    invoke-virtual {v2, v3}, Ll/bir0;->i(Ll/ewr0;)V

    .line 1764
    .line 1765
    .line 1766
    goto :goto_19

    .line 1767
    :cond_48
    return-object v2

    .line 1768
    :cond_49
    invoke-static {v3}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 1769
    .line 1770
    .line 1771
    goto/16 :goto_8

    .line 1772
    .line 1773
    :pswitch_12
    move-object/from16 v8, p1

    .line 1774
    .line 1775
    move-object/from16 v6, p2

    .line 1776
    .line 1777
    move-object/from16 v2, p3

    .line 1778
    .line 1779
    invoke-virtual {v8}, Ll/bir0;->zzc()Ll/ewr0;

    .line 1780
    .line 1781
    .line 1782
    move-result-object v0

    .line 1783
    check-cast v0, Ll/bir0;

    .line 1784
    .line 1785
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 1786
    .line 1787
    .line 1788
    move-result v1

    .line 1789
    if-nez v1, :cond_4d

    .line 1790
    .line 1791
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1792
    .line 1793
    .line 1794
    move-result-object v1

    .line 1795
    :cond_4a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1796
    .line 1797
    .line 1798
    move-result v2

    .line 1799
    if-eqz v2, :cond_4d

    .line 1800
    .line 1801
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1802
    .line 1803
    .line 1804
    move-result-object v2

    .line 1805
    check-cast v2, Ll/ewr0;

    .line 1806
    .line 1807
    invoke-virtual {v6, v2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 1808
    .line 1809
    .line 1810
    move-result-object v2

    .line 1811
    instance-of v3, v2, Ll/rmr0;

    .line 1812
    .line 1813
    if-nez v3, :cond_4c

    .line 1814
    .line 1815
    invoke-virtual {v0}, Ll/bir0;->j()I

    .line 1816
    .line 1817
    .line 1818
    move-result v3

    .line 1819
    instance-of v4, v2, Ll/bir0;

    .line 1820
    .line 1821
    if-eqz v4, :cond_4b

    .line 1822
    .line 1823
    check-cast v2, Ll/bir0;

    .line 1824
    .line 1825
    invoke-virtual {v2}, Ll/bir0;->s()Ljava/util/Iterator;

    .line 1826
    .line 1827
    .line 1828
    move-result-object v4

    .line 1829
    :goto_1b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 1830
    .line 1831
    .line 1832
    move-result v5

    .line 1833
    if-eqz v5, :cond_4a

    .line 1834
    .line 1835
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1836
    .line 1837
    .line 1838
    move-result-object v5

    .line 1839
    check-cast v5, Ljava/lang/Integer;

    .line 1840
    .line 1841
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 1842
    .line 1843
    .line 1844
    move-result v7

    .line 1845
    add-int/2addr v7, v3

    .line 1846
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 1847
    .line 1848
    .line 1849
    move-result v5

    .line 1850
    invoke-virtual {v2, v5}, Ll/bir0;->g(I)Ll/ewr0;

    .line 1851
    .line 1852
    .line 1853
    move-result-object v5

    .line 1854
    invoke-virtual {v0, v7, v5}, Ll/bir0;->p(ILl/ewr0;)V

    .line 1855
    .line 1856
    .line 1857
    goto :goto_1b

    .line 1858
    :cond_4b
    invoke-virtual {v0, v3, v2}, Ll/bir0;->p(ILl/ewr0;)V

    .line 1859
    .line 1860
    .line 1861
    goto :goto_1a

    .line 1862
    :cond_4c
    const-string v0, "Failed evaluation of arguments"

    .line 1863
    .line 1864
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 1865
    .line 1866
    .line 1867
    goto/16 :goto_8

    .line 1868
    .line 1869
    :cond_4d
    return-object v0

    .line 1870
    :pswitch_13
    move-object/from16 v8, p1

    .line 1871
    .line 1872
    move-object/from16 v3, p3

    .line 1873
    .line 1874
    const/4 v4, 0x0

    .line 1875
    invoke-static {v2, v4, v3}, Ll/tqw0;->g(Ljava/lang/String;ILjava/util/List;)V

    .line 1876
    .line 1877
    .line 1878
    new-instance v0, Ll/vyr0;

    .line 1879
    .line 1880
    invoke-virtual {v8}, Ll/bir0;->toString()Ljava/lang/String;

    .line 1881
    .line 1882
    .line 1883
    move-result-object v1

    .line 1884
    invoke-direct {v0, v1}, Ll/vyr0;-><init>(Ljava/lang/String;)V

    .line 1885
    .line 1886
    .line 1887
    return-object v0

    .line 1888
    nop

    :sswitch_data_0
    .sparse-switch
        -0x69e9ad94 -> :sswitch_13
        -0x50c088ec -> :sswitch_12
        -0x4bf73488 -> :sswitch_11
        -0x37b90a9a -> :sswitch_10
        -0x3565b984 -> :sswitch_f
        -0x28732996 -> :sswitch_e
        -0x1bdda92d -> :sswitch_d
        -0x108c6a77 -> :sswitch_c
        0x1a55c -> :sswitch_b
        0x1b251 -> :sswitch_a
        0x31dd2a -> :sswitch_9
        0x34af1a -> :sswitch_8
        0x35f4f4 -> :sswitch_7
        0x35f59e -> :sswitch_6
        0x5c6731b -> :sswitch_5
        0x6856c82 -> :sswitch_4
        0x6873d92 -> :sswitch_3
        0x398d4c56 -> :sswitch_2
        0x418e52e2 -> :sswitch_1
        0x73d44649 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d(Ll/bir0;Ll/gix0;Ljava/util/List;Z)Ll/ewr0;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bir0;",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;Z)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    const-string v0, "reduce"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1, p2}, Ll/tqw0;->k(Ljava/lang/String;ILjava/util/List;)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-static {v0, v2, p2}, Ll/tqw0;->n(Ljava/lang/String;ILjava/util/List;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Ll/ewr0;

    .line 17
    .line 18
    invoke-virtual {p1, v3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v4, v3, Ll/mpr0;

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    if-eqz v4, :cond_a

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-ne v4, v2, :cond_1

    .line 32
    .line 33
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ll/ewr0;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    instance-of v4, p2, Ll/rmr0;

    .line 44
    .line 45
    if-nez v4, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p0, "Failed to parse initial value"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v5

    .line 54
    :cond_1
    invoke-virtual {p0}, Ll/bir0;->j()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_9

    .line 59
    .line 60
    move-object p2, v5

    .line 61
    :goto_0
    check-cast v3, Ll/mpr0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/bir0;->j()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz p3, :cond_2

    .line 68
    .line 69
    move v6, v0

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    add-int/lit8 v6, v4, -0x1

    .line 72
    .line 73
    :goto_1
    if-eqz p3, :cond_3

    .line 74
    .line 75
    sub-int/2addr v4, v1

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    move v4, v0

    .line 78
    :goto_2
    if-eqz p3, :cond_4

    .line 79
    .line 80
    move p3, v1

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    const/4 p3, -0x1

    .line 83
    :goto_3
    if-nez p2, :cond_5

    .line 84
    .line 85
    invoke-virtual {p0, v6}, Ll/bir0;->g(I)Ll/ewr0;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    goto :goto_5

    .line 90
    :cond_5
    :goto_4
    sub-int v7, v4, v6

    .line 91
    .line 92
    mul-int/2addr v7, p3

    .line 93
    if-ltz v7, :cond_8

    .line 94
    .line 95
    invoke-virtual {p0, v6}, Ll/bir0;->r(I)Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-eqz v7, :cond_7

    .line 100
    .line 101
    invoke-virtual {p0, v6}, Ll/bir0;->g(I)Ll/ewr0;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    new-instance v8, Ll/glr0;

    .line 106
    .line 107
    int-to-double v9, v6

    .line 108
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 109
    .line 110
    .line 111
    move-result-object v9

    .line 112
    invoke-direct {v8, v9}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 113
    .line 114
    .line 115
    const/4 v9, 0x4

    .line 116
    new-array v9, v9, [Ll/ewr0;

    .line 117
    .line 118
    aput-object p2, v9, v0

    .line 119
    .line 120
    aput-object v7, v9, v1

    .line 121
    .line 122
    aput-object v8, v9, v2

    .line 123
    .line 124
    const/4 p2, 0x3

    .line 125
    aput-object p0, v9, p2

    .line 126
    .line 127
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {v3, p1, p2}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    instance-of v7, p2, Ll/rmr0;

    .line 136
    .line 137
    if-nez v7, :cond_6

    .line 138
    .line 139
    goto :goto_5

    .line 140
    :cond_6
    const-string p0, "Reduce operation failed"

    .line 141
    .line 142
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-object v5

    .line 146
    :cond_7
    :goto_5
    add-int/2addr v6, p3

    .line 147
    goto :goto_4

    .line 148
    :cond_8
    return-object p2

    .line 149
    :cond_9
    const-string p0, "Empty array with no initial value error"

    .line 150
    .line 151
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v5

    .line 155
    :cond_a
    const-string p0, "Callback should be a method"

    .line 156
    .line 157
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-object v5
.end method
