.class public Ll/sid0;
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

.method public static a(Ll/ljd0;Ll/ow40;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V
    .locals 4

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->R()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/x7e;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/x7e;-><init>(Ll/dum;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/no1;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 21
    .line 22
    invoke-direct {v0, p1, v1}, Ll/no1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/pig;

    .line 29
    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->F:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 31
    .line 32
    invoke-direct {v0, p1, v1}, Ll/pig;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/vwt;->b7()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    new-instance v0, Ll/wmy;

    .line 49
    .line 50
    invoke-direct {v0, p1}, Ll/wmy;-><init>(Ll/dum;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v0, Ll/vmy;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/vmy;-><init>(Ll/dum;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 63
    .line 64
    .line 65
    :goto_0
    new-instance v0, Ll/ffd0;

    .line 66
    .line 67
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 68
    .line 69
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->Q:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 70
    .line 71
    invoke-direct {v0, p1, v1, v2}, Ll/ffd0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/u3c;

    .line 78
    .line 79
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->K:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 80
    .line 81
    invoke-direct {v0, p1, v1}, Ll/u3c;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/gc3;

    .line 88
    .line 89
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->Q:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    .line 92
    .line 93
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 94
    .line 95
    invoke-direct {v0, p1, v1, v2}, Ll/gc3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 99
    .line 100
    .line 101
    new-instance v0, Ll/wak0;

    .line 102
    .line 103
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->n:Lv/VText;

    .line 104
    .line 105
    invoke-direct {v0, p1, v1}, Ll/wak0;-><init>(Ll/dum;Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/yuk;

    .line 112
    .line 113
    invoke-direct {v0, p1}, Ll/yuk;-><init>(Ll/dum;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/ezj;

    .line 120
    .line 121
    invoke-direct {v0, p1}, Ll/ezj;-><init>(Ll/dum;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 125
    .line 126
    .line 127
    new-instance v0, Ll/xij0;

    .line 128
    .line 129
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 130
    .line 131
    invoke-direct {v0, p1, v1}, Ll/xij0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 135
    .line 136
    .line 137
    new-instance v0, Ll/uel0;

    .line 138
    .line 139
    invoke-direct {v0, p1}, Ll/uel0;-><init>(Ll/dum;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 143
    .line 144
    .line 145
    new-instance v0, Ll/vuw;

    .line 146
    .line 147
    invoke-direct {v0, p1}, Ll/vuw;-><init>(Ll/dum;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 151
    .line 152
    .line 153
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_2

    .line 160
    .line 161
    new-instance v0, Ll/gfn;

    .line 162
    .line 163
    invoke-direct {v0, p1}, Ll/gfn;-><init>(Ll/dum;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_2
    new-instance v0, Ll/mvv;

    .line 168
    .line 169
    invoke-direct {v0, p1}, Ll/mvv;-><init>(Ll/dum;)V

    .line 170
    .line 171
    .line 172
    :goto_1
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 173
    .line 174
    .line 175
    new-instance v0, Ll/ced0;

    .line 176
    .line 177
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->S:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 178
    .line 179
    invoke-direct {v0, p1, v1}, Ll/ced0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 183
    .line 184
    .line 185
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/a;

    .line 186
    .line 187
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->i:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    .line 188
    .line 189
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/a;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 193
    .line 194
    .line 195
    new-instance v0, Ll/xid0;

    .line 196
    .line 197
    invoke-direct {v0, p1}, Ll/xid0;-><init>(Ll/dum;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 201
    .line 202
    .line 203
    new-instance v0, Ll/dxi;

    .line 204
    .line 205
    invoke-direct {v0, p1}, Ll/dxi;-><init>(Ll/dum;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 209
    .line 210
    .line 211
    new-instance v0, Ll/uxt;

    .line 212
    .line 213
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->D:Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 214
    .line 215
    invoke-direct {v0, p1, v1}, Ll/uxt;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 219
    .line 220
    .line 221
    new-instance v0, Ll/ki3;

    .line 222
    .line 223
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->C:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 224
    .line 225
    invoke-direct {v0, p1, v1}, Ll/ki3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 229
    .line 230
    .line 231
    new-instance v0, Ll/une0;

    .line 232
    .line 233
    invoke-direct {v0, p1}, Ll/une0;-><init>(Ll/dum;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 237
    .line 238
    .line 239
    new-instance v0, Ll/wid0;

    .line 240
    .line 241
    invoke-direct {v0, p1}, Ll/wid0;-><init>(Ll/dum;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 245
    .line 246
    .line 247
    new-instance v0, Ll/las;

    .line 248
    .line 249
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->W:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 250
    .line 251
    invoke-direct {v0, p1, v1}, Ll/las;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 255
    .line 256
    .line 257
    new-instance v0, Ll/aks;

    .line 258
    .line 259
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 260
    .line 261
    invoke-direct {v0, p1, v1}, Ll/aks;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 265
    .line 266
    .line 267
    new-instance v0, Ll/fgs;

    .line 268
    .line 269
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->H0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 270
    .line 271
    invoke-direct {v0, p1, v1}, Ll/fgs;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 275
    .line 276
    .line 277
    new-instance v0, Ll/q4j0;

    .line 278
    .line 279
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->O:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 280
    .line 281
    invoke-direct {v0, p1, v1}, Ll/q4j0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 285
    .line 286
    .line 287
    new-instance v0, Ll/c060;

    .line 288
    .line 289
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->B:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 290
    .line 291
    invoke-direct {v0, p1, v1}, Ll/c060;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 295
    .line 296
    .line 297
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {v0}, Ll/vwt;->P6()Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-eqz v0, :cond_3

    .line 306
    .line 307
    new-instance v0, Ll/d9g;

    .line 308
    .line 309
    invoke-direct {v0, p1}, Ll/d9g;-><init>(Ll/dum;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 313
    .line 314
    .line 315
    new-instance v0, Ll/pcg;

    .line 316
    .line 317
    invoke-direct {v0, p1}, Ll/pcg;-><init>(Ll/dum;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 321
    .line 322
    .line 323
    new-instance v0, Ll/l9g;

    .line 324
    .line 325
    invoke-direct {v0, p1}, Ll/l9g;-><init>(Ll/dum;)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 329
    .line 330
    .line 331
    new-instance v0, Ll/idg;

    .line 332
    .line 333
    invoke-direct {v0, p1}, Ll/idg;-><init>(Ll/dum;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 337
    .line 338
    .line 339
    new-instance v0, Ll/ycg;

    .line 340
    .line 341
    invoke-direct {v0, p1}, Ll/ycg;-><init>(Ll/dum;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 345
    .line 346
    .line 347
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    invoke-virtual {v0}, Ll/vwt;->H3()Z

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    if-nez v0, :cond_3

    .line 356
    .line 357
    new-instance v0, Ll/ocg;

    .line 358
    .line 359
    invoke-direct {v0, p1}, Ll/ocg;-><init>(Ll/dum;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 363
    .line 364
    .line 365
    :cond_3
    new-instance v0, Ll/vzi;

    .line 366
    .line 367
    invoke-direct {v0, p1}, Ll/vzi;-><init>(Ll/dum;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 371
    .line 372
    .line 373
    new-instance v0, Ll/zm80;

    .line 374
    .line 375
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->p0:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 376
    .line 377
    invoke-direct {v0, p1, v1}, Ll/zm80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 381
    .line 382
    .line 383
    new-instance v0, Ll/i40;

    .line 384
    .line 385
    invoke-direct {v0, p1}, Ll/i40;-><init>(Ll/dum;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 389
    .line 390
    .line 391
    new-instance v0, Ll/nce0;

    .line 392
    .line 393
    invoke-direct {v0, p1}, Ll/nce0;-><init>(Ll/dum;)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 397
    .line 398
    .line 399
    new-instance v0, Ll/gje;

    .line 400
    .line 401
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->I0:Lv/VFrame;

    .line 402
    .line 403
    invoke-direct {v0, p1, v1}, Ll/gje;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 407
    .line 408
    .line 409
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-virtual {v0}, Ll/vwt;->O6()Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-eqz v0, :cond_4

    .line 418
    .line 419
    new-instance v0, Ll/xre;

    .line 420
    .line 421
    invoke-direct {v0, p1}, Ll/xre;-><init>(Ll/dum;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 425
    .line 426
    .line 427
    :cond_4
    new-instance v0, Ll/qiv;

    .line 428
    .line 429
    invoke-direct {v0, p1}, Ll/qiv;-><init>(Ll/dum;)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 433
    .line 434
    .line 435
    new-instance v0, Ll/cfv;

    .line 436
    .line 437
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->k0:Landroid/view/View;

    .line 438
    .line 439
    invoke-direct {v0, p1, v1}, Ll/cfv;-><init>(Ll/dum;Landroid/view/View;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 443
    .line 444
    .line 445
    new-instance v0, Ll/yeu;

    .line 446
    .line 447
    invoke-direct {v0, p1}, Ll/yeu;-><init>(Ll/dum;)V

    .line 448
    .line 449
    .line 450
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 451
    .line 452
    .line 453
    new-instance v0, Ll/e910;

    .line 454
    .line 455
    invoke-direct {v0, p1}, Ll/e910;-><init>(Ll/dum;)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 459
    .line 460
    .line 461
    new-instance v0, Ll/op10;

    .line 462
    .line 463
    invoke-direct {v0, p1}, Ll/op10;-><init>(Ll/dum;)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 467
    .line 468
    .line 469
    new-instance v0, Ll/p7t;

    .line 470
    .line 471
    invoke-direct {v0, p1}, Ll/p7t;-><init>(Ll/dum;)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 475
    .line 476
    .line 477
    new-instance v0, Ll/rfg;

    .line 478
    .line 479
    invoke-direct {v0, p1}, Ll/rfg;-><init>(Ll/dum;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 483
    .line 484
    .line 485
    new-instance v0, Ll/cfg;

    .line 486
    .line 487
    invoke-direct {v0, p1}, Ll/cfg;-><init>(Ll/dum;)V

    .line 488
    .line 489
    .line 490
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 491
    .line 492
    .line 493
    new-instance v0, Ll/vit;

    .line 494
    .line 495
    invoke-direct {v0, p1}, Ll/vit;-><init>(Ll/dum;)V

    .line 496
    .line 497
    .line 498
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 499
    .line 500
    .line 501
    new-instance v0, Ll/g3j0;

    .line 502
    .line 503
    invoke-direct {v0, p1}, Ll/g3j0;-><init>(Ll/dum;)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 507
    .line 508
    .line 509
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    invoke-virtual {v0}, Ll/vwt;->g7()Z

    .line 514
    .line 515
    .line 516
    move-result v0

    .line 517
    if-eqz v0, :cond_5

    .line 518
    .line 519
    new-instance v0, Ll/hsx;

    .line 520
    .line 521
    invoke-direct {v0, p1}, Ll/hsx;-><init>(Ll/dum;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 525
    .line 526
    .line 527
    :cond_5
    new-instance v0, Ll/jfd0;

    .line 528
    .line 529
    invoke-direct {v0, p1, p0, p2}, Ll/jfd0;-><init>(Ll/dum;Ll/ljd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 533
    .line 534
    .line 535
    new-instance v0, Ll/ydd0;

    .line 536
    .line 537
    invoke-direct {v0, p1}, Ll/ydd0;-><init>(Ll/dum;)V

    .line 538
    .line 539
    .line 540
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 541
    .line 542
    .line 543
    new-instance v0, Ll/mvr;

    .line 544
    .line 545
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->s:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    .line 546
    .line 547
    invoke-direct {v0, p1, v1}, Ll/mvr;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;)V

    .line 548
    .line 549
    .line 550
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 551
    .line 552
    .line 553
    new-instance v0, Ll/qtj0;

    .line 554
    .line 555
    invoke-direct {v0, p1}, Ll/qtj0;-><init>(Ll/dum;)V

    .line 556
    .line 557
    .line 558
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 559
    .line 560
    .line 561
    new-instance v0, Ll/v06;

    .line 562
    .line 563
    invoke-direct {v0, p1}, Ll/v06;-><init>(Ll/dum;)V

    .line 564
    .line 565
    .line 566
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 567
    .line 568
    .line 569
    const/4 v0, 0x2

    .line 570
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    if-nez v0, :cond_9

    .line 575
    .line 576
    new-instance v0, Ll/y3s;

    .line 577
    .line 578
    new-instance v1, Ll/tf4;

    .line 579
    .line 580
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->I:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 581
    .line 582
    invoke-direct {v1, v2}, Ll/tf4;-><init>(Landroid/widget/FrameLayout;)V

    .line 583
    .line 584
    .line 585
    invoke-direct {v0, p1, v1}, Ll/y3s;-><init>(Ll/dum;Ll/tf4;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 589
    .line 590
    .line 591
    new-instance v0, Ll/f1t;

    .line 592
    .line 593
    invoke-direct {v0, p1}, Ll/f1t;-><init>(Ll/dum;)V

    .line 594
    .line 595
    .line 596
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 597
    .line 598
    .line 599
    new-instance v0, Ll/hod0;

    .line 600
    .line 601
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 602
    .line 603
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->f:Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;

    .line 604
    .line 605
    iget-object v3, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 606
    .line 607
    invoke-direct {v0, p1, v1, v2, v3}, Ll/hod0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 611
    .line 612
    .line 613
    new-instance v0, Ll/kdp;

    .line 614
    .line 615
    invoke-direct {v0, p1}, Ll/kdp;-><init>(Ll/dum;)V

    .line 616
    .line 617
    .line 618
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 619
    .line 620
    .line 621
    new-instance v0, Ll/xrs;

    .line 622
    .line 623
    invoke-direct {v0, p1}, Ll/xrs;-><init>(Ll/dum;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 627
    .line 628
    .line 629
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 630
    .line 631
    .line 632
    move-result-object v0

    .line 633
    invoke-virtual {v0}, Ll/vwt;->t7()Z

    .line 634
    .line 635
    .line 636
    move-result v0

    .line 637
    if-eqz v0, :cond_6

    .line 638
    .line 639
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 640
    .line 641
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;-><init>(Ll/dum;)V

    .line 642
    .line 643
    .line 644
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 645
    .line 646
    .line 647
    :cond_6
    new-instance v0, Ll/x0o;

    .line 648
    .line 649
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->E0:Landroid/widget/FrameLayout;

    .line 650
    .line 651
    invoke-direct {v0, p1, v1}, Ll/x0o;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 652
    .line 653
    .line 654
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 655
    .line 656
    .line 657
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    invoke-virtual {v0}, Ll/p6s;->F0()Z

    .line 662
    .line 663
    .line 664
    move-result v0

    .line 665
    if-eqz v0, :cond_7

    .line 666
    .line 667
    new-instance v0, Ll/hfd0;

    .line 668
    .line 669
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->g:Lv/VFrame;

    .line 670
    .line 671
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J0:Lv/VRelative;

    .line 672
    .line 673
    invoke-direct {v0, p1, v1, v2}, Ll/hfd0;-><init>(Ll/dum;Lv/VFrame;Lv/VRelative;)V

    .line 674
    .line 675
    .line 676
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 677
    .line 678
    .line 679
    :cond_7
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 680
    .line 681
    .line 682
    move-result-object v0

    .line 683
    invoke-virtual {v0}, Ll/p6s;->I0()Z

    .line 684
    .line 685
    .line 686
    move-result v0

    .line 687
    if-eqz v0, :cond_8

    .line 688
    .line 689
    const-string v0, "live"

    .line 690
    .line 691
    invoke-static {v0}, Ll/zrv;->n(Ljava/lang/String;)Z

    .line 692
    .line 693
    .line 694
    move-result v0

    .line 695
    if-eqz v0, :cond_8

    .line 696
    .line 697
    new-instance v0, Ll/nln;

    .line 698
    .line 699
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->L:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 700
    .line 701
    invoke-direct {v0, p1, v1}, Ll/nln;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 702
    .line 703
    .line 704
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 705
    .line 706
    .line 707
    :cond_8
    new-instance v0, Ll/tep;

    .line 708
    .line 709
    invoke-direct {v0, p1}, Ll/tep;-><init>(Ll/dum;)V

    .line 710
    .line 711
    .line 712
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 713
    .line 714
    .line 715
    goto :goto_2

    .line 716
    :cond_9
    new-instance v0, Ll/wzr;

    .line 717
    .line 718
    invoke-direct {v0, p1}, Ll/wzr;-><init>(Ll/dum;)V

    .line 719
    .line 720
    .line 721
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 722
    .line 723
    .line 724
    new-instance v0, Ll/st10;

    .line 725
    .line 726
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->m:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 727
    .line 728
    invoke-direct {v0, p1, v1}, Ll/st10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;)V

    .line 729
    .line 730
    .line 731
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 732
    .line 733
    .line 734
    new-instance v0, Ll/xrs;

    .line 735
    .line 736
    invoke-direct {v0, p1}, Ll/xrs;-><init>(Ll/dum;)V

    .line 737
    .line 738
    .line 739
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 740
    .line 741
    .line 742
    new-instance v0, Ll/tls;

    .line 743
    .line 744
    invoke-direct {v0, p1}, Ll/tls;-><init>(Ll/dum;)V

    .line 745
    .line 746
    .line 747
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 748
    .line 749
    .line 750
    new-instance v0, Ll/b6f0;

    .line 751
    .line 752
    invoke-direct {v0, p1}, Ll/b6f0;-><init>(Ll/dum;)V

    .line 753
    .line 754
    .line 755
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 756
    .line 757
    .line 758
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 759
    .line 760
    .line 761
    move-result-object v0

    .line 762
    invoke-virtual {v0}, Ll/vwt;->t7()Z

    .line 763
    .line 764
    .line 765
    move-result v0

    .line 766
    if-eqz v0, :cond_a

    .line 767
    .line 768
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 769
    .line 770
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;-><init>(Ll/dum;)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 774
    .line 775
    .line 776
    :cond_a
    new-instance v0, Ll/e11;

    .line 777
    .line 778
    invoke-direct {v0, p1}, Ll/e11;-><init>(Ll/dum;)V

    .line 779
    .line 780
    .line 781
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 782
    .line 783
    .line 784
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 785
    .line 786
    .line 787
    move-result-object v0

    .line 788
    invoke-virtual {v0}, Ll/vwt;->u3()Z

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    if-eqz v0, :cond_b

    .line 793
    .line 794
    new-instance v0, Ll/hfd0;

    .line 795
    .line 796
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->g:Lv/VFrame;

    .line 797
    .line 798
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->J0:Lv/VRelative;

    .line 799
    .line 800
    invoke-direct {v0, p1, v1, v2}, Ll/hfd0;-><init>(Ll/dum;Lv/VFrame;Lv/VRelative;)V

    .line 801
    .line 802
    .line 803
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 804
    .line 805
    .line 806
    :cond_b
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    invoke-virtual {v0}, Ll/p6s;->G1()Z

    .line 811
    .line 812
    .line 813
    move-result v0

    .line 814
    if-eqz v0, :cond_c

    .line 815
    .line 816
    new-instance v0, Ll/yat;

    .line 817
    .line 818
    invoke-direct {v0, p1}, Ll/yat;-><init>(Ll/dum;)V

    .line 819
    .line 820
    .line 821
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 822
    .line 823
    .line 824
    :cond_c
    :goto_2
    new-instance v0, Ll/z1t;

    .line 825
    .line 826
    invoke-direct {v0, p1}, Ll/z1t;-><init>(Ll/dum;)V

    .line 827
    .line 828
    .line 829
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 830
    .line 831
    .line 832
    new-instance v0, Ll/s9s;

    .line 833
    .line 834
    invoke-direct {v0, p1}, Ll/s9s;-><init>(Ll/dum;)V

    .line 835
    .line 836
    .line 837
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 838
    .line 839
    .line 840
    new-instance v0, Ll/s4t;

    .line 841
    .line 842
    invoke-direct {v0, p1}, Ll/s4t;-><init>(Ll/dum;)V

    .line 843
    .line 844
    .line 845
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 846
    .line 847
    .line 848
    new-instance v0, Ll/yyr;

    .line 849
    .line 850
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 851
    .line 852
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->e:Landroid/view/View;

    .line 853
    .line 854
    invoke-direct {v0, p1, v1, p2}, Ll/yyr;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;Landroid/view/View;)V

    .line 855
    .line 856
    .line 857
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 858
    .line 859
    .line 860
    new-instance p2, Ll/a4h0;

    .line 861
    .line 862
    invoke-direct {p2, p1}, Ll/a4h0;-><init>(Ll/dum;)V

    .line 863
    .line 864
    .line 865
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 866
    .line 867
    .line 868
    return-void
.end method

.method public static b(Ll/ljd0;Ll/ow40;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/dum;->j:Ll/x6t;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/sm80;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/sm80;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/ig80;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1}, Ll/ig80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/uhd0;

    .line 25
    .line 26
    const-string v1, "live"

    .line 27
    .line 28
    invoke-direct {v0, p1, v1}, Ll/uhd0;-><init>(Ll/dum;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/wrv;->R()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    new-instance v0, Ll/zld0;

    .line 44
    .line 45
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->z:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    .line 46
    .line 47
    invoke-direct {v0, p1, v1}, Ll/zld0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/wu40;

    .line 54
    .line 55
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->H:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 56
    .line 57
    invoke-direct {v0, p1, v1}, Ll/wu40;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    new-instance v0, Ll/p260;

    .line 64
    .line 65
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->B:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationEntryBindings;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 68
    .line 69
    invoke-direct {v0, p1, v1}, Ll/p260;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 73
    .line 74
    .line 75
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/wrv;->H()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    new-instance v0, Ll/whj;

    .line 84
    .line 85
    invoke-direct {v0, p1}, Ll/whj;-><init>(Ll/dum;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 89
    .line 90
    .line 91
    :cond_1
    new-instance v0, Ll/r14;

    .line 92
    .line 93
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->G:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 94
    .line 95
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->o:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 96
    .line 97
    iget-object v3, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 98
    .line 99
    invoke-direct {v0, p1, v1, v2, v3}, Ll/r14;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/rs70;

    .line 106
    .line 107
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 108
    .line 109
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 110
    .line 111
    invoke-direct {v0, p1, v1, v2}, Ll/rs70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 115
    .line 116
    .line 117
    new-instance v0, Ll/sn10;

    .line 118
    .line 119
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->l:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 120
    .line 121
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 122
    .line 123
    invoke-direct {v0, p1, v1, p2}, Ll/sn10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 127
    .line 128
    .line 129
    new-instance p2, Ll/j0c;

    .line 130
    .line 131
    invoke-direct {p2, p1}, Ll/j0c;-><init>(Ll/dum;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 135
    .line 136
    .line 137
    new-instance p2, Ll/b2s;

    .line 138
    .line 139
    invoke-direct {p2, p1}, Ll/b2s;-><init>(Ll/dum;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 143
    .line 144
    .line 145
    return-void
.end method
