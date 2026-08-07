.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->startHuiYanNextStep(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "HuiYanResultSender"

    .line 2
    .line 3
    const-string v1, "net work error!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onSuccess([BLjava/lang/String;)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget-object v2, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 8
    .line 9
    array-length v3, v1

    .line 10
    div-int/lit16 v3, v3, 0x400

    .line 11
    .line 12
    int-to-long v7, v3

    .line 13
    iget-object v4, v2, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v9

    .line 21
    const-string v5, "LivenessPackSize"

    .line 22
    .line 23
    const/4 v6, 0x1

    .line 24
    invoke-virtual/range {v4 .. v10}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 25
    .line 26
    .line 27
    :cond_0
    sget-object v2, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 28
    .line 29
    const-string v3, "LocalCheckUseTime"

    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    const/4 v5, 0x0

    .line 33
    const-string v6, ""

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static/range {p2 .. p2}, Lcom/tencent/could/huiyansdk/utils/d;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static/range {p2 .. p2}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->deleteFileByPath(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    const-string v8, "HuiYanResultSender"

    .line 50
    .line 51
    if-eqz v7, :cond_1

    .line 52
    .line 53
    sget-object v7, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 54
    .line 55
    const-string v9, "videoData is empty"

    .line 56
    .line 57
    invoke-virtual {v7, v4, v8, v9}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v10, v2, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 61
    .line 62
    if-eqz v10, :cond_2

    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v15

    .line 68
    const-string v11, "LocalVideo"

    .line 69
    .line 70
    const/4 v12, 0x1

    .line 71
    const-wide/16 v13, 0x0

    .line 72
    .line 73
    invoke-virtual/range {v10 .. v16}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object v7, v2, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 78
    .line 79
    if-eqz v7, :cond_2

    .line 80
    .line 81
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide v22

    .line 85
    const-string v18, "LocalVideo"

    .line 86
    .line 87
    const/16 v19, 0x1

    .line 88
    .line 89
    const-wide/16 v20, 0x1

    .line 90
    .line 91
    move-object/from16 v17, v7

    .line 92
    .line 93
    invoke-virtual/range {v17 .. v23}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_0
    if-eqz v3, :cond_3

    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    array-length v7, v7

    .line 103
    div-int/lit16 v7, v7, 0x400

    .line 104
    .line 105
    int-to-long v12, v7

    .line 106
    iget-object v9, v2, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 107
    .line 108
    if-eqz v9, :cond_3

    .line 109
    .line 110
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 111
    .line 112
    .line 113
    move-result-wide v14

    .line 114
    const-string v10, "LocalVideoSize"

    .line 115
    .line 116
    const/4 v11, 0x1

    .line 117
    invoke-virtual/range {v9 .. v15}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 118
    .line 119
    .line 120
    :cond_3
    invoke-static {v1, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    new-instance v4, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;

    .line 125
    .line 126
    invoke-direct {v4}, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    invoke-virtual {v7}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getOsConfig()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    invoke-virtual {v7}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isOpenBOTCheck()Z

    .line 138
    .line 139
    .line 140
    move-result v7

    .line 141
    const/4 v9, 0x1

    .line 142
    if-eqz v7, :cond_4

    .line 143
    .line 144
    sget-object v7, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 145
    .line 146
    iget-object v7, v7, Lcom/tencent/could/huiyansdk/common/a;->a:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    if-nez v10, :cond_4

    .line 153
    .line 154
    invoke-virtual {v4, v7}, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->setBestFrameImageFromTerminal(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    sget-object v10, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 158
    .line 159
    new-instance v11, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v12, "get bot image: "

    .line 162
    .line 163
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v7, " bytes"

    .line 174
    .line 175
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    invoke-virtual {v10, v9, v8, v7}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    invoke-virtual {v4, v1}, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->setLiveData(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v4, v3}, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->setVideo(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4, v5}, Lcom/tencent/could/huiyansdk/entity/LivenessRequest;->setNeedBestFrame(Z)V

    .line 192
    .line 193
    .line 194
    new-instance v1, Lcom/google/gson/Gson;

    .line 195
    .line 196
    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v4}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-static {v5}, Lcom/tencent/could/huiyansdk/utils/c;->a(Z)Lcom/tencent/could/component/common/ai/utils/TwoTuple;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    if-nez v4, :cond_5

    .line 208
    .line 209
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 210
    .line 211
    sget v2, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_illegal_token_error:I

    .line 212
    .line 213
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    const/16 v3, 0x120

    .line 218
    .line 219
    invoke-virtual {v1, v3, v2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 223
    .line 224
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_5
    if-eqz v3, :cond_6

    .line 229
    .line 230
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    .line 231
    .line 232
    .line 233
    move-result-object v7

    .line 234
    array-length v7, v7

    .line 235
    div-int/lit16 v7, v7, 0x400

    .line 236
    .line 237
    int-to-long v13, v7

    .line 238
    iget-object v10, v2, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 239
    .line 240
    if-eqz v10, :cond_6

    .line 241
    .line 242
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 243
    .line 244
    .line 245
    move-result-wide v15

    .line 246
    const-string v11, "SendPackSize"

    .line 247
    .line 248
    const/4 v12, 0x1

    .line 249
    invoke-virtual/range {v10 .. v16}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 250
    .line 251
    .line 252
    :cond_6
    const-string v7, "GetCompareResultUseTime"

    .line 253
    .line 254
    invoke-virtual {v2, v7, v9, v5, v6}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 255
    .line 256
    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    iget-object v6, v4, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->first:Ljava/lang/Object;

    .line 263
    .line 264
    check-cast v6, Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    const-string v6, "/api/v1/crypt/liveness"

    .line 270
    .line 271
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    new-instance v7, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 285
    .line 286
    .line 287
    iget-object v4, v4, Lcom/tencent/could/component/common/ai/utils/TwoTuple;->second:Ljava/lang/Object;

    .line 288
    .line 289
    check-cast v4, Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v4

    .line 301
    invoke-static {v4}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    new-instance v7, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    .line 309
    .line 310
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getBackIpUrl()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v8

    .line 314
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    invoke-static {v7}, Lcom/tencent/could/huiyansdk/utils/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    invoke-static {v6}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$400(Ljava/lang/String;)[Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    const/4 v7, 0x3

    .line 332
    if-nez v6, :cond_7

    .line 333
    .line 334
    goto :goto_1

    .line 335
    :cond_7
    array-length v6, v6

    .line 336
    add-int/2addr v7, v6

    .line 337
    :goto_1
    invoke-static {}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->newBuilder()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 338
    .line 339
    .line 340
    move-result-object v6

    .line 341
    invoke-virtual {v6, v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setRequestData(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 342
    .line 343
    .line 344
    move-result-object v3

    .line 345
    invoke-virtual {v3, v2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v2, v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setDeputyUrl(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    invoke-virtual {v2, v7}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setRetryTimes(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    sget-object v3, Lcom/tencent/could/component/common/ai/net/HttpMethod;->POST:Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 358
    .line 359
    invoke-virtual {v2, v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setHttpMethod(Lcom/tencent/could/component/common/ai/net/HttpMethod;)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    const v3, 0xea60

    .line 364
    .line 365
    .line 366
    invoke-virtual {v2, v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setTimeOutTimes(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    invoke-virtual {v2, v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setConnectTimeOut(I)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    invoke-virtual {v2, v5}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->setGzip(Z)Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    invoke-virtual {v2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam$NetWorkParamBuilder;->createNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    new-instance v3, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;

    .line 383
    .line 384
    invoke-direct {v3, v0, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;-><init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;Lcom/google/gson/Gson;)V

    .line 385
    .line 386
    .line 387
    invoke-static {v2, v3}, Lcom/tencent/could/huiyansdk/utils/c;->a(Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;Lcom/tencent/could/component/common/ai/net/IJsonDataListener;)V

    .line 388
    .line 389
    .line 390
    return-void
.end method
