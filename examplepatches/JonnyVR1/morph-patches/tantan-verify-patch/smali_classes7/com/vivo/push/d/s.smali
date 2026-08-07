.class final Lcom/vivo/push/d/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/vivo/push/model/InsideNotificationItem;

.field final synthetic b:Lcom/vivo/push/b/q;

.field final synthetic c:Lcom/vivo/push/d/r;


# direct methods
.method public constructor <init>(Lcom/vivo/push/d/r;Lcom/vivo/push/model/InsideNotificationItem;Lcom/vivo/push/b/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/vivo/push/d/s;->b:Lcom/vivo/push/b/q;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/vivo/push/d/r;->a(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 10
    .line 11
    invoke-static {v2}, Lcom/vivo/push/util/q;->a(Lcom/vivo/push/model/InsideNotificationItem;)Lcom/vivo/push/model/UPSNotificationMessage;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v0, v2}, Lcom/vivo/push/sdk/PushMessageCallback;->onNotificationMessageArrived(Landroid/content/Context;Lcom/vivo/push/model/UPSNotificationMessage;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 20
    .line 21
    const-string v2, "remoteAppId"

    .line 22
    .line 23
    const-string v3, "messageID"

    .line 24
    .line 25
    const-string v4, "pkg name : "

    .line 26
    .line 27
    const-string v5, "OnNotificationArrivedTask"

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Lcom/vivo/push/d/r;->b(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, " \u5e94\u7528\u4e3b\u52a8\u62e6\u622a\u901a\u77e5"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v5, v0}, Lcom/vivo/push/util/p;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/vivo/push/d/r;->c(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "\u5e94\u7528\u4e3b\u52a8\u62e6\u622a\u901a\u77e5\uff0c\u5bfc\u81f4\u901a\u77e5\u65e0\u6cd5\u5c55\u793a\uff0c\u5982\u9700\u6253\u5f00\u8bf7\u5728onNotificationMessageArrived\u4e2d\u8fd4\u56defalse"

    .line 66
    .line 67
    invoke-static {v0, v1}, Lcom/vivo/push/util/p;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ljava/util/HashMap;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/vivo/push/d/s;->b:Lcom/vivo/push/b/q;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/vivo/push/b/v;->f()J

    .line 78
    .line 79
    .line 80
    move-result-wide v4

    .line 81
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 89
    .line 90
    invoke-static {v1}, Lcom/vivo/push/d/r;->d(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object p0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 95
    .line 96
    invoke-static {p0}, Lcom/vivo/push/d/r;->e(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {v1, p0}, Lcom/vivo/push/util/z;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_0

    .line 113
    .line 114
    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    :cond_0
    const-wide/16 v1, 0x848

    .line 118
    .line 119
    invoke-static {v1, v2, v0}, Lcom/vivo/push/util/e;->a(JLjava/util/HashMap;)Z

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    invoke-virtual {v1}, Lcom/vivo/push/d/z;->b()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-lez v0, :cond_3

    .line 128
    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v4, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 135
    .line 136
    invoke-static {v4}, Lcom/vivo/push/d/r;->f(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v4, " notify channel switch is "

    .line 148
    .line 149
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-static {v5, v1}, Lcom/vivo/push/util/p;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 163
    .line 164
    invoke-static {v1}, Lcom/vivo/push/d/r;->g(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    const-string v4, "\u5141\u8bb8\u901a\u77e5\u5f00\u5173\u6216\u8005\u63a8\u9001\u901a\u77e5\u6e20\u9053\u5f00\u5173\u5173\u95ed\uff0c\u5bfc\u81f4\u901a\u77e5\u65e0\u6cd5\u5c55\u793a\uff0c\u8bf7\u5230\u8bbe\u7f6e\u9875\u6253\u5f00\u5e94\u7528\u901a\u77e5\u5f00\u5173 "

    .line 169
    .line 170
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-static {v1, v4}, Lcom/vivo/push/util/p;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    new-instance v1, Ljava/util/HashMap;

    .line 182
    .line 183
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 184
    .line 185
    .line 186
    iget-object v4, p0, Lcom/vivo/push/d/s;->b:Lcom/vivo/push/b/q;

    .line 187
    .line 188
    invoke-virtual {v4}, Lcom/vivo/push/b/v;->f()J

    .line 189
    .line 190
    .line 191
    move-result-wide v4

    .line 192
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    iget-object v3, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 200
    .line 201
    invoke-static {v3}, Lcom/vivo/push/d/r;->h(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    iget-object p0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 206
    .line 207
    invoke-static {p0}, Lcom/vivo/push/d/r;->i(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-static {v3, p0}, Lcom/vivo/push/util/z;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-nez v3, :cond_2

    .line 224
    .line 225
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    :cond_2
    int-to-long v2, v0

    .line 229
    invoke-static {v2, v3, v1}, Lcom/vivo/push/util/e;->a(JLjava/util/HashMap;)Z

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_3
    new-instance v6, Lcom/vivo/push/util/k;

    .line 234
    .line 235
    iget-object v0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 236
    .line 237
    invoke-static {v0}, Lcom/vivo/push/d/r;->j(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    iget-object v8, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 242
    .line 243
    iget-object v0, p0, Lcom/vivo/push/d/s;->b:Lcom/vivo/push/b/q;

    .line 244
    .line 245
    invoke-virtual {v0}, Lcom/vivo/push/b/v;->f()J

    .line 246
    .line 247
    .line 248
    move-result-wide v9

    .line 249
    iget-object v0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 250
    .line 251
    iget-object v1, v0, Lcom/vivo/push/d/z;->b:Lcom/vivo/push/sdk/PushMessageCallback;

    .line 252
    .line 253
    invoke-static {v0}, Lcom/vivo/push/d/r;->k(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-interface {v1, v0}, Lcom/vivo/push/sdk/PushMessageCallback;->isAllowNet(Landroid/content/Context;)Z

    .line 258
    .line 259
    .line 260
    move-result v11

    .line 261
    new-instance v12, Lcom/vivo/push/d/t;

    .line 262
    .line 263
    invoke-direct {v12, p0}, Lcom/vivo/push/d/t;-><init>(Lcom/vivo/push/d/s;)V

    .line 264
    .line 265
    .line 266
    invoke-direct/range {v6 .. v12}, Lcom/vivo/push/util/k;-><init>(Landroid/content/Context;Lcom/vivo/push/model/InsideNotificationItem;JZLcom/vivo/push/d/r$a;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 270
    .line 271
    invoke-virtual {v0}, Lcom/vivo/push/model/InsideNotificationItem;->isShowBigPicOnMobileNet()Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    iget-object v1, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 276
    .line 277
    invoke-virtual {v1}, Lcom/vivo/push/model/UPSNotificationMessage;->getPurePicUrl()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    if-eqz v2, :cond_4

    .line 286
    .line 287
    iget-object v1, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 288
    .line 289
    invoke-virtual {v1}, Lcom/vivo/push/model/UPSNotificationMessage;->getCoverUrl()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    :cond_4
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-nez v2, :cond_9

    .line 298
    .line 299
    const-string v2, "showCode="

    .line 300
    .line 301
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-static {v5, v2}, Lcom/vivo/push/util/p;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    iget-object v2, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 313
    .line 314
    if-nez v0, :cond_8

    .line 315
    .line 316
    invoke-static {v2}, Lcom/vivo/push/d/r;->p(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    const-string v2, "mobile net unshow"

    .line 321
    .line 322
    invoke-static {v0, v2}, Lcom/vivo/push/util/p;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    iget-object v0, p0, Lcom/vivo/push/d/s;->c:Lcom/vivo/push/d/r;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/vivo/push/d/r;->q(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {v0}, Lcom/vivo/push/util/r;->a(Landroid/content/Context;)Landroid/net/NetworkInfo;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    if-nez v0, :cond_5

    .line 336
    .line 337
    goto :goto_0

    .line 338
    :cond_5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 343
    .line 344
    if-eq v2, v3, :cond_6

    .line 345
    .line 346
    goto :goto_0

    .line 347
    :cond_6
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    const/4 v2, 0x1

    .line 352
    if-ne v0, v2, :cond_7

    .line 353
    .line 354
    goto :goto_0

    .line 355
    :cond_7
    if-nez v0, :cond_9

    .line 356
    .line 357
    iget-object v0, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 358
    .line 359
    invoke-virtual {v0}, Lcom/vivo/push/model/UPSNotificationMessage;->clearCoverUrl()V

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 363
    .line 364
    invoke-virtual {v0}, Lcom/vivo/push/model/UPSNotificationMessage;->clearPurePicUrl()V

    .line 365
    .line 366
    .line 367
    const/4 v1, 0x0

    .line 368
    goto :goto_0

    .line 369
    :cond_8
    invoke-static {v2}, Lcom/vivo/push/d/r;->r(Lcom/vivo/push/d/r;)Landroid/content/Context;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    const-string v2, "mobile net show"

    .line 374
    .line 375
    invoke-static {v0, v2}, Lcom/vivo/push/util/p;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    :cond_9
    :goto_0
    iget-object p0, p0, Lcom/vivo/push/d/s;->a:Lcom/vivo/push/model/InsideNotificationItem;

    .line 379
    .line 380
    invoke-virtual {p0}, Lcom/vivo/push/model/UPSNotificationMessage;->getIconUrl()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    filled-new-array {p0, v1}, [Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-virtual {v6, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 389
    .line 390
    .line 391
    return-void
.end method
