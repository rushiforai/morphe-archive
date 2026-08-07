.class public Ll/ww60;
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

.method public static a(Ll/vw60;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/vw60;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    iput-object v1, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

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
    check-cast v2, Landroid/widget/FrameLayout;

    .line 23
    .line 24
    iput-object v2, p0, Ll/vw60;->c:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VFrame;

    .line 32
    .line 33
    iput-object v3, p0, Ll/vw60;->d:Lv/VFrame;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lv/VLinear;

    .line 52
    .line 53
    iput-object v3, p0, Ll/vw60;->e:Lv/VLinear;

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Landroid/view/ViewGroup;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Lv/VImage;

    .line 78
    .line 79
    iput-object v3, p0, Ll/vw60;->f:Lv/VImage;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    check-cast v3, Landroid/view/ViewGroup;

    .line 98
    .line 99
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Lv/VText;

    .line 104
    .line 105
    iput-object v3, p0, Ll/vw60;->g:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Landroid/view/ViewGroup;

    .line 112
    .line 113
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Landroid/view/ViewGroup;

    .line 118
    .line 119
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Lv/VLinear;

    .line 124
    .line 125
    iput-object v3, p0, Ll/vw60;->h:Lv/VLinear;

    .line 126
    .line 127
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Landroid/view/ViewGroup;

    .line 132
    .line 133
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    check-cast v3, Landroid/view/ViewGroup;

    .line 138
    .line 139
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Lv/VImage;

    .line 150
    .line 151
    iput-object v3, p0, Ll/vw60;->i:Lv/VImage;

    .line 152
    .line 153
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    check-cast v3, Landroid/view/ViewGroup;

    .line 158
    .line 159
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Landroid/view/ViewGroup;

    .line 164
    .line 165
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Landroid/view/ViewGroup;

    .line 170
    .line 171
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Lv/VText;

    .line 176
    .line 177
    iput-object v3, p0, Ll/vw60;->j:Lv/VText;

    .line 178
    .line 179
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    check-cast v3, Landroid/view/ViewGroup;

    .line 184
    .line 185
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    check-cast v3, Lv/VRelative;

    .line 190
    .line 191
    iput-object v3, p0, Ll/vw60;->k:Lv/VRelative;

    .line 192
    .line 193
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    check-cast v3, Landroid/view/ViewGroup;

    .line 198
    .line 199
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Landroid/view/ViewGroup;

    .line 204
    .line 205
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Lv/VButton;

    .line 210
    .line 211
    iput-object v3, p0, Ll/vw60;->l:Lv/VButton;

    .line 212
    .line 213
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Landroid/view/ViewGroup;

    .line 218
    .line 219
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    check-cast v3, Landroid/view/ViewGroup;

    .line 224
    .line 225
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    check-cast v3, Lv/VLinear;

    .line 230
    .line 231
    iput-object v3, p0, Ll/vw60;->m:Lv/VLinear;

    .line 232
    .line 233
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    check-cast v3, Landroid/view/ViewGroup;

    .line 238
    .line 239
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    check-cast v3, Landroid/view/ViewGroup;

    .line 244
    .line 245
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    check-cast v3, Landroid/view/ViewGroup;

    .line 250
    .line 251
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    check-cast v3, Lv/VImage;

    .line 256
    .line 257
    iput-object v3, p0, Ll/vw60;->n:Lv/VImage;

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    check-cast v3, Landroid/view/ViewGroup;

    .line 264
    .line 265
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    check-cast v3, Landroid/view/ViewGroup;

    .line 270
    .line 271
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    check-cast v3, Landroid/view/ViewGroup;

    .line 276
    .line 277
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    check-cast v3, Lv/VText;

    .line 282
    .line 283
    iput-object v3, p0, Ll/vw60;->o:Lv/VText;

    .line 284
    .line 285
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    check-cast v3, Landroid/view/ViewGroup;

    .line 290
    .line 291
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    check-cast v3, Lv/VRelative;

    .line 296
    .line 297
    iput-object v3, p0, Ll/vw60;->p:Lv/VRelative;

    .line 298
    .line 299
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    check-cast v3, Landroid/view/ViewGroup;

    .line 304
    .line 305
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v3

    .line 309
    check-cast v3, Landroid/view/ViewGroup;

    .line 310
    .line 311
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    check-cast v3, Lv/VButton;

    .line 316
    .line 317
    iput-object v3, p0, Ll/vw60;->q:Lv/VButton;

    .line 318
    .line 319
    const/4 v3, 0x3

    .line 320
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 325
    .line 326
    iput-object v4, p0, Ll/vw60;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 327
    .line 328
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    check-cast v4, Landroid/view/ViewGroup;

    .line 333
    .line 334
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    check-cast v4, Lv/VLinear;

    .line 339
    .line 340
    iput-object v4, p0, Ll/vw60;->s:Lv/VLinear;

    .line 341
    .line 342
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    check-cast v4, Landroid/view/ViewGroup;

    .line 347
    .line 348
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    check-cast v4, Landroid/widget/LinearLayout;

    .line 353
    .line 354
    iput-object v4, p0, Ll/vw60;->t:Landroid/widget/LinearLayout;

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
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    check-cast v0, Lv/VDraweeView;

    .line 373
    .line 374
    iput-object v0, p0, Ll/vw60;->u:Lv/VDraweeView;

    .line 375
    .line 376
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    check-cast v0, Landroid/view/ViewGroup;

    .line 381
    .line 382
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    check-cast v0, Landroid/view/ViewGroup;

    .line 387
    .line 388
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    check-cast v0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 393
    .line 394
    iput-object v0, p0, Ll/vw60;->v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 395
    .line 396
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    check-cast v0, Landroid/view/ViewGroup;

    .line 401
    .line 402
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    check-cast v0, Landroid/view/ViewGroup;

    .line 407
    .line 408
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    check-cast v0, Landroid/widget/TextView;

    .line 413
    .line 414
    iput-object v0, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 415
    .line 416
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    check-cast p1, Landroid/view/ViewGroup;

    .line 421
    .line 422
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    check-cast p1, Landroid/view/ViewGroup;

    .line 427
    .line 428
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object p1

    .line 432
    check-cast p1, Landroid/widget/TextView;

    .line 433
    .line 434
    iput-object p1, p0, Ll/vw60;->x:Landroid/widget/TextView;

    .line 435
    .line 436
    return-void
.end method

.method public static b(Ll/vw60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->S1:I

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
    invoke-static {p0, p1}, Ll/ww60;->a(Ll/vw60;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public static c(Ll/vw60;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/vw60;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    iput-object v0, p0, Ll/vw60;->c:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    iput-object v0, p0, Ll/vw60;->d:Lv/VFrame;

    .line 9
    .line 10
    iput-object v0, p0, Ll/vw60;->e:Lv/VLinear;

    .line 11
    .line 12
    iput-object v0, p0, Ll/vw60;->f:Lv/VImage;

    .line 13
    .line 14
    iput-object v0, p0, Ll/vw60;->g:Lv/VText;

    .line 15
    .line 16
    iput-object v0, p0, Ll/vw60;->h:Lv/VLinear;

    .line 17
    .line 18
    iput-object v0, p0, Ll/vw60;->i:Lv/VImage;

    .line 19
    .line 20
    iput-object v0, p0, Ll/vw60;->j:Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Ll/vw60;->k:Lv/VRelative;

    .line 23
    .line 24
    iput-object v0, p0, Ll/vw60;->l:Lv/VButton;

    .line 25
    .line 26
    iput-object v0, p0, Ll/vw60;->m:Lv/VLinear;

    .line 27
    .line 28
    iput-object v0, p0, Ll/vw60;->n:Lv/VImage;

    .line 29
    .line 30
    iput-object v0, p0, Ll/vw60;->o:Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Ll/vw60;->p:Lv/VRelative;

    .line 33
    .line 34
    iput-object v0, p0, Ll/vw60;->q:Lv/VButton;

    .line 35
    .line 36
    iput-object v0, p0, Ll/vw60;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 37
    .line 38
    iput-object v0, p0, Ll/vw60;->s:Lv/VLinear;

    .line 39
    .line 40
    iput-object v0, p0, Ll/vw60;->t:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    iput-object v0, p0, Ll/vw60;->u:Lv/VDraweeView;

    .line 43
    .line 44
    iput-object v0, p0, Ll/vw60;->v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 45
    .line 46
    iput-object v0, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 47
    .line 48
    iput-object v0, p0, Ll/vw60;->x:Landroid/widget/TextView;

    .line 49
    .line 50
    return-void
.end method
