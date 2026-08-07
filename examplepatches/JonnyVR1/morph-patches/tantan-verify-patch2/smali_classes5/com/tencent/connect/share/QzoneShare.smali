.class public Lcom/tencent/connect/share/QzoneShare;
.super Lcom/tencent/connect/common/BaseApi;
.source "SourceFile"


# static fields
.field public static final SHARE_TO_QQ_APP_NAME:Ljava/lang/String; = "appName"

.field public static final SHARE_TO_QQ_AUDIO_URL:Ljava/lang/String; = "audio_url"

.field public static final SHARE_TO_QQ_EXT_INT:Ljava/lang/String; = "cflag"

.field public static final SHARE_TO_QQ_EXT_STR:Ljava/lang/String; = "share_qq_ext_str"

.field public static final SHARE_TO_QQ_IMAGE_LOCAL_URL:Ljava/lang/String; = "imageLocalUrl"

.field public static final SHARE_TO_QQ_IMAGE_URL:Ljava/lang/String; = "imageUrl"

.field public static final SHARE_TO_QQ_SITE:Ljava/lang/String; = "site"

.field public static final SHARE_TO_QQ_SUMMARY:Ljava/lang/String; = "summary"

.field public static final SHARE_TO_QQ_TARGET_URL:Ljava/lang/String; = "targetUrl"

.field public static final SHARE_TO_QQ_TITLE:Ljava/lang/String; = "title"

.field public static final SHARE_TO_QZONE_EXTMAP:Ljava/lang/String; = "extMap"

.field public static final SHARE_TO_QZONE_KEY_TYPE:Ljava/lang/String; = "req_type"

.field public static final SHARE_TO_QZONE_TYPE_IMAGE:I = 0x5

.field public static final SHARE_TO_QZONE_TYPE_IMAGE_TEXT:I = 0x1

.field public static final SHARE_TO_QZONE_TYPE_MINI_PROGRAM:I = 0x7

.field public static final SHARE_TO_QZONE_TYPE_NO_TYPE:I


# instance fields
.field private a:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field public mViaShareQzoneType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/connect/auth/QQToken;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/tencent/connect/common/BaseApi;-><init>(Lcom/tencent/connect/auth/QQToken;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/connect/share/QzoneShare;->mViaShareQzoneType:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/tencent/connect/share/QzoneShare;->d:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/tencent/connect/share/QzoneShare;->e:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/tencent/connect/share/QzoneShare;->f:Z

    .line 17
    .line 18
    return-void
.end method

.method private b(Landroid/app/Activity;Landroid/os/Bundle;Lcom/tencent/tauth/IUiListener;)V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v0, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    const-string v4, "doshareToQzone() --start"

    .line 10
    .line 11
    const-string v5, "openSDK_LOG.QzoneShare"

    .line 12
    .line 13
    invoke-static {v5, v4}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ljava/lang/StringBuffer;

    .line 17
    .line 18
    const-string v6, "mqqapi://share/to_qzone?src_type=app&version=1&file_type=news"

    .line 19
    .line 20
    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v6, "imageUrl"

    .line 24
    .line 25
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    const-string v7, "title"

    .line 30
    .line 31
    invoke-virtual {v0, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    const-string v8, "summary"

    .line 36
    .line 37
    invoke-virtual {v0, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v8

    .line 41
    const-string v9, "targetUrl"

    .line 42
    .line 43
    invoke-virtual {v0, v9}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    const-string v10, "audio_url"

    .line 48
    .line 49
    invoke-virtual {v0, v10}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    const-string v11, "req_type"

    .line 54
    .line 55
    const/4 v12, 0x1

    .line 56
    invoke-virtual {v0, v11, v12}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 57
    .line 58
    .line 59
    move-result v11

    .line 60
    const-string v12, "appName"

    .line 61
    .line 62
    invoke-virtual {v0, v12}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v12

    .line 66
    const-string v13, "mini_program_appid"

    .line 67
    .line 68
    invoke-virtual {v0, v13}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v13

    .line 72
    const-string v14, "mini_program_path"

    .line 73
    .line 74
    invoke-virtual {v0, v14}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v14

    .line 78
    const-string v15, "mini_program_type"

    .line 79
    .line 80
    invoke-virtual {v0, v15}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v15

    .line 84
    move-object/from16 v16, v7

    .line 85
    .line 86
    const-string v7, "cflag"

    .line 87
    .line 88
    move-object/from16 v17, v8

    .line 89
    .line 90
    const/4 v8, 0x0

    .line 91
    invoke-virtual {v0, v7, v8}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    const-string v8, "share_qq_ext_str"

    .line 96
    .line 97
    invoke-virtual {v0, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    const-string v18, ""

    .line 102
    .line 103
    move/from16 v19, v7

    .line 104
    .line 105
    :try_start_0
    const-string v7, "extMap"

    .line 106
    .line 107
    invoke-virtual {v0, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    move-object/from16 p2, v7

    .line 118
    .line 119
    new-instance v7, Lorg/json/JSONObject;

    .line 120
    .line 121
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v20

    .line 128
    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v21

    .line 132
    if-eqz v21, :cond_0

    .line 133
    .line 134
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v21
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 138
    move-object/from16 v22, v8

    .line 139
    .line 140
    :try_start_1
    move-object/from16 v8, v21

    .line 141
    .line 142
    check-cast v8, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 143
    .line 144
    move-object/from16 v21, v9

    .line 145
    .line 146
    :try_start_2
    invoke-virtual {v0, v8}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    move-object/from16 v9, v21

    .line 154
    .line 155
    move-object/from16 v8, v22

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :catch_0
    move-exception v0

    .line 159
    goto :goto_2

    .line 160
    :catch_1
    move-exception v0

    .line 161
    :goto_1
    move-object/from16 v21, v9

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :catch_2
    move-exception v0

    .line 165
    move-object/from16 v22, v8

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_0
    move-object/from16 v22, v8

    .line 169
    .line 170
    move-object/from16 v21, v9

    .line 171
    .line 172
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->size()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-lez v0, :cond_2

    .line 177
    .line 178
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v18
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 182
    goto :goto_3

    .line 183
    :cond_1
    move-object/from16 v22, v8

    .line 184
    .line 185
    move-object/from16 v21, v9

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :goto_2
    const-string v7, "ShareToQzone()  --error parse extmap"

    .line 189
    .line 190
    invoke-static {v5, v7, v0}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    :cond_2
    :goto_3
    iget-object v0, v1, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v7, v1, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 200
    .line 201
    invoke-virtual {v7}, Lcom/tencent/connect/auth/QQToken;->getOpenIdWithCache()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    new-instance v8, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string v9, "openId:"

    .line 208
    .line 209
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v8

    .line 219
    invoke-static {v5, v8}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    if-eqz v6, :cond_3

    .line 223
    .line 224
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 225
    .line 226
    .line 227
    move-result v9

    .line 228
    if-lez v9, :cond_3

    .line 229
    .line 230
    const/4 v9, 0x0

    .line 231
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    check-cast v6, Ljava/lang/String;

    .line 236
    .line 237
    new-instance v9, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v8, "&image_url="

    .line 240
    .line 241
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-static {v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v8

    .line 248
    invoke-static {v8}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 249
    .line 250
    .line 251
    move-result-object v8

    .line 252
    move-object/from16 v20, v7

    .line 253
    .line 254
    const/4 v7, 0x2

    .line 255
    invoke-static {v8, v7}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v8

    .line 259
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 267
    .line 268
    .line 269
    invoke-static {v6}, Lcom/tencent/open/utils/n;->h(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v7

    .line 273
    if-nez v7, :cond_4

    .line 274
    .line 275
    invoke-static {v0, v2, v6, v3}, Lcom/tencent/open/utils/n;->a(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Lcom/tencent/tauth/IUiListener;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v6

    .line 279
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 280
    .line 281
    .line 282
    move-result v7

    .line 283
    if-nez v7, :cond_4

    .line 284
    .line 285
    new-instance v7, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v8, "&image_uri="

    .line 288
    .line 289
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-static {v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 297
    .line 298
    .line 299
    move-result-object v6

    .line 300
    const/4 v8, 0x2

    .line 301
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v6

    .line 305
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v6

    .line 312
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_3
    move-object/from16 v20, v7

    .line 317
    .line 318
    :cond_4
    :goto_4
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 319
    .line 320
    .line 321
    move-result v6

    .line 322
    if-nez v6, :cond_5

    .line 323
    .line 324
    new-instance v6, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    const-string v7, "&title="

    .line 327
    .line 328
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    invoke-static/range {v16 .. v16}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 332
    .line 333
    .line 334
    move-result-object v7

    .line 335
    const/4 v8, 0x2

    .line 336
    invoke-static {v7, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v7

    .line 340
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v6

    .line 347
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 348
    .line 349
    .line 350
    :cond_5
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    if-nez v6, :cond_6

    .line 355
    .line 356
    new-instance v6, Ljava/lang/StringBuilder;

    .line 357
    .line 358
    const-string v7, "&description="

    .line 359
    .line 360
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    invoke-static/range {v17 .. v17}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 364
    .line 365
    .line 366
    move-result-object v7

    .line 367
    const/4 v8, 0x2

    .line 368
    invoke-static {v7, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v7

    .line 372
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v6

    .line 379
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 380
    .line 381
    .line 382
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 383
    .line 384
    .line 385
    move-result v6

    .line 386
    if-nez v6, :cond_7

    .line 387
    .line 388
    new-instance v6, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    const-string v7, "&share_id="

    .line 391
    .line 392
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 403
    .line 404
    .line 405
    :cond_7
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    if-nez v0, :cond_8

    .line 410
    .line 411
    new-instance v0, Ljava/lang/StringBuilder;

    .line 412
    .line 413
    const-string v6, "&url="

    .line 414
    .line 415
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    invoke-static/range {v21 .. v21}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 419
    .line 420
    .line 421
    move-result-object v6

    .line 422
    const/4 v8, 0x2

    .line 423
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v6

    .line 427
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    .line 436
    .line 437
    :cond_8
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_9

    .line 442
    .line 443
    new-instance v0, Ljava/lang/StringBuilder;

    .line 444
    .line 445
    const-string v6, "&app_name="

    .line 446
    .line 447
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    invoke-static {v12}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 451
    .line 452
    .line 453
    move-result-object v6

    .line 454
    const/4 v8, 0x2

    .line 455
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object v6

    .line 459
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 467
    .line 468
    .line 469
    :cond_9
    invoke-static/range {v20 .. v20}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 470
    .line 471
    .line 472
    move-result v0

    .line 473
    if-nez v0, :cond_a

    .line 474
    .line 475
    new-instance v0, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    const-string v6, "&open_id="

    .line 478
    .line 479
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 480
    .line 481
    .line 482
    invoke-static/range {v20 .. v20}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 483
    .line 484
    .line 485
    move-result-object v6

    .line 486
    const/4 v8, 0x2

    .line 487
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v6

    .line 491
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 499
    .line 500
    .line 501
    :cond_a
    invoke-static {v10}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    if-nez v0, :cond_b

    .line 506
    .line 507
    new-instance v0, Ljava/lang/StringBuilder;

    .line 508
    .line 509
    const-string v6, "&audioUrl="

    .line 510
    .line 511
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    invoke-static {v10}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 515
    .line 516
    .line 517
    move-result-object v6

    .line 518
    const/4 v8, 0x2

    .line 519
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v6

    .line 523
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 531
    .line 532
    .line 533
    goto :goto_5

    .line 534
    :cond_b
    const/4 v8, 0x2

    .line 535
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 536
    .line 537
    const-string v6, "&req_type="

    .line 538
    .line 539
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 540
    .line 541
    .line 542
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v6

    .line 546
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 547
    .line 548
    .line 549
    move-result-object v6

    .line 550
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 551
    .line 552
    .line 553
    move-result-object v6

    .line 554
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v0

    .line 561
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 562
    .line 563
    .line 564
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 565
    .line 566
    .line 567
    move-result v0

    .line 568
    if-nez v0, :cond_c

    .line 569
    .line 570
    new-instance v0, Ljava/lang/StringBuilder;

    .line 571
    .line 572
    const-string v6, "&mini_program_appid="

    .line 573
    .line 574
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 575
    .line 576
    .line 577
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object v6

    .line 581
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 582
    .line 583
    .line 584
    move-result-object v6

    .line 585
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v6

    .line 589
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v0

    .line 596
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 597
    .line 598
    .line 599
    :cond_c
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 600
    .line 601
    .line 602
    move-result v0

    .line 603
    if-nez v0, :cond_d

    .line 604
    .line 605
    new-instance v0, Ljava/lang/StringBuilder;

    .line 606
    .line 607
    const-string v6, "&mini_program_path="

    .line 608
    .line 609
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v6

    .line 616
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 617
    .line 618
    .line 619
    move-result-object v6

    .line 620
    const/4 v8, 0x2

    .line 621
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 622
    .line 623
    .line 624
    move-result-object v6

    .line 625
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object v0

    .line 632
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 633
    .line 634
    .line 635
    :cond_d
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 636
    .line 637
    .line 638
    move-result v0

    .line 639
    if-nez v0, :cond_e

    .line 640
    .line 641
    new-instance v0, Ljava/lang/StringBuilder;

    .line 642
    .line 643
    const-string v6, "&mini_program_type="

    .line 644
    .line 645
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v6

    .line 652
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 653
    .line 654
    .line 655
    move-result-object v6

    .line 656
    const/4 v8, 0x2

    .line 657
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object v6

    .line 661
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 662
    .line 663
    .line 664
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v0

    .line 668
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 669
    .line 670
    .line 671
    :cond_e
    invoke-static/range {v22 .. v22}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 672
    .line 673
    .line 674
    move-result v0

    .line 675
    if-nez v0, :cond_f

    .line 676
    .line 677
    new-instance v0, Ljava/lang/StringBuilder;

    .line 678
    .line 679
    const-string v6, "&share_qq_ext_str="

    .line 680
    .line 681
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    invoke-static/range {v22 .. v22}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 685
    .line 686
    .line 687
    move-result-object v6

    .line 688
    const/4 v8, 0x2

    .line 689
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 690
    .line 691
    .line 692
    move-result-object v6

    .line 693
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v0

    .line 700
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 701
    .line 702
    .line 703
    :cond_f
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 704
    .line 705
    .line 706
    move-result v0

    .line 707
    if-nez v0, :cond_10

    .line 708
    .line 709
    new-instance v0, Ljava/lang/StringBuilder;

    .line 710
    .line 711
    const-string v6, "&share_qzone_ext_str="

    .line 712
    .line 713
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 714
    .line 715
    .line 716
    invoke-static/range {v18 .. v18}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 717
    .line 718
    .line 719
    move-result-object v6

    .line 720
    const/4 v8, 0x2

    .line 721
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 722
    .line 723
    .line 724
    move-result-object v6

    .line 725
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 726
    .line 727
    .line 728
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 733
    .line 734
    .line 735
    goto :goto_6

    .line 736
    :cond_10
    const/4 v8, 0x2

    .line 737
    :goto_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 738
    .line 739
    const-string v6, "&cflag="

    .line 740
    .line 741
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 742
    .line 743
    .line 744
    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 745
    .line 746
    .line 747
    move-result-object v6

    .line 748
    invoke-static {v6}, Lcom/tencent/open/utils/n;->j(Ljava/lang/String;)[B

    .line 749
    .line 750
    .line 751
    move-result-object v6

    .line 752
    invoke-static {v6, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 753
    .line 754
    .line 755
    move-result-object v6

    .line 756
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 757
    .line 758
    .line 759
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 764
    .line 765
    .line 766
    new-instance v0, Ljava/lang/StringBuilder;

    .line 767
    .line 768
    const-string v6, "doshareToQzone, url: "

    .line 769
    .line 770
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 774
    .line 775
    .line 776
    move-result-object v6

    .line 777
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    .line 779
    .line 780
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 781
    .line 782
    .line 783
    move-result-object v0

    .line 784
    invoke-static {v5, v0}, Lcom/tencent/open/log/SLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    invoke-static {}, Lcom/tencent/open/utils/h;->a()Landroid/content/Context;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    iget-object v6, v1, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 792
    .line 793
    const-string v7, "shareToNativeQQ"

    .line 794
    .line 795
    filled-new-array {v7}, [Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v7

    .line 799
    const-string v8, "requireApi"

    .line 800
    .line 801
    invoke-static {v0, v6, v8, v7}, Lcom/tencent/connect/a/a;->a(Landroid/content/Context;Lcom/tencent/connect/auth/QQToken;Ljava/lang/String;[Ljava/lang/String;)V

    .line 802
    .line 803
    .line 804
    new-instance v0, Landroid/content/Intent;

    .line 805
    .line 806
    const-string v6, "android.intent.action.VIEW"

    .line 807
    .line 808
    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 812
    .line 813
    .line 814
    move-result-object v4

    .line 815
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 816
    .line 817
    .line 818
    move-result-object v4

    .line 819
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 820
    .line 821
    .line 822
    const-string v4, "pkg_name"

    .line 823
    .line 824
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 825
    .line 826
    .line 827
    move-result-object v6

    .line 828
    invoke-virtual {v0, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 829
    .line 830
    .line 831
    iget-object v4, v1, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 832
    .line 833
    invoke-virtual {v4}, Lcom/tencent/connect/auth/QQToken;->getOpenId()Ljava/lang/String;

    .line 834
    .line 835
    .line 836
    move-result-object v6

    .line 837
    iget-object v4, v1, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 838
    .line 839
    invoke-virtual {v4}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 840
    .line 841
    .line 842
    move-result-object v10

    .line 843
    iget-object v11, v1, Lcom/tencent/connect/share/QzoneShare;->mViaShareQzoneType:Ljava/lang/String;

    .line 844
    .line 845
    const-string v15, "1"

    .line 846
    .line 847
    const-string v16, "0"

    .line 848
    .line 849
    const-string v7, "11"

    .line 850
    .line 851
    const-string v8, "3"

    .line 852
    .line 853
    const-string v9, "ANDROIDQQ.SHARETOQZ.XX"

    .line 854
    .line 855
    const-string v12, ""

    .line 856
    .line 857
    const-string v13, ""

    .line 858
    .line 859
    const-string v14, "0"

    .line 860
    .line 861
    invoke-static/range {v6 .. v16}, Lcom/tencent/open/utils/n;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 862
    .line 863
    .line 864
    move-result-object v4

    .line 865
    sget-object v6, Lcom/tencent/connect/common/Constants;->KEY_PASS_REPORT_VIA_PARAM:Ljava/lang/String;

    .line 866
    .line 867
    invoke-virtual {v0, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 868
    .line 869
    .line 870
    const-string v4, "4.6.0"

    .line 871
    .line 872
    invoke-static {v2, v4}, Lcom/tencent/open/utils/n;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 873
    .line 874
    .line 875
    move-result v4

    .line 876
    if-eqz v4, :cond_11

    .line 877
    .line 878
    invoke-static {}, Lcom/tencent/connect/common/UIListenerManager;->getInstance()Lcom/tencent/connect/common/UIListenerManager;

    .line 879
    .line 880
    .line 881
    move-result-object v4

    .line 882
    const/16 v6, 0x2b60

    .line 883
    .line 884
    invoke-virtual {v4, v6, v3}, Lcom/tencent/connect/common/UIListenerManager;->setListenerWithRequestcode(ILcom/tencent/tauth/IUiListener;)Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    invoke-virtual {v1, v2, v0, v6}, Lcom/tencent/connect/common/BaseApi;->a(Landroid/app/Activity;Landroid/content/Intent;I)V

    .line 888
    .line 889
    .line 890
    const-string v0, "doShareToQzone() -- QQ Version is < 4.6.0"

    .line 891
    .line 892
    invoke-static {v5, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    .line 894
    .line 895
    goto :goto_7

    .line 896
    :cond_11
    const-string v4, "doShareToQzone() -- QQ Version is > 4.6.0"

    .line 897
    .line 898
    invoke-static {v5, v4}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 899
    .line 900
    .line 901
    invoke-static {}, Lcom/tencent/connect/common/UIListenerManager;->getInstance()Lcom/tencent/connect/common/UIListenerManager;

    .line 902
    .line 903
    .line 904
    move-result-object v4

    .line 905
    const-string v6, "shareToQzone"

    .line 906
    .line 907
    invoke-virtual {v4, v6, v3}, Lcom/tencent/connect/common/UIListenerManager;->setListnerWithAction(Ljava/lang/String;Lcom/tencent/tauth/IUiListener;)Ljava/lang/Object;

    .line 908
    .line 909
    .line 910
    move-result-object v3

    .line 911
    if-eqz v3, :cond_12

    .line 912
    .line 913
    const-string v3, "doShareToQzone() -- do listener onCancel()"

    .line 914
    .line 915
    invoke-static {v5, v3}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 916
    .line 917
    .line 918
    :cond_12
    const/16 v3, 0x2778

    .line 919
    .line 920
    const/4 v9, 0x0

    .line 921
    invoke-virtual {v1, v2, v3, v0, v9}, Lcom/tencent/connect/common/BaseApi;->a(Landroid/app/Activity;ILandroid/content/Intent;Z)V

    .line 922
    .line 923
    .line 924
    :goto_7
    const-string v0, "openSDK_LOG"

    .line 925
    .line 926
    const-string v1, "doShareToQzone() --end"

    .line 927
    .line 928
    invoke-static {v0, v1}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    .line 930
    .line 931
    return-void
.end method


# virtual methods
.method public releaseResource()V
    .locals 0

    return-void
.end method

.method public shareToQzone(Landroid/app/Activity;Landroid/os/Bundle;Lcom/tencent/tauth/IUiListener;)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    const-string v4, "shareToQzone() -- start"

    .line 10
    .line 11
    const-string v6, "openSDK_LOG.QzoneShare"

    .line 12
    .line 13
    invoke-static {v6, v4}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v6, v3}, Lcom/tencent/connect/a;->a(Ljava/lang/String;Lcom/tencent/tauth/IUiListener;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v4, -0x6

    .line 24
    const/4 v5, 0x4

    .line 25
    const/4 v7, 0x0

    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 29
    .line 30
    const-string v2, "\u4f20\u5165\u53c2\u6570\u4e0d\u53ef\u4ee5\u4e3a\u7a7a"

    .line 31
    .line 32
    invoke-direct {v1, v4, v2, v7}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "shareToQzone() params is null"

    .line 39
    .line 40
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v11

    .line 53
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v13

    .line 65
    const/4 v15, 0x1

    .line 66
    const-string v16, "\u4f20\u5165\u53c2\u6570\u4e0d\u53ef\u4ee5\u4e3a\u7a7a"

    .line 67
    .line 68
    const/4 v8, 0x1

    .line 69
    const-string v9, "SHARE_CHECK_SDK"

    .line 70
    .line 71
    const-string v10, "1000"

    .line 72
    .line 73
    const/4 v14, 0x0

    .line 74
    invoke-virtual/range {v7 .. v16}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    const-string v8, "title"

    .line 79
    .line 80
    invoke-virtual {v2, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    const-string v10, "summary"

    .line 85
    .line 86
    invoke-virtual {v2, v10}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v11

    .line 90
    const-string v12, "targetUrl"

    .line 91
    .line 92
    invoke-virtual {v2, v12}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    const-string v13, "mini_program_appid"

    .line 97
    .line 98
    invoke-virtual {v2, v13}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    const-string v14, "mini_program_path"

    .line 103
    .line 104
    invoke-virtual {v2, v14}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v14

    .line 108
    const-string v15, "imageUrl"

    .line 109
    .line 110
    move/from16 v16, v5

    .line 111
    .line 112
    invoke-virtual {v2, v15}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-static {v1}, Lcom/tencent/open/utils/n;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    const-string v7, "appName"

    .line 121
    .line 122
    move-object/from16 v19, v9

    .line 123
    .line 124
    if-nez v4, :cond_2

    .line 125
    .line 126
    invoke-virtual {v2, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    move-object/from16 v21, v12

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    move-object/from16 v21, v12

    .line 138
    .line 139
    const/16 v12, 0x14

    .line 140
    .line 141
    if-le v9, v12, :cond_3

    .line 142
    .line 143
    const/4 v9, 0x0

    .line 144
    invoke-virtual {v4, v9, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    const-string v9, "..."

    .line 149
    .line 150
    invoke-virtual {v4, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    :cond_3
    :goto_0
    const-string v9, "req_type"

    .line 155
    .line 156
    invoke-virtual {v2, v9}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v9

    .line 160
    new-instance v12, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    move-object/from16 v22, v13

    .line 163
    .line 164
    const-string v13, "shareToQzone() get SHARE_TO_QZONE_KEY_TYPE: "

    .line 165
    .line 166
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v12

    .line 176
    invoke-static {v6, v12}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const-string v12, "1"

    .line 180
    .line 181
    const/4 v13, 0x5

    .line 182
    move-object/from16 v23, v14

    .line 183
    .line 184
    const/4 v14, 0x1

    .line 185
    if-eq v9, v14, :cond_5

    .line 186
    .line 187
    if-eq v9, v13, :cond_4

    .line 188
    .line 189
    iput-object v12, v0, Lcom/tencent/connect/share/QzoneShare;->mViaShareQzoneType:Ljava/lang/String;

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_4
    const-string v12, "2"

    .line 193
    .line 194
    iput-object v12, v0, Lcom/tencent/connect/share/QzoneShare;->mViaShareQzoneType:Ljava/lang/String;

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_5
    iput-object v12, v0, Lcom/tencent/connect/share/QzoneShare;->mViaShareQzoneType:Ljava/lang/String;

    .line 198
    .line 199
    :goto_1
    if-eq v9, v14, :cond_c

    .line 200
    .line 201
    if-eq v9, v13, :cond_b

    .line 202
    .line 203
    const/4 v13, 0x7

    .line 204
    if-eq v9, v13, :cond_8

    .line 205
    .line 206
    invoke-static/range {v19 .. v19}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 207
    .line 208
    .line 209
    move-result v13

    .line 210
    if-eqz v13, :cond_7

    .line 211
    .line 212
    invoke-static {v11}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v13

    .line 216
    if-eqz v13, :cond_7

    .line 217
    .line 218
    if-eqz v5, :cond_6

    .line 219
    .line 220
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 221
    .line 222
    .line 223
    move-result v13

    .line 224
    if-eqz v13, :cond_6

    .line 225
    .line 226
    const/4 v13, 0x0

    .line 227
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_6
    new-instance v13, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v12, "\u6765\u81ea"

    .line 233
    .line 234
    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    const-string v12, "\u7684\u5206\u4eab"

    .line 241
    .line 242
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v12

    .line 249
    iput-boolean v14, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 250
    .line 251
    :goto_2
    const/4 v13, 0x0

    .line 252
    goto :goto_4

    .line 253
    :cond_7
    iput-boolean v14, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 254
    .line 255
    :goto_3
    move-object/from16 v12, v19

    .line 256
    .line 257
    goto :goto_2

    .line 258
    :goto_4
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->d:Z

    .line 259
    .line 260
    new-instance v13, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string v14, "-->shareToQzone, default needTitle = true, shareType = "

    .line 263
    .line 264
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v13

    .line 274
    invoke-static {v6, v13}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    const/4 v13, 0x1

    .line 278
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->e:Z

    .line 279
    .line 280
    const/4 v13, 0x0

    .line 281
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->f:Z

    .line 282
    .line 283
    move/from16 v22, v9

    .line 284
    .line 285
    move-object v9, v12

    .line 286
    goto/16 :goto_9

    .line 287
    .line 288
    :cond_8
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v12

    .line 292
    if-nez v12, :cond_a

    .line 293
    .line 294
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result v12

    .line 298
    if-eqz v12, :cond_9

    .line 299
    .line 300
    goto :goto_6

    .line 301
    :cond_9
    move/from16 v22, v9

    .line 302
    .line 303
    const/4 v9, -0x5

    .line 304
    :goto_5
    const/4 v13, 0x0

    .line 305
    goto :goto_7

    .line 306
    :cond_a
    :goto_6
    new-instance v12, Lcom/tencent/tauth/UiError;

    .line 307
    .line 308
    const-string v13, "\u4f20\u5165\u53c2\u6570\u6709\u8bef!"

    .line 309
    .line 310
    const-string v14, "appid or path empty."

    .line 311
    .line 312
    move/from16 v22, v9

    .line 313
    .line 314
    const/4 v9, -0x5

    .line 315
    invoke-direct {v12, v9, v13, v14}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-interface {v3, v12}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 319
    .line 320
    .line 321
    goto :goto_5

    .line 322
    :goto_7
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->e:Z

    .line 323
    .line 324
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->f:Z

    .line 325
    .line 326
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 327
    .line 328
    goto :goto_8

    .line 329
    :cond_b
    const/4 v9, -0x5

    .line 330
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 331
    .line 332
    const-string v2, "\u8bf7\u9009\u62e9\u652f\u6301\u7684\u5206\u4eab\u7c7b\u578b"

    .line 333
    .line 334
    const/4 v4, 0x0

    .line 335
    invoke-direct {v1, v9, v2, v4}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 339
    .line 340
    .line 341
    const-string v1, "shareToQzone() error--end\u8bf7\u9009\u62e9\u652f\u6301\u7684\u5206\u4eab\u7c7b\u578b"

    .line 342
    .line 343
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 347
    .line 348
    .line 349
    move-result-object v17

    .line 350
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 351
    .line 352
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v21

    .line 356
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v22

    .line 360
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 361
    .line 362
    .line 363
    move-result-wide v0

    .line 364
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 365
    .line 366
    .line 367
    move-result-object v23

    .line 368
    const/16 v25, 0x1

    .line 369
    .line 370
    const-string v26, "shareToQzone() \u8bf7\u9009\u62e9\u652f\u6301\u7684\u5206\u4eab\u7c7b\u578b"

    .line 371
    .line 372
    const/16 v18, 0x1

    .line 373
    .line 374
    const-string v19, "SHARE_CHECK_SDK"

    .line 375
    .line 376
    const-string v20, "1000"

    .line 377
    .line 378
    const/16 v24, 0x0

    .line 379
    .line 380
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 381
    .line 382
    .line 383
    return-void

    .line 384
    :cond_c
    move/from16 v22, v9

    .line 385
    .line 386
    const-string v9, "-->shareToQzone, SHARE_TO_QZONE_TYPE_IMAGE_TEXT needTitle = true"

    .line 387
    .line 388
    invoke-static {v6, v9}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    const/4 v13, 0x1

    .line 392
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 393
    .line 394
    const/4 v9, 0x0

    .line 395
    iput-boolean v9, v0, Lcom/tencent/connect/share/QzoneShare;->d:Z

    .line 396
    .line 397
    iput-boolean v13, v0, Lcom/tencent/connect/share/QzoneShare;->e:Z

    .line 398
    .line 399
    iput-boolean v9, v0, Lcom/tencent/connect/share/QzoneShare;->f:Z

    .line 400
    .line 401
    :goto_8
    move-object/from16 v9, v19

    .line 402
    .line 403
    :goto_9
    invoke-static {}, Lcom/tencent/open/utils/n;->a()Z

    .line 404
    .line 405
    .line 406
    move-result v12

    .line 407
    const-string v13, "4.5.0"

    .line 408
    .line 409
    if-nez v12, :cond_d

    .line 410
    .line 411
    invoke-static {v1, v13}, Lcom/tencent/open/utils/n;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 412
    .line 413
    .line 414
    move-result v12

    .line 415
    if-eqz v12, :cond_d

    .line 416
    .line 417
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 418
    .line 419
    const-string v2, "\u5206\u4eab\u56fe\u7247\u5931\u8d25\uff0c\u68c0\u6d4b\u4e0d\u5230SD\u5361!"

    .line 420
    .line 421
    const/4 v4, -0x6

    .line 422
    const/4 v5, 0x0

    .line 423
    invoke-direct {v1, v4, v2, v5}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 427
    .line 428
    .line 429
    const-string v1, "shareToQzone() sdcard is null--end"

    .line 430
    .line 431
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    .line 433
    .line 434
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 435
    .line 436
    .line 437
    move-result-object v17

    .line 438
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 439
    .line 440
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v21

    .line 444
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v22

    .line 448
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 449
    .line 450
    .line 451
    move-result-wide v0

    .line 452
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 453
    .line 454
    .line 455
    move-result-object v23

    .line 456
    const/16 v25, 0x1

    .line 457
    .line 458
    const-string v26, "\u5206\u4eab\u56fe\u7247\u5931\u8d25\uff0c\u68c0\u6d4b\u4e0d\u5230SD\u5361!"

    .line 459
    .line 460
    const/16 v18, 0x1

    .line 461
    .line 462
    const-string v19, "SHARE_CHECK_SDK"

    .line 463
    .line 464
    const-string v20, "1000"

    .line 465
    .line 466
    const/16 v24, 0x0

    .line 467
    .line 468
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :cond_d
    iget-boolean v12, v0, Lcom/tencent/connect/share/QzoneShare;->a:Z

    .line 473
    .line 474
    if-eqz v12, :cond_f

    .line 475
    .line 476
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 477
    .line 478
    .line 479
    move-result v12

    .line 480
    if-eqz v12, :cond_e

    .line 481
    .line 482
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 483
    .line 484
    const-string v2, "targetUrl\u4e3a\u5fc5\u586b\u9879\uff0c\u8bf7\u8865\u5145\u540e\u5206\u4eab"

    .line 485
    .line 486
    const/4 v4, 0x0

    .line 487
    const/4 v9, -0x5

    .line 488
    invoke-direct {v1, v9, v2, v4}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 492
    .line 493
    .line 494
    const-string v1, "shareToQzone() targetUrl null error--end"

    .line 495
    .line 496
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 500
    .line 501
    .line 502
    move-result-object v17

    .line 503
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 504
    .line 505
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v21

    .line 509
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v22

    .line 513
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 514
    .line 515
    .line 516
    move-result-wide v0

    .line 517
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 518
    .line 519
    .line 520
    move-result-object v23

    .line 521
    const/16 v25, 0x1

    .line 522
    .line 523
    const-string v26, "targetUrl\u4e3a\u5fc5\u586b\u9879\uff0c\u8bf7\u8865\u5145\u540e\u5206\u4eab"

    .line 524
    .line 525
    const/16 v18, 0x1

    .line 526
    .line 527
    const-string v19, "SHARE_CHECK_SDK"

    .line 528
    .line 529
    const-string v20, "1000"

    .line 530
    .line 531
    const/16 v24, 0x0

    .line 532
    .line 533
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 534
    .line 535
    .line 536
    return-void

    .line 537
    :cond_e
    invoke-static/range {v21 .. v21}, Lcom/tencent/open/utils/n;->h(Ljava/lang/String;)Z

    .line 538
    .line 539
    .line 540
    move-result v12

    .line 541
    if-nez v12, :cond_f

    .line 542
    .line 543
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 544
    .line 545
    const-string v2, "targetUrl\u6709\u8bef"

    .line 546
    .line 547
    const/4 v4, 0x0

    .line 548
    const/4 v9, -0x5

    .line 549
    invoke-direct {v1, v9, v2, v4}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 553
    .line 554
    .line 555
    const-string v1, "shareToQzone() targetUrl error--end"

    .line 556
    .line 557
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    .line 559
    .line 560
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 561
    .line 562
    .line 563
    move-result-object v17

    .line 564
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 565
    .line 566
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object v21

    .line 570
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v22

    .line 574
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 575
    .line 576
    .line 577
    move-result-wide v0

    .line 578
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 579
    .line 580
    .line 581
    move-result-object v23

    .line 582
    const/16 v25, 0x1

    .line 583
    .line 584
    const-string v26, "targetUrl\u6709\u8bef"

    .line 585
    .line 586
    const/16 v18, 0x1

    .line 587
    .line 588
    const-string v19, "SHARE_CHECK_SDK"

    .line 589
    .line 590
    const-string v20, "1000"

    .line 591
    .line 592
    const/16 v24, 0x0

    .line 593
    .line 594
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 595
    .line 596
    .line 597
    return-void

    .line 598
    :cond_f
    iget-boolean v12, v0, Lcom/tencent/connect/share/QzoneShare;->d:Z

    .line 599
    .line 600
    const-string v14, ""

    .line 601
    .line 602
    if-eqz v12, :cond_10

    .line 603
    .line 604
    invoke-virtual {v2, v8, v14}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v2, v10, v14}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    .line 609
    .line 610
    move-object/from16 v19, v14

    .line 611
    .line 612
    goto/16 :goto_c

    .line 613
    .line 614
    :cond_10
    iget-boolean v12, v0, Lcom/tencent/connect/share/QzoneShare;->e:Z

    .line 615
    .line 616
    if-eqz v12, :cond_11

    .line 617
    .line 618
    invoke-static {v9}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 619
    .line 620
    .line 621
    move-result v12

    .line 622
    if-eqz v12, :cond_11

    .line 623
    .line 624
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 625
    .line 626
    const-string v2, "title\u4e0d\u80fd\u4e3a\u7a7a!"

    .line 627
    .line 628
    const/4 v4, -0x6

    .line 629
    const/4 v5, 0x0

    .line 630
    invoke-direct {v1, v4, v2, v5}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 634
    .line 635
    .line 636
    const-string v1, "shareToQzone() title is null--end"

    .line 637
    .line 638
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    .line 640
    .line 641
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 642
    .line 643
    .line 644
    move-result-object v17

    .line 645
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 646
    .line 647
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 648
    .line 649
    .line 650
    move-result-object v21

    .line 651
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 652
    .line 653
    .line 654
    move-result-object v22

    .line 655
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 656
    .line 657
    .line 658
    move-result-wide v0

    .line 659
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 660
    .line 661
    .line 662
    move-result-object v23

    .line 663
    const/16 v25, 0x1

    .line 664
    .line 665
    const-string v26, "shareToQzone() title is null"

    .line 666
    .line 667
    const/16 v18, 0x1

    .line 668
    .line 669
    const-string v19, "SHARE_CHECK_SDK"

    .line 670
    .line 671
    const-string v20, "1000"

    .line 672
    .line 673
    const/16 v24, 0x0

    .line 674
    .line 675
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 676
    .line 677
    .line 678
    return-void

    .line 679
    :cond_11
    invoke-static {v9}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 680
    .line 681
    .line 682
    move-result v12

    .line 683
    if-nez v12, :cond_13

    .line 684
    .line 685
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 686
    .line 687
    .line 688
    move-result v12

    .line 689
    move-object/from16 v19, v14

    .line 690
    .line 691
    const/16 v14, 0xc8

    .line 692
    .line 693
    if-le v12, v14, :cond_12

    .line 694
    .line 695
    const/4 v12, 0x0

    .line 696
    invoke-static {v9, v14, v12, v12}, Lcom/tencent/open/utils/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v9

    .line 700
    invoke-virtual {v2, v8, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    goto :goto_b

    .line 704
    :cond_12
    :goto_a
    const/4 v12, 0x0

    .line 705
    goto :goto_b

    .line 706
    :cond_13
    move-object/from16 v19, v14

    .line 707
    .line 708
    goto :goto_a

    .line 709
    :goto_b
    invoke-static {v11}, Lcom/tencent/open/utils/n;->e(Ljava/lang/String;)Z

    .line 710
    .line 711
    .line 712
    move-result v8

    .line 713
    if-nez v8, :cond_14

    .line 714
    .line 715
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 716
    .line 717
    .line 718
    move-result v8

    .line 719
    const/16 v9, 0x258

    .line 720
    .line 721
    if-le v8, v9, :cond_14

    .line 722
    .line 723
    invoke-static {v11, v9, v12, v12}, Lcom/tencent/open/utils/n;->a(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 724
    .line 725
    .line 726
    move-result-object v8

    .line 727
    invoke-virtual {v2, v10, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 728
    .line 729
    .line 730
    :cond_14
    :goto_c
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 731
    .line 732
    .line 733
    move-result v8

    .line 734
    if-nez v8, :cond_15

    .line 735
    .line 736
    invoke-virtual {v2, v7, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    .line 738
    .line 739
    :cond_15
    if-eqz v5, :cond_1a

    .line 740
    .line 741
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 742
    .line 743
    .line 744
    move-result v4

    .line 745
    if-nez v4, :cond_16

    .line 746
    .line 747
    goto :goto_e

    .line 748
    :cond_16
    const/4 v9, 0x0

    .line 749
    :goto_d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 750
    .line 751
    .line 752
    move-result v4

    .line 753
    if-ge v9, v4, :cond_18

    .line 754
    .line 755
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 756
    .line 757
    .line 758
    move-result-object v4

    .line 759
    check-cast v4, Ljava/lang/String;

    .line 760
    .line 761
    invoke-static {v4}, Lcom/tencent/open/utils/n;->h(Ljava/lang/String;)Z

    .line 762
    .line 763
    .line 764
    move-result v7

    .line 765
    if-nez v7, :cond_17

    .line 766
    .line 767
    invoke-static {v4}, Lcom/tencent/open/utils/n;->i(Ljava/lang/String;)Z

    .line 768
    .line 769
    .line 770
    move-result v4

    .line 771
    if-nez v4, :cond_17

    .line 772
    .line 773
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 774
    .line 775
    .line 776
    add-int/lit8 v9, v9, -0x1

    .line 777
    .line 778
    :cond_17
    const/16 v26, 0x1

    .line 779
    .line 780
    add-int/lit8 v9, v9, 0x1

    .line 781
    .line 782
    goto :goto_d

    .line 783
    :cond_18
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 784
    .line 785
    .line 786
    move-result v4

    .line 787
    if-nez v4, :cond_19

    .line 788
    .line 789
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 790
    .line 791
    const-string v2, "\u975e\u6cd5\u7684\u56fe\u7247\u5730\u5740!"

    .line 792
    .line 793
    const/4 v4, -0x6

    .line 794
    const/4 v5, 0x0

    .line 795
    invoke-direct {v1, v4, v2, v5}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 796
    .line 797
    .line 798
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 799
    .line 800
    .line 801
    const-string v1, "shareToQzone() MSG_PARAM_IMAGE_URL_FORMAT_ERROR--end"

    .line 802
    .line 803
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 807
    .line 808
    .line 809
    move-result-object v17

    .line 810
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 811
    .line 812
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 813
    .line 814
    .line 815
    move-result-object v21

    .line 816
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 817
    .line 818
    .line 819
    move-result-object v22

    .line 820
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 821
    .line 822
    .line 823
    move-result-wide v0

    .line 824
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 825
    .line 826
    .line 827
    move-result-object v23

    .line 828
    const/16 v25, 0x1

    .line 829
    .line 830
    const-string v26, "shareToQzone() \u975e\u6cd5\u7684\u56fe\u7247\u5730\u5740!"

    .line 831
    .line 832
    const/16 v18, 0x1

    .line 833
    .line 834
    const-string v19, "SHARE_CHECK_SDK"

    .line 835
    .line 836
    const-string v20, "1000"

    .line 837
    .line 838
    const/16 v24, 0x0

    .line 839
    .line 840
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 841
    .line 842
    .line 843
    return-void

    .line 844
    :cond_19
    invoke-virtual {v2, v15, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 845
    .line 846
    .line 847
    goto :goto_f

    .line 848
    :cond_1a
    :goto_e
    iget-boolean v4, v0, Lcom/tencent/connect/share/QzoneShare;->f:Z

    .line 849
    .line 850
    if-eqz v4, :cond_1b

    .line 851
    .line 852
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 853
    .line 854
    const-string v2, "\u7eaf\u56fe\u5206\u4eab\uff0cimageUrl \u4e0d\u80fd\u4e3a\u7a7a"

    .line 855
    .line 856
    const/4 v4, -0x6

    .line 857
    const/4 v5, 0x0

    .line 858
    invoke-direct {v1, v4, v2, v5}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 859
    .line 860
    .line 861
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 862
    .line 863
    .line 864
    const-string v1, "shareToQzone() imageUrl is null -- end"

    .line 865
    .line 866
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 867
    .line 868
    .line 869
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 870
    .line 871
    .line 872
    move-result-object v17

    .line 873
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 874
    .line 875
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 876
    .line 877
    .line 878
    move-result-object v21

    .line 879
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 880
    .line 881
    .line 882
    move-result-object v22

    .line 883
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 884
    .line 885
    .line 886
    move-result-wide v0

    .line 887
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 888
    .line 889
    .line 890
    move-result-object v23

    .line 891
    const/16 v25, 0x1

    .line 892
    .line 893
    const-string v26, "shareToQzone() imageUrl is null"

    .line 894
    .line 895
    const/16 v18, 0x1

    .line 896
    .line 897
    const-string v19, "SHARE_CHECK_SDK"

    .line 898
    .line 899
    const-string v20, "1000"

    .line 900
    .line 901
    const/16 v24, 0x0

    .line 902
    .line 903
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 904
    .line 905
    .line 906
    return-void

    .line 907
    :cond_1b
    :goto_f
    const-string v4, "4.6.0"

    .line 908
    .line 909
    invoke-static {v1, v4}, Lcom/tencent/open/utils/n;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 910
    .line 911
    .line 912
    move-result v7

    .line 913
    if-nez v7, :cond_1c

    .line 914
    .line 915
    const-string v4, "shareToQzone() qqver greater than 4.6.0"

    .line 916
    .line 917
    invoke-static {v6, v4}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    .line 919
    .line 920
    invoke-direct/range {p0 .. p3}, Lcom/tencent/connect/share/QzoneShare;->b(Landroid/app/Activity;Landroid/os/Bundle;Lcom/tencent/tauth/IUiListener;)V

    .line 921
    .line 922
    .line 923
    goto/16 :goto_10

    .line 924
    .line 925
    :cond_1c
    const-string v7, "4.2.0"

    .line 926
    .line 927
    invoke-static {v1, v7}, Lcom/tencent/open/utils/l;->c(Landroid/content/Context;Ljava/lang/String;)I

    .line 928
    .line 929
    .line 930
    move-result v7

    .line 931
    if-ltz v7, :cond_20

    .line 932
    .line 933
    invoke-static {v1, v4}, Lcom/tencent/open/utils/l;->c(Landroid/content/Context;Ljava/lang/String;)I

    .line 934
    .line 935
    .line 936
    move-result v4

    .line 937
    if-gez v4, :cond_20

    .line 938
    .line 939
    const-string v4, "shareToQzone() qqver between 4.2.0 and 4.6.0, will use qqshare"

    .line 940
    .line 941
    invoke-static {v6, v4}, Lcom/tencent/open/log/SLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    .line 943
    .line 944
    new-instance v4, Lcom/tencent/connect/share/QQShare;

    .line 945
    .line 946
    iget-object v7, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 947
    .line 948
    invoke-direct {v4, v1, v7}, Lcom/tencent/connect/share/QQShare;-><init>(Landroid/content/Context;Lcom/tencent/connect/auth/QQToken;)V

    .line 949
    .line 950
    .line 951
    if-eqz v5, :cond_1e

    .line 952
    .line 953
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 954
    .line 955
    .line 956
    move-result v7

    .line 957
    if-lez v7, :cond_1e

    .line 958
    .line 959
    const/4 v9, 0x0

    .line 960
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 961
    .line 962
    .line 963
    move-result-object v5

    .line 964
    check-cast v5, Ljava/lang/String;

    .line 965
    .line 966
    move/from16 v7, v22

    .line 967
    .line 968
    const/4 v8, 0x5

    .line 969
    if-ne v7, v8, :cond_1d

    .line 970
    .line 971
    invoke-static {v5}, Lcom/tencent/open/utils/n;->i(Ljava/lang/String;)Z

    .line 972
    .line 973
    .line 974
    move-result v7

    .line 975
    if-nez v7, :cond_1d

    .line 976
    .line 977
    new-instance v1, Lcom/tencent/tauth/UiError;

    .line 978
    .line 979
    const-string v2, "\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u7eaf\u56fe\u5206\u4eab\u4e0d\u652f\u6301\u7f51\u8def\u56fe\u7247"

    .line 980
    .line 981
    const/4 v4, -0x6

    .line 982
    const/4 v5, 0x0

    .line 983
    invoke-direct {v1, v4, v2, v5}, Lcom/tencent/tauth/UiError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 984
    .line 985
    .line 986
    invoke-interface {v3, v1}, Lcom/tencent/tauth/IUiListener;->onError(Lcom/tencent/tauth/UiError;)V

    .line 987
    .line 988
    .line 989
    const-string v1, "shareToQzone()\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u7eaf\u56fe\u5206\u4eab\u4e0d\u652f\u6301\u7f51\u8def\u56fe\u7247"

    .line 990
    .line 991
    invoke-static {v6, v1}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 992
    .line 993
    .line 994
    invoke-static {}, Lcom/tencent/open/b/e;->a()Lcom/tencent/open/b/e;

    .line 995
    .line 996
    .line 997
    move-result-object v17

    .line 998
    iget-object v0, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 999
    .line 1000
    invoke-virtual {v0}, Lcom/tencent/connect/auth/QQToken;->getAppId()Ljava/lang/String;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v21

    .line 1004
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v22

    .line 1008
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 1009
    .line 1010
    .line 1011
    move-result-wide v0

    .line 1012
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v23

    .line 1016
    const/16 v25, 0x1

    .line 1017
    .line 1018
    const-string v26, "shareToQzone()\u624bQ\u7248\u672c\u8fc7\u4f4e\uff0c\u7eaf\u56fe\u5206\u4eab\u4e0d\u652f\u6301\u7f51\u8def\u56fe\u7247"

    .line 1019
    .line 1020
    const/16 v18, 0x1

    .line 1021
    .line 1022
    const-string v19, "SHARE_CHECK_SDK"

    .line 1023
    .line 1024
    const-string v20, "1000"

    .line 1025
    .line 1026
    const/16 v24, 0x0

    .line 1027
    .line 1028
    invoke-virtual/range {v17 .. v26}, Lcom/tencent/open/b/e;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;IILjava/lang/String;)V

    .line 1029
    .line 1030
    .line 1031
    return-void

    .line 1032
    :cond_1d
    const-string v0, "imageLocalUrl"

    .line 1033
    .line 1034
    invoke-virtual {v2, v0, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1035
    .line 1036
    .line 1037
    :cond_1e
    invoke-static {v1, v13}, Lcom/tencent/open/utils/n;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1038
    .line 1039
    .line 1040
    move-result v0

    .line 1041
    if-nez v0, :cond_1f

    .line 1042
    .line 1043
    const-string v0, "cflag"

    .line 1044
    .line 1045
    const/4 v13, 0x1

    .line 1046
    invoke-virtual {v2, v0, v13}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 1047
    .line 1048
    .line 1049
    :cond_1f
    invoke-virtual {v4, v1, v2, v3}, Lcom/tencent/connect/share/QQShare;->shareToQQ(Landroid/app/Activity;Landroid/os/Bundle;Lcom/tencent/tauth/IUiListener;)V

    .line 1050
    .line 1051
    .line 1052
    goto :goto_10

    .line 1053
    :cond_20
    const-string v2, "shareToQzone() qqver below 4.2.0, will show download dialog"

    .line 1054
    .line 1055
    invoke-static {v6, v2}, Lcom/tencent/open/log/SLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1056
    .line 1057
    .line 1058
    new-instance v2, Lcom/tencent/open/TDialog;

    .line 1059
    .line 1060
    move-object/from16 v3, v19

    .line 1061
    .line 1062
    invoke-virtual {v0, v3}, Lcom/tencent/connect/common/BaseApi;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v3

    .line 1066
    const/4 v4, 0x0

    .line 1067
    iget-object v5, v0, Lcom/tencent/connect/common/BaseApi;->c:Lcom/tencent/connect/auth/QQToken;

    .line 1068
    .line 1069
    move-object v0, v2

    .line 1070
    const-string v2, ""

    .line 1071
    .line 1072
    invoke-direct/range {v0 .. v5}, Lcom/tencent/open/TDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/tauth/IUiListener;Lcom/tencent/connect/auth/QQToken;)V

    .line 1073
    .line 1074
    .line 1075
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 1076
    .line 1077
    .line 1078
    :goto_10
    const-string v0, "shareToQzone() --end"

    .line 1079
    .line 1080
    invoke-static {v6, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1081
    .line 1082
    .line 1083
    return-void
.end method
