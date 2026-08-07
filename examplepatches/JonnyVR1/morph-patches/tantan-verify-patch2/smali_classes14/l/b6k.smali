.class public Ll/b6k;
.super Ll/owl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/owl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/mwl;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/odt;->h()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/b6k;->s(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 24
    .line 25
    const-string p3, "live.schema.push.in.app"

    .line 26
    .line 27
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-nez p2, :cond_c

    .line 32
    .line 33
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 36
    .line 37
    const-string p3, "live.audience.signin.push"

    .line 38
    .line 39
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_c

    .line 44
    .line 45
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 48
    .line 49
    const-string p3, "live.voiceLiving.partnerFinder.push"

    .line 50
    .line 51
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_c

    .line 56
    .line 57
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 58
    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 60
    .line 61
    const-string p3, "live.anchor.living.push"

    .line 62
    .line 63
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_c

    .line 68
    .line 69
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 72
    .line 73
    const-string p3, "live.card.push.in.app"

    .line 74
    .line 75
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-nez p2, :cond_c

    .line 80
    .line 81
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 82
    .line 83
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 84
    .line 85
    const-string p3, "live.ongoingLive.pinkCard"

    .line 86
    .line 87
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_1

    .line 92
    .line 93
    goto/16 :goto_1

    .line 94
    .line 95
    :cond_1
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 96
    .line 97
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 98
    .line 99
    const-string p3, "live.schema.push.all"

    .line 100
    .line 101
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-nez p2, :cond_2

    .line 106
    .line 107
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 108
    .line 109
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 110
    .line 111
    const-string p3, "live.schema.boutique.enter"

    .line 112
    .line 113
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_8

    .line 118
    .line 119
    :cond_2
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 120
    .line 121
    iget-boolean p3, p2, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 122
    .line 123
    const/4 v0, 0x0

    .line 124
    if-nez p3, :cond_a

    .line 125
    .line 126
    if-eqz p1, :cond_3

    .line 127
    .line 128
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p2}, Ll/odt;->g(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_3

    .line 135
    .line 136
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object p0, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 141
    .line 142
    invoke-virtual {p1, p0}, Ll/z0n;->c(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 147
    .line 148
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 149
    .line 150
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 151
    .line 152
    const-string p3, "background"

    .line 153
    .line 154
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    if-eqz p2, :cond_4

    .line 159
    .line 160
    if-eqz p1, :cond_4

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_4
    iget-object p2, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 165
    .line 166
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 167
    .line 168
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 169
    .line 170
    const-string p3, "foreground"

    .line 171
    .line 172
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-eqz p2, :cond_5

    .line 177
    .line 178
    if-nez p1, :cond_5

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :cond_5
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-nez p1, :cond_6

    .line 191
    .line 192
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 195
    .line 196
    const-string p2, "&from="

    .line 197
    .line 198
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-nez p1, :cond_6

    .line 203
    .line 204
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 205
    .line 206
    new-instance p2, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    iget-object p3, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 212
    .line 213
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p3, "&from=from_push"

    .line 219
    .line 220
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p2

    .line 227
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 228
    .line 229
    :cond_6
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 230
    .line 231
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 232
    .line 233
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 234
    .line 235
    const-string p2, "virtualAvatar"

    .line 236
    .line 237
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_7

    .line 242
    .line 243
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 244
    .line 245
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 246
    .line 247
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-nez p1, :cond_7

    .line 252
    .line 253
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 254
    .line 255
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 256
    .line 257
    const-string p2, "&liveMode="

    .line 258
    .line 259
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-nez p1, :cond_7

    .line 264
    .line 265
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 266
    .line 267
    new-instance p2, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    iget-object p3, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 273
    .line 274
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    const-string p3, "&liveMode=virtualAvatar"

    .line 280
    .line 281
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p2

    .line 288
    iput-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 289
    .line 290
    :cond_7
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 291
    .line 292
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    new-instance p2, Ll/abe0$a;

    .line 299
    .line 300
    sget-object p3, Ll/tbs;->a:Landroid/app/Application;

    .line 301
    .line 302
    iget-object v1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 303
    .line 304
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 305
    .line 306
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-direct {p2, p3, v1}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p2}, Ll/abe0$a;->d()Ll/abe0;

    .line 318
    .line 319
    .line 320
    move-result-object p2

    .line 321
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 322
    .line 323
    .line 324
    move-result-object p3

    .line 325
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SchemeKey;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SchemeKey;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    new-instance v1, Ll/a6k;

    .line 334
    .line 335
    invoke-direct {v1}, Ll/a6k;-><init>()V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p3, p1, p2, v1}, Ll/t4k0;->f(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    if-nez p1, :cond_9

    .line 343
    .line 344
    :cond_8
    :goto_0
    return-void

    .line 345
    :cond_9
    iget-object p1, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 346
    .line 347
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 348
    .line 349
    iget-object p2, p0, Ll/mwl;->b:Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 350
    .line 351
    invoke-static {p1, p2}, Ll/cft;->b(Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 352
    .line 353
    .line 354
    move-result-object p1

    .line 355
    iget-object p0, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 356
    .line 357
    invoke-static {p0, p1, v0, v0, v0}, Ll/mbs;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V

    .line 358
    .line 359
    .line 360
    return-void

    .line 361
    :cond_a
    if-eqz p1, :cond_b

    .line 362
    .line 363
    invoke-static {}, Lcom/p1/mobile/android/app/App;->e()J

    .line 364
    .line 365
    .line 366
    move-result-wide p1

    .line 367
    const-wide/16 v1, 0x2710

    .line 368
    .line 369
    cmp-long p1, p1, v1

    .line 370
    .line 371
    if-lez p1, :cond_b

    .line 372
    .line 373
    iget-object p0, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 374
    .line 375
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 376
    .line 377
    invoke-static {p0, v0}, Ll/v5k0;->k(Ljava/lang/String;Ll/z20;)V

    .line 378
    .line 379
    .line 380
    return-void

    .line 381
    :cond_b
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    iget-object p0, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 386
    .line 387
    invoke-virtual {p1, p0}, Ll/z0n;->c(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 388
    .line 389
    .line 390
    return-void

    .line 391
    :cond_c
    :goto_1
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    iget-object p0, p0, Ll/mwl;->a:Lcom/p1/mobile/putong/data/PushMessage;

    .line 396
    .line 397
    invoke-virtual {p1, p0}, Ll/z0n;->c(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 398
    .line 399
    .line 400
    return-void
.end method

.method public k(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "live.schema.push.in.app"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "live.audience.signin.push"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "live.voiceLiving.partnerFinder.push"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "live.anchor.living.push"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const-string p0, "live.card.push.in.app"

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    const-string p0, "live.ongoingLive.pinkCard"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    const-string p0, "live.schema.push.all"

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    const-string p0, "live.schema.boutique.enter"

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 69
    return p0
.end method

.method public final s(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 46
    .line 47
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 48
    .line 49
    iput-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 50
    .line 51
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 66
    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 70
    .line 71
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_4

    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 94
    .line 95
    :cond_4
    return-void
.end method
