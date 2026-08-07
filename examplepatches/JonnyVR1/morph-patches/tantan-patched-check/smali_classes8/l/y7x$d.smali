.class public Ll/y7x$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y7x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# direct methods
.method public static bridge synthetic a(Ll/y7x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/y7x$d;->c(Ll/y7x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ll/y7x;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/y7x;->K(Ll/y7x;Landroid/widget/RelativeLayout;)V

    .line 5
    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lv/VText;

    .line 16
    .line 17
    invoke-static {p0, v2}, Ll/y7x;->Q(Ll/y7x;Lv/VText;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {p0, v3}, Ll/y7x;->x(Ll/y7x;Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-static {p0, v4}, Ll/y7x;->y(Ll/y7x;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    const/4 v4, 0x3

    .line 37
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lv/VButton;

    .line 42
    .line 43
    invoke-static {p0, v4}, Ll/y7x;->V(Ll/y7x;Lv/VButton;)V

    .line 44
    .line 45
    .line 46
    const/4 v4, 0x4

    .line 47
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Lcom/sunshine/engine/particle/SceneView;

    .line 52
    .line 53
    invoke-static {p0, v4}, Ll/y7x;->J(Ll/y7x;Lcom/sunshine/engine/particle/SceneView;)V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x5

    .line 57
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-static {p0, v4}, Ll/y7x;->A(Ll/y7x;Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    const/4 v4, 0x6

    .line 65
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lv/VDraweeView;

    .line 70
    .line 71
    invoke-static {p0, v4}, Ll/y7x;->R(Ll/y7x;Lv/VDraweeView;)V

    .line 72
    .line 73
    .line 74
    const/4 v4, 0x7

    .line 75
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Lv/VImage;

    .line 80
    .line 81
    invoke-static {p0, v4}, Ll/y7x;->C(Ll/y7x;Lv/VImage;)V

    .line 82
    .line 83
    .line 84
    const/16 v4, 0x8

    .line 85
    .line 86
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Lv/VDraweeView;

    .line 91
    .line 92
    invoke-static {p0, v4}, Ll/y7x;->S(Ll/y7x;Lv/VDraweeView;)V

    .line 93
    .line 94
    .line 95
    const/16 v4, 0x9

    .line 96
    .line 97
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v4, Lv/VImage;

    .line 102
    .line 103
    invoke-static {p0, v4}, Ll/y7x;->E(Ll/y7x;Lv/VImage;)V

    .line 104
    .line 105
    .line 106
    const/16 v4, 0xa

    .line 107
    .line 108
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Lv/VImage;

    .line 113
    .line 114
    invoke-static {p0, v4}, Ll/y7x;->I(Ll/y7x;Lv/VImage;)V

    .line 115
    .line 116
    .line 117
    const/16 v4, 0xb

    .line 118
    .line 119
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    check-cast v4, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 124
    .line 125
    invoke-static {p0, v4}, Ll/y7x;->H(Ll/y7x;Lcom/p1/mobile/putong/core/ui/GradientBgButton;)V

    .line 126
    .line 127
    .line 128
    const/16 v4, 0xc

    .line 129
    .line 130
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    check-cast v5, Lv/VLinear_FillerMeasure;

    .line 135
    .line 136
    invoke-static {p0, v5}, Ll/y7x;->Z(Ll/y7x;Lv/VLinear_FillerMeasure;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    check-cast v5, Lv/VText;

    .line 150
    .line 151
    invoke-static {p0, v5}, Ll/y7x;->a0(Ll/y7x;Lv/VText;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Lv/VText;

    .line 165
    .line 166
    invoke-static {p0, v4}, Ll/y7x;->b0(Ll/y7x;Lv/VText;)V

    .line 167
    .line 168
    .line 169
    const/16 v4, 0xd

    .line 170
    .line 171
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    check-cast v5, Landroid/widget/LinearLayout;

    .line 176
    .line 177
    invoke-static {p0, v5}, Ll/y7x;->M(Ll/y7x;Landroid/widget/LinearLayout;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    check-cast v5, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    check-cast v5, Lv/VText;

    .line 191
    .line 192
    invoke-static {p0, v5}, Ll/y7x;->L(Ll/y7x;Lv/VText;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Landroid/view/ViewGroup;

    .line 200
    .line 201
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lv/VText;

    .line 206
    .line 207
    invoke-static {p0, v0}, Ll/y7x;->N(Ll/y7x;Lv/VText;)V

    .line 208
    .line 209
    .line 210
    sget v0, Ll/adc0;->Sd:I

    .line 211
    .line 212
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lv/VText_AutoFit;

    .line 217
    .line 218
    invoke-static {p0, v0}, Ll/y7x;->Y(Ll/y7x;Lv/VText_AutoFit;)V

    .line 219
    .line 220
    .line 221
    check-cast p1, Landroid/view/ViewGroup;

    .line 222
    .line 223
    const/16 v0, 0xf

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    check-cast v4, Landroid/widget/LinearLayout;

    .line 230
    .line 231
    invoke-static {p0, v4}, Ll/y7x;->P(Ll/y7x;Landroid/widget/LinearLayout;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    check-cast v4, Landroid/view/ViewGroup;

    .line 239
    .line 240
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    check-cast v4, Landroid/widget/LinearLayout;

    .line 245
    .line 246
    invoke-static {p0, v4}, Ll/y7x;->O(Ll/y7x;Landroid/widget/LinearLayout;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    check-cast v4, Landroid/view/ViewGroup;

    .line 254
    .line 255
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    check-cast v4, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    check-cast v4, Lv/VButton_FakeShadow;

    .line 266
    .line 267
    invoke-static {p0, v4}, Ll/y7x;->X(Ll/y7x;Lv/VButton_FakeShadow;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    check-cast v4, Landroid/view/ViewGroup;

    .line 275
    .line 276
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    check-cast v4, Landroid/view/ViewGroup;

    .line 281
    .line 282
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 283
    .line 284
    .line 285
    move-result-object v4

    .line 286
    check-cast v4, Lv/VButton_FakeShadow;

    .line 287
    .line 288
    invoke-static {p0, v4}, Ll/y7x;->z(Ll/y7x;Lv/VButton_FakeShadow;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    check-cast v0, Landroid/view/ViewGroup;

    .line 296
    .line 297
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    check-cast v0, Lv/VButton;

    .line 302
    .line 303
    invoke-static {p0, v0}, Ll/y7x;->U(Ll/y7x;Lv/VButton;)V

    .line 304
    .line 305
    .line 306
    const/16 v0, 0x10

    .line 307
    .line 308
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    check-cast v4, Landroid/widget/LinearLayout;

    .line 313
    .line 314
    invoke-static {p0, v4}, Ll/y7x;->h0(Ll/y7x;Landroid/widget/LinearLayout;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    check-cast v4, Landroid/view/ViewGroup;

    .line 322
    .line 323
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    check-cast v4, Lv/VButton;

    .line 328
    .line 329
    invoke-static {p0, v4}, Ll/y7x;->i0(Ll/y7x;Lv/VButton;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    check-cast v0, Landroid/view/ViewGroup;

    .line 337
    .line 338
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    check-cast v0, Lv/VButton;

    .line 343
    .line 344
    invoke-static {p0, v0}, Ll/y7x;->m0(Ll/y7x;Lv/VButton;)V

    .line 345
    .line 346
    .line 347
    const/16 v0, 0x11

    .line 348
    .line 349
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    check-cast v4, Landroid/widget/LinearLayout;

    .line 354
    .line 355
    invoke-static {p0, v4}, Ll/y7x;->j0(Ll/y7x;Landroid/widget/LinearLayout;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    check-cast v4, Landroid/view/ViewGroup;

    .line 363
    .line 364
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v4

    .line 368
    check-cast v4, Lv/VButton;

    .line 369
    .line 370
    invoke-static {p0, v4}, Ll/y7x;->k0(Ll/y7x;Lv/VButton;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    check-cast v0, Landroid/view/ViewGroup;

    .line 378
    .line 379
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    check-cast v0, Lv/VButton;

    .line 384
    .line 385
    invoke-static {p0, v0}, Ll/y7x;->l0(Ll/y7x;Lv/VButton;)V

    .line 386
    .line 387
    .line 388
    const/16 v0, 0x12

    .line 389
    .line 390
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    check-cast v0, Lv/VText;

    .line 395
    .line 396
    invoke-static {p0, v0}, Ll/y7x;->d0(Ll/y7x;Lv/VText;)V

    .line 397
    .line 398
    .line 399
    const/16 v0, 0x13

    .line 400
    .line 401
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    check-cast v3, Landroid/widget/RelativeLayout;

    .line 406
    .line 407
    invoke-static {p0, v3}, Ll/y7x;->F(Ll/y7x;Landroid/widget/RelativeLayout;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    check-cast v3, Landroid/view/ViewGroup;

    .line 415
    .line 416
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v3

    .line 420
    check-cast v3, Lv/VEditText;

    .line 421
    .line 422
    invoke-static {p0, v3}, Ll/y7x;->G(Ll/y7x;Lv/VEditText;)V

    .line 423
    .line 424
    .line 425
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    check-cast v0, Landroid/view/ViewGroup;

    .line 430
    .line 431
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    check-cast v0, Lv/VText;

    .line 436
    .line 437
    invoke-static {p0, v0}, Ll/y7x;->c0(Ll/y7x;Lv/VText;)V

    .line 438
    .line 439
    .line 440
    const/16 v0, 0x14

    .line 441
    .line 442
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    check-cast v2, Lv/VScroll_Horizontal;

    .line 447
    .line 448
    invoke-static {p0, v2}, Ll/y7x;->T(Ll/y7x;Lv/VScroll_Horizontal;)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    check-cast v0, Landroid/view/ViewGroup;

    .line 456
    .line 457
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    check-cast v0, Lv/VLinear;

    .line 462
    .line 463
    invoke-static {p0, v0}, Ll/y7x;->B(Ll/y7x;Lv/VLinear;)V

    .line 464
    .line 465
    .line 466
    const/16 v0, 0x15

    .line 467
    .line 468
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    check-cast v0, Lv/VButton_FakeShadow;

    .line 473
    .line 474
    invoke-static {p0, v0}, Ll/y7x;->g0(Ll/y7x;Lv/VButton_FakeShadow;)V

    .line 475
    .line 476
    .line 477
    const/16 v0, 0x16

    .line 478
    .line 479
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 480
    .line 481
    .line 482
    move-result-object v2

    .line 483
    check-cast v2, Landroid/widget/FrameLayout;

    .line 484
    .line 485
    invoke-static {p0, v2}, Ll/y7x;->f0(Ll/y7x;Landroid/widget/FrameLayout;)V

    .line 486
    .line 487
    .line 488
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    check-cast v0, Landroid/view/ViewGroup;

    .line 493
    .line 494
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    check-cast v0, Lv/VText;

    .line 499
    .line 500
    invoke-static {p0, v0}, Ll/y7x;->e0(Ll/y7x;Lv/VText;)V

    .line 501
    .line 502
    .line 503
    const/16 v0, 0x17

    .line 504
    .line 505
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 506
    .line 507
    .line 508
    move-result-object p1

    .line 509
    check-cast p1, Lcom/sunshine/engine/particle/SceneView;

    .line 510
    .line 511
    invoke-static {p0, p1}, Ll/y7x;->W(Ll/y7x;Lcom/sunshine/engine/particle/SceneView;)V

    .line 512
    .line 513
    .line 514
    return-void
.end method

.method public static c(Ll/y7x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Wd:I

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
    invoke-static {p0, p1}, Ll/y7x$d;->b(Ll/y7x;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
