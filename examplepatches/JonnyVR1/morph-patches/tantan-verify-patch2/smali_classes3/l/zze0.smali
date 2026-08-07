.class public Ll/zze0;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/settings/b;Landroid/view/View;)V
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
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->a:Lv/navigationbar/VNavigationBar;

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
    check-cast v2, Lv/VProgressBar;

    .line 24
    .line 25
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->b:Lv/VProgressBar;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lv/VScroll;

    .line 38
    .line 39
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->c:Lv/VScroll;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/widget/LinearLayout;

    .line 58
    .line 59
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->d:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Landroid/view/ViewGroup;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Landroid/widget/FrameLayout;

    .line 84
    .line 85
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->e:Landroid/widget/FrameLayout;

    .line 86
    .line 87
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Landroid/view/ViewGroup;

    .line 98
    .line 99
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Landroid/view/ViewGroup;

    .line 104
    .line 105
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Landroid/view/ViewGroup;

    .line 110
    .line 111
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lv/VText;

    .line 116
    .line 117
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->f:Lv/VText;

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    check-cast v2, Landroid/view/ViewGroup;

    .line 124
    .line 125
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Landroid/view/ViewGroup;

    .line 130
    .line 131
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Landroid/view/ViewGroup;

    .line 136
    .line 137
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->g:Landroid/view/View;

    .line 142
    .line 143
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Landroid/view/ViewGroup;

    .line 154
    .line 155
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Landroid/view/ViewGroup;

    .line 160
    .line 161
    const/4 v3, 0x2

    .line 162
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    check-cast v2, Lv/VText;

    .line 167
    .line 168
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->h:Lv/VText;

    .line 169
    .line 170
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, Landroid/view/ViewGroup;

    .line 175
    .line 176
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Landroid/view/ViewGroup;

    .line 181
    .line 182
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    check-cast v2, Landroid/view/ViewGroup;

    .line 187
    .line 188
    const/4 v4, 0x3

    .line 189
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Lv/VFrame;

    .line 194
    .line 195
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->i:Lv/VFrame;

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
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    check-cast v2, Landroid/view/ViewGroup;

    .line 208
    .line 209
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    check-cast v2, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lv/VText;

    .line 226
    .line 227
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->j:Lv/VText;

    .line 228
    .line 229
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    check-cast v2, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    check-cast v2, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    check-cast v2, Landroid/view/ViewGroup;

    .line 252
    .line 253
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    check-cast v2, Landroid/view/ViewGroup;

    .line 258
    .line 259
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    check-cast v2, Lv/VText;

    .line 264
    .line 265
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->k:Lv/VText;

    .line 266
    .line 267
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    check-cast v2, Landroid/view/ViewGroup;

    .line 272
    .line 273
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    check-cast v2, Landroid/view/ViewGroup;

    .line 278
    .line 279
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    check-cast v2, Landroid/view/ViewGroup;

    .line 284
    .line 285
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    check-cast v2, Landroid/view/ViewGroup;

    .line 290
    .line 291
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Landroid/view/ViewGroup;

    .line 296
    .line 297
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    check-cast v2, Lv/VText;

    .line 302
    .line 303
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->l:Lv/VText;

    .line 304
    .line 305
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    check-cast v2, Landroid/view/ViewGroup;

    .line 310
    .line 311
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    check-cast v2, Landroid/view/ViewGroup;

    .line 316
    .line 317
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    check-cast v2, Landroid/view/ViewGroup;

    .line 322
    .line 323
    const/4 v5, 0x4

    .line 324
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    check-cast v2, Landroid/widget/LinearLayout;

    .line 329
    .line 330
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->m:Landroid/widget/LinearLayout;

    .line 331
    .line 332
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    check-cast v2, Landroid/view/ViewGroup;

    .line 337
    .line 338
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    check-cast v2, Landroid/view/ViewGroup;

    .line 343
    .line 344
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    check-cast v2, Landroid/view/ViewGroup;

    .line 349
    .line 350
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    check-cast v2, Landroid/view/ViewGroup;

    .line 355
    .line 356
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    check-cast v2, Lv/VText;

    .line 361
    .line 362
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->n:Lv/VText;

    .line 363
    .line 364
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    check-cast v2, Landroid/view/ViewGroup;

    .line 369
    .line 370
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    check-cast v2, Landroid/view/ViewGroup;

    .line 375
    .line 376
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    check-cast v2, Landroid/view/ViewGroup;

    .line 381
    .line 382
    const/4 v6, 0x5

    .line 383
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    check-cast v2, Landroid/widget/LinearLayout;

    .line 388
    .line 389
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->o:Landroid/widget/LinearLayout;

    .line 390
    .line 391
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    check-cast v2, Landroid/view/ViewGroup;

    .line 396
    .line 397
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v2

    .line 401
    check-cast v2, Landroid/view/ViewGroup;

    .line 402
    .line 403
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    check-cast v2, Landroid/view/ViewGroup;

    .line 408
    .line 409
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v2, Landroid/view/ViewGroup;

    .line 414
    .line 415
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    check-cast v2, Lv/VFrame;

    .line 420
    .line 421
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->p:Lv/VFrame;

    .line 422
    .line 423
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    check-cast v2, Landroid/view/ViewGroup;

    .line 428
    .line 429
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    check-cast v2, Landroid/view/ViewGroup;

    .line 434
    .line 435
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    check-cast v2, Landroid/view/ViewGroup;

    .line 440
    .line 441
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    check-cast v2, Landroid/view/ViewGroup;

    .line 446
    .line 447
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    check-cast v2, Landroid/view/ViewGroup;

    .line 452
    .line 453
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    check-cast v2, Lv/VText;

    .line 458
    .line 459
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->q:Lv/VText;

    .line 460
    .line 461
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 462
    .line 463
    .line 464
    move-result-object v2

    .line 465
    check-cast v2, Landroid/view/ViewGroup;

    .line 466
    .line 467
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    check-cast v2, Landroid/view/ViewGroup;

    .line 472
    .line 473
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 474
    .line 475
    .line 476
    move-result-object v2

    .line 477
    check-cast v2, Landroid/view/ViewGroup;

    .line 478
    .line 479
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 480
    .line 481
    .line 482
    move-result-object v2

    .line 483
    check-cast v2, Landroid/view/ViewGroup;

    .line 484
    .line 485
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v2

    .line 489
    check-cast v2, Landroid/widget/LinearLayout;

    .line 490
    .line 491
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->r:Landroid/widget/LinearLayout;

    .line 492
    .line 493
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 494
    .line 495
    .line 496
    move-result-object v2

    .line 497
    check-cast v2, Landroid/view/ViewGroup;

    .line 498
    .line 499
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    check-cast v2, Landroid/view/ViewGroup;

    .line 504
    .line 505
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 506
    .line 507
    .line 508
    move-result-object v2

    .line 509
    check-cast v2, Landroid/view/ViewGroup;

    .line 510
    .line 511
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v2, Lv/VText;

    .line 528
    .line 529
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->s:Lv/VText;

    .line 530
    .line 531
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    check-cast v2, Landroid/view/ViewGroup;

    .line 536
    .line 537
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    check-cast v2, Landroid/view/ViewGroup;

    .line 542
    .line 543
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object v2

    .line 547
    check-cast v2, Landroid/view/ViewGroup;

    .line 548
    .line 549
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    check-cast v2, Landroid/view/ViewGroup;

    .line 554
    .line 555
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 556
    .line 557
    .line 558
    move-result-object v2

    .line 559
    check-cast v2, Landroid/view/ViewGroup;

    .line 560
    .line 561
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 562
    .line 563
    .line 564
    move-result-object v2

    .line 565
    check-cast v2, Landroid/widget/SeekBar;

    .line 566
    .line 567
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->t:Landroid/widget/SeekBar;

    .line 568
    .line 569
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    check-cast v2, Landroid/view/ViewGroup;

    .line 574
    .line 575
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 576
    .line 577
    .line 578
    move-result-object v2

    .line 579
    check-cast v2, Landroid/view/ViewGroup;

    .line 580
    .line 581
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    check-cast v2, Landroid/view/ViewGroup;

    .line 586
    .line 587
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 588
    .line 589
    .line 590
    move-result-object v2

    .line 591
    check-cast v2, Landroid/view/ViewGroup;

    .line 592
    .line 593
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 594
    .line 595
    .line 596
    move-result-object v2

    .line 597
    check-cast v2, Landroid/view/ViewGroup;

    .line 598
    .line 599
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    check-cast v2, Lv/VText;

    .line 604
    .line 605
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->u:Lv/VText;

    .line 606
    .line 607
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 608
    .line 609
    .line 610
    move-result-object v2

    .line 611
    check-cast v2, Landroid/view/ViewGroup;

    .line 612
    .line 613
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 614
    .line 615
    .line 616
    move-result-object v2

    .line 617
    check-cast v2, Landroid/view/ViewGroup;

    .line 618
    .line 619
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 620
    .line 621
    .line 622
    move-result-object v2

    .line 623
    check-cast v2, Landroid/view/ViewGroup;

    .line 624
    .line 625
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 626
    .line 627
    .line 628
    move-result-object v2

    .line 629
    check-cast v2, Landroid/view/ViewGroup;

    .line 630
    .line 631
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 632
    .line 633
    .line 634
    move-result-object v2

    .line 635
    check-cast v2, Lv/VFrame;

    .line 636
    .line 637
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->v:Lv/VFrame;

    .line 638
    .line 639
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    check-cast v2, Landroid/view/ViewGroup;

    .line 644
    .line 645
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object v2

    .line 649
    check-cast v2, Landroid/view/ViewGroup;

    .line 650
    .line 651
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 652
    .line 653
    .line 654
    move-result-object v2

    .line 655
    check-cast v2, Landroid/view/ViewGroup;

    .line 656
    .line 657
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 658
    .line 659
    .line 660
    move-result-object v2

    .line 661
    check-cast v2, Landroid/view/ViewGroup;

    .line 662
    .line 663
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 664
    .line 665
    .line 666
    move-result-object v2

    .line 667
    check-cast v2, Lv/VFrame;

    .line 668
    .line 669
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->w:Lv/VFrame;

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
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v2, Landroid/view/ViewGroup;

    .line 688
    .line 689
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 690
    .line 691
    .line 692
    move-result-object v2

    .line 693
    check-cast v2, Landroid/view/ViewGroup;

    .line 694
    .line 695
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 696
    .line 697
    .line 698
    move-result-object v2

    .line 699
    check-cast v2, Landroid/view/ViewGroup;

    .line 700
    .line 701
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    check-cast v2, Lv/VText;

    .line 706
    .line 707
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->x:Lv/VText;

    .line 708
    .line 709
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 710
    .line 711
    .line 712
    move-result-object v2

    .line 713
    check-cast v2, Landroid/view/ViewGroup;

    .line 714
    .line 715
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 716
    .line 717
    .line 718
    move-result-object v2

    .line 719
    check-cast v2, Landroid/view/ViewGroup;

    .line 720
    .line 721
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 722
    .line 723
    .line 724
    move-result-object v2

    .line 725
    check-cast v2, Landroid/view/ViewGroup;

    .line 726
    .line 727
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 728
    .line 729
    .line 730
    move-result-object v2

    .line 731
    check-cast v2, Landroid/view/ViewGroup;

    .line 732
    .line 733
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 734
    .line 735
    .line 736
    move-result-object v2

    .line 737
    check-cast v2, Landroid/widget/SeekBar;

    .line 738
    .line 739
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->y:Landroid/widget/SeekBar;

    .line 740
    .line 741
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 742
    .line 743
    .line 744
    move-result-object v2

    .line 745
    check-cast v2, Landroid/view/ViewGroup;

    .line 746
    .line 747
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 748
    .line 749
    .line 750
    move-result-object v2

    .line 751
    check-cast v2, Landroid/view/ViewGroup;

    .line 752
    .line 753
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 754
    .line 755
    .line 756
    move-result-object v2

    .line 757
    check-cast v2, Landroid/view/ViewGroup;

    .line 758
    .line 759
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 760
    .line 761
    .line 762
    move-result-object v2

    .line 763
    check-cast v2, Landroid/view/ViewGroup;

    .line 764
    .line 765
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 766
    .line 767
    .line 768
    move-result-object v2

    .line 769
    check-cast v2, Lv/VFrame;

    .line 770
    .line 771
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->z:Lv/VFrame;

    .line 772
    .line 773
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 774
    .line 775
    .line 776
    move-result-object v2

    .line 777
    check-cast v2, Landroid/view/ViewGroup;

    .line 778
    .line 779
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 780
    .line 781
    .line 782
    move-result-object v2

    .line 783
    check-cast v2, Landroid/view/ViewGroup;

    .line 784
    .line 785
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 786
    .line 787
    .line 788
    move-result-object v2

    .line 789
    check-cast v2, Landroid/view/ViewGroup;

    .line 790
    .line 791
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 792
    .line 793
    .line 794
    move-result-object v2

    .line 795
    check-cast v2, Landroid/view/ViewGroup;

    .line 796
    .line 797
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 798
    .line 799
    .line 800
    move-result-object v2

    .line 801
    check-cast v2, Landroid/view/ViewGroup;

    .line 802
    .line 803
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 804
    .line 805
    .line 806
    move-result-object v2

    .line 807
    check-cast v2, Lv/VText;

    .line 808
    .line 809
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->A:Lv/VText;

    .line 810
    .line 811
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 812
    .line 813
    .line 814
    move-result-object v2

    .line 815
    check-cast v2, Landroid/view/ViewGroup;

    .line 816
    .line 817
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 818
    .line 819
    .line 820
    move-result-object v2

    .line 821
    check-cast v2, Landroid/view/ViewGroup;

    .line 822
    .line 823
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 824
    .line 825
    .line 826
    move-result-object v2

    .line 827
    check-cast v2, Landroid/view/ViewGroup;

    .line 828
    .line 829
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 830
    .line 831
    .line 832
    move-result-object v2

    .line 833
    check-cast v2, Landroid/view/ViewGroup;

    .line 834
    .line 835
    const/4 v7, 0x6

    .line 836
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 837
    .line 838
    .line 839
    move-result-object v2

    .line 840
    check-cast v2, Lv/VFrame;

    .line 841
    .line 842
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->B:Lv/VFrame;

    .line 843
    .line 844
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 845
    .line 846
    .line 847
    move-result-object v2

    .line 848
    check-cast v2, Landroid/view/ViewGroup;

    .line 849
    .line 850
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 851
    .line 852
    .line 853
    move-result-object v2

    .line 854
    check-cast v2, Landroid/view/ViewGroup;

    .line 855
    .line 856
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 857
    .line 858
    .line 859
    move-result-object v2

    .line 860
    check-cast v2, Landroid/view/ViewGroup;

    .line 861
    .line 862
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 863
    .line 864
    .line 865
    move-result-object v2

    .line 866
    check-cast v2, Landroid/view/ViewGroup;

    .line 867
    .line 868
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 869
    .line 870
    .line 871
    move-result-object v2

    .line 872
    check-cast v2, Landroid/view/ViewGroup;

    .line 873
    .line 874
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 875
    .line 876
    .line 877
    move-result-object v2

    .line 878
    check-cast v2, Lv/VText;

    .line 879
    .line 880
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->C:Lv/VText;

    .line 881
    .line 882
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 883
    .line 884
    .line 885
    move-result-object v2

    .line 886
    check-cast v2, Landroid/view/ViewGroup;

    .line 887
    .line 888
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 889
    .line 890
    .line 891
    move-result-object v2

    .line 892
    check-cast v2, Landroid/view/ViewGroup;

    .line 893
    .line 894
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 895
    .line 896
    .line 897
    move-result-object v2

    .line 898
    check-cast v2, Landroid/view/ViewGroup;

    .line 899
    .line 900
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 901
    .line 902
    .line 903
    move-result-object v2

    .line 904
    check-cast v2, Landroid/view/ViewGroup;

    .line 905
    .line 906
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 907
    .line 908
    .line 909
    move-result-object v2

    .line 910
    check-cast v2, Landroid/view/ViewGroup;

    .line 911
    .line 912
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 913
    .line 914
    .line 915
    move-result-object v2

    .line 916
    check-cast v2, Lv/VText;

    .line 917
    .line 918
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->D:Lv/VText;

    .line 919
    .line 920
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 921
    .line 922
    .line 923
    move-result-object v2

    .line 924
    check-cast v2, Landroid/view/ViewGroup;

    .line 925
    .line 926
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 927
    .line 928
    .line 929
    move-result-object v2

    .line 930
    check-cast v2, Landroid/view/ViewGroup;

    .line 931
    .line 932
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 933
    .line 934
    .line 935
    move-result-object v2

    .line 936
    check-cast v2, Landroid/view/ViewGroup;

    .line 937
    .line 938
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 939
    .line 940
    .line 941
    move-result-object v2

    .line 942
    check-cast v2, Landroid/view/ViewGroup;

    .line 943
    .line 944
    const/4 v8, 0x7

    .line 945
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 946
    .line 947
    .line 948
    move-result-object v2

    .line 949
    check-cast v2, Landroid/widget/LinearLayout;

    .line 950
    .line 951
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->E:Landroid/widget/LinearLayout;

    .line 952
    .line 953
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 954
    .line 955
    .line 956
    move-result-object v2

    .line 957
    check-cast v2, Landroid/view/ViewGroup;

    .line 958
    .line 959
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 960
    .line 961
    .line 962
    move-result-object v2

    .line 963
    check-cast v2, Landroid/view/ViewGroup;

    .line 964
    .line 965
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 966
    .line 967
    .line 968
    move-result-object v2

    .line 969
    check-cast v2, Landroid/view/ViewGroup;

    .line 970
    .line 971
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 972
    .line 973
    .line 974
    move-result-object v2

    .line 975
    check-cast v2, Landroid/view/ViewGroup;

    .line 976
    .line 977
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 978
    .line 979
    .line 980
    move-result-object v2

    .line 981
    check-cast v2, Landroid/view/ViewGroup;

    .line 982
    .line 983
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 984
    .line 985
    .line 986
    move-result-object v2

    .line 987
    check-cast v2, Lv/VText;

    .line 988
    .line 989
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->F:Lv/VText;

    .line 990
    .line 991
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 992
    .line 993
    .line 994
    move-result-object v2

    .line 995
    check-cast v2, Landroid/view/ViewGroup;

    .line 996
    .line 997
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 998
    .line 999
    .line 1000
    move-result-object v2

    .line 1001
    check-cast v2, Landroid/view/ViewGroup;

    .line 1002
    .line 1003
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v2

    .line 1007
    check-cast v2, Landroid/view/ViewGroup;

    .line 1008
    .line 1009
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1010
    .line 1011
    .line 1012
    move-result-object v2

    .line 1013
    check-cast v2, Landroid/view/ViewGroup;

    .line 1014
    .line 1015
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v2

    .line 1019
    check-cast v2, Landroid/view/ViewGroup;

    .line 1020
    .line 1021
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v2

    .line 1025
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 1026
    .line 1027
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->G:Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 1028
    .line 1029
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v2

    .line 1033
    check-cast v2, Landroid/view/ViewGroup;

    .line 1034
    .line 1035
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1036
    .line 1037
    .line 1038
    move-result-object v2

    .line 1039
    check-cast v2, Landroid/view/ViewGroup;

    .line 1040
    .line 1041
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1042
    .line 1043
    .line 1044
    move-result-object v2

    .line 1045
    check-cast v2, Landroid/view/ViewGroup;

    .line 1046
    .line 1047
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v2

    .line 1051
    check-cast v2, Landroid/view/ViewGroup;

    .line 1052
    .line 1053
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1054
    .line 1055
    .line 1056
    move-result-object v2

    .line 1057
    check-cast v2, Landroid/view/ViewGroup;

    .line 1058
    .line 1059
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1060
    .line 1061
    .line 1062
    move-result-object v2

    .line 1063
    check-cast v2, Lv/VText;

    .line 1064
    .line 1065
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->H:Lv/VText;

    .line 1066
    .line 1067
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1068
    .line 1069
    .line 1070
    move-result-object v2

    .line 1071
    check-cast v2, Landroid/view/ViewGroup;

    .line 1072
    .line 1073
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1074
    .line 1075
    .line 1076
    move-result-object v2

    .line 1077
    check-cast v2, Landroid/view/ViewGroup;

    .line 1078
    .line 1079
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1080
    .line 1081
    .line 1082
    move-result-object v2

    .line 1083
    check-cast v2, Landroid/view/ViewGroup;

    .line 1084
    .line 1085
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v2

    .line 1089
    check-cast v2, Landroid/widget/LinearLayout;

    .line 1090
    .line 1091
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->I:Landroid/widget/LinearLayout;

    .line 1092
    .line 1093
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v2

    .line 1097
    check-cast v2, Landroid/view/ViewGroup;

    .line 1098
    .line 1099
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v2

    .line 1103
    check-cast v2, Landroid/view/ViewGroup;

    .line 1104
    .line 1105
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1106
    .line 1107
    .line 1108
    move-result-object v2

    .line 1109
    check-cast v2, Landroid/view/ViewGroup;

    .line 1110
    .line 1111
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v2

    .line 1115
    check-cast v2, Landroid/view/ViewGroup;

    .line 1116
    .line 1117
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v2

    .line 1121
    check-cast v2, Landroid/widget/FrameLayout;

    .line 1122
    .line 1123
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->J:Landroid/widget/FrameLayout;

    .line 1124
    .line 1125
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v2

    .line 1129
    check-cast v2, Landroid/view/ViewGroup;

    .line 1130
    .line 1131
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v2

    .line 1135
    check-cast v2, Landroid/view/ViewGroup;

    .line 1136
    .line 1137
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v2

    .line 1141
    check-cast v2, Landroid/view/ViewGroup;

    .line 1142
    .line 1143
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v2

    .line 1147
    check-cast v2, Landroid/view/ViewGroup;

    .line 1148
    .line 1149
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v2

    .line 1153
    check-cast v2, Landroid/view/ViewGroup;

    .line 1154
    .line 1155
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1156
    .line 1157
    .line 1158
    move-result-object v2

    .line 1159
    check-cast v2, Lv/VText;

    .line 1160
    .line 1161
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->K:Lv/VText;

    .line 1162
    .line 1163
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1164
    .line 1165
    .line 1166
    move-result-object v2

    .line 1167
    check-cast v2, Landroid/view/ViewGroup;

    .line 1168
    .line 1169
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1170
    .line 1171
    .line 1172
    move-result-object v2

    .line 1173
    check-cast v2, Landroid/view/ViewGroup;

    .line 1174
    .line 1175
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1176
    .line 1177
    .line 1178
    move-result-object v2

    .line 1179
    check-cast v2, Landroid/view/ViewGroup;

    .line 1180
    .line 1181
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1182
    .line 1183
    .line 1184
    move-result-object v2

    .line 1185
    check-cast v2, Landroid/view/ViewGroup;

    .line 1186
    .line 1187
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v2

    .line 1191
    check-cast v2, Landroid/widget/LinearLayout;

    .line 1192
    .line 1193
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->L:Landroid/widget/LinearLayout;

    .line 1194
    .line 1195
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v2

    .line 1199
    check-cast v2, Landroid/view/ViewGroup;

    .line 1200
    .line 1201
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1202
    .line 1203
    .line 1204
    move-result-object v2

    .line 1205
    check-cast v2, Landroid/view/ViewGroup;

    .line 1206
    .line 1207
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1208
    .line 1209
    .line 1210
    move-result-object v2

    .line 1211
    check-cast v2, Landroid/view/ViewGroup;

    .line 1212
    .line 1213
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v2

    .line 1217
    check-cast v2, Landroid/view/ViewGroup;

    .line 1218
    .line 1219
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1220
    .line 1221
    .line 1222
    move-result-object v2

    .line 1223
    check-cast v2, Landroid/view/ViewGroup;

    .line 1224
    .line 1225
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1226
    .line 1227
    .line 1228
    move-result-object v2

    .line 1229
    check-cast v2, Landroid/widget/SeekBar;

    .line 1230
    .line 1231
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->M:Landroid/widget/SeekBar;

    .line 1232
    .line 1233
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1234
    .line 1235
    .line 1236
    move-result-object v2

    .line 1237
    check-cast v2, Landroid/view/ViewGroup;

    .line 1238
    .line 1239
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1240
    .line 1241
    .line 1242
    move-result-object v2

    .line 1243
    check-cast v2, Landroid/view/ViewGroup;

    .line 1244
    .line 1245
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v2

    .line 1249
    check-cast v2, Landroid/view/ViewGroup;

    .line 1250
    .line 1251
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1252
    .line 1253
    .line 1254
    move-result-object v2

    .line 1255
    check-cast v2, Landroid/view/ViewGroup;

    .line 1256
    .line 1257
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1258
    .line 1259
    .line 1260
    move-result-object v2

    .line 1261
    check-cast v2, Lv/VFrame;

    .line 1262
    .line 1263
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->N:Lv/VFrame;

    .line 1264
    .line 1265
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1266
    .line 1267
    .line 1268
    move-result-object v2

    .line 1269
    check-cast v2, Landroid/view/ViewGroup;

    .line 1270
    .line 1271
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1272
    .line 1273
    .line 1274
    move-result-object v2

    .line 1275
    check-cast v2, Landroid/view/ViewGroup;

    .line 1276
    .line 1277
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1278
    .line 1279
    .line 1280
    move-result-object v2

    .line 1281
    check-cast v2, Landroid/view/ViewGroup;

    .line 1282
    .line 1283
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1284
    .line 1285
    .line 1286
    move-result-object v2

    .line 1287
    check-cast v2, Landroid/view/ViewGroup;

    .line 1288
    .line 1289
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1290
    .line 1291
    .line 1292
    move-result-object v2

    .line 1293
    check-cast v2, Lv/VFrame;

    .line 1294
    .line 1295
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->O:Lv/VFrame;

    .line 1296
    .line 1297
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1298
    .line 1299
    .line 1300
    move-result-object v2

    .line 1301
    check-cast v2, Landroid/view/ViewGroup;

    .line 1302
    .line 1303
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v2

    .line 1307
    check-cast v2, Landroid/view/ViewGroup;

    .line 1308
    .line 1309
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1310
    .line 1311
    .line 1312
    move-result-object v2

    .line 1313
    check-cast v2, Landroid/view/ViewGroup;

    .line 1314
    .line 1315
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1316
    .line 1317
    .line 1318
    move-result-object v2

    .line 1319
    check-cast v2, Landroid/view/ViewGroup;

    .line 1320
    .line 1321
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1322
    .line 1323
    .line 1324
    move-result-object v2

    .line 1325
    check-cast v2, Landroid/view/ViewGroup;

    .line 1326
    .line 1327
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1328
    .line 1329
    .line 1330
    move-result-object v2

    .line 1331
    check-cast v2, Lv/VText;

    .line 1332
    .line 1333
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->P:Lv/VText;

    .line 1334
    .line 1335
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1336
    .line 1337
    .line 1338
    move-result-object v2

    .line 1339
    check-cast v2, Landroid/view/ViewGroup;

    .line 1340
    .line 1341
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1342
    .line 1343
    .line 1344
    move-result-object v2

    .line 1345
    check-cast v2, Landroid/view/ViewGroup;

    .line 1346
    .line 1347
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1348
    .line 1349
    .line 1350
    move-result-object v2

    .line 1351
    check-cast v2, Landroid/view/ViewGroup;

    .line 1352
    .line 1353
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1354
    .line 1355
    .line 1356
    move-result-object v2

    .line 1357
    check-cast v2, Landroid/view/ViewGroup;

    .line 1358
    .line 1359
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1360
    .line 1361
    .line 1362
    move-result-object v2

    .line 1363
    check-cast v2, Landroid/widget/FrameLayout;

    .line 1364
    .line 1365
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Q:Landroid/widget/FrameLayout;

    .line 1366
    .line 1367
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v2

    .line 1371
    check-cast v2, Landroid/view/ViewGroup;

    .line 1372
    .line 1373
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v2

    .line 1377
    check-cast v2, Landroid/view/ViewGroup;

    .line 1378
    .line 1379
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1380
    .line 1381
    .line 1382
    move-result-object v2

    .line 1383
    check-cast v2, Landroid/view/ViewGroup;

    .line 1384
    .line 1385
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1386
    .line 1387
    .line 1388
    move-result-object v2

    .line 1389
    check-cast v2, Landroid/view/ViewGroup;

    .line 1390
    .line 1391
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1392
    .line 1393
    .line 1394
    move-result-object v2

    .line 1395
    check-cast v2, Landroid/view/ViewGroup;

    .line 1396
    .line 1397
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1398
    .line 1399
    .line 1400
    move-result-object v2

    .line 1401
    check-cast v2, Lv/VText;

    .line 1402
    .line 1403
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->R:Lv/VText;

    .line 1404
    .line 1405
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v2

    .line 1409
    check-cast v2, Landroid/view/ViewGroup;

    .line 1410
    .line 1411
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v2

    .line 1415
    check-cast v2, Landroid/view/ViewGroup;

    .line 1416
    .line 1417
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1418
    .line 1419
    .line 1420
    move-result-object v2

    .line 1421
    check-cast v2, Landroid/view/ViewGroup;

    .line 1422
    .line 1423
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1424
    .line 1425
    .line 1426
    move-result-object v2

    .line 1427
    check-cast v2, Landroid/view/ViewGroup;

    .line 1428
    .line 1429
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1430
    .line 1431
    .line 1432
    move-result-object v2

    .line 1433
    check-cast v2, Landroid/widget/LinearLayout;

    .line 1434
    .line 1435
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->S:Landroid/widget/LinearLayout;

    .line 1436
    .line 1437
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1438
    .line 1439
    .line 1440
    move-result-object v2

    .line 1441
    check-cast v2, Landroid/view/ViewGroup;

    .line 1442
    .line 1443
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v2

    .line 1447
    check-cast v2, Landroid/view/ViewGroup;

    .line 1448
    .line 1449
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1450
    .line 1451
    .line 1452
    move-result-object v2

    .line 1453
    check-cast v2, Landroid/view/ViewGroup;

    .line 1454
    .line 1455
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1456
    .line 1457
    .line 1458
    move-result-object v2

    .line 1459
    check-cast v2, Landroid/view/ViewGroup;

    .line 1460
    .line 1461
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1462
    .line 1463
    .line 1464
    move-result-object v2

    .line 1465
    check-cast v2, Landroid/view/ViewGroup;

    .line 1466
    .line 1467
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1468
    .line 1469
    .line 1470
    move-result-object v2

    .line 1471
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 1472
    .line 1473
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->T:Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 1474
    .line 1475
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1476
    .line 1477
    .line 1478
    move-result-object v2

    .line 1479
    check-cast v2, Landroid/view/ViewGroup;

    .line 1480
    .line 1481
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1482
    .line 1483
    .line 1484
    move-result-object v2

    .line 1485
    check-cast v2, Landroid/view/ViewGroup;

    .line 1486
    .line 1487
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1488
    .line 1489
    .line 1490
    move-result-object v2

    .line 1491
    check-cast v2, Landroid/view/ViewGroup;

    .line 1492
    .line 1493
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1494
    .line 1495
    .line 1496
    move-result-object v2

    .line 1497
    check-cast v2, Lv/VFrame;

    .line 1498
    .line 1499
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->U:Lv/VFrame;

    .line 1500
    .line 1501
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1502
    .line 1503
    .line 1504
    move-result-object v2

    .line 1505
    check-cast v2, Landroid/view/ViewGroup;

    .line 1506
    .line 1507
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1508
    .line 1509
    .line 1510
    move-result-object v2

    .line 1511
    check-cast v2, Landroid/view/ViewGroup;

    .line 1512
    .line 1513
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1514
    .line 1515
    .line 1516
    move-result-object v2

    .line 1517
    check-cast v2, Landroid/view/ViewGroup;

    .line 1518
    .line 1519
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1520
    .line 1521
    .line 1522
    move-result-object v2

    .line 1523
    check-cast v2, Landroid/view/ViewGroup;

    .line 1524
    .line 1525
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1526
    .line 1527
    .line 1528
    move-result-object v2

    .line 1529
    check-cast v2, Lv/VText;

    .line 1530
    .line 1531
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->V:Lv/VText;

    .line 1532
    .line 1533
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1534
    .line 1535
    .line 1536
    move-result-object v2

    .line 1537
    check-cast v2, Landroid/view/ViewGroup;

    .line 1538
    .line 1539
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1540
    .line 1541
    .line 1542
    move-result-object v2

    .line 1543
    check-cast v2, Landroid/view/ViewGroup;

    .line 1544
    .line 1545
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1546
    .line 1547
    .line 1548
    move-result-object v2

    .line 1549
    check-cast v2, Landroid/view/ViewGroup;

    .line 1550
    .line 1551
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1552
    .line 1553
    .line 1554
    move-result-object v2

    .line 1555
    check-cast v2, Landroid/view/ViewGroup;

    .line 1556
    .line 1557
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1558
    .line 1559
    .line 1560
    move-result-object v2

    .line 1561
    check-cast v2, Lv/VText;

    .line 1562
    .line 1563
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->W:Lv/VText;

    .line 1564
    .line 1565
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1566
    .line 1567
    .line 1568
    move-result-object v2

    .line 1569
    check-cast v2, Landroid/view/ViewGroup;

    .line 1570
    .line 1571
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1572
    .line 1573
    .line 1574
    move-result-object v2

    .line 1575
    check-cast v2, Landroid/view/ViewGroup;

    .line 1576
    .line 1577
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1578
    .line 1579
    .line 1580
    move-result-object v2

    .line 1581
    check-cast v2, Landroid/view/ViewGroup;

    .line 1582
    .line 1583
    const/16 v9, 0x8

    .line 1584
    .line 1585
    invoke-virtual {v2, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1586
    .line 1587
    .line 1588
    move-result-object v2

    .line 1589
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/filter/SettingsFilterItemWithInfo;

    .line 1590
    .line 1591
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->X:Lcom/p1/mobile/putong/core/ui/settings/filter/SettingsFilterItemWithInfo;

    .line 1592
    .line 1593
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1594
    .line 1595
    .line 1596
    move-result-object v2

    .line 1597
    check-cast v2, Landroid/view/ViewGroup;

    .line 1598
    .line 1599
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1600
    .line 1601
    .line 1602
    move-result-object v2

    .line 1603
    check-cast v2, Landroid/view/ViewGroup;

    .line 1604
    .line 1605
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1606
    .line 1607
    .line 1608
    move-result-object v2

    .line 1609
    check-cast v2, Landroid/view/ViewGroup;

    .line 1610
    .line 1611
    const/16 v10, 0x9

    .line 1612
    .line 1613
    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1614
    .line 1615
    .line 1616
    move-result-object v2

    .line 1617
    check-cast v2, Lv/VFrame;

    .line 1618
    .line 1619
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Y:Lv/VFrame;

    .line 1620
    .line 1621
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1622
    .line 1623
    .line 1624
    move-result-object v2

    .line 1625
    check-cast v2, Landroid/view/ViewGroup;

    .line 1626
    .line 1627
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1628
    .line 1629
    .line 1630
    move-result-object v2

    .line 1631
    check-cast v2, Landroid/view/ViewGroup;

    .line 1632
    .line 1633
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1634
    .line 1635
    .line 1636
    move-result-object v2

    .line 1637
    check-cast v2, Landroid/view/ViewGroup;

    .line 1638
    .line 1639
    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1640
    .line 1641
    .line 1642
    move-result-object v2

    .line 1643
    check-cast v2, Landroid/view/ViewGroup;

    .line 1644
    .line 1645
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1646
    .line 1647
    .line 1648
    move-result-object v2

    .line 1649
    check-cast v2, Lv/VSwitch;

    .line 1650
    .line 1651
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Z:Lv/VSwitch;

    .line 1652
    .line 1653
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1654
    .line 1655
    .line 1656
    move-result-object v2

    .line 1657
    check-cast v2, Landroid/view/ViewGroup;

    .line 1658
    .line 1659
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1660
    .line 1661
    .line 1662
    move-result-object v2

    .line 1663
    check-cast v2, Landroid/view/ViewGroup;

    .line 1664
    .line 1665
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1666
    .line 1667
    .line 1668
    move-result-object v2

    .line 1669
    check-cast v2, Landroid/view/ViewGroup;

    .line 1670
    .line 1671
    const/16 v11, 0xa

    .line 1672
    .line 1673
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1674
    .line 1675
    .line 1676
    move-result-object v2

    .line 1677
    check-cast v2, Lv/VFrame;

    .line 1678
    .line 1679
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->k0:Lv/VFrame;

    .line 1680
    .line 1681
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1682
    .line 1683
    .line 1684
    move-result-object v2

    .line 1685
    check-cast v2, Landroid/view/ViewGroup;

    .line 1686
    .line 1687
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1688
    .line 1689
    .line 1690
    move-result-object v2

    .line 1691
    check-cast v2, Landroid/view/ViewGroup;

    .line 1692
    .line 1693
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1694
    .line 1695
    .line 1696
    move-result-object v2

    .line 1697
    check-cast v2, Landroid/view/ViewGroup;

    .line 1698
    .line 1699
    const/16 v11, 0xb

    .line 1700
    .line 1701
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1702
    .line 1703
    .line 1704
    move-result-object v2

    .line 1705
    check-cast v2, Landroid/widget/LinearLayout;

    .line 1706
    .line 1707
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->p0:Landroid/widget/LinearLayout;

    .line 1708
    .line 1709
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1710
    .line 1711
    .line 1712
    move-result-object v2

    .line 1713
    check-cast v2, Landroid/view/ViewGroup;

    .line 1714
    .line 1715
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1716
    .line 1717
    .line 1718
    move-result-object v2

    .line 1719
    check-cast v2, Landroid/view/ViewGroup;

    .line 1720
    .line 1721
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1722
    .line 1723
    .line 1724
    move-result-object v2

    .line 1725
    check-cast v2, Landroid/view/ViewGroup;

    .line 1726
    .line 1727
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1728
    .line 1729
    .line 1730
    move-result-object v2

    .line 1731
    check-cast v2, Landroid/view/ViewGroup;

    .line 1732
    .line 1733
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1734
    .line 1735
    .line 1736
    move-result-object v2

    .line 1737
    check-cast v2, Lv/VFrame;

    .line 1738
    .line 1739
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->E0:Lv/VFrame;

    .line 1740
    .line 1741
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1742
    .line 1743
    .line 1744
    move-result-object v2

    .line 1745
    check-cast v2, Landroid/view/ViewGroup;

    .line 1746
    .line 1747
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1748
    .line 1749
    .line 1750
    move-result-object v2

    .line 1751
    check-cast v2, Landroid/view/ViewGroup;

    .line 1752
    .line 1753
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1754
    .line 1755
    .line 1756
    move-result-object v2

    .line 1757
    check-cast v2, Landroid/view/ViewGroup;

    .line 1758
    .line 1759
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1760
    .line 1761
    .line 1762
    move-result-object v2

    .line 1763
    check-cast v2, Landroid/view/ViewGroup;

    .line 1764
    .line 1765
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1766
    .line 1767
    .line 1768
    move-result-object v2

    .line 1769
    check-cast v2, Landroid/view/ViewGroup;

    .line 1770
    .line 1771
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1772
    .line 1773
    .line 1774
    move-result-object v2

    .line 1775
    check-cast v2, Lv/VText;

    .line 1776
    .line 1777
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->F0:Lv/VText;

    .line 1778
    .line 1779
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1780
    .line 1781
    .line 1782
    move-result-object v2

    .line 1783
    check-cast v2, Landroid/view/ViewGroup;

    .line 1784
    .line 1785
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1786
    .line 1787
    .line 1788
    move-result-object v2

    .line 1789
    check-cast v2, Landroid/view/ViewGroup;

    .line 1790
    .line 1791
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1792
    .line 1793
    .line 1794
    move-result-object v2

    .line 1795
    check-cast v2, Landroid/view/ViewGroup;

    .line 1796
    .line 1797
    const/16 v11, 0xd

    .line 1798
    .line 1799
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1800
    .line 1801
    .line 1802
    move-result-object v2

    .line 1803
    check-cast v2, Lv/VLinear;

    .line 1804
    .line 1805
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->G0:Lv/VLinear;

    .line 1806
    .line 1807
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1808
    .line 1809
    .line 1810
    move-result-object v2

    .line 1811
    check-cast v2, Landroid/view/ViewGroup;

    .line 1812
    .line 1813
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1814
    .line 1815
    .line 1816
    move-result-object v2

    .line 1817
    check-cast v2, Landroid/view/ViewGroup;

    .line 1818
    .line 1819
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1820
    .line 1821
    .line 1822
    move-result-object v2

    .line 1823
    check-cast v2, Landroid/view/ViewGroup;

    .line 1824
    .line 1825
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1826
    .line 1827
    .line 1828
    move-result-object v2

    .line 1829
    check-cast v2, Landroid/view/ViewGroup;

    .line 1830
    .line 1831
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1832
    .line 1833
    .line 1834
    move-result-object v2

    .line 1835
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 1836
    .line 1837
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->H0:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 1838
    .line 1839
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1840
    .line 1841
    .line 1842
    move-result-object v2

    .line 1843
    check-cast v2, Landroid/view/ViewGroup;

    .line 1844
    .line 1845
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1846
    .line 1847
    .line 1848
    move-result-object v2

    .line 1849
    check-cast v2, Landroid/view/ViewGroup;

    .line 1850
    .line 1851
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1852
    .line 1853
    .line 1854
    move-result-object v2

    .line 1855
    check-cast v2, Landroid/view/ViewGroup;

    .line 1856
    .line 1857
    const/16 v11, 0xe

    .line 1858
    .line 1859
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1860
    .line 1861
    .line 1862
    move-result-object v2

    .line 1863
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->I0:Landroid/view/View;

    .line 1864
    .line 1865
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1866
    .line 1867
    .line 1868
    move-result-object v2

    .line 1869
    check-cast v2, Landroid/view/ViewGroup;

    .line 1870
    .line 1871
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1872
    .line 1873
    .line 1874
    move-result-object v2

    .line 1875
    check-cast v2, Landroid/view/ViewGroup;

    .line 1876
    .line 1877
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1878
    .line 1879
    .line 1880
    move-result-object v2

    .line 1881
    check-cast v2, Landroid/view/ViewGroup;

    .line 1882
    .line 1883
    const/16 v11, 0xf

    .line 1884
    .line 1885
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1886
    .line 1887
    .line 1888
    move-result-object v2

    .line 1889
    check-cast v2, Lv/VText;

    .line 1890
    .line 1891
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->J0:Lv/VText;

    .line 1892
    .line 1893
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1894
    .line 1895
    .line 1896
    move-result-object v2

    .line 1897
    check-cast v2, Landroid/view/ViewGroup;

    .line 1898
    .line 1899
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1900
    .line 1901
    .line 1902
    move-result-object v2

    .line 1903
    check-cast v2, Landroid/view/ViewGroup;

    .line 1904
    .line 1905
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1906
    .line 1907
    .line 1908
    move-result-object v2

    .line 1909
    check-cast v2, Landroid/view/ViewGroup;

    .line 1910
    .line 1911
    const/16 v11, 0x10

    .line 1912
    .line 1913
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1914
    .line 1915
    .line 1916
    move-result-object v2

    .line 1917
    check-cast v2, Lv/VFrame;

    .line 1918
    .line 1919
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->K0:Lv/VFrame;

    .line 1920
    .line 1921
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1922
    .line 1923
    .line 1924
    move-result-object v2

    .line 1925
    check-cast v2, Landroid/view/ViewGroup;

    .line 1926
    .line 1927
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1928
    .line 1929
    .line 1930
    move-result-object v2

    .line 1931
    check-cast v2, Landroid/view/ViewGroup;

    .line 1932
    .line 1933
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1934
    .line 1935
    .line 1936
    move-result-object v2

    .line 1937
    check-cast v2, Landroid/view/ViewGroup;

    .line 1938
    .line 1939
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1940
    .line 1941
    .line 1942
    move-result-object v2

    .line 1943
    check-cast v2, Landroid/view/ViewGroup;

    .line 1944
    .line 1945
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1946
    .line 1947
    .line 1948
    move-result-object v2

    .line 1949
    check-cast v2, Lv/VText;

    .line 1950
    .line 1951
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->L0:Lv/VText;

    .line 1952
    .line 1953
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1954
    .line 1955
    .line 1956
    move-result-object v2

    .line 1957
    check-cast v2, Landroid/view/ViewGroup;

    .line 1958
    .line 1959
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1960
    .line 1961
    .line 1962
    move-result-object v2

    .line 1963
    check-cast v2, Landroid/view/ViewGroup;

    .line 1964
    .line 1965
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1966
    .line 1967
    .line 1968
    move-result-object v2

    .line 1969
    check-cast v2, Landroid/view/ViewGroup;

    .line 1970
    .line 1971
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1972
    .line 1973
    .line 1974
    move-result-object v2

    .line 1975
    check-cast v2, Landroid/view/ViewGroup;

    .line 1976
    .line 1977
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1978
    .line 1979
    .line 1980
    move-result-object v2

    .line 1981
    check-cast v2, Landroid/view/ViewGroup;

    .line 1982
    .line 1983
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1984
    .line 1985
    .line 1986
    move-result-object v2

    .line 1987
    check-cast v2, Lv/VText;

    .line 1988
    .line 1989
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->M0:Lv/VText;

    .line 1990
    .line 1991
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1992
    .line 1993
    .line 1994
    move-result-object v2

    .line 1995
    check-cast v2, Landroid/view/ViewGroup;

    .line 1996
    .line 1997
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1998
    .line 1999
    .line 2000
    move-result-object v2

    .line 2001
    check-cast v2, Landroid/view/ViewGroup;

    .line 2002
    .line 2003
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2004
    .line 2005
    .line 2006
    move-result-object v2

    .line 2007
    check-cast v2, Landroid/view/ViewGroup;

    .line 2008
    .line 2009
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2010
    .line 2011
    .line 2012
    move-result-object v2

    .line 2013
    check-cast v2, Landroid/view/ViewGroup;

    .line 2014
    .line 2015
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2016
    .line 2017
    .line 2018
    move-result-object v2

    .line 2019
    check-cast v2, Landroid/view/ViewGroup;

    .line 2020
    .line 2021
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2022
    .line 2023
    .line 2024
    move-result-object v2

    .line 2025
    check-cast v2, Lv/VText;

    .line 2026
    .line 2027
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->N0:Lv/VText;

    .line 2028
    .line 2029
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2030
    .line 2031
    .line 2032
    move-result-object v2

    .line 2033
    check-cast v2, Landroid/view/ViewGroup;

    .line 2034
    .line 2035
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2036
    .line 2037
    .line 2038
    move-result-object v2

    .line 2039
    check-cast v2, Landroid/view/ViewGroup;

    .line 2040
    .line 2041
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2042
    .line 2043
    .line 2044
    move-result-object v2

    .line 2045
    check-cast v2, Landroid/view/ViewGroup;

    .line 2046
    .line 2047
    const/16 v11, 0x11

    .line 2048
    .line 2049
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2050
    .line 2051
    .line 2052
    move-result-object v2

    .line 2053
    check-cast v2, Lv/VText;

    .line 2054
    .line 2055
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->O0:Lv/VText;

    .line 2056
    .line 2057
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2058
    .line 2059
    .line 2060
    move-result-object v2

    .line 2061
    check-cast v2, Landroid/view/ViewGroup;

    .line 2062
    .line 2063
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2064
    .line 2065
    .line 2066
    move-result-object v2

    .line 2067
    check-cast v2, Landroid/view/ViewGroup;

    .line 2068
    .line 2069
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2070
    .line 2071
    .line 2072
    move-result-object v2

    .line 2073
    check-cast v2, Landroid/view/ViewGroup;

    .line 2074
    .line 2075
    const/16 v11, 0x12

    .line 2076
    .line 2077
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2078
    .line 2079
    .line 2080
    move-result-object v2

    .line 2081
    check-cast v2, Landroid/widget/LinearLayout;

    .line 2082
    .line 2083
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->P0:Landroid/widget/LinearLayout;

    .line 2084
    .line 2085
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2086
    .line 2087
    .line 2088
    move-result-object v2

    .line 2089
    check-cast v2, Landroid/view/ViewGroup;

    .line 2090
    .line 2091
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2092
    .line 2093
    .line 2094
    move-result-object v2

    .line 2095
    check-cast v2, Landroid/view/ViewGroup;

    .line 2096
    .line 2097
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2098
    .line 2099
    .line 2100
    move-result-object v2

    .line 2101
    check-cast v2, Landroid/view/ViewGroup;

    .line 2102
    .line 2103
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2104
    .line 2105
    .line 2106
    move-result-object v2

    .line 2107
    check-cast v2, Landroid/view/ViewGroup;

    .line 2108
    .line 2109
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2110
    .line 2111
    .line 2112
    move-result-object v2

    .line 2113
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Q0:Landroid/view/View;

    .line 2114
    .line 2115
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2116
    .line 2117
    .line 2118
    move-result-object v2

    .line 2119
    check-cast v2, Landroid/view/ViewGroup;

    .line 2120
    .line 2121
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2122
    .line 2123
    .line 2124
    move-result-object v2

    .line 2125
    check-cast v2, Landroid/view/ViewGroup;

    .line 2126
    .line 2127
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2128
    .line 2129
    .line 2130
    move-result-object v2

    .line 2131
    check-cast v2, Landroid/view/ViewGroup;

    .line 2132
    .line 2133
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2134
    .line 2135
    .line 2136
    move-result-object v2

    .line 2137
    check-cast v2, Landroid/view/ViewGroup;

    .line 2138
    .line 2139
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2140
    .line 2141
    .line 2142
    move-result-object v2

    .line 2143
    check-cast v2, Landroid/widget/LinearLayout;

    .line 2144
    .line 2145
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->R0:Landroid/widget/LinearLayout;

    .line 2146
    .line 2147
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2148
    .line 2149
    .line 2150
    move-result-object v2

    .line 2151
    check-cast v2, Landroid/view/ViewGroup;

    .line 2152
    .line 2153
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2154
    .line 2155
    .line 2156
    move-result-object v2

    .line 2157
    check-cast v2, Landroid/view/ViewGroup;

    .line 2158
    .line 2159
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2160
    .line 2161
    .line 2162
    move-result-object v2

    .line 2163
    check-cast v2, Landroid/view/ViewGroup;

    .line 2164
    .line 2165
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2166
    .line 2167
    .line 2168
    move-result-object v2

    .line 2169
    check-cast v2, Landroid/view/ViewGroup;

    .line 2170
    .line 2171
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2172
    .line 2173
    .line 2174
    move-result-object v2

    .line 2175
    check-cast v2, Landroid/view/ViewGroup;

    .line 2176
    .line 2177
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2178
    .line 2179
    .line 2180
    move-result-object v2

    .line 2181
    check-cast v2, Landroid/widget/TextView;

    .line 2182
    .line 2183
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->S0:Landroid/widget/TextView;

    .line 2184
    .line 2185
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2186
    .line 2187
    .line 2188
    move-result-object v2

    .line 2189
    check-cast v2, Landroid/view/ViewGroup;

    .line 2190
    .line 2191
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2192
    .line 2193
    .line 2194
    move-result-object v2

    .line 2195
    check-cast v2, Landroid/view/ViewGroup;

    .line 2196
    .line 2197
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2198
    .line 2199
    .line 2200
    move-result-object v2

    .line 2201
    check-cast v2, Landroid/view/ViewGroup;

    .line 2202
    .line 2203
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2204
    .line 2205
    .line 2206
    move-result-object v2

    .line 2207
    check-cast v2, Landroid/view/ViewGroup;

    .line 2208
    .line 2209
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2210
    .line 2211
    .line 2212
    move-result-object v2

    .line 2213
    check-cast v2, Lv/VText;

    .line 2214
    .line 2215
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->T0:Lv/VText;

    .line 2216
    .line 2217
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2218
    .line 2219
    .line 2220
    move-result-object v2

    .line 2221
    check-cast v2, Landroid/view/ViewGroup;

    .line 2222
    .line 2223
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2224
    .line 2225
    .line 2226
    move-result-object v2

    .line 2227
    check-cast v2, Landroid/view/ViewGroup;

    .line 2228
    .line 2229
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2230
    .line 2231
    .line 2232
    move-result-object v2

    .line 2233
    check-cast v2, Landroid/view/ViewGroup;

    .line 2234
    .line 2235
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2236
    .line 2237
    .line 2238
    move-result-object v2

    .line 2239
    check-cast v2, Landroid/view/ViewGroup;

    .line 2240
    .line 2241
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2242
    .line 2243
    .line 2244
    move-result-object v2

    .line 2245
    check-cast v2, Landroid/widget/LinearLayout;

    .line 2246
    .line 2247
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->U0:Landroid/widget/LinearLayout;

    .line 2248
    .line 2249
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2250
    .line 2251
    .line 2252
    move-result-object v2

    .line 2253
    check-cast v2, Landroid/view/ViewGroup;

    .line 2254
    .line 2255
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2256
    .line 2257
    .line 2258
    move-result-object v2

    .line 2259
    check-cast v2, Landroid/view/ViewGroup;

    .line 2260
    .line 2261
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2262
    .line 2263
    .line 2264
    move-result-object v2

    .line 2265
    check-cast v2, Landroid/view/ViewGroup;

    .line 2266
    .line 2267
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2268
    .line 2269
    .line 2270
    move-result-object v2

    .line 2271
    check-cast v2, Landroid/view/ViewGroup;

    .line 2272
    .line 2273
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2274
    .line 2275
    .line 2276
    move-result-object v2

    .line 2277
    check-cast v2, Landroid/view/ViewGroup;

    .line 2278
    .line 2279
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2280
    .line 2281
    .line 2282
    move-result-object v2

    .line 2283
    check-cast v2, Lv/VFrame;

    .line 2284
    .line 2285
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->V0:Lv/VFrame;

    .line 2286
    .line 2287
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2288
    .line 2289
    .line 2290
    move-result-object v2

    .line 2291
    check-cast v2, Landroid/view/ViewGroup;

    .line 2292
    .line 2293
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2294
    .line 2295
    .line 2296
    move-result-object v2

    .line 2297
    check-cast v2, Landroid/view/ViewGroup;

    .line 2298
    .line 2299
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2300
    .line 2301
    .line 2302
    move-result-object v2

    .line 2303
    check-cast v2, Landroid/view/ViewGroup;

    .line 2304
    .line 2305
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2306
    .line 2307
    .line 2308
    move-result-object v2

    .line 2309
    check-cast v2, Landroid/view/ViewGroup;

    .line 2310
    .line 2311
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2312
    .line 2313
    .line 2314
    move-result-object v2

    .line 2315
    check-cast v2, Landroid/view/ViewGroup;

    .line 2316
    .line 2317
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2318
    .line 2319
    .line 2320
    move-result-object v2

    .line 2321
    check-cast v2, Landroid/view/ViewGroup;

    .line 2322
    .line 2323
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2324
    .line 2325
    .line 2326
    move-result-object v2

    .line 2327
    check-cast v2, Lv/VText;

    .line 2328
    .line 2329
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->W0:Lv/VText;

    .line 2330
    .line 2331
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2332
    .line 2333
    .line 2334
    move-result-object v2

    .line 2335
    check-cast v2, Landroid/view/ViewGroup;

    .line 2336
    .line 2337
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2338
    .line 2339
    .line 2340
    move-result-object v2

    .line 2341
    check-cast v2, Landroid/view/ViewGroup;

    .line 2342
    .line 2343
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2344
    .line 2345
    .line 2346
    move-result-object v2

    .line 2347
    check-cast v2, Landroid/view/ViewGroup;

    .line 2348
    .line 2349
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2350
    .line 2351
    .line 2352
    move-result-object v2

    .line 2353
    check-cast v2, Landroid/view/ViewGroup;

    .line 2354
    .line 2355
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2356
    .line 2357
    .line 2358
    move-result-object v2

    .line 2359
    check-cast v2, Landroid/view/ViewGroup;

    .line 2360
    .line 2361
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2362
    .line 2363
    .line 2364
    move-result-object v2

    .line 2365
    check-cast v2, Landroid/widget/SeekBar;

    .line 2366
    .line 2367
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->X0:Landroid/widget/SeekBar;

    .line 2368
    .line 2369
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2370
    .line 2371
    .line 2372
    move-result-object v2

    .line 2373
    check-cast v2, Landroid/view/ViewGroup;

    .line 2374
    .line 2375
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2376
    .line 2377
    .line 2378
    move-result-object v2

    .line 2379
    check-cast v2, Landroid/view/ViewGroup;

    .line 2380
    .line 2381
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2382
    .line 2383
    .line 2384
    move-result-object v2

    .line 2385
    check-cast v2, Landroid/view/ViewGroup;

    .line 2386
    .line 2387
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2388
    .line 2389
    .line 2390
    move-result-object v2

    .line 2391
    check-cast v2, Landroid/view/ViewGroup;

    .line 2392
    .line 2393
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2394
    .line 2395
    .line 2396
    move-result-object v2

    .line 2397
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2398
    .line 2399
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Y0:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2400
    .line 2401
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2402
    .line 2403
    .line 2404
    move-result-object v2

    .line 2405
    check-cast v2, Landroid/view/ViewGroup;

    .line 2406
    .line 2407
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2408
    .line 2409
    .line 2410
    move-result-object v2

    .line 2411
    check-cast v2, Landroid/view/ViewGroup;

    .line 2412
    .line 2413
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2414
    .line 2415
    .line 2416
    move-result-object v2

    .line 2417
    check-cast v2, Landroid/view/ViewGroup;

    .line 2418
    .line 2419
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2420
    .line 2421
    .line 2422
    move-result-object v2

    .line 2423
    check-cast v2, Landroid/view/ViewGroup;

    .line 2424
    .line 2425
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2426
    .line 2427
    .line 2428
    move-result-object v2

    .line 2429
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2430
    .line 2431
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Z0:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2432
    .line 2433
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2434
    .line 2435
    .line 2436
    move-result-object v2

    .line 2437
    check-cast v2, Landroid/view/ViewGroup;

    .line 2438
    .line 2439
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2440
    .line 2441
    .line 2442
    move-result-object v2

    .line 2443
    check-cast v2, Landroid/view/ViewGroup;

    .line 2444
    .line 2445
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2446
    .line 2447
    .line 2448
    move-result-object v2

    .line 2449
    check-cast v2, Landroid/view/ViewGroup;

    .line 2450
    .line 2451
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2452
    .line 2453
    .line 2454
    move-result-object v2

    .line 2455
    check-cast v2, Landroid/view/ViewGroup;

    .line 2456
    .line 2457
    invoke-virtual {v2, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2458
    .line 2459
    .line 2460
    move-result-object v2

    .line 2461
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2462
    .line 2463
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->a1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2464
    .line 2465
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2466
    .line 2467
    .line 2468
    move-result-object v2

    .line 2469
    check-cast v2, Landroid/view/ViewGroup;

    .line 2470
    .line 2471
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2472
    .line 2473
    .line 2474
    move-result-object v2

    .line 2475
    check-cast v2, Landroid/view/ViewGroup;

    .line 2476
    .line 2477
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2478
    .line 2479
    .line 2480
    move-result-object v2

    .line 2481
    check-cast v2, Landroid/view/ViewGroup;

    .line 2482
    .line 2483
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2484
    .line 2485
    .line 2486
    move-result-object v2

    .line 2487
    check-cast v2, Landroid/view/ViewGroup;

    .line 2488
    .line 2489
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2490
    .line 2491
    .line 2492
    move-result-object v2

    .line 2493
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2494
    .line 2495
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->b1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2496
    .line 2497
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2498
    .line 2499
    .line 2500
    move-result-object v2

    .line 2501
    check-cast v2, Landroid/view/ViewGroup;

    .line 2502
    .line 2503
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2504
    .line 2505
    .line 2506
    move-result-object v2

    .line 2507
    check-cast v2, Landroid/view/ViewGroup;

    .line 2508
    .line 2509
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2510
    .line 2511
    .line 2512
    move-result-object v2

    .line 2513
    check-cast v2, Landroid/view/ViewGroup;

    .line 2514
    .line 2515
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2516
    .line 2517
    .line 2518
    move-result-object v2

    .line 2519
    check-cast v2, Landroid/view/ViewGroup;

    .line 2520
    .line 2521
    invoke-virtual {v2, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2522
    .line 2523
    .line 2524
    move-result-object v2

    .line 2525
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2526
    .line 2527
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->c1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2528
    .line 2529
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2530
    .line 2531
    .line 2532
    move-result-object v2

    .line 2533
    check-cast v2, Landroid/view/ViewGroup;

    .line 2534
    .line 2535
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2536
    .line 2537
    .line 2538
    move-result-object v2

    .line 2539
    check-cast v2, Landroid/view/ViewGroup;

    .line 2540
    .line 2541
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2542
    .line 2543
    .line 2544
    move-result-object v2

    .line 2545
    check-cast v2, Landroid/view/ViewGroup;

    .line 2546
    .line 2547
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2548
    .line 2549
    .line 2550
    move-result-object v2

    .line 2551
    check-cast v2, Landroid/view/ViewGroup;

    .line 2552
    .line 2553
    invoke-virtual {v2, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2554
    .line 2555
    .line 2556
    move-result-object v2

    .line 2557
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2558
    .line 2559
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->d1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2560
    .line 2561
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2562
    .line 2563
    .line 2564
    move-result-object v2

    .line 2565
    check-cast v2, Landroid/view/ViewGroup;

    .line 2566
    .line 2567
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2568
    .line 2569
    .line 2570
    move-result-object v2

    .line 2571
    check-cast v2, Landroid/view/ViewGroup;

    .line 2572
    .line 2573
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2574
    .line 2575
    .line 2576
    move-result-object v2

    .line 2577
    check-cast v2, Landroid/view/ViewGroup;

    .line 2578
    .line 2579
    const/16 v6, 0x13

    .line 2580
    .line 2581
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2582
    .line 2583
    .line 2584
    move-result-object v2

    .line 2585
    check-cast v2, Lv/VLinear;

    .line 2586
    .line 2587
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->e1:Lv/VLinear;

    .line 2588
    .line 2589
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2590
    .line 2591
    .line 2592
    move-result-object v2

    .line 2593
    check-cast v2, Landroid/view/ViewGroup;

    .line 2594
    .line 2595
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2596
    .line 2597
    .line 2598
    move-result-object v2

    .line 2599
    check-cast v2, Landroid/view/ViewGroup;

    .line 2600
    .line 2601
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2602
    .line 2603
    .line 2604
    move-result-object v2

    .line 2605
    check-cast v2, Landroid/view/ViewGroup;

    .line 2606
    .line 2607
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2608
    .line 2609
    .line 2610
    move-result-object v2

    .line 2611
    check-cast v2, Landroid/view/ViewGroup;

    .line 2612
    .line 2613
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2614
    .line 2615
    .line 2616
    move-result-object v2

    .line 2617
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2618
    .line 2619
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->f1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2620
    .line 2621
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2622
    .line 2623
    .line 2624
    move-result-object v2

    .line 2625
    check-cast v2, Landroid/view/ViewGroup;

    .line 2626
    .line 2627
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2628
    .line 2629
    .line 2630
    move-result-object v2

    .line 2631
    check-cast v2, Landroid/view/ViewGroup;

    .line 2632
    .line 2633
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2634
    .line 2635
    .line 2636
    move-result-object v2

    .line 2637
    check-cast v2, Landroid/view/ViewGroup;

    .line 2638
    .line 2639
    const/16 v6, 0x14

    .line 2640
    .line 2641
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2642
    .line 2643
    .line 2644
    move-result-object v2

    .line 2645
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->g1:Landroid/view/View;

    .line 2646
    .line 2647
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2648
    .line 2649
    .line 2650
    move-result-object v2

    .line 2651
    check-cast v2, Landroid/view/ViewGroup;

    .line 2652
    .line 2653
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2654
    .line 2655
    .line 2656
    move-result-object v2

    .line 2657
    check-cast v2, Landroid/view/ViewGroup;

    .line 2658
    .line 2659
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2660
    .line 2661
    .line 2662
    move-result-object v2

    .line 2663
    check-cast v2, Landroid/view/ViewGroup;

    .line 2664
    .line 2665
    const/16 v6, 0x15

    .line 2666
    .line 2667
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2668
    .line 2669
    .line 2670
    move-result-object v2

    .line 2671
    check-cast v2, Landroid/widget/LinearLayout;

    .line 2672
    .line 2673
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->h1:Landroid/widget/LinearLayout;

    .line 2674
    .line 2675
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2676
    .line 2677
    .line 2678
    move-result-object v2

    .line 2679
    check-cast v2, Landroid/view/ViewGroup;

    .line 2680
    .line 2681
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2682
    .line 2683
    .line 2684
    move-result-object v2

    .line 2685
    check-cast v2, Landroid/view/ViewGroup;

    .line 2686
    .line 2687
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2688
    .line 2689
    .line 2690
    move-result-object v2

    .line 2691
    check-cast v2, Landroid/view/ViewGroup;

    .line 2692
    .line 2693
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2694
    .line 2695
    .line 2696
    move-result-object v2

    .line 2697
    check-cast v2, Landroid/view/ViewGroup;

    .line 2698
    .line 2699
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2700
    .line 2701
    .line 2702
    move-result-object v2

    .line 2703
    check-cast v2, Landroid/view/ViewGroup;

    .line 2704
    .line 2705
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2706
    .line 2707
    .line 2708
    move-result-object v2

    .line 2709
    check-cast v2, Landroid/widget/SeekBar;

    .line 2710
    .line 2711
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->i1:Landroid/widget/SeekBar;

    .line 2712
    .line 2713
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2714
    .line 2715
    .line 2716
    move-result-object v2

    .line 2717
    check-cast v2, Landroid/view/ViewGroup;

    .line 2718
    .line 2719
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2720
    .line 2721
    .line 2722
    move-result-object v2

    .line 2723
    check-cast v2, Landroid/view/ViewGroup;

    .line 2724
    .line 2725
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2726
    .line 2727
    .line 2728
    move-result-object v2

    .line 2729
    check-cast v2, Landroid/view/ViewGroup;

    .line 2730
    .line 2731
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2732
    .line 2733
    .line 2734
    move-result-object v2

    .line 2735
    check-cast v2, Landroid/view/ViewGroup;

    .line 2736
    .line 2737
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2738
    .line 2739
    .line 2740
    move-result-object v2

    .line 2741
    check-cast v2, Landroid/view/ViewGroup;

    .line 2742
    .line 2743
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2744
    .line 2745
    .line 2746
    move-result-object v2

    .line 2747
    check-cast v2, Lv/VText;

    .line 2748
    .line 2749
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->j1:Lv/VText;

    .line 2750
    .line 2751
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2752
    .line 2753
    .line 2754
    move-result-object v2

    .line 2755
    check-cast v2, Landroid/view/ViewGroup;

    .line 2756
    .line 2757
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2758
    .line 2759
    .line 2760
    move-result-object v2

    .line 2761
    check-cast v2, Landroid/view/ViewGroup;

    .line 2762
    .line 2763
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2764
    .line 2765
    .line 2766
    move-result-object v2

    .line 2767
    check-cast v2, Landroid/view/ViewGroup;

    .line 2768
    .line 2769
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2770
    .line 2771
    .line 2772
    move-result-object v2

    .line 2773
    check-cast v2, Landroid/view/ViewGroup;

    .line 2774
    .line 2775
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2776
    .line 2777
    .line 2778
    move-result-object v2

    .line 2779
    check-cast v2, Lv/VFrame;

    .line 2780
    .line 2781
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->k1:Lv/VFrame;

    .line 2782
    .line 2783
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2784
    .line 2785
    .line 2786
    move-result-object v2

    .line 2787
    check-cast v2, Landroid/view/ViewGroup;

    .line 2788
    .line 2789
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2790
    .line 2791
    .line 2792
    move-result-object v2

    .line 2793
    check-cast v2, Landroid/view/ViewGroup;

    .line 2794
    .line 2795
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2796
    .line 2797
    .line 2798
    move-result-object v2

    .line 2799
    check-cast v2, Landroid/view/ViewGroup;

    .line 2800
    .line 2801
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2802
    .line 2803
    .line 2804
    move-result-object v2

    .line 2805
    check-cast v2, Landroid/view/ViewGroup;

    .line 2806
    .line 2807
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2808
    .line 2809
    .line 2810
    move-result-object v2

    .line 2811
    check-cast v2, Lv/VFrame;

    .line 2812
    .line 2813
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->l1:Lv/VFrame;

    .line 2814
    .line 2815
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2816
    .line 2817
    .line 2818
    move-result-object v2

    .line 2819
    check-cast v2, Landroid/view/ViewGroup;

    .line 2820
    .line 2821
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2822
    .line 2823
    .line 2824
    move-result-object v2

    .line 2825
    check-cast v2, Landroid/view/ViewGroup;

    .line 2826
    .line 2827
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2828
    .line 2829
    .line 2830
    move-result-object v2

    .line 2831
    check-cast v2, Landroid/view/ViewGroup;

    .line 2832
    .line 2833
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2834
    .line 2835
    .line 2836
    move-result-object v2

    .line 2837
    check-cast v2, Landroid/view/ViewGroup;

    .line 2838
    .line 2839
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2840
    .line 2841
    .line 2842
    move-result-object v2

    .line 2843
    check-cast v2, Landroid/view/ViewGroup;

    .line 2844
    .line 2845
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2846
    .line 2847
    .line 2848
    move-result-object v2

    .line 2849
    check-cast v2, Lv/VText;

    .line 2850
    .line 2851
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->m1:Lv/VText;

    .line 2852
    .line 2853
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2854
    .line 2855
    .line 2856
    move-result-object v2

    .line 2857
    check-cast v2, Landroid/view/ViewGroup;

    .line 2858
    .line 2859
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2860
    .line 2861
    .line 2862
    move-result-object v2

    .line 2863
    check-cast v2, Landroid/view/ViewGroup;

    .line 2864
    .line 2865
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2866
    .line 2867
    .line 2868
    move-result-object v2

    .line 2869
    check-cast v2, Landroid/view/ViewGroup;

    .line 2870
    .line 2871
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2872
    .line 2873
    .line 2874
    move-result-object v2

    .line 2875
    check-cast v2, Landroid/view/ViewGroup;

    .line 2876
    .line 2877
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2878
    .line 2879
    .line 2880
    move-result-object v2

    .line 2881
    check-cast v2, Landroid/view/ViewGroup;

    .line 2882
    .line 2883
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2884
    .line 2885
    .line 2886
    move-result-object v2

    .line 2887
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 2888
    .line 2889
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->n1:Lcom/p1/mobile/putong/core/ui/settings/AgeRangeSeekBar;

    .line 2890
    .line 2891
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2892
    .line 2893
    .line 2894
    move-result-object v2

    .line 2895
    check-cast v2, Landroid/view/ViewGroup;

    .line 2896
    .line 2897
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2898
    .line 2899
    .line 2900
    move-result-object v2

    .line 2901
    check-cast v2, Landroid/view/ViewGroup;

    .line 2902
    .line 2903
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2904
    .line 2905
    .line 2906
    move-result-object v2

    .line 2907
    check-cast v2, Landroid/view/ViewGroup;

    .line 2908
    .line 2909
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2910
    .line 2911
    .line 2912
    move-result-object v2

    .line 2913
    check-cast v2, Landroid/view/ViewGroup;

    .line 2914
    .line 2915
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2916
    .line 2917
    .line 2918
    move-result-object v2

    .line 2919
    check-cast v2, Landroid/view/ViewGroup;

    .line 2920
    .line 2921
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2922
    .line 2923
    .line 2924
    move-result-object v2

    .line 2925
    check-cast v2, Lv/VText;

    .line 2926
    .line 2927
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->o1:Lv/VText;

    .line 2928
    .line 2929
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2930
    .line 2931
    .line 2932
    move-result-object v2

    .line 2933
    check-cast v2, Landroid/view/ViewGroup;

    .line 2934
    .line 2935
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2936
    .line 2937
    .line 2938
    move-result-object v2

    .line 2939
    check-cast v2, Landroid/view/ViewGroup;

    .line 2940
    .line 2941
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2942
    .line 2943
    .line 2944
    move-result-object v2

    .line 2945
    check-cast v2, Landroid/view/ViewGroup;

    .line 2946
    .line 2947
    const/16 v6, 0x16

    .line 2948
    .line 2949
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2950
    .line 2951
    .line 2952
    move-result-object v2

    .line 2953
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->p1:Landroid/view/View;

    .line 2954
    .line 2955
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2956
    .line 2957
    .line 2958
    move-result-object v2

    .line 2959
    check-cast v2, Landroid/view/ViewGroup;

    .line 2960
    .line 2961
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2962
    .line 2963
    .line 2964
    move-result-object v2

    .line 2965
    check-cast v2, Landroid/view/ViewGroup;

    .line 2966
    .line 2967
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2968
    .line 2969
    .line 2970
    move-result-object v2

    .line 2971
    check-cast v2, Landroid/view/ViewGroup;

    .line 2972
    .line 2973
    const/16 v6, 0x18

    .line 2974
    .line 2975
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2976
    .line 2977
    .line 2978
    move-result-object v2

    .line 2979
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2980
    .line 2981
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->q1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 2982
    .line 2983
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2984
    .line 2985
    .line 2986
    move-result-object v2

    .line 2987
    check-cast v2, Landroid/view/ViewGroup;

    .line 2988
    .line 2989
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2990
    .line 2991
    .line 2992
    move-result-object v2

    .line 2993
    check-cast v2, Landroid/view/ViewGroup;

    .line 2994
    .line 2995
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2996
    .line 2997
    .line 2998
    move-result-object v2

    .line 2999
    check-cast v2, Landroid/view/ViewGroup;

    .line 3000
    .line 3001
    const/16 v6, 0x19

    .line 3002
    .line 3003
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3004
    .line 3005
    .line 3006
    move-result-object v2

    .line 3007
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3008
    .line 3009
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->r1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3010
    .line 3011
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3012
    .line 3013
    .line 3014
    move-result-object v2

    .line 3015
    check-cast v2, Landroid/view/ViewGroup;

    .line 3016
    .line 3017
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3018
    .line 3019
    .line 3020
    move-result-object v2

    .line 3021
    check-cast v2, Landroid/view/ViewGroup;

    .line 3022
    .line 3023
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3024
    .line 3025
    .line 3026
    move-result-object v2

    .line 3027
    check-cast v2, Landroid/view/ViewGroup;

    .line 3028
    .line 3029
    const/16 v6, 0x1a

    .line 3030
    .line 3031
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3032
    .line 3033
    .line 3034
    move-result-object v2

    .line 3035
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3036
    .line 3037
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->s1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3038
    .line 3039
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3040
    .line 3041
    .line 3042
    move-result-object v2

    .line 3043
    check-cast v2, Landroid/view/ViewGroup;

    .line 3044
    .line 3045
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3046
    .line 3047
    .line 3048
    move-result-object v2

    .line 3049
    check-cast v2, Landroid/view/ViewGroup;

    .line 3050
    .line 3051
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3052
    .line 3053
    .line 3054
    move-result-object v2

    .line 3055
    check-cast v2, Landroid/view/ViewGroup;

    .line 3056
    .line 3057
    const/16 v6, 0x1b

    .line 3058
    .line 3059
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3060
    .line 3061
    .line 3062
    move-result-object v2

    .line 3063
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3064
    .line 3065
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->t1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3066
    .line 3067
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3068
    .line 3069
    .line 3070
    move-result-object v2

    .line 3071
    check-cast v2, Landroid/view/ViewGroup;

    .line 3072
    .line 3073
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3074
    .line 3075
    .line 3076
    move-result-object v2

    .line 3077
    check-cast v2, Landroid/view/ViewGroup;

    .line 3078
    .line 3079
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3080
    .line 3081
    .line 3082
    move-result-object v2

    .line 3083
    check-cast v2, Landroid/view/ViewGroup;

    .line 3084
    .line 3085
    const/16 v6, 0x1c

    .line 3086
    .line 3087
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3088
    .line 3089
    .line 3090
    move-result-object v2

    .line 3091
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3092
    .line 3093
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->u1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3094
    .line 3095
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3096
    .line 3097
    .line 3098
    move-result-object v2

    .line 3099
    check-cast v2, Landroid/view/ViewGroup;

    .line 3100
    .line 3101
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3102
    .line 3103
    .line 3104
    move-result-object v2

    .line 3105
    check-cast v2, Landroid/view/ViewGroup;

    .line 3106
    .line 3107
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3108
    .line 3109
    .line 3110
    move-result-object v2

    .line 3111
    check-cast v2, Landroid/view/ViewGroup;

    .line 3112
    .line 3113
    const/16 v6, 0x1d

    .line 3114
    .line 3115
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3116
    .line 3117
    .line 3118
    move-result-object v2

    .line 3119
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3120
    .line 3121
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->v1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3122
    .line 3123
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3124
    .line 3125
    .line 3126
    move-result-object v2

    .line 3127
    check-cast v2, Landroid/view/ViewGroup;

    .line 3128
    .line 3129
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3130
    .line 3131
    .line 3132
    move-result-object v2

    .line 3133
    check-cast v2, Landroid/view/ViewGroup;

    .line 3134
    .line 3135
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3136
    .line 3137
    .line 3138
    move-result-object v2

    .line 3139
    check-cast v2, Landroid/view/ViewGroup;

    .line 3140
    .line 3141
    const/16 v6, 0x1e

    .line 3142
    .line 3143
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3144
    .line 3145
    .line 3146
    move-result-object v2

    .line 3147
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3148
    .line 3149
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->w1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3150
    .line 3151
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3152
    .line 3153
    .line 3154
    move-result-object v2

    .line 3155
    check-cast v2, Landroid/view/ViewGroup;

    .line 3156
    .line 3157
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3158
    .line 3159
    .line 3160
    move-result-object v2

    .line 3161
    check-cast v2, Landroid/view/ViewGroup;

    .line 3162
    .line 3163
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3164
    .line 3165
    .line 3166
    move-result-object v2

    .line 3167
    check-cast v2, Landroid/view/ViewGroup;

    .line 3168
    .line 3169
    const/16 v6, 0x1f

    .line 3170
    .line 3171
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3172
    .line 3173
    .line 3174
    move-result-object v2

    .line 3175
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3176
    .line 3177
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->x1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3178
    .line 3179
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3180
    .line 3181
    .line 3182
    move-result-object v2

    .line 3183
    check-cast v2, Landroid/view/ViewGroup;

    .line 3184
    .line 3185
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3186
    .line 3187
    .line 3188
    move-result-object v2

    .line 3189
    check-cast v2, Landroid/view/ViewGroup;

    .line 3190
    .line 3191
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3192
    .line 3193
    .line 3194
    move-result-object v2

    .line 3195
    check-cast v2, Landroid/view/ViewGroup;

    .line 3196
    .line 3197
    const/16 v6, 0x20

    .line 3198
    .line 3199
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3200
    .line 3201
    .line 3202
    move-result-object v2

    .line 3203
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3204
    .line 3205
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->y1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3206
    .line 3207
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3208
    .line 3209
    .line 3210
    move-result-object v2

    .line 3211
    check-cast v2, Landroid/view/ViewGroup;

    .line 3212
    .line 3213
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3214
    .line 3215
    .line 3216
    move-result-object v2

    .line 3217
    check-cast v2, Landroid/view/ViewGroup;

    .line 3218
    .line 3219
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3220
    .line 3221
    .line 3222
    move-result-object v2

    .line 3223
    check-cast v2, Landroid/view/ViewGroup;

    .line 3224
    .line 3225
    const/16 v6, 0x21

    .line 3226
    .line 3227
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3228
    .line 3229
    .line 3230
    move-result-object v2

    .line 3231
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3232
    .line 3233
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->z1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3234
    .line 3235
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3236
    .line 3237
    .line 3238
    move-result-object v2

    .line 3239
    check-cast v2, Landroid/view/ViewGroup;

    .line 3240
    .line 3241
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3242
    .line 3243
    .line 3244
    move-result-object v2

    .line 3245
    check-cast v2, Landroid/view/ViewGroup;

    .line 3246
    .line 3247
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3248
    .line 3249
    .line 3250
    move-result-object v2

    .line 3251
    check-cast v2, Landroid/view/ViewGroup;

    .line 3252
    .line 3253
    const/16 v6, 0x22

    .line 3254
    .line 3255
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3256
    .line 3257
    .line 3258
    move-result-object v2

    .line 3259
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3260
    .line 3261
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->A1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3262
    .line 3263
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3264
    .line 3265
    .line 3266
    move-result-object v2

    .line 3267
    check-cast v2, Landroid/view/ViewGroup;

    .line 3268
    .line 3269
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3270
    .line 3271
    .line 3272
    move-result-object v2

    .line 3273
    check-cast v2, Landroid/view/ViewGroup;

    .line 3274
    .line 3275
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3276
    .line 3277
    .line 3278
    move-result-object v2

    .line 3279
    check-cast v2, Landroid/view/ViewGroup;

    .line 3280
    .line 3281
    const/16 v6, 0x23

    .line 3282
    .line 3283
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3284
    .line 3285
    .line 3286
    move-result-object v2

    .line 3287
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3288
    .line 3289
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->B1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3290
    .line 3291
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3292
    .line 3293
    .line 3294
    move-result-object v2

    .line 3295
    check-cast v2, Landroid/view/ViewGroup;

    .line 3296
    .line 3297
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3298
    .line 3299
    .line 3300
    move-result-object v2

    .line 3301
    check-cast v2, Landroid/view/ViewGroup;

    .line 3302
    .line 3303
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3304
    .line 3305
    .line 3306
    move-result-object v2

    .line 3307
    check-cast v2, Landroid/view/ViewGroup;

    .line 3308
    .line 3309
    const/16 v6, 0x24

    .line 3310
    .line 3311
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3312
    .line 3313
    .line 3314
    move-result-object v2

    .line 3315
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3316
    .line 3317
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->C1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3318
    .line 3319
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3320
    .line 3321
    .line 3322
    move-result-object v2

    .line 3323
    check-cast v2, Landroid/view/ViewGroup;

    .line 3324
    .line 3325
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3326
    .line 3327
    .line 3328
    move-result-object v2

    .line 3329
    check-cast v2, Landroid/view/ViewGroup;

    .line 3330
    .line 3331
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3332
    .line 3333
    .line 3334
    move-result-object v2

    .line 3335
    check-cast v2, Landroid/view/ViewGroup;

    .line 3336
    .line 3337
    const/16 v6, 0x25

    .line 3338
    .line 3339
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3340
    .line 3341
    .line 3342
    move-result-object v2

    .line 3343
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3344
    .line 3345
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->D1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3346
    .line 3347
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3348
    .line 3349
    .line 3350
    move-result-object v2

    .line 3351
    check-cast v2, Landroid/view/ViewGroup;

    .line 3352
    .line 3353
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3354
    .line 3355
    .line 3356
    move-result-object v2

    .line 3357
    check-cast v2, Landroid/view/ViewGroup;

    .line 3358
    .line 3359
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3360
    .line 3361
    .line 3362
    move-result-object v2

    .line 3363
    check-cast v2, Landroid/view/ViewGroup;

    .line 3364
    .line 3365
    const/16 v6, 0x26

    .line 3366
    .line 3367
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3368
    .line 3369
    .line 3370
    move-result-object v2

    .line 3371
    check-cast v2, Landroid/widget/LinearLayout;

    .line 3372
    .line 3373
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->E1:Landroid/widget/LinearLayout;

    .line 3374
    .line 3375
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3376
    .line 3377
    .line 3378
    move-result-object v2

    .line 3379
    check-cast v2, Landroid/view/ViewGroup;

    .line 3380
    .line 3381
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3382
    .line 3383
    .line 3384
    move-result-object v2

    .line 3385
    check-cast v2, Landroid/view/ViewGroup;

    .line 3386
    .line 3387
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3388
    .line 3389
    .line 3390
    move-result-object v2

    .line 3391
    check-cast v2, Landroid/view/ViewGroup;

    .line 3392
    .line 3393
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3394
    .line 3395
    .line 3396
    move-result-object v2

    .line 3397
    check-cast v2, Landroid/view/ViewGroup;

    .line 3398
    .line 3399
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3400
    .line 3401
    .line 3402
    move-result-object v2

    .line 3403
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3404
    .line 3405
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->F1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3406
    .line 3407
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3408
    .line 3409
    .line 3410
    move-result-object v2

    .line 3411
    check-cast v2, Landroid/view/ViewGroup;

    .line 3412
    .line 3413
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3414
    .line 3415
    .line 3416
    move-result-object v2

    .line 3417
    check-cast v2, Landroid/view/ViewGroup;

    .line 3418
    .line 3419
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3420
    .line 3421
    .line 3422
    move-result-object v2

    .line 3423
    check-cast v2, Landroid/view/ViewGroup;

    .line 3424
    .line 3425
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3426
    .line 3427
    .line 3428
    move-result-object v2

    .line 3429
    check-cast v2, Landroid/view/ViewGroup;

    .line 3430
    .line 3431
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3432
    .line 3433
    .line 3434
    move-result-object v2

    .line 3435
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3436
    .line 3437
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->G1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3438
    .line 3439
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3440
    .line 3441
    .line 3442
    move-result-object v2

    .line 3443
    check-cast v2, Landroid/view/ViewGroup;

    .line 3444
    .line 3445
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3446
    .line 3447
    .line 3448
    move-result-object v2

    .line 3449
    check-cast v2, Landroid/view/ViewGroup;

    .line 3450
    .line 3451
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3452
    .line 3453
    .line 3454
    move-result-object v2

    .line 3455
    check-cast v2, Landroid/view/ViewGroup;

    .line 3456
    .line 3457
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3458
    .line 3459
    .line 3460
    move-result-object v2

    .line 3461
    check-cast v2, Landroid/view/ViewGroup;

    .line 3462
    .line 3463
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3464
    .line 3465
    .line 3466
    move-result-object v2

    .line 3467
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3468
    .line 3469
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->H1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3470
    .line 3471
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3472
    .line 3473
    .line 3474
    move-result-object v2

    .line 3475
    check-cast v2, Landroid/view/ViewGroup;

    .line 3476
    .line 3477
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3478
    .line 3479
    .line 3480
    move-result-object v2

    .line 3481
    check-cast v2, Landroid/view/ViewGroup;

    .line 3482
    .line 3483
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3484
    .line 3485
    .line 3486
    move-result-object v2

    .line 3487
    check-cast v2, Landroid/view/ViewGroup;

    .line 3488
    .line 3489
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3490
    .line 3491
    .line 3492
    move-result-object v2

    .line 3493
    check-cast v2, Landroid/view/ViewGroup;

    .line 3494
    .line 3495
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3496
    .line 3497
    .line 3498
    move-result-object v2

    .line 3499
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3500
    .line 3501
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->I1:Lcom/p1/mobile/putong/core/ui/settings/SettingsItem;

    .line 3502
    .line 3503
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3504
    .line 3505
    .line 3506
    move-result-object v2

    .line 3507
    check-cast v2, Landroid/view/ViewGroup;

    .line 3508
    .line 3509
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3510
    .line 3511
    .line 3512
    move-result-object v2

    .line 3513
    check-cast v2, Landroid/view/ViewGroup;

    .line 3514
    .line 3515
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3516
    .line 3517
    .line 3518
    move-result-object v2

    .line 3519
    check-cast v2, Landroid/view/ViewGroup;

    .line 3520
    .line 3521
    const/16 v5, 0x27

    .line 3522
    .line 3523
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3524
    .line 3525
    .line 3526
    move-result-object v2

    .line 3527
    check-cast v2, Landroid/widget/LinearLayout;

    .line 3528
    .line 3529
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->J1:Landroid/widget/LinearLayout;

    .line 3530
    .line 3531
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3532
    .line 3533
    .line 3534
    move-result-object v2

    .line 3535
    check-cast v2, Landroid/view/ViewGroup;

    .line 3536
    .line 3537
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3538
    .line 3539
    .line 3540
    move-result-object v2

    .line 3541
    check-cast v2, Landroid/view/ViewGroup;

    .line 3542
    .line 3543
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3544
    .line 3545
    .line 3546
    move-result-object v2

    .line 3547
    check-cast v2, Landroid/view/ViewGroup;

    .line 3548
    .line 3549
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3550
    .line 3551
    .line 3552
    move-result-object v2

    .line 3553
    check-cast v2, Landroid/view/ViewGroup;

    .line 3554
    .line 3555
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3556
    .line 3557
    .line 3558
    move-result-object v2

    .line 3559
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3560
    .line 3561
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->K1:Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3562
    .line 3563
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3564
    .line 3565
    .line 3566
    move-result-object v2

    .line 3567
    check-cast v2, Landroid/view/ViewGroup;

    .line 3568
    .line 3569
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3570
    .line 3571
    .line 3572
    move-result-object v2

    .line 3573
    check-cast v2, Landroid/view/ViewGroup;

    .line 3574
    .line 3575
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3576
    .line 3577
    .line 3578
    move-result-object v2

    .line 3579
    check-cast v2, Landroid/view/ViewGroup;

    .line 3580
    .line 3581
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3582
    .line 3583
    .line 3584
    move-result-object v2

    .line 3585
    check-cast v2, Landroid/view/ViewGroup;

    .line 3586
    .line 3587
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3588
    .line 3589
    .line 3590
    move-result-object v2

    .line 3591
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3592
    .line 3593
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->L1:Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3594
    .line 3595
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3596
    .line 3597
    .line 3598
    move-result-object v2

    .line 3599
    check-cast v2, Landroid/view/ViewGroup;

    .line 3600
    .line 3601
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3602
    .line 3603
    .line 3604
    move-result-object v2

    .line 3605
    check-cast v2, Landroid/view/ViewGroup;

    .line 3606
    .line 3607
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3608
    .line 3609
    .line 3610
    move-result-object v2

    .line 3611
    check-cast v2, Landroid/view/ViewGroup;

    .line 3612
    .line 3613
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3614
    .line 3615
    .line 3616
    move-result-object v2

    .line 3617
    check-cast v2, Landroid/view/ViewGroup;

    .line 3618
    .line 3619
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3620
    .line 3621
    .line 3622
    move-result-object v2

    .line 3623
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3624
    .line 3625
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->M1:Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3626
    .line 3627
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3628
    .line 3629
    .line 3630
    move-result-object v2

    .line 3631
    check-cast v2, Landroid/view/ViewGroup;

    .line 3632
    .line 3633
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3634
    .line 3635
    .line 3636
    move-result-object v2

    .line 3637
    check-cast v2, Landroid/view/ViewGroup;

    .line 3638
    .line 3639
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3640
    .line 3641
    .line 3642
    move-result-object v2

    .line 3643
    check-cast v2, Landroid/view/ViewGroup;

    .line 3644
    .line 3645
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3646
    .line 3647
    .line 3648
    move-result-object v2

    .line 3649
    check-cast v2, Landroid/view/ViewGroup;

    .line 3650
    .line 3651
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3652
    .line 3653
    .line 3654
    move-result-object v2

    .line 3655
    check-cast v2, Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3656
    .line 3657
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->N1:Lcom/p1/mobile/putong/core/ui/settings/MyTabAbSettingsItem;

    .line 3658
    .line 3659
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3660
    .line 3661
    .line 3662
    move-result-object v2

    .line 3663
    check-cast v2, Landroid/view/ViewGroup;

    .line 3664
    .line 3665
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3666
    .line 3667
    .line 3668
    move-result-object v2

    .line 3669
    check-cast v2, Landroid/view/ViewGroup;

    .line 3670
    .line 3671
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3672
    .line 3673
    .line 3674
    move-result-object v2

    .line 3675
    check-cast v2, Landroid/view/ViewGroup;

    .line 3676
    .line 3677
    const/16 v4, 0x28

    .line 3678
    .line 3679
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3680
    .line 3681
    .line 3682
    move-result-object v2

    .line 3683
    check-cast v2, Lv/VButton_FakeShadowSmall;

    .line 3684
    .line 3685
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->O1:Lv/VButton_FakeShadowSmall;

    .line 3686
    .line 3687
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3688
    .line 3689
    .line 3690
    move-result-object v2

    .line 3691
    check-cast v2, Landroid/view/ViewGroup;

    .line 3692
    .line 3693
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3694
    .line 3695
    .line 3696
    move-result-object v2

    .line 3697
    check-cast v2, Landroid/view/ViewGroup;

    .line 3698
    .line 3699
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3700
    .line 3701
    .line 3702
    move-result-object v2

    .line 3703
    check-cast v2, Landroid/view/ViewGroup;

    .line 3704
    .line 3705
    const/16 v4, 0x29

    .line 3706
    .line 3707
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3708
    .line 3709
    .line 3710
    move-result-object v2

    .line 3711
    check-cast v2, Lv/VLinear_FakeShadow;

    .line 3712
    .line 3713
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->P1:Lv/VLinear_FakeShadow;

    .line 3714
    .line 3715
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3716
    .line 3717
    .line 3718
    move-result-object v2

    .line 3719
    check-cast v2, Landroid/view/ViewGroup;

    .line 3720
    .line 3721
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3722
    .line 3723
    .line 3724
    move-result-object v2

    .line 3725
    check-cast v2, Landroid/view/ViewGroup;

    .line 3726
    .line 3727
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3728
    .line 3729
    .line 3730
    move-result-object v2

    .line 3731
    check-cast v2, Landroid/view/ViewGroup;

    .line 3732
    .line 3733
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3734
    .line 3735
    .line 3736
    move-result-object v2

    .line 3737
    check-cast v2, Landroid/view/ViewGroup;

    .line 3738
    .line 3739
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3740
    .line 3741
    .line 3742
    move-result-object v2

    .line 3743
    check-cast v2, Landroid/widget/TextView;

    .line 3744
    .line 3745
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->Q1:Landroid/widget/TextView;

    .line 3746
    .line 3747
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3748
    .line 3749
    .line 3750
    move-result-object v2

    .line 3751
    check-cast v2, Landroid/view/ViewGroup;

    .line 3752
    .line 3753
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3754
    .line 3755
    .line 3756
    move-result-object v2

    .line 3757
    check-cast v2, Landroid/view/ViewGroup;

    .line 3758
    .line 3759
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3760
    .line 3761
    .line 3762
    move-result-object v2

    .line 3763
    check-cast v2, Landroid/view/ViewGroup;

    .line 3764
    .line 3765
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3766
    .line 3767
    .line 3768
    move-result-object v2

    .line 3769
    check-cast v2, Landroid/view/ViewGroup;

    .line 3770
    .line 3771
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3772
    .line 3773
    .line 3774
    move-result-object v2

    .line 3775
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->R1:Landroid/view/View;

    .line 3776
    .line 3777
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3778
    .line 3779
    .line 3780
    move-result-object v2

    .line 3781
    check-cast v2, Landroid/view/ViewGroup;

    .line 3782
    .line 3783
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3784
    .line 3785
    .line 3786
    move-result-object v2

    .line 3787
    check-cast v2, Landroid/view/ViewGroup;

    .line 3788
    .line 3789
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3790
    .line 3791
    .line 3792
    move-result-object v2

    .line 3793
    check-cast v2, Landroid/view/ViewGroup;

    .line 3794
    .line 3795
    const/16 v4, 0x2a

    .line 3796
    .line 3797
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3798
    .line 3799
    .line 3800
    move-result-object v2

    .line 3801
    check-cast v2, Lv/VButton_FakeShadowSmall;

    .line 3802
    .line 3803
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->S1:Lv/VButton_FakeShadowSmall;

    .line 3804
    .line 3805
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3806
    .line 3807
    .line 3808
    move-result-object v2

    .line 3809
    check-cast v2, Landroid/view/ViewGroup;

    .line 3810
    .line 3811
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3812
    .line 3813
    .line 3814
    move-result-object v2

    .line 3815
    check-cast v2, Landroid/view/ViewGroup;

    .line 3816
    .line 3817
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3818
    .line 3819
    .line 3820
    move-result-object v2

    .line 3821
    check-cast v2, Landroid/view/ViewGroup;

    .line 3822
    .line 3823
    const/16 v4, 0x2b

    .line 3824
    .line 3825
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3826
    .line 3827
    .line 3828
    move-result-object v2

    .line 3829
    check-cast v2, Lv/VText;

    .line 3830
    .line 3831
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->T1:Lv/VText;

    .line 3832
    .line 3833
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3834
    .line 3835
    .line 3836
    move-result-object v2

    .line 3837
    check-cast v2, Landroid/view/ViewGroup;

    .line 3838
    .line 3839
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3840
    .line 3841
    .line 3842
    move-result-object v2

    .line 3843
    check-cast v2, Landroid/view/ViewGroup;

    .line 3844
    .line 3845
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3846
    .line 3847
    .line 3848
    move-result-object v0

    .line 3849
    check-cast v0, Landroid/view/ViewGroup;

    .line 3850
    .line 3851
    const/16 v2, 0x2c

    .line 3852
    .line 3853
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3854
    .line 3855
    .line 3856
    move-result-object v0

    .line 3857
    check-cast v0, Lv/VText;

    .line 3858
    .line 3859
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->U1:Lv/VText;

    .line 3860
    .line 3861
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3862
    .line 3863
    .line 3864
    move-result-object p1

    .line 3865
    check-cast p1, Landroid/view/ViewGroup;

    .line 3866
    .line 3867
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3868
    .line 3869
    .line 3870
    move-result-object p1

    .line 3871
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/b;->V1:Landroid/view/View;

    .line 3872
    .line 3873
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/settings/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Te:I

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
    invoke-static {p0, p1}, Ll/zze0;->a(Lcom/p1/mobile/putong/core/ui/settings/b;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
