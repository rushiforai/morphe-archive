.class public Ll/rz0;
.super Ll/cm2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cm2<",
        "Ll/sz0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/oo2;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/cm2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/sz0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/sz0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b4(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c4(Ll/rz0;Ll/h1e;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz0;->k4(Ll/h1e;)V

    return-void
.end method

.method public static synthetic d4(Ll/rz0;Ll/nmj;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz0;->j4(Ll/nmj;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(Ll/rz0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rz0;->l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic f4(Ll/h1e;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/h1e;->b:I

    .line 2
    .line 3
    const/16 v0, 0x50

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "complete_first_recharge_stimulus"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic h4(Ll/rz0;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    return-void
.end method

.method private synthetic l4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rz0;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, -0x1

    .line 16
    sparse-switch v1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :sswitch_0
    const-string v1, "multiCallButton"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_0
    const/16 v3, 0xd

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :sswitch_1
    const-string v1, "diamond"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :cond_1
    const/16 v3, 0xc

    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :sswitch_2
    const-string v1, "intlGamePanel"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :cond_2
    const/16 v3, 0xb

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :sswitch_3
    const-string v1, "callButton"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    goto/16 :goto_0

    .line 72
    .line 73
    :cond_3
    const/16 v3, 0xa

    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :sswitch_4
    const-string v1, "firstRechargeButton"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :cond_4
    const/16 v3, 0x9

    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :sswitch_5
    const-string v1, "pkButton"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    goto/16 :goto_0

    .line 100
    .line 101
    :cond_5
    const/16 v3, 0x8

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :sswitch_6
    const-string v1, "unknown_"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_6

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    const/4 v3, 0x7

    .line 115
    goto :goto_0

    .line 116
    :sswitch_7
    const-string v1, "giftButton"

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_7

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_7
    const/4 v3, 0x6

    .line 126
    goto :goto_0

    .line 127
    :sswitch_8
    const-string v1, "newUserTreasureBoxButton"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_8
    const/4 v3, 0x5

    .line 137
    goto :goto_0

    .line 138
    :sswitch_9
    const-string v1, "firstRechargeStimulus"

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_9

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_9
    const/4 v3, 0x4

    .line 148
    goto :goto_0

    .line 149
    :sswitch_a
    const-string v1, "fastGiftButton"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_a

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_a
    const/4 v3, 0x3

    .line 159
    goto :goto_0

    .line 160
    :sswitch_b
    const-string v1, "multiCallPkButton"

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_b

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_b
    const/4 v3, 0x2

    .line 170
    goto :goto_0

    .line 171
    :sswitch_c
    const-string v1, "settingButton"

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_c

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_c
    const/4 v3, 0x1

    .line 181
    goto :goto_0

    .line 182
    :sswitch_d
    const-string v1, "lotteryGiftRedpacket"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_d

    .line 189
    .line 190
    goto :goto_0

    .line 191
    :cond_d
    move v3, v2

    .line 192
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :pswitch_0
    new-instance v0, Ll/ic10;

    .line 197
    .line 198
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 199
    .line 200
    invoke-direct {v0, v1, p1}, Ll/ic10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :pswitch_1
    new-instance v0, Ll/eq1;

    .line 208
    .line 209
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 210
    .line 211
    invoke-direct {v0, v1, p1}, Ll/eq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :pswitch_2
    new-instance v0, Ll/wwn;

    .line 219
    .line 220
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 221
    .line 222
    invoke-direct {v0, v1, v2, p1}, Ll/wwn;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :pswitch_3
    new-instance v0, Ll/jq1;

    .line 230
    .line 231
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 232
    .line 233
    invoke-direct {v0, v1, p1}, Ll/jq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :pswitch_4
    new-instance v0, Ll/tq1;

    .line 241
    .line 242
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 243
    .line 244
    invoke-direct {v0, v1, p1}, Ll/tq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :pswitch_5
    new-instance v0, Ll/gb2;

    .line 252
    .line 253
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 254
    .line 255
    invoke-direct {v0, v1, p1}, Ll/gb2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_6
    new-instance v0, Ll/ac2;

    .line 263
    .line 264
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 265
    .line 266
    invoke-direct {v0, v1, p1}, Ll/ac2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :pswitch_7
    new-instance v0, Ll/vq1;

    .line 274
    .line 275
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 276
    .line 277
    invoke-direct {v0, v1, p1}, Ll/vq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :pswitch_8
    new-instance v0, Ll/db2;

    .line 285
    .line 286
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 287
    .line 288
    invoke-direct {v0, v1, p1}, Ll/db2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :pswitch_9
    new-instance v0, Ll/sq1;

    .line 296
    .line 297
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 298
    .line 299
    invoke-direct {v0, v1, p1}, Ll/sq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 303
    .line 304
    .line 305
    return-void

    .line 306
    :pswitch_a
    new-instance v0, Ll/rq1;

    .line 307
    .line 308
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 309
    .line 310
    invoke-direct {v0, v1, p1}, Ll/rq1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :pswitch_b
    new-instance v0, Ll/cb2;

    .line 318
    .line 319
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 320
    .line 321
    invoke-direct {v0, v1, p1}, Ll/cb2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :pswitch_c
    new-instance v0, Ll/nb2;

    .line 329
    .line 330
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 331
    .line 332
    invoke-direct {v0, v1, p1}, Ll/nb2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :pswitch_d
    new-instance v0, Ll/za2;

    .line 340
    .line 341
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 342
    .line 343
    invoke-direct {v0, v1, p1}, Ll/za2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    nop

    .line 351
    :sswitch_data_0
    .sparse-switch
        -0x7cc027c0 -> :sswitch_d
        -0x7669da5e -> :sswitch_c
        -0x6753ca9c -> :sswitch_b
        -0x51cc3602 -> :sswitch_a
        -0x36974d2f -> :sswitch_9
        -0x2d49b35d -> :sswitch_8
        -0x1310277e -> :sswitch_7
        -0xe5022ab -> :sswitch_6
        0x605790d -> :sswitch_5
        0x2aaae389 -> :sswitch_4
        0x41bbcf30 -> :sswitch_3
        0x5af20755 -> :sswitch_2
        0x62a62154 -> :sswitch_1
        0x62ea0d49 -> :sswitch_0
    .end sparse-switch

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
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public T3()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sz0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/rz0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Ll/sz0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 10
    .line 11
    check-cast v0, Ll/sz0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/sz0;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1}, Ll/sz0;->a(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic j4(Ll/nmj;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/nmj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cm2;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic k4(Ll/h1e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sz0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 6
    .line 7
    iget-boolean p1, p1, Ll/h1e;->c:Z

    .line 8
    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n4()V
    .locals 1

    .line 1
    const-string v0, "firstRechargeStimulus"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cm2;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ll/kf2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/l6t;->C2(Ll/l6t;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public o4(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sz0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/sz0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/rz0;->p4(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    sget-wide v2, Ll/uhd0;->l:J

    .line 28
    .line 29
    sub-long/2addr v0, v2

    .line 30
    new-instance p1, Ll/pz0;

    .line 31
    .line 32
    invoke-direct {p1, v0, v1}, Ll/pz0;-><init>(J)V

    .line 33
    .line 34
    .line 35
    const-string v0, "audience_bottom_menu_loaded"

    .line 36
    .line 37
    invoke-static {p0, v0, p1}, Ll/fgt;->c(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final p4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qz0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qz0;-><init>(Ll/rz0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kz0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/kz0;-><init>(Ll/rz0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/nmj;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;->changeVisibility()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/lz0;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/lz0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/mz0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/mz0;-><init>(Ll/rz0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/nz0;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/nz0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/oz0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/oz0;-><init>(Ll/rz0;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method
