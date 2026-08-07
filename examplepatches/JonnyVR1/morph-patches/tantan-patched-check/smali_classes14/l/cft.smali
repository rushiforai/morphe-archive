.class public Ll/cft;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-static {p0, p2}, Ll/cft;->c(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {p0, p1}, Ll/toh0;->e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    long-to-int p2, v0

    .line 19
    const/high16 v0, 0x4000000

    .line 20
    .line 21
    invoke-static {p1, p2, p0, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/tbs;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ll/nae0;->e(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {p0, p1}, Ll/toh0;->e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    long-to-int v0, v0

    .line 25
    const/high16 v1, 0x4000000

    .line 26
    .line 27
    invoke-static {p1, v0, p0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;
    .locals 9

    .line 1
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "1"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "from_push"

    .line 7
    .line 8
    if-eqz p0, :cond_11

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    const-string v5, "video.chat.notify.push"

    .line 30
    .line 31
    const/4 v6, 0x1

    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v8, -0x1

    .line 34
    sparse-switch v4, :sswitch_data_0

    .line 35
    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :sswitch_0
    const-string v4, "live.voiceLiving.start"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :cond_1
    const/16 v8, 0xd

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :sswitch_1
    const-string v4, "live.schema.push"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_2

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_2
    const/16 v8, 0xc

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :sswitch_2
    const-string v4, "live.anchor.push"

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-nez v3, :cond_3

    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_3
    const/16 v8, 0xb

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :sswitch_3
    const-string v4, "live.voiceLikeOrFollowLiving.push"

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_4

    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :cond_4
    const/16 v8, 0xa

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :sswitch_4
    const-string v4, "live.voiceLikeOrFollowOncall.push"

    .line 96
    .line 97
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_5

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :cond_5
    const/16 v8, 0x9

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :sswitch_5
    const-string v4, "live.living.push"

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-nez v3, :cond_6

    .line 116
    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :cond_6
    const/16 v8, 0x8

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :sswitch_6
    const-string v4, "live.voiceFriendLiving.push"

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-nez v3, :cond_7

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_7
    const/4 v8, 0x7

    .line 133
    goto :goto_0

    .line 134
    :sswitch_7
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_8

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_8
    const/4 v8, 0x6

    .line 142
    goto :goto_0

    .line 143
    :sswitch_8
    const-string v4, "live.voiceFriendOncall.push"

    .line 144
    .line 145
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-nez v3, :cond_9

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_9
    const/4 v8, 0x5

    .line 153
    goto :goto_0

    .line 154
    :sswitch_9
    const-string v4, "voice.enterroom.push-managerRecall"

    .line 155
    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_a

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_a
    const/4 v8, 0x4

    .line 164
    goto :goto_0

    .line 165
    :sswitch_a
    const-string v4, "live.voiceLiving.push"

    .line 166
    .line 167
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    if-nez v3, :cond_b

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_b
    const/4 v8, 0x3

    .line 175
    goto :goto_0

    .line 176
    :sswitch_b
    const-string v4, "live.chatNewMsg.push"

    .line 177
    .line 178
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-nez v3, :cond_c

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_c
    const/4 v8, 0x2

    .line 186
    goto :goto_0

    .line 187
    :sswitch_c
    const-string v4, "live.square.push"

    .line 188
    .line 189
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    if-nez v3, :cond_d

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_d
    move v8, v6

    .line 197
    goto :goto_0

    .line 198
    :sswitch_d
    const-string v4, "live.audience.suggest.push"

    .line 199
    .line 200
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-nez v3, :cond_e

    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_e
    move v8, v7

    .line 208
    :goto_0
    packed-switch v8, :pswitch_data_0

    .line 209
    .line 210
    .line 211
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-interface {v3, p1, v0, v2, v1}, Ll/swl;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    goto :goto_1

    .line 220
    :pswitch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 221
    .line 222
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {p0, v1}, Ll/r4u;->d(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-interface {v0, p1, p0}, Ll/swl;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    return-object p0

    .line 237
    :pswitch_1
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 242
    .line 243
    invoke-interface {v0, p1, v1}, Ll/swl;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    goto :goto_1

    .line 248
    :pswitch_2
    invoke-static {}, Ll/lwk0;->b()Ll/lwk0;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-virtual {p0}, Ll/lwk0;->c()Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-eqz p0, :cond_f

    .line 257
    .line 258
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/live/external/internal/vchat/IntentBridgeAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    return-object p0

    .line 263
    :cond_f
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    const/high16 p1, 0x20000000

    .line 268
    .line 269
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 270
    .line 271
    .line 272
    return-object p0

    .line 273
    :pswitch_3
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 278
    .line 279
    invoke-interface {v0, p1, v1, p0}, Ll/swl;->b(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;)Landroid/content/Intent;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    goto :goto_1

    .line 284
    :pswitch_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 285
    .line 286
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 287
    .line 288
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-interface {v3, p1, v1, v2, v0}, Ll/swl;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 299
    .line 300
    const-string v2, "voice.enterroom.push"

    .line 301
    .line 302
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    if-eqz v1, :cond_10

    .line 307
    .line 308
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {v0, p1, v1, p0}, Ll/swl;->b(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;)Landroid/content/Intent;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    :cond_10
    invoke-static {v0, v6, v7}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 319
    .line 320
    .line 321
    return-object v0

    .line 322
    :pswitch_5
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 327
    .line 328
    invoke-interface {v0, p1, p0}, Ll/swl;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    return-object p0

    .line 333
    :cond_11
    :goto_2
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    invoke-interface {p0, p1, v0, v2, v1}, Ll/swl;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    return-object p0

    .line 342
    nop

    .line 343
    :sswitch_data_0
    .sparse-switch
        -0x5aee4c94 -> :sswitch_d
        -0x4f42e0b7 -> :sswitch_c
        -0x39278453 -> :sswitch_b
        -0x3608fc91 -> :sswitch_a
        -0x3136cafe -> :sswitch_9
        -0x306a03a3 -> :sswitch_8
        -0x1e1a8de4 -> :sswitch_7
        -0x1325720f -> :sswitch_6
        -0xb0b2c3 -> :sswitch_5
        -0x4bf350 -> :sswitch_4
        0x1cf89e44 -> :sswitch_3
        0x3da0f4b1 -> :sswitch_2
        0x5d717545 -> :sswitch_1
        0x7512faad -> :sswitch_0
    .end sparse-switch

    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/cft;->a(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, p1, v0, v0, v0}, Ll/mbs;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static e(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-interface {p0, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    return-void
.end method

.method public static f()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v2, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v3, Ll/tbs;->f:Ll/j6t;

    .line 53
    .line 54
    invoke-virtual {v3, v2}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    return v0

    .line 62
    :cond_3
    const/4 v0, 0x0

    .line 63
    return v0
.end method
