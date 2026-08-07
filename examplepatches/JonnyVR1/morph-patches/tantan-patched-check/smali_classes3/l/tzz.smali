.class public Ll/tzz;
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

.method public static a(Ll/qzz;Landroid/view/View;)V
    .locals 9

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/FrameLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/qzz;->i:Landroid/widget/FrameLayout;

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
    check-cast v1, Lv/VDraweeView;

    .line 14
    .line 15
    iput-object v1, p0, Ll/qzz;->j:Lv/VDraweeView;

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
    iput-object v2, p0, Ll/qzz;->k:Landroid/view/View;

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/tantan/library/svga/SVGAnimationView;

    .line 30
    .line 31
    iput-object v3, p0, Ll/qzz;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;

    .line 39
    .line 40
    iput-object v4, p0, Ll/qzz;->m:Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;

    .line 41
    .line 42
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Lcom/tantan/library/svga/SVGAnimationView;

    .line 53
    .line 54
    iput-object v4, p0, Ll/qzz;->n:Lcom/tantan/library/svga/SVGAnimationView;

    .line 55
    .line 56
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Landroid/widget/LinearLayout;

    .line 67
    .line 68
    iput-object v4, p0, Ll/qzz;->o:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Landroid/view/ViewGroup;

    .line 75
    .line 76
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    check-cast v4, Landroid/view/ViewGroup;

    .line 81
    .line 82
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Lv/VLinear;

    .line 87
    .line 88
    iput-object v4, p0, Ll/qzz;->p:Lv/VLinear;

    .line 89
    .line 90
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, Landroid/view/ViewGroup;

    .line 95
    .line 96
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    check-cast v4, Landroid/view/ViewGroup;

    .line 107
    .line 108
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    check-cast v4, Landroid/view/ViewGroup;

    .line 113
    .line 114
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    check-cast v4, Lv/VText;

    .line 119
    .line 120
    iput-object v4, p0, Ll/qzz;->q:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    check-cast v4, Landroid/view/ViewGroup;

    .line 127
    .line 128
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    check-cast v4, Landroid/view/ViewGroup;

    .line 133
    .line 134
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    check-cast v4, Landroid/view/ViewGroup;

    .line 139
    .line 140
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    check-cast v4, Landroid/view/ViewGroup;

    .line 145
    .line 146
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    check-cast v4, Lv/VText;

    .line 151
    .line 152
    iput-object v4, p0, Ll/qzz;->r:Lv/VText;

    .line 153
    .line 154
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    check-cast v4, Landroid/view/ViewGroup;

    .line 171
    .line 172
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Lv/VButton;

    .line 177
    .line 178
    iput-object v4, p0, Ll/qzz;->s:Lv/VButton;

    .line 179
    .line 180
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    check-cast v4, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    check-cast v4, Landroid/view/ViewGroup;

    .line 197
    .line 198
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    check-cast v4, Lv/VImage;

    .line 203
    .line 204
    iput-object v4, p0, Ll/qzz;->t:Lv/VImage;

    .line 205
    .line 206
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    check-cast v4, Landroid/view/ViewGroup;

    .line 211
    .line 212
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    check-cast v4, Landroid/view/ViewGroup;

    .line 217
    .line 218
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    check-cast v4, Landroid/widget/LinearLayout;

    .line 223
    .line 224
    iput-object v4, p0, Ll/qzz;->u:Landroid/widget/LinearLayout;

    .line 225
    .line 226
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    check-cast v4, Landroid/view/ViewGroup;

    .line 231
    .line 232
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    check-cast v4, Landroid/view/ViewGroup;

    .line 237
    .line 238
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    check-cast v4, Landroid/view/ViewGroup;

    .line 243
    .line 244
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    check-cast v4, Lv/VText;

    .line 249
    .line 250
    iput-object v4, p0, Ll/qzz;->v:Lv/VText;

    .line 251
    .line 252
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    check-cast v4, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    check-cast v4, Landroid/view/ViewGroup;

    .line 263
    .line 264
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    check-cast v4, Landroid/view/ViewGroup;

    .line 269
    .line 270
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    check-cast v4, Lv/VButton;

    .line 275
    .line 276
    iput-object v4, p0, Ll/qzz;->w:Lv/VButton;

    .line 277
    .line 278
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v4

    .line 282
    check-cast v4, Landroid/view/ViewGroup;

    .line 283
    .line 284
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    check-cast v4, Landroid/view/ViewGroup;

    .line 289
    .line 290
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 291
    .line 292
    .line 293
    move-result-object v4

    .line 294
    check-cast v4, Landroid/view/ViewGroup;

    .line 295
    .line 296
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    check-cast v4, Lv/VImage;

    .line 301
    .line 302
    iput-object v4, p0, Ll/qzz;->x:Lv/VImage;

    .line 303
    .line 304
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    check-cast v4, Landroid/view/ViewGroup;

    .line 309
    .line 310
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    check-cast v4, Landroid/view/ViewGroup;

    .line 315
    .line 316
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v4

    .line 320
    check-cast v4, Landroid/widget/LinearLayout;

    .line 321
    .line 322
    iput-object v4, p0, Ll/qzz;->y:Landroid/widget/LinearLayout;

    .line 323
    .line 324
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    check-cast v4, Landroid/view/ViewGroup;

    .line 329
    .line 330
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 331
    .line 332
    .line 333
    move-result-object v4

    .line 334
    check-cast v4, Landroid/view/ViewGroup;

    .line 335
    .line 336
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object v4

    .line 340
    check-cast v4, Landroid/view/ViewGroup;

    .line 341
    .line 342
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    check-cast v4, Landroid/view/ViewGroup;

    .line 347
    .line 348
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    check-cast v4, Lv/VText;

    .line 353
    .line 354
    iput-object v4, p0, Ll/qzz;->z:Lv/VText;

    .line 355
    .line 356
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    check-cast v4, Landroid/view/ViewGroup;

    .line 361
    .line 362
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v4

    .line 366
    check-cast v4, Landroid/view/ViewGroup;

    .line 367
    .line 368
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    check-cast v4, Landroid/view/ViewGroup;

    .line 373
    .line 374
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    check-cast v4, Landroid/view/ViewGroup;

    .line 379
    .line 380
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    check-cast v4, Lv/VText;

    .line 385
    .line 386
    iput-object v4, p0, Ll/qzz;->A:Lv/VText;

    .line 387
    .line 388
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    check-cast v4, Landroid/view/ViewGroup;

    .line 393
    .line 394
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    check-cast v4, Landroid/view/ViewGroup;

    .line 399
    .line 400
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 401
    .line 402
    .line 403
    move-result-object v4

    .line 404
    check-cast v4, Landroid/view/ViewGroup;

    .line 405
    .line 406
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object v4

    .line 410
    check-cast v4, Lv/VButton;

    .line 411
    .line 412
    iput-object v4, p0, Ll/qzz;->B:Lv/VButton;

    .line 413
    .line 414
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 415
    .line 416
    .line 417
    move-result-object v4

    .line 418
    check-cast v4, Landroid/view/ViewGroup;

    .line 419
    .line 420
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    check-cast v4, Landroid/view/ViewGroup;

    .line 425
    .line 426
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    check-cast v4, Landroid/widget/LinearLayout;

    .line 431
    .line 432
    iput-object v4, p0, Ll/qzz;->C:Landroid/widget/LinearLayout;

    .line 433
    .line 434
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v4

    .line 438
    check-cast v4, Landroid/view/ViewGroup;

    .line 439
    .line 440
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    check-cast v4, Landroid/view/ViewGroup;

    .line 445
    .line 446
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    check-cast v4, Landroid/view/ViewGroup;

    .line 451
    .line 452
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    check-cast v4, Landroid/view/ViewGroup;

    .line 457
    .line 458
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    check-cast v4, Lv/VText;

    .line 463
    .line 464
    iput-object v4, p0, Ll/qzz;->D:Lv/VText;

    .line 465
    .line 466
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v4

    .line 470
    check-cast v4, Landroid/view/ViewGroup;

    .line 471
    .line 472
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 473
    .line 474
    .line 475
    move-result-object v4

    .line 476
    check-cast v4, Landroid/view/ViewGroup;

    .line 477
    .line 478
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    check-cast v4, Landroid/view/ViewGroup;

    .line 483
    .line 484
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 485
    .line 486
    .line 487
    move-result-object v4

    .line 488
    check-cast v4, Landroid/view/ViewGroup;

    .line 489
    .line 490
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 491
    .line 492
    .line 493
    move-result-object v4

    .line 494
    check-cast v4, Lv/VText;

    .line 495
    .line 496
    iput-object v4, p0, Ll/qzz;->E:Lv/VText;

    .line 497
    .line 498
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    check-cast v4, Landroid/view/ViewGroup;

    .line 503
    .line 504
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    check-cast v4, Landroid/view/ViewGroup;

    .line 509
    .line 510
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 511
    .line 512
    .line 513
    move-result-object v4

    .line 514
    check-cast v4, Landroid/view/ViewGroup;

    .line 515
    .line 516
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 517
    .line 518
    .line 519
    move-result-object v4

    .line 520
    check-cast v4, Lv/VButton;

    .line 521
    .line 522
    iput-object v4, p0, Ll/qzz;->F:Lv/VButton;

    .line 523
    .line 524
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 525
    .line 526
    .line 527
    move-result-object v4

    .line 528
    check-cast v4, Landroid/view/ViewGroup;

    .line 529
    .line 530
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 531
    .line 532
    .line 533
    move-result-object v4

    .line 534
    check-cast v4, Landroid/view/ViewGroup;

    .line 535
    .line 536
    const/4 v5, 0x4

    .line 537
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 538
    .line 539
    .line 540
    move-result-object v4

    .line 541
    iput-object v4, p0, Ll/qzz;->G:Landroid/view/View;

    .line 542
    .line 543
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object v4

    .line 547
    check-cast v4, Landroid/view/ViewGroup;

    .line 548
    .line 549
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 550
    .line 551
    .line 552
    move-result-object v4

    .line 553
    check-cast v4, Landroid/view/ViewGroup;

    .line 554
    .line 555
    const/4 v6, 0x5

    .line 556
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 557
    .line 558
    .line 559
    move-result-object v4

    .line 560
    check-cast v4, Landroid/widget/LinearLayout;

    .line 561
    .line 562
    iput-object v4, p0, Ll/qzz;->H:Landroid/widget/LinearLayout;

    .line 563
    .line 564
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    check-cast v4, Landroid/view/ViewGroup;

    .line 569
    .line 570
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 571
    .line 572
    .line 573
    move-result-object v4

    .line 574
    check-cast v4, Landroid/view/ViewGroup;

    .line 575
    .line 576
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 577
    .line 578
    .line 579
    move-result-object v4

    .line 580
    check-cast v4, Landroid/view/ViewGroup;

    .line 581
    .line 582
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 583
    .line 584
    .line 585
    move-result-object v4

    .line 586
    check-cast v4, Landroid/view/ViewGroup;

    .line 587
    .line 588
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 589
    .line 590
    .line 591
    move-result-object v4

    .line 592
    check-cast v4, Lv/VText;

    .line 593
    .line 594
    iput-object v4, p0, Ll/qzz;->I:Lv/VText;

    .line 595
    .line 596
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 597
    .line 598
    .line 599
    move-result-object v4

    .line 600
    check-cast v4, Landroid/view/ViewGroup;

    .line 601
    .line 602
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 603
    .line 604
    .line 605
    move-result-object v4

    .line 606
    check-cast v4, Landroid/view/ViewGroup;

    .line 607
    .line 608
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 609
    .line 610
    .line 611
    move-result-object v4

    .line 612
    check-cast v4, Landroid/view/ViewGroup;

    .line 613
    .line 614
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 615
    .line 616
    .line 617
    move-result-object v4

    .line 618
    check-cast v4, Landroid/view/ViewGroup;

    .line 619
    .line 620
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 621
    .line 622
    .line 623
    move-result-object v4

    .line 624
    check-cast v4, Lv/VText_AutoFit;

    .line 625
    .line 626
    iput-object v4, p0, Ll/qzz;->J:Lv/VText_AutoFit;

    .line 627
    .line 628
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object v4

    .line 632
    check-cast v4, Landroid/view/ViewGroup;

    .line 633
    .line 634
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 635
    .line 636
    .line 637
    move-result-object v4

    .line 638
    check-cast v4, Landroid/view/ViewGroup;

    .line 639
    .line 640
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 641
    .line 642
    .line 643
    move-result-object v4

    .line 644
    check-cast v4, Landroid/view/ViewGroup;

    .line 645
    .line 646
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 647
    .line 648
    .line 649
    move-result-object v4

    .line 650
    check-cast v4, Lv/VButton;

    .line 651
    .line 652
    iput-object v4, p0, Ll/qzz;->K:Lv/VButton;

    .line 653
    .line 654
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 655
    .line 656
    .line 657
    move-result-object v4

    .line 658
    check-cast v4, Landroid/view/ViewGroup;

    .line 659
    .line 660
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 661
    .line 662
    .line 663
    move-result-object v4

    .line 664
    check-cast v4, Landroid/view/ViewGroup;

    .line 665
    .line 666
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 667
    .line 668
    .line 669
    move-result-object v4

    .line 670
    check-cast v4, Landroid/view/ViewGroup;

    .line 671
    .line 672
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 673
    .line 674
    .line 675
    move-result-object v4

    .line 676
    check-cast v4, Lv/VImage;

    .line 677
    .line 678
    iput-object v4, p0, Ll/qzz;->L:Lv/VImage;

    .line 679
    .line 680
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 681
    .line 682
    .line 683
    move-result-object v4

    .line 684
    check-cast v4, Landroid/view/ViewGroup;

    .line 685
    .line 686
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 687
    .line 688
    .line 689
    move-result-object v4

    .line 690
    check-cast v4, Landroid/view/ViewGroup;

    .line 691
    .line 692
    const/4 v7, 0x6

    .line 693
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 694
    .line 695
    .line 696
    move-result-object v4

    .line 697
    check-cast v4, Landroid/widget/LinearLayout;

    .line 698
    .line 699
    iput-object v4, p0, Ll/qzz;->M:Landroid/widget/LinearLayout;

    .line 700
    .line 701
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 702
    .line 703
    .line 704
    move-result-object v4

    .line 705
    check-cast v4, Landroid/view/ViewGroup;

    .line 706
    .line 707
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 708
    .line 709
    .line 710
    move-result-object v4

    .line 711
    check-cast v4, Landroid/view/ViewGroup;

    .line 712
    .line 713
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 714
    .line 715
    .line 716
    move-result-object v4

    .line 717
    check-cast v4, Landroid/view/ViewGroup;

    .line 718
    .line 719
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 720
    .line 721
    .line 722
    move-result-object v4

    .line 723
    check-cast v4, Lv/VText;

    .line 724
    .line 725
    iput-object v4, p0, Ll/qzz;->N:Lv/VText;

    .line 726
    .line 727
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 728
    .line 729
    .line 730
    move-result-object v4

    .line 731
    check-cast v4, Landroid/view/ViewGroup;

    .line 732
    .line 733
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 734
    .line 735
    .line 736
    move-result-object v4

    .line 737
    check-cast v4, Landroid/view/ViewGroup;

    .line 738
    .line 739
    const/4 v8, 0x7

    .line 740
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 741
    .line 742
    .line 743
    move-result-object v4

    .line 744
    check-cast v4, Lv/VFrame;

    .line 745
    .line 746
    iput-object v4, p0, Ll/qzz;->O:Lv/VFrame;

    .line 747
    .line 748
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 749
    .line 750
    .line 751
    move-result-object v4

    .line 752
    check-cast v4, Landroid/view/ViewGroup;

    .line 753
    .line 754
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 755
    .line 756
    .line 757
    move-result-object v4

    .line 758
    check-cast v4, Landroid/view/ViewGroup;

    .line 759
    .line 760
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 761
    .line 762
    .line 763
    move-result-object v4

    .line 764
    check-cast v4, Landroid/view/ViewGroup;

    .line 765
    .line 766
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 767
    .line 768
    .line 769
    move-result-object v4

    .line 770
    check-cast v4, Landroid/view/ViewGroup;

    .line 771
    .line 772
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 773
    .line 774
    .line 775
    move-result-object v4

    .line 776
    check-cast v4, Lv/VFrame;

    .line 777
    .line 778
    iput-object v4, p0, Ll/qzz;->P:Lv/VFrame;

    .line 779
    .line 780
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 781
    .line 782
    .line 783
    move-result-object v4

    .line 784
    check-cast v4, Landroid/view/ViewGroup;

    .line 785
    .line 786
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 787
    .line 788
    .line 789
    move-result-object v4

    .line 790
    check-cast v4, Landroid/view/ViewGroup;

    .line 791
    .line 792
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 793
    .line 794
    .line 795
    move-result-object v4

    .line 796
    check-cast v4, Landroid/view/ViewGroup;

    .line 797
    .line 798
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 799
    .line 800
    .line 801
    move-result-object v4

    .line 802
    check-cast v4, Landroid/view/ViewGroup;

    .line 803
    .line 804
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 805
    .line 806
    .line 807
    move-result-object v4

    .line 808
    check-cast v4, Landroid/view/ViewGroup;

    .line 809
    .line 810
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 811
    .line 812
    .line 813
    move-result-object v4

    .line 814
    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    .line 815
    .line 816
    iput-object v4, p0, Ll/qzz;->Q:Landroidx/recyclerview/widget/RecyclerView;

    .line 817
    .line 818
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 819
    .line 820
    .line 821
    move-result-object v4

    .line 822
    check-cast v4, Landroid/view/ViewGroup;

    .line 823
    .line 824
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 825
    .line 826
    .line 827
    move-result-object v4

    .line 828
    check-cast v4, Landroid/view/ViewGroup;

    .line 829
    .line 830
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 831
    .line 832
    .line 833
    move-result-object v4

    .line 834
    check-cast v4, Landroid/view/ViewGroup;

    .line 835
    .line 836
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 837
    .line 838
    .line 839
    move-result-object v4

    .line 840
    check-cast v4, Landroid/view/ViewGroup;

    .line 841
    .line 842
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 843
    .line 844
    .line 845
    move-result-object v4

    .line 846
    check-cast v4, Lv/VFrame;

    .line 847
    .line 848
    iput-object v4, p0, Ll/qzz;->R:Lv/VFrame;

    .line 849
    .line 850
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 851
    .line 852
    .line 853
    move-result-object v4

    .line 854
    check-cast v4, Landroid/view/ViewGroup;

    .line 855
    .line 856
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 857
    .line 858
    .line 859
    move-result-object v4

    .line 860
    check-cast v4, Landroid/view/ViewGroup;

    .line 861
    .line 862
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 863
    .line 864
    .line 865
    move-result-object v4

    .line 866
    check-cast v4, Landroid/view/ViewGroup;

    .line 867
    .line 868
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 869
    .line 870
    .line 871
    move-result-object v4

    .line 872
    check-cast v4, Landroid/view/ViewGroup;

    .line 873
    .line 874
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 875
    .line 876
    .line 877
    move-result-object v4

    .line 878
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    .line 879
    .line 880
    iput-object v4, p0, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    .line 881
    .line 882
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 883
    .line 884
    .line 885
    move-result-object v4

    .line 886
    check-cast v4, Landroid/view/ViewGroup;

    .line 887
    .line 888
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 889
    .line 890
    .line 891
    move-result-object v4

    .line 892
    check-cast v4, Landroid/view/ViewGroup;

    .line 893
    .line 894
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 895
    .line 896
    .line 897
    move-result-object v4

    .line 898
    check-cast v4, Landroid/view/ViewGroup;

    .line 899
    .line 900
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 901
    .line 902
    .line 903
    move-result-object v4

    .line 904
    check-cast v4, Landroid/view/ViewGroup;

    .line 905
    .line 906
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 907
    .line 908
    .line 909
    move-result-object v4

    .line 910
    check-cast v4, Landroid/view/ViewGroup;

    .line 911
    .line 912
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 913
    .line 914
    .line 915
    move-result-object v4

    .line 916
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 917
    .line 918
    iput-object v4, p0, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 919
    .line 920
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 921
    .line 922
    .line 923
    move-result-object v4

    .line 924
    check-cast v4, Landroid/view/ViewGroup;

    .line 925
    .line 926
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 927
    .line 928
    .line 929
    move-result-object v4

    .line 930
    check-cast v4, Landroid/view/ViewGroup;

    .line 931
    .line 932
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 933
    .line 934
    .line 935
    move-result-object v4

    .line 936
    check-cast v4, Landroid/view/ViewGroup;

    .line 937
    .line 938
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 939
    .line 940
    .line 941
    move-result-object v4

    .line 942
    check-cast v4, Landroid/view/ViewGroup;

    .line 943
    .line 944
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 945
    .line 946
    .line 947
    move-result-object v4

    .line 948
    check-cast v4, Landroid/view/ViewGroup;

    .line 949
    .line 950
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 951
    .line 952
    .line 953
    move-result-object v4

    .line 954
    check-cast v4, Landroid/view/ViewGroup;

    .line 955
    .line 956
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 957
    .line 958
    .line 959
    move-result-object v4

    .line 960
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 961
    .line 962
    iput-object v4, p0, Ll/qzz;->U:Lcom/p1/mobile/putong/core/ui/messages/recycler/wrap/MessageRecyclerView;

    .line 963
    .line 964
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 965
    .line 966
    .line 967
    move-result-object v4

    .line 968
    check-cast v4, Landroid/view/ViewGroup;

    .line 969
    .line 970
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 971
    .line 972
    .line 973
    move-result-object v4

    .line 974
    check-cast v4, Landroid/view/ViewGroup;

    .line 975
    .line 976
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 977
    .line 978
    .line 979
    move-result-object v4

    .line 980
    check-cast v4, Landroid/view/ViewGroup;

    .line 981
    .line 982
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 983
    .line 984
    .line 985
    move-result-object v4

    .line 986
    check-cast v4, Landroid/view/ViewGroup;

    .line 987
    .line 988
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 989
    .line 990
    .line 991
    move-result-object v4

    .line 992
    check-cast v4, Landroid/view/ViewGroup;

    .line 993
    .line 994
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 995
    .line 996
    .line 997
    move-result-object v4

    .line 998
    check-cast v4, Landroid/view/ViewGroup;

    .line 999
    .line 1000
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v4

    .line 1004
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/ProxyTantanListView;

    .line 1005
    .line 1006
    iput-object v4, p0, Ll/qzz;->V:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/ProxyTantanListView;

    .line 1007
    .line 1008
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v4

    .line 1012
    check-cast v4, Landroid/view/ViewGroup;

    .line 1013
    .line 1014
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v4

    .line 1018
    check-cast v4, Landroid/view/ViewGroup;

    .line 1019
    .line 1020
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v4

    .line 1024
    check-cast v4, Landroid/view/ViewGroup;

    .line 1025
    .line 1026
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1027
    .line 1028
    .line 1029
    move-result-object v4

    .line 1030
    check-cast v4, Landroid/view/ViewGroup;

    .line 1031
    .line 1032
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v4

    .line 1036
    check-cast v4, Landroid/view/ViewGroup;

    .line 1037
    .line 1038
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1039
    .line 1040
    .line 1041
    move-result-object v4

    .line 1042
    check-cast v4, Landroid/view/ViewGroup;

    .line 1043
    .line 1044
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v4

    .line 1048
    check-cast v4, Landroid/widget/LinearLayout;

    .line 1049
    .line 1050
    iput-object v4, p0, Ll/qzz;->W:Landroid/widget/LinearLayout;

    .line 1051
    .line 1052
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1053
    .line 1054
    .line 1055
    move-result-object v4

    .line 1056
    check-cast v4, Landroid/view/ViewGroup;

    .line 1057
    .line 1058
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v4

    .line 1062
    check-cast v4, Landroid/view/ViewGroup;

    .line 1063
    .line 1064
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v4

    .line 1068
    check-cast v4, Landroid/view/ViewGroup;

    .line 1069
    .line 1070
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v4

    .line 1074
    check-cast v4, Landroid/view/ViewGroup;

    .line 1075
    .line 1076
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v4

    .line 1080
    check-cast v4, Landroid/view/ViewGroup;

    .line 1081
    .line 1082
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1083
    .line 1084
    .line 1085
    move-result-object v4

    .line 1086
    check-cast v4, Landroid/view/ViewGroup;

    .line 1087
    .line 1088
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v4

    .line 1092
    check-cast v4, Landroid/view/ViewGroup;

    .line 1093
    .line 1094
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v4

    .line 1098
    check-cast v4, Landroid/widget/TextView;

    .line 1099
    .line 1100
    iput-object v4, p0, Ll/qzz;->X:Landroid/widget/TextView;

    .line 1101
    .line 1102
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v4

    .line 1106
    check-cast v4, Landroid/view/ViewGroup;

    .line 1107
    .line 1108
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1109
    .line 1110
    .line 1111
    move-result-object v4

    .line 1112
    check-cast v4, Landroid/view/ViewGroup;

    .line 1113
    .line 1114
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v4

    .line 1118
    check-cast v4, Landroid/view/ViewGroup;

    .line 1119
    .line 1120
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v4

    .line 1124
    check-cast v4, Landroid/view/ViewGroup;

    .line 1125
    .line 1126
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v4

    .line 1130
    check-cast v4, Landroid/view/ViewGroup;

    .line 1131
    .line 1132
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1133
    .line 1134
    .line 1135
    move-result-object v4

    .line 1136
    check-cast v4, Landroid/view/ViewGroup;

    .line 1137
    .line 1138
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v4

    .line 1142
    check-cast v4, Landroid/view/ViewGroup;

    .line 1143
    .line 1144
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v4

    .line 1148
    check-cast v4, Landroid/widget/TextView;

    .line 1149
    .line 1150
    iput-object v4, p0, Ll/qzz;->Y:Landroid/widget/TextView;

    .line 1151
    .line 1152
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v4

    .line 1156
    check-cast v4, Landroid/view/ViewGroup;

    .line 1157
    .line 1158
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1159
    .line 1160
    .line 1161
    move-result-object v4

    .line 1162
    check-cast v4, Landroid/view/ViewGroup;

    .line 1163
    .line 1164
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v4

    .line 1168
    check-cast v4, Landroid/view/ViewGroup;

    .line 1169
    .line 1170
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v4

    .line 1174
    check-cast v4, Landroid/view/ViewGroup;

    .line 1175
    .line 1176
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v4

    .line 1180
    check-cast v4, Landroid/view/ViewGroup;

    .line 1181
    .line 1182
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v4

    .line 1186
    check-cast v4, Landroid/view/ViewGroup;

    .line 1187
    .line 1188
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v4

    .line 1192
    check-cast v4, Landroid/view/ViewGroup;

    .line 1193
    .line 1194
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v4

    .line 1198
    check-cast v4, Landroid/widget/TextView;

    .line 1199
    .line 1200
    iput-object v4, p0, Ll/qzz;->Z:Landroid/widget/TextView;

    .line 1201
    .line 1202
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1203
    .line 1204
    .line 1205
    move-result-object v4

    .line 1206
    check-cast v4, Landroid/view/ViewGroup;

    .line 1207
    .line 1208
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1209
    .line 1210
    .line 1211
    move-result-object v4

    .line 1212
    check-cast v4, Landroid/view/ViewGroup;

    .line 1213
    .line 1214
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v4

    .line 1218
    check-cast v4, Landroid/view/ViewGroup;

    .line 1219
    .line 1220
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v4

    .line 1224
    check-cast v4, Landroid/view/ViewGroup;

    .line 1225
    .line 1226
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1227
    .line 1228
    .line 1229
    move-result-object v4

    .line 1230
    check-cast v4, Landroid/view/ViewGroup;

    .line 1231
    .line 1232
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1233
    .line 1234
    .line 1235
    move-result-object v4

    .line 1236
    check-cast v4, Landroid/view/ViewGroup;

    .line 1237
    .line 1238
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1239
    .line 1240
    .line 1241
    move-result-object v4

    .line 1242
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    .line 1243
    .line 1244
    iput-object v4, p0, Ll/qzz;->k0:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    .line 1245
    .line 1246
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v4

    .line 1250
    check-cast v4, Landroid/view/ViewGroup;

    .line 1251
    .line 1252
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1253
    .line 1254
    .line 1255
    move-result-object v4

    .line 1256
    check-cast v4, Landroid/view/ViewGroup;

    .line 1257
    .line 1258
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v4

    .line 1262
    check-cast v4, Landroid/view/ViewGroup;

    .line 1263
    .line 1264
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v4

    .line 1268
    check-cast v4, Landroid/view/ViewGroup;

    .line 1269
    .line 1270
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1271
    .line 1272
    .line 1273
    move-result-object v4

    .line 1274
    check-cast v4, Landroid/view/ViewGroup;

    .line 1275
    .line 1276
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1277
    .line 1278
    .line 1279
    move-result-object v4

    .line 1280
    check-cast v4, Landroid/view/ViewGroup;

    .line 1281
    .line 1282
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1283
    .line 1284
    .line 1285
    move-result-object v4

    .line 1286
    check-cast v4, Lv/VLinear;

    .line 1287
    .line 1288
    iput-object v4, p0, Ll/qzz;->p0:Lv/VLinear;

    .line 1289
    .line 1290
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v4

    .line 1294
    check-cast v4, Landroid/view/ViewGroup;

    .line 1295
    .line 1296
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1297
    .line 1298
    .line 1299
    move-result-object v4

    .line 1300
    check-cast v4, Landroid/view/ViewGroup;

    .line 1301
    .line 1302
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v4

    .line 1306
    check-cast v4, Landroid/view/ViewGroup;

    .line 1307
    .line 1308
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1309
    .line 1310
    .line 1311
    move-result-object v4

    .line 1312
    check-cast v4, Landroid/view/ViewGroup;

    .line 1313
    .line 1314
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1315
    .line 1316
    .line 1317
    move-result-object v4

    .line 1318
    check-cast v4, Landroid/view/ViewGroup;

    .line 1319
    .line 1320
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1321
    .line 1322
    .line 1323
    move-result-object v4

    .line 1324
    check-cast v4, Landroid/view/ViewGroup;

    .line 1325
    .line 1326
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v4

    .line 1330
    check-cast v4, Landroid/view/ViewGroup;

    .line 1331
    .line 1332
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v4

    .line 1336
    check-cast v4, Lv/VDraweeView;

    .line 1337
    .line 1338
    iput-object v4, p0, Ll/qzz;->E0:Lv/VDraweeView;

    .line 1339
    .line 1340
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1341
    .line 1342
    .line 1343
    move-result-object v4

    .line 1344
    check-cast v4, Landroid/view/ViewGroup;

    .line 1345
    .line 1346
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1347
    .line 1348
    .line 1349
    move-result-object v4

    .line 1350
    check-cast v4, Landroid/view/ViewGroup;

    .line 1351
    .line 1352
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v4

    .line 1356
    check-cast v4, Landroid/view/ViewGroup;

    .line 1357
    .line 1358
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1359
    .line 1360
    .line 1361
    move-result-object v4

    .line 1362
    check-cast v4, Landroid/view/ViewGroup;

    .line 1363
    .line 1364
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1365
    .line 1366
    .line 1367
    move-result-object v4

    .line 1368
    check-cast v4, Landroid/view/ViewGroup;

    .line 1369
    .line 1370
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1371
    .line 1372
    .line 1373
    move-result-object v4

    .line 1374
    check-cast v4, Landroid/view/ViewGroup;

    .line 1375
    .line 1376
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1377
    .line 1378
    .line 1379
    move-result-object v4

    .line 1380
    check-cast v4, Landroid/view/ViewGroup;

    .line 1381
    .line 1382
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1383
    .line 1384
    .line 1385
    move-result-object v4

    .line 1386
    check-cast v4, Lv/VText;

    .line 1387
    .line 1388
    iput-object v4, p0, Ll/qzz;->F0:Lv/VText;

    .line 1389
    .line 1390
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v4

    .line 1394
    check-cast v4, Landroid/view/ViewGroup;

    .line 1395
    .line 1396
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1397
    .line 1398
    .line 1399
    move-result-object v4

    .line 1400
    check-cast v4, Landroid/view/ViewGroup;

    .line 1401
    .line 1402
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1403
    .line 1404
    .line 1405
    move-result-object v4

    .line 1406
    check-cast v4, Landroid/view/ViewGroup;

    .line 1407
    .line 1408
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1409
    .line 1410
    .line 1411
    move-result-object v4

    .line 1412
    check-cast v4, Landroid/view/ViewGroup;

    .line 1413
    .line 1414
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v4

    .line 1418
    check-cast v4, Landroid/view/ViewGroup;

    .line 1419
    .line 1420
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1421
    .line 1422
    .line 1423
    move-result-object v4

    .line 1424
    check-cast v4, Landroid/view/ViewGroup;

    .line 1425
    .line 1426
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1427
    .line 1428
    .line 1429
    move-result-object v4

    .line 1430
    check-cast v4, Landroid/widget/LinearLayout;

    .line 1431
    .line 1432
    iput-object v4, p0, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 1433
    .line 1434
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v4

    .line 1438
    check-cast v4, Landroid/view/ViewGroup;

    .line 1439
    .line 1440
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1441
    .line 1442
    .line 1443
    move-result-object v4

    .line 1444
    check-cast v4, Landroid/view/ViewGroup;

    .line 1445
    .line 1446
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1447
    .line 1448
    .line 1449
    move-result-object v4

    .line 1450
    check-cast v4, Landroid/view/ViewGroup;

    .line 1451
    .line 1452
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v4

    .line 1456
    check-cast v4, Landroid/view/ViewGroup;

    .line 1457
    .line 1458
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1459
    .line 1460
    .line 1461
    move-result-object v4

    .line 1462
    check-cast v4, Landroid/view/ViewGroup;

    .line 1463
    .line 1464
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1465
    .line 1466
    .line 1467
    move-result-object v4

    .line 1468
    check-cast v4, Landroid/view/ViewGroup;

    .line 1469
    .line 1470
    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1471
    .line 1472
    .line 1473
    move-result-object v4

    .line 1474
    check-cast v4, Lv/VFrame;

    .line 1475
    .line 1476
    iput-object v4, p0, Ll/qzz;->H0:Lv/VFrame;

    .line 1477
    .line 1478
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1479
    .line 1480
    .line 1481
    move-result-object v4

    .line 1482
    check-cast v4, Landroid/view/ViewGroup;

    .line 1483
    .line 1484
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v4

    .line 1488
    check-cast v4, Landroid/view/ViewGroup;

    .line 1489
    .line 1490
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1491
    .line 1492
    .line 1493
    move-result-object v4

    .line 1494
    check-cast v4, Landroid/view/ViewGroup;

    .line 1495
    .line 1496
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1497
    .line 1498
    .line 1499
    move-result-object v4

    .line 1500
    check-cast v4, Landroid/view/ViewGroup;

    .line 1501
    .line 1502
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1503
    .line 1504
    .line 1505
    move-result-object v4

    .line 1506
    check-cast v4, Landroid/view/ViewGroup;

    .line 1507
    .line 1508
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v4

    .line 1512
    iput-object v4, p0, Ll/qzz;->I0:Landroid/view/View;

    .line 1513
    .line 1514
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1515
    .line 1516
    .line 1517
    move-result-object v4

    .line 1518
    check-cast v4, Landroid/view/ViewGroup;

    .line 1519
    .line 1520
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1521
    .line 1522
    .line 1523
    move-result-object v4

    .line 1524
    check-cast v4, Landroid/view/ViewGroup;

    .line 1525
    .line 1526
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1527
    .line 1528
    .line 1529
    move-result-object v4

    .line 1530
    check-cast v4, Landroid/view/ViewGroup;

    .line 1531
    .line 1532
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1533
    .line 1534
    .line 1535
    move-result-object v4

    .line 1536
    check-cast v4, Landroid/view/ViewGroup;

    .line 1537
    .line 1538
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1539
    .line 1540
    .line 1541
    move-result-object v4

    .line 1542
    check-cast v4, Landroid/view/ViewGroup;

    .line 1543
    .line 1544
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1545
    .line 1546
    .line 1547
    move-result-object v4

    .line 1548
    check-cast v4, Lv/VLinear;

    .line 1549
    .line 1550
    iput-object v4, p0, Ll/qzz;->J0:Lv/VLinear;

    .line 1551
    .line 1552
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1553
    .line 1554
    .line 1555
    move-result-object v4

    .line 1556
    check-cast v4, Landroid/view/ViewGroup;

    .line 1557
    .line 1558
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1559
    .line 1560
    .line 1561
    move-result-object v4

    .line 1562
    check-cast v4, Landroid/view/ViewGroup;

    .line 1563
    .line 1564
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1565
    .line 1566
    .line 1567
    move-result-object v4

    .line 1568
    check-cast v4, Landroid/view/ViewGroup;

    .line 1569
    .line 1570
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1571
    .line 1572
    .line 1573
    move-result-object v4

    .line 1574
    check-cast v4, Landroid/view/ViewGroup;

    .line 1575
    .line 1576
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1577
    .line 1578
    .line 1579
    move-result-object v4

    .line 1580
    check-cast v4, Landroid/view/ViewGroup;

    .line 1581
    .line 1582
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1583
    .line 1584
    .line 1585
    move-result-object v4

    .line 1586
    check-cast v4, Landroid/view/ViewGroup;

    .line 1587
    .line 1588
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1589
    .line 1590
    .line 1591
    move-result-object v4

    .line 1592
    check-cast v4, Lv/VImage;

    .line 1593
    .line 1594
    iput-object v4, p0, Ll/qzz;->K0:Lv/VImage;

    .line 1595
    .line 1596
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1597
    .line 1598
    .line 1599
    move-result-object v4

    .line 1600
    check-cast v4, Landroid/view/ViewGroup;

    .line 1601
    .line 1602
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1603
    .line 1604
    .line 1605
    move-result-object v4

    .line 1606
    check-cast v4, Landroid/view/ViewGroup;

    .line 1607
    .line 1608
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1609
    .line 1610
    .line 1611
    move-result-object v4

    .line 1612
    check-cast v4, Landroid/view/ViewGroup;

    .line 1613
    .line 1614
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v4

    .line 1618
    check-cast v4, Landroid/view/ViewGroup;

    .line 1619
    .line 1620
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1621
    .line 1622
    .line 1623
    move-result-object v4

    .line 1624
    check-cast v4, Landroid/view/ViewGroup;

    .line 1625
    .line 1626
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v4

    .line 1630
    check-cast v4, Landroid/view/ViewGroup;

    .line 1631
    .line 1632
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1633
    .line 1634
    .line 1635
    move-result-object v4

    .line 1636
    check-cast v4, Lv/VText;

    .line 1637
    .line 1638
    iput-object v4, p0, Ll/qzz;->L0:Lv/VText;

    .line 1639
    .line 1640
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1641
    .line 1642
    .line 1643
    move-result-object v4

    .line 1644
    check-cast v4, Landroid/view/ViewGroup;

    .line 1645
    .line 1646
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1647
    .line 1648
    .line 1649
    move-result-object v4

    .line 1650
    check-cast v4, Landroid/view/ViewGroup;

    .line 1651
    .line 1652
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1653
    .line 1654
    .line 1655
    move-result-object v4

    .line 1656
    check-cast v4, Landroid/view/ViewGroup;

    .line 1657
    .line 1658
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1659
    .line 1660
    .line 1661
    move-result-object v4

    .line 1662
    check-cast v4, Landroid/view/ViewGroup;

    .line 1663
    .line 1664
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1665
    .line 1666
    .line 1667
    move-result-object v4

    .line 1668
    check-cast v4, Landroid/view/ViewGroup;

    .line 1669
    .line 1670
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1671
    .line 1672
    .line 1673
    move-result-object v4

    .line 1674
    check-cast v4, Landroid/view/ViewGroup;

    .line 1675
    .line 1676
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1677
    .line 1678
    .line 1679
    move-result-object v4

    .line 1680
    check-cast v4, Lv/VImage;

    .line 1681
    .line 1682
    iput-object v4, p0, Ll/qzz;->M0:Lv/VImage;

    .line 1683
    .line 1684
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1685
    .line 1686
    .line 1687
    move-result-object v4

    .line 1688
    check-cast v4, Landroid/view/ViewGroup;

    .line 1689
    .line 1690
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v4

    .line 1694
    check-cast v4, Landroid/view/ViewGroup;

    .line 1695
    .line 1696
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1697
    .line 1698
    .line 1699
    move-result-object v4

    .line 1700
    check-cast v4, Landroid/view/ViewGroup;

    .line 1701
    .line 1702
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1703
    .line 1704
    .line 1705
    move-result-object v4

    .line 1706
    check-cast v4, Landroid/view/ViewGroup;

    .line 1707
    .line 1708
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1709
    .line 1710
    .line 1711
    move-result-object v4

    .line 1712
    check-cast v4, Landroid/view/ViewGroup;

    .line 1713
    .line 1714
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1715
    .line 1716
    .line 1717
    move-result-object v4

    .line 1718
    check-cast v4, Lv/VFrame;

    .line 1719
    .line 1720
    iput-object v4, p0, Ll/qzz;->N0:Lv/VFrame;

    .line 1721
    .line 1722
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1723
    .line 1724
    .line 1725
    move-result-object v4

    .line 1726
    check-cast v4, Landroid/view/ViewGroup;

    .line 1727
    .line 1728
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1729
    .line 1730
    .line 1731
    move-result-object v4

    .line 1732
    check-cast v4, Landroid/view/ViewGroup;

    .line 1733
    .line 1734
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1735
    .line 1736
    .line 1737
    move-result-object v4

    .line 1738
    check-cast v4, Landroid/view/ViewGroup;

    .line 1739
    .line 1740
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1741
    .line 1742
    .line 1743
    move-result-object v4

    .line 1744
    check-cast v4, Landroid/view/ViewGroup;

    .line 1745
    .line 1746
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1747
    .line 1748
    .line 1749
    move-result-object v4

    .line 1750
    check-cast v4, Landroid/view/ViewGroup;

    .line 1751
    .line 1752
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1753
    .line 1754
    .line 1755
    move-result-object v4

    .line 1756
    check-cast v4, Landroid/view/ViewGroup;

    .line 1757
    .line 1758
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1759
    .line 1760
    .line 1761
    move-result-object v4

    .line 1762
    check-cast v4, Lv/VLinear;

    .line 1763
    .line 1764
    iput-object v4, p0, Ll/qzz;->O0:Lv/VLinear;

    .line 1765
    .line 1766
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1767
    .line 1768
    .line 1769
    move-result-object v4

    .line 1770
    check-cast v4, Landroid/view/ViewGroup;

    .line 1771
    .line 1772
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1773
    .line 1774
    .line 1775
    move-result-object v4

    .line 1776
    check-cast v4, Landroid/view/ViewGroup;

    .line 1777
    .line 1778
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1779
    .line 1780
    .line 1781
    move-result-object v4

    .line 1782
    check-cast v4, Landroid/view/ViewGroup;

    .line 1783
    .line 1784
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1785
    .line 1786
    .line 1787
    move-result-object v4

    .line 1788
    check-cast v4, Landroid/view/ViewGroup;

    .line 1789
    .line 1790
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1791
    .line 1792
    .line 1793
    move-result-object v4

    .line 1794
    check-cast v4, Landroid/view/ViewGroup;

    .line 1795
    .line 1796
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1797
    .line 1798
    .line 1799
    move-result-object v4

    .line 1800
    check-cast v4, Landroid/view/ViewGroup;

    .line 1801
    .line 1802
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1803
    .line 1804
    .line 1805
    move-result-object v4

    .line 1806
    check-cast v4, Landroid/view/ViewGroup;

    .line 1807
    .line 1808
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1809
    .line 1810
    .line 1811
    move-result-object v4

    .line 1812
    check-cast v4, Lv/VText;

    .line 1813
    .line 1814
    iput-object v4, p0, Ll/qzz;->P0:Lv/VText;

    .line 1815
    .line 1816
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1817
    .line 1818
    .line 1819
    move-result-object v4

    .line 1820
    check-cast v4, Landroid/view/ViewGroup;

    .line 1821
    .line 1822
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1823
    .line 1824
    .line 1825
    move-result-object v4

    .line 1826
    check-cast v4, Landroid/view/ViewGroup;

    .line 1827
    .line 1828
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1829
    .line 1830
    .line 1831
    move-result-object v4

    .line 1832
    check-cast v4, Landroid/view/ViewGroup;

    .line 1833
    .line 1834
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1835
    .line 1836
    .line 1837
    move-result-object v4

    .line 1838
    check-cast v4, Landroid/view/ViewGroup;

    .line 1839
    .line 1840
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1841
    .line 1842
    .line 1843
    move-result-object v4

    .line 1844
    check-cast v4, Landroid/view/ViewGroup;

    .line 1845
    .line 1846
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1847
    .line 1848
    .line 1849
    move-result-object v4

    .line 1850
    check-cast v4, Landroid/view/ViewGroup;

    .line 1851
    .line 1852
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1853
    .line 1854
    .line 1855
    move-result-object v4

    .line 1856
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/MessageCommunityHintFooterView;

    .line 1857
    .line 1858
    iput-object v4, p0, Ll/qzz;->Q0:Lcom/p1/mobile/putong/core/ui/messages/MessageCommunityHintFooterView;

    .line 1859
    .line 1860
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1861
    .line 1862
    .line 1863
    move-result-object v4

    .line 1864
    check-cast v4, Landroid/view/ViewGroup;

    .line 1865
    .line 1866
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1867
    .line 1868
    .line 1869
    move-result-object v4

    .line 1870
    check-cast v4, Landroid/view/ViewGroup;

    .line 1871
    .line 1872
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1873
    .line 1874
    .line 1875
    move-result-object v4

    .line 1876
    check-cast v4, Landroid/view/ViewGroup;

    .line 1877
    .line 1878
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1879
    .line 1880
    .line 1881
    move-result-object v4

    .line 1882
    check-cast v4, Landroid/view/ViewGroup;

    .line 1883
    .line 1884
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1885
    .line 1886
    .line 1887
    move-result-object v4

    .line 1888
    check-cast v4, Landroid/view/ViewGroup;

    .line 1889
    .line 1890
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1891
    .line 1892
    .line 1893
    move-result-object v4

    .line 1894
    check-cast v4, Landroid/view/ViewGroup;

    .line 1895
    .line 1896
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1897
    .line 1898
    .line 1899
    move-result-object v4

    .line 1900
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;

    .line 1901
    .line 1902
    iput-object v4, p0, Ll/qzz;->R0:Lcom/p1/mobile/putong/core/ui/messages/MessageSeeletterFooterView;

    .line 1903
    .line 1904
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1905
    .line 1906
    .line 1907
    move-result-object v4

    .line 1908
    check-cast v4, Landroid/view/ViewGroup;

    .line 1909
    .line 1910
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v4

    .line 1914
    check-cast v4, Landroid/view/ViewGroup;

    .line 1915
    .line 1916
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1917
    .line 1918
    .line 1919
    move-result-object v4

    .line 1920
    check-cast v4, Landroid/view/ViewGroup;

    .line 1921
    .line 1922
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1923
    .line 1924
    .line 1925
    move-result-object v4

    .line 1926
    check-cast v4, Lcom/tantan/library/svga/SVGAnimationView;

    .line 1927
    .line 1928
    iput-object v4, p0, Ll/qzz;->S0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 1929
    .line 1930
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1931
    .line 1932
    .line 1933
    move-result-object v4

    .line 1934
    check-cast v4, Landroid/view/ViewGroup;

    .line 1935
    .line 1936
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1937
    .line 1938
    .line 1939
    move-result-object v4

    .line 1940
    check-cast v4, Landroid/view/ViewGroup;

    .line 1941
    .line 1942
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1943
    .line 1944
    .line 1945
    move-result-object v4

    .line 1946
    check-cast v4, Landroid/view/ViewGroup;

    .line 1947
    .line 1948
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1949
    .line 1950
    .line 1951
    move-result-object v4

    .line 1952
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 1953
    .line 1954
    iput-object v4, p0, Ll/qzz;->T0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 1955
    .line 1956
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1957
    .line 1958
    .line 1959
    move-result-object v4

    .line 1960
    check-cast v4, Landroid/view/ViewGroup;

    .line 1961
    .line 1962
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1963
    .line 1964
    .line 1965
    move-result-object v4

    .line 1966
    check-cast v4, Landroid/view/ViewGroup;

    .line 1967
    .line 1968
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1969
    .line 1970
    .line 1971
    move-result-object v4

    .line 1972
    check-cast v4, Landroid/view/ViewGroup;

    .line 1973
    .line 1974
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1975
    .line 1976
    .line 1977
    move-result-object v4

    .line 1978
    check-cast v4, Landroid/view/ViewGroup;

    .line 1979
    .line 1980
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1981
    .line 1982
    .line 1983
    move-result-object v4

    .line 1984
    check-cast v4, Lv/VText;

    .line 1985
    .line 1986
    iput-object v4, p0, Ll/qzz;->U0:Lv/VText;

    .line 1987
    .line 1988
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1989
    .line 1990
    .line 1991
    move-result-object v4

    .line 1992
    check-cast v4, Landroid/view/ViewGroup;

    .line 1993
    .line 1994
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1995
    .line 1996
    .line 1997
    move-result-object v4

    .line 1998
    check-cast v4, Landroid/view/ViewGroup;

    .line 1999
    .line 2000
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2001
    .line 2002
    .line 2003
    move-result-object v4

    .line 2004
    check-cast v4, Landroid/view/ViewGroup;

    .line 2005
    .line 2006
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2007
    .line 2008
    .line 2009
    move-result-object v4

    .line 2010
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 2011
    .line 2012
    iput-object v4, p0, Ll/qzz;->V0:Landroid/widget/RelativeLayout;

    .line 2013
    .line 2014
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v4

    .line 2018
    check-cast v4, Landroid/view/ViewGroup;

    .line 2019
    .line 2020
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2021
    .line 2022
    .line 2023
    move-result-object v4

    .line 2024
    check-cast v4, Landroid/view/ViewGroup;

    .line 2025
    .line 2026
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2027
    .line 2028
    .line 2029
    move-result-object v4

    .line 2030
    check-cast v4, Landroid/view/ViewGroup;

    .line 2031
    .line 2032
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2033
    .line 2034
    .line 2035
    move-result-object v4

    .line 2036
    check-cast v4, Landroid/view/ViewGroup;

    .line 2037
    .line 2038
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2039
    .line 2040
    .line 2041
    move-result-object v4

    .line 2042
    check-cast v4, Lv/VList_Horizontal;

    .line 2043
    .line 2044
    iput-object v4, p0, Ll/qzz;->W0:Lv/VList_Horizontal;

    .line 2045
    .line 2046
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2047
    .line 2048
    .line 2049
    move-result-object v4

    .line 2050
    check-cast v4, Landroid/view/ViewGroup;

    .line 2051
    .line 2052
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2053
    .line 2054
    .line 2055
    move-result-object v4

    .line 2056
    check-cast v4, Landroid/view/ViewGroup;

    .line 2057
    .line 2058
    invoke-virtual {v4, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2059
    .line 2060
    .line 2061
    move-result-object v4

    .line 2062
    check-cast v4, Landroid/view/ViewGroup;

    .line 2063
    .line 2064
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2065
    .line 2066
    .line 2067
    move-result-object v4

    .line 2068
    check-cast v4, Lcom/sunshine/engine/particle/SceneView;

    .line 2069
    .line 2070
    iput-object v4, p0, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 2071
    .line 2072
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2073
    .line 2074
    .line 2075
    move-result-object v4

    .line 2076
    check-cast v4, Landroid/view/ViewGroup;

    .line 2077
    .line 2078
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2079
    .line 2080
    .line 2081
    move-result-object v4

    .line 2082
    check-cast v4, Landroid/view/ViewStub;

    .line 2083
    .line 2084
    iput-object v4, p0, Ll/qzz;->Y0:Landroid/view/ViewStub;

    .line 2085
    .line 2086
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2087
    .line 2088
    .line 2089
    move-result-object v4

    .line 2090
    check-cast v4, Landroid/view/ViewGroup;

    .line 2091
    .line 2092
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2093
    .line 2094
    .line 2095
    move-result-object v4

    .line 2096
    check-cast v4, Landroid/widget/FrameLayout;

    .line 2097
    .line 2098
    iput-object v4, p0, Ll/qzz;->Z0:Landroid/widget/FrameLayout;

    .line 2099
    .line 2100
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2101
    .line 2102
    .line 2103
    move-result-object v4

    .line 2104
    check-cast v4, Landroid/view/ViewGroup;

    .line 2105
    .line 2106
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2107
    .line 2108
    .line 2109
    move-result-object v4

    .line 2110
    check-cast v4, Landroid/view/ViewGroup;

    .line 2111
    .line 2112
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2113
    .line 2114
    .line 2115
    move-result-object v4

    .line 2116
    check-cast v4, Lv/VText;

    .line 2117
    .line 2118
    iput-object v4, p0, Ll/qzz;->a1:Lv/VText;

    .line 2119
    .line 2120
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2121
    .line 2122
    .line 2123
    move-result-object v4

    .line 2124
    check-cast v4, Landroid/view/ViewGroup;

    .line 2125
    .line 2126
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2127
    .line 2128
    .line 2129
    move-result-object v4

    .line 2130
    check-cast v4, Landroid/view/ViewGroup;

    .line 2131
    .line 2132
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2133
    .line 2134
    .line 2135
    move-result-object v4

    .line 2136
    check-cast v4, Lv/VDraweeView;

    .line 2137
    .line 2138
    iput-object v4, p0, Ll/qzz;->b1:Lv/VDraweeView;

    .line 2139
    .line 2140
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2141
    .line 2142
    .line 2143
    move-result-object v4

    .line 2144
    check-cast v4, Landroid/view/ViewGroup;

    .line 2145
    .line 2146
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2147
    .line 2148
    .line 2149
    move-result-object v4

    .line 2150
    check-cast v4, Lv/VLinear;

    .line 2151
    .line 2152
    iput-object v4, p0, Ll/qzz;->c1:Lv/VLinear;

    .line 2153
    .line 2154
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2155
    .line 2156
    .line 2157
    move-result-object v4

    .line 2158
    check-cast v4, Landroid/view/ViewGroup;

    .line 2159
    .line 2160
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2161
    .line 2162
    .line 2163
    move-result-object v4

    .line 2164
    check-cast v4, Landroid/view/ViewGroup;

    .line 2165
    .line 2166
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2167
    .line 2168
    .line 2169
    move-result-object v4

    .line 2170
    check-cast v4, Lv/VImage;

    .line 2171
    .line 2172
    iput-object v4, p0, Ll/qzz;->d1:Lv/VImage;

    .line 2173
    .line 2174
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2175
    .line 2176
    .line 2177
    move-result-object v4

    .line 2178
    check-cast v4, Landroid/view/ViewGroup;

    .line 2179
    .line 2180
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2181
    .line 2182
    .line 2183
    move-result-object v4

    .line 2184
    check-cast v4, Landroid/view/ViewGroup;

    .line 2185
    .line 2186
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2187
    .line 2188
    .line 2189
    move-result-object v1

    .line 2190
    check-cast v1, Lv/VText;

    .line 2191
    .line 2192
    iput-object v1, p0, Ll/qzz;->e1:Lv/VText;

    .line 2193
    .line 2194
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2195
    .line 2196
    .line 2197
    move-result-object v1

    .line 2198
    check-cast v1, Landroid/view/ViewGroup;

    .line 2199
    .line 2200
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2201
    .line 2202
    .line 2203
    move-result-object v1

    .line 2204
    check-cast v1, Landroid/view/ViewGroup;

    .line 2205
    .line 2206
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2207
    .line 2208
    .line 2209
    move-result-object v1

    .line 2210
    check-cast v1, Lv/VText;

    .line 2211
    .line 2212
    iput-object v1, p0, Ll/qzz;->f1:Lv/VText;

    .line 2213
    .line 2214
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2215
    .line 2216
    .line 2217
    move-result-object v1

    .line 2218
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 2219
    .line 2220
    iput-object v1, p0, Ll/qzz;->g1:Lv/navigationbar/VNavigationBar;

    .line 2221
    .line 2222
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2223
    .line 2224
    .line 2225
    move-result-object v1

    .line 2226
    check-cast v1, Landroid/widget/FrameLayout;

    .line 2227
    .line 2228
    iput-object v1, p0, Ll/qzz;->h1:Landroid/widget/FrameLayout;

    .line 2229
    .line 2230
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2231
    .line 2232
    .line 2233
    move-result-object v1

    .line 2234
    check-cast v1, Landroid/view/ViewGroup;

    .line 2235
    .line 2236
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2237
    .line 2238
    .line 2239
    move-result-object v0

    .line 2240
    check-cast v0, Lv/VRecyclerView;

    .line 2241
    .line 2242
    iput-object v0, p0, Ll/qzz;->i1:Lv/VRecyclerView;

    .line 2243
    .line 2244
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2245
    .line 2246
    .line 2247
    move-result-object v0

    .line 2248
    check-cast v0, Landroid/widget/FrameLayout;

    .line 2249
    .line 2250
    iput-object v0, p0, Ll/qzz;->j1:Landroid/widget/FrameLayout;

    .line 2251
    .line 2252
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2253
    .line 2254
    .line 2255
    move-result-object v0

    .line 2256
    check-cast v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2257
    .line 2258
    iput-object v0, p0, Ll/qzz;->k1:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2259
    .line 2260
    const/16 v0, 0x8

    .line 2261
    .line 2262
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2263
    .line 2264
    .line 2265
    move-result-object v0

    .line 2266
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 2267
    .line 2268
    iput-object v0, p0, Ll/qzz;->l1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2269
    .line 2270
    const/16 v0, 0x9

    .line 2271
    .line 2272
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2273
    .line 2274
    .line 2275
    move-result-object p1

    .line 2276
    check-cast p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 2277
    .line 2278
    iput-object p1, p0, Ll/qzz;->m1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2279
    .line 2280
    return-void
.end method

.method public static b(Ll/qzz;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->R4:I

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
    invoke-static {p0, p1}, Ll/tzz;->a(Ll/qzz;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
