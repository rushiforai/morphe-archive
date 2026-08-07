.class public Ll/hc80;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 7

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
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

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
    check-cast v2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/view/ViewGroup;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/view/ViewGroup;

    .line 42
    .line 43
    const/4 v3, 0x2

    .line 44
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/widget/LinearLayout;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Landroid/view/ViewGroup;

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/view/ViewGroup;

    .line 63
    .line 64
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Lv/VImage;

    .line 69
    .line 70
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->e:Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Landroid/view/ViewGroup;

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 95
    .line 96
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 97
    .line 98
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Landroid/view/ViewGroup;

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Landroid/view/ViewGroup;

    .line 109
    .line 110
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, Landroid/view/ViewGroup;

    .line 115
    .line 116
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Landroid/widget/TextView;

    .line 121
    .line 122
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->g:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->h:Landroid/view/View;

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, Landroid/view/ViewGroup;

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    check-cast v2, Landroid/view/ViewGroup;

    .line 153
    .line 154
    const/4 v4, 0x3

    .line 155
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Lv/VImage;

    .line 160
    .line 161
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->i:Lv/VImage;

    .line 162
    .line 163
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    check-cast v2, Lv/VImage;

    .line 168
    .line 169
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->j:Lv/VImage;

    .line 170
    .line 171
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 176
    .line 177
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 178
    .line 179
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    check-cast v2, Landroid/view/ViewGroup;

    .line 184
    .line 185
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->l:Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    check-cast v2, Landroid/view/ViewGroup;

    .line 196
    .line 197
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    check-cast v2, Landroid/widget/Space;

    .line 202
    .line 203
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->m:Landroid/widget/Space;

    .line 204
    .line 205
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Landroid/view/ViewGroup;

    .line 210
    .line 211
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    check-cast v2, Lv/VDraweeView;

    .line 216
    .line 217
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->n:Lv/VDraweeView;

    .line 218
    .line 219
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    check-cast v2, Landroid/view/ViewGroup;

    .line 224
    .line 225
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    check-cast v2, Lv/VText;

    .line 230
    .line 231
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o:Lv/VText;

    .line 232
    .line 233
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    check-cast v2, Landroid/view/ViewGroup;

    .line 238
    .line 239
    const/4 v5, 0x4

    .line 240
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    check-cast v2, Lv/VImage;

    .line 245
    .line 246
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->p:Lv/VImage;

    .line 247
    .line 248
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    check-cast v2, Landroid/view/ViewGroup;

    .line 253
    .line 254
    const/4 v6, 0x5

    .line 255
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    check-cast v2, Lv/VText;

    .line 260
    .line 261
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q:Lv/VText;

    .line 262
    .line 263
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Landroid/view/ViewGroup;

    .line 268
    .line 269
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    check-cast v2, Landroid/view/ViewGroup;

    .line 274
    .line 275
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    check-cast v2, Landroid/widget/LinearLayout;

    .line 280
    .line 281
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r:Landroid/widget/LinearLayout;

    .line 282
    .line 283
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Landroid/view/ViewGroup;

    .line 288
    .line 289
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    check-cast v2, Landroid/view/ViewGroup;

    .line 294
    .line 295
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    check-cast v2, Landroid/view/ViewGroup;

    .line 300
    .line 301
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    check-cast v2, Landroid/view/ViewGroup;

    .line 306
    .line 307
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    check-cast v2, Lv/VImage;

    .line 312
    .line 313
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->s:Lv/VImage;

    .line 314
    .line 315
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    check-cast v2, Landroid/view/ViewGroup;

    .line 320
    .line 321
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    check-cast v2, Landroid/view/ViewGroup;

    .line 326
    .line 327
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    check-cast v2, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    check-cast v2, Landroid/view/ViewGroup;

    .line 338
    .line 339
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    check-cast v2, Lv/VImage;

    .line 344
    .line 345
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->t:Lv/VImage;

    .line 346
    .line 347
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    check-cast v2, Landroid/view/ViewGroup;

    .line 352
    .line 353
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    check-cast v2, Landroid/view/ViewGroup;

    .line 358
    .line 359
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    check-cast v2, Landroid/view/ViewGroup;

    .line 364
    .line 365
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 370
    .line 371
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 372
    .line 373
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    check-cast v2, Landroid/view/ViewGroup;

    .line 378
    .line 379
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    check-cast v2, Landroid/view/ViewGroup;

    .line 384
    .line 385
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 390
    .line 391
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 392
    .line 393
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    check-cast v2, Landroid/view/ViewGroup;

    .line 398
    .line 399
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    check-cast v2, Landroid/view/ViewGroup;

    .line 404
    .line 405
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 410
    .line 411
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->w:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 412
    .line 413
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    check-cast v2, Landroid/view/ViewGroup;

    .line 418
    .line 419
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    check-cast v2, Landroid/view/ViewGroup;

    .line 424
    .line 425
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    check-cast v2, Landroid/view/ViewGroup;

    .line 430
    .line 431
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 436
    .line 437
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 438
    .line 439
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 440
    .line 441
    .line 442
    move-result-object v2

    .line 443
    check-cast v2, Landroid/view/ViewGroup;

    .line 444
    .line 445
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    check-cast v2, Landroid/view/ViewGroup;

    .line 450
    .line 451
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    check-cast v2, Landroid/view/ViewGroup;

    .line 456
    .line 457
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 458
    .line 459
    .line 460
    move-result-object v2

    .line 461
    check-cast v2, Lv/VText;

    .line 462
    .line 463
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y:Lv/VText;

    .line 464
    .line 465
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    check-cast v2, Landroid/view/ViewGroup;

    .line 470
    .line 471
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    check-cast v2, Landroid/view/ViewGroup;

    .line 476
    .line 477
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 478
    .line 479
    .line 480
    move-result-object v2

    .line 481
    check-cast v2, Landroid/widget/LinearLayout;

    .line 482
    .line 483
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z:Landroid/widget/LinearLayout;

    .line 484
    .line 485
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v2

    .line 489
    check-cast v2, Landroid/view/ViewGroup;

    .line 490
    .line 491
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    check-cast v2, Landroid/view/ViewGroup;

    .line 496
    .line 497
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 498
    .line 499
    .line 500
    move-result-object v2

    .line 501
    check-cast v2, Landroid/view/ViewGroup;

    .line 502
    .line 503
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 508
    .line 509
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 510
    .line 511
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 512
    .line 513
    .line 514
    move-result-object v2

    .line 515
    check-cast v2, Landroid/view/ViewGroup;

    .line 516
    .line 517
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 518
    .line 519
    .line 520
    move-result-object v2

    .line 521
    check-cast v2, Landroid/view/ViewGroup;

    .line 522
    .line 523
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 524
    .line 525
    .line 526
    move-result-object v2

    .line 527
    check-cast v2, Landroid/view/ViewGroup;

    .line 528
    .line 529
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 530
    .line 531
    .line 532
    move-result-object v2

    .line 533
    check-cast v2, Landroid/view/ViewGroup;

    .line 534
    .line 535
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 536
    .line 537
    .line 538
    move-result-object v2

    .line 539
    check-cast v2, Lv/VImage;

    .line 540
    .line 541
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B:Lv/VImage;

    .line 542
    .line 543
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object v2

    .line 547
    check-cast v2, Landroid/view/ViewGroup;

    .line 548
    .line 549
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    check-cast v2, Landroid/view/ViewGroup;

    .line 554
    .line 555
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    check-cast v0, Landroid/view/ViewGroup;

    .line 560
    .line 561
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    check-cast v0, Landroid/view/ViewGroup;

    .line 566
    .line 567
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    check-cast v0, Lv/VImage;

    .line 572
    .line 573
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->C:Lv/VImage;

    .line 574
    .line 575
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 576
    .line 577
    .line 578
    move-result-object v0

    .line 579
    check-cast v0, Landroid/view/ViewGroup;

    .line 580
    .line 581
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 582
    .line 583
    .line 584
    move-result-object v0

    .line 585
    check-cast v0, Landroid/view/ViewGroup;

    .line 586
    .line 587
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 588
    .line 589
    .line 590
    move-result-object v0

    .line 591
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 592
    .line 593
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->D:Landroidx/recyclerview/widget/RecyclerView;

    .line 594
    .line 595
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 596
    .line 597
    .line 598
    move-result-object v0

    .line 599
    check-cast v0, Landroid/view/ViewGroup;

    .line 600
    .line 601
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    check-cast v0, Landroid/view/ViewGroup;

    .line 606
    .line 607
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 608
    .line 609
    .line 610
    move-result-object v0

    .line 611
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 612
    .line 613
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->E:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 614
    .line 615
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 616
    .line 617
    .line 618
    move-result-object v0

    .line 619
    check-cast v0, Landroid/view/ViewGroup;

    .line 620
    .line 621
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    check-cast v0, Landroid/view/ViewGroup;

    .line 626
    .line 627
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    check-cast v0, Lv/VText;

    .line 632
    .line 633
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F:Lv/VText;

    .line 634
    .line 635
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 636
    .line 637
    .line 638
    move-result-object v0

    .line 639
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

    .line 640
    .line 641
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->G:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

    .line 642
    .line 643
    const/4 v0, 0x6

    .line 644
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 645
    .line 646
    .line 647
    move-result-object v0

    .line 648
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 649
    .line 650
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 651
    .line 652
    const/4 v0, 0x7

    .line 653
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 658
    .line 659
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->I:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 660
    .line 661
    const/16 v0, 0x8

    .line 662
    .line 663
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 664
    .line 665
    .line 666
    move-result-object v0

    .line 667
    check-cast v0, Lv/VButton;

    .line 668
    .line 669
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J:Lv/VButton;

    .line 670
    .line 671
    const/16 v0, 0x9

    .line 672
    .line 673
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 674
    .line 675
    .line 676
    move-result-object p1

    .line 677
    check-cast p1, Lv/VImage;

    .line 678
    .line 679
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 680
    .line 681
    return-void
.end method
