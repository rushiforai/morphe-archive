.class public final Ll/mrg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/gug0;


# direct methods
.method public constructor <init>(Ll/gug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mrg0;->a:Ll/gug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/mrg0;->a:Ll/gug0;

    .line 6
    .line 7
    iget-object v2, v2, Ll/gug0;->h:Ll/bgg0;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v2, v0, v3}, Ll/bgg0;->b(ILorg/json/JSONObject;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x5

    .line 14
    const-string v4, "ProxySudFSTAPPImpl"

    .line 15
    .line 16
    const-string v5, "isOpenUnityMultiProcess:"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    const/4 v7, 0x1

    .line 20
    if-ne v7, v0, :cond_7

    .line 21
    .line 22
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 23
    .line 24
    iget-object v8, v0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget v0, v0, Ll/gug0;->g:I

    .line 27
    .line 28
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/gmg0;

    .line 33
    .line 34
    iget-object v8, v1, Ll/mrg0;->a:Ll/gug0;

    .line 35
    .line 36
    iget-object v0, v0, Ll/gmg0;->d:Ltech/sud/gip/core/GameInfo;

    .line 37
    .line 38
    iput-object v0, v8, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 39
    .line 40
    iget-object v8, v8, Ll/gug0;->h:Ll/bgg0;

    .line 41
    .line 42
    iget-object v0, v0, Ltech/sud/gip/core/GameInfo;->bigLoadingPic:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v8, v0}, Ll/bgg0;->f(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 48
    .line 49
    iget-object v8, v0, Ll/gug0;->f:Ll/dog0;

    .line 50
    .line 51
    iget-object v9, v0, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 52
    .line 53
    check-cast v8, Ll/krg0;

    .line 54
    .line 55
    if-eqz v9, :cond_6

    .line 56
    .line 57
    iget-object v0, v8, Ll/krg0;->a:Ll/dhg0;

    .line 58
    .line 59
    iget-object v10, v9, Ltech/sud/gip/core/GameInfo;->gameLargeModelCfg:Ll/xlg0;

    .line 60
    .line 61
    iput-object v10, v0, Ll/dhg0;->D:Ll/xlg0;

    .line 62
    .line 63
    iget-object v11, v0, Ll/dhg0;->B:Ll/rog0;

    .line 64
    .line 65
    if-eqz v11, :cond_0

    .line 66
    .line 67
    if-eqz v10, :cond_0

    .line 68
    .line 69
    iget-boolean v12, v10, Ll/xlg0;->a:Z

    .line 70
    .line 71
    iput-boolean v12, v11, Ll/rog0;->m:Z

    .line 72
    .line 73
    iget-boolean v10, v10, Ll/xlg0;->c:Z

    .line 74
    .line 75
    iput-boolean v10, v11, Ll/rog0;->n:Z

    .line 76
    .line 77
    :cond_0
    iput-object v9, v0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 78
    .line 79
    iget-object v0, v0, Ll/dhg0;->u:Ll/wyg0;

    .line 80
    .line 81
    iget-object v10, v9, Ltech/sud/gip/core/GameInfo;->dynamicConfig:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    new-instance v11, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v12, "setDynamicConfigJson dynamicConfig = "

    .line 89
    .line 90
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v11

    .line 100
    const-string v13, "SudFSMMGStateHandlerImpl"

    .line 101
    .line 102
    invoke-static {v13, v11}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    sget-object v11, Ll/wyg0;->n:Ljava/lang/String;

    .line 106
    .line 107
    new-instance v13, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    invoke-static {v11, v12}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iput-object v10, v0, Ll/wyg0;->h:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v0, v8, Ll/krg0;->a:Ll/dhg0;

    .line 125
    .line 126
    iget-object v10, v0, Ll/dhg0;->u:Ll/wyg0;

    .line 127
    .line 128
    iget-object v0, v0, Ll/dhg0;->a:Ltech/sud/gip/core/SudLoadMGParamModel;

    .line 129
    .line 130
    iget-object v0, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->authorizationSecret:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    if-eqz v0, :cond_1

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 138
    .line 139
    .line 140
    move-result v11

    .line 141
    if-lez v11, :cond_1

    .line 142
    .line 143
    :try_start_0
    new-instance v11, Lorg/json/JSONObject;

    .line 144
    .line 145
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v12, "authorization_secret"

    .line 149
    .line 150
    invoke-virtual {v11, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, v10, Ll/wyg0;->i:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :catch_0
    move-exception v0

    .line 161
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 162
    .line 163
    .line 164
    :cond_1
    :goto_0
    iget v0, v9, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 165
    .line 166
    if-ne v7, v0, :cond_4

    .line 167
    .line 168
    iget-object v0, v8, Ll/krg0;->a:Ll/dhg0;

    .line 169
    .line 170
    new-instance v9, Ll/mzg0;

    .line 171
    .line 172
    iget-object v8, v8, Ll/krg0;->a:Ll/dhg0;

    .line 173
    .line 174
    iget-object v10, v8, Ll/dhg0;->b:Landroid/app/Activity;

    .line 175
    .line 176
    iget-object v11, v8, Ll/dhg0;->c:Ljava/lang/String;

    .line 177
    .line 178
    iget-wide v12, v8, Ll/dhg0;->e:J

    .line 179
    .line 180
    iget-object v14, v8, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 181
    .line 182
    iget-object v15, v8, Ll/dhg0;->u:Ll/wyg0;

    .line 183
    .line 184
    invoke-direct/range {v9 .. v15}, Ll/mzg0;-><init>(Landroid/app/Activity;Ljava/lang/String;JLandroid/widget/FrameLayout;Ll/wyg0;)V

    .line 185
    .line 186
    .line 187
    iput-object v9, v0, Ll/dhg0;->m:Ll/lug0;

    .line 188
    .line 189
    sget v0, Ll/utg0;->f:I

    .line 190
    .line 191
    const/4 v8, 0x4

    .line 192
    if-eq v0, v8, :cond_3

    .line 193
    .line 194
    const/4 v8, 0x3

    .line 195
    if-ne v0, v8, :cond_2

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_2
    sput-boolean v6, Ll/mzg0;->m:Z

    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_3
    :goto_1
    sput-boolean v7, Ll/mzg0;->m:Z

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_4
    if-ne v2, v0, :cond_7

    .line 205
    .line 206
    iget-object v0, v8, Ll/krg0;->a:Ll/dhg0;

    .line 207
    .line 208
    invoke-static {}, Ll/utg0;->f()Z

    .line 209
    .line 210
    .line 211
    move-result v9

    .line 212
    iput-boolean v9, v0, Ll/dhg0;->A:Z

    .line 213
    .line 214
    iget-object v0, v8, Ll/krg0;->a:Ll/dhg0;

    .line 215
    .line 216
    sget-object v9, Ll/dhg0;->F:Ljava/lang/String;

    .line 217
    .line 218
    new-instance v10, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v10, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    iget-boolean v11, v0, Ll/dhg0;->A:Z

    .line 224
    .line 225
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v10

    .line 232
    invoke-static {v9, v10}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    new-instance v9, Ljava/lang/StringBuilder;

    .line 236
    .line 237
    invoke-direct {v9, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-boolean v10, v0, Ll/dhg0;->A:Z

    .line 241
    .line 242
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v9

    .line 249
    invoke-static {v4, v9}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    iget-boolean v0, v0, Ll/dhg0;->A:Z

    .line 253
    .line 254
    iget-object v8, v8, Ll/krg0;->a:Ll/dhg0;

    .line 255
    .line 256
    if-eqz v0, :cond_5

    .line 257
    .line 258
    new-instance v0, Ll/blg0;

    .line 259
    .line 260
    invoke-direct {v0}, Ll/blg0;-><init>()V

    .line 261
    .line 262
    .line 263
    iput-object v0, v8, Ll/dhg0;->m:Ll/lug0;

    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_5
    new-instance v0, Ll/alg0;

    .line 267
    .line 268
    invoke-direct {v0}, Ll/alg0;-><init>()V

    .line 269
    .line 270
    .line 271
    iput-object v0, v8, Ll/dhg0;->m:Ll/lug0;

    .line 272
    .line 273
    goto :goto_2

    .line 274
    :cond_6
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    .line 276
    .line 277
    :cond_7
    :goto_2
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 278
    .line 279
    iget v8, v0, Ll/gug0;->g:I

    .line 280
    .line 281
    add-int/2addr v8, v7

    .line 282
    iput v8, v0, Ll/gug0;->g:I

    .line 283
    .line 284
    iget-object v0, v0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 285
    .line 286
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-lt v8, v0, :cond_13

    .line 291
    .line 292
    const-string v0, "SudGameLoadingModel"

    .line 293
    .line 294
    const-string v8, "loading finish"

    .line 295
    .line 296
    invoke-static {v0, v8}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    sget-object v0, Ll/gug0;->i:Ljava/lang/String;

    .line 300
    .line 301
    invoke-static {v0, v8}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 305
    .line 306
    iget-object v0, v0, Ll/gug0;->a:Landroid/content/Context;

    .line 307
    .line 308
    if-eqz v0, :cond_8

    .line 309
    .line 310
    sget v8, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_launch_game:I

    .line 311
    .line 312
    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v1, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    :cond_8
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 320
    .line 321
    iget-object v0, v0, Ll/gug0;->h:Ll/bgg0;

    .line 322
    .line 323
    if-eqz v0, :cond_9

    .line 324
    .line 325
    const-string v0, "SudGameLoadingNormalViewModel"

    .line 326
    .line 327
    const-string v8, "loading complete"

    .line 328
    .line 329
    invoke-static {v0, v8}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    sget-object v0, Ll/bgg0;->v:Ljava/lang/String;

    .line 333
    .line 334
    invoke-static {v0, v8}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    :cond_9
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 338
    .line 339
    iget-object v1, v0, Ll/gug0;->f:Ll/dog0;

    .line 340
    .line 341
    iget-object v0, v0, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 342
    .line 343
    check-cast v1, Ll/krg0;

    .line 344
    .line 345
    if-eqz v0, :cond_12

    .line 346
    .line 347
    iget-object v1, v1, Ll/krg0;->a:Ll/dhg0;

    .line 348
    .line 349
    iget-object v8, v0, Ltech/sud/gip/core/GameInfo;->gamePath:Ljava/lang/String;

    .line 350
    .line 351
    iput-object v0, v1, Ll/dhg0;->x:Ltech/sud/gip/core/GameInfo;

    .line 352
    .line 353
    iput-object v8, v1, Ll/dhg0;->y:Ljava/lang/String;

    .line 354
    .line 355
    const-string v9, "_startGame"

    .line 356
    .line 357
    invoke-static {v4, v9}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    sget-object v9, Ll/dhg0;->F:Ljava/lang/String;

    .line 361
    .line 362
    const-string v10, "proxy _startGame"

    .line 363
    .line 364
    invoke-static {v9, v10}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    iget-boolean v10, v1, Ll/dhg0;->k:Z

    .line 368
    .line 369
    if-nez v10, :cond_14

    .line 370
    .line 371
    iget-object v10, v1, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 372
    .line 373
    if-eqz v10, :cond_14

    .line 374
    .line 375
    iget-object v10, v1, Ll/dhg0;->m:Ll/lug0;

    .line 376
    .line 377
    if-nez v10, :cond_a

    .line 378
    .line 379
    goto/16 :goto_5

    .line 380
    .line 381
    :cond_a
    iget-object v11, v1, Ll/dhg0;->w:Ll/iug0;

    .line 382
    .line 383
    invoke-virtual {v10, v11}, Ll/lug0;->a(Ll/iog0;)V

    .line 384
    .line 385
    .line 386
    iget v10, v0, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 387
    .line 388
    if-ne v7, v10, :cond_b

    .line 389
    .line 390
    iget-object v2, v1, Ll/dhg0;->m:Ll/lug0;

    .line 391
    .line 392
    invoke-virtual {v2, v0, v8}, Ll/lug0;->b(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    goto :goto_3

    .line 396
    :cond_b
    if-ne v2, v10, :cond_14

    .line 397
    .line 398
    new-instance v2, Ljava/lang/StringBuilder;

    .line 399
    .line 400
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    iget-boolean v10, v1, Ll/dhg0;->A:Z

    .line 404
    .line 405
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    invoke-static {v9, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    new-instance v2, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    iget-boolean v5, v1, Ll/dhg0;->A:Z

    .line 421
    .line 422
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    invoke-static {v4, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 430
    .line 431
    .line 432
    iget-boolean v2, v1, Ll/dhg0;->A:Z

    .line 433
    .line 434
    iget-object v4, v1, Ll/dhg0;->w:Ll/iug0;

    .line 435
    .line 436
    if-eqz v2, :cond_c

    .line 437
    .line 438
    iput-boolean v7, v4, Ll/iug0;->o:Z

    .line 439
    .line 440
    iget-object v2, v1, Ll/dhg0;->m:Ll/lug0;

    .line 441
    .line 442
    invoke-virtual {v2, v0, v8}, Ll/lug0;->b(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    goto :goto_3

    .line 446
    :cond_c
    iput-boolean v6, v4, Ll/iug0;->o:Z

    .line 447
    .line 448
    iget-object v2, v1, Ll/dhg0;->m:Ll/lug0;

    .line 449
    .line 450
    invoke-virtual {v2, v0, v8}, Ll/lug0;->b(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    :goto_3
    sget v2, Ll/utg0;->f:I

    .line 454
    .line 455
    const/4 v4, 0x2

    .line 456
    if-ne v2, v4, :cond_f

    .line 457
    .line 458
    iget-object v2, v1, Ll/dhg0;->b:Landroid/app/Activity;

    .line 459
    .line 460
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    sget v5, Ltech/sud/gip/R$layout;->fsm_mgp_game_running_sud_test_logo:I

    .line 465
    .line 466
    invoke-virtual {v2, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 471
    .line 472
    const v5, 0x800055

    .line 473
    .line 474
    .line 475
    const/4 v8, -0x2

    .line 476
    invoke-direct {v3, v8, v8, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 477
    .line 478
    .line 479
    iget-object v5, v1, Ll/dhg0;->b:Landroid/app/Activity;

    .line 480
    .line 481
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 482
    .line 483
    .line 484
    move-result-object v5

    .line 485
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 486
    .line 487
    .line 488
    move-result-object v5

    .line 489
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    .line 490
    .line 491
    const/high16 v8, 0x41200000    # 10.0f

    .line 492
    .line 493
    mul-float/2addr v5, v8

    .line 494
    const/high16 v9, 0x3f000000    # 0.5f

    .line 495
    .line 496
    add-float/2addr v5, v9

    .line 497
    float-to-int v5, v5

    .line 498
    iget-object v10, v1, Ll/dhg0;->b:Landroid/app/Activity;

    .line 499
    .line 500
    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 501
    .line 502
    .line 503
    move-result-object v10

    .line 504
    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 505
    .line 506
    .line 507
    move-result-object v10

    .line 508
    iget v10, v10, Landroid/util/DisplayMetrics;->density:F

    .line 509
    .line 510
    mul-float/2addr v8, v10

    .line 511
    add-float/2addr v8, v9

    .line 512
    float-to-int v8, v8

    .line 513
    invoke-virtual {v3, v6, v6, v5, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 514
    .line 515
    .line 516
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 517
    .line 518
    .line 519
    sget v3, Ltech/sud/gip/R$id;->fsm_mgp_game_running_only_test:I

    .line 520
    .line 521
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 522
    .line 523
    .line 524
    move-result-object v3

    .line 525
    check-cast v3, Landroid/widget/TextView;

    .line 526
    .line 527
    sget-object v5, Ll/utg0;->d:Ljava/lang/String;

    .line 528
    .line 529
    if-eqz v5, :cond_e

    .line 530
    .line 531
    invoke-virtual {v5, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 532
    .line 533
    .line 534
    move-result-object v4

    .line 535
    const-string v5, "zh"

    .line 536
    .line 537
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result v4

    .line 541
    if-eqz v4, :cond_e

    .line 542
    .line 543
    sget-object v4, Ll/utg0;->d:Ljava/lang/String;

    .line 544
    .line 545
    const-string v5, "zh-CN"

    .line 546
    .line 547
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 548
    .line 549
    .line 550
    move-result v4

    .line 551
    if-eqz v4, :cond_d

    .line 552
    .line 553
    const-string v4, "\u4ec5\u4f9b\u6d4b\u8bd5"

    .line 554
    .line 555
    goto :goto_4

    .line 556
    :cond_d
    const-string v4, "\u50c5\u4f9b\u6e2c\u8a66"

    .line 557
    .line 558
    goto :goto_4

    .line 559
    :cond_e
    const-string v4, "Only Test"

    .line 560
    .line 561
    :goto_4
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 562
    .line 563
    .line 564
    iget-object v3, v1, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 565
    .line 566
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 567
    .line 568
    .line 569
    :cond_f
    iget-object v2, v1, Ll/dhg0;->w:Ll/iug0;

    .line 570
    .line 571
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 572
    .line 573
    .line 574
    const-string v3, "LoadGameStatsManager"

    .line 575
    .line 576
    const-string v4, "onStartGame"

    .line 577
    .line 578
    invoke-static {v3, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    iput-boolean v7, v2, Ll/iug0;->f:Z

    .line 582
    .line 583
    invoke-virtual {v2, v7}, Ll/iug0;->e(Z)V

    .line 584
    .line 585
    .line 586
    iget-object v2, v1, Ll/dhg0;->C:Ll/qug0;

    .line 587
    .line 588
    if-nez v2, :cond_14

    .line 589
    .line 590
    iget-object v0, v0, Ltech/sud/gip/core/GameInfo;->gameLargeModelCfg:Ll/xlg0;

    .line 591
    .line 592
    if-eqz v0, :cond_10

    .line 593
    .line 594
    iget-boolean v6, v0, Ll/xlg0;->b:Z

    .line 595
    .line 596
    :cond_10
    if-eqz v6, :cond_14

    .line 597
    .line 598
    new-instance v8, Ll/qug0;

    .line 599
    .line 600
    sget-object v9, Ll/utg0;->g:Ljava/lang/String;

    .line 601
    .line 602
    iget-object v10, v1, Ll/dhg0;->c:Ljava/lang/String;

    .line 603
    .line 604
    iget-object v11, v1, Ll/dhg0;->d:Ljava/lang/String;

    .line 605
    .line 606
    iget-wide v12, v1, Ll/dhg0;->e:J

    .line 607
    .line 608
    new-instance v14, Ll/zfg0;

    .line 609
    .line 610
    invoke-direct {v14, v1}, Ll/zfg0;-><init>(Ll/dhg0;)V

    .line 611
    .line 612
    .line 613
    invoke-direct/range {v8 .. v14}, Ll/qug0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLl/zfg0;)V

    .line 614
    .line 615
    .line 616
    iput-object v8, v1, Ll/dhg0;->C:Ll/qug0;

    .line 617
    .line 618
    iget-object v0, v8, Ll/qug0;->a:Ljava/lang/String;

    .line 619
    .line 620
    new-instance v1, Ljava/lang/StringBuilder;

    .line 621
    .line 622
    const-string v2, "start curIsRunning:"

    .line 623
    .line 624
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 625
    .line 626
    .line 627
    iget-object v3, v8, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 628
    .line 629
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 630
    .line 631
    .line 632
    move-result v3

    .line 633
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 634
    .line 635
    .line 636
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v1

    .line 640
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    .line 642
    .line 643
    new-instance v0, Ljava/lang/StringBuilder;

    .line 644
    .line 645
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    iget-object v1, v8, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 649
    .line 650
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 651
    .line 652
    .line 653
    move-result v1

    .line 654
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    const-string v1, "SudGIPWebSocket"

    .line 662
    .line 663
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 664
    .line 665
    .line 666
    iget-object v0, v8, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 667
    .line 668
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 669
    .line 670
    .line 671
    move-result v0

    .line 672
    if-eqz v0, :cond_11

    .line 673
    .line 674
    goto :goto_5

    .line 675
    :cond_11
    iget-object v0, v8, Ll/qug0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 676
    .line 677
    invoke-virtual {v0, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 678
    .line 679
    .line 680
    invoke-virtual {v8}, Ll/qug0;->a()V

    .line 681
    .line 682
    .line 683
    goto :goto_5

    .line 684
    :cond_12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 685
    .line 686
    .line 687
    goto :goto_5

    .line 688
    :cond_13
    iget-object v0, v1, Ll/mrg0;->a:Ll/gug0;

    .line 689
    .line 690
    iget-object v2, v0, Ll/gug0;->d:Ljava/util/ArrayList;

    .line 691
    .line 692
    iget v0, v0, Ll/gug0;->g:I

    .line 693
    .line 694
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 695
    .line 696
    .line 697
    move-result-object v0

    .line 698
    check-cast v0, Ll/bkg0;

    .line 699
    .line 700
    iget-object v1, v1, Ll/mrg0;->a:Ll/gug0;

    .line 701
    .line 702
    iget-object v2, v1, Ll/gug0;->e:Ltech/sud/gip/core/GameInfo;

    .line 703
    .line 704
    iget v3, v1, Ll/gug0;->b:I

    .line 705
    .line 706
    iget-object v1, v1, Ll/gug0;->c:Ljava/lang/String;

    .line 707
    .line 708
    invoke-interface {v0, v2, v3, v1}, Ll/bkg0;->a(Ltech/sud/gip/core/GameInfo;ILjava/lang/String;)V

    .line 709
    .line 710
    .line 711
    :cond_14
    :goto_5
    return-void
.end method

.method public final b(IILjava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "loading failed="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "SudGameLoadingModel"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/gug0;->i:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/mrg0;->a:Ll/gug0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/gug0;->h:Ll/bgg0;

    .line 40
    .line 41
    if-eqz p0, :cond_9

    .line 42
    .line 43
    sget-boolean v0, Ll/nkg0;->a:Z

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    const/4 v2, 0x1

    .line 47
    if-eqz v0, :cond_5

    .line 48
    .line 49
    iget-object v0, p0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 50
    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    if-eq p1, v2, :cond_4

    .line 57
    .line 58
    if-eq p1, v1, :cond_3

    .line 59
    .line 60
    const/4 v4, 0x3

    .line 61
    if-eq p1, v4, :cond_2

    .line 62
    .line 63
    const/4 v4, 0x4

    .line 64
    if-eq p1, v4, :cond_1

    .line 65
    .line 66
    const/4 v4, 0x5

    .line 67
    if-eq p1, v4, :cond_0

    .line 68
    .line 69
    const-string p1, "null"

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const-string p1, "LoadGame"

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    const-string p1, "LoadPlugin"

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    const-string p1, "LoadPackage"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    const-string p1, "LoadCore"

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    const-string p1, "GetMGInfo"

    .line 85
    .line 86
    :goto_0
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p1, " "

    .line 90
    .line 91
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    :cond_5
    iget-object p1, p0, Ll/wmg0;->a:Ll/aog0;

    .line 105
    .line 106
    iget v0, p0, Ll/bgg0;->c:I

    .line 107
    .line 108
    iget-object p1, p1, Ll/aog0;->a:Ll/dhg0;

    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-virtual {p1, v1, p2, v0, v3}, Ll/dhg0;->b(IIIZ)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/bgg0;->g()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ll/bgg0;->a()V

    .line 118
    .line 119
    .line 120
    iget p1, p0, Ll/bgg0;->d:I

    .line 121
    .line 122
    invoke-virtual {p0, p2, v2, p1, v3}, Ll/bgg0;->c(IZIZ)V

    .line 123
    .line 124
    .line 125
    iget-boolean p1, p0, Ll/bgg0;->s:Z

    .line 126
    .line 127
    if-nez p1, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Ll/bgg0;->g:Landroid/widget/TextView;

    .line 130
    .line 131
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    :cond_6
    iget-object p0, p0, Ll/wmg0;->a:Ll/aog0;

    .line 135
    .line 136
    iget-object p0, p0, Ll/aog0;->a:Ll/dhg0;

    .line 137
    .line 138
    iput-boolean v2, p0, Ll/dhg0;->i:Z

    .line 139
    .line 140
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 141
    .line 142
    iget-object p1, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 143
    .line 144
    invoke-virtual {p1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 148
    .line 149
    invoke-virtual {p1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 153
    .line 154
    invoke-virtual {p1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Ll/iug0;->a()V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 161
    .line 162
    if-eqz p1, :cond_7

    .line 163
    .line 164
    iput p2, p1, Ll/ukg0;->e:I

    .line 165
    .line 166
    :cond_7
    if-eqz p1, :cond_8

    .line 167
    .line 168
    if-eqz p3, :cond_8

    .line 169
    .line 170
    iput-object p3, p1, Ll/ukg0;->f:Ljava/lang/String;

    .line 171
    .line 172
    :cond_8
    invoke-virtual {p0}, Ll/iug0;->h()V

    .line 173
    .line 174
    .line 175
    :cond_9
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mrg0;->a:Ll/gug0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gug0;->h:Ll/bgg0;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-boolean v0, Ll/nkg0;->a:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p1, p0, Ll/wmg0;->b:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    return-void
.end method
