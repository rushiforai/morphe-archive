.class public Ll/ntb0;
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

.method public static a(Ll/mtb0;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/FrameLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/mtb0;->I:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    sget v0, Ll/hdc0;->A1:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 13
    .line 14
    iput-object v0, p0, Ll/mtb0;->J:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 15
    .line 16
    check-cast p1, Landroid/view/ViewGroup;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/google/android/material/appbar/AppBarLayout;

    .line 30
    .line 31
    iput-object v1, p0, Ll/mtb0;->K:Lcom/google/android/material/appbar/AppBarLayout;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/view/ViewGroup;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/view/ViewGroup;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 50
    .line 51
    iput-object v1, p0, Ll/mtb0;->L:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    .line 76
    .line 77
    iput-object v1, p0, Ll/mtb0;->M:Landroidx/appcompat/widget/Toolbar;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Landroid/view/ViewGroup;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroid/view/ViewGroup;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Landroid/view/ViewGroup;

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Landroid/view/ViewGroup;

    .line 102
    .line 103
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Landroid/view/ViewGroup;

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lv/VImage;

    .line 114
    .line 115
    iput-object v1, p0, Ll/mtb0;->N:Lv/VImage;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Landroid/view/ViewGroup;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Landroid/view/ViewGroup;

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Landroid/view/ViewGroup;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Landroid/view/ViewGroup;

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    check-cast v1, Landroid/view/ViewGroup;

    .line 146
    .line 147
    const/4 v2, 0x1

    .line 148
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Landroid/widget/TextView;

    .line 153
    .line 154
    iput-object v1, p0, Ll/mtb0;->O:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Landroid/view/ViewGroup;

    .line 161
    .line 162
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    check-cast v1, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    check-cast v1, Landroid/view/ViewGroup;

    .line 185
    .line 186
    const/4 v3, 0x2

    .line 187
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Lv/VLinear;

    .line 192
    .line 193
    iput-object v1, p0, Ll/mtb0;->P:Lv/VLinear;

    .line 194
    .line 195
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Landroid/view/ViewGroup;

    .line 200
    .line 201
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Lv/VRelative;

    .line 206
    .line 207
    iput-object v1, p0, Ll/mtb0;->Q:Lv/VRelative;

    .line 208
    .line 209
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    check-cast v1, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    check-cast v1, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Lv/VLinear;

    .line 226
    .line 227
    iput-object v1, p0, Ll/mtb0;->R:Lv/VLinear;

    .line 228
    .line 229
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    check-cast v1, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    check-cast v1, Lv/VDraweeView;

    .line 252
    .line 253
    iput-object v1, p0, Ll/mtb0;->S:Lv/VDraweeView;

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    check-cast v1, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    check-cast v1, Landroid/view/ViewGroup;

    .line 266
    .line 267
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    check-cast v1, Landroid/view/ViewGroup;

    .line 272
    .line 273
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, Landroid/view/ViewGroup;

    .line 278
    .line 279
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    check-cast v1, Landroid/widget/TextView;

    .line 284
    .line 285
    iput-object v1, p0, Ll/mtb0;->T:Landroid/widget/TextView;

    .line 286
    .line 287
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    check-cast v1, Landroid/view/ViewGroup;

    .line 292
    .line 293
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    check-cast v1, Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    check-cast v1, Landroid/view/ViewGroup;

    .line 304
    .line 305
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    check-cast v1, Landroid/view/ViewGroup;

    .line 310
    .line 311
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    check-cast v1, Landroid/widget/TextView;

    .line 316
    .line 317
    iput-object v1, p0, Ll/mtb0;->U:Landroid/widget/TextView;

    .line 318
    .line 319
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    check-cast v1, Landroid/view/ViewGroup;

    .line 324
    .line 325
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    check-cast v1, Landroid/view/ViewGroup;

    .line 330
    .line 331
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    check-cast v1, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 336
    .line 337
    iput-object v1, p0, Ll/mtb0;->V:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 338
    .line 339
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    check-cast v1, Landroid/view/ViewGroup;

    .line 344
    .line 345
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    check-cast v1, Landroid/view/ViewGroup;

    .line 350
    .line 351
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 356
    .line 357
    iput-object v1, p0, Ll/mtb0;->W:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 358
    .line 359
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    check-cast v1, Landroid/view/ViewGroup;

    .line 364
    .line 365
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    check-cast v1, Landroid/view/ViewGroup;

    .line 370
    .line 371
    const/4 v4, 0x3

    .line 372
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 377
    .line 378
    iput-object v1, p0, Ll/mtb0;->X:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 379
    .line 380
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    check-cast v1, Landroid/view/ViewGroup;

    .line 385
    .line 386
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v1

    .line 390
    check-cast v1, Landroid/view/ViewGroup;

    .line 391
    .line 392
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    check-cast v1, Landroid/view/ViewGroup;

    .line 397
    .line 398
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 403
    .line 404
    iput-object v1, p0, Ll/mtb0;->Y:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 405
    .line 406
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    check-cast v1, Landroid/view/ViewGroup;

    .line 411
    .line 412
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    check-cast v1, Landroid/view/ViewGroup;

    .line 417
    .line 418
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    check-cast v1, Landroid/view/ViewGroup;

    .line 423
    .line 424
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    check-cast v1, Landroid/view/ViewGroup;

    .line 429
    .line 430
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 431
    .line 432
    .line 433
    move-result-object v1

    .line 434
    check-cast v1, Lv/VImage;

    .line 435
    .line 436
    iput-object v1, p0, Ll/mtb0;->Z:Lv/VImage;

    .line 437
    .line 438
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    check-cast v1, Landroid/view/ViewGroup;

    .line 443
    .line 444
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    check-cast v1, Landroid/view/ViewGroup;

    .line 449
    .line 450
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    check-cast v1, Landroid/view/ViewGroup;

    .line 455
    .line 456
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    check-cast v1, Landroid/view/ViewGroup;

    .line 461
    .line 462
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    check-cast v1, Lv/VText;

    .line 467
    .line 468
    iput-object v1, p0, Ll/mtb0;->k0:Lv/VText;

    .line 469
    .line 470
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 471
    .line 472
    .line 473
    move-result-object v1

    .line 474
    check-cast v1, Landroid/view/ViewGroup;

    .line 475
    .line 476
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    check-cast v1, Landroid/view/ViewGroup;

    .line 481
    .line 482
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 483
    .line 484
    .line 485
    move-result-object v1

    .line 486
    check-cast v1, Landroid/view/ViewGroup;

    .line 487
    .line 488
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    check-cast v1, Landroid/view/ViewGroup;

    .line 493
    .line 494
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    check-cast v1, Lv/VImage;

    .line 499
    .line 500
    iput-object v1, p0, Ll/mtb0;->p0:Lv/VImage;

    .line 501
    .line 502
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    check-cast v1, Landroid/view/ViewGroup;

    .line 507
    .line 508
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 509
    .line 510
    .line 511
    move-result-object v1

    .line 512
    check-cast v1, Landroid/view/ViewGroup;

    .line 513
    .line 514
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    check-cast v1, Landroid/view/ViewGroup;

    .line 519
    .line 520
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 521
    .line 522
    .line 523
    move-result-object v1

    .line 524
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 525
    .line 526
    iput-object v1, p0, Ll/mtb0;->E0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 527
    .line 528
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    check-cast v1, Landroid/view/ViewGroup;

    .line 533
    .line 534
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    check-cast v1, Landroid/view/ViewGroup;

    .line 539
    .line 540
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    check-cast v1, Landroid/view/ViewGroup;

    .line 545
    .line 546
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    check-cast v1, Landroid/view/ViewGroup;

    .line 551
    .line 552
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 557
    .line 558
    iput-object v1, p0, Ll/mtb0;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 559
    .line 560
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    check-cast v1, Landroid/view/ViewGroup;

    .line 565
    .line 566
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    check-cast v1, Landroid/view/ViewGroup;

    .line 571
    .line 572
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, Landroid/view/ViewGroup;

    .line 577
    .line 578
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 579
    .line 580
    .line 581
    move-result-object v1

    .line 582
    check-cast v1, Landroid/view/ViewGroup;

    .line 583
    .line 584
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 585
    .line 586
    .line 587
    move-result-object v1

    .line 588
    check-cast v1, Lv/VText;

    .line 589
    .line 590
    iput-object v1, p0, Ll/mtb0;->G0:Lv/VText;

    .line 591
    .line 592
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 593
    .line 594
    .line 595
    move-result-object v1

    .line 596
    check-cast v1, Landroid/view/ViewGroup;

    .line 597
    .line 598
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 599
    .line 600
    .line 601
    move-result-object v1

    .line 602
    check-cast v1, Landroid/view/ViewGroup;

    .line 603
    .line 604
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    check-cast v1, Landroid/view/ViewGroup;

    .line 609
    .line 610
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    check-cast v1, Landroid/view/ViewGroup;

    .line 615
    .line 616
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    check-cast v1, Lv/VImage;

    .line 621
    .line 622
    iput-object v1, p0, Ll/mtb0;->H0:Lv/VImage;

    .line 623
    .line 624
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    check-cast v1, Landroid/view/ViewGroup;

    .line 629
    .line 630
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    check-cast v1, Landroid/view/ViewGroup;

    .line 635
    .line 636
    const/4 v5, 0x4

    .line 637
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object v1

    .line 641
    check-cast v1, Lv/VLine;

    .line 642
    .line 643
    iput-object v1, p0, Ll/mtb0;->I0:Lv/VLine;

    .line 644
    .line 645
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object v1

    .line 649
    check-cast v1, Landroid/view/ViewGroup;

    .line 650
    .line 651
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 652
    .line 653
    .line 654
    move-result-object v1

    .line 655
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 656
    .line 657
    iput-object v1, p0, Ll/mtb0;->J0:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 658
    .line 659
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 660
    .line 661
    .line 662
    move-result-object v1

    .line 663
    check-cast v1, Lv/VFrame;

    .line 664
    .line 665
    iput-object v1, p0, Ll/mtb0;->K0:Lv/VFrame;

    .line 666
    .line 667
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 668
    .line 669
    .line 670
    move-result-object v1

    .line 671
    check-cast v1, Landroid/view/ViewGroup;

    .line 672
    .line 673
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 674
    .line 675
    .line 676
    move-result-object v1

    .line 677
    check-cast v1, Landroid/widget/TextView;

    .line 678
    .line 679
    iput-object v1, p0, Ll/mtb0;->L0:Landroid/widget/TextView;

    .line 680
    .line 681
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 682
    .line 683
    .line 684
    move-result-object v1

    .line 685
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQATopicInputJoinView;

    .line 686
    .line 687
    iput-object v1, p0, Ll/mtb0;->M0:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQATopicInputJoinView;

    .line 688
    .line 689
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 690
    .line 691
    .line 692
    move-result-object v1

    .line 693
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;

    .line 694
    .line 695
    iput-object v1, p0, Ll/mtb0;->N0:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;

    .line 696
    .line 697
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 698
    .line 699
    .line 700
    move-result-object v1

    .line 701
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;

    .line 702
    .line 703
    iput-object v1, p0, Ll/mtb0;->O0:Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;

    .line 704
    .line 705
    const/4 v1, 0x5

    .line 706
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 707
    .line 708
    .line 709
    move-result-object v4

    .line 710
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 711
    .line 712
    iput-object v4, p0, Ll/mtb0;->P0:Landroid/widget/RelativeLayout;

    .line 713
    .line 714
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 715
    .line 716
    .line 717
    move-result-object v4

    .line 718
    check-cast v4, Landroid/view/ViewGroup;

    .line 719
    .line 720
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 721
    .line 722
    .line 723
    move-result-object v4

    .line 724
    check-cast v4, Landroid/widget/FrameLayout;

    .line 725
    .line 726
    iput-object v4, p0, Ll/mtb0;->Q0:Landroid/widget/FrameLayout;

    .line 727
    .line 728
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 729
    .line 730
    .line 731
    move-result-object v4

    .line 732
    check-cast v4, Landroid/view/ViewGroup;

    .line 733
    .line 734
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 735
    .line 736
    .line 737
    move-result-object v4

    .line 738
    check-cast v4, Landroid/view/ViewGroup;

    .line 739
    .line 740
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    check-cast v0, Lv/VImage;

    .line 745
    .line 746
    iput-object v0, p0, Ll/mtb0;->R0:Lv/VImage;

    .line 747
    .line 748
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 749
    .line 750
    .line 751
    move-result-object v0

    .line 752
    check-cast v0, Landroid/view/ViewGroup;

    .line 753
    .line 754
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    check-cast v0, Landroid/widget/LinearLayout;

    .line 759
    .line 760
    iput-object v0, p0, Ll/mtb0;->S0:Landroid/widget/LinearLayout;

    .line 761
    .line 762
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 763
    .line 764
    .line 765
    move-result-object p1

    .line 766
    check-cast p1, Landroid/view/ViewGroup;

    .line 767
    .line 768
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 769
    .line 770
    .line 771
    move-result-object p1

    .line 772
    check-cast p1, Landroid/view/ViewGroup;

    .line 773
    .line 774
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 775
    .line 776
    .line 777
    move-result-object p1

    .line 778
    check-cast p1, Lv/VText;

    .line 779
    .line 780
    iput-object p1, p0, Ll/mtb0;->T0:Lv/VText;

    .line 781
    .line 782
    return-void
.end method

.method public static b(Ll/mtb0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->U2:I

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
    invoke-static {p0, p1}, Ll/ntb0;->a(Ll/mtb0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public static c(Ll/mtb0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/mtb0;->I:Landroid/widget/FrameLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/mtb0;->J:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 5
    .line 6
    iput-object v0, p0, Ll/mtb0;->K:Lcom/google/android/material/appbar/AppBarLayout;

    .line 7
    .line 8
    iput-object v0, p0, Ll/mtb0;->L:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 9
    .line 10
    iput-object v0, p0, Ll/mtb0;->M:Landroidx/appcompat/widget/Toolbar;

    .line 11
    .line 12
    iput-object v0, p0, Ll/mtb0;->N:Lv/VImage;

    .line 13
    .line 14
    iput-object v0, p0, Ll/mtb0;->O:Landroid/widget/TextView;

    .line 15
    .line 16
    iput-object v0, p0, Ll/mtb0;->P:Lv/VLinear;

    .line 17
    .line 18
    iput-object v0, p0, Ll/mtb0;->Q:Lv/VRelative;

    .line 19
    .line 20
    iput-object v0, p0, Ll/mtb0;->R:Lv/VLinear;

    .line 21
    .line 22
    iput-object v0, p0, Ll/mtb0;->S:Lv/VDraweeView;

    .line 23
    .line 24
    iput-object v0, p0, Ll/mtb0;->T:Landroid/widget/TextView;

    .line 25
    .line 26
    iput-object v0, p0, Ll/mtb0;->U:Landroid/widget/TextView;

    .line 27
    .line 28
    iput-object v0, p0, Ll/mtb0;->V:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 29
    .line 30
    iput-object v0, p0, Ll/mtb0;->W:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 31
    .line 32
    iput-object v0, p0, Ll/mtb0;->X:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 33
    .line 34
    iput-object v0, p0, Ll/mtb0;->Y:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 35
    .line 36
    iput-object v0, p0, Ll/mtb0;->Z:Lv/VImage;

    .line 37
    .line 38
    iput-object v0, p0, Ll/mtb0;->k0:Lv/VText;

    .line 39
    .line 40
    iput-object v0, p0, Ll/mtb0;->p0:Lv/VImage;

    .line 41
    .line 42
    iput-object v0, p0, Ll/mtb0;->E0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 43
    .line 44
    iput-object v0, p0, Ll/mtb0;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 45
    .line 46
    iput-object v0, p0, Ll/mtb0;->G0:Lv/VText;

    .line 47
    .line 48
    iput-object v0, p0, Ll/mtb0;->H0:Lv/VImage;

    .line 49
    .line 50
    iput-object v0, p0, Ll/mtb0;->I0:Lv/VLine;

    .line 51
    .line 52
    iput-object v0, p0, Ll/mtb0;->J0:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 53
    .line 54
    iput-object v0, p0, Ll/mtb0;->K0:Lv/VFrame;

    .line 55
    .line 56
    iput-object v0, p0, Ll/mtb0;->L0:Landroid/widget/TextView;

    .line 57
    .line 58
    iput-object v0, p0, Ll/mtb0;->M0:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQATopicInputJoinView;

    .line 59
    .line 60
    iput-object v0, p0, Ll/mtb0;->N0:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedChangeQATopicInputJoinView;

    .line 61
    .line 62
    iput-object v0, p0, Ll/mtb0;->O0:Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;

    .line 63
    .line 64
    iput-object v0, p0, Ll/mtb0;->P0:Landroid/widget/RelativeLayout;

    .line 65
    .line 66
    iput-object v0, p0, Ll/mtb0;->Q0:Landroid/widget/FrameLayout;

    .line 67
    .line 68
    iput-object v0, p0, Ll/mtb0;->R0:Lv/VImage;

    .line 69
    .line 70
    iput-object v0, p0, Ll/mtb0;->S0:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    iput-object v0, p0, Ll/mtb0;->T0:Lv/VText;

    .line 73
    .line 74
    return-void
.end method
