.class public Ll/kyu;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;Landroid/view/View;)V
    .locals 13

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->a:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->b:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 33
    .line 34
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->c:Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 47
    .line 48
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 61
    .line 62
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->e:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Landroid/view/ViewGroup;

    .line 69
    .line 70
    const/4 v4, 0x3

    .line 71
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 76
    .line 77
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 78
    .line 79
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Landroid/view/ViewGroup;

    .line 84
    .line 85
    const/4 v5, 0x4

    .line 86
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 91
    .line 92
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Landroid/view/ViewGroup;

    .line 99
    .line 100
    const/4 v6, 0x5

    .line 101
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 106
    .line 107
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->h:Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Landroid/view/ViewGroup;

    .line 114
    .line 115
    const/4 v7, 0x6

    .line 116
    invoke-virtual {v3, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 121
    .line 122
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 123
    .line 124
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Landroid/view/ViewGroup;

    .line 129
    .line 130
    const/4 v8, 0x7

    .line 131
    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    check-cast v3, Lv/VFrame;

    .line 136
    .line 137
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->j:Lv/VFrame;

    .line 138
    .line 139
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->k:Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 158
    .line 159
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Landroid/view/ViewGroup;

    .line 164
    .line 165
    const/16 v9, 0x8

    .line 166
    .line 167
    invoke-virtual {v3, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->l:Landroid/view/View;

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Landroid/view/ViewGroup;

    .line 178
    .line 179
    const/16 v10, 0x9

    .line 180
    .line 181
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    check-cast v3, Lv/VRelative;

    .line 186
    .line 187
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->m:Lv/VRelative;

    .line 188
    .line 189
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Landroid/view/ViewGroup;

    .line 194
    .line 195
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    check-cast v3, Landroid/view/ViewGroup;

    .line 200
    .line 201
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    .line 206
    .line 207
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->n:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/annoncements/view/LiveAnnouncementEntryView;

    .line 208
    .line 209
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    check-cast v3, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    check-cast v3, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Lv/VFrame;

    .line 226
    .line 227
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->o:Lv/VFrame;

    .line 228
    .line 229
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    check-cast v3, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    check-cast v3, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    check-cast v3, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    .line 252
    .line 253
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->p:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    .line 254
    .line 255
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    check-cast v3, Landroid/view/ViewGroup;

    .line 266
    .line 267
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    check-cast v3, Landroid/view/ViewGroup;

    .line 272
    .line 273
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 278
    .line 279
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 280
    .line 281
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    check-cast v3, Landroid/view/ViewGroup;

    .line 286
    .line 287
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    check-cast v3, Landroid/view/ViewGroup;

    .line 292
    .line 293
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    check-cast v3, Landroid/widget/FrameLayout;

    .line 298
    .line 299
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->r:Landroid/widget/FrameLayout;

    .line 300
    .line 301
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    check-cast v3, Landroid/view/ViewGroup;

    .line 306
    .line 307
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    check-cast v3, Landroid/view/ViewGroup;

    .line 312
    .line 313
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    check-cast v3, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 324
    .line 325
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 326
    .line 327
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    check-cast v3, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v3, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    check-cast v3, Landroid/view/ViewGroup;

    .line 338
    .line 339
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    check-cast v3, Landroid/view/ViewGroup;

    .line 344
    .line 345
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 350
    .line 351
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->t:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 352
    .line 353
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object v3

    .line 357
    check-cast v3, Landroid/view/ViewGroup;

    .line 358
    .line 359
    const/16 v11, 0xa

    .line 360
    .line 361
    invoke-virtual {v3, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 366
    .line 367
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->u:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 368
    .line 369
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    check-cast v3, Landroid/view/ViewGroup;

    .line 374
    .line 375
    const/16 v12, 0xb

    .line 376
    .line 377
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 382
    .line 383
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 384
    .line 385
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object v3

    .line 389
    check-cast v3, Landroid/view/ViewGroup;

    .line 390
    .line 391
    const/16 v12, 0xc

    .line 392
    .line 393
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 394
    .line 395
    .line 396
    move-result-object v3

    .line 397
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 398
    .line 399
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->w:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 400
    .line 401
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    check-cast v3, Landroid/view/ViewGroup;

    .line 406
    .line 407
    const/16 v12, 0xd

    .line 408
    .line 409
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 410
    .line 411
    .line 412
    move-result-object v3

    .line 413
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 414
    .line 415
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->x:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 416
    .line 417
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 418
    .line 419
    .line 420
    move-result-object v3

    .line 421
    check-cast v3, Landroid/view/ViewGroup;

    .line 422
    .line 423
    const/16 v12, 0xe

    .line 424
    .line 425
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 426
    .line 427
    .line 428
    move-result-object v3

    .line 429
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->y:Landroid/view/View;

    .line 430
    .line 431
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    check-cast v3, Landroid/view/ViewGroup;

    .line 436
    .line 437
    const/16 v12, 0xf

    .line 438
    .line 439
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 440
    .line 441
    .line 442
    move-result-object v3

    .line 443
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 444
    .line 445
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 446
    .line 447
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 448
    .line 449
    .line 450
    move-result-object v3

    .line 451
    check-cast v3, Landroid/view/ViewGroup;

    .line 452
    .line 453
    const/16 v12, 0x10

    .line 454
    .line 455
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 456
    .line 457
    .line 458
    move-result-object v3

    .line 459
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 460
    .line 461
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->A:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 462
    .line 463
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    check-cast v3, Landroid/view/ViewGroup;

    .line 468
    .line 469
    const/16 v12, 0x11

    .line 470
    .line 471
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 472
    .line 473
    .line 474
    move-result-object v3

    .line 475
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 476
    .line 477
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->B:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 478
    .line 479
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 480
    .line 481
    .line 482
    move-result-object v3

    .line 483
    check-cast v3, Landroid/view/ViewGroup;

    .line 484
    .line 485
    const/16 v12, 0x12

    .line 486
    .line 487
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v3

    .line 491
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 492
    .line 493
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->C:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 494
    .line 495
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 496
    .line 497
    .line 498
    move-result-object v3

    .line 499
    check-cast v3, Landroid/view/ViewGroup;

    .line 500
    .line 501
    const/16 v12, 0x13

    .line 502
    .line 503
    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 504
    .line 505
    .line 506
    move-result-object v3

    .line 507
    check-cast v3, Landroid/widget/FrameLayout;

    .line 508
    .line 509
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->D:Landroid/widget/FrameLayout;

    .line 510
    .line 511
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 512
    .line 513
    .line 514
    move-result-object v3

    .line 515
    check-cast v3, Lv/VFrame;

    .line 516
    .line 517
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->E:Lv/VFrame;

    .line 518
    .line 519
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 520
    .line 521
    .line 522
    move-result-object v3

    .line 523
    check-cast v3, Landroid/view/ViewGroup;

    .line 524
    .line 525
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 526
    .line 527
    .line 528
    move-result-object v3

    .line 529
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 530
    .line 531
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->F:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 532
    .line 533
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 534
    .line 535
    .line 536
    move-result-object v3

    .line 537
    check-cast v3, Landroid/view/ViewGroup;

    .line 538
    .line 539
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object v3

    .line 543
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 544
    .line 545
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 546
    .line 547
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 548
    .line 549
    .line 550
    move-result-object v3

    .line 551
    check-cast v3, Lv/VRelative;

    .line 552
    .line 553
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->H:Lv/VRelative;

    .line 554
    .line 555
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 556
    .line 557
    .line 558
    move-result-object v3

    .line 559
    check-cast v3, Landroid/view/ViewGroup;

    .line 560
    .line 561
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 562
    .line 563
    .line 564
    move-result-object v3

    .line 565
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 566
    .line 567
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->I:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 568
    .line 569
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 570
    .line 571
    .line 572
    move-result-object v3

    .line 573
    check-cast v3, Landroid/view/ViewGroup;

    .line 574
    .line 575
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 576
    .line 577
    .line 578
    move-result-object v3

    .line 579
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 580
    .line 581
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->J:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 582
    .line 583
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 584
    .line 585
    .line 586
    move-result-object v3

    .line 587
    check-cast v3, Landroid/view/ViewGroup;

    .line 588
    .line 589
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 590
    .line 591
    .line 592
    move-result-object v2

    .line 593
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 594
    .line 595
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->K:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 596
    .line 597
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 598
    .line 599
    .line 600
    move-result-object v2

    .line 601
    check-cast v2, Landroid/view/ViewGroup;

    .line 602
    .line 603
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 604
    .line 605
    .line 606
    move-result-object v2

    .line 607
    check-cast v2, Landroid/view/ViewGroup;

    .line 608
    .line 609
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 610
    .line 611
    .line 612
    move-result-object v2

    .line 613
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 614
    .line 615
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->L:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 616
    .line 617
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 618
    .line 619
    .line 620
    move-result-object v2

    .line 621
    check-cast v2, Landroid/view/ViewGroup;

    .line 622
    .line 623
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 624
    .line 625
    .line 626
    move-result-object v2

    .line 627
    check-cast v2, Landroid/view/ViewGroup;

    .line 628
    .line 629
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 630
    .line 631
    .line 632
    move-result-object v2

    .line 633
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 634
    .line 635
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->M:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 636
    .line 637
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    check-cast v2, Landroid/view/ViewGroup;

    .line 642
    .line 643
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 644
    .line 645
    .line 646
    move-result-object v2

    .line 647
    check-cast v2, Landroid/view/ViewGroup;

    .line 648
    .line 649
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 650
    .line 651
    .line 652
    move-result-object v1

    .line 653
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 654
    .line 655
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 656
    .line 657
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    check-cast v1, Landroid/view/ViewGroup;

    .line 662
    .line 663
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 664
    .line 665
    .line 666
    move-result-object v1

    .line 667
    check-cast v1, Landroid/widget/FrameLayout;

    .line 668
    .line 669
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->O:Landroid/widget/FrameLayout;

    .line 670
    .line 671
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 672
    .line 673
    .line 674
    move-result-object v1

    .line 675
    check-cast v1, Lv/VRelative;

    .line 676
    .line 677
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->P:Lv/VRelative;

    .line 678
    .line 679
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 680
    .line 681
    .line 682
    move-result-object v1

    .line 683
    check-cast v1, Landroid/view/ViewGroup;

    .line 684
    .line 685
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 686
    .line 687
    .line 688
    move-result-object v0

    .line 689
    check-cast v0, Lv/VImage;

    .line 690
    .line 691
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->Q:Lv/VImage;

    .line 692
    .line 693
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 694
    .line 695
    .line 696
    move-result-object v0

    .line 697
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerDragMask;

    .line 698
    .line 699
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->R:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerDragMask;

    .line 700
    .line 701
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 702
    .line 703
    .line 704
    move-result-object v0

    .line 705
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->S:Landroid/view/View;

    .line 706
    .line 707
    invoke-virtual {p1, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 708
    .line 709
    .line 710
    move-result-object v0

    .line 711
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 712
    .line 713
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->T:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 714
    .line 715
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 716
    .line 717
    .line 718
    move-result-object v0

    .line 719
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 720
    .line 721
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->U:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 722
    .line 723
    invoke-virtual {p1, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 724
    .line 725
    .line 726
    move-result-object p1

    .line 727
    check-cast p1, Lv/VFrame;

    .line 728
    .line 729
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->V:Lv/VFrame;

    .line 730
    .line 731
    return-void
.end method
