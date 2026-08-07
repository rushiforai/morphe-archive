.class public Ll/pha0;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/view/View;)V
    .locals 8

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lv/VFrame;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->z:Lv/VFrame;

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
    check-cast v1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/view/ViewGroup;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->B:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Landroid/view/ViewGroup;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/google/android/material/tabs/TabLayout;

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->C:Lcom/google/android/material/tabs/TabLayout;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Landroid/view/ViewGroup;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lv/VFrame;

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->D:Lv/VFrame;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Landroid/view/ViewGroup;

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Landroid/view/ViewGroup;

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Lv/VProgressBar;

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->E:Lv/VProgressBar;

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Landroid/view/ViewGroup;

    .line 120
    .line 121
    const/4 v4, 0x3

    .line 122
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Lv/VFrame;

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->F:Lv/VFrame;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Landroid/view/ViewGroup;

    .line 141
    .line 142
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Landroid/view/ViewGroup;

    .line 147
    .line 148
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Lv/VProgressBar;

    .line 153
    .line 154
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->G:Lv/VProgressBar;

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
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    check-cast v1, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 179
    .line 180
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    check-cast v1, Landroid/view/ViewGroup;

    .line 187
    .line 188
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    check-cast v1, Landroid/view/ViewGroup;

    .line 193
    .line 194
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    check-cast v1, Landroid/view/ViewGroup;

    .line 199
    .line 200
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    check-cast v1, Lv/VLinear;

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I:Lv/VLinear;

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    check-cast v1, Landroid/view/ViewGroup;

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    check-cast v1, Landroid/view/ViewGroup;

    .line 225
    .line 226
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    check-cast v1, Landroid/view/ViewGroup;

    .line 231
    .line 232
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    check-cast v1, Landroid/widget/FrameLayout;

    .line 237
    .line 238
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->J:Landroid/widget/FrameLayout;

    .line 239
    .line 240
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    check-cast v1, Landroid/view/ViewGroup;

    .line 245
    .line 246
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Landroid/view/ViewGroup;

    .line 251
    .line 252
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    check-cast v1, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    check-cast v1, Landroid/view/ViewGroup;

    .line 263
    .line 264
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    check-cast v1, Landroid/view/ViewGroup;

    .line 269
    .line 270
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    check-cast v1, Landroidx/cardview/widget/CardView;

    .line 275
    .line 276
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->K:Landroidx/cardview/widget/CardView;

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    check-cast v1, Landroid/view/ViewGroup;

    .line 283
    .line 284
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Landroid/view/ViewGroup;

    .line 289
    .line 290
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    check-cast v1, Landroid/view/ViewGroup;

    .line 295
    .line 296
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    check-cast v1, Landroid/view/ViewGroup;

    .line 301
    .line 302
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    check-cast v1, Landroid/view/ViewGroup;

    .line 307
    .line 308
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    check-cast v1, Landroidx/cardview/widget/CardView;

    .line 313
    .line 314
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->L:Landroidx/cardview/widget/CardView;

    .line 315
    .line 316
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    check-cast v1, Landroid/view/ViewGroup;

    .line 321
    .line 322
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    check-cast v1, Landroid/view/ViewGroup;

    .line 327
    .line 328
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    check-cast v1, Landroid/view/ViewGroup;

    .line 333
    .line 334
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    check-cast v1, Landroid/view/ViewGroup;

    .line 339
    .line 340
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    check-cast v1, Landroid/view/ViewGroup;

    .line 345
    .line 346
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    check-cast v1, Landroidx/cardview/widget/CardView;

    .line 351
    .line 352
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->M:Landroidx/cardview/widget/CardView;

    .line 353
    .line 354
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    check-cast v1, Landroid/view/ViewGroup;

    .line 359
    .line 360
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    check-cast v1, Landroid/view/ViewGroup;

    .line 365
    .line 366
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    check-cast v1, Landroid/view/ViewGroup;

    .line 371
    .line 372
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    check-cast v1, Landroid/view/ViewGroup;

    .line 377
    .line 378
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    check-cast v1, Landroid/view/ViewGroup;

    .line 383
    .line 384
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    check-cast v1, Landroid/view/ViewGroup;

    .line 389
    .line 390
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    check-cast v1, Landroid/view/ViewGroup;

    .line 395
    .line 396
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    check-cast v1, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 401
    .line 402
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->N:Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 403
    .line 404
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    check-cast v1, Landroid/view/ViewGroup;

    .line 409
    .line 410
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    check-cast v1, Landroid/view/ViewGroup;

    .line 415
    .line 416
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    check-cast v1, Landroid/view/ViewGroup;

    .line 421
    .line 422
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    check-cast v1, Landroid/view/ViewGroup;

    .line 427
    .line 428
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object v1

    .line 432
    check-cast v1, Landroid/view/ViewGroup;

    .line 433
    .line 434
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    check-cast v1, Landroid/view/ViewGroup;

    .line 439
    .line 440
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    check-cast v1, Landroid/view/ViewGroup;

    .line 445
    .line 446
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    check-cast v1, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 451
    .line 452
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->O:Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 453
    .line 454
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    check-cast v1, Landroid/view/ViewGroup;

    .line 459
    .line 460
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    check-cast v1, Landroid/view/ViewGroup;

    .line 465
    .line 466
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    check-cast v1, Landroid/view/ViewGroup;

    .line 471
    .line 472
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    check-cast v1, Landroid/view/ViewGroup;

    .line 477
    .line 478
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    check-cast v1, Landroid/view/ViewGroup;

    .line 483
    .line 484
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    check-cast v1, Landroid/view/ViewGroup;

    .line 489
    .line 490
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    check-cast v1, Landroid/view/ViewGroup;

    .line 495
    .line 496
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    check-cast v1, Lv/VImage;

    .line 501
    .line 502
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->P:Lv/VImage;

    .line 503
    .line 504
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    check-cast v1, Landroid/view/ViewGroup;

    .line 509
    .line 510
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    check-cast v1, Landroid/view/ViewGroup;

    .line 515
    .line 516
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    check-cast v1, Landroid/view/ViewGroup;

    .line 521
    .line 522
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 523
    .line 524
    .line 525
    move-result-object v1

    .line 526
    check-cast v1, Landroid/view/ViewGroup;

    .line 527
    .line 528
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    check-cast v1, Landroid/view/ViewGroup;

    .line 533
    .line 534
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    check-cast v1, Landroid/view/ViewGroup;

    .line 539
    .line 540
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    check-cast v1, Landroid/view/ViewGroup;

    .line 545
    .line 546
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    check-cast v1, Lv/VImage;

    .line 551
    .line 552
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Q:Lv/VImage;

    .line 553
    .line 554
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    check-cast v1, Landroid/view/ViewGroup;

    .line 559
    .line 560
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    check-cast v1, Landroid/view/ViewGroup;

    .line 565
    .line 566
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    check-cast v1, Landroid/view/ViewGroup;

    .line 571
    .line 572
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, Landroid/view/ViewGroup;

    .line 577
    .line 578
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 579
    .line 580
    .line 581
    move-result-object v1

    .line 582
    check-cast v1, Landroid/view/ViewGroup;

    .line 583
    .line 584
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 585
    .line 586
    .line 587
    move-result-object v1

    .line 588
    check-cast v1, Landroid/view/ViewGroup;

    .line 589
    .line 590
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    check-cast v1, Landroid/view/ViewGroup;

    .line 595
    .line 596
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    check-cast v1, Lv/VText;

    .line 601
    .line 602
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->R:Lv/VText;

    .line 603
    .line 604
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    check-cast v1, Landroid/view/ViewGroup;

    .line 621
    .line 622
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    check-cast v1, Landroid/view/ViewGroup;

    .line 627
    .line 628
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object v1

    .line 632
    check-cast v1, Landroid/view/ViewGroup;

    .line 633
    .line 634
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    check-cast v1, Landroid/view/ViewGroup;

    .line 639
    .line 640
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    check-cast v1, Landroid/view/ViewGroup;

    .line 645
    .line 646
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    check-cast v1, Lv/VText;

    .line 651
    .line 652
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->S:Lv/VText;

    .line 653
    .line 654
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 655
    .line 656
    .line 657
    move-result-object v1

    .line 658
    check-cast v1, Landroid/view/ViewGroup;

    .line 659
    .line 660
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 661
    .line 662
    .line 663
    move-result-object v1

    .line 664
    check-cast v1, Landroid/view/ViewGroup;

    .line 665
    .line 666
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 667
    .line 668
    .line 669
    move-result-object v1

    .line 670
    check-cast v1, Landroid/view/ViewGroup;

    .line 671
    .line 672
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 673
    .line 674
    .line 675
    move-result-object v1

    .line 676
    check-cast v1, Landroid/view/ViewGroup;

    .line 677
    .line 678
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 679
    .line 680
    .line 681
    move-result-object v1

    .line 682
    check-cast v1, Landroid/view/ViewGroup;

    .line 683
    .line 684
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 685
    .line 686
    .line 687
    move-result-object v1

    .line 688
    check-cast v1, Landroid/view/ViewStub;

    .line 689
    .line 690
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->T:Landroid/view/ViewStub;

    .line 691
    .line 692
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    check-cast v1, Landroid/view/ViewGroup;

    .line 697
    .line 698
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    check-cast v1, Landroid/view/ViewGroup;

    .line 703
    .line 704
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 705
    .line 706
    .line 707
    move-result-object v1

    .line 708
    check-cast v1, Landroid/view/ViewGroup;

    .line 709
    .line 710
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    check-cast v1, Landroid/view/ViewGroup;

    .line 715
    .line 716
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 717
    .line 718
    .line 719
    move-result-object v1

    .line 720
    check-cast v1, Landroid/view/ViewGroup;

    .line 721
    .line 722
    const/4 v5, 0x4

    .line 723
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 724
    .line 725
    .line 726
    move-result-object v1

    .line 727
    check-cast v1, Landroid/view/ViewStub;

    .line 728
    .line 729
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U:Landroid/view/ViewStub;

    .line 730
    .line 731
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 732
    .line 733
    .line 734
    move-result-object v1

    .line 735
    check-cast v1, Landroid/view/ViewGroup;

    .line 736
    .line 737
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 738
    .line 739
    .line 740
    move-result-object v1

    .line 741
    check-cast v1, Landroid/view/ViewGroup;

    .line 742
    .line 743
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 744
    .line 745
    .line 746
    move-result-object v1

    .line 747
    check-cast v1, Landroid/view/ViewGroup;

    .line 748
    .line 749
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 750
    .line 751
    .line 752
    move-result-object v1

    .line 753
    check-cast v1, Landroid/view/ViewGroup;

    .line 754
    .line 755
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 756
    .line 757
    .line 758
    move-result-object v1

    .line 759
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 760
    .line 761
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->V:Landroidx/recyclerview/widget/RecyclerView;

    .line 762
    .line 763
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 764
    .line 765
    .line 766
    move-result-object v1

    .line 767
    check-cast v1, Landroid/view/ViewGroup;

    .line 768
    .line 769
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 770
    .line 771
    .line 772
    move-result-object v1

    .line 773
    check-cast v1, Landroid/view/ViewGroup;

    .line 774
    .line 775
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 776
    .line 777
    .line 778
    move-result-object v1

    .line 779
    check-cast v1, Landroid/view/ViewGroup;

    .line 780
    .line 781
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 782
    .line 783
    .line 784
    move-result-object v1

    .line 785
    check-cast v1, Lcom/p1/mobile/putong/core/ui/FloatShadowButton;

    .line 786
    .line 787
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->W:Lcom/p1/mobile/putong/core/ui/FloatShadowButton;

    .line 788
    .line 789
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 790
    .line 791
    .line 792
    move-result-object v1

    .line 793
    check-cast v1, Landroid/view/ViewGroup;

    .line 794
    .line 795
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 796
    .line 797
    .line 798
    move-result-object v1

    .line 799
    check-cast v1, Landroid/view/ViewGroup;

    .line 800
    .line 801
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 802
    .line 803
    .line 804
    move-result-object v1

    .line 805
    check-cast v1, Landroid/view/ViewGroup;

    .line 806
    .line 807
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 808
    .line 809
    .line 810
    move-result-object v1

    .line 811
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->X:Landroid/view/View;

    .line 812
    .line 813
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 814
    .line 815
    .line 816
    move-result-object v1

    .line 817
    check-cast v1, Landroid/view/ViewGroup;

    .line 818
    .line 819
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 820
    .line 821
    .line 822
    move-result-object v1

    .line 823
    check-cast v1, Landroid/view/ViewGroup;

    .line 824
    .line 825
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 826
    .line 827
    .line 828
    move-result-object v1

    .line 829
    check-cast v1, Landroid/view/ViewGroup;

    .line 830
    .line 831
    const/4 v6, 0x5

    .line 832
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 833
    .line 834
    .line 835
    move-result-object v1

    .line 836
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 837
    .line 838
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Y:Landroid/widget/RelativeLayout;

    .line 839
    .line 840
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 841
    .line 842
    .line 843
    move-result-object v1

    .line 844
    check-cast v1, Landroid/view/ViewGroup;

    .line 845
    .line 846
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 847
    .line 848
    .line 849
    move-result-object v1

    .line 850
    check-cast v1, Landroid/view/ViewGroup;

    .line 851
    .line 852
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 853
    .line 854
    .line 855
    move-result-object v1

    .line 856
    check-cast v1, Landroid/view/ViewGroup;

    .line 857
    .line 858
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 859
    .line 860
    .line 861
    move-result-object v1

    .line 862
    check-cast v1, Landroid/view/ViewGroup;

    .line 863
    .line 864
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 865
    .line 866
    .line 867
    move-result-object v1

    .line 868
    check-cast v1, Lv/VFrame_Shadow;

    .line 869
    .line 870
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Z:Lv/VFrame_Shadow;

    .line 871
    .line 872
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 873
    .line 874
    .line 875
    move-result-object v1

    .line 876
    check-cast v1, Landroid/view/ViewGroup;

    .line 877
    .line 878
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 879
    .line 880
    .line 881
    move-result-object v1

    .line 882
    check-cast v1, Landroid/view/ViewGroup;

    .line 883
    .line 884
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 885
    .line 886
    .line 887
    move-result-object v1

    .line 888
    check-cast v1, Landroid/view/ViewGroup;

    .line 889
    .line 890
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 891
    .line 892
    .line 893
    move-result-object v1

    .line 894
    check-cast v1, Landroid/view/ViewGroup;

    .line 895
    .line 896
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 897
    .line 898
    .line 899
    move-result-object v1

    .line 900
    check-cast v1, Landroid/view/ViewGroup;

    .line 901
    .line 902
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 903
    .line 904
    .line 905
    move-result-object v1

    .line 906
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 907
    .line 908
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k0:Landroid/widget/RelativeLayout;

    .line 909
    .line 910
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 911
    .line 912
    .line 913
    move-result-object v1

    .line 914
    check-cast v1, Landroid/view/ViewGroup;

    .line 915
    .line 916
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 917
    .line 918
    .line 919
    move-result-object v1

    .line 920
    check-cast v1, Landroid/view/ViewGroup;

    .line 921
    .line 922
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 923
    .line 924
    .line 925
    move-result-object v1

    .line 926
    check-cast v1, Landroid/view/ViewGroup;

    .line 927
    .line 928
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 929
    .line 930
    .line 931
    move-result-object v1

    .line 932
    check-cast v1, Landroid/view/ViewGroup;

    .line 933
    .line 934
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 935
    .line 936
    .line 937
    move-result-object v1

    .line 938
    check-cast v1, Lv/VText;

    .line 939
    .line 940
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->p0:Lv/VText;

    .line 941
    .line 942
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 943
    .line 944
    .line 945
    move-result-object v1

    .line 946
    check-cast v1, Landroid/view/ViewGroup;

    .line 947
    .line 948
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 949
    .line 950
    .line 951
    move-result-object v1

    .line 952
    check-cast v1, Landroid/view/ViewGroup;

    .line 953
    .line 954
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 955
    .line 956
    .line 957
    move-result-object v1

    .line 958
    check-cast v1, Landroid/view/ViewGroup;

    .line 959
    .line 960
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 961
    .line 962
    .line 963
    move-result-object v1

    .line 964
    check-cast v1, Landroid/view/ViewGroup;

    .line 965
    .line 966
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 967
    .line 968
    .line 969
    move-result-object v1

    .line 970
    check-cast v1, Lv/VFrame_Shadow;

    .line 971
    .line 972
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->E0:Lv/VFrame_Shadow;

    .line 973
    .line 974
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 975
    .line 976
    .line 977
    move-result-object v1

    .line 978
    check-cast v1, Landroid/view/ViewGroup;

    .line 979
    .line 980
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 981
    .line 982
    .line 983
    move-result-object v1

    .line 984
    check-cast v1, Landroid/view/ViewGroup;

    .line 985
    .line 986
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 987
    .line 988
    .line 989
    move-result-object v1

    .line 990
    check-cast v1, Landroid/view/ViewGroup;

    .line 991
    .line 992
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 993
    .line 994
    .line 995
    move-result-object v1

    .line 996
    check-cast v1, Landroid/view/ViewGroup;

    .line 997
    .line 998
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 999
    .line 1000
    .line 1001
    move-result-object v1

    .line 1002
    check-cast v1, Landroid/view/ViewGroup;

    .line 1003
    .line 1004
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v1

    .line 1008
    check-cast v1, Lv/VFrame_FlipContainer;

    .line 1009
    .line 1010
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->F0:Lv/VFrame_FlipContainer;

    .line 1011
    .line 1012
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1013
    .line 1014
    .line 1015
    move-result-object v1

    .line 1016
    check-cast v1, Landroid/view/ViewGroup;

    .line 1017
    .line 1018
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v1

    .line 1022
    check-cast v1, Landroid/view/ViewGroup;

    .line 1023
    .line 1024
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v1

    .line 1028
    check-cast v1, Landroid/view/ViewGroup;

    .line 1029
    .line 1030
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v1

    .line 1034
    check-cast v1, Landroid/view/ViewGroup;

    .line 1035
    .line 1036
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v1

    .line 1040
    check-cast v1, Landroid/view/ViewGroup;

    .line 1041
    .line 1042
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v1

    .line 1046
    check-cast v1, Landroid/view/ViewGroup;

    .line 1047
    .line 1048
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v1

    .line 1052
    check-cast v1, Lv/VImage;

    .line 1053
    .line 1054
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->G0:Lv/VImage;

    .line 1055
    .line 1056
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v1

    .line 1060
    check-cast v1, Landroid/view/ViewGroup;

    .line 1061
    .line 1062
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v1

    .line 1066
    check-cast v1, Landroid/view/ViewGroup;

    .line 1067
    .line 1068
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1069
    .line 1070
    .line 1071
    move-result-object v1

    .line 1072
    check-cast v1, Landroid/view/ViewGroup;

    .line 1073
    .line 1074
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v1

    .line 1078
    check-cast v1, Landroid/view/ViewGroup;

    .line 1079
    .line 1080
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v1

    .line 1084
    check-cast v1, Landroid/view/ViewGroup;

    .line 1085
    .line 1086
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v1

    .line 1090
    check-cast v1, Landroid/view/ViewGroup;

    .line 1091
    .line 1092
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1093
    .line 1094
    .line 1095
    move-result-object v1

    .line 1096
    check-cast v1, Lv/VText;

    .line 1097
    .line 1098
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->H0:Lv/VText;

    .line 1099
    .line 1100
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v1

    .line 1104
    check-cast v1, Landroid/view/ViewGroup;

    .line 1105
    .line 1106
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v1

    .line 1110
    check-cast v1, Landroid/view/ViewGroup;

    .line 1111
    .line 1112
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1113
    .line 1114
    .line 1115
    move-result-object v1

    .line 1116
    check-cast v1, Landroid/view/ViewGroup;

    .line 1117
    .line 1118
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1119
    .line 1120
    .line 1121
    move-result-object v1

    .line 1122
    check-cast v1, Landroid/view/ViewGroup;

    .line 1123
    .line 1124
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1125
    .line 1126
    .line 1127
    move-result-object v1

    .line 1128
    check-cast v1, Lv/VLinear;

    .line 1129
    .line 1130
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I0:Lv/VLinear;

    .line 1131
    .line 1132
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1133
    .line 1134
    .line 1135
    move-result-object v1

    .line 1136
    check-cast v1, Landroid/view/ViewGroup;

    .line 1137
    .line 1138
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v1

    .line 1142
    check-cast v1, Landroid/view/ViewGroup;

    .line 1143
    .line 1144
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v1

    .line 1148
    check-cast v1, Landroid/view/ViewGroup;

    .line 1149
    .line 1150
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v1

    .line 1154
    check-cast v1, Landroid/view/ViewGroup;

    .line 1155
    .line 1156
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1157
    .line 1158
    .line 1159
    move-result-object v1

    .line 1160
    check-cast v1, Landroid/view/ViewGroup;

    .line 1161
    .line 1162
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v1

    .line 1166
    check-cast v1, Lv/VFrame_FlipContainer;

    .line 1167
    .line 1168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->J0:Lv/VFrame_FlipContainer;

    .line 1169
    .line 1170
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v1

    .line 1174
    check-cast v1, Landroid/view/ViewGroup;

    .line 1175
    .line 1176
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v1

    .line 1180
    check-cast v1, Landroid/view/ViewGroup;

    .line 1181
    .line 1182
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v1

    .line 1186
    check-cast v1, Landroid/view/ViewGroup;

    .line 1187
    .line 1188
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v1

    .line 1192
    check-cast v1, Landroid/view/ViewGroup;

    .line 1193
    .line 1194
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v1

    .line 1198
    check-cast v1, Landroid/view/ViewGroup;

    .line 1199
    .line 1200
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v1

    .line 1204
    check-cast v1, Landroid/view/ViewGroup;

    .line 1205
    .line 1206
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v1

    .line 1210
    check-cast v1, Lv/VImage;

    .line 1211
    .line 1212
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->K0:Lv/VImage;

    .line 1213
    .line 1214
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v1

    .line 1218
    check-cast v1, Landroid/view/ViewGroup;

    .line 1219
    .line 1220
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v1

    .line 1224
    check-cast v1, Landroid/view/ViewGroup;

    .line 1225
    .line 1226
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1227
    .line 1228
    .line 1229
    move-result-object v1

    .line 1230
    check-cast v1, Landroid/view/ViewGroup;

    .line 1231
    .line 1232
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1233
    .line 1234
    .line 1235
    move-result-object v1

    .line 1236
    check-cast v1, Landroid/view/ViewGroup;

    .line 1237
    .line 1238
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1239
    .line 1240
    .line 1241
    move-result-object v1

    .line 1242
    check-cast v1, Landroid/view/ViewGroup;

    .line 1243
    .line 1244
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1245
    .line 1246
    .line 1247
    move-result-object v1

    .line 1248
    check-cast v1, Landroid/widget/FrameLayout;

    .line 1249
    .line 1250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->L0:Landroid/widget/FrameLayout;

    .line 1251
    .line 1252
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1253
    .line 1254
    .line 1255
    move-result-object v1

    .line 1256
    check-cast v1, Landroid/view/ViewGroup;

    .line 1257
    .line 1258
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v1

    .line 1262
    check-cast v1, Landroid/view/ViewGroup;

    .line 1263
    .line 1264
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v1

    .line 1268
    check-cast v1, Landroid/view/ViewGroup;

    .line 1269
    .line 1270
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1271
    .line 1272
    .line 1273
    move-result-object v1

    .line 1274
    check-cast v1, Landroid/view/ViewGroup;

    .line 1275
    .line 1276
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1277
    .line 1278
    .line 1279
    move-result-object v1

    .line 1280
    check-cast v1, Landroid/view/ViewGroup;

    .line 1281
    .line 1282
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1283
    .line 1284
    .line 1285
    move-result-object v1

    .line 1286
    check-cast v1, Landroid/view/ViewGroup;

    .line 1287
    .line 1288
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1289
    .line 1290
    .line 1291
    move-result-object v1

    .line 1292
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgWithShadowButton;

    .line 1293
    .line 1294
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->M0:Lcom/p1/mobile/putong/core/ui/GradientBgWithShadowButton;

    .line 1295
    .line 1296
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1297
    .line 1298
    .line 1299
    move-result-object v1

    .line 1300
    check-cast v1, Landroid/view/ViewGroup;

    .line 1301
    .line 1302
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v1

    .line 1306
    check-cast v1, Landroid/view/ViewGroup;

    .line 1307
    .line 1308
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1309
    .line 1310
    .line 1311
    move-result-object v1

    .line 1312
    check-cast v1, Landroid/view/ViewGroup;

    .line 1313
    .line 1314
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1315
    .line 1316
    .line 1317
    move-result-object v1

    .line 1318
    check-cast v1, Landroid/view/ViewGroup;

    .line 1319
    .line 1320
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1321
    .line 1322
    .line 1323
    move-result-object v1

    .line 1324
    check-cast v1, Lv/VFrame_Shadow;

    .line 1325
    .line 1326
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->N0:Lv/VFrame_Shadow;

    .line 1327
    .line 1328
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v1

    .line 1332
    check-cast v1, Landroid/view/ViewGroup;

    .line 1333
    .line 1334
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v1

    .line 1338
    check-cast v1, Landroid/view/ViewGroup;

    .line 1339
    .line 1340
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1341
    .line 1342
    .line 1343
    move-result-object v1

    .line 1344
    check-cast v1, Landroid/view/ViewGroup;

    .line 1345
    .line 1346
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1347
    .line 1348
    .line 1349
    move-result-object v1

    .line 1350
    check-cast v1, Landroid/view/ViewGroup;

    .line 1351
    .line 1352
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v1

    .line 1356
    check-cast v1, Lv/VFrame_Shadow;

    .line 1357
    .line 1358
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->O0:Lv/VFrame_Shadow;

    .line 1359
    .line 1360
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1361
    .line 1362
    .line 1363
    move-result-object v1

    .line 1364
    check-cast v1, Landroid/view/ViewGroup;

    .line 1365
    .line 1366
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1367
    .line 1368
    .line 1369
    move-result-object v1

    .line 1370
    check-cast v1, Landroid/view/ViewGroup;

    .line 1371
    .line 1372
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1373
    .line 1374
    .line 1375
    move-result-object v1

    .line 1376
    check-cast v1, Landroid/view/ViewGroup;

    .line 1377
    .line 1378
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1379
    .line 1380
    .line 1381
    move-result-object v1

    .line 1382
    check-cast v1, Landroid/view/ViewGroup;

    .line 1383
    .line 1384
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1385
    .line 1386
    .line 1387
    move-result-object v1

    .line 1388
    check-cast v1, Landroid/view/ViewGroup;

    .line 1389
    .line 1390
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v1

    .line 1394
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 1395
    .line 1396
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->P0:Landroid/widget/RelativeLayout;

    .line 1397
    .line 1398
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v1

    .line 1402
    check-cast v1, Landroid/view/ViewGroup;

    .line 1403
    .line 1404
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1405
    .line 1406
    .line 1407
    move-result-object v1

    .line 1408
    check-cast v1, Landroid/view/ViewGroup;

    .line 1409
    .line 1410
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1411
    .line 1412
    .line 1413
    move-result-object v1

    .line 1414
    check-cast v1, Landroid/view/ViewGroup;

    .line 1415
    .line 1416
    const/4 v7, 0x6

    .line 1417
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1418
    .line 1419
    .line 1420
    move-result-object v1

    .line 1421
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 1422
    .line 1423
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Q0:Landroid/widget/RelativeLayout;

    .line 1424
    .line 1425
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1426
    .line 1427
    .line 1428
    move-result-object v1

    .line 1429
    check-cast v1, Landroid/view/ViewGroup;

    .line 1430
    .line 1431
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1432
    .line 1433
    .line 1434
    move-result-object v1

    .line 1435
    check-cast v1, Landroid/view/ViewGroup;

    .line 1436
    .line 1437
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1438
    .line 1439
    .line 1440
    move-result-object v1

    .line 1441
    check-cast v1, Landroid/view/ViewGroup;

    .line 1442
    .line 1443
    const/4 v7, 0x7

    .line 1444
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1445
    .line 1446
    .line 1447
    move-result-object v1

    .line 1448
    check-cast v1, Lv/VLinear;

    .line 1449
    .line 1450
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->R0:Lv/VLinear;

    .line 1451
    .line 1452
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v1

    .line 1456
    check-cast v1, Landroid/view/ViewGroup;

    .line 1457
    .line 1458
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1459
    .line 1460
    .line 1461
    move-result-object v1

    .line 1462
    check-cast v1, Landroid/view/ViewGroup;

    .line 1463
    .line 1464
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1465
    .line 1466
    .line 1467
    move-result-object v1

    .line 1468
    check-cast v1, Landroid/view/ViewGroup;

    .line 1469
    .line 1470
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1471
    .line 1472
    .line 1473
    move-result-object v1

    .line 1474
    check-cast v1, Landroid/view/ViewGroup;

    .line 1475
    .line 1476
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1477
    .line 1478
    .line 1479
    move-result-object v1

    .line 1480
    check-cast v1, Lv/VButton;

    .line 1481
    .line 1482
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->S0:Lv/VButton;

    .line 1483
    .line 1484
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v1

    .line 1488
    check-cast v1, Landroid/view/ViewGroup;

    .line 1489
    .line 1490
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1491
    .line 1492
    .line 1493
    move-result-object v1

    .line 1494
    check-cast v1, Landroid/view/ViewGroup;

    .line 1495
    .line 1496
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1497
    .line 1498
    .line 1499
    move-result-object v1

    .line 1500
    check-cast v1, Landroid/view/ViewGroup;

    .line 1501
    .line 1502
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1503
    .line 1504
    .line 1505
    move-result-object v1

    .line 1506
    check-cast v1, Landroid/view/ViewGroup;

    .line 1507
    .line 1508
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v1

    .line 1512
    check-cast v1, Lv/VButton;

    .line 1513
    .line 1514
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->T0:Lv/VButton;

    .line 1515
    .line 1516
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1517
    .line 1518
    .line 1519
    move-result-object v1

    .line 1520
    check-cast v1, Landroid/view/ViewGroup;

    .line 1521
    .line 1522
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1523
    .line 1524
    .line 1525
    move-result-object v1

    .line 1526
    check-cast v1, Landroid/view/ViewGroup;

    .line 1527
    .line 1528
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1529
    .line 1530
    .line 1531
    move-result-object v1

    .line 1532
    check-cast v1, Landroid/view/ViewGroup;

    .line 1533
    .line 1534
    const/16 v7, 0x8

    .line 1535
    .line 1536
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1537
    .line 1538
    .line 1539
    move-result-object v1

    .line 1540
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 1541
    .line 1542
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->U0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 1543
    .line 1544
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1545
    .line 1546
    .line 1547
    move-result-object v1

    .line 1548
    check-cast v1, Landroid/view/ViewGroup;

    .line 1549
    .line 1550
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1551
    .line 1552
    .line 1553
    move-result-object v1

    .line 1554
    check-cast v1, Landroid/view/ViewGroup;

    .line 1555
    .line 1556
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1557
    .line 1558
    .line 1559
    move-result-object v1

    .line 1560
    check-cast v1, Landroid/view/ViewGroup;

    .line 1561
    .line 1562
    const/16 v7, 0x9

    .line 1563
    .line 1564
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1565
    .line 1566
    .line 1567
    move-result-object v1

    .line 1568
    check-cast v1, Landroid/widget/FrameLayout;

    .line 1569
    .line 1570
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->V0:Landroid/widget/FrameLayout;

    .line 1571
    .line 1572
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1573
    .line 1574
    .line 1575
    move-result-object v1

    .line 1576
    check-cast v1, Landroid/view/ViewGroup;

    .line 1577
    .line 1578
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1579
    .line 1580
    .line 1581
    move-result-object v1

    .line 1582
    check-cast v1, Landroid/view/ViewGroup;

    .line 1583
    .line 1584
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1585
    .line 1586
    .line 1587
    move-result-object v1

    .line 1588
    check-cast v1, Landroid/view/ViewGroup;

    .line 1589
    .line 1590
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1591
    .line 1592
    .line 1593
    move-result-object v1

    .line 1594
    check-cast v1, Landroid/view/ViewGroup;

    .line 1595
    .line 1596
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1597
    .line 1598
    .line 1599
    move-result-object v1

    .line 1600
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->W0:Landroid/view/View;

    .line 1601
    .line 1602
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1603
    .line 1604
    .line 1605
    move-result-object v1

    .line 1606
    check-cast v1, Landroid/view/ViewGroup;

    .line 1607
    .line 1608
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1609
    .line 1610
    .line 1611
    move-result-object v1

    .line 1612
    check-cast v1, Landroid/view/ViewGroup;

    .line 1613
    .line 1614
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v1

    .line 1618
    check-cast v1, Landroid/view/ViewGroup;

    .line 1619
    .line 1620
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1621
    .line 1622
    .line 1623
    move-result-object v1

    .line 1624
    check-cast v1, Landroid/view/ViewGroup;

    .line 1625
    .line 1626
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v1

    .line 1630
    check-cast v1, Landroid/view/ViewGroup;

    .line 1631
    .line 1632
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1633
    .line 1634
    .line 1635
    move-result-object v1

    .line 1636
    check-cast v1, Landroid/view/ViewGroup;

    .line 1637
    .line 1638
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1639
    .line 1640
    .line 1641
    move-result-object v1

    .line 1642
    check-cast v1, Lv/VEditText;

    .line 1643
    .line 1644
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->X0:Lv/VEditText;

    .line 1645
    .line 1646
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1647
    .line 1648
    .line 1649
    move-result-object v1

    .line 1650
    check-cast v1, Landroid/view/ViewGroup;

    .line 1651
    .line 1652
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1653
    .line 1654
    .line 1655
    move-result-object v1

    .line 1656
    check-cast v1, Landroid/view/ViewGroup;

    .line 1657
    .line 1658
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1659
    .line 1660
    .line 1661
    move-result-object v1

    .line 1662
    check-cast v1, Landroid/view/ViewGroup;

    .line 1663
    .line 1664
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1665
    .line 1666
    .line 1667
    move-result-object v1

    .line 1668
    check-cast v1, Landroid/view/ViewGroup;

    .line 1669
    .line 1670
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1671
    .line 1672
    .line 1673
    move-result-object v1

    .line 1674
    check-cast v1, Landroid/view/ViewGroup;

    .line 1675
    .line 1676
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1677
    .line 1678
    .line 1679
    move-result-object v1

    .line 1680
    check-cast v1, Landroid/view/ViewGroup;

    .line 1681
    .line 1682
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1683
    .line 1684
    .line 1685
    move-result-object v1

    .line 1686
    check-cast v1, Lv/VText;

    .line 1687
    .line 1688
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Y0:Lv/VText;

    .line 1689
    .line 1690
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v1

    .line 1694
    check-cast v1, Landroid/view/ViewGroup;

    .line 1695
    .line 1696
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1697
    .line 1698
    .line 1699
    move-result-object v1

    .line 1700
    check-cast v1, Landroid/view/ViewGroup;

    .line 1701
    .line 1702
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1703
    .line 1704
    .line 1705
    move-result-object v1

    .line 1706
    check-cast v1, Landroid/view/ViewGroup;

    .line 1707
    .line 1708
    const/16 v7, 0xa

    .line 1709
    .line 1710
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1711
    .line 1712
    .line 1713
    move-result-object v1

    .line 1714
    check-cast v1, Landroid/widget/FrameLayout;

    .line 1715
    .line 1716
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->Z0:Landroid/widget/FrameLayout;

    .line 1717
    .line 1718
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1719
    .line 1720
    .line 1721
    move-result-object v1

    .line 1722
    check-cast v1, Landroid/view/ViewGroup;

    .line 1723
    .line 1724
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1725
    .line 1726
    .line 1727
    move-result-object v1

    .line 1728
    check-cast v1, Landroid/view/ViewGroup;

    .line 1729
    .line 1730
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1731
    .line 1732
    .line 1733
    move-result-object v1

    .line 1734
    check-cast v1, Landroid/view/ViewGroup;

    .line 1735
    .line 1736
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1737
    .line 1738
    .line 1739
    move-result-object v1

    .line 1740
    check-cast v1, Landroid/view/ViewGroup;

    .line 1741
    .line 1742
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1743
    .line 1744
    .line 1745
    move-result-object v1

    .line 1746
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->a1:Landroid/view/View;

    .line 1747
    .line 1748
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1749
    .line 1750
    .line 1751
    move-result-object v1

    .line 1752
    check-cast v1, Landroid/view/ViewGroup;

    .line 1753
    .line 1754
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1755
    .line 1756
    .line 1757
    move-result-object v1

    .line 1758
    check-cast v1, Landroid/view/ViewGroup;

    .line 1759
    .line 1760
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1761
    .line 1762
    .line 1763
    move-result-object v1

    .line 1764
    check-cast v1, Landroid/view/ViewGroup;

    .line 1765
    .line 1766
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1767
    .line 1768
    .line 1769
    move-result-object v1

    .line 1770
    check-cast v1, Landroid/view/ViewGroup;

    .line 1771
    .line 1772
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1773
    .line 1774
    .line 1775
    move-result-object v1

    .line 1776
    check-cast v1, Landroid/widget/TextView;

    .line 1777
    .line 1778
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->b1:Landroid/widget/TextView;

    .line 1779
    .line 1780
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1781
    .line 1782
    .line 1783
    move-result-object v1

    .line 1784
    check-cast v1, Landroid/view/ViewGroup;

    .line 1785
    .line 1786
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1787
    .line 1788
    .line 1789
    move-result-object v1

    .line 1790
    check-cast v1, Landroid/view/ViewGroup;

    .line 1791
    .line 1792
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1793
    .line 1794
    .line 1795
    move-result-object v1

    .line 1796
    check-cast v1, Landroid/view/ViewGroup;

    .line 1797
    .line 1798
    const/16 v7, 0xb

    .line 1799
    .line 1800
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1801
    .line 1802
    .line 1803
    move-result-object v1

    .line 1804
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;

    .line 1805
    .line 1806
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->c1:Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendContainerView;

    .line 1807
    .line 1808
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1809
    .line 1810
    .line 1811
    move-result-object v1

    .line 1812
    check-cast v1, Landroid/view/ViewGroup;

    .line 1813
    .line 1814
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1815
    .line 1816
    .line 1817
    move-result-object v1

    .line 1818
    check-cast v1, Landroid/view/ViewGroup;

    .line 1819
    .line 1820
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1821
    .line 1822
    .line 1823
    move-result-object v1

    .line 1824
    check-cast v1, Landroid/view/ViewGroup;

    .line 1825
    .line 1826
    const/16 v7, 0xc

    .line 1827
    .line 1828
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1829
    .line 1830
    .line 1831
    move-result-object v1

    .line 1832
    check-cast v1, Lv/VFrame_Shadow;

    .line 1833
    .line 1834
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->d1:Lv/VFrame_Shadow;

    .line 1835
    .line 1836
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1837
    .line 1838
    .line 1839
    move-result-object v1

    .line 1840
    check-cast v1, Landroid/view/ViewGroup;

    .line 1841
    .line 1842
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1843
    .line 1844
    .line 1845
    move-result-object v1

    .line 1846
    check-cast v1, Landroid/view/ViewGroup;

    .line 1847
    .line 1848
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1849
    .line 1850
    .line 1851
    move-result-object v1

    .line 1852
    check-cast v1, Landroid/view/ViewGroup;

    .line 1853
    .line 1854
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1855
    .line 1856
    .line 1857
    move-result-object v1

    .line 1858
    check-cast v1, Landroid/view/ViewGroup;

    .line 1859
    .line 1860
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1861
    .line 1862
    .line 1863
    move-result-object v1

    .line 1864
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 1865
    .line 1866
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->e1:Landroid/widget/RelativeLayout;

    .line 1867
    .line 1868
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1869
    .line 1870
    .line 1871
    move-result-object v1

    .line 1872
    check-cast v1, Landroid/view/ViewGroup;

    .line 1873
    .line 1874
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1875
    .line 1876
    .line 1877
    move-result-object v1

    .line 1878
    check-cast v1, Landroid/view/ViewGroup;

    .line 1879
    .line 1880
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1881
    .line 1882
    .line 1883
    move-result-object v1

    .line 1884
    check-cast v1, Landroid/view/ViewGroup;

    .line 1885
    .line 1886
    const/16 v7, 0xd

    .line 1887
    .line 1888
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1889
    .line 1890
    .line 1891
    move-result-object v1

    .line 1892
    check-cast v1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 1893
    .line 1894
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->f1:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 1895
    .line 1896
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1897
    .line 1898
    .line 1899
    move-result-object v1

    .line 1900
    check-cast v1, Landroid/view/ViewGroup;

    .line 1901
    .line 1902
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1903
    .line 1904
    .line 1905
    move-result-object v1

    .line 1906
    check-cast v1, Landroid/view/ViewGroup;

    .line 1907
    .line 1908
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1909
    .line 1910
    .line 1911
    move-result-object v1

    .line 1912
    check-cast v1, Landroid/view/ViewGroup;

    .line 1913
    .line 1914
    const/16 v7, 0xe

    .line 1915
    .line 1916
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1917
    .line 1918
    .line 1919
    move-result-object v1

    .line 1920
    check-cast v1, Landroid/widget/TextView;

    .line 1921
    .line 1922
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->g1:Landroid/widget/TextView;

    .line 1923
    .line 1924
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1925
    .line 1926
    .line 1927
    move-result-object v1

    .line 1928
    check-cast v1, Landroid/view/ViewGroup;

    .line 1929
    .line 1930
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1931
    .line 1932
    .line 1933
    move-result-object v1

    .line 1934
    check-cast v1, Landroid/view/ViewGroup;

    .line 1935
    .line 1936
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1937
    .line 1938
    .line 1939
    move-result-object v1

    .line 1940
    check-cast v1, Landroid/view/ViewGroup;

    .line 1941
    .line 1942
    const/16 v7, 0xf

    .line 1943
    .line 1944
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1945
    .line 1946
    .line 1947
    move-result-object v1

    .line 1948
    check-cast v1, Lv/VFrame_Shadow;

    .line 1949
    .line 1950
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->h1:Lv/VFrame_Shadow;

    .line 1951
    .line 1952
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1953
    .line 1954
    .line 1955
    move-result-object v1

    .line 1956
    check-cast v1, Landroid/view/ViewGroup;

    .line 1957
    .line 1958
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1959
    .line 1960
    .line 1961
    move-result-object v1

    .line 1962
    check-cast v1, Landroid/view/ViewGroup;

    .line 1963
    .line 1964
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1965
    .line 1966
    .line 1967
    move-result-object v1

    .line 1968
    check-cast v1, Landroid/view/ViewGroup;

    .line 1969
    .line 1970
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1971
    .line 1972
    .line 1973
    move-result-object v1

    .line 1974
    check-cast v1, Landroid/view/ViewGroup;

    .line 1975
    .line 1976
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1977
    .line 1978
    .line 1979
    move-result-object v1

    .line 1980
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 1981
    .line 1982
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->i1:Landroid/widget/RelativeLayout;

    .line 1983
    .line 1984
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1985
    .line 1986
    .line 1987
    move-result-object v1

    .line 1988
    check-cast v1, Landroid/view/ViewGroup;

    .line 1989
    .line 1990
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1991
    .line 1992
    .line 1993
    move-result-object v1

    .line 1994
    check-cast v1, Landroid/view/ViewGroup;

    .line 1995
    .line 1996
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 1997
    .line 1998
    .line 1999
    move-result-object v1

    .line 2000
    check-cast v1, Landroid/view/ViewGroup;

    .line 2001
    .line 2002
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2003
    .line 2004
    .line 2005
    move-result-object v1

    .line 2006
    check-cast v1, Landroid/view/ViewGroup;

    .line 2007
    .line 2008
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2009
    .line 2010
    .line 2011
    move-result-object v1

    .line 2012
    check-cast v1, Landroid/view/ViewGroup;

    .line 2013
    .line 2014
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v1

    .line 2018
    check-cast v1, Lv/VImage;

    .line 2019
    .line 2020
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j1:Lv/VImage;

    .line 2021
    .line 2022
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2023
    .line 2024
    .line 2025
    move-result-object v1

    .line 2026
    check-cast v1, Landroid/view/ViewGroup;

    .line 2027
    .line 2028
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2029
    .line 2030
    .line 2031
    move-result-object v1

    .line 2032
    check-cast v1, Landroid/view/ViewGroup;

    .line 2033
    .line 2034
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2035
    .line 2036
    .line 2037
    move-result-object v1

    .line 2038
    check-cast v1, Landroid/view/ViewGroup;

    .line 2039
    .line 2040
    const/16 v7, 0x10

    .line 2041
    .line 2042
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2043
    .line 2044
    .line 2045
    move-result-object v1

    .line 2046
    check-cast v1, Lv/VLinear;

    .line 2047
    .line 2048
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->k1:Lv/VLinear;

    .line 2049
    .line 2050
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2051
    .line 2052
    .line 2053
    move-result-object v1

    .line 2054
    check-cast v1, Landroid/view/ViewGroup;

    .line 2055
    .line 2056
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2057
    .line 2058
    .line 2059
    move-result-object v1

    .line 2060
    check-cast v1, Landroid/view/ViewGroup;

    .line 2061
    .line 2062
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2063
    .line 2064
    .line 2065
    move-result-object v1

    .line 2066
    check-cast v1, Landroid/view/ViewGroup;

    .line 2067
    .line 2068
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2069
    .line 2070
    .line 2071
    move-result-object v1

    .line 2072
    check-cast v1, Landroid/view/ViewGroup;

    .line 2073
    .line 2074
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2075
    .line 2076
    .line 2077
    move-result-object v1

    .line 2078
    check-cast v1, Lv/VFrame_Shadow;

    .line 2079
    .line 2080
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->l1:Lv/VFrame_Shadow;

    .line 2081
    .line 2082
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2083
    .line 2084
    .line 2085
    move-result-object v1

    .line 2086
    check-cast v1, Landroid/view/ViewGroup;

    .line 2087
    .line 2088
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2089
    .line 2090
    .line 2091
    move-result-object v1

    .line 2092
    check-cast v1, Landroid/view/ViewGroup;

    .line 2093
    .line 2094
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2095
    .line 2096
    .line 2097
    move-result-object v1

    .line 2098
    check-cast v1, Landroid/view/ViewGroup;

    .line 2099
    .line 2100
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2101
    .line 2102
    .line 2103
    move-result-object v1

    .line 2104
    check-cast v1, Landroid/view/ViewGroup;

    .line 2105
    .line 2106
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2107
    .line 2108
    .line 2109
    move-result-object v1

    .line 2110
    check-cast v1, Lv/VFrame_Shadow;

    .line 2111
    .line 2112
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m1:Lv/VFrame_Shadow;

    .line 2113
    .line 2114
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2115
    .line 2116
    .line 2117
    move-result-object v1

    .line 2118
    check-cast v1, Landroid/view/ViewGroup;

    .line 2119
    .line 2120
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2121
    .line 2122
    .line 2123
    move-result-object v1

    .line 2124
    check-cast v1, Landroid/view/ViewGroup;

    .line 2125
    .line 2126
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2127
    .line 2128
    .line 2129
    move-result-object v1

    .line 2130
    check-cast v1, Landroid/view/ViewGroup;

    .line 2131
    .line 2132
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2133
    .line 2134
    .line 2135
    move-result-object v1

    .line 2136
    check-cast v1, Lv/VRelative;

    .line 2137
    .line 2138
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->n1:Lv/VRelative;

    .line 2139
    .line 2140
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2141
    .line 2142
    .line 2143
    move-result-object v1

    .line 2144
    check-cast v1, Landroid/view/ViewGroup;

    .line 2145
    .line 2146
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2147
    .line 2148
    .line 2149
    move-result-object v1

    .line 2150
    check-cast v1, Landroid/view/ViewGroup;

    .line 2151
    .line 2152
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2153
    .line 2154
    .line 2155
    move-result-object v1

    .line 2156
    check-cast v1, Landroid/view/ViewGroup;

    .line 2157
    .line 2158
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2159
    .line 2160
    .line 2161
    move-result-object v1

    .line 2162
    check-cast v1, Landroid/view/ViewGroup;

    .line 2163
    .line 2164
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2165
    .line 2166
    .line 2167
    move-result-object v1

    .line 2168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->o1:Landroid/view/View;

    .line 2169
    .line 2170
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2171
    .line 2172
    .line 2173
    move-result-object v1

    .line 2174
    check-cast v1, Landroid/view/ViewGroup;

    .line 2175
    .line 2176
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2177
    .line 2178
    .line 2179
    move-result-object v1

    .line 2180
    check-cast v1, Landroid/view/ViewGroup;

    .line 2181
    .line 2182
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2183
    .line 2184
    .line 2185
    move-result-object v1

    .line 2186
    check-cast v1, Landroid/view/ViewGroup;

    .line 2187
    .line 2188
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2189
    .line 2190
    .line 2191
    move-result-object v1

    .line 2192
    check-cast v1, Landroid/view/ViewGroup;

    .line 2193
    .line 2194
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2195
    .line 2196
    .line 2197
    move-result-object v1

    .line 2198
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->p1:Landroid/view/View;

    .line 2199
    .line 2200
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v1, Landroid/view/ViewGroup;

    .line 2211
    .line 2212
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2213
    .line 2214
    .line 2215
    move-result-object v1

    .line 2216
    check-cast v1, Landroid/view/ViewGroup;

    .line 2217
    .line 2218
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2219
    .line 2220
    .line 2221
    move-result-object v1

    .line 2222
    check-cast v1, Landroid/view/ViewGroup;

    .line 2223
    .line 2224
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2225
    .line 2226
    .line 2227
    move-result-object v1

    .line 2228
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 2229
    .line 2230
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->q1:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 2231
    .line 2232
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2233
    .line 2234
    .line 2235
    move-result-object v1

    .line 2236
    check-cast v1, Landroid/view/ViewGroup;

    .line 2237
    .line 2238
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2239
    .line 2240
    .line 2241
    move-result-object v1

    .line 2242
    check-cast v1, Landroid/view/ViewGroup;

    .line 2243
    .line 2244
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2245
    .line 2246
    .line 2247
    move-result-object v1

    .line 2248
    check-cast v1, Landroid/view/ViewGroup;

    .line 2249
    .line 2250
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2251
    .line 2252
    .line 2253
    move-result-object v1

    .line 2254
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->r1:Landroid/view/View;

    .line 2255
    .line 2256
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2257
    .line 2258
    .line 2259
    move-result-object v0

    .line 2260
    check-cast v0, Landroid/view/ViewGroup;

    .line 2261
    .line 2262
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2263
    .line 2264
    .line 2265
    move-result-object v0

    .line 2266
    check-cast v0, Landroid/view/ViewGroup;

    .line 2267
    .line 2268
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2269
    .line 2270
    .line 2271
    move-result-object v0

    .line 2272
    check-cast v0, Lv/VFrame;

    .line 2273
    .line 2274
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->s1:Lv/VFrame;

    .line 2275
    .line 2276
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2277
    .line 2278
    .line 2279
    move-result-object v0

    .line 2280
    check-cast v0, Landroid/widget/LinearLayout;

    .line 2281
    .line 2282
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->t1:Landroid/widget/LinearLayout;

    .line 2283
    .line 2284
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2285
    .line 2286
    .line 2287
    move-result-object p1

    .line 2288
    check-cast p1, Landroid/view/ViewGroup;

    .line 2289
    .line 2290
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2291
    .line 2292
    .line 2293
    move-result-object p1

    .line 2294
    check-cast p1, Lv/VText;

    .line 2295
    .line 2296
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->u1:Lv/VText;

    .line 2297
    .line 2298
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->U9:I

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
    invoke-static {p0, p1}, Ll/pha0;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
