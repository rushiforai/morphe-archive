.class public Ll/kbi;
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

.method public static a(Ll/jbi;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/jbi;->J:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iput-object v1, p0, Ll/jbi;->K:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/widget/LinearLayout;

    .line 21
    .line 22
    iput-object v2, p0, Ll/jbi;->L:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lv/VImage;

    .line 41
    .line 42
    iput-object v2, p0, Ll/jbi;->M:Lv/VImage;

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
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lv/VText;

    .line 61
    .line 62
    iput-object v2, p0, Ll/jbi;->N:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Landroid/view/ViewGroup;

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/view/ViewGroup;

    .line 75
    .line 76
    const/4 v3, 0x2

    .line 77
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lv/VImage;

    .line 82
    .line 83
    iput-object v2, p0, Ll/jbi;->O:Lv/VImage;

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Landroid/view/ViewGroup;

    .line 90
    .line 91
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Landroid/view/ViewGroup;

    .line 96
    .line 97
    const/4 v4, 0x3

    .line 98
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Lv/VImage;

    .line 103
    .line 104
    iput-object v2, p0, Ll/jbi;->P:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iput-object v2, p0, Ll/jbi;->Q:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 117
    .line 118
    iput-object v2, p0, Ll/jbi;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 119
    .line 120
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iput-object v2, p0, Ll/jbi;->S:Landroid/view/View;

    .line 131
    .line 132
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Landroid/view/ViewGroup;

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 143
    .line 144
    iput-object v2, p0, Ll/jbi;->T:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 145
    .line 146
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Landroid/view/ViewGroup;

    .line 151
    .line 152
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    check-cast v2, Landroid/widget/FrameLayout;

    .line 157
    .line 158
    iput-object v2, p0, Ll/jbi;->U:Landroid/widget/FrameLayout;

    .line 159
    .line 160
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Lv/VText;

    .line 171
    .line 172
    iput-object v2, p0, Ll/jbi;->V:Lv/VText;

    .line 173
    .line 174
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, Landroid/view/ViewGroup;

    .line 179
    .line 180
    const/4 v5, 0x4

    .line 181
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    check-cast v2, Landroid/widget/LinearLayout;

    .line 186
    .line 187
    iput-object v2, p0, Ll/jbi;->W:Landroid/widget/LinearLayout;

    .line 188
    .line 189
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Landroid/view/ViewGroup;

    .line 194
    .line 195
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    check-cast v2, Landroid/view/ViewGroup;

    .line 200
    .line 201
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    check-cast v2, Lv/VText;

    .line 206
    .line 207
    iput-object v2, p0, Ll/jbi;->X:Lv/VText;

    .line 208
    .line 209
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    check-cast v2, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lv/VText;

    .line 226
    .line 227
    iput-object v2, p0, Ll/jbi;->Y:Lv/VText;

    .line 228
    .line 229
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    check-cast v2, Landroid/view/ViewGroup;

    .line 234
    .line 235
    const/4 v6, 0x5

    .line 236
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    check-cast v2, Landroid/widget/LinearLayout;

    .line 241
    .line 242
    iput-object v2, p0, Ll/jbi;->Z:Landroid/widget/LinearLayout;

    .line 243
    .line 244
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    check-cast v2, Landroid/view/ViewGroup;

    .line 249
    .line 250
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    check-cast v2, Landroid/view/ViewGroup;

    .line 255
    .line 256
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    check-cast v2, Lv/VText;

    .line 261
    .line 262
    iput-object v2, p0, Ll/jbi;->k0:Lv/VText;

    .line 263
    .line 264
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    check-cast v2, Landroid/view/ViewGroup;

    .line 269
    .line 270
    const/4 v6, 0x6

    .line 271
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    check-cast v2, Lv/VText;

    .line 276
    .line 277
    iput-object v2, p0, Ll/jbi;->p0:Lv/VText;

    .line 278
    .line 279
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Landroid/view/ViewGroup;

    .line 284
    .line 285
    const/4 v6, 0x7

    .line 286
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    check-cast v2, Lv/VText;

    .line 291
    .line 292
    iput-object v2, p0, Ll/jbi;->E0:Lv/VText;

    .line 293
    .line 294
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    check-cast v2, Landroid/view/ViewGroup;

    .line 299
    .line 300
    const/16 v6, 0x8

    .line 301
    .line 302
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    check-cast v2, Lv/VText;

    .line 307
    .line 308
    iput-object v2, p0, Ll/jbi;->F0:Lv/VText;

    .line 309
    .line 310
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    check-cast v2, Landroid/view/ViewGroup;

    .line 315
    .line 316
    const/16 v6, 0x9

    .line 317
    .line 318
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    check-cast v2, Lv/VImage;

    .line 323
    .line 324
    iput-object v2, p0, Ll/jbi;->G0:Lv/VImage;

    .line 325
    .line 326
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    check-cast v2, Landroid/view/ViewGroup;

    .line 331
    .line 332
    const/16 v6, 0xa

    .line 333
    .line 334
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    iput-object v2, p0, Ll/jbi;->H0:Landroid/view/View;

    .line 339
    .line 340
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    check-cast v2, Landroid/view/ViewGroup;

    .line 345
    .line 346
    const/16 v6, 0xb

    .line 347
    .line 348
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    check-cast v2, Lv/VText;

    .line 353
    .line 354
    iput-object v2, p0, Ll/jbi;->I0:Lv/VText;

    .line 355
    .line 356
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    check-cast v2, Landroid/view/ViewGroup;

    .line 361
    .line 362
    const/16 v6, 0xc

    .line 363
    .line 364
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    check-cast v2, Lv/VImage;

    .line 369
    .line 370
    iput-object v2, p0, Ll/jbi;->J0:Lv/VImage;

    .line 371
    .line 372
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    check-cast v2, Landroid/view/ViewGroup;

    .line 377
    .line 378
    const/16 v6, 0xd

    .line 379
    .line 380
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v2

    .line 384
    iput-object v2, p0, Ll/jbi;->K0:Landroid/view/View;

    .line 385
    .line 386
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    check-cast v2, Landroid/view/ViewGroup;

    .line 391
    .line 392
    const/16 v6, 0xe

    .line 393
    .line 394
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    check-cast v2, Lv/VText;

    .line 399
    .line 400
    iput-object v2, p0, Ll/jbi;->L0:Lv/VText;

    .line 401
    .line 402
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    check-cast v2, Landroid/view/ViewGroup;

    .line 407
    .line 408
    const/16 v6, 0xf

    .line 409
    .line 410
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    check-cast v2, Lv/VImage;

    .line 415
    .line 416
    iput-object v2, p0, Ll/jbi;->M0:Lv/VImage;

    .line 417
    .line 418
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    check-cast v2, Landroid/view/ViewGroup;

    .line 423
    .line 424
    const/16 v6, 0x10

    .line 425
    .line 426
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    check-cast v2, Lv/VText;

    .line 431
    .line 432
    iput-object v2, p0, Ll/jbi;->N0:Lv/VText;

    .line 433
    .line 434
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v2

    .line 438
    check-cast v2, Landroid/view/ViewGroup;

    .line 439
    .line 440
    const/16 v6, 0x11

    .line 441
    .line 442
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    check-cast v2, Lv/VImage;

    .line 447
    .line 448
    iput-object v2, p0, Ll/jbi;->O0:Lv/VImage;

    .line 449
    .line 450
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    check-cast v2, Landroid/view/ViewGroup;

    .line 455
    .line 456
    const/16 v6, 0x12

    .line 457
    .line 458
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 459
    .line 460
    .line 461
    move-result-object v2

    .line 462
    check-cast v2, Lv/VDraweeView;

    .line 463
    .line 464
    iput-object v2, p0, Ll/jbi;->P0:Lv/VDraweeView;

    .line 465
    .line 466
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    check-cast v2, Landroid/view/ViewGroup;

    .line 471
    .line 472
    const/16 v6, 0x13

    .line 473
    .line 474
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    check-cast v2, Lv/VDraweeView;

    .line 479
    .line 480
    iput-object v2, p0, Ll/jbi;->Q0:Lv/VDraweeView;

    .line 481
    .line 482
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    check-cast v2, Landroid/view/ViewGroup;

    .line 487
    .line 488
    const/16 v6, 0x14

    .line 489
    .line 490
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 495
    .line 496
    iput-object v2, p0, Ll/jbi;->R0:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 497
    .line 498
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    check-cast v2, Landroid/view/ViewGroup;

    .line 503
    .line 504
    const/16 v6, 0x15

    .line 505
    .line 506
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 507
    .line 508
    .line 509
    move-result-object v2

    .line 510
    iput-object v2, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 511
    .line 512
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 513
    .line 514
    .line 515
    move-result-object v2

    .line 516
    check-cast v2, Landroid/view/ViewGroup;

    .line 517
    .line 518
    const/16 v6, 0x16

    .line 519
    .line 520
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 521
    .line 522
    .line 523
    move-result-object v2

    .line 524
    check-cast v2, Lv/VText;

    .line 525
    .line 526
    iput-object v2, p0, Ll/jbi;->T0:Lv/VText;

    .line 527
    .line 528
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 529
    .line 530
    .line 531
    move-result-object v2

    .line 532
    check-cast v2, Landroid/view/ViewGroup;

    .line 533
    .line 534
    const/16 v4, 0x17

    .line 535
    .line 536
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 537
    .line 538
    .line 539
    move-result-object v2

    .line 540
    check-cast v2, Lv/VImage;

    .line 541
    .line 542
    iput-object v2, p0, Ll/jbi;->U0:Lv/VImage;

    .line 543
    .line 544
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 545
    .line 546
    .line 547
    move-result-object v2

    .line 548
    check-cast v2, Landroid/widget/LinearLayout;

    .line 549
    .line 550
    iput-object v2, p0, Ll/jbi;->V0:Landroid/widget/LinearLayout;

    .line 551
    .line 552
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 553
    .line 554
    .line 555
    move-result-object v2

    .line 556
    check-cast v2, Landroid/widget/LinearLayout;

    .line 557
    .line 558
    iput-object v2, p0, Ll/jbi;->W0:Landroid/widget/LinearLayout;

    .line 559
    .line 560
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 561
    .line 562
    .line 563
    move-result-object v2

    .line 564
    check-cast v2, Landroid/view/ViewGroup;

    .line 565
    .line 566
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 567
    .line 568
    .line 569
    move-result-object v2

    .line 570
    iput-object v2, p0, Ll/jbi;->X0:Landroid/view/View;

    .line 571
    .line 572
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object v2

    .line 576
    check-cast v2, Landroid/view/ViewGroup;

    .line 577
    .line 578
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 579
    .line 580
    .line 581
    move-result-object v2

    .line 582
    check-cast v2, Landroid/widget/LinearLayout;

    .line 583
    .line 584
    iput-object v2, p0, Ll/jbi;->Y0:Landroid/widget/LinearLayout;

    .line 585
    .line 586
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    check-cast v2, Landroid/view/ViewGroup;

    .line 591
    .line 592
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 593
    .line 594
    .line 595
    move-result-object v2

    .line 596
    check-cast v2, Landroid/view/ViewGroup;

    .line 597
    .line 598
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    check-cast v0, Lv/VEditText;

    .line 603
    .line 604
    iput-object v0, p0, Ll/jbi;->Z0:Lv/VEditText;

    .line 605
    .line 606
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    check-cast v0, Landroid/view/ViewGroup;

    .line 611
    .line 612
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 613
    .line 614
    .line 615
    move-result-object v0

    .line 616
    check-cast v0, Landroid/view/ViewGroup;

    .line 617
    .line 618
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    check-cast v0, Landroid/widget/TextView;

    .line 623
    .line 624
    iput-object v0, p0, Ll/jbi;->a1:Landroid/widget/TextView;

    .line 625
    .line 626
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 627
    .line 628
    .line 629
    move-result-object p1

    .line 630
    check-cast p1, Landroid/view/ViewGroup;

    .line 631
    .line 632
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 633
    .line 634
    .line 635
    move-result-object p1

    .line 636
    check-cast p1, Lv/VLinear;

    .line 637
    .line 638
    iput-object p1, p0, Ll/jbi;->b1:Lv/VLinear;

    .line 639
    .line 640
    return-void
.end method

.method public static b(Ll/jbi;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->O2:I

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
    invoke-static {p0, p1}, Ll/kbi;->a(Ll/jbi;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
