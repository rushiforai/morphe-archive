.class public Ll/ya7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wr2$a;


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/PushMessage;ZLandroid/content/Context;)Landroid/content/Intent;
    .locals 8

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "group.notification.list"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p3}, Ll/jek;->g(Landroid/content/Context;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Ll/rum0;->c()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x1

    .line 21
    if-eqz p0, :cond_3

    .line 22
    .line 23
    const-string p0, "call.voice.single"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1, v0}, Ll/xzm0;->v(Lcom/p1/mobile/putong/data/PushMessage;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p2, "calling"

    .line 49
    .line 50
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-nez p2, :cond_2

    .line 55
    .line 56
    const-string p2, "accepted"

    .line 57
    .line 58
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p3, p0, v0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_2
    :goto_0
    invoke-static {p3}, Ll/xwa;->y(Landroid/content/Context;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    const-string p0, "call.voiceinviting.single"

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 90
    .line 91
    iget-object p2, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "conversation"

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 102
    .line 103
    if-eqz p0, :cond_4

    .line 104
    .line 105
    iget-object p2, v1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    iget-object p0, v1, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 109
    .line 110
    const-string v1, "message"

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_5

    .line 117
    .line 118
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 121
    .line 122
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_5

    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-nez p0, :cond_5

    .line 139
    .line 140
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 143
    .line 144
    iget-object p2, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 145
    .line 146
    :cond_5
    :goto_1
    invoke-static {p3, p2, v0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0

    .line 151
    :cond_6
    const-string p0, "growth.follow"

    .line 152
    .line 153
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    const-string v1, "bundle_notify_type"

    .line 160
    .line 161
    const/4 v2, 0x0

    .line 162
    if-eqz p0, :cond_7

    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {p3, p0}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 177
    .line 178
    .line 179
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 180
    .line 181
    .line 182
    return-object p0

    .line 183
    :cond_7
    const-string p0, "membership.expiration"

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 186
    .line 187
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-eqz p0, :cond_8

    .line 192
    .line 193
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {p3, p0}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    .line 207
    .line 208
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 209
    .line 210
    .line 211
    return-object p0

    .line 212
    :cond_8
    const-string p0, "common.link"

    .line 213
    .line 214
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    const-string v3, "bundle_push_exp_time"

    .line 221
    .line 222
    const-string v4, "bundle_check_exp"

    .line 223
    .line 224
    if-nez p0, :cond_9

    .line 225
    .line 226
    const-string p0, "heartbeat.match.link"

    .line 227
    .line 228
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 229
    .line 230
    invoke-static {p0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-eqz p0, :cond_a

    .line 235
    .line 236
    :cond_9
    move-object p0, p3

    .line 237
    goto/16 :goto_a

    .line 238
    .line 239
    :cond_a
    const-string p0, "conversation.single"

    .line 240
    .line 241
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result p0

    .line 247
    const-string v5, "menu"

    .line 248
    .line 249
    const-string v6, "heartbeatMatch"

    .line 250
    .line 251
    if-nez p0, :cond_b

    .line 252
    .line 253
    const-string p0, "male.message.repeat"

    .line 254
    .line 255
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result p0

    .line 261
    if-nez p0, :cond_b

    .line 262
    .line 263
    const-string p0, "chatheat.exchat"

    .line 264
    .line 265
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-eqz p0, :cond_c

    .line 272
    .line 273
    :cond_b
    move-object p0, p3

    .line 274
    goto/16 :goto_8

    .line 275
    .line 276
    :cond_c
    const-string p0, "greeting.single"

    .line 277
    .line 278
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    move-result p0

    .line 284
    if-nez p0, :cond_d

    .line 285
    .line 286
    const-string p0, "greeting.list"

    .line 287
    .line 288
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    if-eqz p0, :cond_e

    .line 295
    .line 296
    :cond_d
    move-object p0, p3

    .line 297
    goto/16 :goto_6

    .line 298
    .line 299
    :cond_e
    const-string p0, "greeting.kankantab"

    .line 300
    .line 301
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-eqz p0, :cond_f

    .line 308
    .line 309
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 310
    .line 311
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 312
    .line 313
    .line 314
    move-result p0

    .line 315
    if-nez p0, :cond_f

    .line 316
    .line 317
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-static {p3, p0}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 328
    .line 329
    .line 330
    return-object p0

    .line 331
    :cond_f
    const-string p0, "quickchat.match"

    .line 332
    .line 333
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result p0

    .line 339
    if-nez p0, :cond_10

    .line 340
    .line 341
    const-string p0, "quickchat.speed-match"

    .line 342
    .line 343
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    if-eqz p0, :cond_11

    .line 350
    .line 351
    :cond_10
    move-object p0, p3

    .line 352
    goto/16 :goto_5

    .line 353
    .line 354
    :cond_11
    const-string p0, "conversation.group"

    .line 355
    .line 356
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result p0

    .line 362
    if-eqz p0, :cond_12

    .line 363
    .line 364
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 365
    .line 366
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 367
    .line 368
    invoke-static {p3, p0, v0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 375
    .line 376
    .line 377
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 378
    .line 379
    .line 380
    return-object p0

    .line 381
    :cond_12
    const-string p0, "conversation.list"

    .line 382
    .line 383
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result p0

    .line 389
    if-nez p0, :cond_13

    .line 390
    .line 391
    const-string p0, "kankan.match"

    .line 392
    .line 393
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 394
    .line 395
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result p0

    .line 399
    if-eqz p0, :cond_14

    .line 400
    .line 401
    :cond_13
    move-object p0, p3

    .line 402
    goto/16 :goto_4

    .line 403
    .line 404
    :cond_14
    const-string p0, "secretcrush.received"

    .line 405
    .line 406
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result p0

    .line 412
    if-eqz p0, :cond_15

    .line 413
    .line 414
    const-string p0, "secret crush"

    .line 415
    .line 416
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-static {p3, p0}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 425
    .line 426
    .line 427
    return-object p0

    .line 428
    :cond_15
    const-string p0, "superLike.received"

    .line 429
    .line 430
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 431
    .line 432
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    move-result p0

    .line 436
    const-string v5, "user"

    .line 437
    .line 438
    if-eqz p0, :cond_17

    .line 439
    .line 440
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 441
    .line 442
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 443
    .line 444
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    move-result p0

    .line 448
    if-eqz p0, :cond_16

    .line 449
    .line 450
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 451
    .line 452
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 453
    .line 454
    const-string p1, "superlike_user_id"

    .line 455
    .line 456
    invoke-static {p3, p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Z6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    goto :goto_2

    .line 461
    :cond_16
    invoke-static {p3}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    :goto_2
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 466
    .line 467
    .line 468
    return-object p0

    .line 469
    :cond_17
    const-string p0, "letter.received"

    .line 470
    .line 471
    iget-object v7, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 472
    .line 473
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result p0

    .line 477
    if-eqz p0, :cond_19

    .line 478
    .line 479
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 480
    .line 481
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 482
    .line 483
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 484
    .line 485
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->type:Ljava/lang/String;

    .line 486
    .line 487
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result p2

    .line 491
    if-eqz p2, :cond_18

    .line 492
    .line 493
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 494
    .line 495
    .line 496
    move-result p0

    .line 497
    if-nez p0, :cond_18

    .line 498
    .line 499
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 500
    .line 501
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 502
    .line 503
    const-string p2, "letter_user_id"

    .line 504
    .line 505
    invoke-static {p3, p2, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Z6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 510
    .line 511
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 512
    .line 513
    const-string p2, "letter_content"

    .line 514
    .line 515
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 516
    .line 517
    .line 518
    goto :goto_3

    .line 519
    :cond_18
    invoke-static {p3}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 520
    .line 521
    .line 522
    move-result-object p0

    .line 523
    :goto_3
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 524
    .line 525
    .line 526
    return-object p0

    .line 527
    :cond_19
    const-string p0, "suggested.list"

    .line 528
    .line 529
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 530
    .line 531
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result p0

    .line 535
    if-nez p0, :cond_1a

    .line 536
    .line 537
    const-string p0, "huawei.unreadMsg"

    .line 538
    .line 539
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 540
    .line 541
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 542
    .line 543
    .line 544
    move-result p0

    .line 545
    if-eqz p0, :cond_1c

    .line 546
    .line 547
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 548
    .line 549
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 550
    .line 551
    .line 552
    move-result p0

    .line 553
    if-nez p0, :cond_1c

    .line 554
    .line 555
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 556
    .line 557
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 558
    .line 559
    .line 560
    move-result-object p0

    .line 561
    invoke-static {p3, p0}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 562
    .line 563
    .line 564
    move-result-object p0

    .line 565
    invoke-static {p0, v0, v0}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 566
    .line 567
    .line 568
    if-nez p2, :cond_1b

    .line 569
    .line 570
    invoke-static {}, Ll/a17;->h()Ll/a17;

    .line 571
    .line 572
    .line 573
    move-result-object p1

    .line 574
    invoke-virtual {p1, v0}, Ll/a17;->i(Z)V

    .line 575
    .line 576
    .line 577
    :cond_1b
    return-object p0

    .line 578
    :cond_1c
    const-string p0, "placesv2.challenge"

    .line 579
    .line 580
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 581
    .line 582
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 583
    .line 584
    .line 585
    move-result p0

    .line 586
    if-eqz p0, :cond_1d

    .line 587
    .line 588
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 589
    .line 590
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 591
    .line 592
    .line 593
    move-result-object p0

    .line 594
    invoke-static {p3, p0}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 595
    .line 596
    .line 597
    move-result-object p0

    .line 598
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 599
    .line 600
    .line 601
    return-object p0

    .line 602
    :cond_1d
    const-string p0, "friend.reminder"

    .line 603
    .line 604
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 605
    .line 606
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    move-result p0

    .line 610
    if-eqz p0, :cond_1e

    .line 611
    .line 612
    invoke-static {p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q7(Landroid/content/Context;)Landroid/content/Intent;

    .line 613
    .line 614
    .line 615
    move-result-object p0

    .line 616
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 617
    .line 618
    .line 619
    return-object p0

    .line 620
    :cond_1e
    const-string p0, "push.pay.landpage"

    .line 621
    .line 622
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 623
    .line 624
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 625
    .line 626
    .line 627
    move-result p0

    .line 628
    if-eqz p0, :cond_1f

    .line 629
    .line 630
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 631
    .line 632
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 633
    .line 634
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 635
    .line 636
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 637
    .line 638
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 639
    .line 640
    iget-object v5, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 641
    .line 642
    move-object v0, p3

    .line 643
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/result/PurchaseResultAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 644
    .line 645
    .line 646
    move-result-object p0

    .line 647
    return-object p0

    .line 648
    :cond_1f
    move-object p0, p3

    .line 649
    const-string p3, "see.picks"

    .line 650
    .line 651
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 652
    .line 653
    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 654
    .line 655
    .line 656
    move-result p3

    .line 657
    if-eqz p3, :cond_20

    .line 658
    .line 659
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->r7(Landroid/content/Context;)Landroid/content/Intent;

    .line 660
    .line 661
    .line 662
    move-result-object p0

    .line 663
    invoke-static {p0, v0, v0}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 664
    .line 665
    .line 666
    return-object p0

    .line 667
    :cond_20
    const-string p3, "guide.update"

    .line 668
    .line 669
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 670
    .line 671
    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 672
    .line 673
    .line 674
    move-result p3

    .line 675
    if-eqz p3, :cond_21

    .line 676
    .line 677
    new-instance p1, Landroid/content/Intent;

    .line 678
    .line 679
    const-class p2, Lcom/p1/mobile/putong/core/ui/notifications/PushUpdateIntentAct;

    .line 680
    .line 681
    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 682
    .line 683
    .line 684
    return-object p1

    .line 685
    :cond_21
    const-string p3, "heartbeat.match.recall"

    .line 686
    .line 687
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 688
    .line 689
    invoke-static {p3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 690
    .line 691
    .line 692
    move-result p3

    .line 693
    if-eqz p3, :cond_22

    .line 694
    .line 695
    invoke-static {v6}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 696
    .line 697
    .line 698
    move-result-object p2

    .line 699
    invoke-static {p0, p2}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 700
    .line 701
    .line 702
    move-result-object p0

    .line 703
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 704
    .line 705
    invoke-virtual {p0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 706
    .line 707
    .line 708
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 709
    .line 710
    .line 711
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 712
    .line 713
    iget-wide p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 714
    .line 715
    double-to-long p2, p2

    .line 716
    invoke-virtual {p0, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 717
    .line 718
    .line 719
    invoke-virtual {p0, v3, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 720
    .line 721
    .line 722
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 723
    .line 724
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 725
    .line 726
    const-string p3, "traker"

    .line 727
    .line 728
    invoke-virtual {p0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 729
    .line 730
    .line 731
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 732
    .line 733
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 734
    .line 735
    const-string p3, "userid"

    .line 736
    .line 737
    invoke-virtual {p0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 738
    .line 739
    .line 740
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessage;->toJson()Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    return-object p0

    .line 744
    :cond_22
    const-string p3, "quickchat.party"

    .line 745
    .line 746
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 747
    .line 748
    invoke-static {p3, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 749
    .line 750
    .line 751
    move-result p3

    .line 752
    if-eqz p3, :cond_23

    .line 753
    .line 754
    const-string p2, "cards"

    .line 755
    .line 756
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 757
    .line 758
    .line 759
    move-result-object p3

    .line 760
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationCardIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 761
    .line 762
    .line 763
    move-result-object p2

    .line 764
    new-instance v3, Ljava/util/HashMap;

    .line 765
    .line 766
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 767
    .line 768
    .line 769
    invoke-static {p0, p3, p2, v3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->O5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;

    .line 770
    .line 771
    .line 772
    move-result-object p0

    .line 773
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 774
    .line 775
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 776
    .line 777
    .line 778
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 779
    .line 780
    .line 781
    return-object p0

    .line 782
    :cond_23
    invoke-static {p0}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 783
    .line 784
    .line 785
    move-result-object p0

    .line 786
    invoke-static {p0, v0, v0}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 787
    .line 788
    .line 789
    if-nez p2, :cond_24

    .line 790
    .line 791
    invoke-static {}, Ll/a17;->h()Ll/a17;

    .line 792
    .line 793
    .line 794
    move-result-object p1

    .line 795
    invoke-virtual {p1, v0}, Ll/a17;->i(Z)V

    .line 796
    .line 797
    .line 798
    :cond_24
    return-object p0

    .line 799
    :goto_4
    invoke-static {v5}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 800
    .line 801
    .line 802
    move-result-object p1

    .line 803
    invoke-static {p0, p1}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 808
    .line 809
    .line 810
    return-object p0

    .line 811
    :goto_5
    const-string p2, "quickChatMatch"

    .line 812
    .line 813
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 814
    .line 815
    .line 816
    move-result-object p2

    .line 817
    invoke-static {p0, p2}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 818
    .line 819
    .line 820
    move-result-object p0

    .line 821
    new-instance p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 822
    .line 823
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 824
    .line 825
    .line 826
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->transDataFromPush(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 827
    .line 828
    .line 829
    const-string p1, "otherUser"

    .line 830
    .line 831
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 832
    .line 833
    .line 834
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 835
    .line 836
    .line 837
    return-object p0

    .line 838
    :goto_6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 839
    .line 840
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 841
    .line 842
    iget-object p3, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 843
    .line 844
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 845
    .line 846
    invoke-virtual {p2, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 847
    .line 848
    .line 849
    move-result-object p2

    .line 850
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 851
    .line 852
    .line 853
    move-result p2

    .line 854
    if-nez p2, :cond_26

    .line 855
    .line 856
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 857
    .line 858
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 859
    .line 860
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 861
    .line 862
    .line 863
    move-result p2

    .line 864
    if-eqz p2, :cond_25

    .line 865
    .line 866
    goto :goto_7

    .line 867
    :cond_25
    const-string p2, "greetChat"

    .line 868
    .line 869
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 870
    .line 871
    .line 872
    move-result-object p2

    .line 873
    invoke-static {p0, p2}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 874
    .line 875
    .line 876
    move-result-object p0

    .line 877
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 878
    .line 879
    .line 880
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 881
    .line 882
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 883
    .line 884
    const-string p2, "greetingId"

    .line 885
    .line 886
    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 887
    .line 888
    .line 889
    return-object p0

    .line 890
    :cond_26
    :goto_7
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 891
    .line 892
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 893
    .line 894
    invoke-static {p0, p2, v0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 895
    .line 896
    .line 897
    move-result-object p0

    .line 898
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 899
    .line 900
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 901
    .line 902
    .line 903
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 904
    .line 905
    .line 906
    return-object p0

    .line 907
    :goto_8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 908
    .line 909
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 910
    .line 911
    iget-object p3, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 912
    .line 913
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 914
    .line 915
    invoke-virtual {p2, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 916
    .line 917
    .line 918
    move-result-object p2

    .line 919
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 920
    .line 921
    .line 922
    move-result p3

    .line 923
    if-nez p3, :cond_28

    .line 924
    .line 925
    iget-object p3, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 926
    .line 927
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 928
    .line 929
    invoke-static {p3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 930
    .line 931
    .line 932
    move-result p3

    .line 933
    if-nez p3, :cond_28

    .line 934
    .line 935
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 936
    .line 937
    .line 938
    move-result p3

    .line 939
    if-eqz p3, :cond_27

    .line 940
    .line 941
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 942
    .line 943
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 944
    .line 945
    .line 946
    move-result p3

    .line 947
    if-eqz p3, :cond_27

    .line 948
    .line 949
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 950
    .line 951
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 952
    .line 953
    invoke-static {p2, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 954
    .line 955
    .line 956
    move-result p2

    .line 957
    if-eqz p2, :cond_27

    .line 958
    .line 959
    goto :goto_9

    .line 960
    :cond_27
    invoke-static {v5}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 961
    .line 962
    .line 963
    move-result-object p1

    .line 964
    invoke-static {p0, p1}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 965
    .line 966
    .line 967
    move-result-object p0

    .line 968
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 969
    .line 970
    .line 971
    return-object p0

    .line 972
    :cond_28
    :goto_9
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 973
    .line 974
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 975
    .line 976
    invoke-static {p0, p2, v0}, Ll/xwa;->n(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 977
    .line 978
    .line 979
    move-result-object p0

    .line 980
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 981
    .line 982
    invoke-virtual {p0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 983
    .line 984
    .line 985
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 986
    .line 987
    .line 988
    return-object p0

    .line 989
    :goto_a
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 990
    .line 991
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 992
    .line 993
    .line 994
    move-result-object p2

    .line 995
    invoke-static {p0, p2}, Ll/xwa;->s(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 996
    .line 997
    .line 998
    move-result-object p0

    .line 999
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 1000
    .line 1001
    invoke-virtual {p0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1002
    .line 1003
    .line 1004
    invoke-static {p0, v0, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 1005
    .line 1006
    .line 1007
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 1008
    .line 1009
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1010
    .line 1011
    .line 1012
    move-result p2

    .line 1013
    if-eqz p2, :cond_29

    .line 1014
    .line 1015
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 1016
    .line 1017
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 1018
    .line 1019
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1020
    .line 1021
    .line 1022
    move-result p2

    .line 1023
    if-nez p2, :cond_29

    .line 1024
    .line 1025
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 1026
    .line 1027
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 1028
    .line 1029
    const-string p3, "heartbeat.match.broadcast"

    .line 1030
    .line 1031
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1032
    .line 1033
    .line 1034
    move-result p2

    .line 1035
    if-eqz p2, :cond_29

    .line 1036
    .line 1037
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 1038
    .line 1039
    iget-wide p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 1040
    .line 1041
    double-to-long p2, p2

    .line 1042
    invoke-virtual {p0, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {p0, v3, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1046
    .line 1047
    .line 1048
    :cond_29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessage;->toJson()Ljava/lang/String;

    .line 1049
    .line 1050
    .line 1051
    return-object p0
.end method
