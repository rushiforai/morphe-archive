.class public Lcom/tencent/could/huiyansdk/fragments/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/aicamare/callback/CameraEventListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a()V
    .locals 15

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, "on get camera succeed!"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const-string v3, "AuthingFragment"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 12
    .line 13
    iget-boolean v4, v1, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    const-string v6, "TuringSdkHelper"

    .line 17
    .line 18
    const/4 v7, 0x2

    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 22
    .line 23
    if-nez v4, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 27
    .line 28
    check-cast v4, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v8, "get auth error info, turing is not create! "

    .line 38
    .line 39
    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-boolean v8, v1, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 43
    .line 44
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v8, ", "

    .line 48
    .line 49
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v8, v1, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 53
    .line 54
    if-nez v8, :cond_2

    .line 55
    .line 56
    move v8, v2

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v8, v5

    .line 59
    :goto_1
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v0, v7, v6, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v4, "init error"

    .line 70
    .line 71
    :goto_2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    if-nez v8, :cond_4

    .line 76
    .line 77
    sget-object v8, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 78
    .line 79
    iget-object v8, v8, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->c:Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

    .line 80
    .line 81
    if-nez v8, :cond_3

    .line 82
    .line 83
    move v8, v2

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    invoke-virtual {v8}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->isOpenCheckRiskMode()Z

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    :goto_3
    if-eqz v8, :cond_4

    .line 90
    .line 91
    const-string v1, "turing auth error!"

    .line 92
    .line 93
    invoke-virtual {v0, v7, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 102
    .line 103
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_turing_auth_lic_error:I

    .line 104
    .line 105
    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p0, " error: "

    .line 113
    .line 114
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const/16 v0, 0xe7

    .line 125
    .line 126
    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_4
    sget-object v4, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 131
    .line 132
    iget-boolean v4, v4, Lcom/tencent/could/huiyansdk/common/a;->e:Z

    .line 133
    .line 134
    if-eqz v4, :cond_5

    .line 135
    .line 136
    const-string v1, "get config first."

    .line 137
    .line 138
    invoke-virtual {v0, v7, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 142
    .line 143
    new-instance v1, Lcom/tencent/could/huiyansdk/fragments/e$a;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Lcom/tencent/could/huiyansdk/fragments/e$a;-><init>(Lcom/tencent/could/huiyansdk/fragments/e;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 149
    .line 150
    if-eqz p0, :cond_10

    .line 151
    .line 152
    invoke-interface {p0, v1}, Lcom/tencent/could/huiyansdk/api/b;->onPrepare(Lcom/tencent/could/huiyansdk/api/d;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_5
    const-string v4, "not get config first."

    .line 157
    .line 158
    invoke-virtual {v0, v7, v3, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 162
    .line 163
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 164
    .line 165
    check-cast v4, Landroid/view/View;

    .line 166
    .line 167
    iget-object v8, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 168
    .line 169
    iput-boolean v5, v1, Lcom/tencent/could/huiyansdk/turing/f;->k:Z

    .line 170
    .line 171
    iget-boolean v9, v1, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 172
    .line 173
    if-nez v9, :cond_6

    .line 174
    .line 175
    const-string v1, "start turing face defender, turing is not create!"

    .line 176
    .line 177
    invoke-virtual {v0, v7, v6, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const/16 v5, -0x2bd

    .line 181
    .line 182
    goto/16 :goto_9

    .line 183
    .line 184
    :cond_6
    iget-object v9, v1, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 185
    .line 186
    if-nez v9, :cond_7

    .line 187
    .line 188
    const-string v1, "start turing face defender, turing interface is null"

    .line 189
    .line 190
    invoke-virtual {v0, v7, v6, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    const/16 v5, -0x2be

    .line 194
    .line 195
    goto/16 :goto_9

    .line 196
    .line 197
    :cond_7
    new-instance v9, Ljava/lang/ref/WeakReference;

    .line 198
    .line 199
    invoke-direct {v9, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    :try_start_0
    invoke-virtual {v8}, Lcom/tencent/could/aicamare/CameraHolder;->getCameraSize()Landroid/hardware/Camera$Size;

    .line 203
    .line 204
    .line 205
    move-result-object v9

    .line 206
    iget-object v10, v1, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 207
    .line 208
    if-eqz v10, :cond_8

    .line 209
    .line 210
    iget v11, v9, Landroid/hardware/Camera$Size;->width:I

    .line 211
    .line 212
    iget v9, v9, Landroid/hardware/Camera$Size;->height:I

    .line 213
    .line 214
    invoke-virtual {v8}, Lcom/tencent/could/aicamare/CameraHolder;->getCurrentRotate()I

    .line 215
    .line 216
    .line 217
    move-result v12

    .line 218
    invoke-virtual {v10, v11, v9, v12}, Lcom/tencent/could/huiyansdk/manager/f;->a(III)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .line 220
    .line 221
    goto :goto_4

    .line 222
    :catch_0
    move-exception v0

    .line 223
    goto/16 :goto_8

    .line 224
    .line 225
    :cond_8
    :goto_4
    sget-object v9, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 226
    .line 227
    invoke-virtual {v9}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 228
    .line 229
    .line 230
    move-result-object v10

    .line 231
    if-eqz v10, :cond_9

    .line 232
    .line 233
    invoke-virtual {v10}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getCheckEnvRiskTimeout()J

    .line 234
    .line 235
    .line 236
    move-result-wide v10

    .line 237
    iput-wide v10, v1, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 238
    .line 239
    new-instance v10, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    const-string v11, "update defaultTuringTimeOut: "

    .line 242
    .line 243
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-wide v11, v1, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 247
    .line 248
    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v10

    .line 255
    invoke-virtual {v0, v2, v6, v10}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    :cond_9
    sget-object v10, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 259
    .line 260
    iget-object v11, v10, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->c:Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;

    .line 261
    .line 262
    if-nez v11, :cond_a

    .line 263
    .line 264
    move v11, v2

    .line 265
    goto :goto_5

    .line 266
    :cond_a
    invoke-virtual {v11}, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->isOpenCheckRiskMode()Z

    .line 267
    .line 268
    .line 269
    move-result v11

    .line 270
    :goto_5
    if-nez v11, :cond_b

    .line 271
    .line 272
    const-wide/16 v11, 0x12c

    .line 273
    .line 274
    iput-wide v11, v1, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 275
    .line 276
    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 277
    .line 278
    .line 279
    move-result-wide v11

    .line 280
    iput-wide v11, v1, Lcom/tencent/could/huiyansdk/turing/f;->n:J

    .line 281
    .line 282
    iget-object v11, v1, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 283
    .line 284
    const-string v12, ""

    .line 285
    .line 286
    if-eqz v11, :cond_c

    .line 287
    .line 288
    iget-object v0, v1, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 289
    .line 290
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    const/4 v11, 0x5

    .line 295
    iput v11, v0, Landroid/os/Message;->what:I

    .line 296
    .line 297
    iget-object v11, v1, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 298
    .line 299
    iget-wide v13, v1, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 300
    .line 301
    invoke-virtual {v11, v0, v13, v14}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 302
    .line 303
    .line 304
    iget-object v0, v10, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 305
    .line 306
    if-eqz v0, :cond_d

    .line 307
    .line 308
    const-string v10, "GetTuringTokenUseTime"

    .line 309
    .line 310
    invoke-interface {v0, v10, v2, v5, v12}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 311
    .line 312
    .line 313
    goto :goto_6

    .line 314
    :cond_c
    const-string v2, "start turing face defender, handler == null!"

    .line 315
    .line 316
    invoke-virtual {v0, v7, v6, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    :cond_d
    :goto_6
    iget-object v0, v9, Lcom/tencent/could/huiyansdk/api/j;->h:Lcom/tencent/could/huiyansdk/api/c;

    .line 320
    .line 321
    instance-of v2, v4, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 322
    .line 323
    if-eqz v2, :cond_e

    .line 324
    .line 325
    check-cast v4, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 326
    .line 327
    invoke-virtual {v4}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->getTuringPreviewView()Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    :cond_e
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 332
    .line 333
    if-nez v0, :cond_f

    .line 334
    .line 335
    :try_start_1
    invoke-virtual {v1, v4, v8, v12}, Lcom/tencent/could/huiyansdk/turing/b;->a(Landroid/view/View;Lcom/tencent/could/aicamare/CameraHolder;Ljava/lang/String;)I

    .line 336
    .line 337
    .line 338
    goto :goto_9

    .line 339
    :catch_1
    move-exception v0

    .line 340
    goto :goto_7

    .line 341
    :cond_f
    invoke-interface {v0}, Lcom/tencent/could/huiyansdk/api/c;->getCurrentToken()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-virtual {v1, v4, v8, v0}, Lcom/tencent/could/huiyansdk/turing/b;->a(Landroid/view/View;Lcom/tencent/could/aicamare/CameraHolder;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 346
    .line 347
    .line 348
    goto :goto_9

    .line 349
    :goto_7
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 350
    .line 351
    new-instance v2, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    const-string v4, "start turing face defender, error: "

    .line 354
    .line 355
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v1, v7, v6, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    const/16 v5, -0x2c2

    .line 373
    .line 374
    goto :goto_9

    .line 375
    :goto_8
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 376
    .line 377
    new-instance v2, Ljava/lang/StringBuilder;

    .line 378
    .line 379
    const-string v4, "camera get parameters with error: "

    .line 380
    .line 381
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-virtual {v1, v7, v6, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    const/16 v5, -0x2c1

    .line 399
    .line 400
    :goto_9
    if-eqz v5, :cond_10

    .line 401
    .line 402
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 403
    .line 404
    const-string v1, "failed to start turing face defender!"

    .line 405
    .line 406
    invoke-virtual {v0, v7, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    .line 410
    .line 411
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 412
    .line 413
    .line 414
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_inner_error:I

    .line 415
    .line 416
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    const-string p0, "(startTuring fail: "

    .line 424
    .line 425
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    const-string p0, ")"

    .line 432
    .line 433
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    const/16 v0, 0xd5

    .line 441
    .line 442
    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 443
    .line 444
    .line 445
    :cond_10
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/fragments/e;)V
    .locals 0

    .line 446
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/e;->b()V

    return-void
.end method

.method private b()V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g:Lcom/tencent/could/huiyansdk/view/HudView;

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/HudView;->c:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/HudView;->c:I

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-wide v2, p0, Lcom/tencent/could/huiyansdk/view/HudView;->b:J

    .line 16
    .line 17
    sub-long v2, v0, v2

    .line 18
    .line 19
    const-wide/16 v4, 0x3e8

    .line 20
    .line 21
    cmp-long v4, v2, v4

    .line 22
    .line 23
    if-ltz v4, :cond_0

    .line 24
    .line 25
    iget v4, p0, Lcom/tencent/could/huiyansdk/view/HudView;->c:I

    .line 26
    .line 27
    mul-int/lit16 v4, v4, 0x3e8

    .line 28
    .line 29
    long-to-int v2, v2

    .line 30
    div-int/2addr v4, v2

    .line 31
    const/4 v2, 0x0

    .line 32
    iput v2, p0, Lcom/tencent/could/huiyansdk/view/HudView;->c:I

    .line 33
    .line 34
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/view/HudView;->b:J

    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/HudView;->a:Landroid/widget/TextView;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "current fps: "

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/tencent/could/huiyansdk/fragments/e;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/e;->a()V

    return-void
.end method


# virtual methods
.method public onAutoFocusSucceed()V
    .locals 1

    .line 1
    const-string p0, "AuthingFragment"

    .line 2
    .line 3
    const-string v0, "auto focus success!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCameraClosed()V
    .locals 1

    .line 1
    const-string p0, "AuthingFragment"

    .line 2
    .line 3
    const-string v0, "close camera success!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCameraSucceed()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    new-instance v1, Ll/c0r0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/c0r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/e;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDataFrameCallBack([B)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_7

    .line 4
    .line 5
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowDebugView()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 20
    .line 21
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g:Lcom/tencent/could/huiyansdk/view/HudView;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/b0r0;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/b0r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/e;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    if-eqz v0, :cond_10

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isJustCheckRawCamera()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_10

    .line 40
    .line 41
    sget-object v0, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 42
    .line 43
    iget-boolean v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz v1, :cond_e

    .line 47
    .line 48
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 49
    .line 50
    if-nez v1, :cond_2

    .line 51
    .line 52
    goto/16 :goto_5

    .line 53
    .line 54
    :cond_2
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 55
    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 59
    .line 60
    const-string v3, "TuringSdkHelper"

    .line 61
    .line 62
    const-string v4, "cancelWaitFirstFrameTimeOut handler == null!"

    .line 63
    .line 64
    const/4 v5, 0x2

    .line 65
    invoke-virtual {v1, v5, v3, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-boolean v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->d:Z

    .line 70
    .line 71
    if-nez v1, :cond_4

    .line 72
    .line 73
    iput-boolean v2, v0, Lcom/tencent/could/huiyansdk/turing/f;->d:Z

    .line 74
    .line 75
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 76
    .line 77
    const-string v3, "TuringSdkHelper"

    .line 78
    .line 79
    const-string v4, "remove first frame time out event!"

    .line 80
    .line 81
    invoke-virtual {v1, v2, v3, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 85
    .line 86
    const/4 v3, 0x3

    .line 87
    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 88
    .line 89
    .line 90
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 91
    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/f;->h()V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 98
    .line 99
    const-class v3, Lcom/tencent/could/huiyansdk/utils/b;

    .line 100
    .line 101
    monitor-enter v3

    .line 102
    :try_start_0
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/utils/b;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 103
    .line 104
    if-nez v1, :cond_5

    .line 105
    .line 106
    monitor-exit v3

    .line 107
    const/4 v1, 0x0

    .line 108
    goto :goto_1

    .line 109
    :catchall_0
    move-exception p0

    .line 110
    goto/16 :goto_4

    .line 111
    .line 112
    :cond_5
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/utils/i;->acquire()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, [B

    .line 117
    .line 118
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    :goto_1
    if-nez v1, :cond_6

    .line 120
    .line 121
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, [B

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_6
    const/4 v3, 0x0

    .line 129
    :goto_2
    array-length v4, p1

    .line 130
    if-ge v3, v4, :cond_7

    .line 131
    .line 132
    aget-byte v4, p1, v3

    .line 133
    .line 134
    aput-byte v4, v1, v3

    .line 135
    .line 136
    add-int/lit8 v3, v3, 0x1

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_7
    :goto_3
    iget-boolean v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 140
    .line 141
    if-nez v3, :cond_8

    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_8
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 145
    .line 146
    if-eqz v3, :cond_9

    .line 147
    .line 148
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 149
    .line 150
    check-cast v3, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 151
    .line 152
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 156
    .line 157
    if-eqz v0, :cond_e

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/f;->d()Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-eqz v3, :cond_a

    .line 164
    .line 165
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z

    .line 168
    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_a
    iget-boolean v3, v0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    .line 172
    .line 173
    if-eqz v3, :cond_b

    .line 174
    .line 175
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z

    .line 178
    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_b
    iget v3, v0, Lcom/tencent/could/huiyansdk/manager/f;->l:I

    .line 182
    .line 183
    const/4 v4, 0x5

    .line 184
    if-ge v3, v4, :cond_c

    .line 185
    .line 186
    add-int/2addr v3, v2

    .line 187
    iput v3, v0, Lcom/tencent/could/huiyansdk/manager/f;->l:I

    .line 188
    .line 189
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z

    .line 192
    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_c
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 196
    .line 197
    invoke-virtual {v3}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    const/16 v4, 0xa

    .line 202
    .line 203
    if-lt v3, v4, :cond_d

    .line 204
    .line 205
    iget-object v3, v0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 206
    .line 207
    invoke-virtual {v3}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    check-cast v3, [B

    .line 212
    .line 213
    if-eqz v3, :cond_d

    .line 214
    .line 215
    sget-object v4, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 216
    .line 217
    invoke-virtual {v4, v3}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z

    .line 218
    .line 219
    .line 220
    :cond_d
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    goto :goto_5

    .line 226
    :goto_4
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    throw p0

    .line 228
    :cond_e
    :goto_5
    sget-object v0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 229
    .line 230
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 231
    .line 232
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/tencent/could/aicamare/CameraHolder;->getCameraSize()Landroid/hardware/Camera$Size;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 239
    .line 240
    .line 241
    sget-object v0, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 242
    .line 243
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 244
    .line 245
    .line 246
    if-nez v1, :cond_f

    .line 247
    .line 248
    const-string v0, "YouTuSdkHelper"

    .line 249
    .line 250
    const-string v1, "input camera error! size is null"

    .line 251
    .line 252
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    goto :goto_6

    .line 256
    :cond_f
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iget v3, v1, Landroid/hardware/Camera$Size;->width:I

    .line 261
    .line 262
    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    .line 263
    .line 264
    invoke-virtual {v0, p1, v3, v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->updateWithFrameData([BIII)I

    .line 265
    .line 266
    .line 267
    :goto_6
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->c()Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-eqz v0, :cond_10

    .line 274
    .line 275
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 276
    .line 277
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a:Lcom/tencent/could/huiyansdk/turing/a;

    .line 278
    .line 279
    instance-of v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 280
    .line 281
    if-eqz v0, :cond_10

    .line 282
    .line 283
    check-cast p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    .line 284
    .line 285
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->b([B)V

    .line 286
    .line 287
    .line 288
    :cond_10
    :goto_7
    return-void
.end method

.method public onEventError(ILjava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "onEventError: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " msg: "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x1

    .line 26
    const-string v3, "AuthingFragment"

    .line 27
    .line 28
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x4

    .line 32
    const/4 v2, 0x2

    .line 33
    if-eq p1, v1, :cond_8

    .line 34
    .line 35
    const/4 v1, 0x5

    .line 36
    if-ne p1, v1, :cond_0

    .line 37
    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_0
    const/4 p2, 0x3

    .line 41
    const/16 v1, 0xd6

    .line 42
    .line 43
    const/16 v4, 0xd7

    .line 44
    .line 45
    if-ne p1, p2, :cond_1

    .line 46
    .line 47
    move p2, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move p2, v4

    .line 50
    :goto_0
    sget v5, Lcom/tencent/could/huiyansdk/R$string;->txy_inner_error:I

    .line 51
    .line 52
    const/4 v6, 0x7

    .line 53
    if-ne p1, v6, :cond_2

    .line 54
    .line 55
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txy_set_display_orientation_error:I

    .line 56
    .line 57
    const/16 p2, 0xe6

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    move p1, v5

    .line 61
    :goto_1
    if-ne p2, v1, :cond_3

    .line 62
    .line 63
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txy_do_not_change_app_in_auth:I

    .line 64
    .line 65
    :cond_3
    if-ne p2, v4, :cond_4

    .line 66
    .line 67
    sget p1, Lcom/tencent/could/huiyansdk/R$string;->txy_get_or_init_camera_error:I

    .line 68
    .line 69
    :cond_4
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    if-eqz v1, :cond_7

    .line 76
    .line 77
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    new-instance p1, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 84
    .line 85
    invoke-direct {p1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v6}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 100
    .line 101
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 102
    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    const-string p2, "AuthCheckStage"

    .line 106
    .line 107
    const-string v0, "OpenCameraError"

    .line 108
    .line 109
    invoke-interface {p1, p2, v0, v6}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    const-string v2, "StartCamera"

    .line 117
    .line 118
    const/4 v3, 0x1

    .line 119
    const-wide/16 v4, 0x0

    .line 120
    .line 121
    invoke-interface/range {v1 .. v6}, Lcom/tencent/could/huiyansdk/api/b;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_6
    return-void

    .line 125
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v1, "camera on error context is null! code "

    .line 128
    .line 129
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {v0, v2, v3, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    new-instance p1, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 148
    .line 149
    invoke-virtual {p0, v5}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string p0, " camera error code: "

    .line 157
    .line 158
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const/16 p1, 0xd5

    .line 169
    .line 170
    invoke-static {p1, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_8
    :goto_2
    invoke-virtual {v0, v2, v3, p2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public onPreviewSucceed()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->q:Lcom/tencent/could/aicamare/CameraHolder;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/CameraHolder;->getCurrentCamera()Landroid/hardware/Camera;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 15
    .line 16
    const-string v1, "on preview succeed!"

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    const-string v3, "AuthingFragment"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 25
    .line 26
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 27
    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    const-string v5, "AuthCheckStage"

    .line 31
    .line 32
    const-string v6, "OpenCameraSuccess"

    .line 33
    .line 34
    const-string v7, ""

    .line 35
    .line 36
    invoke-interface {v4, v5, v6, v7}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v8, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 40
    .line 41
    if-eqz v8, :cond_1

    .line 42
    .line 43
    const-string v9, "StartCamera"

    .line 44
    .line 45
    const/4 v10, 0x1

    .line 46
    const-wide/16 v11, 0x1

    .line 47
    .line 48
    const-string v13, ""

    .line 49
    .line 50
    invoke-interface/range {v8 .. v13}, Lcom/tencent/could/huiyansdk/api/b;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    sget-object v4, Lcom/tencent/could/huiyansdk/turing/f$a;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 54
    .line 55
    iget-object v5, v4, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 56
    .line 57
    const-string v6, "TuringSdkHelper"

    .line 58
    .line 59
    if-nez v5, :cond_2

    .line 60
    .line 61
    const/4 v5, 0x2

    .line 62
    const-string v7, "startTimeOutForWaitFirstFrame handler == null!"

    .line 63
    .line 64
    invoke-virtual {v0, v5, v6, v7}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const-string v5, "start set event first frame time out!"

    .line 69
    .line 70
    invoke-virtual {v0, v2, v6, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v5, v4, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 74
    .line 75
    invoke-virtual {v5}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const/4 v6, 0x3

    .line 80
    iput v6, v5, Landroid/os/Message;->what:I

    .line 81
    .line 82
    iget-object v6, v4, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 83
    .line 84
    const-wide/16 v7, 0x1388

    .line 85
    .line 86
    invoke-virtual {v6, v5, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 87
    .line 88
    .line 89
    :goto_0
    sget-object v5, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 90
    .line 91
    iget-object v4, v4, Lcom/tencent/could/huiyansdk/turing/f;->h:Lcom/tencent/could/huiyansdk/manager/f;

    .line 92
    .line 93
    iput-object v4, v5, Lcom/tencent/could/huiyansdk/manager/b;->l:Lcom/tencent/could/huiyansdk/manager/f;

    .line 94
    .line 95
    const-string v4, "start PrepareFaceTimeOutMs"

    .line 96
    .line 97
    invoke-virtual {v0, v2, v3, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getPrepareFaceTimeOutMs()J

    .line 107
    .line 108
    .line 109
    move-result-wide v2

    .line 110
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isShowPrepareTimeout()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(JZ)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/e;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 122
    .line 123
    new-instance v1, Lcom/tencent/could/huiyansdk/fragments/e$b;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Lcom/tencent/could/huiyansdk/fragments/e$b;-><init>(Lcom/tencent/could/huiyansdk/fragments/e;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method
