.class public Ll/dgl;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;Landroid/view/View;)V
    .locals 6

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
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lv/VText;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->c:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/LinearLayout;

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->d:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Landroid/view/ViewGroup;

    .line 80
    .line 81
    const/4 v3, 0x2

    .line 82
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->g:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Landroid/view/ViewGroup;

    .line 95
    .line 96
    const/4 v4, 0x3

    .line 97
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->h:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 104
    .line 105
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Landroid/view/ViewGroup;

    .line 110
    .line 111
    const/4 v5, 0x4

    .line 112
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->i:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 119
    .line 120
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Landroid/widget/LinearLayout;

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Landroid/view/ViewGroup;

    .line 133
    .line 134
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->k:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 141
    .line 142
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Landroid/view/ViewGroup;

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 153
    .line 154
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->l:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 155
    .line 156
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Landroid/view/ViewGroup;

    .line 161
    .line 162
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 169
    .line 170
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    check-cast v1, Landroid/view/ViewGroup;

    .line 175
    .line 176
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->n:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 183
    .line 184
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Landroid/view/ViewGroup;

    .line 189
    .line 190
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->o:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 197
    .line 198
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Landroid/view/ViewGroup;

    .line 203
    .line 204
    const/4 v5, 0x5

    .line 205
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 210
    .line 211
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->p:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 212
    .line 213
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    check-cast v1, Lv/VLinear;

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 220
    .line 221
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Landroid/view/ViewGroup;

    .line 226
    .line 227
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    check-cast v1, Lv/VLinear;

    .line 232
    .line 233
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->r:Lv/VLinear;

    .line 234
    .line 235
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 252
    .line 253
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->s:Landroid/widget/RelativeLayout;

    .line 254
    .line 255
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    check-cast v1, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, Lv/VImage;

    .line 278
    .line 279
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->t:Lv/VImage;

    .line 280
    .line 281
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    check-cast v1, Landroid/view/ViewGroup;

    .line 286
    .line 287
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    check-cast v1, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 298
    .line 299
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 300
    .line 301
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    check-cast v1, Landroid/view/ViewGroup;

    .line 306
    .line 307
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Landroid/view/ViewGroup;

    .line 312
    .line 313
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 318
    .line 319
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->v:Landroid/widget/RelativeLayout;

    .line 320
    .line 321
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    check-cast v1, Landroid/view/ViewGroup;

    .line 326
    .line 327
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    check-cast v1, Landroid/view/ViewGroup;

    .line 332
    .line 333
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    check-cast v1, Landroid/view/ViewGroup;

    .line 338
    .line 339
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    check-cast v1, Lv/VImage;

    .line 344
    .line 345
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->w:Lv/VImage;

    .line 346
    .line 347
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    check-cast v1, Landroid/view/ViewGroup;

    .line 352
    .line 353
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    check-cast v1, Landroid/view/ViewGroup;

    .line 358
    .line 359
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    check-cast v1, Lv/VLinear;

    .line 364
    .line 365
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->x:Lv/VLinear;

    .line 366
    .line 367
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    check-cast p1, Landroid/view/ViewGroup;

    .line 372
    .line 373
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    check-cast p1, Landroid/view/ViewGroup;

    .line 378
    .line 379
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    check-cast p1, Landroid/view/ViewGroup;

    .line 384
    .line 385
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 390
    .line 391
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->y:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 392
    .line 393
    return-void
.end method
