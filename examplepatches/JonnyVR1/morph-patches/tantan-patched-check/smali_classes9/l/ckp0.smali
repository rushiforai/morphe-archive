.class public Ll/ckp0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->e:Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/close/VirtualVoiceCloseView;

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 41
    .line 42
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->h:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 43
    .line 44
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/widget/FrameLayout;

    .line 55
    .line 56
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->i:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    const/4 v3, 0x4

    .line 59
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 64
    .line 65
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 66
    .line 67
    const/4 v3, 0x5

    .line 68
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/board/VirtualLeadBoardEntranceView;

    .line 75
    .line 76
    const/4 v3, 0x6

    .line 77
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 82
    .line 83
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 84
    .line 85
    const/4 v3, 0x7

    .line 86
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Landroid/widget/FrameLayout;

    .line 91
    .line 92
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->m:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    const/16 v3, 0x8

    .line 95
    .line 96
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 101
    .line 102
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->n:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 109
    .line 110
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->o:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Landroid/view/ViewGroup;

    .line 117
    .line 118
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    check-cast v4, Lv/VFrame;

    .line 123
    .line 124
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->p:Lv/VFrame;

    .line 125
    .line 126
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Landroid/view/ViewGroup;

    .line 131
    .line 132
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    check-cast v4, Landroid/view/ViewGroup;

    .line 137
    .line 138
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    check-cast v4, Lv/VImage;

    .line 143
    .line 144
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->q:Lv/VImage;

    .line 145
    .line 146
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Landroid/view/ViewGroup;

    .line 151
    .line 152
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    check-cast v4, Landroid/view/ViewGroup;

    .line 157
    .line 158
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Lv/VText;

    .line 163
    .line 164
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->r:Lv/VText;

    .line 165
    .line 166
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    check-cast v4, Landroid/view/ViewGroup;

    .line 171
    .line 172
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Landroid/view/ViewGroup;

    .line 177
    .line 178
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    check-cast v4, Lv/VText;

    .line 183
    .line 184
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->s:Lv/VText;

    .line 185
    .line 186
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    check-cast v4, Lv/VLinear;

    .line 197
    .line 198
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->t:Lv/VLinear;

    .line 199
    .line 200
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    check-cast v4, Landroid/view/ViewGroup;

    .line 205
    .line 206
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    check-cast v4, Landroid/view/ViewGroup;

    .line 211
    .line 212
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    check-cast v4, Lv/VDraweeView;

    .line 217
    .line 218
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->u:Lv/VDraweeView;

    .line 219
    .line 220
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    check-cast v4, Landroid/view/ViewGroup;

    .line 225
    .line 226
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    check-cast v4, Landroid/view/ViewGroup;

    .line 231
    .line 232
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    check-cast v4, Lv/VText;

    .line 237
    .line 238
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->v:Lv/VText;

    .line 239
    .line 240
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    check-cast v3, Landroid/view/ViewGroup;

    .line 245
    .line 246
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    check-cast v3, Landroid/view/ViewGroup;

    .line 251
    .line 252
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    check-cast v2, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    check-cast v2, Lv/VText;

    .line 263
    .line 264
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->w:Lv/VText;

    .line 265
    .line 266
    const/16 v2, 0x9

    .line 267
    .line 268
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 273
    .line 274
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->x:Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 275
    .line 276
    const/16 v2, 0xa

    .line 277
    .line 278
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 283
    .line 284
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->y:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 285
    .line 286
    const/16 v2, 0xb

    .line 287
    .line 288
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/LiveVirtualCallListBottomView;

    .line 293
    .line 294
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->z:Lcom/p1/mobile/putong/live/livingroom/virtual/room/LiveVirtualCallListBottomView;

    .line 295
    .line 296
    const/16 v2, 0xc

    .line 297
    .line 298
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->A:Landroid/view/View;

    .line 303
    .line 304
    const/16 v2, 0xd

    .line 305
    .line 306
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 311
    .line 312
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->B:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 313
    .line 314
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    check-cast v2, Landroid/view/ViewGroup;

    .line 319
    .line 320
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 325
    .line 326
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->C:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 327
    .line 328
    const/16 v2, 0xe

    .line 329
    .line 330
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;

    .line 335
    .line 336
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->D:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationView;

    .line 337
    .line 338
    const/16 v2, 0xf

    .line 339
    .line 340
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->E:Landroid/view/View;

    .line 345
    .line 346
    const/16 v2, 0x10

    .line 347
    .line 348
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 353
    .line 354
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->F:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 355
    .line 356
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    check-cast v2, Landroid/view/ViewGroup;

    .line 361
    .line 362
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 367
    .line 368
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->G:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 369
    .line 370
    const/16 v2, 0x11

    .line 371
    .line 372
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 377
    .line 378
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->H:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 379
    .line 380
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    check-cast v2, Landroid/view/ViewGroup;

    .line 385
    .line 386
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 391
    .line 392
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->I:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 393
    .line 394
    const/16 v2, 0x12

    .line 395
    .line 396
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    check-cast v2, Landroid/view/ViewStub;

    .line 401
    .line 402
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->J:Landroid/view/ViewStub;

    .line 403
    .line 404
    const/16 v2, 0x13

    .line 405
    .line 406
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object v3

    .line 410
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 411
    .line 412
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->K:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 413
    .line 414
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 415
    .line 416
    .line 417
    move-result-object v3

    .line 418
    check-cast v3, Landroid/view/ViewGroup;

    .line 419
    .line 420
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 425
    .line 426
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->L:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 427
    .line 428
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    check-cast v3, Landroid/view/ViewGroup;

    .line 433
    .line 434
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v3

    .line 438
    check-cast v3, Landroid/view/ViewGroup;

    .line 439
    .line 440
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 445
    .line 446
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->M:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 447
    .line 448
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    check-cast v2, Landroid/view/ViewGroup;

    .line 453
    .line 454
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    check-cast v0, Landroid/view/ViewGroup;

    .line 459
    .line 460
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 465
    .line 466
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->N:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 467
    .line 468
    const/16 v0, 0x14

    .line 469
    .line 470
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    check-cast v0, Landroid/view/ViewStub;

    .line 475
    .line 476
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->O:Landroid/view/ViewStub;

    .line 477
    .line 478
    const/16 v0, 0x15

    .line 479
    .line 480
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 481
    .line 482
    .line 483
    move-result-object v1

    .line 484
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 485
    .line 486
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->P:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 487
    .line 488
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 493
    .line 494
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->Q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 495
    .line 496
    const/16 v0, 0x16

    .line 497
    .line 498
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;

    .line 503
    .line 504
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->R:Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;

    .line 505
    .line 506
    const/16 v0, 0x17

    .line 507
    .line 508
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 509
    .line 510
    .line 511
    move-result-object p1

    .line 512
    check-cast p1, Landroid/widget/FrameLayout;

    .line 513
    .line 514
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->S:Landroid/widget/FrameLayout;

    .line 515
    .line 516
    return-void
.end method
