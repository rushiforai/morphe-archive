.class public Ll/tzk;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tzk$c;
    }
.end annotation


# static fields
.field public static final n:I


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lv/VLinear;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

.field public l:Landroid/view/View;

.field public m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->T6:I

    .line 2
    .line 3
    sput v0, Ll/tzk;->n:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/tzk;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tzk;->g()V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/tzk;->m:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Ll/tzk;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tzk;->h(I)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->L4:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic e(Ll/tzk;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tzk;->j(I)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0, p1, v1, p2}, Ll/tzk;->i(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Ll/tzk;->m:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "preview"

    .line 33
    .line 34
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    const/4 v1, 0x3

    .line 39
    const/4 v2, 0x2

    .line 40
    const/4 v3, 0x1

    .line 41
    const/4 v4, 0x0

    .line 42
    const v5, 0xffffff

    .line 43
    .line 44
    .line 45
    const-string v6, "#ECD3D3"

    .line 46
    .line 47
    const/4 v7, 0x0

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v0, v7}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/tzk;->e:Lv/VLinear;

    .line 54
    .line 55
    const/high16 v7, 0x42700000    # 60.0f

    .line 56
    .line 57
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    invoke-static {p2, v7}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    check-cast p2, Ll/wlj;

    .line 71
    .line 72
    invoke-virtual {p2, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/n3x;->k()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 86
    .line 87
    iget-object v0, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 88
    .line 89
    sget v7, Ll/dbc0;->Rd:I

    .line 90
    .line 91
    invoke-virtual {p2, v0, v7}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 96
    .line 97
    iget-object v7, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 98
    .line 99
    invoke-virtual {v0, v7, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-static {}, Ll/n3x;->g()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    move-object v6, p2

    .line 114
    :goto_1
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    filled-new-array {p2, v5}, [I

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 123
    .line 124
    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 125
    .line 126
    invoke-direct {v0, v5, p2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Ll/tzk;->a:Landroid/view/View;

    .line 130
    .line 131
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_6

    .line 135
    .line 136
    :cond_2
    iget-object p2, p0, Ll/tzk;->m:Ljava/lang/String;

    .line 137
    .line 138
    const-string v8, "profile"

    .line 139
    .line 140
    invoke-static {p2, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-eqz p2, :cond_5

    .line 145
    .line 146
    iget-object p2, p0, Ll/tzk;->e:Lv/VLinear;

    .line 147
    .line 148
    const/high16 v8, 0x42880000    # 68.0f

    .line 149
    .line 150
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v8

    .line 154
    invoke-static {p2, v8}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v7}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 161
    .line 162
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    check-cast p2, Ll/wlj;

    .line 167
    .line 168
    invoke-virtual {p2, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ll/n3x;->l()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_3

    .line 180
    .line 181
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 182
    .line 183
    iget-object v0, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 184
    .line 185
    sget v7, Ll/dbc0;->Sd:I

    .line 186
    .line 187
    invoke-virtual {p2, v0, v7}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 192
    .line 193
    iget-object v7, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 194
    .line 195
    invoke-virtual {v0, v7, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :goto_2
    invoke-static {}, Ll/n3x;->g()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_4

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_4
    move-object v6, p2

    .line 210
    :goto_3
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    filled-new-array {p2, v5}, [I

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 219
    .line 220
    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 221
    .line 222
    invoke-direct {v0, v5, p2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 223
    .line 224
    .line 225
    iget-object p2, p0, Ll/tzk;->a:Landroid/view/View;

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 228
    .line 229
    .line 230
    goto/16 :goto_6

    .line 231
    .line 232
    :cond_5
    const/high16 p2, 0x41940000    # 18.5f

    .line 233
    .line 234
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 235
    .line 236
    .line 237
    move-result v8

    .line 238
    int-to-float v8, v8

    .line 239
    invoke-virtual {v0, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 240
    .line 241
    .line 242
    iget-object v8, p0, Ll/tzk;->e:Lv/VLinear;

    .line 243
    .line 244
    const/high16 v9, 0x420c0000    # 35.0f

    .line 245
    .line 246
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 247
    .line 248
    .line 249
    move-result v9

    .line 250
    invoke-static {v8, v9}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 251
    .line 252
    .line 253
    iget-object v8, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 254
    .line 255
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 256
    .line 257
    .line 258
    move-result-object v8

    .line 259
    check-cast v8, Ll/wlj;

    .line 260
    .line 261
    invoke-virtual {v8, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 262
    .line 263
    .line 264
    invoke-static {}, Ll/n3x;->h()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 269
    .line 270
    .line 271
    move-result v8

    .line 272
    if-eqz v8, :cond_6

    .line 273
    .line 274
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 275
    .line 276
    iget-object v8, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 277
    .line 278
    sget v9, Ll/dbc0;->Nd:I

    .line 279
    .line 280
    invoke-virtual {v0, v8, v9}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 281
    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_6
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 285
    .line 286
    iget-object v9, p0, Ll/tzk;->b:Lv/VDraweeView;

    .line 287
    .line 288
    invoke-virtual {v8, v9, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    :goto_4
    invoke-static {}, Ll/n3x;->g()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v8

    .line 299
    if-eqz v8, :cond_7

    .line 300
    .line 301
    goto :goto_5

    .line 302
    :cond_7
    move-object v6, v0

    .line 303
    :goto_5
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    int-to-float v0, v0

    .line 308
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 309
    .line 310
    .line 311
    move-result v6

    .line 312
    filled-new-array {v6, v5}, [I

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    .line 317
    .line 318
    sget-object v7, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 319
    .line 320
    invoke-direct {v6, v7, v5}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 321
    .line 322
    .line 323
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    int-to-float v5, v5

    .line 328
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 329
    .line 330
    .line 331
    move-result v7

    .line 332
    int-to-float v7, v7

    .line 333
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 334
    .line 335
    .line 336
    move-result v8

    .line 337
    int-to-float v8, v8

    .line 338
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 339
    .line 340
    .line 341
    move-result p2

    .line 342
    int-to-float p2, p2

    .line 343
    const/16 v9, 0x8

    .line 344
    .line 345
    new-array v9, v9, [F

    .line 346
    .line 347
    aput v5, v9, v4

    .line 348
    .line 349
    aput v7, v9, v3

    .line 350
    .line 351
    aput v8, v9, v2

    .line 352
    .line 353
    aput p2, v9, v1

    .line 354
    .line 355
    const/4 p2, 0x4

    .line 356
    aput v0, v9, p2

    .line 357
    .line 358
    const/4 p2, 0x5

    .line 359
    aput v0, v9, p2

    .line 360
    .line 361
    const/4 p2, 0x6

    .line 362
    aput v0, v9, p2

    .line 363
    .line 364
    const/4 p2, 0x7

    .line 365
    aput v0, v9, p2

    .line 366
    .line 367
    invoke-virtual {v6, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 368
    .line 369
    .line 370
    iget-object p2, p0, Ll/tzk;->a:Landroid/view/View;

    .line 371
    .line 372
    invoke-virtual {p2, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 373
    .line 374
    .line 375
    :goto_6
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 376
    .line 377
    iget-object v0, p0, Ll/tzk;->f:Lv/VDraweeView;

    .line 378
    .line 379
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 380
    .line 381
    .line 382
    move-result-object v5

    .line 383
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v5

    .line 391
    invoke-virtual {p2, v0, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    iget-object p2, p0, Ll/tzk;->h:Lv/VText;

    .line 395
    .line 396
    new-instance v0, Ll/tzk$b;

    .line 397
    .line 398
    invoke-direct {v0, p0, p1}, Ll/tzk$b;-><init>(Ll/tzk;Lcom/p1/mobile/putong/data/User;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 402
    .line 403
    .line 404
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 405
    .line 406
    if-eqz p2, :cond_c

    .line 407
    .line 408
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 409
    .line 410
    if-eqz p2, :cond_c

    .line 411
    .line 412
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 413
    .line 414
    if-eqz p2, :cond_c

    .line 415
    .line 416
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 417
    .line 418
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 419
    .line 420
    .line 421
    move-result p2

    .line 422
    if-nez p2, :cond_c

    .line 423
    .line 424
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 425
    .line 426
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 427
    .line 428
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 429
    .line 430
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 431
    .line 432
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    check-cast p2, Ljava/lang/String;

    .line 437
    .line 438
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 439
    .line 440
    .line 441
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    const/4 v5, -0x1

    .line 446
    sparse-switch v0, :sswitch_data_0

    .line 447
    .line 448
    .line 449
    :goto_7
    move v2, v5

    .line 450
    goto :goto_8

    .line 451
    :sswitch_0
    const-string v0, "in_two_years"

    .line 452
    .line 453
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 454
    .line 455
    .line 456
    move-result p2

    .line 457
    if-nez p2, :cond_a

    .line 458
    .line 459
    goto :goto_7

    .line 460
    :sswitch_1
    const-string v0, "at_right_time"

    .line 461
    .line 462
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result p2

    .line 466
    if-nez p2, :cond_8

    .line 467
    .line 468
    goto :goto_7

    .line 469
    :cond_8
    move v2, v3

    .line 470
    goto :goto_8

    .line 471
    :sswitch_2
    const-string v0, "in_one_year"

    .line 472
    .line 473
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result p2

    .line 477
    if-nez p2, :cond_9

    .line 478
    .line 479
    goto :goto_7

    .line 480
    :cond_9
    move v2, v4

    .line 481
    :cond_a
    :goto_8
    packed-switch v2, :pswitch_data_0

    .line 482
    .line 483
    .line 484
    const-string p2, "\u968f\u7f18"

    .line 485
    .line 486
    goto :goto_9

    .line 487
    :pswitch_0
    const-string p2, "\u5e0c\u671b\u4e24\u5e74\u5185\u7ed3\u5a5a"

    .line 488
    .line 489
    goto :goto_9

    .line 490
    :pswitch_1
    const-string p2, "\u65f6\u673a\u6210\u719f\u5c31\u7ed3\u5a5a"

    .line 491
    .line 492
    goto :goto_9

    .line 493
    :pswitch_2
    const-string p2, "\u5e0c\u671b\u4e00\u5e74\u5185\u7ed3\u5a5a"

    .line 494
    .line 495
    :goto_9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 496
    .line 497
    .line 498
    move-result v0

    .line 499
    if-eqz v0, :cond_b

    .line 500
    .line 501
    const-string v0, "\u5979"

    .line 502
    .line 503
    goto :goto_a

    .line 504
    :cond_b
    const-string v0, "\u4ed6"

    .line 505
    .line 506
    :goto_a
    iget-object v2, p0, Ll/tzk;->i:Lv/VText;

    .line 507
    .line 508
    new-instance v5, Ljava/lang/StringBuilder;

    .line 509
    .line 510
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    const-string v0, "\u7684\u7ed3\u5a5a\u9884\u671f\uff1a"

    .line 517
    .line 518
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object p2

    .line 528
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 529
    .line 530
    .line 531
    iget-object p2, p0, Ll/tzk;->i:Lv/VText;

    .line 532
    .line 533
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    invoke-virtual {p2, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 538
    .line 539
    .line 540
    iget-object p2, p0, Ll/tzk;->i:Lv/VText;

    .line 541
    .line 542
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 543
    .line 544
    .line 545
    goto :goto_b

    .line 546
    :cond_c
    iget-object p2, p0, Ll/tzk;->i:Lv/VText;

    .line 547
    .line 548
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 549
    .line 550
    .line 551
    :goto_b
    iget-object p2, p0, Ll/tzk;->g:Lv/VImage;

    .line 552
    .line 553
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 554
    .line 555
    .line 556
    move-result v0

    .line 557
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 558
    .line 559
    .line 560
    invoke-static {p1}, Ll/n3x;->t(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 561
    .line 562
    .line 563
    move-result-object p1

    .line 564
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 565
    .line 566
    .line 567
    move-result p2

    .line 568
    iget-object v0, p0, Ll/tzk;->k:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 569
    .line 570
    if-eqz p2, :cond_d

    .line 571
    .line 572
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 573
    .line 574
    .line 575
    return-void

    .line 576
    :cond_d
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 577
    .line 578
    .line 579
    invoke-static {}, Ll/n3x;->i()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p2

    .line 583
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 584
    .line 585
    .line 586
    move-result v0

    .line 587
    if-nez v0, :cond_e

    .line 588
    .line 589
    iget-object v0, p0, Ll/tzk;->k:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 590
    .line 591
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 592
    .line 593
    .line 594
    move-result p2

    .line 595
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setTagBackgroundPaintLight(I)V

    .line 596
    .line 597
    .line 598
    :cond_e
    iget-object p0, p0, Ll/tzk;->k:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 599
    .line 600
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setLabel(Ljava/util/List;)V

    .line 601
    .line 602
    .line 603
    return-void

    .line 604
    nop

    .line 605
    :sswitch_data_0
    .sparse-switch
        -0x79e23fb0 -> :sswitch_2
        -0x35b30964 -> :sswitch_1
        -0x2526a677 -> :sswitch_0
    .end sparse-switch

    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uzk;->a(Ll/tzk;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tzk;->k:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 2
    .line 3
    new-instance v1, Ll/tzk$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tzk$a;-><init>(Ll/tzk;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setFirstLabelShowCallback(Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic h(I)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->L4:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 21
    .line 22
    iget-object v1, p0, Ll/tzk;->l:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const-string v1, "\u7b26\u5408\u4f60\u5bf9\u7406\u60f3\u4f34\u4fa3\u7684\u8981\u6c42"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-wide/16 v2, 0x1388

    .line 43
    .line 44
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/szk;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/szk;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/high16 v2, 0x41c00000    # 24.0f

    .line 58
    .line 59
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    add-int/2addr v2, p1

    .line 64
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 69
    .line 70
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 71
    .line 72
    or-int/2addr v1, v2

    .line 73
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object p0, p0, Ll/tzk;->l:Landroid/view/View;

    .line 81
    .line 82
    const-string v1, "marry_label_tips"

    .line 83
    .line 84
    invoke-virtual {p1, v0, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tzk;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-nez p2, :cond_9

    .line 13
    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 21
    .line 22
    const/4 p3, 0x5

    .line 23
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 p3, 0x1

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    iget-object p2, p0, Ll/tzk;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 31
    .line 32
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 36
    .line 37
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_9

    .line 42
    .line 43
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Location;->isHideInfo()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Location;->isHideRegionCountry()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_9

    .line 56
    .line 57
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    goto/16 :goto_2

    .line 64
    .line 65
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget v0, p2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 74
    .line 75
    const/16 v2, 0x2710

    .line 76
    .line 77
    if-lt v0, v2, :cond_4

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 86
    .line 87
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_9

    .line 94
    .line 95
    iget-object p1, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 96
    .line 97
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 101
    .line 102
    const-string p2, "\u540c\u57ce"

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 108
    .line 109
    sget p1, Ll/dbc0;->Od:I

    .line 110
    .line 111
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v0, "\u8ddd\u4f60"

    .line 118
    .line 119
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget v0, p2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 123
    .line 124
    const/16 v2, 0x64

    .line 125
    .line 126
    const/16 v3, 0x3e8

    .line 127
    .line 128
    if-gt v0, v3, :cond_7

    .line 129
    .line 130
    if-ne v0, v3, :cond_5

    .line 131
    .line 132
    const-string p2, "1km"

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_5
    if-le v0, v2, :cond_6

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_6
    move v0, v2

    .line 142
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 146
    .line 147
    sget v0, Lcom/p1/mobile/putong/common/R$string;->J0:I

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_7
    div-int/2addr v0, v3

    .line 158
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget p2, p2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 162
    .line 163
    div-int/2addr p2, v2

    .line 164
    rem-int/lit8 p2, p2, 0xa

    .line 165
    .line 166
    if-lez p2, :cond_8

    .line 167
    .line 168
    const-string v0, "."

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    :cond_8
    const-string p2, "km"

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    :goto_1
    iget-object p2, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 182
    .line 183
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 187
    .line 188
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Ll/tzk;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 196
    .line 197
    sget p1, Ll/dbc0;->xp:I

    .line 198
    .line 199
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 200
    .line 201
    .line 202
    :cond_9
    :goto_2
    return-void
.end method

.method public final j(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->L4:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "marry_label_tips"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/tzk;->l:Landroid/view/View;

    .line 30
    .line 31
    new-instance v1, Ll/rzk;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/rzk;-><init>(Ll/tzk;I)V

    .line 34
    .line 35
    .line 36
    const-wide/16 p0, 0x1f4

    .line 37
    .line 38
    invoke-virtual {v0, v1, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method
