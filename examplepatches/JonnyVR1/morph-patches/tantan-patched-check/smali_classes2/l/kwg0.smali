.class public final Ll/kwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vlg0;


# instance fields
.field public final synthetic a:Ll/hrg0;

.field public final synthetic b:Ll/chg0;


# direct methods
.method public constructor <init>(Ll/chg0;Ll/hrg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kwg0;->b:Ll/chg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kwg0;->a:Ll/hrg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onFailure(ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "initSDK failure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " retMsg:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "NetworkDetectionTask"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 29
    .line 30
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 31
    .line 32
    .line 33
    iput p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 34
    .line 35
    iput-object p2, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Ll/kwg0;->a:Ll/hrg0;

    .line 38
    .line 39
    iget-object v1, v1, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 40
    .line 41
    sget-object v2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 42
    .line 43
    iput-object v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 44
    .line 45
    iput-object v0, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 46
    .line 47
    iget-object p0, p0, Ll/kwg0;->b:Ll/chg0;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Ll/chg0;->g(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final onSuccess(Ljava/lang/String;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 4
    .line 5
    invoke-direct {v1}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 10
    .line 11
    const-string v3, "success"

    .line 12
    .line 13
    iput-object v3, v1, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, v0, Ll/kwg0;->a:Ll/hrg0;

    .line 16
    .line 17
    iget-object v3, v3, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 18
    .line 19
    sget-object v4, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 20
    .line 21
    iput-object v4, v3, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 22
    .line 23
    iput-object v1, v3, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->result:Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 24
    .line 25
    iget-object v1, v0, Ll/kwg0;->b:Ll/chg0;

    .line 26
    .line 27
    iget-boolean v0, v1, Ll/chg0;->d:Z

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_9

    .line 32
    .line 33
    :cond_0
    const/4 v3, 0x0

    .line 34
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 35
    .line 36
    move-object/from16 v4, p1

    .line 37
    .line 38
    invoke-direct {v0, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string v4, "ret_code"

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const-string v5, "ret_msg"

    .line 48
    .line 49
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v6, "data"

    .line 54
    .line 55
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-lez v6, :cond_2

    .line 66
    .line 67
    new-instance v6, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 70
    .line 71
    .line 72
    move v3, v2

    .line 73
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    if-ge v3, v7, :cond_1

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    new-instance v8, Ll/wjg0;

    .line 84
    .line 85
    invoke-direct {v8}, Ll/wjg0;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v9, "name"

    .line 89
    .line 90
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    iput-object v9, v8, Ll/wjg0;->a:Ljava/lang/String;

    .line 95
    .line 96
    const-string v9, "protocol"

    .line 97
    .line 98
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    iput-object v9, v8, Ll/wjg0;->b:Ljava/lang/String;

    .line 103
    .line 104
    const-string v9, "method"

    .line 105
    .line 106
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v9

    .line 110
    iput-object v9, v8, Ll/wjg0;->c:Ljava/lang/String;

    .line 111
    .line 112
    const-string v9, "url"

    .line 113
    .line 114
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    iput-object v7, v8, Ll/wjg0;->d:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 121
    .line 122
    .line 123
    add-int/lit8 v3, v3, 0x1

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :catch_0
    move-exception v0

    .line 127
    goto :goto_1

    .line 128
    :cond_1
    move-object v3, v6

    .line 129
    goto :goto_3

    .line 130
    :goto_1
    move-object v3, v6

    .line 131
    goto :goto_2

    .line 132
    :catch_1
    move-exception v0

    .line 133
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v5, "parseCheckerUrlConfig error:"

    .line 136
    .line 137
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    const-string v5, "NetworkDetectionTask"

    .line 152
    .line 153
    invoke-static {v5, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    const/4 v4, -0x1

    .line 161
    :cond_2
    :goto_3
    if-eqz v4, :cond_3

    .line 162
    .line 163
    invoke-virtual {v1, v4, v5}, Ll/chg0;->g(ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    goto/16 :goto_9

    .line 167
    .line 168
    :cond_3
    if-eqz v3, :cond_12

    .line 169
    .line 170
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_4

    .line 175
    .line 176
    goto/16 :goto_8

    .line 177
    .line 178
    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    move v5, v2

    .line 188
    :cond_5
    :goto_4
    const-string v6, "post"

    .line 189
    .line 190
    const-string v7, "get"

    .line 191
    .line 192
    const-string v8, "wss"

    .line 193
    .line 194
    const-string v9, "ws"

    .line 195
    .line 196
    const-string v10, "https"

    .line 197
    .line 198
    const-string v11, "http"

    .line 199
    .line 200
    if-ge v5, v4, :cond_b

    .line 201
    .line 202
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v12

    .line 206
    add-int/lit8 v5, v5, 0x1

    .line 207
    .line 208
    check-cast v12, Ll/wjg0;

    .line 209
    .line 210
    iget-object v13, v12, Ll/wjg0;->d:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result v13

    .line 216
    if-eqz v13, :cond_6

    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_6
    iget-object v13, v12, Ll/wjg0;->b:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v11

    .line 225
    if-nez v11, :cond_9

    .line 226
    .line 227
    iget-object v11, v12, Ll/wjg0;->b:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 230
    .line 231
    .line 232
    move-result v10

    .line 233
    if-eqz v10, :cond_7

    .line 234
    .line 235
    goto :goto_5

    .line 236
    :cond_7
    iget-object v6, v12, Ll/wjg0;->b:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v9, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    if-nez v6, :cond_8

    .line 243
    .line 244
    iget-object v6, v12, Ll/wjg0;->b:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v6

    .line 250
    if-eqz v6, :cond_5

    .line 251
    .line 252
    :cond_8
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    goto :goto_4

    .line 256
    :cond_9
    :goto_5
    iget-object v8, v12, Ll/wjg0;->c:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result v7

    .line 262
    if-nez v7, :cond_a

    .line 263
    .line 264
    iget-object v7, v12, Ll/wjg0;->c:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v6

    .line 270
    if-eqz v6, :cond_5

    .line 271
    .line 272
    :cond_a
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    if-nez v3, :cond_c

    .line 281
    .line 282
    invoke-virtual {v1}, Ll/chg0;->h()V

    .line 283
    .line 284
    .line 285
    goto/16 :goto_9

    .line 286
    .line 287
    :cond_c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    iput v3, v1, Ll/chg0;->f:I

    .line 292
    .line 293
    sget-object v12, Ll/utg0;->b:Ll/uyg0;

    .line 294
    .line 295
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 296
    .line 297
    .line 298
    move-result v3

    .line 299
    :cond_d
    :goto_6
    if-ge v2, v3, :cond_13

    .line 300
    .line 301
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    add-int/lit8 v2, v2, 0x1

    .line 306
    .line 307
    check-cast v4, Ll/wjg0;

    .line 308
    .line 309
    new-instance v5, Ll/hrg0;

    .line 310
    .line 311
    invoke-direct {v5}, Ll/hrg0;-><init>()V

    .line 312
    .line 313
    .line 314
    iget-object v13, v4, Ll/wjg0;->a:Ljava/lang/String;

    .line 315
    .line 316
    iput-object v13, v5, Ll/hrg0;->b:Ljava/lang/String;

    .line 317
    .line 318
    iget-object v13, v4, Ll/wjg0;->d:Ljava/lang/String;

    .line 319
    .line 320
    iput-object v13, v5, Ll/hrg0;->c:Ljava/lang/String;

    .line 321
    .line 322
    iget-object v13, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 323
    .line 324
    iget v14, v1, Ll/chg0;->i:I

    .line 325
    .line 326
    add-int/lit8 v14, v14, 0x1

    .line 327
    .line 328
    iput v14, v1, Ll/chg0;->i:I

    .line 329
    .line 330
    iput v14, v13, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->identifier:I

    .line 331
    .line 332
    iget-object v14, v4, Ll/wjg0;->b:Ljava/lang/String;

    .line 333
    .line 334
    iput-object v14, v13, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->protocol:Ljava/lang/String;

    .line 335
    .line 336
    iget-object v14, v4, Ll/wjg0;->c:Ljava/lang/String;

    .line 337
    .line 338
    iput-object v14, v13, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->method:Ljava/lang/String;

    .line 339
    .line 340
    iget-object v13, v1, Ll/chg0;->e:Ljava/util/ArrayList;

    .line 341
    .line 342
    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    .line 344
    .line 345
    new-instance v15, Ll/yng0;

    .line 346
    .line 347
    iget-object v13, v5, Ll/hrg0;->a:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 348
    .line 349
    invoke-direct {v15, v13}, Ll/yng0;-><init>(Ltech/sud/gip/core/network/detection/NetworkDetectionStep;)V

    .line 350
    .line 351
    .line 352
    new-instance v13, Ll/fzg0;

    .line 353
    .line 354
    invoke-direct {v13, v1, v5}, Ll/fzg0;-><init>(Ll/chg0;Ll/hrg0;)V

    .line 355
    .line 356
    .line 357
    iget-object v14, v4, Ll/wjg0;->b:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {v11, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 360
    .line 361
    .line 362
    move-result v14

    .line 363
    if-nez v14, :cond_10

    .line 364
    .line 365
    iget-object v14, v4, Ll/wjg0;->b:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v10, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 368
    .line 369
    .line 370
    move-result v14

    .line 371
    if-eqz v14, :cond_e

    .line 372
    .line 373
    goto :goto_7

    .line 374
    :cond_e
    iget-object v13, v4, Ll/wjg0;->b:Ljava/lang/String;

    .line 375
    .line 376
    invoke-virtual {v9, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 377
    .line 378
    .line 379
    move-result v13

    .line 380
    if-nez v13, :cond_f

    .line 381
    .line 382
    iget-object v13, v4, Ll/wjg0;->b:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 385
    .line 386
    .line 387
    move-result v13

    .line 388
    if-eqz v13, :cond_d

    .line 389
    .line 390
    :cond_f
    iget-object v4, v4, Ll/wjg0;->d:Ljava/lang/String;

    .line 391
    .line 392
    sget-object v13, Ll/tsg0;->b:Ll/rg50;

    .line 393
    .line 394
    new-instance v14, Ll/x1d0$a;

    .line 395
    .line 396
    invoke-direct {v14}, Ll/x1d0$a;-><init>()V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v14, v4}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 400
    .line 401
    .line 402
    move-result-object v14

    .line 403
    invoke-virtual {v14}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 404
    .line 405
    .line 406
    move-result-object v14

    .line 407
    new-instance v15, Ll/zeg0;

    .line 408
    .line 409
    invoke-direct {v15, v1, v4, v5}, Ll/zeg0;-><init>(Ll/chg0;Ljava/lang/String;Ll/hrg0;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v13, v14, v15}, Ll/rg50;->x(Ll/x1d0;Ll/ksp0;)Ll/hsp0;

    .line 413
    .line 414
    .line 415
    goto :goto_6

    .line 416
    :cond_10
    :goto_7
    iget-object v5, v4, Ll/wjg0;->c:Ljava/lang/String;

    .line 417
    .line 418
    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 419
    .line 420
    .line 421
    move-result v5

    .line 422
    if-eqz v5, :cond_11

    .line 423
    .line 424
    iget-object v4, v4, Ll/wjg0;->d:Ljava/lang/String;

    .line 425
    .line 426
    new-instance v5, Ll/neg0;

    .line 427
    .line 428
    invoke-direct {v5}, Ll/neg0;-><init>()V

    .line 429
    .line 430
    .line 431
    iget-object v14, v1, Ll/chg0;->h:Ljava/util/ArrayList;

    .line 432
    .line 433
    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    invoke-virtual {v12, v4, v15, v13, v5}, Ll/uyg0;->o(Ljava/lang/String;Ll/yng0;Ll/fzg0;Ll/neg0;)V

    .line 437
    .line 438
    .line 439
    goto/16 :goto_6

    .line 440
    .line 441
    :cond_11
    iget-object v5, v4, Ll/wjg0;->c:Ljava/lang/String;

    .line 442
    .line 443
    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 444
    .line 445
    .line 446
    move-result v5

    .line 447
    if-eqz v5, :cond_d

    .line 448
    .line 449
    iget-object v4, v4, Ll/wjg0;->d:Ljava/lang/String;

    .line 450
    .line 451
    new-instance v5, Ll/neg0;

    .line 452
    .line 453
    invoke-direct {v5}, Ll/neg0;-><init>()V

    .line 454
    .line 455
    .line 456
    iget-object v14, v1, Ll/chg0;->h:Ljava/util/ArrayList;

    .line 457
    .line 458
    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 459
    .line 460
    .line 461
    const-string v14, ""

    .line 462
    .line 463
    move-object/from16 v17, v5

    .line 464
    .line 465
    move-object/from16 v16, v13

    .line 466
    .line 467
    move-object v13, v4

    .line 468
    invoke-virtual/range {v12 .. v17}, Ll/uyg0;->l(Ljava/lang/String;Ljava/lang/String;Ll/yng0;Ll/vlg0;Ll/neg0;)V

    .line 469
    .line 470
    .line 471
    goto/16 :goto_6

    .line 472
    .line 473
    :cond_12
    :goto_8
    invoke-virtual {v1}, Ll/chg0;->h()V

    .line 474
    .line 475
    .line 476
    :cond_13
    :goto_9
    return-void
.end method
