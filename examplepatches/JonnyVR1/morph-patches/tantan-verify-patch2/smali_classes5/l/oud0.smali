.class public Ll/oud0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l3m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oud0$b;
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VPager;

.field public e:Lv/VPagerCircleIndicator;

.field public f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

.field public g:Lv/VText;

.field public final h:Lcom/p1/mobile/android/app/Act;

.field public final i:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public j:Ll/oud0$b;

.field public k:Ll/kcg0;

.field public l:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic d(Ll/oud0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oud0;->j(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic e(Ll/oud0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oud0;->i(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private h()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "#2a000000"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 12
    .line 13
    const-string v2, "#F27310"

    .line 14
    .line 15
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 23
    .line 24
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget v2, Ll/h9c0;->b0:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 45
    .line 46
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget v1, Ll/h9c0;->Z:I

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const-string v2, "#ffdea2"

    .line 65
    .line 66
    const-string v3, "#26edd7a3"

    .line 67
    .line 68
    if-nez v0, :cond_5

    .line 69
    .line 70
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :cond_1
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 89
    .line 90
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 97
    .line 98
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    sget v4, Ll/h9c0;->z:I

    .line 101
    .line 102
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 110
    .line 111
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    sget v4, Ll/h9c0;->B:I

    .line 114
    .line 115
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 123
    .line 124
    const-string v1, "#E8E9EB"

    .line 125
    .line 126
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 134
    .line 135
    const-string v1, "#656F7B"

    .line 136
    .line 137
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 145
    .line 146
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 154
    .line 155
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_2
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 164
    .line 165
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    const-string v2, "#26000000"

    .line 170
    .line 171
    if-eqz v0, :cond_3

    .line 172
    .line 173
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 174
    .line 175
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    sget v3, Ll/h9c0;->e:I

    .line 178
    .line 179
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 187
    .line 188
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    sget v3, Ll/h9c0;->c:I

    .line 191
    .line 192
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 200
    .line 201
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 209
    .line 210
    const-string v1, "#F482CE"

    .line 211
    .line 212
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    invoke-virtual {v0, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 220
    .line 221
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 229
    .line 230
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_3
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 239
    .line 240
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_4

    .line 245
    .line 246
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 247
    .line 248
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 249
    .line 250
    sget v3, Ll/h9c0;->e:I

    .line 251
    .line 252
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 260
    .line 261
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    sget v3, Ll/h9c0;->c:I

    .line 264
    .line 265
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 273
    .line 274
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 282
    .line 283
    const-string v1, "#BCE46A"

    .line 284
    .line 285
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    move-result v3

    .line 289
    invoke-virtual {v0, v3}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 290
    .line 291
    .line 292
    iget-object v0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 293
    .line 294
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 302
    .line 303
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 308
    .line 309
    .line 310
    return-void

    .line 311
    :cond_4
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 312
    .line 313
    const-string v2, "#E19971"

    .line 314
    .line 315
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 323
    .line 324
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    invoke-virtual {p0, v0}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 329
    .line 330
    .line 331
    return-void

    .line 332
    :cond_5
    :goto_0
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 333
    .line 334
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 335
    .line 336
    sget v4, Ll/h9c0;->x:I

    .line 337
    .line 338
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 343
    .line 344
    .line 345
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 346
    .line 347
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 348
    .line 349
    sget v4, Ll/h9c0;->y:I

    .line 350
    .line 351
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 356
    .line 357
    .line 358
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 359
    .line 360
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 365
    .line 366
    .line 367
    iget-object v0, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 368
    .line 369
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 374
    .line 375
    .line 376
    iget-object v0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 377
    .line 378
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 379
    .line 380
    .line 381
    move-result v1

    .line 382
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setNormalColor(I)V

    .line 383
    .line 384
    .line 385
    iget-object p0, p0, Ll/oud0;->f:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 386
    .line 387
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->setSelectedColor(I)V

    .line 392
    .line 393
    .line 394
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->t2:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/oud0;->f(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Ll/oud0;->c:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ll/oud0;->h()V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/oud0$b;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/oud0$b;-><init>(Ll/oud0;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Ll/oud0;->j:Ll/oud0$b;

    .line 45
    .line 46
    iget-object v0, p0, Ll/oud0;->d:Lv/VPager;

    .line 47
    .line 48
    invoke-virtual {v0, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 52
    .line 53
    iget-object v0, p0, Ll/oud0;->d:Lv/VPager;

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    invoke-static {p2}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_0

    .line 65
    .line 66
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 67
    .line 68
    iget-object v0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    sget v1, Ll/h9c0;->z:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Ll/oud0;->c:Lv/VText;

    .line 80
    .line 81
    iget-object v0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    sget v1, Ll/h9c0;->B:I

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 93
    .line 94
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget v0, Ll/jbc0;->z6:I

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p2, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    return-object p1

    .line 110
    :cond_0
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 111
    .line 112
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    const-string v0, "#60E8CA8A"

    .line 117
    .line 118
    const-string v1, "#E8CA8A"

    .line 119
    .line 120
    if-nez p2, :cond_5

    .line 121
    .line 122
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 123
    .line 124
    invoke-static {p2}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-eqz p2, :cond_1

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_1
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 132
    .line 133
    invoke-static {p2}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-eqz p2, :cond_2

    .line 138
    .line 139
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 140
    .line 141
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Ll/oud0;->c:Lv/VText;

    .line 149
    .line 150
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    return-object p1

    .line 158
    :cond_2
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 159
    .line 160
    invoke-static {p2}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    if-eqz p2, :cond_3

    .line 165
    .line 166
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 167
    .line 168
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    sget v0, Ll/jbc0;->S:I

    .line 175
    .line 176
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p2, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 181
    .line 182
    .line 183
    return-object p1

    .line 184
    :cond_3
    iget-object p2, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 185
    .line 186
    invoke-static {p2}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 191
    .line 192
    if-eqz p2, :cond_4

    .line 193
    .line 194
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    sget p2, Ll/jbc0;->r7:I

    .line 201
    .line 202
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {v0, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 207
    .line 208
    .line 209
    return-object p1

    .line 210
    :cond_4
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 211
    .line 212
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    sget p2, Ll/jbc0;->qa:I

    .line 217
    .line 218
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-static {v0, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 223
    .line 224
    .line 225
    return-object p1

    .line 226
    :cond_5
    :goto_0
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 227
    .line 228
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Ll/oud0;->c:Lv/VText;

    .line 236
    .line 237
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 242
    .line 243
    .line 244
    iget-object p2, p0, Ll/oud0;->b:Lv/VText;

    .line 245
    .line 246
    iget-object p0, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 247
    .line 248
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    sget v0, Ll/jbc0;->y6:I

    .line 253
    .line 254
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    invoke-static {p2, p0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 259
    .line 260
    .line 261
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oud0;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/oud0;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v3, 0x3

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/a690;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/a690;->y()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 46
    .line 47
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 65
    .line 66
    const-string v1, "\u5f00\u901a\u5979\u4e13\u4eab\u4f1a\u5458"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 72
    .line 73
    const-string v1, "\u7545\u4eab\u5b89\u5fc3\u4ea4\u53cb\u4f53\u9a8c"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_3

    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 81
    .line 82
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/a690;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/a690;->y()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 101
    .line 102
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 120
    .line 121
    const-string v1, "\u5f00\u901a\u9752\u6625\u4e13\u4eab\u4f1a\u5458"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 127
    .line 128
    const-string v1, "\u7ed3\u4ea4\u540c\u9f84\u597d\u53cb\uff0c\u7545\u4eab\u9752\u6625\u751f\u6d3b"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto/16 :goto_3

    .line 134
    .line 135
    :cond_2
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ll/a690;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/a690;->x()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_4

    .line 146
    .line 147
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 148
    .line 149
    const-string v1, "\u89e3\u9501\u767d\u91d1\u4f1a\u5458"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 155
    .line 156
    invoke-static {}, Ll/s7a;->s()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_3

    .line 161
    .line 162
    const-string v1, "\u4eab\u62a2\u5148\u544a\u767d\u7b49%s\u9879\u7279\u6743"

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_3
    const-string v1, "\u4eab\u7f6e\u9876\u559c\u6b22\u7b49%s\u9879\u7279\u6743"

    .line 166
    .line 167
    :goto_0
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 168
    .line 169
    const/4 v5, 0x0

    .line 170
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 194
    .line 195
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 203
    .line 204
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 208
    .line 209
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_3

    .line 213
    .line 214
    :cond_4
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Ll/a690;

    .line 219
    .line 220
    invoke-virtual {v0}, Ll/a690;->B()Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_5

    .line 225
    .line 226
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 227
    .line 228
    const-string v1, "\u89e3\u9501\u9ed1\u91d1\u4f1a\u5458"

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 234
    .line 235
    const-string v1, "\u5c0a\u4eab\u63a2\u63a2\u5168\u5e73\u53f0\u6743\u76ca"

    .line 236
    .line 237
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 241
    .line 242
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 250
    .line 251
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 255
    .line 256
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_3

    .line 260
    .line 261
    :cond_5
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    check-cast v0, Ll/a690;

    .line 266
    .line 267
    invoke-virtual {v0}, Ll/a690;->A()Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_6

    .line 272
    .line 273
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 274
    .line 275
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 283
    .line 284
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 288
    .line 289
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 290
    .line 291
    .line 292
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 293
    .line 294
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->v:I

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 300
    .line 301
    iget-object v1, p0, Ll/oud0;->h:Lcom/p1/mobile/android/app/Act;

    .line 302
    .line 303
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->u:I

    .line 304
    .line 305
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_3

    .line 329
    .line 330
    :cond_6
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    check-cast v0, Ll/a690;

    .line 335
    .line 336
    invoke-virtual {v0}, Ll/a690;->w()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-eqz v0, :cond_8

    .line 341
    .line 342
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Lc()Z

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    if-eqz v0, :cond_7

    .line 355
    .line 356
    const-string v0, "\u5f00\u901a\u6bcf\u65e5\u7cbe\u9009\u7279\u6743"

    .line 357
    .line 358
    goto :goto_1

    .line 359
    :cond_7
    const-string v0, "\u5f00\u901a\u6bcf\u65e5\u5fc3\u52a8\u7279\u6743"

    .line 360
    .line 361
    :goto_1
    iget-object v4, p0, Ll/oud0;->b:Lv/VText;

    .line 362
    .line 363
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 367
    .line 368
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 369
    .line 370
    .line 371
    move-result-object v3

    .line 372
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 373
    .line 374
    .line 375
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 376
    .line 377
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 378
    .line 379
    .line 380
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 381
    .line 382
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_3

    .line 386
    .line 387
    :cond_8
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    check-cast v0, Ll/a690;

    .line 392
    .line 393
    invoke-virtual {v0}, Ll/a690;->z()Z

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    if-eqz v0, :cond_a

    .line 398
    .line 399
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 400
    .line 401
    const-string v1, "\u5f00\u901aSVIP+\u6743\u76ca\u5305"

    .line 402
    .line 403
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 407
    .line 408
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 416
    .line 417
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 418
    .line 419
    .line 420
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Lc()Z

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    if-eqz v0, :cond_9

    .line 433
    .line 434
    const-string v0, "\u6bcf\u65e5\u7cbe\u9009"

    .line 435
    .line 436
    goto :goto_2

    .line 437
    :cond_9
    const-string v0, "\u6bcf\u65e5\u5fc3\u52a8"

    .line 438
    .line 439
    :goto_2
    const-string v1, "+SVIP14\u9879\u7279\u6743"

    .line 440
    .line 441
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    iget-object v1, p0, Ll/oud0;->c:Lv/VText;

    .line 446
    .line 447
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    .line 449
    .line 450
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 451
    .line 452
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 453
    .line 454
    .line 455
    goto :goto_3

    .line 456
    :cond_a
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 457
    .line 458
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    if-eqz v0, :cond_b

    .line 463
    .line 464
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    check-cast v0, Ll/a690;

    .line 469
    .line 470
    invoke-virtual {v0}, Ll/a690;->y()Z

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    if-eqz v0, :cond_b

    .line 475
    .line 476
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 477
    .line 478
    const-string v4, "\u83b7\u53d6\u79c1\u4eba\u5b9a\u5236\u7279\u6743"

    .line 479
    .line 480
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 484
    .line 485
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 493
    .line 494
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 495
    .line 496
    .line 497
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 498
    .line 499
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 500
    .line 501
    .line 502
    goto :goto_3

    .line 503
    :cond_b
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 504
    .line 505
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 506
    .line 507
    .line 508
    move-result v0

    .line 509
    if-eqz v0, :cond_c

    .line 510
    .line 511
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    check-cast v0, Ll/a690;

    .line 516
    .line 517
    invoke-virtual {v0}, Ll/a690;->y()Z

    .line 518
    .line 519
    .line 520
    move-result v0

    .line 521
    if-eqz v0, :cond_c

    .line 522
    .line 523
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 524
    .line 525
    const-string v1, "\u5f00\u901a\u9ed1\u91d1\u4f1a\u5458+\u6743\u76ca\u5305"

    .line 526
    .line 527
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 528
    .line 529
    .line 530
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 531
    .line 532
    const-string v1, "\u79c1\u4eba\u5b9a\u5236+\u9ed1\u91d1\u4f1a\u5458\u5168\u90e8\u7279\u6743"

    .line 533
    .line 534
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 535
    .line 536
    .line 537
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 538
    .line 539
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 544
    .line 545
    .line 546
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 547
    .line 548
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 549
    .line 550
    .line 551
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 552
    .line 553
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 554
    .line 555
    .line 556
    goto :goto_3

    .line 557
    :cond_c
    iget-object v0, p0, Ll/oud0;->b:Lv/VText;

    .line 558
    .line 559
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 560
    .line 561
    .line 562
    iget-object v0, p0, Ll/oud0;->c:Lv/VText;

    .line 563
    .line 564
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 565
    .line 566
    .line 567
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    iget-object v1, p0, Ll/oud0;->e:Lv/VPagerCircleIndicator;

    .line 572
    .line 573
    const/4 v3, 0x1

    .line 574
    if-le v0, v3, :cond_d

    .line 575
    .line 576
    move v2, v3

    .line 577
    :cond_d
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 578
    .line 579
    .line 580
    iget-object v0, p0, Ll/oud0;->d:Lv/VPager;

    .line 581
    .line 582
    new-instance v1, Ll/oud0$a;

    .line 583
    .line 584
    invoke-direct {v1, p0}, Ll/oud0$a;-><init>(Ll/oud0;)V

    .line 585
    .line 586
    .line 587
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 588
    .line 589
    .line 590
    iget-object v0, p0, Ll/oud0;->j:Ll/oud0$b;

    .line 591
    .line 592
    invoke-virtual {v0, p1}, Ll/oud0$b;->j(Ljava/util/List;)V

    .line 593
    .line 594
    .line 595
    invoke-virtual {p0, p1}, Ll/oud0;->k(Ljava/util/List;)V

    .line 596
    .line 597
    .line 598
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pud0;->a(Ll/oud0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    const-wide/16 v1, 0x1388

    .line 16
    .line 17
    invoke-static {v1, v2, v1, v2, v0}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/mud0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/mud0;-><init>(Ll/oud0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/nud0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/nud0;-><init>(Ll/oud0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 56
    .line 57
    return-void
.end method

.method public final synthetic i(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oud0;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/oud0;->d:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/oud0;->m:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Ll/oud0;->d:Lv/VPager;

    .line 16
    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    add-int/2addr p1, v1

    .line 29
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final k(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/oud0;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Ll/oud0;->a:Lv/VImage;

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/oud0;->a:Lv/VImage;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/a690;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/a690;->A()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/a690;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/a690;->w()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/a690;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/a690;->z()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ll/a690;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/a690;->B()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Ll/a690;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/a690;->y()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    :cond_2
    iget-object p0, p0, Ll/oud0;->a:Lv/VImage;

    .line 106
    .line 107
    sget p1, Ll/jbc0;->y4:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    iget-object p0, p0, Ll/oud0;->a:Lv/VImage;

    .line 114
    .line 115
    sget p1, Ll/jbc0;->P4:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/oud0;->k:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oud0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
