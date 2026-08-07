.class public Ll/fg50;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;Landroid/view/View;)V
    .locals 10

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->a:Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

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
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->b:Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

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
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->c:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

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
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->d:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

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
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->e:Landroid/view/View;

    .line 41
    .line 42
    const/4 v4, 0x4

    .line 43
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->f:Landroid/view/View;

    .line 48
    .line 49
    const/4 v5, 0x5

    .line 50
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

    .line 55
    .line 56
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->g:Lcom/p1/mobile/putong/live/livingroom/officialshow/switchanchor/OfficialShowSwitchView;

    .line 57
    .line 58
    const/4 v6, 0x6

    .line 59
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    check-cast v7, Lv/VFrame;

    .line 64
    .line 65
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->h:Lv/VFrame;

    .line 66
    .line 67
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    check-cast v7, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    check-cast v7, Lv/VRelative;

    .line 78
    .line 79
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->i:Lv/VRelative;

    .line 80
    .line 81
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    check-cast v7, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    check-cast v7, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    .line 98
    .line 99
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->j:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpToRoomView;

    .line 100
    .line 101
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    check-cast v7, Landroid/view/ViewGroup;

    .line 106
    .line 107
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    check-cast v7, Landroid/view/ViewGroup;

    .line 112
    .line 113
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    check-cast v7, Lv/VText;

    .line 118
    .line 119
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->k:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    check-cast v7, Landroid/view/ViewGroup;

    .line 126
    .line 127
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    check-cast v7, Landroid/view/ViewGroup;

    .line 132
    .line 133
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    check-cast v7, Lv/VFrame;

    .line 138
    .line 139
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->l:Lv/VFrame;

    .line 140
    .line 141
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    check-cast v7, Landroid/view/ViewGroup;

    .line 146
    .line 147
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    check-cast v7, Landroid/view/ViewGroup;

    .line 152
    .line 153
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    check-cast v7, Landroid/view/ViewGroup;

    .line 158
    .line 159
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 164
    .line 165
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->m:Lcom/p1/mobile/putong/live/livingroom/officialshow/avatar/OfficialShowAvatarView;

    .line 166
    .line 167
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    check-cast v7, Landroid/view/ViewGroup;

    .line 172
    .line 173
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    check-cast v7, Landroid/view/ViewGroup;

    .line 178
    .line 179
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v7

    .line 183
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 184
    .line 185
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->n:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 186
    .line 187
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    check-cast v7, Landroid/view/ViewGroup;

    .line 192
    .line 193
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    check-cast v7, Landroid/view/ViewGroup;

    .line 198
    .line 199
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v7

    .line 203
    check-cast v7, Landroid/view/ViewGroup;

    .line 204
    .line 205
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v7

    .line 209
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 210
    .line 211
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 212
    .line 213
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v7

    .line 217
    check-cast v7, Landroid/view/ViewGroup;

    .line 218
    .line 219
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    check-cast v7, Landroid/view/ViewGroup;

    .line 224
    .line 225
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 230
    .line 231
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->p:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 232
    .line 233
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v7

    .line 237
    check-cast v7, Landroid/view/ViewGroup;

    .line 238
    .line 239
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 240
    .line 241
    .line 242
    move-result-object v7

    .line 243
    check-cast v7, Landroid/view/ViewGroup;

    .line 244
    .line 245
    invoke-virtual {v7, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 250
    .line 251
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->q:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 252
    .line 253
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v7

    .line 257
    check-cast v7, Landroid/view/ViewGroup;

    .line 258
    .line 259
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v7

    .line 263
    check-cast v7, Landroid/view/ViewGroup;

    .line 264
    .line 265
    invoke-virtual {v7, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v7

    .line 269
    check-cast v7, Landroid/view/ViewGroup;

    .line 270
    .line 271
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v7

    .line 275
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 276
    .line 277
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->r:Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 278
    .line 279
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v7

    .line 283
    check-cast v7, Landroid/view/ViewGroup;

    .line 284
    .line 285
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    check-cast v7, Landroid/view/ViewGroup;

    .line 290
    .line 291
    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v7

    .line 295
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 296
    .line 297
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 298
    .line 299
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v7

    .line 303
    check-cast v7, Landroid/view/ViewGroup;

    .line 304
    .line 305
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v7

    .line 309
    check-cast v7, Landroid/view/ViewGroup;

    .line 310
    .line 311
    const/4 v8, 0x7

    .line 312
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 317
    .line 318
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->t:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 319
    .line 320
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    check-cast v7, Landroid/view/ViewGroup;

    .line 325
    .line 326
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 327
    .line 328
    .line 329
    move-result-object v7

    .line 330
    check-cast v7, Landroid/view/ViewGroup;

    .line 331
    .line 332
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v7

    .line 336
    check-cast v7, Landroid/view/ViewGroup;

    .line 337
    .line 338
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 339
    .line 340
    .line 341
    move-result-object v7

    .line 342
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 343
    .line 344
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->u:Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 345
    .line 346
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 347
    .line 348
    .line 349
    move-result-object v7

    .line 350
    check-cast v7, Landroid/view/ViewGroup;

    .line 351
    .line 352
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 353
    .line 354
    .line 355
    move-result-object v7

    .line 356
    check-cast v7, Landroid/view/ViewGroup;

    .line 357
    .line 358
    const/16 v9, 0x8

    .line 359
    .line 360
    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 365
    .line 366
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->v:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 367
    .line 368
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object v7

    .line 372
    check-cast v7, Landroid/view/ViewGroup;

    .line 373
    .line 374
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 375
    .line 376
    .line 377
    move-result-object v7

    .line 378
    check-cast v7, Landroid/view/ViewGroup;

    .line 379
    .line 380
    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v7

    .line 384
    check-cast v7, Landroid/view/ViewGroup;

    .line 385
    .line 386
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v7

    .line 390
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    .line 391
    .line 392
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->w:Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillView;

    .line 393
    .line 394
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object v7

    .line 398
    check-cast v7, Landroid/view/ViewGroup;

    .line 399
    .line 400
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 401
    .line 402
    .line 403
    move-result-object v7

    .line 404
    check-cast v7, Lv/VFrame;

    .line 405
    .line 406
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->x:Lv/VFrame;

    .line 407
    .line 408
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 409
    .line 410
    .line 411
    move-result-object v7

    .line 412
    check-cast v7, Landroid/view/ViewGroup;

    .line 413
    .line 414
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 415
    .line 416
    .line 417
    move-result-object v7

    .line 418
    check-cast v7, Landroid/view/ViewGroup;

    .line 419
    .line 420
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 421
    .line 422
    .line 423
    move-result-object v7

    .line 424
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 425
    .line 426
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->y:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 427
    .line 428
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object v7

    .line 432
    check-cast v7, Landroid/view/ViewGroup;

    .line 433
    .line 434
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v7

    .line 438
    check-cast v7, Landroid/view/ViewGroup;

    .line 439
    .line 440
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v7

    .line 444
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 445
    .line 446
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 447
    .line 448
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 449
    .line 450
    .line 451
    move-result-object v7

    .line 452
    check-cast v7, Landroid/view/ViewGroup;

    .line 453
    .line 454
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 455
    .line 456
    .line 457
    move-result-object v7

    .line 458
    check-cast v7, Landroid/view/ViewGroup;

    .line 459
    .line 460
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v7

    .line 464
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 465
    .line 466
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->A:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 467
    .line 468
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v7

    .line 472
    check-cast v7, Landroid/view/ViewGroup;

    .line 473
    .line 474
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 475
    .line 476
    .line 477
    move-result-object v7

    .line 478
    check-cast v7, Lv/VFrame;

    .line 479
    .line 480
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->B:Lv/VFrame;

    .line 481
    .line 482
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 483
    .line 484
    .line 485
    move-result-object v7

    .line 486
    check-cast v7, Landroid/view/ViewGroup;

    .line 487
    .line 488
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 489
    .line 490
    .line 491
    move-result-object v7

    .line 492
    check-cast v7, Landroid/view/ViewGroup;

    .line 493
    .line 494
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 495
    .line 496
    .line 497
    move-result-object v7

    .line 498
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 499
    .line 500
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->C:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 501
    .line 502
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 503
    .line 504
    .line 505
    move-result-object v7

    .line 506
    check-cast v7, Landroid/view/ViewGroup;

    .line 507
    .line 508
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 509
    .line 510
    .line 511
    move-result-object v7

    .line 512
    check-cast v7, Landroid/view/ViewGroup;

    .line 513
    .line 514
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 515
    .line 516
    .line 517
    move-result-object v7

    .line 518
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 519
    .line 520
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->D:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 521
    .line 522
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 523
    .line 524
    .line 525
    move-result-object v7

    .line 526
    check-cast v7, Landroid/view/ViewGroup;

    .line 527
    .line 528
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 529
    .line 530
    .line 531
    move-result-object v7

    .line 532
    check-cast v7, Landroid/view/ViewGroup;

    .line 533
    .line 534
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 535
    .line 536
    .line 537
    move-result-object v7

    .line 538
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 539
    .line 540
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->E:Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;

    .line 541
    .line 542
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 543
    .line 544
    .line 545
    move-result-object v7

    .line 546
    check-cast v7, Landroid/view/ViewGroup;

    .line 547
    .line 548
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 549
    .line 550
    .line 551
    move-result-object v7

    .line 552
    check-cast v7, Landroid/view/ViewGroup;

    .line 553
    .line 554
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 555
    .line 556
    .line 557
    move-result-object v7

    .line 558
    check-cast v7, Landroid/view/ViewGroup;

    .line 559
    .line 560
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 561
    .line 562
    .line 563
    move-result-object v7

    .line 564
    check-cast v7, Landroid/widget/FrameLayout;

    .line 565
    .line 566
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->F:Landroid/widget/FrameLayout;

    .line 567
    .line 568
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 569
    .line 570
    .line 571
    move-result-object v7

    .line 572
    check-cast v7, Landroid/view/ViewGroup;

    .line 573
    .line 574
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 575
    .line 576
    .line 577
    move-result-object v7

    .line 578
    check-cast v7, Landroid/view/ViewGroup;

    .line 579
    .line 580
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 581
    .line 582
    .line 583
    move-result-object v7

    .line 584
    check-cast v7, Landroid/view/ViewGroup;

    .line 585
    .line 586
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 587
    .line 588
    .line 589
    move-result-object v7

    .line 590
    check-cast v7, Landroid/view/ViewGroup;

    .line 591
    .line 592
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 593
    .line 594
    .line 595
    move-result-object v7

    .line 596
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 597
    .line 598
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 599
    .line 600
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 601
    .line 602
    .line 603
    move-result-object v7

    .line 604
    check-cast v7, Landroid/view/ViewGroup;

    .line 605
    .line 606
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 607
    .line 608
    .line 609
    move-result-object v7

    .line 610
    check-cast v7, Landroid/view/ViewGroup;

    .line 611
    .line 612
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 613
    .line 614
    .line 615
    move-result-object v7

    .line 616
    check-cast v7, Landroid/view/ViewGroup;

    .line 617
    .line 618
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 619
    .line 620
    .line 621
    move-result-object v7

    .line 622
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 623
    .line 624
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->H:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 625
    .line 626
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 627
    .line 628
    .line 629
    move-result-object v7

    .line 630
    check-cast v7, Landroid/view/ViewGroup;

    .line 631
    .line 632
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 633
    .line 634
    .line 635
    move-result-object v7

    .line 636
    check-cast v7, Landroid/view/ViewGroup;

    .line 637
    .line 638
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 639
    .line 640
    .line 641
    move-result-object v7

    .line 642
    check-cast v7, Landroid/view/ViewGroup;

    .line 643
    .line 644
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 645
    .line 646
    .line 647
    move-result-object v1

    .line 648
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 649
    .line 650
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->I:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 651
    .line 652
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 653
    .line 654
    .line 655
    move-result-object v1

    .line 656
    check-cast v1, Landroid/view/ViewGroup;

    .line 657
    .line 658
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 659
    .line 660
    .line 661
    move-result-object v1

    .line 662
    check-cast v1, Landroid/view/ViewGroup;

    .line 663
    .line 664
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 665
    .line 666
    .line 667
    move-result-object v1

    .line 668
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->J:Landroid/view/View;

    .line 669
    .line 670
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    check-cast v1, Landroid/view/ViewGroup;

    .line 675
    .line 676
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 677
    .line 678
    .line 679
    move-result-object v1

    .line 680
    check-cast v1, Landroid/view/ViewGroup;

    .line 681
    .line 682
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 683
    .line 684
    .line 685
    move-result-object v1

    .line 686
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 687
    .line 688
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->K:Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 689
    .line 690
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 691
    .line 692
    .line 693
    move-result-object v1

    .line 694
    check-cast v1, Landroid/view/ViewGroup;

    .line 695
    .line 696
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    check-cast v1, Landroid/view/ViewGroup;

    .line 701
    .line 702
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 703
    .line 704
    .line 705
    move-result-object v1

    .line 706
    check-cast v1, Lv/VRelative;

    .line 707
    .line 708
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->L:Lv/VRelative;

    .line 709
    .line 710
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    check-cast v1, Landroid/view/ViewGroup;

    .line 715
    .line 716
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 717
    .line 718
    .line 719
    move-result-object v1

    .line 720
    check-cast v1, Landroid/view/ViewGroup;

    .line 721
    .line 722
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 723
    .line 724
    .line 725
    move-result-object v1

    .line 726
    check-cast v1, Landroid/view/ViewGroup;

    .line 727
    .line 728
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    check-cast v0, Lv/VImage;

    .line 733
    .line 734
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->M:Lv/VImage;

    .line 735
    .line 736
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 737
    .line 738
    .line 739
    move-result-object v0

    .line 740
    check-cast v0, Landroid/view/ViewGroup;

    .line 741
    .line 742
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 743
    .line 744
    .line 745
    move-result-object v0

    .line 746
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 747
    .line 748
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 749
    .line 750
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 751
    .line 752
    .line 753
    move-result-object v0

    .line 754
    check-cast v0, Landroid/view/ViewGroup;

    .line 755
    .line 756
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 757
    .line 758
    .line 759
    move-result-object v0

    .line 760
    check-cast v0, Lv/VFrame;

    .line 761
    .line 762
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->O:Lv/VFrame;

    .line 763
    .line 764
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 765
    .line 766
    .line 767
    move-result-object p1

    .line 768
    check-cast p1, Lv/VRelative;

    .line 769
    .line 770
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->P:Lv/VRelative;

    .line 771
    .line 772
    return-void
.end method
