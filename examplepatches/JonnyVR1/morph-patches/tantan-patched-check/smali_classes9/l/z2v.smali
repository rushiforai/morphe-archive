.class public Ll/z2v;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/TextView;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VPager;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Lv/VPager;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

.field public p:Lv/VText;

.field public q:Landroid/view/View;

.field public r:Lv/VDraweeView;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/widget/TextView;

.field public u:Lv/VDraweeView;

.field public v:Landroid/widget/TextView;

.field public w:Landroid/widget/TextView;

.field public x:Lv/VDraweeView;

.field public y:Landroid/widget/TextView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->y7:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/z2v;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lv/VLinear;

    .line 3
    .line 4
    iput-object v0, p0, Ll/z2v;->e:Lv/VLinear;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/VImage;

    .line 18
    .line 19
    iput-object v1, p0, Ll/z2v;->f:Lv/VImage;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    const-string v1, "_back"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/view/ViewGroup;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lv/VText;

    .line 39
    .line 40
    iput-object v2, p0, Ll/z2v;->g:Lv/VText;

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    const-string v1, "_normal_title"

    .line 45
    .line 46
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v4, 0x2

    .line 53
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lv/VText;

    .line 58
    .line 59
    iput-object v2, p0, Ll/z2v;->h:Lv/VText;

    .line 60
    .line 61
    if-nez v2, :cond_2

    .line 62
    .line 63
    const-string v1, "_special_title"

    .line 64
    .line 65
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Landroid/view/ViewGroup;

    .line 70
    .line 71
    const/4 v5, 0x3

    .line 72
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lv/VText;

    .line 77
    .line 78
    iput-object v2, p0, Ll/z2v;->i:Lv/VText;

    .line 79
    .line 80
    if-nez v2, :cond_3

    .line 81
    .line 82
    const-string v1, "_special_title_tag"

    .line 83
    .line 84
    :cond_3
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iput-object v2, p0, Ll/z2v;->j:Landroid/view/View;

    .line 89
    .line 90
    if-nez v2, :cond_4

    .line 91
    .line 92
    const-string v1, "_divider"

    .line 93
    .line 94
    :cond_4
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Lv/VPager;

    .line 99
    .line 100
    iput-object v2, p0, Ll/z2v;->k:Lv/VPager;

    .line 101
    .line 102
    if-nez v2, :cond_5

    .line 103
    .line 104
    const-string v1, "_relation_pager"

    .line 105
    .line 106
    :cond_5
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 111
    .line 112
    iput-object v2, p0, Ll/z2v;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 113
    .line 114
    if-nez v2, :cond_6

    .line 115
    .line 116
    const-string v1, "_relation_indicator"

    .line 117
    .line 118
    :cond_6
    const/4 v2, 0x4

    .line 119
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 124
    .line 125
    iput-object v6, p0, Ll/z2v;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 126
    .line 127
    if-nez v6, :cond_7

    .line 128
    .line 129
    const-string v1, "_special_content"

    .line 130
    .line 131
    :cond_7
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    check-cast v6, Landroid/view/ViewGroup;

    .line 136
    .line 137
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lv/VPager;

    .line 142
    .line 143
    iput-object v0, p0, Ll/z2v;->n:Lv/VPager;

    .line 144
    .line 145
    if-nez v0, :cond_8

    .line 146
    .line 147
    const-string v1, "_special_relation_pager"

    .line 148
    .line 149
    :cond_8
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Landroid/view/ViewGroup;

    .line 154
    .line 155
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 160
    .line 161
    iput-object v0, p0, Ll/z2v;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 162
    .line 163
    if-nez v0, :cond_9

    .line 164
    .line 165
    const-string v1, "_special_relation_indicator"

    .line 166
    .line 167
    :cond_9
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Landroid/view/ViewGroup;

    .line 172
    .line 173
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lv/VText;

    .line 178
    .line 179
    iput-object v0, p0, Ll/z2v;->p:Lv/VText;

    .line 180
    .line 181
    if-nez v0, :cond_a

    .line 182
    .line 183
    const-string v1, "_special_des_title"

    .line 184
    .line 185
    :cond_a
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    check-cast v0, Landroid/view/ViewGroup;

    .line 190
    .line 191
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Ll/z2v;->q:Landroid/view/View;

    .line 196
    .line 197
    if-nez v0, :cond_b

    .line 198
    .line 199
    const-string v1, "_right_content"

    .line 200
    .line 201
    :cond_b
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Landroid/view/ViewGroup;

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, Lv/VDraweeView;

    .line 212
    .line 213
    iput-object v0, p0, Ll/z2v;->r:Lv/VDraweeView;

    .line 214
    .line 215
    if-nez v0, :cond_c

    .line 216
    .line 217
    const-string v1, "_icon1"

    .line 218
    .line 219
    :cond_c
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    check-cast v0, Landroid/view/ViewGroup;

    .line 224
    .line 225
    const/4 v3, 0x5

    .line 226
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    check-cast v0, Landroid/widget/TextView;

    .line 231
    .line 232
    iput-object v0, p0, Ll/z2v;->s:Landroid/widget/TextView;

    .line 233
    .line 234
    if-nez v0, :cond_d

    .line 235
    .line 236
    const-string v1, "_title1"

    .line 237
    .line 238
    :cond_d
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Landroid/view/ViewGroup;

    .line 243
    .line 244
    const/4 v4, 0x6

    .line 245
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    check-cast v0, Landroid/widget/TextView;

    .line 250
    .line 251
    iput-object v0, p0, Ll/z2v;->t:Landroid/widget/TextView;

    .line 252
    .line 253
    if-nez v0, :cond_e

    .line 254
    .line 255
    const-string v1, "_sub_title1"

    .line 256
    .line 257
    :cond_e
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Landroid/view/ViewGroup;

    .line 262
    .line 263
    const/4 v5, 0x7

    .line 264
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    check-cast v0, Lv/VDraweeView;

    .line 269
    .line 270
    iput-object v0, p0, Ll/z2v;->u:Lv/VDraweeView;

    .line 271
    .line 272
    if-nez v0, :cond_f

    .line 273
    .line 274
    const-string v1, "_icon2"

    .line 275
    .line 276
    :cond_f
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    check-cast v0, Landroid/view/ViewGroup;

    .line 281
    .line 282
    const/16 v5, 0x8

    .line 283
    .line 284
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    check-cast v0, Landroid/widget/TextView;

    .line 289
    .line 290
    iput-object v0, p0, Ll/z2v;->v:Landroid/widget/TextView;

    .line 291
    .line 292
    if-nez v0, :cond_10

    .line 293
    .line 294
    const-string v1, "_title2"

    .line 295
    .line 296
    :cond_10
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Landroid/view/ViewGroup;

    .line 301
    .line 302
    const/16 v5, 0x9

    .line 303
    .line 304
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    check-cast v0, Landroid/widget/TextView;

    .line 309
    .line 310
    iput-object v0, p0, Ll/z2v;->w:Landroid/widget/TextView;

    .line 311
    .line 312
    if-nez v0, :cond_11

    .line 313
    .line 314
    const-string v1, "_sub_title2"

    .line 315
    .line 316
    :cond_11
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    check-cast v0, Landroid/view/ViewGroup;

    .line 321
    .line 322
    const/16 v5, 0xa

    .line 323
    .line 324
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    check-cast v0, Lv/VDraweeView;

    .line 329
    .line 330
    iput-object v0, p0, Ll/z2v;->x:Lv/VDraweeView;

    .line 331
    .line 332
    if-nez v0, :cond_12

    .line 333
    .line 334
    const-string v1, "_icon3"

    .line 335
    .line 336
    :cond_12
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    check-cast v0, Landroid/view/ViewGroup;

    .line 341
    .line 342
    const/16 v5, 0xb

    .line 343
    .line 344
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    check-cast v0, Landroid/widget/TextView;

    .line 349
    .line 350
    iput-object v0, p0, Ll/z2v;->y:Landroid/widget/TextView;

    .line 351
    .line 352
    if-nez v0, :cond_13

    .line 353
    .line 354
    const-string v1, "_title3"

    .line 355
    .line 356
    :cond_13
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    check-cast v0, Landroid/view/ViewGroup;

    .line 361
    .line 362
    const/16 v5, 0xc

    .line 363
    .line 364
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    check-cast v0, Landroid/widget/TextView;

    .line 369
    .line 370
    iput-object v0, p0, Ll/z2v;->z:Landroid/widget/TextView;

    .line 371
    .line 372
    if-nez v0, :cond_14

    .line 373
    .line 374
    const-string v1, "_sub_title3"

    .line 375
    .line 376
    :cond_14
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    check-cast v0, Landroid/view/ViewGroup;

    .line 381
    .line 382
    const/16 v5, 0xd

    .line 383
    .line 384
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    check-cast v0, Lv/VDraweeView;

    .line 389
    .line 390
    iput-object v0, p0, Ll/z2v;->A:Lv/VDraweeView;

    .line 391
    .line 392
    if-nez v0, :cond_15

    .line 393
    .line 394
    const-string v1, "_icon4"

    .line 395
    .line 396
    :cond_15
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    check-cast v0, Landroid/view/ViewGroup;

    .line 401
    .line 402
    const/16 v5, 0xe

    .line 403
    .line 404
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    check-cast v0, Landroid/widget/TextView;

    .line 409
    .line 410
    iput-object v0, p0, Ll/z2v;->B:Landroid/widget/TextView;

    .line 411
    .line 412
    if-nez v0, :cond_16

    .line 413
    .line 414
    const-string v1, "_title4"

    .line 415
    .line 416
    :cond_16
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    check-cast v0, Landroid/view/ViewGroup;

    .line 421
    .line 422
    const/16 v2, 0xf

    .line 423
    .line 424
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    check-cast v0, Landroid/widget/TextView;

    .line 429
    .line 430
    iput-object v0, p0, Ll/z2v;->C:Landroid/widget/TextView;

    .line 431
    .line 432
    if-nez v0, :cond_17

    .line 433
    .line 434
    const-string v1, "_sub_title4"

    .line 435
    .line 436
    :cond_17
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    check-cast v0, Lv/VText;

    .line 441
    .line 442
    iput-object v0, p0, Ll/z2v;->D:Lv/VText;

    .line 443
    .line 444
    if-nez v0, :cond_18

    .line 445
    .line 446
    const-string v1, "_finish"

    .line 447
    .line 448
    :cond_18
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    check-cast p1, Lv/VText;

    .line 453
    .line 454
    iput-object p1, p0, Ll/z2v;->E:Lv/VText;

    .line 455
    .line 456
    if-nez p1, :cond_19

    .line 457
    .line 458
    const-string v1, "_info"

    .line 459
    .line 460
    :cond_19
    if-nez v1, :cond_1a

    .line 461
    .line 462
    return-void

    .line 463
    :cond_1a
    const-string p0, "Missing required view with ID:"

    .line 464
    .line 465
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object p0

    .line 469
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    return-void
.end method
