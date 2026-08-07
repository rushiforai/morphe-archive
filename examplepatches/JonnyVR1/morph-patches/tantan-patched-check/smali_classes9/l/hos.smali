.class public Ll/hos;
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

.method public static a(Ll/gos;Landroid/view/View;)V
    .locals 12

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
    iput-object v1, p0, Ll/gos;->l:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iput-object v2, p0, Ll/gos;->m:Landroid/view/View;

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lv/VDraweeView;

    .line 23
    .line 24
    iput-object v3, p0, Ll/gos;->n:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Landroid/widget/TextView;

    .line 32
    .line 33
    iput-object v4, p0, Ll/gos;->o:Landroid/widget/TextView;

    .line 34
    .line 35
    const/4 v4, 0x4

    .line 36
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    check-cast v5, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object v5, p0, Ll/gos;->p:Lv/VDraweeView;

    .line 43
    .line 44
    const/4 v5, 0x5

    .line 45
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    check-cast v6, Lv/VDraweeView;

    .line 50
    .line 51
    iput-object v6, p0, Ll/gos;->q:Lv/VDraweeView;

    .line 52
    .line 53
    const/4 v6, 0x6

    .line 54
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    check-cast v7, Lcom/tantan/library/svga/SVGAnimationView;

    .line 59
    .line 60
    iput-object v7, p0, Ll/gos;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 61
    .line 62
    const/4 v7, 0x7

    .line 63
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    check-cast v8, Lv/VImage;

    .line 68
    .line 69
    iput-object v8, p0, Ll/gos;->s:Lv/VImage;

    .line 70
    .line 71
    const/16 v8, 0x8

    .line 72
    .line 73
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    check-cast v9, Lv/VDraweeView;

    .line 78
    .line 79
    iput-object v9, p0, Ll/gos;->t:Lv/VDraweeView;

    .line 80
    .line 81
    const/16 v9, 0x9

    .line 82
    .line 83
    invoke-virtual {p1, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v10

    .line 87
    check-cast v10, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 88
    .line 89
    iput-object v10, p0, Ll/gos;->u:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 90
    .line 91
    const/16 v10, 0xa

    .line 92
    .line 93
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    check-cast v10, Landroid/widget/TextView;

    .line 98
    .line 99
    iput-object v10, p0, Ll/gos;->v:Landroid/widget/TextView;

    .line 100
    .line 101
    const/16 v10, 0xb

    .line 102
    .line 103
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v11

    .line 107
    check-cast v11, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 108
    .line 109
    iput-object v11, p0, Ll/gos;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 110
    .line 111
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v11

    .line 115
    check-cast v11, Landroid/view/ViewGroup;

    .line 116
    .line 117
    invoke-virtual {v11, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    check-cast v11, Lv/VDraweeView;

    .line 122
    .line 123
    iput-object v11, p0, Ll/gos;->x:Lv/VDraweeView;

    .line 124
    .line 125
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v11

    .line 129
    check-cast v11, Landroid/view/ViewGroup;

    .line 130
    .line 131
    invoke-virtual {v11, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    check-cast v11, Landroid/widget/TextView;

    .line 136
    .line 137
    iput-object v11, p0, Ll/gos;->y:Landroid/widget/TextView;

    .line 138
    .line 139
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v11

    .line 143
    check-cast v11, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v11

    .line 149
    check-cast v11, Landroid/widget/TextView;

    .line 150
    .line 151
    iput-object v11, p0, Ll/gos;->z:Landroid/widget/TextView;

    .line 152
    .line 153
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v11

    .line 157
    check-cast v11, Landroid/view/ViewGroup;

    .line 158
    .line 159
    invoke-virtual {v11, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v11

    .line 163
    iput-object v11, p0, Ll/gos;->A:Landroid/view/View;

    .line 164
    .line 165
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v11

    .line 169
    check-cast v11, Landroid/view/ViewGroup;

    .line 170
    .line 171
    invoke-virtual {v11, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v11

    .line 175
    check-cast v11, Landroid/widget/TextView;

    .line 176
    .line 177
    iput-object v11, p0, Ll/gos;->B:Landroid/widget/TextView;

    .line 178
    .line 179
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v11

    .line 183
    check-cast v11, Landroid/view/ViewGroup;

    .line 184
    .line 185
    invoke-virtual {v11, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v11

    .line 189
    check-cast v11, Lv/VDraweeView;

    .line 190
    .line 191
    iput-object v11, p0, Ll/gos;->C:Lv/VDraweeView;

    .line 192
    .line 193
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v11

    .line 197
    check-cast v11, Landroid/view/ViewGroup;

    .line 198
    .line 199
    invoke-virtual {v11, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v11

    .line 203
    check-cast v11, Lv/VDraweeView;

    .line 204
    .line 205
    iput-object v11, p0, Ll/gos;->D:Lv/VDraweeView;

    .line 206
    .line 207
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v11

    .line 211
    check-cast v11, Landroid/view/ViewGroup;

    .line 212
    .line 213
    invoke-virtual {v11, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v7

    .line 217
    check-cast v7, Lv/VDraweeView;

    .line 218
    .line 219
    iput-object v7, p0, Ll/gos;->E:Lv/VDraweeView;

    .line 220
    .line 221
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v7

    .line 225
    check-cast v7, Landroid/view/ViewGroup;

    .line 226
    .line 227
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    check-cast v7, Lv/VDraweeView;

    .line 232
    .line 233
    iput-object v7, p0, Ll/gos;->F:Lv/VDraweeView;

    .line 234
    .line 235
    invoke-virtual {p1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    check-cast v7, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v7, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    check-cast v7, Lv/VDraweeView;

    .line 246
    .line 247
    iput-object v7, p0, Ll/gos;->G:Lv/VDraweeView;

    .line 248
    .line 249
    const/16 v7, 0xc

    .line 250
    .line 251
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 256
    .line 257
    iput-object v8, p0, Ll/gos;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 258
    .line 259
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v8

    .line 263
    check-cast v8, Landroid/view/ViewGroup;

    .line 264
    .line 265
    invoke-virtual {v8, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Landroid/widget/TextView;

    .line 270
    .line 271
    iput-object v0, p0, Ll/gos;->I:Landroid/widget/TextView;

    .line 272
    .line 273
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    check-cast v0, Landroid/view/ViewGroup;

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iput-object v0, p0, Ll/gos;->J:Landroid/view/View;

    .line 284
    .line 285
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Landroid/view/ViewGroup;

    .line 290
    .line 291
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    check-cast v0, Lv/VDraweeView;

    .line 296
    .line 297
    iput-object v0, p0, Ll/gos;->K:Lv/VDraweeView;

    .line 298
    .line 299
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Landroid/view/ViewGroup;

    .line 304
    .line 305
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    check-cast v0, Lv/VDraweeView;

    .line 310
    .line 311
    iput-object v0, p0, Ll/gos;->L:Lv/VDraweeView;

    .line 312
    .line 313
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    check-cast v0, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    check-cast v0, Lv/VDraweeView;

    .line 324
    .line 325
    iput-object v0, p0, Ll/gos;->M:Lv/VDraweeView;

    .line 326
    .line 327
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    check-cast v0, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    check-cast v0, Lv/VDraweeView;

    .line 338
    .line 339
    iput-object v0, p0, Ll/gos;->N:Lv/VDraweeView;

    .line 340
    .line 341
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    check-cast v0, Landroid/view/ViewGroup;

    .line 346
    .line 347
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    check-cast v0, Lv/VDraweeView;

    .line 352
    .line 353
    iput-object v0, p0, Ll/gos;->O:Lv/VDraweeView;

    .line 354
    .line 355
    const/16 v0, 0xd

    .line 356
    .line 357
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    check-cast v0, Landroid/widget/TextView;

    .line 362
    .line 363
    iput-object v0, p0, Ll/gos;->P:Landroid/widget/TextView;

    .line 364
    .line 365
    const/16 v0, 0xe

    .line 366
    .line 367
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 372
    .line 373
    iput-object v0, p0, Ll/gos;->Q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 374
    .line 375
    const/16 v0, 0xf

    .line 376
    .line 377
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 382
    .line 383
    iput-object v0, p0, Ll/gos;->R:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 384
    .line 385
    const/16 v0, 0x10

    .line 386
    .line 387
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 392
    .line 393
    iput-object v0, p0, Ll/gos;->S:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;

    .line 394
    .line 395
    const/16 v0, 0x11

    .line 396
    .line 397
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Landroid/widget/TextView;

    .line 402
    .line 403
    iput-object v0, p0, Ll/gos;->T:Landroid/widget/TextView;

    .line 404
    .line 405
    const/16 v0, 0x12

    .line 406
    .line 407
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 408
    .line 409
    .line 410
    move-result-object p1

    .line 411
    check-cast p1, Landroid/widget/TextView;

    .line 412
    .line 413
    iput-object p1, p0, Ll/gos;->U:Landroid/widget/TextView;

    .line 414
    .line 415
    return-void
.end method
