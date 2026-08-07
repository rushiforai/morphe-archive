.class public Lcom/tencent/youtu/sdkkitframework/liveness/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;

.field public final synthetic b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/e;->a:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onNetworkResponseEvent(Ljava/util/HashMap;Ljava/lang/Exception;)V
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "video_config"

    .line 6
    .line 7
    const-string v3, "change_point_num"

    .line 8
    .line 9
    const-string v4, "reflect_param"

    .line 10
    .line 11
    const-string v5, "="

    .line 12
    .line 13
    const-string v6, "config"

    .line 14
    .line 15
    const-string v7, "errorcode"

    .line 16
    .line 17
    const-string v8, "error_code"

    .line 18
    .line 19
    const-string v9, "video_iframeinterval"

    .line 20
    .line 21
    const-string v10, "video_framerate"

    .line 22
    .line 23
    const-string v11, "video_bitrate"

    .line 24
    .line 25
    const-string v12, "color_data"

    .line 26
    .line 27
    const-string v13, "&"

    .line 28
    .line 29
    const-string v14, "action_data"

    .line 30
    .line 31
    const-string v15, "select_data"

    .line 32
    .line 33
    move-object/from16 p2, v9

    .line 34
    .line 35
    const-string v9, "online actionData: "

    .line 36
    .line 37
    move-object/from16 v16, v10

    .line 38
    .line 39
    new-instance v10, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    move-object/from16 v17, v11

    .line 42
    .line 43
    const-string v11, "response : "

    .line 44
    .line 45
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v11, "response"

    .line 49
    .line 50
    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v18

    .line 54
    move-object/from16 v19, v0

    .line 55
    .line 56
    move-object/from16 v0, v18

    .line 57
    .line 58
    check-cast v0, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v10, "NetFetchState"

    .line 68
    .line 69
    invoke-static {v10, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    move-object v0, v3

    .line 73
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 74
    .line 75
    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v21

    .line 79
    move-object/from16 v22, v0

    .line 80
    .line 81
    move-object/from16 v0, v21

    .line 82
    .line 83
    check-cast v0, Ljava/lang/String;

    .line 84
    .line 85
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v10, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_0

    .line 108
    .line 109
    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    const/4 v13, 0x1

    .line 116
    goto/16 :goto_8

    .line 117
    .line 118
    :cond_0
    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_1

    .line 123
    .line 124
    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    goto :goto_0

    .line 129
    :cond_1
    const/4 v0, -0x1

    .line 130
    :goto_0
    if-nez v0, :cond_e

    .line 131
    .line 132
    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    goto :goto_1

    .line 143
    :cond_2
    const/4 v0, 0x0

    .line 144
    :goto_1
    invoke-virtual {v3, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    if-eqz v7, :cond_3

    .line 149
    .line 150
    invoke-virtual {v3, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v7

    .line 154
    goto :goto_2

    .line 155
    :cond_3
    const/4 v7, 0x0

    .line 156
    :goto_2
    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 157
    .line 158
    iget-object v8, v8, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 159
    .line 160
    invoke-virtual {v8, v12, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 164
    .line 165
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 166
    .line 167
    invoke-virtual {v0, v14, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 171
    .line 172
    iget-boolean v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->f:Z

    .line 173
    .line 174
    if-eqz v7, :cond_4

    .line 175
    .line 176
    iget-object v7, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v7, v14, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    :cond_4
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    const/4 v7, 0x0

    .line 188
    if-eqz v0, :cond_a

    .line 189
    .line 190
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_7

    .line 199
    .line 200
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const-string v6, "&amp;"

    .line 209
    .line 210
    invoke-virtual {v0, v6, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    const-string v6, "%26"

    .line 215
    .line 216
    invoke-virtual {v0, v6, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    const-string v6, "%3D"

    .line 221
    .line 222
    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    const-string v6, "u0026|\\\\u0026"

    .line 227
    .line 228
    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0, v13}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iget-object v6, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 241
    .line 242
    iget-object v8, v6, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .line 244
    const-string v9, "control_config"

    .line 245
    .line 246
    :try_start_1
    invoke-virtual {v6, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v6

    .line 250
    invoke-virtual {v8, v9, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 254
    .line 255
    .line 256
    move-result v6

    .line 257
    if-nez v6, :cond_7

    .line 258
    .line 259
    invoke-virtual {v0, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    array-length v6, v0

    .line 264
    if-lez v6, :cond_7

    .line 265
    .line 266
    array-length v6, v0

    .line 267
    move v8, v7

    .line 268
    :goto_3
    if-ge v8, v6, :cond_7

    .line 269
    .line 270
    aget-object v9, v0, v8

    .line 271
    .line 272
    invoke-virtual {v9, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v9

    .line 276
    array-length v12, v9
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 277
    const/4 v13, 0x1

    .line 278
    if-le v12, v13, :cond_6

    .line 279
    .line 280
    :try_start_2
    aget-object v12, v9, v7

    .line 281
    .line 282
    const-string v14, "actref_ux_mode"

    .line 283
    .line 284
    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v12

    .line 288
    if-eqz v12, :cond_6

    .line 289
    .line 290
    aget-object v9, v9, v13

    .line 291
    .line 292
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    move-result v9

    .line 296
    const/4 v12, 0x2

    .line 297
    if-eq v9, v12, :cond_5

    .line 298
    .line 299
    move v9, v13

    .line 300
    goto :goto_4

    .line 301
    :cond_5
    move v9, v7

    .line 302
    :goto_4
    new-instance v12, Ljava/util/HashMap;

    .line 303
    .line 304
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 305
    .line 306
    .line 307
    const-string v14, "live_mode_reflection_open"

    .line 308
    .line 309
    :try_start_3
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 310
    .line 311
    .line 312
    move-result-object v9

    .line 313
    invoke-virtual {v12, v14, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 317
    .line 318
    .line 319
    move-result-object v9

    .line 320
    invoke-virtual {v9, v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 321
    .line 322
    .line 323
    goto :goto_5

    .line 324
    :catch_1
    move-exception v0

    .line 325
    goto/16 :goto_8

    .line 326
    .line 327
    :cond_6
    :goto_5
    add-int/lit8 v8, v8, 0x1

    .line 328
    .line 329
    goto :goto_3

    .line 330
    :cond_7
    const/4 v13, 0x1

    .line 331
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    if-eqz v0, :cond_8

    .line 340
    .line 341
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 342
    .line 343
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 344
    .line 345
    const-string v5, "extra_config"

    .line 346
    .line 347
    :try_start_4
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v4

    .line 355
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    :cond_8
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    move-object/from16 v4, v22

    .line 363
    .line 364
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-eqz v0, :cond_9

    .line 369
    .line 370
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 371
    .line 372
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    .line 373
    .line 374
    const-string v5, "cp_num"

    .line 375
    .line 376
    :try_start_5
    invoke-virtual {v3, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 377
    .line 378
    .line 379
    move-result-object v6

    .line 380
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    :cond_9
    :goto_6
    move-object/from16 v0, v19

    .line 388
    .line 389
    goto :goto_7

    .line 390
    :cond_a
    const/4 v13, 0x1

    .line 391
    const-string v0, "select_data not found or select_data.config not found"

    .line 392
    .line 393
    const/4 v4, 0x0

    .line 394
    invoke-static {v10, v0, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 395
    .line 396
    .line 397
    goto :goto_6

    .line 398
    :goto_7
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    if-eqz v4, :cond_d

    .line 403
    .line 404
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    move-object/from16 v3, v17

    .line 409
    .line 410
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    if-eqz v4, :cond_b

    .line 415
    .line 416
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 417
    .line 418
    iget-object v4, v4, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 419
    .line 420
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    :cond_b
    move-object/from16 v3, v16

    .line 432
    .line 433
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 434
    .line 435
    .line 436
    move-result v4

    .line 437
    if-eqz v4, :cond_c

    .line 438
    .line 439
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 440
    .line 441
    iget-object v4, v4, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 442
    .line 443
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 444
    .line 445
    .line 446
    move-result v5

    .line 447
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 448
    .line 449
    .line 450
    move-result-object v5

    .line 451
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    :cond_c
    move-object/from16 v3, p2

    .line 455
    .line 456
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 457
    .line 458
    .line 459
    move-result v4

    .line 460
    if-eqz v4, :cond_d

    .line 461
    .line 462
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 463
    .line 464
    iget-object v4, v4, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 465
    .line 466
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-virtual {v4, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    :cond_d
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 478
    .line 479
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 480
    .line 481
    .line 482
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 483
    .line 484
    .line 485
    move-result-object v3

    .line 486
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v3

    .line 490
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 491
    .line 492
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v3

    .line 496
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 497
    .line 498
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v3

    .line 502
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->faction_sdk_version:Ljava/lang/String;

    .line 503
    .line 504
    const-string v3, "3.6.9.2"

    .line 505
    .line 506
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 507
    .line 508
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v23

    .line 512
    new-instance v19, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 513
    .line 514
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->a:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;

    .line 515
    .line 516
    iget-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 517
    .line 518
    iget v3, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 519
    .line 520
    iget v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->colorNum:I

    .line 521
    .line 522
    iget-object v5, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->reflectConfig:Ljava/lang/String;

    .line 523
    .line 524
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->controlConfig:Ljava/lang/String;

    .line 525
    .line 526
    move-object/from16 v24, v0

    .line 527
    .line 528
    move/from16 v20, v3

    .line 529
    .line 530
    move/from16 v21, v4

    .line 531
    .line 532
    move-object/from16 v22, v5

    .line 533
    .line 534
    invoke-direct/range {v19 .. v24}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 538
    .line 539
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    .line 540
    .line 541
    const-string v3, "sd_data"

    .line 542
    .line 543
    :try_start_6
    invoke-virtual/range {v19 .. v19}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;->toString()Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object v4

    .line 547
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    .line 549
    .line 550
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/e;->b:Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;

    .line 551
    .line 552
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->moveToNextState()V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 553
    .line 554
    .line 555
    move v3, v7

    .line 556
    goto :goto_a

    .line 557
    :cond_e
    const/4 v13, 0x1

    .line 558
    goto :goto_9

    .line 559
    :goto_8
    const-string v3, "parse response json other object failed:"

    .line 560
    .line 561
    invoke-static {v10, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 562
    .line 563
    .line 564
    :goto_9
    move v3, v13

    .line 565
    :goto_a
    if-eqz v3, :cond_10

    .line 566
    .line 567
    const-string v0, "parse response failed"

    .line 568
    .line 569
    const/4 v4, 0x0

    .line 570
    invoke-static {v10, v0, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 571
    .line 572
    .line 573
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 574
    .line 575
    .line 576
    move-result-object v0

    .line 577
    const v3, 0x200001

    .line 578
    .line 579
    .line 580
    const-string v4, "server return failed"

    .line 581
    .line 582
    invoke-virtual {v0, v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 583
    .line 584
    .line 585
    invoke-virtual {v2, v11}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    if-eqz v0, :cond_f

    .line 590
    .line 591
    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    move-object v4, v0

    .line 596
    check-cast v4, Ljava/lang/String;

    .line 597
    .line 598
    :cond_f
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/e$a;

    .line 603
    .line 604
    invoke-direct {v2, v1, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/e$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/e;Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 608
    .line 609
    .line 610
    :cond_10
    return-void
.end method
