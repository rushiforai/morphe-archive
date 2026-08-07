.class public Ll/gc80;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 8

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
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

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
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

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
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 29
    .line 30
    const/4 v3, 0x3

    .line 31
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 36
    .line 37
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 38
    .line 39
    const/4 v4, 0x4

    .line 40
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    check-cast v5, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->e:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Landroid/view/ViewGroup;

    .line 57
    .line 58
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f:Landroid/view/View;

    .line 63
    .line 64
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    check-cast v5, Landroid/view/ViewGroup;

    .line 69
    .line 70
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Landroid/widget/LinearLayout;

    .line 75
    .line 76
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->g:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    check-cast v5, Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Landroid/view/ViewGroup;

    .line 89
    .line 90
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    check-cast v5, Lv/VImage;

    .line 95
    .line 96
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->h:Lv/VImage;

    .line 97
    .line 98
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    check-cast v5, Landroid/view/ViewGroup;

    .line 103
    .line 104
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Landroid/view/ViewGroup;

    .line 109
    .line 110
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    check-cast v5, Landroid/view/ViewGroup;

    .line 115
    .line 116
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    check-cast v5, Landroid/widget/TextView;

    .line 121
    .line 122
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    check-cast v5, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    check-cast v5, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    check-cast v5, Landroid/view/ViewGroup;

    .line 141
    .line 142
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Landroid/widget/TextView;

    .line 147
    .line 148
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->j:Landroid/widget/TextView;

    .line 149
    .line 150
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    check-cast v5, Landroid/view/ViewGroup;

    .line 155
    .line 156
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    check-cast v5, Landroid/view/ViewGroup;

    .line 161
    .line 162
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k:Landroid/view/View;

    .line 167
    .line 168
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    check-cast v5, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    check-cast v5, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    check-cast v5, Lv/VImage;

    .line 185
    .line 186
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->l:Lv/VImage;

    .line 187
    .line 188
    const/4 v5, 0x5

    .line 189
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    check-cast v6, Landroid/view/ViewGroup;

    .line 194
    .line 195
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

    .line 200
    .line 201
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    check-cast v6, Landroid/view/ViewGroup;

    .line 206
    .line 207
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 212
    .line 213
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    check-cast v6, Landroid/view/ViewGroup;

    .line 218
    .line 219
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    check-cast v6, Lv/VText;

    .line 224
    .line 225
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o:Lv/VText;

    .line 226
    .line 227
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v6

    .line 231
    check-cast v6, Landroid/view/ViewGroup;

    .line 232
    .line 233
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    check-cast v6, Lv/VText;

    .line 238
    .line 239
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p:Lv/VText;

    .line 240
    .line 241
    const/4 v6, 0x6

    .line 242
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    check-cast v6, Lv/VImage;

    .line 247
    .line 248
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->q:Lv/VImage;

    .line 249
    .line 250
    const/4 v6, 0x7

    .line 251
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 256
    .line 257
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 258
    .line 259
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v7

    .line 263
    check-cast v7, Landroid/view/ViewGroup;

    .line 264
    .line 265
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v7

    .line 269
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->s:Landroid/view/View;

    .line 270
    .line 271
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v7

    .line 275
    check-cast v7, Landroid/view/ViewGroup;

    .line 276
    .line 277
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    check-cast v7, Landroid/widget/Space;

    .line 282
    .line 283
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->t:Landroid/widget/Space;

    .line 284
    .line 285
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    check-cast v7, Landroid/view/ViewGroup;

    .line 290
    .line 291
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v7

    .line 295
    check-cast v7, Lv/VDraweeView;

    .line 296
    .line 297
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u:Lv/VDraweeView;

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
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v7

    .line 309
    check-cast v7, Lv/VText;

    .line 310
    .line 311
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v:Lv/VText;

    .line 312
    .line 313
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v7

    .line 317
    check-cast v7, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v7

    .line 323
    check-cast v7, Lv/VImage;

    .line 324
    .line 325
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->w:Lv/VImage;

    .line 326
    .line 327
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    check-cast v6, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    check-cast v5, Lv/VText;

    .line 338
    .line 339
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->x:Lv/VText;

    .line 340
    .line 341
    const/16 v5, 0x8

    .line 342
    .line 343
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object v6

    .line 347
    check-cast v6, Landroid/view/ViewGroup;

    .line 348
    .line 349
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 350
    .line 351
    .line 352
    move-result-object v6

    .line 353
    check-cast v6, Landroid/view/ViewGroup;

    .line 354
    .line 355
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 356
    .line 357
    .line 358
    move-result-object v6

    .line 359
    check-cast v6, Landroid/widget/LinearLayout;

    .line 360
    .line 361
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->y:Landroid/widget/LinearLayout;

    .line 362
    .line 363
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 364
    .line 365
    .line 366
    move-result-object v6

    .line 367
    check-cast v6, Landroid/view/ViewGroup;

    .line 368
    .line 369
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 370
    .line 371
    .line 372
    move-result-object v6

    .line 373
    check-cast v6, Landroid/view/ViewGroup;

    .line 374
    .line 375
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 376
    .line 377
    .line 378
    move-result-object v6

    .line 379
    check-cast v6, Landroid/view/ViewGroup;

    .line 380
    .line 381
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 382
    .line 383
    .line 384
    move-result-object v6

    .line 385
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 386
    .line 387
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 388
    .line 389
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 390
    .line 391
    .line 392
    move-result-object v6

    .line 393
    check-cast v6, Landroid/view/ViewGroup;

    .line 394
    .line 395
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 396
    .line 397
    .line 398
    move-result-object v6

    .line 399
    check-cast v6, Landroid/view/ViewGroup;

    .line 400
    .line 401
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 402
    .line 403
    .line 404
    move-result-object v6

    .line 405
    check-cast v6, Landroid/view/ViewGroup;

    .line 406
    .line 407
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 408
    .line 409
    .line 410
    move-result-object v6

    .line 411
    check-cast v6, Lv/VImage;

    .line 412
    .line 413
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 414
    .line 415
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 416
    .line 417
    .line 418
    move-result-object v6

    .line 419
    check-cast v6, Landroid/view/ViewGroup;

    .line 420
    .line 421
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 422
    .line 423
    .line 424
    move-result-object v6

    .line 425
    check-cast v6, Landroid/view/ViewGroup;

    .line 426
    .line 427
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 428
    .line 429
    .line 430
    move-result-object v6

    .line 431
    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    .line 432
    .line 433
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 434
    .line 435
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 436
    .line 437
    .line 438
    move-result-object v6

    .line 439
    check-cast v6, Landroid/view/ViewGroup;

    .line 440
    .line 441
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 442
    .line 443
    .line 444
    move-result-object v6

    .line 445
    check-cast v6, Landroid/view/ViewGroup;

    .line 446
    .line 447
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 448
    .line 449
    .line 450
    move-result-object v6

    .line 451
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 452
    .line 453
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->C:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 454
    .line 455
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 456
    .line 457
    .line 458
    move-result-object v6

    .line 459
    check-cast v6, Landroid/view/ViewGroup;

    .line 460
    .line 461
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 462
    .line 463
    .line 464
    move-result-object v6

    .line 465
    check-cast v6, Landroid/view/ViewGroup;

    .line 466
    .line 467
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 468
    .line 469
    .line 470
    move-result-object v6

    .line 471
    check-cast v6, Landroid/view/ViewGroup;

    .line 472
    .line 473
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 474
    .line 475
    .line 476
    move-result-object v6

    .line 477
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 478
    .line 479
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->D:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 480
    .line 481
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 482
    .line 483
    .line 484
    move-result-object v6

    .line 485
    check-cast v6, Landroid/view/ViewGroup;

    .line 486
    .line 487
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v6

    .line 491
    check-cast v6, Landroid/view/ViewGroup;

    .line 492
    .line 493
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 494
    .line 495
    .line 496
    move-result-object v6

    .line 497
    check-cast v6, Landroid/view/ViewGroup;

    .line 498
    .line 499
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 500
    .line 501
    .line 502
    move-result-object v6

    .line 503
    check-cast v6, Lv/VText;

    .line 504
    .line 505
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E:Lv/VText;

    .line 506
    .line 507
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object v6

    .line 511
    check-cast v6, Landroid/view/ViewGroup;

    .line 512
    .line 513
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 514
    .line 515
    .line 516
    move-result-object v6

    .line 517
    check-cast v6, Landroid/view/ViewGroup;

    .line 518
    .line 519
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 520
    .line 521
    .line 522
    move-result-object v6

    .line 523
    check-cast v6, Lv/VDraweeView;

    .line 524
    .line 525
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F:Lv/VDraweeView;

    .line 526
    .line 527
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 528
    .line 529
    .line 530
    move-result-object v6

    .line 531
    check-cast v6, Landroid/view/ViewGroup;

    .line 532
    .line 533
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 534
    .line 535
    .line 536
    move-result-object v6

    .line 537
    check-cast v6, Landroid/view/ViewGroup;

    .line 538
    .line 539
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object v6

    .line 543
    check-cast v6, Landroid/widget/LinearLayout;

    .line 544
    .line 545
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G:Landroid/widget/LinearLayout;

    .line 546
    .line 547
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 548
    .line 549
    .line 550
    move-result-object v6

    .line 551
    check-cast v6, Landroid/view/ViewGroup;

    .line 552
    .line 553
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 554
    .line 555
    .line 556
    move-result-object v6

    .line 557
    check-cast v6, Landroid/view/ViewGroup;

    .line 558
    .line 559
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 560
    .line 561
    .line 562
    move-result-object v6

    .line 563
    check-cast v6, Landroid/view/ViewGroup;

    .line 564
    .line 565
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 566
    .line 567
    .line 568
    move-result-object v6

    .line 569
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 570
    .line 571
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 572
    .line 573
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 574
    .line 575
    .line 576
    move-result-object v6

    .line 577
    check-cast v6, Landroid/view/ViewGroup;

    .line 578
    .line 579
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 580
    .line 581
    .line 582
    move-result-object v6

    .line 583
    check-cast v6, Landroid/view/ViewGroup;

    .line 584
    .line 585
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    check-cast v0, Landroid/view/ViewGroup;

    .line 590
    .line 591
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    check-cast v0, Lv/VImage;

    .line 596
    .line 597
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 598
    .line 599
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    check-cast v0, Landroid/view/ViewGroup;

    .line 604
    .line 605
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    check-cast v0, Landroid/view/ViewGroup;

    .line 610
    .line 611
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 616
    .line 617
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J:Landroidx/recyclerview/widget/RecyclerView;

    .line 618
    .line 619
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    check-cast v0, Landroid/view/ViewGroup;

    .line 624
    .line 625
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    check-cast v0, Landroid/view/ViewGroup;

    .line 630
    .line 631
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 636
    .line 637
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 638
    .line 639
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    check-cast v0, Landroid/view/ViewGroup;

    .line 644
    .line 645
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object v0

    .line 649
    check-cast v0, Landroid/view/ViewGroup;

    .line 650
    .line 651
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    check-cast v0, Lv/VText;

    .line 656
    .line 657
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->L:Lv/VText;

    .line 658
    .line 659
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 660
    .line 661
    .line 662
    move-result-object v0

    .line 663
    check-cast v0, Landroid/view/ViewGroup;

    .line 664
    .line 665
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 666
    .line 667
    .line 668
    move-result-object v0

    .line 669
    check-cast v0, Landroid/view/ViewGroup;

    .line 670
    .line 671
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 672
    .line 673
    .line 674
    move-result-object v0

    .line 675
    check-cast v0, Lv/VDraweeView;

    .line 676
    .line 677
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->M:Lv/VDraweeView;

    .line 678
    .line 679
    const/16 v0, 0x9

    .line 680
    .line 681
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 686
    .line 687
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->N:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 688
    .line 689
    const/16 v0, 0xa

    .line 690
    .line 691
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 692
    .line 693
    .line 694
    move-result-object v0

    .line 695
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 696
    .line 697
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->O:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 698
    .line 699
    const/16 v0, 0xb

    .line 700
    .line 701
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 702
    .line 703
    .line 704
    move-result-object v0

    .line 705
    check-cast v0, Lv/VButton;

    .line 706
    .line 707
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P:Lv/VButton;

    .line 708
    .line 709
    const/16 v0, 0xc

    .line 710
    .line 711
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 712
    .line 713
    .line 714
    move-result-object v0

    .line 715
    check-cast v0, Lv/VText;

    .line 716
    .line 717
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 718
    .line 719
    const/16 v0, 0xd

    .line 720
    .line 721
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 722
    .line 723
    .line 724
    move-result-object v0

    .line 725
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 726
    .line 727
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 728
    .line 729
    const/16 v0, 0xe

    .line 730
    .line 731
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 732
    .line 733
    .line 734
    move-result-object p1

    .line 735
    check-cast p1, Lv/VImage;

    .line 736
    .line 737
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 738
    .line 739
    return-void
.end method
