.class Lcom/immomo/momomediaext/MMLiveEngine$d0;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d0"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "uid"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-long v3, v1

    .line 23
    const-string v1, "what"

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v5, "extra"

    .line 30
    .line 31
    invoke-virtual {v0, v5, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const-string v6, "width"

    .line 36
    .line 37
    invoke-virtual {v0, v6, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 38
    .line 39
    .line 40
    const-string v6, "height"

    .line 41
    .line 42
    invoke-virtual {v0, v6, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    const-string v6, "channel"

    .line 46
    .line 47
    invoke-virtual {v0, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    const-string v9, "pushtype"

    .line 60
    .line 61
    invoke-virtual {v0, v9}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    aget-object v8, v8, v10

    .line 66
    .line 67
    iget p1, p1, Landroid/os/Message;->what:I

    .line 68
    .line 69
    const/16 v10, -0x16a9

    .line 70
    .line 71
    const/16 v11, 0x32a

    .line 72
    .line 73
    if-eq p1, v10, :cond_14

    .line 74
    .line 75
    const/16 v10, -0x16a8

    .line 76
    .line 77
    if-eq p1, v10, :cond_14

    .line 78
    .line 79
    const/16 v10, -0x138d

    .line 80
    .line 81
    if-eq p1, v10, :cond_13

    .line 82
    .line 83
    const/16 v10, -0x1073

    .line 84
    .line 85
    if-eq p1, v10, :cond_12

    .line 86
    .line 87
    const/16 v10, 0x1074

    .line 88
    .line 89
    const-string v11, "type:"

    .line 90
    .line 91
    if-eq p1, v10, :cond_11

    .line 92
    .line 93
    const/16 v10, 0x1398

    .line 94
    .line 95
    if-eq p1, v10, :cond_10

    .line 96
    .line 97
    const/16 v10, 0x139d

    .line 98
    .line 99
    if-eq p1, v10, :cond_f

    .line 100
    .line 101
    const/16 v10, 0x13b2

    .line 102
    .line 103
    if-eq p1, v10, :cond_e

    .line 104
    .line 105
    const/16 v10, 0x1775

    .line 106
    .line 107
    if-eq p1, v10, :cond_d

    .line 108
    .line 109
    const/16 v10, -0x106a

    .line 110
    .line 111
    if-eq p1, v10, :cond_c

    .line 112
    .line 113
    const/16 v10, -0x1069

    .line 114
    .line 115
    if-eq p1, v10, :cond_c

    .line 116
    .line 117
    const/16 v10, 0x106f

    .line 118
    .line 119
    if-eq p1, v10, :cond_b

    .line 120
    .line 121
    const/16 v10, 0x1070

    .line 122
    .line 123
    if-eq p1, v10, :cond_a

    .line 124
    .line 125
    const/16 v10, 0x1388

    .line 126
    .line 127
    if-eq p1, v10, :cond_9

    .line 128
    .line 129
    const/16 v10, 0x1389

    .line 130
    .line 131
    if-eq p1, v10, :cond_8

    .line 132
    .line 133
    const/16 v10, 0x1392

    .line 134
    .line 135
    const-string v12, "reason"

    .line 136
    .line 137
    if-eq p1, v10, :cond_7

    .line 138
    .line 139
    const/16 v6, 0x1393

    .line 140
    .line 141
    if-eq p1, v6, :cond_6

    .line 142
    .line 143
    const/16 v6, 0x13a7

    .line 144
    .line 145
    const-string v10, "muted"

    .line 146
    .line 147
    if-eq p1, v6, :cond_5

    .line 148
    .line 149
    const/16 v6, 0x13a8

    .line 150
    .line 151
    if-eq p1, v6, :cond_4

    .line 152
    .line 153
    const/16 v6, 0x13bf

    .line 154
    .line 155
    if-eq p1, v6, :cond_3

    .line 156
    .line 157
    const/16 v6, 0x13c0

    .line 158
    .line 159
    if-eq p1, v6, :cond_2

    .line 160
    .line 161
    const-string v6, "PUBLISH_EVT_PUB_PUBLISHED, onEnginePushReplaced"

    .line 162
    .line 163
    packed-switch p1, :pswitch_data_0

    .line 164
    .line 165
    .line 166
    packed-switch p1, :pswitch_data_1

    .line 167
    .line 168
    .line 169
    :goto_0
    return-void

    .line 170
    :pswitch_0
    const-string p1, "state"

    .line 171
    .line 172
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    invoke-virtual {v0, v12}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    const-string v2, "elapsed"

    .line 181
    .line 182
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    const-string v2, "PUBLISH_LINK_REMOTE_VIDEO_STATE"

    .line 187
    .line 188
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 196
    .line 197
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    long-to-int v2, v3

    .line 202
    invoke-virtual {p0, v2, p1, v1, v0}, Ll/enw;->d0(IIII)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :pswitch_1
    invoke-virtual {v0, v9, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    new-instance v3, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    filled-new-array {v6, v0, v1, v3}, [Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 238
    .line 239
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    aget-object p1, v1, p1

    .line 248
    .line 249
    invoke-virtual {v0, p1}, Ll/enw;->s(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 250
    .line 251
    .line 252
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 253
    .line 254
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->x0(Z)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :pswitch_2
    invoke-virtual {v0, v9, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 263
    .line 264
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    aget-object p1, v0, p1

    .line 273
    .line 274
    invoke-virtual {p0, p1}, Ll/enw;->t(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :pswitch_3
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-virtual {v0, v9}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    aget-object p1, p1, v0

    .line 287
    .line 288
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 289
    .line 290
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    invoke-virtual {p0, p1}, Ll/enw;->u(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    :pswitch_4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    filled-new-array {v6, p1, v0, v1}, [Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 326
    .line 327
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-virtual {p1, v8}, Ll/enw;->s(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 332
    .line 333
    .line 334
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 335
    .line 336
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/MMLiveEngine;->x0(Z)V

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :pswitch_5
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 341
    .line 342
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    if-eqz p1, :cond_1

    .line 347
    .line 348
    const-string p1, "MMLiveEngine"

    .line 349
    .line 350
    const-string v0, "PUBLISH_EVT_PUB_PUBLISHING rtmpPrepared true"

    .line 351
    .line 352
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 360
    .line 361
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {p1}, Ll/gnw;->e()Ll/p4k0;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    const/4 v1, 0x1

    .line 374
    invoke-virtual {v0, p1, v1}, Ll/qj20;->w(Ll/p4k0;Z)V

    .line 375
    .line 376
    .line 377
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 378
    .line 379
    invoke-static {p1, v1}, Lcom/immomo/momomediaext/MMLiveEngine;->m(Lcom/immomo/momomediaext/MMLiveEngine;Z)Z

    .line 380
    .line 381
    .line 382
    :cond_1
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 383
    .line 384
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-virtual {p0, v8}, Ll/enw;->t(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 389
    .line 390
    .line 391
    return-void

    .line 392
    :cond_2
    invoke-virtual {v0, v9, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 393
    .line 394
    .line 395
    const-string p1, "errorCode"

    .line 396
    .line 397
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 398
    .line 399
    .line 400
    move-result p1

    .line 401
    const-string v1, "errorMsg"

    .line 402
    .line 403
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 408
    .line 409
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 414
    .line 415
    invoke-direct {v1, v6, p1, v0}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {p0, v1}, Ll/enw;->e(Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 419
    .line 420
    .line 421
    return-void

    .line 422
    :cond_3
    const-string p1, "faceCount"

    .line 423
    .line 424
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 425
    .line 426
    .line 427
    move-result p1

    .line 428
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 429
    .line 430
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 431
    .line 432
    .line 433
    move-result-object p0

    .line 434
    invoke-virtual {p0, p1}, Ll/enw;->v(I)V

    .line 435
    .line 436
    .line 437
    return-void

    .line 438
    :cond_4
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 439
    .line 440
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 441
    .line 442
    .line 443
    move-result-object p1

    .line 444
    invoke-virtual {v0, v10}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 449
    .line 450
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 451
    .line 452
    .line 453
    move-result-object p0

    .line 454
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 455
    .line 456
    invoke-virtual {p1, v7, v0, p0}, Ll/enw;->c0(Ljava/lang/String;ZLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 457
    .line 458
    .line 459
    return-void

    .line 460
    :cond_5
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 461
    .line 462
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 463
    .line 464
    .line 465
    move-result-object p1

    .line 466
    invoke-virtual {v0, v10}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 471
    .line 472
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 477
    .line 478
    invoke-virtual {p1, v7, v0, p0}, Ll/enw;->Y(Ljava/lang/String;ZLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 479
    .line 480
    .line 481
    return-void

    .line 482
    :cond_6
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 483
    .line 484
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    invoke-virtual {v0, v12}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 489
    .line 490
    .line 491
    move-result v0

    .line 492
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 493
    .line 494
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 495
    .line 496
    .line 497
    move-result-object p0

    .line 498
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 499
    .line 500
    invoke-virtual {p1, v7, v0, p0}, Ll/enw;->a0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 501
    .line 502
    .line 503
    return-void

    .line 504
    :cond_7
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 505
    .line 506
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    invoke-virtual {v0, v12}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 515
    .line 516
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 517
    .line 518
    .line 519
    move-result-object p0

    .line 520
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 521
    .line 522
    invoke-virtual {p1, v6, v0, p0}, Ll/enw;->A(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 523
    .line 524
    .line 525
    return-void

    .line 526
    :cond_8
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 527
    .line 528
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 529
    .line 530
    .line 531
    move-result-object p1

    .line 532
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 533
    .line 534
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 539
    .line 540
    invoke-virtual {p1, v6, v7, p0}, Ll/enw;->Z(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 541
    .line 542
    .line 543
    return-void

    .line 544
    :cond_9
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 545
    .line 546
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 551
    .line 552
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 557
    .line 558
    invoke-virtual {p1, v6, v3, v4, p0}, Ll/enw;->z(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 559
    .line 560
    .line 561
    return-void

    .line 562
    :cond_a
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 563
    .line 564
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 565
    .line 566
    .line 567
    move-result-object p0

    .line 568
    invoke-virtual {p0, v8}, Ll/enw;->q(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 569
    .line 570
    .line 571
    return-void

    .line 572
    :cond_b
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 573
    .line 574
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 575
    .line 576
    .line 577
    move-result-object p0

    .line 578
    invoke-virtual {p0, v8}, Ll/enw;->p(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :cond_c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    const-string v2, "PUBLISH_EVT_PUB_SYS_ERROR"

    .line 591
    .line 592
    filled-new-array {v2, p1, v0}, [Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 597
    .line 598
    .line 599
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 600
    .line 601
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 602
    .line 603
    .line 604
    move-result-object p1

    .line 605
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 606
    .line 607
    new-instance v2, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 608
    .line 609
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 610
    .line 611
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 616
    .line 617
    invoke-static {p0, v1, v5}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 618
    .line 619
    .line 620
    move-result-object p0

    .line 621
    invoke-direct {v2, v1, v5, p0}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 622
    .line 623
    .line 624
    invoke-virtual {p1, v0, v2}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 625
    .line 626
    .line 627
    return-void

    .line 628
    :cond_d
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 629
    .line 630
    .line 631
    move-result-object p1

    .line 632
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    const-string v2, "AID_INFO"

    .line 637
    .line 638
    const-string v3, "Aid"

    .line 639
    .line 640
    filled-new-array {v2, v3, p1, v0}, [Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object p1

    .line 644
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 645
    .line 646
    .line 647
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 648
    .line 649
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 650
    .line 651
    .line 652
    move-result-object p0

    .line 653
    invoke-virtual {p0, v1, v5}, Ll/enw;->b(II)V

    .line 654
    .line 655
    .line 656
    return-void

    .line 657
    :cond_e
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 658
    .line 659
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 660
    .line 661
    .line 662
    move-result-object p0

    .line 663
    const-string p1, "routing"

    .line 664
    .line 665
    invoke-virtual {v0, p1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 666
    .line 667
    .line 668
    move-result p1

    .line 669
    invoke-virtual {p0, p1}, Ll/enw;->d(I)V

    .line 670
    .line 671
    .line 672
    return-void

    .line 673
    :cond_f
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 674
    .line 675
    .line 676
    move-result-object p1

    .line 677
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 678
    .line 679
    .line 680
    move-result-object v0

    .line 681
    const-string v2, "PUBLISH_LINK_ERROR"

    .line 682
    .line 683
    filled-new-array {v2, p1, v0}, [Ljava/lang/Object;

    .line 684
    .line 685
    .line 686
    move-result-object p1

    .line 687
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 688
    .line 689
    .line 690
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 691
    .line 692
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 693
    .line 694
    .line 695
    move-result-object p1

    .line 696
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 697
    .line 698
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 703
    .line 704
    new-instance v2, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 705
    .line 706
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 707
    .line 708
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 709
    .line 710
    .line 711
    move-result-object p0

    .line 712
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 713
    .line 714
    invoke-static {p0, v1, v5}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object p0

    .line 718
    invoke-direct {v2, v1, v5, p0}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 719
    .line 720
    .line 721
    invoke-virtual {p1, v0, v2}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 722
    .line 723
    .line 724
    return-void

    .line 725
    :cond_10
    iget-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 726
    .line 727
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 728
    .line 729
    .line 730
    move-result-object p1

    .line 731
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 732
    .line 733
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 734
    .line 735
    .line 736
    move-result-object p0

    .line 737
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 738
    .line 739
    invoke-virtual {p1, p0}, Ll/enw;->G(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 740
    .line 741
    .line 742
    return-void

    .line 743
    :cond_11
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 744
    .line 745
    .line 746
    move-result-object p1

    .line 747
    invoke-virtual {v0, v9}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 748
    .line 749
    .line 750
    move-result v0

    .line 751
    aget-object p1, p1, v0

    .line 752
    .line 753
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 754
    .line 755
    .line 756
    move-result-object v0

    .line 757
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 758
    .line 759
    .line 760
    move-result-object v1

    .line 761
    new-instance v3, Ljava/lang/StringBuilder;

    .line 762
    .line 763
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 764
    .line 765
    .line 766
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 767
    .line 768
    .line 769
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 770
    .line 771
    .line 772
    move-result-object v3

    .line 773
    const-string v4, "PUBLISH_EVT_PUB_PREPARED"

    .line 774
    .line 775
    filled-new-array {v4, v0, v1, v3}, [Ljava/lang/Object;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 780
    .line 781
    .line 782
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 783
    .line 784
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 785
    .line 786
    .line 787
    move-result-object p0

    .line 788
    invoke-virtual {p0, p1, v2}, Ll/enw;->r(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;I)V

    .line 789
    .line 790
    .line 791
    return-void

    .line 792
    :cond_12
    const-string p0, "PUBLISH_EVT_CV_DOWNLOAD_FAILED"

    .line 793
    .line 794
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 795
    .line 796
    .line 797
    move-result-object p0

    .line 798
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 799
    .line 800
    .line 801
    return-void

    .line 802
    :cond_13
    const-string p1, "PUBLISH_LINK_JOINROOM_ERROR"

    .line 803
    .line 804
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 805
    .line 806
    .line 807
    move-result-object p1

    .line 808
    invoke-static {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 809
    .line 810
    .line 811
    new-instance p1, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 812
    .line 813
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 814
    .line 815
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 816
    .line 817
    .line 818
    move-result-object v0

    .line 819
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 820
    .line 821
    invoke-static {v0, v11, v2}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 822
    .line 823
    .line 824
    move-result-object v0

    .line 825
    invoke-direct {p1, v11, v2, v0}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 826
    .line 827
    .line 828
    iput-wide v3, p1, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;->uid:J

    .line 829
    .line 830
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 831
    .line 832
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 833
    .line 834
    .line 835
    move-result-object v0

    .line 836
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 837
    .line 838
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 839
    .line 840
    .line 841
    move-result-object p0

    .line 842
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 843
    .line 844
    invoke-virtual {v0, p0, p1}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 845
    .line 846
    .line 847
    return-void

    .line 848
    :cond_14
    invoke-virtual {v0, v9, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 849
    .line 850
    .line 851
    move-result p1

    .line 852
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 853
    .line 854
    invoke-static {v0, v1, v5, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->n(Lcom/immomo/momomediaext/MMLiveEngine;III)I

    .line 855
    .line 856
    .line 857
    move-result v0

    .line 858
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 859
    .line 860
    .line 861
    move-result-object v3

    .line 862
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 863
    .line 864
    .line 865
    move-result-object v4

    .line 866
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 867
    .line 868
    .line 869
    move-result-object v6

    .line 870
    const-string v7, "PUBLISH_ERROR"

    .line 871
    .line 872
    filled-new-array {v7, v3, v4, v6}, [Ljava/lang/Object;

    .line 873
    .line 874
    .line 875
    move-result-object v3

    .line 876
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 877
    .line 878
    .line 879
    const/16 v3, 0x329

    .line 880
    .line 881
    if-eq v0, v3, :cond_18

    .line 882
    .line 883
    const/16 v4, 0x327

    .line 884
    .line 885
    if-eq v0, v4, :cond_18

    .line 886
    .line 887
    const/16 v4, 0x328

    .line 888
    .line 889
    if-eq v0, v4, :cond_18

    .line 890
    .line 891
    if-eq v0, v11, :cond_18

    .line 892
    .line 893
    const/16 v4, 0x32b

    .line 894
    .line 895
    if-eq v0, v4, :cond_18

    .line 896
    .line 897
    if-ne v0, v3, :cond_15

    .line 898
    .line 899
    goto :goto_2

    .line 900
    :cond_15
    const/16 v3, 0xc

    .line 901
    .line 902
    if-eq v0, v3, :cond_17

    .line 903
    .line 904
    const/16 v3, 0xb

    .line 905
    .line 906
    if-eq v0, v3, :cond_17

    .line 907
    .line 908
    const/16 v3, 0xd

    .line 909
    .line 910
    if-eq v0, v3, :cond_17

    .line 911
    .line 912
    const/16 v3, 0xe

    .line 913
    .line 914
    if-ne v0, v3, :cond_16

    .line 915
    .line 916
    goto :goto_1

    .line 917
    :cond_16
    const/16 v2, 0x326

    .line 918
    .line 919
    if-ne v0, v2, :cond_19

    .line 920
    .line 921
    const-string v2, "rtc engine appid invalid"

    .line 922
    .line 923
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 924
    .line 925
    .line 926
    move-result-object v2

    .line 927
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 928
    .line 929
    .line 930
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 931
    .line 932
    const/4 v3, 0x0

    .line 933
    invoke-static {v2, v3}, Lcom/immomo/momomediaext/MMLiveEngine;->p(Lcom/immomo/momomediaext/MMLiveEngine;Lcom/immomo/momomediaext/a;)Lcom/immomo/momomediaext/a;

    .line 934
    .line 935
    .line 936
    goto :goto_3

    .line 937
    :cond_17
    :goto_1
    const-string v3, "rtmp push error should stopPush"

    .line 938
    .line 939
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 940
    .line 941
    .line 942
    move-result-object v3

    .line 943
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 944
    .line 945
    .line 946
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 947
    .line 948
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;

    .line 949
    .line 950
    .line 951
    move-result-object v3

    .line 952
    if-eqz v3, :cond_19

    .line 953
    .line 954
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 955
    .line 956
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;

    .line 957
    .line 958
    .line 959
    move-result-object v3

    .line 960
    invoke-virtual {v3}, Ll/gnw;->n()V

    .line 961
    .line 962
    .line 963
    iget-object v3, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 964
    .line 965
    invoke-static {v3}, Lcom/immomo/momomediaext/MMLiveEngine;->k(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/gnw;

    .line 966
    .line 967
    .line 968
    move-result-object v3

    .line 969
    invoke-virtual {v3}, Ll/gnw;->e()Ll/p4k0;

    .line 970
    .line 971
    .line 972
    move-result-object v3

    .line 973
    if-eqz v3, :cond_19

    .line 974
    .line 975
    invoke-virtual {v3}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 976
    .line 977
    .line 978
    move-result-object v4

    .line 979
    sget-object v6, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 980
    .line 981
    if-ne v4, v6, :cond_19

    .line 982
    .line 983
    iget-object v4, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 984
    .line 985
    invoke-static {v4}, Lcom/immomo/momomediaext/MMLiveEngine;->l(Lcom/immomo/momomediaext/MMLiveEngine;)Z

    .line 986
    .line 987
    .line 988
    move-result v4

    .line 989
    if-nez v4, :cond_19

    .line 990
    .line 991
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 992
    .line 993
    .line 994
    move-result-object p1

    .line 995
    invoke-virtual {p1, v3, v2}, Ll/qj20;->w(Ll/p4k0;Z)V

    .line 996
    .line 997
    .line 998
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 999
    .line 1000
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->q(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 1001
    .line 1002
    .line 1003
    move-result-object p1

    .line 1004
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->D0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I

    .line 1005
    .line 1006
    .line 1007
    return-void

    .line 1008
    :cond_18
    :goto_2
    const-string v2, "rtc engine error should leaveRoom"

    .line 1009
    .line 1010
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v2

    .line 1014
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 1015
    .line 1016
    .line 1017
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 1018
    .line 1019
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->o(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/a;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v2

    .line 1023
    if-eqz v2, :cond_19

    .line 1024
    .line 1025
    iget-object v2, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 1026
    .line 1027
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->o(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/a;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v2

    .line 1031
    invoke-virtual {v2}, Lcom/immomo/momomediaext/a;->r()V

    .line 1032
    .line 1033
    .line 1034
    :cond_19
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1035
    .line 1036
    const-string v3, "type :"

    .line 1037
    .line 1038
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1039
    .line 1040
    .line 1041
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 1042
    .line 1043
    .line 1044
    move-result-object v3

    .line 1045
    aget-object v3, v3, p1

    .line 1046
    .line 1047
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1048
    .line 1049
    .line 1050
    const-string v3, "what:"

    .line 1051
    .line 1052
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1053
    .line 1054
    .line 1055
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1056
    .line 1057
    .line 1058
    const-string v3, ",extra:"

    .line 1059
    .line 1060
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1061
    .line 1062
    .line 1063
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1064
    .line 1065
    .line 1066
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v2

    .line 1070
    const-string v3, "onEngineError"

    .line 1071
    .line 1072
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 1073
    .line 1074
    .line 1075
    move-result-object v2

    .line 1076
    invoke-static {v2}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 1077
    .line 1078
    .line 1079
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$d0;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 1080
    .line 1081
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 1082
    .line 1083
    .line 1084
    move-result-object p0

    .line 1085
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v2

    .line 1089
    aget-object v2, v2, p1

    .line 1090
    .line 1091
    new-instance v3, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    .line 1092
    .line 1093
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v4

    .line 1097
    aget-object p1, v4, p1

    .line 1098
    .line 1099
    invoke-static {p1, v1, v5}, Ll/kg60;->a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;

    .line 1100
    .line 1101
    .line 1102
    move-result-object p1

    .line 1103
    invoke-direct {v3, v0, v5, p1}, Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;-><init>(IILjava/lang/String;)V

    .line 1104
    .line 1105
    .line 1106
    invoke-virtual {p0, v2, v3}, Ll/enw;->o(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    .line 1107
    .line 1108
    .line 1109
    return-void

    .line 1110
    nop

    .line 1111
    :pswitch_data_0
    .packed-switch 0x106b
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 1112
    .line 1113
    .line 1114
    .line 1115
    .line 1116
    .line 1117
    .line 1118
    .line 1119
    .line 1120
    .line 1121
    :pswitch_data_1
    .packed-switch 0x13bb
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
