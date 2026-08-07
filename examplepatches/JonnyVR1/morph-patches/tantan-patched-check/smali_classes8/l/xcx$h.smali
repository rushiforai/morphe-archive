.class public Ll/xcx$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xcx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# direct methods
.method public static bridge synthetic a(Ll/xcx;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xcx$h;->c(Ll/xcx;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ll/xcx;Landroid/view/View;)V
    .locals 8

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/xcx;->m0(Ll/xcx;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/xcx;->G0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    invoke-static {p0, v2}, Ll/xcx;->o0(Ll/xcx;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/putong/core/view/HeartView;

    .line 40
    .line 41
    invoke-static {p0, v2}, Ll/xcx;->e0(Ll/xcx;Lcom/p1/mobile/putong/core/view/HeartView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/sunshine/engine/bone/StageView;

    .line 55
    .line 56
    invoke-static {p0, v2}, Ll/xcx;->z0(Ll/xcx;Lcom/sunshine/engine/bone/StageView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Landroid/view/ViewGroup;

    .line 64
    .line 65
    const/4 v3, 0x2

    .line 66
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lv/VText;

    .line 71
    .line 72
    invoke-static {p0, v2}, Ll/xcx;->u0(Ll/xcx;Lv/VText;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Landroid/view/ViewGroup;

    .line 80
    .line 81
    const/4 v4, 0x3

    .line 82
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-static {p0, v2}, Ll/xcx;->n0(Ll/xcx;Landroid/widget/TextView;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Landroid/view/ViewGroup;

    .line 96
    .line 97
    const/4 v5, 0x4

    .line 98
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Lv/VText;

    .line 103
    .line 104
    invoke-static {p0, v2}, Ll/xcx;->q0(Ll/xcx;Lv/VText;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Landroid/view/ViewGroup;

    .line 112
    .line 113
    const/4 v6, 0x5

    .line 114
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Landroid/widget/TextView;

    .line 119
    .line 120
    invoke-static {p0, v2}, Ll/xcx;->l0(Ll/xcx;Landroid/widget/TextView;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Landroid/view/ViewGroup;

    .line 128
    .line 129
    const/4 v6, 0x6

    .line 130
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Lv/VText;

    .line 135
    .line 136
    invoke-static {p0, v2}, Ll/xcx;->A0(Ll/xcx;Lv/VText;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Landroid/view/ViewGroup;

    .line 144
    .line 145
    const/4 v7, 0x7

    .line 146
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lv/VRelative;

    .line 151
    .line 152
    invoke-static {p0, v2}, Ll/xcx;->i0(Ll/xcx;Lv/VRelative;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Landroid/view/ViewGroup;

    .line 160
    .line 161
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Landroid/view/ViewGroup;

    .line 166
    .line 167
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    check-cast v2, Lv/VDraweeView;

    .line 172
    .line 173
    invoke-static {p0, v2}, Ll/xcx;->h0(Ll/xcx;Lv/VDraweeView;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Landroid/view/ViewGroup;

    .line 181
    .line 182
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    check-cast v2, Landroid/view/ViewGroup;

    .line 187
    .line 188
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 193
    .line 194
    invoke-static {p0, v2}, Ll/xcx;->E0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    check-cast v2, Landroid/view/ViewGroup;

    .line 202
    .line 203
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    check-cast v2, Landroid/view/ViewGroup;

    .line 208
    .line 209
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Lv/VImage;

    .line 214
    .line 215
    invoke-static {p0, v2}, Ll/xcx;->B0(Ll/xcx;Lv/VImage;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    check-cast v2, Landroid/view/ViewGroup;

    .line 223
    .line 224
    const/16 v7, 0x8

    .line 225
    .line 226
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    check-cast v2, Landroidx/constraintlayout/widget/Guideline;

    .line 231
    .line 232
    invoke-static {p0, v2}, Ll/xcx;->d0(Ll/xcx;Landroidx/constraintlayout/widget/Guideline;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Landroid/view/ViewGroup;

    .line 240
    .line 241
    const/16 v7, 0x9

    .line 242
    .line 243
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    check-cast v2, Lv/VRelative;

    .line 248
    .line 249
    invoke-static {p0, v2}, Ll/xcx;->k0(Ll/xcx;Lv/VRelative;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    check-cast v2, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    check-cast v2, Landroid/view/ViewGroup;

    .line 263
    .line 264
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    check-cast v2, Lv/VDraweeView;

    .line 269
    .line 270
    invoke-static {p0, v2}, Ll/xcx;->j0(Ll/xcx;Lv/VDraweeView;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    check-cast v2, Landroid/view/ViewGroup;

    .line 278
    .line 279
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Landroid/view/ViewGroup;

    .line 284
    .line 285
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    check-cast v2, Lv/VImage;

    .line 290
    .line 291
    invoke-static {p0, v2}, Ll/xcx;->D0(Ll/xcx;Lv/VImage;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    check-cast v2, Landroid/view/ViewGroup;

    .line 299
    .line 300
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    check-cast v2, Landroid/view/ViewGroup;

    .line 305
    .line 306
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    check-cast v2, Lv/VFrame;

    .line 311
    .line 312
    invoke-static {p0, v2}, Ll/xcx;->r0(Ll/xcx;Lv/VFrame;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    check-cast v2, Landroid/view/ViewGroup;

    .line 320
    .line 321
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    check-cast v2, Landroid/view/ViewGroup;

    .line 326
    .line 327
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v2, Lv/VIcon;

    .line 338
    .line 339
    invoke-static {p0, v2}, Ll/xcx;->t0(Ll/xcx;Lv/VIcon;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    check-cast v2, Landroid/view/ViewGroup;

    .line 347
    .line 348
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    check-cast v2, Landroid/view/ViewGroup;

    .line 353
    .line 354
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    check-cast v2, Landroid/view/ViewGroup;

    .line 359
    .line 360
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    check-cast v2, Lv/VIcon;

    .line 365
    .line 366
    invoke-static {p0, v2}, Ll/xcx;->s0(Ll/xcx;Lv/VIcon;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    check-cast v2, Landroid/view/ViewGroup;

    .line 374
    .line 375
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    check-cast v2, Landroid/view/ViewGroup;

    .line 380
    .line 381
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    invoke-static {p0, v2}, Ll/xcx;->p0(Ll/xcx;Landroid/view/View;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    check-cast v2, Landroid/view/ViewGroup;

    .line 393
    .line 394
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    check-cast v2, Landroid/view/ViewGroup;

    .line 399
    .line 400
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 401
    .line 402
    .line 403
    move-result-object v2

    .line 404
    check-cast v2, Lv/VImage;

    .line 405
    .line 406
    invoke-static {p0, v2}, Ll/xcx;->g0(Ll/xcx;Lv/VImage;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v2, Landroid/view/ViewGroup;

    .line 414
    .line 415
    const/16 v4, 0xa

    .line 416
    .line 417
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    check-cast v2, Lv/VRecyclerView;

    .line 422
    .line 423
    invoke-static {p0, v2}, Ll/xcx;->f0(Ll/xcx;Lv/VRecyclerView;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    check-cast v2, Landroid/view/ViewGroup;

    .line 431
    .line 432
    const/16 v4, 0xb

    .line 433
    .line 434
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v2

    .line 438
    check-cast v2, Landroid/widget/TextView;

    .line 439
    .line 440
    invoke-static {p0, v2}, Ll/xcx;->W(Ll/xcx;Landroid/widget/TextView;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    check-cast v2, Landroid/view/ViewGroup;

    .line 448
    .line 449
    const/16 v4, 0xc

    .line 450
    .line 451
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    check-cast v2, Landroid/widget/TextView;

    .line 456
    .line 457
    invoke-static {p0, v2}, Ll/xcx;->V(Ll/xcx;Landroid/widget/TextView;)V

    .line 458
    .line 459
    .line 460
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    check-cast v2, Landroid/view/ViewGroup;

    .line 465
    .line 466
    const/16 v4, 0xd

    .line 467
    .line 468
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    check-cast v2, Lv/VLinear;

    .line 473
    .line 474
    invoke-static {p0, v2}, Ll/xcx;->P(Ll/xcx;Lv/VLinear;)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 478
    .line 479
    .line 480
    move-result-object v2

    .line 481
    check-cast v2, Landroid/view/ViewGroup;

    .line 482
    .line 483
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 484
    .line 485
    .line 486
    move-result-object v2

    .line 487
    check-cast v2, Landroid/view/ViewGroup;

    .line 488
    .line 489
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 490
    .line 491
    .line 492
    move-result-object v2

    .line 493
    check-cast v2, Lv/VText;

    .line 494
    .line 495
    invoke-static {p0, v2}, Ll/xcx;->R(Ll/xcx;Lv/VText;)V

    .line 496
    .line 497
    .line 498
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    check-cast v2, Landroid/view/ViewGroup;

    .line 503
    .line 504
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 505
    .line 506
    .line 507
    move-result-object v2

    .line 508
    check-cast v2, Landroid/view/ViewGroup;

    .line 509
    .line 510
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    check-cast v2, Lv/VImage;

    .line 515
    .line 516
    invoke-static {p0, v2}, Ll/xcx;->Q(Ll/xcx;Lv/VImage;)V

    .line 517
    .line 518
    .line 519
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 520
    .line 521
    .line 522
    move-result-object v2

    .line 523
    check-cast v2, Landroid/view/ViewGroup;

    .line 524
    .line 525
    const/16 v4, 0xe

    .line 526
    .line 527
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 528
    .line 529
    .line 530
    move-result-object v2

    .line 531
    check-cast v2, Landroid/widget/LinearLayout;

    .line 532
    .line 533
    invoke-static {p0, v2}, Ll/xcx;->T(Ll/xcx;Landroid/widget/LinearLayout;)V

    .line 534
    .line 535
    .line 536
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 537
    .line 538
    .line 539
    move-result-object v2

    .line 540
    check-cast v2, Landroid/view/ViewGroup;

    .line 541
    .line 542
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 543
    .line 544
    .line 545
    move-result-object v2

    .line 546
    check-cast v2, Landroid/view/ViewGroup;

    .line 547
    .line 548
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 549
    .line 550
    .line 551
    move-result-object v2

    .line 552
    check-cast v2, Lv/VEditText;

    .line 553
    .line 554
    invoke-static {p0, v2}, Ll/xcx;->S(Ll/xcx;Lv/VEditText;)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 558
    .line 559
    .line 560
    move-result-object v2

    .line 561
    check-cast v2, Landroid/view/ViewGroup;

    .line 562
    .line 563
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 564
    .line 565
    .line 566
    move-result-object v2

    .line 567
    check-cast v2, Landroid/view/ViewGroup;

    .line 568
    .line 569
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    check-cast v2, Lv/VText;

    .line 574
    .line 575
    invoke-static {p0, v2}, Ll/xcx;->L0(Ll/xcx;Lv/VText;)V

    .line 576
    .line 577
    .line 578
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 579
    .line 580
    .line 581
    move-result-object v2

    .line 582
    check-cast v2, Landroid/view/ViewGroup;

    .line 583
    .line 584
    const/16 v4, 0xf

    .line 585
    .line 586
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    check-cast v2, Lv/VLinear;

    .line 591
    .line 592
    invoke-static {p0, v2}, Ll/xcx;->U(Ll/xcx;Lv/VLinear;)V

    .line 593
    .line 594
    .line 595
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 596
    .line 597
    .line 598
    move-result-object v2

    .line 599
    check-cast v2, Landroid/view/ViewGroup;

    .line 600
    .line 601
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 602
    .line 603
    .line 604
    move-result-object v2

    .line 605
    check-cast v2, Landroid/view/ViewGroup;

    .line 606
    .line 607
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 608
    .line 609
    .line 610
    move-result-object v2

    .line 611
    check-cast v2, Landroid/widget/FrameLayout;

    .line 612
    .line 613
    invoke-static {p0, v2}, Ll/xcx;->Y(Ll/xcx;Landroid/widget/FrameLayout;)V

    .line 614
    .line 615
    .line 616
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 617
    .line 618
    .line 619
    move-result-object v2

    .line 620
    check-cast v2, Landroid/view/ViewGroup;

    .line 621
    .line 622
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    check-cast v2, Landroid/view/ViewGroup;

    .line 627
    .line 628
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object v2

    .line 632
    check-cast v2, Landroid/view/ViewGroup;

    .line 633
    .line 634
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 635
    .line 636
    .line 637
    move-result-object v2

    .line 638
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 639
    .line 640
    invoke-static {p0, v2}, Ll/xcx;->H0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 641
    .line 642
    .line 643
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 644
    .line 645
    .line 646
    move-result-object v2

    .line 647
    check-cast v2, Landroid/view/ViewGroup;

    .line 648
    .line 649
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 650
    .line 651
    .line 652
    move-result-object v2

    .line 653
    check-cast v2, Landroid/view/ViewGroup;

    .line 654
    .line 655
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    check-cast v2, Landroid/view/ViewGroup;

    .line 660
    .line 661
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 662
    .line 663
    .line 664
    move-result-object v2

    .line 665
    check-cast v2, Landroid/widget/ImageView;

    .line 666
    .line 667
    invoke-static {p0, v2}, Ll/xcx;->X(Ll/xcx;Landroid/widget/ImageView;)V

    .line 668
    .line 669
    .line 670
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 671
    .line 672
    .line 673
    move-result-object v2

    .line 674
    check-cast v2, Landroid/view/ViewGroup;

    .line 675
    .line 676
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    check-cast v2, Landroid/view/ViewGroup;

    .line 681
    .line 682
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 683
    .line 684
    .line 685
    move-result-object v2

    .line 686
    check-cast v2, Landroid/view/ViewGroup;

    .line 687
    .line 688
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 689
    .line 690
    .line 691
    move-result-object v2

    .line 692
    check-cast v2, Lv/VText;

    .line 693
    .line 694
    invoke-static {p0, v2}, Ll/xcx;->Z(Ll/xcx;Lv/VText;)V

    .line 695
    .line 696
    .line 697
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 698
    .line 699
    .line 700
    move-result-object v2

    .line 701
    check-cast v2, Landroid/view/ViewGroup;

    .line 702
    .line 703
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 704
    .line 705
    .line 706
    move-result-object v2

    .line 707
    check-cast v2, Landroid/view/ViewGroup;

    .line 708
    .line 709
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 710
    .line 711
    .line 712
    move-result-object v2

    .line 713
    check-cast v2, Landroid/widget/FrameLayout;

    .line 714
    .line 715
    invoke-static {p0, v2}, Ll/xcx;->w0(Ll/xcx;Landroid/widget/FrameLayout;)V

    .line 716
    .line 717
    .line 718
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 719
    .line 720
    .line 721
    move-result-object v2

    .line 722
    check-cast v2, Landroid/view/ViewGroup;

    .line 723
    .line 724
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 725
    .line 726
    .line 727
    move-result-object v2

    .line 728
    check-cast v2, Landroid/view/ViewGroup;

    .line 729
    .line 730
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 731
    .line 732
    .line 733
    move-result-object v2

    .line 734
    check-cast v2, Landroid/view/ViewGroup;

    .line 735
    .line 736
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 737
    .line 738
    .line 739
    move-result-object v2

    .line 740
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 741
    .line 742
    invoke-static {p0, v2}, Ll/xcx;->J0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 743
    .line 744
    .line 745
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 746
    .line 747
    .line 748
    move-result-object v2

    .line 749
    check-cast v2, Landroid/view/ViewGroup;

    .line 750
    .line 751
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 752
    .line 753
    .line 754
    move-result-object v2

    .line 755
    check-cast v2, Landroid/view/ViewGroup;

    .line 756
    .line 757
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 758
    .line 759
    .line 760
    move-result-object v2

    .line 761
    check-cast v2, Landroid/view/ViewGroup;

    .line 762
    .line 763
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 764
    .line 765
    .line 766
    move-result-object v2

    .line 767
    check-cast v2, Landroid/widget/ImageView;

    .line 768
    .line 769
    invoke-static {p0, v2}, Ll/xcx;->v0(Ll/xcx;Landroid/widget/ImageView;)V

    .line 770
    .line 771
    .line 772
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 773
    .line 774
    .line 775
    move-result-object v2

    .line 776
    check-cast v2, Landroid/view/ViewGroup;

    .line 777
    .line 778
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 779
    .line 780
    .line 781
    move-result-object v2

    .line 782
    check-cast v2, Landroid/view/ViewGroup;

    .line 783
    .line 784
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 785
    .line 786
    .line 787
    move-result-object v2

    .line 788
    check-cast v2, Landroid/view/ViewGroup;

    .line 789
    .line 790
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 791
    .line 792
    .line 793
    move-result-object v2

    .line 794
    check-cast v2, Lv/VText;

    .line 795
    .line 796
    invoke-static {p0, v2}, Ll/xcx;->x0(Ll/xcx;Lv/VText;)V

    .line 797
    .line 798
    .line 799
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 800
    .line 801
    .line 802
    move-result-object v2

    .line 803
    check-cast v2, Landroid/view/ViewGroup;

    .line 804
    .line 805
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 806
    .line 807
    .line 808
    move-result-object v2

    .line 809
    check-cast v2, Landroid/view/ViewGroup;

    .line 810
    .line 811
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 812
    .line 813
    .line 814
    move-result-object v2

    .line 815
    check-cast v2, Landroid/widget/FrameLayout;

    .line 816
    .line 817
    invoke-static {p0, v2}, Ll/xcx;->N0(Ll/xcx;Landroid/widget/FrameLayout;)V

    .line 818
    .line 819
    .line 820
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 821
    .line 822
    .line 823
    move-result-object v2

    .line 824
    check-cast v2, Landroid/view/ViewGroup;

    .line 825
    .line 826
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 827
    .line 828
    .line 829
    move-result-object v2

    .line 830
    check-cast v2, Landroid/view/ViewGroup;

    .line 831
    .line 832
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 833
    .line 834
    .line 835
    move-result-object v2

    .line 836
    check-cast v2, Landroid/view/ViewGroup;

    .line 837
    .line 838
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 839
    .line 840
    .line 841
    move-result-object v2

    .line 842
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 843
    .line 844
    invoke-static {p0, v2}, Ll/xcx;->K0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 845
    .line 846
    .line 847
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 848
    .line 849
    .line 850
    move-result-object v2

    .line 851
    check-cast v2, Landroid/view/ViewGroup;

    .line 852
    .line 853
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 854
    .line 855
    .line 856
    move-result-object v2

    .line 857
    check-cast v2, Landroid/view/ViewGroup;

    .line 858
    .line 859
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 860
    .line 861
    .line 862
    move-result-object v2

    .line 863
    check-cast v2, Landroid/view/ViewGroup;

    .line 864
    .line 865
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 866
    .line 867
    .line 868
    move-result-object v2

    .line 869
    check-cast v2, Landroid/widget/ImageView;

    .line 870
    .line 871
    invoke-static {p0, v2}, Ll/xcx;->M0(Ll/xcx;Landroid/widget/ImageView;)V

    .line 872
    .line 873
    .line 874
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 875
    .line 876
    .line 877
    move-result-object v2

    .line 878
    check-cast v2, Landroid/view/ViewGroup;

    .line 879
    .line 880
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 881
    .line 882
    .line 883
    move-result-object v2

    .line 884
    check-cast v2, Landroid/view/ViewGroup;

    .line 885
    .line 886
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 887
    .line 888
    .line 889
    move-result-object v2

    .line 890
    check-cast v2, Landroid/view/ViewGroup;

    .line 891
    .line 892
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 893
    .line 894
    .line 895
    move-result-object v2

    .line 896
    check-cast v2, Lv/VText;

    .line 897
    .line 898
    invoke-static {p0, v2}, Ll/xcx;->O0(Ll/xcx;Lv/VText;)V

    .line 899
    .line 900
    .line 901
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 902
    .line 903
    .line 904
    move-result-object v2

    .line 905
    check-cast v2, Landroid/view/ViewGroup;

    .line 906
    .line 907
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 908
    .line 909
    .line 910
    move-result-object v2

    .line 911
    check-cast v2, Landroid/view/ViewGroup;

    .line 912
    .line 913
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 914
    .line 915
    .line 916
    move-result-object v2

    .line 917
    check-cast v2, Landroid/widget/FrameLayout;

    .line 918
    .line 919
    invoke-static {p0, v2}, Ll/xcx;->b0(Ll/xcx;Landroid/widget/FrameLayout;)V

    .line 920
    .line 921
    .line 922
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 923
    .line 924
    .line 925
    move-result-object v2

    .line 926
    check-cast v2, Landroid/view/ViewGroup;

    .line 927
    .line 928
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 929
    .line 930
    .line 931
    move-result-object v2

    .line 932
    check-cast v2, Landroid/view/ViewGroup;

    .line 933
    .line 934
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 935
    .line 936
    .line 937
    move-result-object v2

    .line 938
    check-cast v2, Landroid/view/ViewGroup;

    .line 939
    .line 940
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 941
    .line 942
    .line 943
    move-result-object v0

    .line 944
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 945
    .line 946
    invoke-static {p0, v0}, Ll/xcx;->I0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 947
    .line 948
    .line 949
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 950
    .line 951
    .line 952
    move-result-object v0

    .line 953
    check-cast v0, Landroid/view/ViewGroup;

    .line 954
    .line 955
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 956
    .line 957
    .line 958
    move-result-object v0

    .line 959
    check-cast v0, Landroid/view/ViewGroup;

    .line 960
    .line 961
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 962
    .line 963
    .line 964
    move-result-object v0

    .line 965
    check-cast v0, Landroid/view/ViewGroup;

    .line 966
    .line 967
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 968
    .line 969
    .line 970
    move-result-object v0

    .line 971
    check-cast v0, Landroid/widget/ImageView;

    .line 972
    .line 973
    invoke-static {p0, v0}, Ll/xcx;->a0(Ll/xcx;Landroid/widget/ImageView;)V

    .line 974
    .line 975
    .line 976
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    check-cast v0, Landroid/view/ViewGroup;

    .line 981
    .line 982
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 983
    .line 984
    .line 985
    move-result-object v0

    .line 986
    check-cast v0, Landroid/view/ViewGroup;

    .line 987
    .line 988
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 989
    .line 990
    .line 991
    move-result-object v0

    .line 992
    check-cast v0, Landroid/view/ViewGroup;

    .line 993
    .line 994
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 995
    .line 996
    .line 997
    move-result-object v0

    .line 998
    check-cast v0, Lv/VText;

    .line 999
    .line 1000
    invoke-static {p0, v0}, Ll/xcx;->c0(Ll/xcx;Lv/VText;)V

    .line 1001
    .line 1002
    .line 1003
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v0

    .line 1007
    check-cast v0, Landroid/view/ViewGroup;

    .line 1008
    .line 1009
    const/16 v2, 0x10

    .line 1010
    .line 1011
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1012
    .line 1013
    .line 1014
    move-result-object v0

    .line 1015
    check-cast v0, Lv/VButton_FakeShadow;

    .line 1016
    .line 1017
    invoke-static {p0, v0}, Ll/xcx;->O(Ll/xcx;Lv/VButton_FakeShadow;)V

    .line 1018
    .line 1019
    .line 1020
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1021
    .line 1022
    .line 1023
    move-result-object p1

    .line 1024
    check-cast p1, Landroid/view/ViewGroup;

    .line 1025
    .line 1026
    const/16 v0, 0x11

    .line 1027
    .line 1028
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1029
    .line 1030
    .line 1031
    move-result-object p1

    .line 1032
    check-cast p1, Lv/VButton;

    .line 1033
    .line 1034
    invoke-static {p0, p1}, Ll/xcx;->y0(Ll/xcx;Lv/VButton;)V

    .line 1035
    .line 1036
    .line 1037
    return-void
.end method

.method public static c(Ll/xcx;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->l7:I

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
    invoke-static {p0, p1}, Ll/xcx$h;->b(Ll/xcx;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
