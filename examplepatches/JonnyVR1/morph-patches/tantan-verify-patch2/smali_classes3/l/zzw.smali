.class public Ll/zzw;
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

.method public static a(Ll/yzw;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/ScrollView;

    .line 3
    .line 4
    iput-object v0, p0, Ll/yzw;->b:Landroid/widget/ScrollView;

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
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

    .line 20
    .line 21
    iput-object v1, p0, Ll/yzw;->c:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarView;

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
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;

    .line 35
    .line 36
    iput-object v1, p0, Ll/yzw;->d:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemAvatarCardView;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/view/ViewGroup;

    .line 43
    .line 44
    const/4 v3, 0x2

    .line 45
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 56
    .line 57
    iput-object v1, p0, Ll/yzw;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;

    .line 76
    .line 77
    iput-object v1, p0, Ll/yzw;->f:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;

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
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroid/view/ViewGroup;

    .line 90
    .line 91
    const/4 v4, 0x4

    .line 92
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lv/VText;

    .line 97
    .line 98
    iput-object v1, p0, Ll/yzw;->g:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Landroid/view/ViewGroup;

    .line 111
    .line 112
    const/4 v4, 0x5

    .line 113
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 118
    .line 119
    iput-object v1, p0, Ll/yzw;->h:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Landroid/view/ViewGroup;

    .line 126
    .line 127
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Landroid/view/ViewGroup;

    .line 132
    .line 133
    const/4 v4, 0x6

    .line 134
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 139
    .line 140
    iput-object v1, p0, Ll/yzw;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Landroid/view/ViewGroup;

    .line 147
    .line 148
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Landroid/view/ViewGroup;

    .line 153
    .line 154
    const/4 v4, 0x7

    .line 155
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 160
    .line 161
    iput-object v1, p0, Ll/yzw;->j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    check-cast v1, Landroid/view/ViewGroup;

    .line 168
    .line 169
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    check-cast v1, Landroid/view/ViewGroup;

    .line 174
    .line 175
    const/16 v4, 0x8

    .line 176
    .line 177
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;

    .line 182
    .line 183
    iput-object v1, p0, Ll/yzw;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTagsView;

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    check-cast v1, Landroid/view/ViewGroup;

    .line 190
    .line 191
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    check-cast v1, Landroid/view/ViewGroup;

    .line 196
    .line 197
    const/16 v4, 0x9

    .line 198
    .line 199
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 204
    .line 205
    iput-object v1, p0, Ll/yzw;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Landroid/view/ViewGroup;

    .line 212
    .line 213
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    check-cast v1, Landroid/view/ViewGroup;

    .line 218
    .line 219
    const/16 v4, 0xa

    .line 220
    .line 221
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 226
    .line 227
    iput-object v1, p0, Ll/yzw;->m:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

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
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    check-cast v1, Landroid/view/ViewGroup;

    .line 240
    .line 241
    const/16 v4, 0xc

    .line 242
    .line 243
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    check-cast v1, Lv/VText;

    .line 248
    .line 249
    iput-object v1, p0, Ll/yzw;->n:Lv/VText;

    .line 250
    .line 251
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    check-cast v1, Landroid/view/ViewGroup;

    .line 256
    .line 257
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    check-cast v1, Landroid/view/ViewGroup;

    .line 262
    .line 263
    const/16 v4, 0xd

    .line 264
    .line 265
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 270
    .line 271
    iput-object v1, p0, Ll/yzw;->o:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 272
    .line 273
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, Landroid/view/ViewGroup;

    .line 278
    .line 279
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    check-cast v1, Landroid/view/ViewGroup;

    .line 284
    .line 285
    const/16 v4, 0xe

    .line 286
    .line 287
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 292
    .line 293
    iput-object v1, p0, Ll/yzw;->p:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 294
    .line 295
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    check-cast v1, Landroid/view/ViewGroup;

    .line 300
    .line 301
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    check-cast v1, Landroid/view/ViewGroup;

    .line 306
    .line 307
    const/16 v4, 0xf

    .line 308
    .line 309
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 314
    .line 315
    iput-object v1, p0, Ll/yzw;->q:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 316
    .line 317
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    check-cast v1, Landroid/view/ViewGroup;

    .line 322
    .line 323
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    check-cast v1, Landroid/view/ViewGroup;

    .line 328
    .line 329
    const/16 v4, 0x10

    .line 330
    .line 331
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 336
    .line 337
    iput-object v1, p0, Ll/yzw;->r:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

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
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    check-cast v1, Landroid/view/ViewGroup;

    .line 350
    .line 351
    const/16 v4, 0x11

    .line 352
    .line 353
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 358
    .line 359
    iput-object v1, p0, Ll/yzw;->s:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 360
    .line 361
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    check-cast v1, Landroid/view/ViewGroup;

    .line 366
    .line 367
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    check-cast v1, Landroid/view/ViewGroup;

    .line 372
    .line 373
    const/16 v4, 0x13

    .line 374
    .line 375
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    check-cast v1, Lv/VText;

    .line 380
    .line 381
    iput-object v1, p0, Ll/yzw;->t:Lv/VText;

    .line 382
    .line 383
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    check-cast v1, Landroid/view/ViewGroup;

    .line 388
    .line 389
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    check-cast v1, Landroid/view/ViewGroup;

    .line 394
    .line 395
    const/16 v4, 0x14

    .line 396
    .line 397
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 402
    .line 403
    iput-object v1, p0, Ll/yzw;->u:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 404
    .line 405
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    check-cast v1, Landroid/view/ViewGroup;

    .line 410
    .line 411
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 412
    .line 413
    .line 414
    move-result-object v1

    .line 415
    check-cast v1, Landroid/view/ViewGroup;

    .line 416
    .line 417
    const/16 v4, 0x15

    .line 418
    .line 419
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 424
    .line 425
    iput-object v1, p0, Ll/yzw;->v:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 426
    .line 427
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    check-cast v1, Landroid/view/ViewGroup;

    .line 432
    .line 433
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    check-cast v1, Landroid/view/ViewGroup;

    .line 438
    .line 439
    const/16 v4, 0x16

    .line 440
    .line 441
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 446
    .line 447
    iput-object v1, p0, Ll/yzw;->w:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 448
    .line 449
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    check-cast v1, Landroid/view/ViewGroup;

    .line 454
    .line 455
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    check-cast v1, Landroid/view/ViewGroup;

    .line 460
    .line 461
    const/16 v4, 0x17

    .line 462
    .line 463
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 468
    .line 469
    iput-object v1, p0, Ll/yzw;->x:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 470
    .line 471
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    check-cast v1, Landroid/view/ViewGroup;

    .line 476
    .line 477
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 478
    .line 479
    .line 480
    move-result-object v1

    .line 481
    check-cast v1, Landroid/view/ViewGroup;

    .line 482
    .line 483
    const/16 v4, 0x18

    .line 484
    .line 485
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 490
    .line 491
    iput-object v1, p0, Ll/yzw;->y:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 492
    .line 493
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    check-cast v1, Landroid/view/ViewGroup;

    .line 498
    .line 499
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    check-cast v1, Landroid/view/ViewGroup;

    .line 504
    .line 505
    const/16 v4, 0x19

    .line 506
    .line 507
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 512
    .line 513
    iput-object v1, p0, Ll/yzw;->z:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 514
    .line 515
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    check-cast v1, Landroid/view/ViewGroup;

    .line 520
    .line 521
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 522
    .line 523
    .line 524
    move-result-object v1

    .line 525
    check-cast v1, Landroid/view/ViewGroup;

    .line 526
    .line 527
    const/16 v4, 0x1a

    .line 528
    .line 529
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 534
    .line 535
    iput-object v1, p0, Ll/yzw;->A:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 536
    .line 537
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 538
    .line 539
    .line 540
    move-result-object v1

    .line 541
    check-cast v1, Landroid/view/ViewGroup;

    .line 542
    .line 543
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    check-cast v1, Landroid/view/ViewGroup;

    .line 548
    .line 549
    const/16 v4, 0x1c

    .line 550
    .line 551
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 552
    .line 553
    .line 554
    move-result-object v1

    .line 555
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 556
    .line 557
    iput-object v1, p0, Ll/yzw;->B:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemTextView;

    .line 558
    .line 559
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    check-cast v1, Landroid/view/ViewGroup;

    .line 564
    .line 565
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 566
    .line 567
    .line 568
    move-result-object v1

    .line 569
    check-cast v1, Landroid/view/ViewGroup;

    .line 570
    .line 571
    const/16 v4, 0x1e

    .line 572
    .line 573
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 574
    .line 575
    .line 576
    move-result-object v1

    .line 577
    check-cast v1, Lv/VText;

    .line 578
    .line 579
    iput-object v1, p0, Ll/yzw;->C:Lv/VText;

    .line 580
    .line 581
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 582
    .line 583
    .line 584
    move-result-object v1

    .line 585
    check-cast v1, Landroid/view/ViewGroup;

    .line 586
    .line 587
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    check-cast v1, Landroid/view/ViewGroup;

    .line 592
    .line 593
    const/16 v4, 0x1f

    .line 594
    .line 595
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 596
    .line 597
    .line 598
    move-result-object v1

    .line 599
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 600
    .line 601
    iput-object v1, p0, Ll/yzw;->D:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;

    .line 602
    .line 603
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 604
    .line 605
    .line 606
    move-result-object v1

    .line 607
    check-cast v1, Landroid/view/ViewGroup;

    .line 608
    .line 609
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    check-cast v1, Landroid/view/ViewGroup;

    .line 614
    .line 615
    const/16 v4, 0x20

    .line 616
    .line 617
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 618
    .line 619
    .line 620
    move-result-object v1

    .line 621
    check-cast v1, Lv/VLinear;

    .line 622
    .line 623
    iput-object v1, p0, Ll/yzw;->E:Lv/VLinear;

    .line 624
    .line 625
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 626
    .line 627
    .line 628
    move-result-object v1

    .line 629
    check-cast v1, Landroid/view/ViewGroup;

    .line 630
    .line 631
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    check-cast v1, Landroid/view/ViewGroup;

    .line 636
    .line 637
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 638
    .line 639
    .line 640
    move-result-object v1

    .line 641
    check-cast v1, Landroid/view/ViewGroup;

    .line 642
    .line 643
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 644
    .line 645
    .line 646
    move-result-object v1

    .line 647
    check-cast v1, Lv/VText;

    .line 648
    .line 649
    iput-object v1, p0, Ll/yzw;->F:Lv/VText;

    .line 650
    .line 651
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 652
    .line 653
    .line 654
    move-result-object p1

    .line 655
    check-cast p1, Landroid/view/ViewGroup;

    .line 656
    .line 657
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 658
    .line 659
    .line 660
    move-result-object p1

    .line 661
    check-cast p1, Landroid/view/ViewGroup;

    .line 662
    .line 663
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 664
    .line 665
    .line 666
    move-result-object p1

    .line 667
    check-cast p1, Landroid/view/ViewGroup;

    .line 668
    .line 669
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 670
    .line 671
    .line 672
    move-result-object p1

    .line 673
    check-cast p1, Lv/VText;

    .line 674
    .line 675
    iput-object p1, p0, Ll/yzw;->G:Lv/VText;

    .line 676
    .line 677
    return-void
.end method

.method public static b(Ll/yzw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/sec0;->M:I

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
    invoke-static {p0, p1}, Ll/zzw;->a(Ll/yzw;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
