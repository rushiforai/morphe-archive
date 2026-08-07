.class public Ll/de50;
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

.method public static a(Ll/ef50;Ll/ad50;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V
    .locals 3

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
    iget-object v0, p1, Ll/dum;->h:Ll/oo2;

    .line 11
    .line 12
    invoke-static {v0}, Ll/u9t;->c(Ll/oo2;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ll/qf50;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->d:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 21
    .line 22
    invoke-direct {v0, p1, v1}, Ll/qf50;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/ae50;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Ll/ae50;-><init>(Ll/dum;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/zdu;

    .line 37
    .line 38
    invoke-direct {v0, p1}, Ll/zdu;-><init>(Ll/dum;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/act;

    .line 45
    .line 46
    invoke-direct {v0, p1}, Ll/act;-><init>(Ll/dum;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/hcs;

    .line 53
    .line 54
    invoke-direct {v0, p1}, Ll/hcs;-><init>(Ll/dum;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/vwt;->u3()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    new-instance v0, Ll/hfd0;

    .line 72
    .line 73
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->h:Lv/VFrame;

    .line 74
    .line 75
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->P:Lv/VRelative;

    .line 76
    .line 77
    invoke-direct {v0, p1, v1, v2}, Ll/hfd0;-><init>(Ll/dum;Lv/VFrame;Lv/VRelative;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    new-instance v0, Ll/eat;

    .line 84
    .line 85
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->g:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

    .line 86
    .line 87
    invoke-direct {v0, p1, v1}, Ll/eat;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/pe50;

    .line 94
    .line 95
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->w:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    .line 96
    .line 97
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->f:Landroid/view/View;

    .line 98
    .line 99
    invoke-direct {v0, p1, v1, v2}, Ll/pe50;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/yb50;

    .line 106
    .line 107
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->m:Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 108
    .line 109
    invoke-direct {v0, p1, v1}, Ll/yb50;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 113
    .line 114
    .line 115
    new-instance v0, Ll/pig;

    .line 116
    .line 117
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->r:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 118
    .line 119
    invoke-direct {v0, p1, v1}, Ll/pig;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 123
    .line 124
    .line 125
    new-instance v0, Ll/ffd0;

    .line 126
    .line 127
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->u:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 128
    .line 129
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->C:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 130
    .line 131
    invoke-direct {v0, p1, v1, v2}, Ll/ffd0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 135
    .line 136
    .line 137
    new-instance v0, Ll/u3c;

    .line 138
    .line 139
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->y:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 140
    .line 141
    invoke-direct {v0, p1, v1}, Ll/u3c;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 145
    .line 146
    .line 147
    new-instance v0, Ll/gc3;

    .line 148
    .line 149
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->C:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 150
    .line 151
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    .line 152
    .line 153
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->D:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 154
    .line 155
    invoke-direct {v0, p1, v1, v2}, Ll/gc3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 159
    .line 160
    .line 161
    new-instance v0, Ll/wak0;

    .line 162
    .line 163
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->k:Lv/VText;

    .line 164
    .line 165
    invoke-direct {v0, p1, v1}, Ll/wak0;-><init>(Ll/dum;Landroid/view/View;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 169
    .line 170
    .line 171
    new-instance v0, Ll/xij0;

    .line 172
    .line 173
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 174
    .line 175
    invoke-direct {v0, p1, v1}, Ll/xij0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 179
    .line 180
    .line 181
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/a;

    .line 182
    .line 183
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->j:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    .line 184
    .line 185
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/a;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 189
    .line 190
    .line 191
    new-instance v0, Ll/las;

    .line 192
    .line 193
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->I:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 194
    .line 195
    invoke-direct {v0, p1, v1}, Ll/las;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 199
    .line 200
    .line 201
    new-instance v0, Ll/aks;

    .line 202
    .line 203
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 204
    .line 205
    invoke-direct {v0, p1, v1}, Ll/aks;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 209
    .line 210
    .line 211
    new-instance v0, Ll/fgs;

    .line 212
    .line 213
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 214
    .line 215
    invoke-direct {v0, p1, v1}, Ll/fgs;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 219
    .line 220
    .line 221
    new-instance v0, Ll/q4j0;

    .line 222
    .line 223
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->A:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 224
    .line 225
    invoke-direct {v0, p1, v1}, Ll/q4j0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 229
    .line 230
    .line 231
    new-instance v0, Ll/c060;

    .line 232
    .line 233
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 234
    .line 235
    invoke-direct {v0, p1, v1}, Ll/c060;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 239
    .line 240
    .line 241
    new-instance v0, Ll/ki3;

    .line 242
    .line 243
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->p:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 244
    .line 245
    invoke-direct {v0, p1, v1}, Ll/ki3;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 249
    .line 250
    .line 251
    new-instance v0, Ll/zm80;

    .line 252
    .line 253
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->K:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 254
    .line 255
    invoke-direct {v0, p1, v1}, Ll/zm80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 259
    .line 260
    .line 261
    new-instance v0, Ll/cfv;

    .line 262
    .line 263
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->J:Landroid/view/View;

    .line 264
    .line 265
    invoke-direct {v0, p1, v1}, Ll/cfv;-><init>(Ll/dum;Landroid/view/View;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 269
    .line 270
    .line 271
    new-instance v0, Ll/egt;

    .line 272
    .line 273
    invoke-direct {v0, p1}, Ll/egt;-><init>(Ll/dum;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 277
    .line 278
    .line 279
    new-instance v0, Ll/gae0;

    .line 280
    .line 281
    invoke-direct {v0, p1}, Ll/gae0;-><init>(Ll/dum;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 285
    .line 286
    .line 287
    new-instance v0, Ll/s36;

    .line 288
    .line 289
    invoke-direct {v0, p1}, Ll/s36;-><init>(Ll/dum;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 293
    .line 294
    .line 295
    new-instance v0, Ll/ssq;

    .line 296
    .line 297
    invoke-direct {v0, p1}, Ll/ssq;-><init>(Ll/dum;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 301
    .line 302
    .line 303
    new-instance v0, Ll/zqq;

    .line 304
    .line 305
    invoke-direct {v0, p1}, Ll/zqq;-><init>(Ll/dum;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 309
    .line 310
    .line 311
    new-instance v0, Ll/p2k0;

    .line 312
    .line 313
    invoke-direct {v0, p1}, Ll/p2k0;-><init>(Ll/dum;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 317
    .line 318
    .line 319
    new-instance v0, Ll/v8t;

    .line 320
    .line 321
    invoke-direct {v0, p1}, Ll/v8t;-><init>(Ll/dum;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 325
    .line 326
    .line 327
    new-instance v0, Ll/roe0;

    .line 328
    .line 329
    invoke-direct {v0, p1}, Ll/roe0;-><init>(Ll/dum;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 333
    .line 334
    .line 335
    new-instance v0, Ll/uqj;

    .line 336
    .line 337
    invoke-direct {v0, p1}, Ll/uqj;-><init>(Ll/dum;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 341
    .line 342
    .line 343
    new-instance v0, Ll/e510;

    .line 344
    .line 345
    invoke-direct {v0, p1}, Ll/e510;-><init>(Ll/dum;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 349
    .line 350
    .line 351
    new-instance v0, Ll/wid0;

    .line 352
    .line 353
    invoke-direct {v0, p1}, Ll/wid0;-><init>(Ll/dum;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 357
    .line 358
    .line 359
    new-instance v0, Ll/i40;

    .line 360
    .line 361
    invoke-direct {v0, p1}, Ll/i40;-><init>(Ll/dum;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 365
    .line 366
    .line 367
    new-instance v0, Ll/qiv;

    .line 368
    .line 369
    invoke-direct {v0, p1}, Ll/qiv;-><init>(Ll/dum;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 373
    .line 374
    .line 375
    new-instance v0, Ll/yeu;

    .line 376
    .line 377
    invoke-direct {v0, p1}, Ll/yeu;-><init>(Ll/dum;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 381
    .line 382
    .line 383
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-virtual {v0}, Ll/vwt;->g7()Z

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    if-eqz v0, :cond_3

    .line 392
    .line 393
    new-instance v0, Ll/hsx;

    .line 394
    .line 395
    invoke-direct {v0, p1}, Ll/hsx;-><init>(Ll/dum;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 399
    .line 400
    .line 401
    :cond_3
    new-instance v0, Ll/yuk;

    .line 402
    .line 403
    invoke-direct {v0, p1}, Ll/yuk;-><init>(Ll/dum;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 407
    .line 408
    .line 409
    new-instance v0, Ll/ezj;

    .line 410
    .line 411
    invoke-direct {v0, p1}, Ll/ezj;-><init>(Ll/dum;)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 415
    .line 416
    .line 417
    new-instance v0, Ll/yc50;

    .line 418
    .line 419
    invoke-direct {v0, p1}, Ll/yc50;-><init>(Ll/dum;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 423
    .line 424
    .line 425
    new-instance v0, Ll/mvv;

    .line 426
    .line 427
    invoke-direct {v0, p1}, Ll/mvv;-><init>(Ll/dum;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 431
    .line 432
    .line 433
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Ll/vwt;->P6()Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-eqz v0, :cond_4

    .line 442
    .line 443
    new-instance v0, Ll/d9g;

    .line 444
    .line 445
    invoke-direct {v0, p1}, Ll/d9g;-><init>(Ll/dum;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 449
    .line 450
    .line 451
    new-instance v0, Ll/pcg;

    .line 452
    .line 453
    invoke-direct {v0, p1}, Ll/pcg;-><init>(Ll/dum;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 457
    .line 458
    .line 459
    new-instance v0, Ll/l9g;

    .line 460
    .line 461
    invoke-direct {v0, p1}, Ll/l9g;-><init>(Ll/dum;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 465
    .line 466
    .line 467
    new-instance v0, Ll/ycg;

    .line 468
    .line 469
    invoke-direct {v0, p1}, Ll/ycg;-><init>(Ll/dum;)V

    .line 470
    .line 471
    .line 472
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 473
    .line 474
    .line 475
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    invoke-virtual {v0}, Ll/vwt;->H3()Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-nez v0, :cond_4

    .line 484
    .line 485
    new-instance v0, Ll/ocg;

    .line 486
    .line 487
    invoke-direct {v0, p1}, Ll/ocg;-><init>(Ll/dum;)V

    .line 488
    .line 489
    .line 490
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 491
    .line 492
    .line 493
    :cond_4
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
    new-instance v0, Ll/v06;

    .line 510
    .line 511
    invoke-direct {v0, p1}, Ll/v06;-><init>(Ll/dum;)V

    .line 512
    .line 513
    .line 514
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 515
    .line 516
    .line 517
    new-instance v0, Ll/xrs;

    .line 518
    .line 519
    invoke-direct {v0, p1}, Ll/xrs;-><init>(Ll/dum;)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 523
    .line 524
    .line 525
    new-instance v0, Ll/tls;

    .line 526
    .line 527
    invoke-direct {v0, p1}, Ll/tls;-><init>(Ll/dum;)V

    .line 528
    .line 529
    .line 530
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 531
    .line 532
    .line 533
    new-instance v0, Ll/wzr;

    .line 534
    .line 535
    invoke-direct {v0, p1}, Ll/wzr;-><init>(Ll/dum;)V

    .line 536
    .line 537
    .line 538
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 539
    .line 540
    .line 541
    new-instance v0, Ll/wmy;

    .line 542
    .line 543
    invoke-direct {v0, p1}, Ll/wmy;-><init>(Ll/dum;)V

    .line 544
    .line 545
    .line 546
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 547
    .line 548
    .line 549
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    invoke-virtual {v0}, Ll/vwt;->O6()Z

    .line 554
    .line 555
    .line 556
    move-result v0

    .line 557
    if-eqz v0, :cond_5

    .line 558
    .line 559
    new-instance v0, Ll/xre;

    .line 560
    .line 561
    invoke-direct {v0, p1}, Ll/xre;-><init>(Ll/dum;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 565
    .line 566
    .line 567
    :cond_5
    new-instance v0, Ll/lc50;

    .line 568
    .line 569
    invoke-direct {v0, p1}, Ll/lc50;-><init>(Ll/dum;)V

    .line 570
    .line 571
    .line 572
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 573
    .line 574
    .line 575
    new-instance v0, Ll/uc50;

    .line 576
    .line 577
    invoke-direct {v0, p1}, Ll/uc50;-><init>(Ll/dum;)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 581
    .line 582
    .line 583
    new-instance v0, Ll/vuw;

    .line 584
    .line 585
    invoke-direct {v0, p1}, Ll/vuw;-><init>(Ll/dum;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 589
    .line 590
    .line 591
    new-instance v0, Ll/yyr;

    .line 592
    .line 593
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 594
    .line 595
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->e:Landroid/view/View;

    .line 596
    .line 597
    invoke-direct {v0, p1, v1, p2}, Ll/yyr;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;Landroid/view/View;)V

    .line 598
    .line 599
    .line 600
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 601
    .line 602
    .line 603
    return-void
.end method

.method public static b(Ll/ef50;Ll/ad50;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/dum;->h:Ll/oo2;

    .line 2
    .line 3
    invoke-static {v0}, Ll/u9t;->c(Ll/oo2;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/sm80;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/sm80;-><init>(Ll/dum;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/ig80;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 20
    .line 21
    invoke-direct {v0, p1, v1}, Ll/ig80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    :cond_0
    new-instance v0, Ll/wu40;

    .line 28
    .line 29
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 30
    .line 31
    invoke-direct {v0, p1, v1}, Ll/wu40;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/uhd0;

    .line 38
    .line 39
    const-string v1, "officialShow"

    .line 40
    .line 41
    invoke-direct {v0, p1, v1}, Ll/uhd0;-><init>(Ll/dum;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/p260;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationEntryBindings;->i:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 52
    .line 53
    invoke-direct {v0, p1, p2}, Ll/p260;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 57
    .line 58
    .line 59
    new-instance p2, Ll/j0c;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Ll/j0c;-><init>(Ll/dum;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 65
    .line 66
    .line 67
    return-void
.end method
