.class public Ll/zil0;
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

.method public static a(Ll/yil0;Landroid/view/View;)V
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
    check-cast v1, Landroid/view/SurfaceView;

    .line 9
    .line 10
    iput-object v1, p0, Ll/yil0;->a:Landroid/view/SurfaceView;

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, p0, Ll/yil0;->b:Landroid/view/View;

    .line 18
    .line 19
    const/4 v2, 0x4

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iput-object v3, p0, Ll/yil0;->c:Landroid/view/View;

    .line 25
    .line 26
    const/4 v3, 0x5

    .line 27
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Landroid/view/ViewStub;

    .line 32
    .line 33
    iput-object v3, p0, Ll/yil0;->d:Landroid/view/ViewStub;

    .line 34
    .line 35
    const/4 v3, 0x6

    .line 36
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 41
    .line 42
    iput-object v3, p0, Ll/yil0;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 43
    .line 44
    const/4 v3, 0x7

    .line 45
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Landroid/widget/FrameLayout;

    .line 50
    .line 51
    iput-object v4, p0, Ll/yil0;->f:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Landroid/widget/FrameLayout;

    .line 64
    .line 65
    iput-object v4, p0, Ll/yil0;->g:Landroid/widget/FrameLayout;

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Landroid/view/ViewGroup;

    .line 72
    .line 73
    const/4 v4, 0x1

    .line 74
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Landroid/widget/TextView;

    .line 79
    .line 80
    iput-object v3, p0, Ll/yil0;->h:Landroid/widget/TextView;

    .line 81
    .line 82
    const/16 v3, 0x8

    .line 83
    .line 84
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Landroid/widget/TextView;

    .line 89
    .line 90
    iput-object v3, p0, Ll/yil0;->i:Landroid/widget/TextView;

    .line 91
    .line 92
    const/16 v3, 0x9

    .line 93
    .line 94
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Landroid/widget/ImageView;

    .line 99
    .line 100
    iput-object v3, p0, Ll/yil0;->j:Landroid/widget/ImageView;

    .line 101
    .line 102
    const/16 v3, 0xa

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Landroid/widget/TextView;

    .line 109
    .line 110
    iput-object v3, p0, Ll/yil0;->k:Landroid/widget/TextView;

    .line 111
    .line 112
    const/16 v3, 0xb

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Landroid/widget/FrameLayout;

    .line 119
    .line 120
    iput-object v5, p0, Ll/yil0;->l:Landroid/widget/FrameLayout;

    .line 121
    .line 122
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    check-cast v5, Landroid/view/ViewGroup;

    .line 127
    .line 128
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    iput-object v5, p0, Ll/yil0;->m:Landroid/view/View;

    .line 133
    .line 134
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    check-cast v5, Landroid/view/ViewGroup;

    .line 139
    .line 140
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    check-cast v5, Landroid/widget/LinearLayout;

    .line 145
    .line 146
    iput-object v5, p0, Ll/yil0;->n:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    check-cast v5, Landroid/view/ViewGroup;

    .line 153
    .line 154
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    check-cast v5, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    check-cast v5, Landroid/widget/TextView;

    .line 165
    .line 166
    iput-object v5, p0, Ll/yil0;->o:Landroid/widget/TextView;

    .line 167
    .line 168
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    check-cast v5, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    check-cast v5, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    check-cast v5, Landroid/widget/TextView;

    .line 185
    .line 186
    iput-object v5, p0, Ll/yil0;->p:Landroid/widget/TextView;

    .line 187
    .line 188
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    check-cast v5, Landroid/view/ViewGroup;

    .line 193
    .line 194
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    check-cast v5, Landroid/view/ViewGroup;

    .line 199
    .line 200
    const/4 v6, 0x2

    .line 201
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    check-cast v5, Landroid/widget/TextView;

    .line 206
    .line 207
    iput-object v5, p0, Ll/yil0;->q:Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    check-cast v5, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    check-cast v5, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Landroid/widget/TextView;

    .line 226
    .line 227
    iput-object v1, p0, Ll/yil0;->r:Landroid/widget/TextView;

    .line 228
    .line 229
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    check-cast v1, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/widget/TextView;

    .line 246
    .line 247
    iput-object v1, p0, Ll/yil0;->s:Landroid/widget/TextView;

    .line 248
    .line 249
    const/16 v1, 0xc

    .line 250
    .line 251
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    check-cast v1, Landroid/widget/TextView;

    .line 256
    .line 257
    iput-object v1, p0, Ll/yil0;->t:Landroid/widget/TextView;

    .line 258
    .line 259
    const/16 v1, 0xd

    .line 260
    .line 261
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/VideoRecordProgressView;

    .line 266
    .line 267
    iput-object v1, p0, Ll/yil0;->u:Lcom/p1/mobile/putong/feed/newui/camera/widget/VideoRecordProgressView;

    .line 268
    .line 269
    const/16 v1, 0xe

    .line 270
    .line 271
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    check-cast v1, Landroid/widget/ImageView;

    .line 276
    .line 277
    iput-object v1, p0, Ll/yil0;->v:Landroid/widget/ImageView;

    .line 278
    .line 279
    const/16 v1, 0xf

    .line 280
    .line 281
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    check-cast v2, Landroid/widget/LinearLayout;

    .line 286
    .line 287
    iput-object v2, p0, Ll/yil0;->w:Landroid/widget/LinearLayout;

    .line 288
    .line 289
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v2, Landroid/widget/ImageView;

    .line 300
    .line 301
    iput-object v2, p0, Ll/yil0;->x:Landroid/widget/ImageView;

    .line 302
    .line 303
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    check-cast v1, Landroid/view/ViewGroup;

    .line 308
    .line 309
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    check-cast v1, Landroid/widget/TextView;

    .line 314
    .line 315
    iput-object v1, p0, Ll/yil0;->y:Landroid/widget/TextView;

    .line 316
    .line 317
    const/16 v1, 0x10

    .line 318
    .line 319
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Landroid/widget/LinearLayout;

    .line 324
    .line 325
    iput-object v2, p0, Ll/yil0;->z:Landroid/widget/LinearLayout;

    .line 326
    .line 327
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    check-cast v1, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    check-cast v1, Landroid/widget/TextView;

    .line 338
    .line 339
    iput-object v1, p0, Ll/yil0;->A:Landroid/widget/TextView;

    .line 340
    .line 341
    const/16 v1, 0x11

    .line 342
    .line 343
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    check-cast v2, Landroid/widget/LinearLayout;

    .line 348
    .line 349
    iput-object v2, p0, Ll/yil0;->B:Landroid/widget/LinearLayout;

    .line 350
    .line 351
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    check-cast v2, Landroid/view/ViewGroup;

    .line 356
    .line 357
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 362
    .line 363
    iput-object v2, p0, Ll/yil0;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 364
    .line 365
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    check-cast v2, Landroid/view/ViewGroup;

    .line 370
    .line 371
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 372
    .line 373
    .line 374
    move-result-object v2

    .line 375
    check-cast v2, Landroid/view/ViewGroup;

    .line 376
    .line 377
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 382
    .line 383
    iput-object v2, p0, Ll/yil0;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 384
    .line 385
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    check-cast v2, Landroid/view/ViewGroup;

    .line 390
    .line 391
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    check-cast v2, Landroid/view/ViewGroup;

    .line 396
    .line 397
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v2

    .line 401
    check-cast v2, Landroid/widget/LinearLayout;

    .line 402
    .line 403
    iput-object v2, p0, Ll/yil0;->E:Landroid/widget/LinearLayout;

    .line 404
    .line 405
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    check-cast v2, Landroid/view/ViewGroup;

    .line 410
    .line 411
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    check-cast v2, Landroid/view/ViewGroup;

    .line 416
    .line 417
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    check-cast v2, Landroid/view/ViewGroup;

    .line 422
    .line 423
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 428
    .line 429
    iput-object v2, p0, Ll/yil0;->F:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 430
    .line 431
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    check-cast v2, Landroid/view/ViewGroup;

    .line 436
    .line 437
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    check-cast v2, Landroid/view/ViewGroup;

    .line 442
    .line 443
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    check-cast v2, Landroid/view/ViewGroup;

    .line 448
    .line 449
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 454
    .line 455
    iput-object v2, p0, Ll/yil0;->G:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 456
    .line 457
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 458
    .line 459
    .line 460
    move-result-object v2

    .line 461
    check-cast v2, Landroid/view/ViewGroup;

    .line 462
    .line 463
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v2

    .line 467
    check-cast v2, Landroid/view/ViewGroup;

    .line 468
    .line 469
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 470
    .line 471
    .line 472
    move-result-object v2

    .line 473
    check-cast v2, Landroid/view/ViewGroup;

    .line 474
    .line 475
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 476
    .line 477
    .line 478
    move-result-object v2

    .line 479
    check-cast v2, Landroid/view/ViewGroup;

    .line 480
    .line 481
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 482
    .line 483
    .line 484
    move-result-object v2

    .line 485
    check-cast v2, Landroid/view/ViewGroup;

    .line 486
    .line 487
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v2

    .line 491
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 492
    .line 493
    iput-object v2, p0, Ll/yil0;->H:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 494
    .line 495
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    check-cast v2, Landroid/view/ViewGroup;

    .line 500
    .line 501
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 502
    .line 503
    .line 504
    move-result-object v2

    .line 505
    check-cast v2, Landroid/view/ViewGroup;

    .line 506
    .line 507
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    check-cast v2, Landroid/view/ViewGroup;

    .line 512
    .line 513
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 514
    .line 515
    .line 516
    move-result-object v2

    .line 517
    check-cast v2, Landroid/view/ViewGroup;

    .line 518
    .line 519
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 520
    .line 521
    .line 522
    move-result-object v2

    .line 523
    check-cast v2, Landroid/view/ViewGroup;

    .line 524
    .line 525
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 526
    .line 527
    .line 528
    move-result-object v2

    .line 529
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 530
    .line 531
    iput-object v2, p0, Ll/yil0;->I:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 532
    .line 533
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    check-cast v1, Landroid/view/ViewGroup;

    .line 538
    .line 539
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    check-cast v1, Landroid/view/ViewGroup;

    .line 544
    .line 545
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 546
    .line 547
    .line 548
    move-result-object v1

    .line 549
    check-cast v1, Landroid/view/ViewGroup;

    .line 550
    .line 551
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 552
    .line 553
    .line 554
    move-result-object v1

    .line 555
    check-cast v1, Landroid/view/ViewGroup;

    .line 556
    .line 557
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 558
    .line 559
    .line 560
    move-result-object v1

    .line 561
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 562
    .line 563
    iput-object v1, p0, Ll/yil0;->J:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 564
    .line 565
    const/16 v1, 0x12

    .line 566
    .line 567
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    check-cast v1, Landroid/widget/TextView;

    .line 572
    .line 573
    iput-object v1, p0, Ll/yil0;->K:Landroid/widget/TextView;

    .line 574
    .line 575
    const/16 v1, 0x13

    .line 576
    .line 577
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;

    .line 582
    .line 583
    iput-object v1, p0, Ll/yil0;->L:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;

    .line 584
    .line 585
    const/16 v1, 0x14

    .line 586
    .line 587
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;

    .line 592
    .line 593
    iput-object v1, p0, Ll/yil0;->M:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;

    .line 594
    .line 595
    const/16 v1, 0x15

    .line 596
    .line 597
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 598
    .line 599
    .line 600
    move-result-object v1

    .line 601
    check-cast v1, Landroid/view/ViewStub;

    .line 602
    .line 603
    iput-object v1, p0, Ll/yil0;->N:Landroid/view/ViewStub;

    .line 604
    .line 605
    const/16 v1, 0x16

    .line 606
    .line 607
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 608
    .line 609
    .line 610
    move-result-object v1

    .line 611
    check-cast v1, Landroid/view/ViewStub;

    .line 612
    .line 613
    iput-object v1, p0, Ll/yil0;->O:Landroid/view/ViewStub;

    .line 614
    .line 615
    const/16 v1, 0x17

    .line 616
    .line 617
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 618
    .line 619
    .line 620
    move-result-object v1

    .line 621
    check-cast v1, Landroid/view/ViewStub;

    .line 622
    .line 623
    iput-object v1, p0, Ll/yil0;->P:Landroid/view/ViewStub;

    .line 624
    .line 625
    const/16 v1, 0x18

    .line 626
    .line 627
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 628
    .line 629
    .line 630
    move-result-object v1

    .line 631
    check-cast v1, Landroid/view/ViewStub;

    .line 632
    .line 633
    iput-object v1, p0, Ll/yil0;->Q:Landroid/view/ViewStub;

    .line 634
    .line 635
    const/16 v1, 0x19

    .line 636
    .line 637
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object v1

    .line 641
    check-cast v1, Landroid/view/ViewStub;

    .line 642
    .line 643
    iput-object v1, p0, Ll/yil0;->R:Landroid/view/ViewStub;

    .line 644
    .line 645
    const/16 v1, 0x1a

    .line 646
    .line 647
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 648
    .line 649
    .line 650
    move-result-object v1

    .line 651
    check-cast v1, Landroid/view/ViewStub;

    .line 652
    .line 653
    iput-object v1, p0, Ll/yil0;->S:Landroid/view/ViewStub;

    .line 654
    .line 655
    const/16 v1, 0x1b

    .line 656
    .line 657
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 658
    .line 659
    .line 660
    move-result-object v2

    .line 661
    check-cast v2, Landroid/view/ViewGroup;

    .line 662
    .line 663
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 664
    .line 665
    .line 666
    move-result-object v2

    .line 667
    check-cast v2, Landroid/widget/LinearLayout;

    .line 668
    .line 669
    iput-object v2, p0, Ll/yil0;->T:Landroid/widget/LinearLayout;

    .line 670
    .line 671
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 672
    .line 673
    .line 674
    move-result-object v2

    .line 675
    check-cast v2, Landroid/view/ViewGroup;

    .line 676
    .line 677
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    check-cast v2, Landroid/view/ViewGroup;

    .line 682
    .line 683
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 684
    .line 685
    .line 686
    move-result-object v2

    .line 687
    check-cast v2, Lv/VText;

    .line 688
    .line 689
    iput-object v2, p0, Ll/yil0;->U:Lv/VText;

    .line 690
    .line 691
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 692
    .line 693
    .line 694
    move-result-object p1

    .line 695
    check-cast p1, Landroid/view/ViewGroup;

    .line 696
    .line 697
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 698
    .line 699
    .line 700
    move-result-object p1

    .line 701
    check-cast p1, Landroid/view/ViewGroup;

    .line 702
    .line 703
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 704
    .line 705
    .line 706
    move-result-object p1

    .line 707
    check-cast p1, Lv/VText;

    .line 708
    .line 709
    iput-object p1, p0, Ll/yil0;->V:Lv/VText;

    .line 710
    .line 711
    return-void
.end method

.method public static b(Ll/yil0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->V3:I

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
    invoke-static {p0, p1}, Ll/zil0;->a(Ll/yil0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
