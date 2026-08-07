.class public Lcom/tencent/could/huiyansdk/helper/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitFrameworkEventListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/helper/b;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/helper/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrameworkEvent(Ljava/util/HashMap;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "bitmap to base64 fail: "

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "hash map: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "YouTuSdkHelper"

    .line 22
    .line 23
    invoke-static {v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    const-string v3, "operate_catch_error"

    .line 32
    .line 33
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const-string v5, "result str is empty."

    .line 38
    .line 39
    const/4 v6, 0x1

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_0

    .line 53
    .line 54
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 55
    .line 56
    invoke-virtual {v1, v6, v2, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {v1, v3}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    const-string v3, "operate_pack_use_time"

    .line 64
    .line 65
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_2

    .line 82
    .line 83
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 84
    .line 85
    invoke-virtual {v1, v6, v2, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {v1, v3}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    const-string v3, "CONSERVATION_VIDEO_MESSAGE"

    .line 93
    .line 94
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_5

    .line 99
    .line 100
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_4

    .line 111
    .line 112
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 113
    .line 114
    invoke-virtual {v1, v6, v2, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    invoke-virtual {v1, v3}, Lcom/tencent/could/huiyansdk/helper/b;->a(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_5
    :goto_0
    const-string v1, "process_action"

    .line 122
    .line 123
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_a

    .line 128
    .line 129
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    check-cast p0, Ljava/lang/String;

    .line 139
    .line 140
    const-string v0, "failed"

    .line 141
    .line 142
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-nez p0, :cond_6

    .line 147
    .line 148
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 149
    .line 150
    const-string p1, "youtu result is not fail!"

    .line 151
    .line 152
    invoke-virtual {p0, v6, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_6
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 159
    .line 160
    if-nez p0, :cond_7

    .line 161
    .line 162
    const-string p0, "deal with action callback is null!"

    .line 163
    .line 164
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_7
    const-string v0, "message"

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Ljava/lang/String;

    .line 175
    .line 176
    const-string v1, "error_code"

    .line 177
    .line 178
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Ljava/lang/Integer;

    .line 183
    .line 184
    if-eqz v2, :cond_8

    .line 185
    .line 186
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    const v3, 0x500001

    .line 191
    .line 192
    .line 193
    if-ne v2, v3, :cond_8

    .line 194
    .line 195
    const/16 p1, 0x11d

    .line 196
    .line 197
    invoke-interface {p0, p1, v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    const/16 v3, 0xe4

    .line 206
    .line 207
    if-nez v2, :cond_9

    .line 208
    .line 209
    invoke-interface {p0, v3, v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v2, "{\"errorcode\":"

    .line 216
    .line 217
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    check-cast p1, Ljava/lang/Integer;

    .line 225
    .line 226
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string p1, "}"

    .line 230
    .line 231
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-interface {p0, v3, p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_a
    const-string v1, "ui_tips"

    .line 243
    .line 244
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    if-nez v1, :cond_b

    .line 249
    .line 250
    const-string v1, "ui_extra_tips"

    .line 251
    .line 252
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-eqz v1, :cond_c

    .line 257
    .line 258
    :cond_b
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 261
    .line 262
    .line 263
    sget-object v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 264
    .line 265
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 266
    .line 267
    if-eqz v1, :cond_c

    .line 268
    .line 269
    invoke-interface {v1, p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a(Ljava/util/HashMap;)V

    .line 270
    .line 271
    .line 272
    :cond_c
    const-string v1, "action_detect_type"

    .line 273
    .line 274
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    const/4 v4, 0x0

    .line 279
    if-eqz v3, :cond_e

    .line 280
    .line 281
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 282
    .line 283
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    check-cast v1, Ljava/lang/Integer;

    .line 291
    .line 292
    new-instance v3, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string v5, "actionType: "

    .line 295
    .line 296
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v3

    .line 306
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    .line 308
    .line 309
    sget-object v3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 310
    .line 311
    iget-object v3, v3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 312
    .line 313
    if-nez v3, :cond_d

    .line 314
    .line 315
    const-string v1, "deal with action detect callback is null!"

    .line 316
    .line 317
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_d
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    invoke-interface {v3, v1, v4, v6}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a(IZZ)V

    .line 326
    .line 327
    .line 328
    :cond_e
    :goto_1
    const-string v1, "face_best_image"

    .line 329
    .line 330
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    if-eqz v3, :cond_16

    .line 335
    .line 336
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 337
    .line 338
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    check-cast v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$b;

    .line 346
    .line 347
    if-eqz v1, :cond_15

    .line 348
    .line 349
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/FaceQualityState$b;->a:[B

    .line 350
    .line 351
    if-eqz v1, :cond_15

    .line 352
    .line 353
    array-length v3, v1

    .line 354
    invoke-static {v1, v4, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    sget-object v3, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 359
    .line 360
    const/4 v5, 0x0

    .line 361
    const-string v7, "close IO stream fail: "

    .line 362
    .line 363
    const/4 v8, 0x2

    .line 364
    if-eqz v1, :cond_10

    .line 365
    .line 366
    :try_start_0
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    .line 367
    .line 368
    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 369
    .line 370
    .line 371
    :try_start_1
    sget-object v10, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 372
    .line 373
    const/16 v11, 0x64

    .line 374
    .line 375
    invoke-virtual {v1, v10, v11, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 376
    .line 377
    .line 378
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    invoke-static {v1, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 392
    move-object v0, v5

    .line 393
    move-object v5, v9

    .line 394
    goto :goto_5

    .line 395
    :catchall_0
    move-exception p0

    .line 396
    move-object v5, v9

    .line 397
    goto :goto_3

    .line 398
    :catch_0
    move-exception v1

    .line 399
    goto :goto_2

    .line 400
    :catchall_1
    move-exception p0

    .line 401
    goto :goto_3

    .line 402
    :catch_1
    move-exception v1

    .line 403
    move-object v9, v5

    .line 404
    :goto_2
    :try_start_2
    sget-object v10, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 405
    .line 406
    new-instance v11, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    invoke-virtual {v10, v8, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 423
    .line 424
    .line 425
    if-eqz v9, :cond_12

    .line 426
    .line 427
    :try_start_3
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 431
    .line 432
    .line 433
    goto :goto_8

    .line 434
    :catch_2
    move-exception v0

    .line 435
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 436
    .line 437
    new-instance v9, Ljava/lang/StringBuilder;

    .line 438
    .line 439
    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    goto :goto_6

    .line 454
    :goto_3
    if-eqz v5, :cond_f

    .line 455
    .line 456
    :try_start_4
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 460
    .line 461
    .line 462
    goto :goto_4

    .line 463
    :catch_3
    move-exception p1

    .line 464
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 465
    .line 466
    new-instance v1, Ljava/lang/StringBuilder;

    .line 467
    .line 468
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object p1

    .line 482
    invoke-virtual {v0, v8, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    :cond_f
    :goto_4
    throw p0

    .line 486
    :cond_10
    move-object v0, v5

    .line 487
    :goto_5
    if-eqz v5, :cond_11

    .line 488
    .line 489
    :try_start_5
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 493
    .line 494
    .line 495
    goto :goto_7

    .line 496
    :catch_4
    move-exception v1

    .line 497
    sget-object v5, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 498
    .line 499
    new-instance v9, Ljava/lang/StringBuilder;

    .line 500
    .line 501
    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v1

    .line 515
    move-object v12, v5

    .line 516
    move-object v5, v0

    .line 517
    move-object v0, v1

    .line 518
    move-object v1, v12

    .line 519
    :goto_6
    invoke-virtual {v1, v8, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    goto :goto_8

    .line 523
    :cond_11
    :goto_7
    move-object v5, v0

    .line 524
    :cond_12
    :goto_8
    if-eqz v5, :cond_13

    .line 525
    .line 526
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 527
    .line 528
    new-instance v1, Ljava/lang/StringBuilder;

    .line 529
    .line 530
    const-string v7, "best image size: "

    .line 531
    .line 532
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 536
    .line 537
    .line 538
    move-result v7

    .line 539
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v1

    .line 546
    invoke-virtual {v0, v8, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    :cond_13
    iput-object v5, v3, Lcom/tencent/could/huiyansdk/common/a;->a:Ljava/lang/String;

    .line 550
    .line 551
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 552
    .line 553
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 554
    .line 555
    if-nez v0, :cond_14

    .line 556
    .line 557
    const-string v0, "deal with best face image callback is null!"

    .line 558
    .line 559
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    .line 561
    .line 562
    goto :goto_9

    .line 563
    :cond_14
    invoke-interface {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a()V

    .line 564
    .line 565
    .line 566
    goto :goto_9

    .line 567
    :cond_15
    const-string v0, "deal with best face image bestFaceImage is null!"

    .line 568
    .line 569
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    .line 571
    .line 572
    :cond_16
    :goto_9
    const-string v0, "reset_custom_timeout"

    .line 573
    .line 574
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    .line 575
    .line 576
    .line 577
    move-result v0

    .line 578
    if-eqz v0, :cond_18

    .line 579
    .line 580
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 581
    .line 582
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 583
    .line 584
    .line 585
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 586
    .line 587
    const-string v1, "deal with reset custom time out!"

    .line 588
    .line 589
    invoke-virtual {v0, v6, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 593
    .line 594
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 595
    .line 596
    if-nez v0, :cond_17

    .line 597
    .line 598
    const-string v0, "deal with best face reset callback is null!"

    .line 599
    .line 600
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    .line 602
    .line 603
    goto :goto_a

    .line 604
    :cond_17
    sget-object v1, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 605
    .line 606
    const-string v3, ""

    .line 607
    .line 608
    iput-object v3, v1, Lcom/tencent/could/huiyansdk/common/a;->a:Ljava/lang/String;

    .line 609
    .line 610
    invoke-interface {v0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->c()V

    .line 611
    .line 612
    .line 613
    :cond_18
    :goto_a
    const-string v0, "action_detect_done_type"

    .line 614
    .line 615
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-eqz v1, :cond_1b

    .line 620
    .line 621
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 622
    .line 623
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 624
    .line 625
    .line 626
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    check-cast v0, Ljava/lang/Integer;

    .line 631
    .line 632
    const-string v1, "action_detect_done_last_count"

    .line 633
    .line 634
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    check-cast v1, Ljava/lang/Integer;

    .line 639
    .line 640
    new-instance v3, Ljava/lang/StringBuilder;

    .line 641
    .line 642
    const-string v5, "remain actions num: "

    .line 643
    .line 644
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v3

    .line 654
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    .line 656
    .line 657
    sget-object v3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 658
    .line 659
    iget-object v3, v3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 660
    .line 661
    if-nez v3, :cond_19

    .line 662
    .line 663
    const-string v0, "deal with action detect done callback is null!"

    .line 664
    .line 665
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    .line 667
    .line 668
    goto :goto_b

    .line 669
    :cond_19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 670
    .line 671
    .line 672
    move-result v0

    .line 673
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 674
    .line 675
    .line 676
    move-result v1

    .line 677
    if-nez v1, :cond_1a

    .line 678
    .line 679
    move v4, v6

    .line 680
    :cond_1a
    invoke-interface {v3, v0, v6, v4}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a(IZZ)V

    .line 681
    .line 682
    .line 683
    :cond_1b
    :goto_b
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    const-string v1, "ActionLivenessState"

    .line 688
    .line 689
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 690
    .line 691
    .line 692
    move-result v0

    .line 693
    if-eqz v0, :cond_1e

    .line 694
    .line 695
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 696
    .line 697
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 698
    .line 699
    .line 700
    const-string p0, "state_stats"

    .line 701
    .line 702
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    .line 704
    .line 705
    move-result-object p0

    .line 706
    check-cast p0, Ljava/util/HashMap;

    .line 707
    .line 708
    if-eqz p0, :cond_1e

    .line 709
    .line 710
    const-string p1, "state_action"

    .line 711
    .line 712
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    .line 714
    .line 715
    move-result-object p0

    .line 716
    const-string p1, "exit"

    .line 717
    .line 718
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 719
    .line 720
    .line 721
    move-result p0

    .line 722
    if-nez p0, :cond_1c

    .line 723
    .line 724
    goto :goto_c

    .line 725
    :cond_1c
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 726
    .line 727
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 728
    .line 729
    if-nez p0, :cond_1d

    .line 730
    .line 731
    const-string p0, "deal with all action done callback is null!"

    .line 732
    .line 733
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    .line 735
    .line 736
    goto :goto_c

    .line 737
    :cond_1d
    const/4 p1, 0x6

    .line 738
    invoke-interface {p0, p1, v6, v6}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a(IZZ)V

    .line 739
    .line 740
    .line 741
    :cond_1e
    :goto_c
    return-void
.end method

.method public onNetworkRequestEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p3, "getLiveType"

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const-string v0, "YouTuSdkHelper"

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    if-eqz p3, :cond_2

    .line 11
    .line 12
    sget-object p3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 13
    .line 14
    iget-object v2, p3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    const-string v3, "GetConfigUseTime"

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const-string v5, ""

    .line 22
    .line 23
    invoke-interface {v2, v3, v1, v4, v5}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 27
    .line 28
    iput-object p4, v2, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 29
    .line 30
    sget-object p4, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 31
    .line 32
    const-string v2, "send call back get live"

    .line 33
    .line 34
    invoke-virtual {p4, v1, v0, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 38
    .line 39
    if-nez p3, :cond_1

    .line 40
    .line 41
    const-string p3, "send get live error, base call back is null"

    .line 42
    .line 43
    invoke-virtual {p4, v1, v0, p3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-interface {p3, p2}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    const-string p3, "compare"

    .line 51
    .line 52
    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/helper/a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 64
    .line 65
    const-string p1, "send live compare result."

    .line 66
    .line 67
    invoke-virtual {p0, v1, v0, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    const-string p1, "send get live error, base call back is null."

    .line 77
    .line 78
    invoke-virtual {p0, v1, v0, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-interface {p1, p2}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->b(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    return-void
.end method
