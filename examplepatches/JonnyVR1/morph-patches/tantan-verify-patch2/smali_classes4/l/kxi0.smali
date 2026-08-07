.class public Ll/kxi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kxi0$c;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ll/rxi0;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/ayi0;",
            ">;"
        }
    .end annotation
.end field

.field public c:[Ljava/lang/StackTraceElement;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kxi0;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/kxi0;->b:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/kxi0$a;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/kxi0;-><init>()V

    return-void
.end method

.method public static b()Ll/kxi0;
    .locals 1

    .line 1
    invoke-static {}, Ll/kxi0$c;->a()Ll/kxi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    new-instance v3, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    new-instance v5, Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-interface {v4}, Ljava/util/Set;->size()I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    invoke-direct {v5, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 28
    .line 29
    .line 30
    new-instance v6, Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v7, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v8, Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v9, Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v10, Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    if-eqz v11, :cond_3

    .line 64
    .line 65
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    check-cast v11, Ljava/lang/Thread;

    .line 70
    .line 71
    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    .line 72
    .line 73
    .line 74
    move-result-wide v12

    .line 75
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 76
    .line 77
    .line 78
    move-result-object v12

    .line 79
    invoke-interface {v5, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/kxi0;->b()Ll/kxi0;

    .line 83
    .line 84
    .line 85
    move-result-object v12

    .line 86
    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    .line 87
    .line 88
    .line 89
    move-result-wide v13

    .line 90
    invoke-virtual {v12, v13, v14}, Ll/kxi0;->d(J)Ll/rxi0;

    .line 91
    .line 92
    .line 93
    move-result-object v12

    .line 94
    if-eqz v12, :cond_2

    .line 95
    .line 96
    iget-object v13, v12, Ll/rxi0;->d:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v13

    .line 102
    if-nez v13, :cond_0

    .line 103
    .line 104
    iget-object v13, v12, Ll/rxi0;->d:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {v6, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    :cond_0
    invoke-virtual {v11}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    .line 110
    .line 111
    .line 112
    move-result-object v11

    .line 113
    iput-object v11, v12, Ll/rxi0;->h:Ljava/lang/Thread$State;

    .line 114
    .line 115
    iget-object v11, v12, Ll/rxi0;->c:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v11}, Ll/kiw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    iput-object v11, v12, Ll/rxi0;->e:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v7, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    check-cast v11, Ljava/lang/Integer;

    .line 128
    .line 129
    if-eqz v11, :cond_1

    .line 130
    .line 131
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result v11

    .line 135
    add-int/2addr v11, v1

    .line 136
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v11

    .line 140
    goto :goto_1

    .line 141
    :cond_1
    iget-object v11, v12, Ll/rxi0;->e:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v9, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-object v11, v2

    .line 147
    :goto_1
    iget-object v12, v12, Ll/rxi0;->e:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v7, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_2
    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    .line 154
    .line 155
    .line 156
    move-result-wide v12

    .line 157
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v12

    .line 161
    invoke-virtual {v7, v12, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    .line 165
    .line 166
    .line 167
    move-result-wide v12

    .line 168
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    new-instance v13, Ll/rxi0;

    .line 173
    .line 174
    invoke-virtual {v11}, Ljava/lang/Thread;->getId()J

    .line 175
    .line 176
    .line 177
    move-result-wide v14

    .line 178
    invoke-virtual {v11}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v16

    .line 182
    const/16 v17, 0x0

    .line 183
    .line 184
    const-string v18, "Untrack"

    .line 185
    .line 186
    invoke-direct/range {v13 .. v18}, Ll/rxi0;-><init>(JLjava/lang/String;[Ljava/lang/StackTraceElement;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v9, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 201
    .line 202
    .line 203
    new-instance v7, Ll/kxi0$a;

    .line 204
    .line 205
    invoke-direct {v7, v0}, Ll/kxi0$a;-><init>(Ll/kxi0;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v4, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 209
    .line 210
    .line 211
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object v6

    .line 215
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result v7

    .line 219
    if-eqz v7, :cond_7

    .line 220
    .line 221
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v7

    .line 225
    check-cast v7, Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {}, Ll/kxi0;->b()Ll/kxi0;

    .line 228
    .line 229
    .line 230
    move-result-object v11

    .line 231
    invoke-virtual {v11, v7}, Ll/kxi0;->e(Ljava/lang/String;)Ll/ayi0;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    new-instance v11, Ljava/util/ArrayList;

    .line 236
    .line 237
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .line 239
    .line 240
    new-instance v12, Ljava/util/ArrayList;

    .line 241
    .line 242
    iget-object v13, v7, Ll/ayi0;->e:Ljava/util/List;

    .line 243
    .line 244
    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 245
    .line 246
    .line 247
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 248
    .line 249
    .line 250
    move-result-object v12

    .line 251
    :cond_4
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 252
    .line 253
    .line 254
    move-result v13

    .line 255
    if-eqz v13, :cond_5

    .line 256
    .line 257
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v13

    .line 261
    check-cast v13, Ljava/lang/Long;

    .line 262
    .line 263
    invoke-interface {v5, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v14

    .line 267
    if-eqz v14, :cond_4

    .line 268
    .line 269
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    goto :goto_3

    .line 273
    :cond_5
    iget-object v12, v7, Ll/ayi0;->e:Ljava/util/List;

    .line 274
    .line 275
    invoke-interface {v12}, Ljava/util/List;->clear()V

    .line 276
    .line 277
    .line 278
    iget-object v12, v7, Ll/ayi0;->e:Ljava/util/List;

    .line 279
    .line 280
    invoke-interface {v12, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 281
    .line 282
    .line 283
    iget-object v11, v7, Ll/ayi0;->b:Ljava/lang/String;

    .line 284
    .line 285
    invoke-static {v11}, Ll/kiw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v11

    .line 289
    iput-object v11, v7, Ll/ayi0;->c:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v8, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v11

    .line 295
    check-cast v11, Ljava/lang/Integer;

    .line 296
    .line 297
    if-eqz v11, :cond_6

    .line 298
    .line 299
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 300
    .line 301
    .line 302
    move-result v11

    .line 303
    add-int/2addr v11, v1

    .line 304
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 305
    .line 306
    .line 307
    move-result-object v11

    .line 308
    goto :goto_4

    .line 309
    :cond_6
    iget-object v11, v7, Ll/ayi0;->c:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v10, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-object v11, v2

    .line 315
    :goto_4
    iget-object v7, v7, Ll/ayi0;->c:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v8, v7, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    goto :goto_2

    .line 321
    :cond_7
    new-instance v2, Ljava/util/ArrayList;

    .line 322
    .line 323
    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 328
    .line 329
    .line 330
    new-instance v5, Ll/kxi0$b;

    .line 331
    .line 332
    invoke-direct {v5, v0}, Ll/kxi0$b;-><init>(Ll/kxi0;)V

    .line 333
    .line 334
    .line 335
    invoke-static {v2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 336
    .line 337
    .line 338
    const/4 v5, 0x0

    .line 339
    :try_start_0
    new-instance v6, Lorg/json/JSONArray;

    .line 340
    .line 341
    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 342
    .line 343
    .line 344
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    :cond_8
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 349
    .line 350
    .line 351
    move-result v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 352
    const-string v8, "appearedTimes"

    .line 353
    .line 354
    const-string v11, "stack_md5"

    .line 355
    .line 356
    const-string v12, "stack_trace"

    .line 357
    .line 358
    if-eqz v7, :cond_9

    .line 359
    .line 360
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    check-cast v7, Ljava/util/Map$Entry;

    .line 365
    .line 366
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v13

    .line 370
    invoke-virtual {v10, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v13

    .line 374
    check-cast v13, Ll/ayi0;

    .line 375
    .line 376
    if-eqz v13, :cond_8

    .line 377
    .line 378
    new-instance v14, Lorg/json/JSONObject;

    .line 379
    .line 380
    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 381
    .line 382
    .line 383
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v7

    .line 387
    check-cast v7, Ljava/lang/Integer;

    .line 388
    .line 389
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 390
    .line 391
    .line 392
    move-result v7

    .line 393
    iput v7, v13, Ll/ayi0;->d:I

    .line 394
    .line 395
    const-string v7, "pool_Name"

    .line 396
    .line 397
    iget-object v15, v13, Ll/ayi0;->a:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {v14, v7, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 400
    .line 401
    .line 402
    iget-object v7, v13, Ll/ayi0;->b:Ljava/lang/String;

    .line 403
    .line 404
    invoke-virtual {v14, v12, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 405
    .line 406
    .line 407
    iget-object v7, v13, Ll/ayi0;->c:Ljava/lang/String;

    .line 408
    .line 409
    invoke-virtual {v14, v11, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 410
    .line 411
    .line 412
    const-string v7, "thread_ids"

    .line 413
    .line 414
    iget-object v11, v13, Ll/ayi0;->e:Ljava/util/List;

    .line 415
    .line 416
    invoke-virtual {v14, v7, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 417
    .line 418
    .line 419
    iget v7, v13, Ll/ayi0;->d:I

    .line 420
    .line 421
    invoke-virtual {v14, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v6, v14}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 425
    .line 426
    .line 427
    goto :goto_5

    .line 428
    :catch_0
    move-exception v0

    .line 429
    goto/16 :goto_7

    .line 430
    .line 431
    :cond_9
    const-string v2, "thread_pool_info"

    .line 432
    .line 433
    invoke-virtual {v3, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 434
    .line 435
    .line 436
    new-instance v2, Lorg/json/JSONArray;

    .line 437
    .line 438
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 439
    .line 440
    .line 441
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 442
    .line 443
    .line 444
    move-result-object v4

    .line 445
    move v6, v5

    .line 446
    :cond_a
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 447
    .line 448
    .line 449
    move-result v7

    .line 450
    if-eqz v7, :cond_c

    .line 451
    .line 452
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v7

    .line 456
    check-cast v7, Ljava/util/Map$Entry;

    .line 457
    .line 458
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v10

    .line 462
    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v10

    .line 466
    check-cast v10, Ll/rxi0;

    .line 467
    .line 468
    if-eqz v10, :cond_a

    .line 469
    .line 470
    new-instance v13, Lorg/json/JSONObject;

    .line 471
    .line 472
    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 473
    .line 474
    .line 475
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v7

    .line 479
    check-cast v7, Ljava/lang/Integer;

    .line 480
    .line 481
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 482
    .line 483
    .line 484
    move-result v7

    .line 485
    iput v7, v10, Ll/rxi0;->g:I

    .line 486
    .line 487
    const/16 v14, 0xa

    .line 488
    .line 489
    if-lt v7, v14, :cond_b

    .line 490
    .line 491
    if-nez v6, :cond_b

    .line 492
    .line 493
    const-string v6, "most_threadCount_stack"

    .line 494
    .line 495
    iget-object v7, v10, Ll/rxi0;->c:Ljava/lang/String;

    .line 496
    .line 497
    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 498
    .line 499
    .line 500
    const-string v6, "most_thread_count"

    .line 501
    .line 502
    iget v7, v10, Ll/rxi0;->g:I

    .line 503
    .line 504
    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 505
    .line 506
    .line 507
    iget-object v6, v10, Ll/rxi0;->f:[Ljava/lang/StackTraceElement;

    .line 508
    .line 509
    iput-object v6, v0, Ll/kxi0;->c:[Ljava/lang/StackTraceElement;

    .line 510
    .line 511
    move v6, v1

    .line 512
    :cond_b
    const-string v7, "tid"

    .line 513
    .line 514
    iget-wide v14, v10, Ll/rxi0;->a:J

    .line 515
    .line 516
    invoke-virtual {v13, v7, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 517
    .line 518
    .line 519
    const-string v7, "name"

    .line 520
    .line 521
    iget-object v14, v10, Ll/rxi0;->b:Ljava/lang/String;

    .line 522
    .line 523
    invoke-virtual {v13, v7, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 524
    .line 525
    .line 526
    const-string v7, "state"

    .line 527
    .line 528
    iget-object v14, v10, Ll/rxi0;->h:Ljava/lang/Thread$State;

    .line 529
    .line 530
    invoke-virtual {v13, v7, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 531
    .line 532
    .line 533
    iget-object v7, v10, Ll/rxi0;->c:Ljava/lang/String;

    .line 534
    .line 535
    invoke-virtual {v13, v12, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 536
    .line 537
    .line 538
    iget v7, v10, Ll/rxi0;->g:I

    .line 539
    .line 540
    invoke-virtual {v13, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 541
    .line 542
    .line 543
    iget-object v7, v10, Ll/rxi0;->e:Ljava/lang/String;

    .line 544
    .line 545
    invoke-virtual {v13, v11, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 546
    .line 547
    .line 548
    const-string v7, "owned_pool_name"

    .line 549
    .line 550
    iget-object v10, v10, Ll/rxi0;->d:Ljava/lang/String;

    .line 551
    .line 552
    invoke-virtual {v13, v7, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 553
    .line 554
    .line 555
    invoke-virtual {v2, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 556
    .line 557
    .line 558
    goto :goto_6

    .line 559
    :cond_c
    const-string v0, "thread_info"

    .line 560
    .line 561
    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 562
    .line 563
    .line 564
    return-object v3

    .line 565
    :goto_7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 566
    .line 567
    const-string v2, "getAllJavaThread Exception:"

    .line 568
    .line 569
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 570
    .line 571
    .line 572
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    new-array v1, v5, [Ljava/lang/Object;

    .line 584
    .line 585
    invoke-static {v0, v1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 586
    .line 587
    .line 588
    return-object v3
.end method

.method public c()[Ljava/lang/StackTraceElement;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxi0;->c:[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(J)Ll/rxi0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kxi0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/rxi0;

    .line 12
    .line 13
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/ayi0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kxi0;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ayi0;

    .line 8
    .line 9
    return-object p0
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Thread;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Ll/kxi0;->a:Ljava/util/Map;

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/util/Map$Entry;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    return-void
.end method
