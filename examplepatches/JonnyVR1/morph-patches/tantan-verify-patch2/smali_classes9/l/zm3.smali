.class public Ll/zm3;
.super Ll/yr2;
.source "SourceFile"


# instance fields
.field public a:Ll/g4m;

.field public b:Ll/byd0;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/g4m;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/yr2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "follow_guide_last_follow_user_chat_button"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-wide/16 v2, 0x0

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/zm3;->b:Ll/byd0;

    .line 36
    .line 37
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/zm3;->c:Ljava/lang/String;

    .line 44
    .line 45
    iput-object p1, p0, Ll/zm3;->a:Ll/g4m;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ll/hzc0;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p3, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v3, p0, Ll/zm3;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "follow"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/vwt;->n6()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/zm3;->j()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Ll/zm3;->a:Ll/g4m;

    .line 46
    .line 47
    invoke-interface {p2}, Ll/g4m;->a()Lcom/p1/mobile/putong/data/Followship;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-static {p2}, Lcom/p1/mobile/putong/data/Followship;->isFollowed(Lcom/p1/mobile/putong/data/Followship;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_9

    .line 56
    .line 57
    iget-object p2, p0, Ll/zm3;->a:Ll/g4m;

    .line 58
    .line 59
    invoke-interface {p2}, Ll/g4m;->c()Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_9

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->text:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p0, p0, Ll/zm3;->b:Ll/byd0;

    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide p2

    .line 77
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-object p0, v2

    .line 85
    move-object v2, p1

    .line 86
    goto/16 :goto_2

    .line 87
    .line 88
    :cond_0
    iget-object v1, p3, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 89
    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v3, p0, Ll/zm3;->c:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_6

    .line 103
    .line 104
    const-string v1, "voiceFollow"

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_6

    .line 111
    .line 112
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ll/vwt;->n6()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_6

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/zm3;->j()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_6

    .line 127
    .line 128
    iget-object p2, p3, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 129
    .line 130
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {p2}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    iget-object v0, p0, Ll/zm3;->a:Ll/g4m;

    .line 137
    .line 138
    if-eqz p2, :cond_2

    .line 139
    .line 140
    invoke-interface {v0}, Ll/g4m;->b()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;->isFollow(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_1

    .line 149
    .line 150
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 151
    .line 152
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const-string p0, "6"

    .line 159
    .line 160
    goto/16 :goto_2

    .line 161
    .line 162
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 163
    .line 164
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    const-string p0, "5"

    .line 171
    .line 172
    goto/16 :goto_2

    .line 173
    .line 174
    :cond_2
    invoke-interface {v0}, Ll/g4m;->a()Lcom/p1/mobile/putong/data/Followship;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-static {p2}, Lcom/p1/mobile/putong/data/Followship;->isFollowed(Lcom/p1/mobile/putong/data/Followship;)Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    const-string v0, "\n"

    .line 183
    .line 184
    const/4 v1, 0x3

    .line 185
    if-nez p2, :cond_4

    .line 186
    .line 187
    iget-object p0, p0, Ll/zm3;->a:Ll/g4m;

    .line 188
    .line 189
    invoke-interface {p0}, Ll/g4m;->c()Lcom/p1/mobile/putong/data/User;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-nez p0, :cond_4

    .line 198
    .line 199
    iget p0, p3, Ll/hzc0;->e:I

    .line 200
    .line 201
    if-ne p0, v1, :cond_3

    .line 202
    .line 203
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->text:Ljava/lang/String;

    .line 204
    .line 205
    const-string p0, "3"

    .line 206
    .line 207
    goto/16 :goto_2

    .line 208
    .line 209
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 215
    .line 216
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 217
    .line 218
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    const-string p0, "1"

    .line 233
    .line 234
    goto/16 :goto_2

    .line 235
    .line 236
    :cond_4
    iget p0, p3, Ll/hzc0;->e:I

    .line 237
    .line 238
    if-ne p0, v1, :cond_5

    .line 239
    .line 240
    const-string p0, "4"

    .line 241
    .line 242
    goto/16 :goto_2

    .line 243
    .line 244
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 245
    .line 246
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 247
    .line 248
    .line 249
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 250
    .line 251
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 252
    .line 253
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    const-string p0, "2"

    .line 268
    .line 269
    goto/16 :goto_2

    .line 270
    .line 271
    :cond_6
    const-string p0, "gift"

    .line 272
    .line 273
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    if-nez p0, :cond_a

    .line 278
    .line 279
    const-string p0, "jumpTopRoom"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_a

    .line 286
    .line 287
    const-string p0, "followUser"

    .line 288
    .line 289
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-nez p0, :cond_a

    .line 294
    .line 295
    const-string p0, "callApply"

    .line 296
    .line 297
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    if-nez p0, :cond_a

    .line 302
    .line 303
    const-string p0, "voiceCallInvite"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    if-nez p0, :cond_a

    .line 310
    .line 311
    const-string p0, "voiceCallApply"

    .line 312
    .line 313
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    if-nez p0, :cond_a

    .line 318
    .line 319
    const-string p0, "joinLotteryGiftRedPacket"

    .line 320
    .line 321
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    if-nez p0, :cond_a

    .line 326
    .line 327
    const-string p0, "shootGame"

    .line 328
    .line 329
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    if-nez p0, :cond_a

    .line 334
    .line 335
    const-string p0, "maskModeFollowApply"

    .line 336
    .line 337
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-nez p0, :cond_a

    .line 342
    .line 343
    const-string p0, "maskModeFollowFollowed"

    .line 344
    .line 345
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    if-nez p0, :cond_a

    .line 350
    .line 351
    const-string p0, "maskModeFollowApproved"

    .line 352
    .line 353
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result p0

    .line 357
    if-nez p0, :cond_a

    .line 358
    .line 359
    const-string p0, "voiceSongGameOver"

    .line 360
    .line 361
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-nez p0, :cond_a

    .line 366
    .line 367
    const-string p0, "surpriseGiftBox"

    .line 368
    .line 369
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    move-result p0

    .line 373
    if-nez p0, :cond_a

    .line 374
    .line 375
    const-string p0, "chatReply"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 378
    .line 379
    .line 380
    move-result p0

    .line 381
    if-nez p0, :cond_a

    .line 382
    .line 383
    const-string p0, "profile"

    .line 384
    .line 385
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result p0

    .line 389
    if-nez p0, :cond_a

    .line 390
    .line 391
    const-string p0, "anchorInviteCall"

    .line 392
    .line 393
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    if-nez p0, :cond_a

    .line 398
    .line 399
    const-string p0, "voiceFollowUser"

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p0

    .line 405
    if-nez p0, :cond_a

    .line 406
    .line 407
    const-string p0, "buttonOpenProfile"

    .line 408
    .line 409
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result p0

    .line 413
    if-nez p0, :cond_a

    .line 414
    .line 415
    const-string p0, "chat"

    .line 416
    .line 417
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    move-result p0

    .line 421
    if-nez p0, :cond_a

    .line 422
    .line 423
    const-string p0, "createChatGroup"

    .line 424
    .line 425
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result p0

    .line 429
    if-nez p0, :cond_a

    .line 430
    .line 431
    const-string p0, "approveChatGroupApply"

    .line 432
    .line 433
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    move-result p0

    .line 437
    if-nez p0, :cond_a

    .line 438
    .line 439
    const-string p0, "multiCallApply"

    .line 440
    .line 441
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    move-result p0

    .line 445
    if-nez p0, :cond_a

    .line 446
    .line 447
    const-string p0, "multiCallApprove"

    .line 448
    .line 449
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 450
    .line 451
    .line 452
    move-result p0

    .line 453
    if-nez p0, :cond_a

    .line 454
    .line 455
    const-string p0, "jumpToVote"

    .line 456
    .line 457
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 458
    .line 459
    .line 460
    move-result p0

    .line 461
    if-nez p0, :cond_a

    .line 462
    .line 463
    const-string p0, "voiceThankNewUser"

    .line 464
    .line 465
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result p0

    .line 469
    if-nez p0, :cond_a

    .line 470
    .line 471
    const-string p0, "jumpToSendMessage"

    .line 472
    .line 473
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result p0

    .line 477
    if-nez p0, :cond_a

    .line 478
    .line 479
    const-string p0, "jumpToFansbasePanel"

    .line 480
    .line 481
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result p0

    .line 485
    if-nez p0, :cond_a

    .line 486
    .line 487
    const-string p0, "jumpToSetting"

    .line 488
    .line 489
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result p0

    .line 493
    if-nez p0, :cond_a

    .line 494
    .line 495
    const-string p0, "jumpToMagicFinger"

    .line 496
    .line 497
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result p0

    .line 501
    if-nez p0, :cond_a

    .line 502
    .line 503
    const-string p0, "schemaJump"

    .line 504
    .line 505
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    move-result p0

    .line 509
    if-nez p0, :cond_a

    .line 510
    .line 511
    const-string p0, "auctionApprove"

    .line 512
    .line 513
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 514
    .line 515
    .line 516
    move-result p0

    .line 517
    if-nez p0, :cond_a

    .line 518
    .line 519
    const-string p0, "thankForSendLittleFlame"

    .line 520
    .line 521
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 522
    .line 523
    .line 524
    move-result p0

    .line 525
    if-nez p0, :cond_a

    .line 526
    .line 527
    const-string p0, "jumpVoiceFlameMarket"

    .line 528
    .line 529
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 530
    .line 531
    .line 532
    move-result p0

    .line 533
    if-nez p0, :cond_a

    .line 534
    .line 535
    const-string p0, "buttonOpenChat"

    .line 536
    .line 537
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result p0

    .line 541
    if-nez p0, :cond_a

    .line 542
    .line 543
    const-string p0, "settleApprove"

    .line 544
    .line 545
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 546
    .line 547
    .line 548
    move-result p0

    .line 549
    if-nez p0, :cond_a

    .line 550
    .line 551
    const-string p0, "grabStarRedPacket"

    .line 552
    .line 553
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 554
    .line 555
    .line 556
    move-result p0

    .line 557
    if-nez p0, :cond_a

    .line 558
    .line 559
    const-string p0, "roomLevelDetail"

    .line 560
    .line 561
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result p0

    .line 565
    if-nez p0, :cond_a

    .line 566
    .line 567
    const-string p0, "inviteVoiceCall"

    .line 568
    .line 569
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result p0

    .line 573
    if-nez p0, :cond_a

    .line 574
    .line 575
    const-string p0, "userApplyVoiceCall"

    .line 576
    .line 577
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 578
    .line 579
    .line 580
    move-result p0

    .line 581
    if-eqz p0, :cond_7

    .line 582
    .line 583
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 584
    .line 585
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object p0

    .line 589
    iget-object p3, p3, Ll/hzc0;->f:Ljava/lang/String;

    .line 590
    .line 591
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 592
    .line 593
    .line 594
    move-result p0

    .line 595
    if-nez p0, :cond_a

    .line 596
    .line 597
    :cond_7
    const-string p0, "userRole"

    .line 598
    .line 599
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 600
    .line 601
    .line 602
    move-result p0

    .line 603
    if-nez p0, :cond_a

    .line 604
    .line 605
    const-string p0, "guideNewUserSendStar"

    .line 606
    .line 607
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 608
    .line 609
    .line 610
    move-result p0

    .line 611
    if-nez p0, :cond_a

    .line 612
    .line 613
    const-string p0, "voiceRoomApplaud"

    .line 614
    .line 615
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    move-result p0

    .line 619
    if-nez p0, :cond_a

    .line 620
    .line 621
    const-string p0, "openAnchorGradeWeb"

    .line 622
    .line 623
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 624
    .line 625
    .line 626
    move-result p0

    .line 627
    if-nez p0, :cond_a

    .line 628
    .line 629
    const-string p0, "openAuctionApplyPanel"

    .line 630
    .line 631
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 632
    .line 633
    .line 634
    move-result p0

    .line 635
    if-nez p0, :cond_a

    .line 636
    .line 637
    const-string p0, "sendStarToUser"

    .line 638
    .line 639
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 640
    .line 641
    .line 642
    move-result p0

    .line 643
    if-nez p0, :cond_a

    .line 644
    .line 645
    const-string p0, "returnGift"

    .line 646
    .line 647
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    move-result p0

    .line 651
    if-nez p0, :cond_a

    .line 652
    .line 653
    const-string p0, "ktvKingCongratulate"

    .line 654
    .line 655
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 656
    .line 657
    .line 658
    move-result p0

    .line 659
    if-eqz p0, :cond_8

    .line 660
    .line 661
    goto :goto_1

    .line 662
    :cond_8
    const-string p0, "userProfile"

    .line 663
    .line 664
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 665
    .line 666
    .line 667
    move-result p0

    .line 668
    if-eqz p0, :cond_9

    .line 669
    .line 670
    if-eqz p2, :cond_9

    .line 671
    .line 672
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 673
    .line 674
    add-int/lit8 p0, p0, -0x1

    .line 675
    .line 676
    invoke-virtual {p2, p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object p0

    .line 680
    :goto_0
    move-object v4, v2

    .line 681
    move-object v2, p0

    .line 682
    move-object p0, v4

    .line 683
    goto :goto_2

    .line 684
    :cond_9
    move-object p0, v2

    .line 685
    goto :goto_2

    .line 686
    :cond_a
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->text:Ljava/lang/String;

    .line 687
    .line 688
    goto :goto_0

    .line 689
    :goto_2
    filled-new-array {v2, p0}, [Ljava/lang/String;

    .line 690
    .line 691
    .line 692
    move-result-object p0

    .line 693
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 694
    .line 695
    .line 696
    move-result-object p0

    .line 697
    return-object p0
.end method

.method public c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ll/hzc0;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string v0, "voiceFollow"

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-super {p0, p1, p2, p3}, Ll/yr2;->c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p1, 0x2

    .line 24
    if-lt p0, p1, :cond_0

    .line 25
    .line 26
    return v2

    .line 27
    :cond_0
    return v1

    .line 28
    :cond_1
    const-string v0, "chatReply"

    .line 29
    .line 30
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    const-string v0, "voiceThankNewUser"

    .line 39
    .line 40
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-super {p0, p1, p2, p3}, Ll/yr2;->c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_3
    :goto_0
    invoke-super {p0, p1, p2, p3}, Ll/yr2;->c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ll/hzc0;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    iget-object p0, p0, Ll/zm3;->c:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p1, p3, Ll/hzc0;->f:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    return v2

    .line 71
    :cond_4
    return v1
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/suf0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/hzc0;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/e810;->b:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object v0, p1, Ll/suf0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    move-object v4, v0

    .line 11
    check-cast v4, Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p4, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-string v0, "voiceFollow"

    .line 24
    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget v9, p1, Ll/suf0;->b:I

    .line 36
    .line 37
    iget-object v10, p4, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 38
    .line 39
    move-object v5, p0

    .line 40
    move-object v7, p2

    .line 41
    move-object v8, p3

    .line 42
    move-object v6, v2

    .line 43
    invoke-virtual/range {v5 .. v10}, Ll/zm3;->k(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move-object v1, p0

    .line 48
    move-object v3, p2

    .line 49
    iget v5, p1, Ll/suf0;->b:I

    .line 50
    .line 51
    move-object v6, p4

    .line 52
    invoke-virtual/range {v1 .. v6}, Ll/zm3;->l(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;ILl/hzc0;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move-object v1, p0

    .line 57
    move-object v3, p2

    .line 58
    move-object v6, p4

    .line 59
    iget-object v2, p1, Ll/suf0;->a:Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    iget v5, p1, Ll/suf0;->b:I

    .line 62
    .line 63
    iget-object v6, v6, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 64
    .line 65
    invoke-virtual/range {v1 .. v6}, Ll/zm3;->i(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget p0, p1, Ll/suf0;->b:I

    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    add-int/2addr p0, p2

    .line 75
    iput p0, p1, Ll/suf0;->b:I

    .line 76
    .line 77
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Z)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const-string p0, "#d27a36"

    .line 12
    .line 13
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "#000000"

    .line 17
    .line 18
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "button"

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Ljava/lang/String;Z)I
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    const-string p0, "anchorInviteCall"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const-string p0, "userRole"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x3

    .line 24
    return p0

    .line 25
    :cond_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final i(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;)V
    .locals 4

    .line 1
    invoke-virtual {p1, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    .line 4
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, "#000000"

    .line 13
    .line 14
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    new-instance p0, Ll/rmd0;

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 19
    .line 20
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 21
    .line 22
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-direct {p0, v0, v1, v2, v3}, Ll/rmd0;-><init>(Ljava/lang/String;III)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr v0, p4

    .line 42
    const/16 v1, 0x21

    .line 43
    .line 44
    invoke-virtual {p1, p0, p4, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/a5s;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v0, p2, p0}, Ll/a5s;-><init>(Ljava/lang/String;Ll/brl;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Ll/a5s;->g(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr p0, p4

    .line 78
    invoke-virtual {p1, v0, p4, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final j()Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Ll/zm3;->b:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/vwt;->L3()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    mul-int/lit16 p0, p0, 0x3e8

    .line 27
    .line 28
    int-to-long v2, p0

    .line 29
    cmp-long p0, v0, v2

    .line 30
    .line 31
    if-lez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public final k(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Ljava/lang/String;

    .line 7
    .line 8
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-le v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    check-cast p3, Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p3, ""

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/agn0;

    .line 28
    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ll/agn0;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p3, p0}, Ll/agn0;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    add-int/2addr p3, p4

    .line 42
    const/16 v1, 0x21

    .line 43
    .line 44
    invoke-virtual {p1, v0, p4, p3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Ll/bgn0;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {p3, p2, v0}, Ll/bgn0;-><init>(Ljava/lang/String;Ll/agn0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p3, p2}, Ll/a5s;->g(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr p0, p4

    .line 78
    invoke-virtual {p1, p3, p4, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final l(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;ILl/hzc0;)V
    .locals 9

    .line 1
    invoke-virtual {p1, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    .line 4
    iget-object v0, p5, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, p2, v0}, Ll/zm3;->g(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Z)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/tro0;

    .line 16
    .line 17
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 18
    .line 19
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->size:I

    .line 20
    .line 21
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->background:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->color:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->startColor:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v7, 0x0

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    move v3, v7

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->startColor:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    :goto_0
    iget-object v8, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->endColor:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    if-eqz v8, :cond_1

    .line 57
    .line 58
    :goto_1
    move v8, v7

    .line 59
    move v7, v3

    .line 60
    move-object v3, p3

    .line 61
    goto :goto_2

    .line 62
    :cond_1
    iget-object v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->endColor:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    goto :goto_1

    .line 69
    :goto_2
    invoke-direct/range {v1 .. v8}, Ll/tro0;-><init>(Ljava/lang/String;Ljava/lang/String;IIIII)V

    .line 70
    .line 71
    .line 72
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p3, v0}, Ll/zm3;->h(Ljava/lang/String;Z)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {v1, p0}, Ll/tro0;->g(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    add-int/2addr p0, p4

    .line 86
    const/16 p3, 0x21

    .line 87
    .line 88
    invoke-virtual {p1, v1, p4, p0, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/a5s;

    .line 92
    .line 93
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 94
    .line 95
    invoke-direct {p0, v0, v1}, Ll/a5s;-><init>(Ljava/lang/String;Ll/brl;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p5, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    iget-object v0, p5, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    iget-object p5, p5, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 115
    .line 116
    invoke-virtual {p5}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getH5()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p5

    .line 120
    invoke-virtual {p0, p5}, Ll/a5s;->g(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->url:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p5

    .line 129
    if-nez p5, :cond_3

    .line 130
    .line 131
    const-string p5, "grabStarRedPacket"

    .line 132
    .line 133
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p5

    .line 139
    if-eqz p5, :cond_3

    .line 140
    .line 141
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->url:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ll/a5s;->g(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-nez p2, :cond_4

    .line 151
    .line 152
    invoke-virtual {p0, v3}, Ll/a5s;->e(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    add-int/2addr p2, p4

    .line 160
    invoke-virtual {p1, p0, p4, p2, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 161
    .line 162
    .line 163
    return-void
.end method
