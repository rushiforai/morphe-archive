.class public Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:I

.field private P:I

.field private Q:I

.field private R:I

.field private S:I

.field private T:Z

.field private U:Z

.field private V:Z

.field private W:Z

.field private final a:Landroid/os/Handler;

.field private final b:Landroid/graphics/Paint;

.field private final c:Landroid/widget/Scroller;

.field private d:Landroid/view/VelocityTracker;

.field private e:Z

.field private f:Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;

.field private final g:Landroid/graphics/Rect;

.field private final h:Landroid/graphics/Rect;

.field private final i:Landroid/graphics/Rect;

.field private final j:Landroid/graphics/Rect;

.field private final k:Landroid/graphics/Matrix;

.field private k0:Z

.field private final l:Landroid/graphics/Matrix;

.field private m:Ljava/util/List;

.field private n:Ljava/lang/String;

.field private o:I

.field private p:I

.field private p0:Z

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 385
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a:Landroid/os/Handler;

    .line 10
    .line 11
    const/16 v0, 0x32

    .line 12
    .line 13
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->I:I

    .line 14
    .line 15
    const/16 v0, 0x1f40

    .line 16
    .line 17
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->J:I

    .line 18
    .line 19
    const/16 v0, 0x8

    .line 20
    .line 21
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->S:I

    .line 22
    .line 23
    sget-object v0, Ll/ghc0;->a:[I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget v0, Ll/ghc0;->d:I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    sget v0, Ll/h8c0;->a:I

    .line 43
    .line 44
    :cond_0
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 53
    .line 54
    sget v0, Ll/ghc0;->l:I

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Ll/aac0;->c:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->v:I

    .line 71
    .line 72
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 73
    .line 74
    const-string v2, "MI 5s Plus"

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    sget v0, Ll/ghc0;->l:I

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v3, Ll/aac0;->c:I

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->w:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    sget v0, Ll/ghc0;->r:I

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    sget v3, Ll/aac0;->d:I

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->w:I

    .line 118
    .line 119
    :goto_0
    sget v0, Ll/ghc0;->s:I

    .line 120
    .line 121
    const/4 v2, 0x7

    .line 122
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 127
    .line 128
    sget v0, Ll/ghc0;->p:I

    .line 129
    .line 130
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 135
    .line 136
    sget v0, Ll/ghc0;->o:I

    .line 137
    .line 138
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    iput-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->T:Z

    .line 143
    .line 144
    sget v0, Ll/ghc0;->n:I

    .line 145
    .line 146
    const/4 v2, -0x1

    .line 147
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->P:I

    .line 152
    .line 153
    sget v0, Ll/ghc0;->m:I

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->n:Ljava/lang/String;

    .line 160
    .line 161
    sget v0, Ll/ghc0;->q:I

    .line 162
    .line 163
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 168
    .line 169
    sget v0, Ll/ghc0;->k:I

    .line 170
    .line 171
    const v2, -0x777778

    .line 172
    .line 173
    .line 174
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->t:I

    .line 179
    .line 180
    sget v0, Ll/ghc0;->j:I

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    sget v3, Ll/aac0;->b:I

    .line 187
    .line 188
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->z:I

    .line 197
    .line 198
    sget v0, Ll/ghc0;->c:I

    .line 199
    .line 200
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    iput-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 205
    .line 206
    sget v0, Ll/ghc0;->f:I

    .line 207
    .line 208
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    iput-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->U:Z

    .line 213
    .line 214
    sget v0, Ll/ghc0;->g:I

    .line 215
    .line 216
    const v2, -0x11cccd

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->y:I

    .line 224
    .line 225
    sget v0, Ll/ghc0;->h:I

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    sget v3, Ll/aac0;->a:I

    .line 232
    .line 233
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->x:I

    .line 242
    .line 243
    sget v0, Ll/ghc0;->b:I

    .line 244
    .line 245
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    iput-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 250
    .line 251
    sget v0, Ll/ghc0;->i:I

    .line 252
    .line 253
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->A:I

    .line 258
    .line 259
    sget v0, Ll/ghc0;->e:I

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 266
    .line 267
    .line 268
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l()V

    .line 269
    .line 270
    .line 271
    new-instance p2, Landroid/graphics/Paint;

    .line 272
    .line 273
    const/16 v1, 0x45

    .line 274
    .line 275
    invoke-direct {p2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 276
    .line 277
    .line 278
    iput-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 279
    .line 280
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->v:I

    .line 281
    .line 282
    int-to-float v1, v1

    .line 283
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 284
    .line 285
    .line 286
    if-eqz v0, :cond_2

    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-static {p1, v0}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->setTypeface(Landroid/graphics/Typeface;)V

    .line 297
    .line 298
    .line 299
    :cond_2
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k()V

    .line 300
    .line 301
    .line 302
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 303
    .line 304
    .line 305
    new-instance p1, Landroid/widget/Scroller;

    .line 306
    .line 307
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 308
    .line 309
    .line 310
    move-result-object p2

    .line 311
    invoke-direct {p1, p2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 312
    .line 313
    .line 314
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 315
    .line 316
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 325
    .line 326
    .line 327
    move-result p2

    .line 328
    iput p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->I:I

    .line 329
    .line 330
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 331
    .line 332
    .line 333
    move-result p2

    .line 334
    iput p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->J:I

    .line 335
    .line 336
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->S:I

    .line 341
    .line 342
    new-instance p1, Landroid/graphics/Rect;

    .line 343
    .line 344
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 345
    .line 346
    .line 347
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 348
    .line 349
    new-instance p1, Landroid/graphics/Rect;

    .line 350
    .line 351
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 352
    .line 353
    .line 354
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->h:Landroid/graphics/Rect;

    .line 355
    .line 356
    new-instance p1, Landroid/graphics/Rect;

    .line 357
    .line 358
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 359
    .line 360
    .line 361
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->i:Landroid/graphics/Rect;

    .line 362
    .line 363
    new-instance p1, Landroid/graphics/Rect;

    .line 364
    .line 365
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 366
    .line 367
    .line 368
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->j:Landroid/graphics/Rect;

    .line 369
    .line 370
    new-instance p1, Landroid/graphics/Matrix;

    .line 371
    .line 372
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 373
    .line 374
    .line 375
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 376
    .line 377
    new-instance p1, Landroid/graphics/Matrix;

    .line 378
    .line 379
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 380
    .line 381
    .line 382
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l:Landroid/graphics/Matrix;

    .line 383
    .line 384
    return-void
.end method

.method private a()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->j:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iget v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->L:I

    .line 14
    .line 15
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->C:I

    .line 16
    .line 17
    sub-int v4, v3, p0

    .line 18
    .line 19
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    add-int/2addr v3, p0

    .line 22
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private b(I)I
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->C:I

    .line 6
    .line 7
    if-le v0, v1, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 10
    .line 11
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    neg-int p0, p0

    .line 16
    sub-int/2addr p0, p1

    .line 17
    return p0

    .line 18
    :cond_0
    sub-int/2addr p0, p1

    .line 19
    return p0

    .line 20
    :cond_1
    neg-int p0, p1

    .line 21
    return p0
.end method

.method private c()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->A:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->K:I

    .line 10
    .line 11
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->L:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-float/2addr v1, v2

    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    sub-float/2addr v0, v1

    .line 47
    float-to-int v0, v0

    .line 48
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->N:I

    .line 49
    .line 50
    return-void
.end method

.method private d()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 2
    .line 3
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget-boolean v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    neg-int v1, v1

    .line 14
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    mul-int/2addr v1, v2

    .line 23
    add-int/2addr v1, v0

    .line 24
    :goto_0
    iput v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->G:I

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const v0, 0x7fffffff

    .line 31
    .line 32
    .line 33
    :cond_1
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->H:I

    .line 34
    .line 35
    return-void
.end method

.method private e()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->U:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->x:I

    .line 7
    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->L:I

    .line 11
    .line 12
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->C:I

    .line 13
    .line 14
    add-int v3, v1, v2

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->h:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    sub-int v6, v3, v0

    .line 24
    .line 25
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    add-int/2addr v3, v0

    .line 28
    invoke-virtual {v2, v5, v6, v4, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->i:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 34
    .line 35
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    sub-int v4, v1, v0

    .line 38
    .line 39
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    invoke-virtual {v2, v3, v4, p0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private f(I)I
    .locals 2

    .line 1
    int-to-double v0, p1

    .line 2
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->D:I

    .line 11
    .line 12
    int-to-double p0, p0

    .line 13
    mul-double/2addr v0, p0

    .line 14
    double-to-int p0, v0

    .line 15
    return p0
.end method

.method private g()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->s:I

    .line 3
    .line 4
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->T:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    float-to-int v0, v0

    .line 27
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->P:I

    .line 31
    .line 32
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->h(I)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 41
    .line 42
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->P:I

    .line 43
    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    float-to-int v0, v0

    .line 57
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->n:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->n:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    float-to-int v0, v0

    .line 77
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    float-to-int v1, v1

    .line 107
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 108
    .line 109
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    iput v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 123
    .line 124
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 125
    .line 126
    sub-float/2addr v1, v0

    .line 127
    float-to-int v0, v1

    .line 128
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->s:I

    .line 129
    .line 130
    return-void
.end method

.method private h(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private i(III)I
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    return p2

    .line 6
    :cond_0
    const/high16 p0, -0x80000000

    .line 7
    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    return p3
.end method

.method private k()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->A:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 24
    .line 25
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-lt v0, v1, :cond_1

    .line 5
    .line 6
    rem-int/lit8 v2, v0, 0x2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 15
    .line 16
    add-int/2addr v0, v1

    .line 17
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p:I

    .line 18
    .line 19
    div-int/2addr v0, v1

    .line 20
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->q:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string p0, "Wheel\'s visible item count can not be less than 2!"

    .line 24
    .line 25
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public getCurrentItemPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIndicatorSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemSpace()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectedItemTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getVisibleItemCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public j(IZ)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e:Z

    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/widget/Scroller;->isFinished()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->getData()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 23
    .line 24
    sub-int/2addr p1, v1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    div-int/lit8 v2, p2, 0x2

    .line 37
    .line 38
    if-le v1, v2, :cond_2

    .line 39
    .line 40
    if-lez p1, :cond_1

    .line 41
    .line 42
    neg-int p2, p2

    .line 43
    :cond_1
    add-int/2addr p1, p2

    .line 44
    :cond_2
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 45
    .line 46
    invoke-virtual {p2}, Landroid/widget/Scroller;->getCurrY()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    neg-int p1, p1

    .line 51
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 52
    .line 53
    mul-int/2addr p1, v2

    .line 54
    invoke-virtual {p2, v0, v1, v0, p1}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a:Landroid/os/Handler;

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 64
    .line 65
    invoke-virtual {p2}, Landroid/widget/Scroller;->isFinished()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_4

    .line 70
    .line 71
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {p2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    add-int/lit8 p2, p2, -0x1

    .line 83
    .line 84
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 93
    .line 94
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 95
    .line 96
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 97
    .line 98
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 12
    .line 13
    neg-int v0, v0

    .line 14
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 15
    .line 16
    div-int/2addr v0, v1

    .line 17
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->q:I

    .line 18
    .line 19
    sub-int/2addr v0, v1

    .line 20
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 21
    .line 22
    add-int/2addr v2, v0

    .line 23
    neg-int v1, v1

    .line 24
    :goto_0
    iget v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 25
    .line 26
    add-int/2addr v3, v0

    .line 27
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p:I

    .line 28
    .line 29
    add-int/2addr v3, v4

    .line 30
    if-ge v2, v3, :cond_10

    .line 31
    .line 32
    iget-boolean v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    iget-object v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    rem-int v3, v2, v3

    .line 43
    .line 44
    if-gez v3, :cond_1

    .line 45
    .line 46
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    add-int/2addr v3, v4

    .line 53
    :cond_1
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    invoke-direct {p0, v2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->h(I)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_3

    .line 69
    .line 70
    iget-object v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    const-string v3, ""

    .line 82
    .line 83
    :goto_1
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 84
    .line 85
    iget v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->t:I

    .line 86
    .line 87
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 91
    .line 92
    iget v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->v:I

    .line 93
    .line 94
    int-to-float v5, v5

    .line 95
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 96
    .line 97
    .line 98
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 99
    .line 100
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 103
    .line 104
    .line 105
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->N:I

    .line 106
    .line 107
    iget v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 108
    .line 109
    mul-int v6, v1, v5

    .line 110
    .line 111
    add-int/2addr v6, v4

    .line 112
    iget v7, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 113
    .line 114
    rem-int/2addr v7, v5

    .line 115
    add-int/2addr v6, v7

    .line 116
    iget-boolean v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 117
    .line 118
    const/4 v7, -0x1

    .line 119
    const/4 v8, 0x0

    .line 120
    if-eqz v5, :cond_a

    .line 121
    .line 122
    sub-int v5, v4, v6

    .line 123
    .line 124
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    sub-int/2addr v4, v5

    .line 129
    iget-object v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 130
    .line 131
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 132
    .line 133
    sub-int/2addr v4, v5

    .line 134
    int-to-float v4, v4

    .line 135
    const/high16 v9, 0x3f800000    # 1.0f

    .line 136
    .line 137
    mul-float/2addr v4, v9

    .line 138
    iget v10, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->N:I

    .line 139
    .line 140
    sub-int v5, v10, v5

    .line 141
    .line 142
    int-to-float v5, v5

    .line 143
    div-float/2addr v4, v5

    .line 144
    const/4 v5, 0x1

    .line 145
    if-le v6, v10, :cond_4

    .line 146
    .line 147
    move v8, v5

    .line 148
    goto :goto_2

    .line 149
    :cond_4
    if-ge v6, v10, :cond_5

    .line 150
    .line 151
    move v8, v7

    .line 152
    :cond_5
    :goto_2
    sub-float/2addr v9, v4

    .line 153
    neg-float v4, v9

    .line 154
    const/high16 v9, 0x42b40000    # 90.0f

    .line 155
    .line 156
    mul-float/2addr v4, v9

    .line 157
    int-to-float v8, v8

    .line 158
    mul-float/2addr v4, v8

    .line 159
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 160
    .line 161
    cmpg-float v10, v4, v8

    .line 162
    .line 163
    if-gez v10, :cond_6

    .line 164
    .line 165
    move v4, v8

    .line 166
    :cond_6
    cmpl-float v8, v4, v9

    .line 167
    .line 168
    if-lez v8, :cond_7

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_7
    move v9, v4

    .line 172
    :goto_3
    float-to-int v4, v9

    .line 173
    invoke-direct {p0, v4}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->f(I)I

    .line 174
    .line 175
    .line 176
    move-result v8

    .line 177
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->K:I

    .line 178
    .line 179
    iget v9, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->A:I

    .line 180
    .line 181
    if-eq v9, v5, :cond_9

    .line 182
    .line 183
    const/4 v5, 0x2

    .line 184
    if-eq v9, v5, :cond_8

    .line 185
    .line 186
    goto :goto_4

    .line 187
    :cond_8
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 188
    .line 189
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_9
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 193
    .line 194
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 195
    .line 196
    :goto_4
    iget v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->L:I

    .line 197
    .line 198
    sub-int/2addr v5, v8

    .line 199
    iget-object v9, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 200
    .line 201
    neg-int v10, v4

    .line 202
    int-to-float v10, v10

    .line 203
    neg-int v11, v5

    .line 204
    int-to-float v11, v11

    .line 205
    invoke-virtual {v9, v10, v11}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 206
    .line 207
    .line 208
    iget-object v9, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 209
    .line 210
    int-to-float v4, v4

    .line 211
    int-to-float v5, v5

    .line 212
    invoke-virtual {v9, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 213
    .line 214
    .line 215
    iget-object v9, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l:Landroid/graphics/Matrix;

    .line 216
    .line 217
    invoke-virtual {v9, v10, v11}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 218
    .line 219
    .line 220
    iget-object v9, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l:Landroid/graphics/Matrix;

    .line 221
    .line 222
    invoke-virtual {v9, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 223
    .line 224
    .line 225
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 226
    .line 227
    iget-object v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l:Landroid/graphics/Matrix;

    .line 228
    .line 229
    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 230
    .line 231
    .line 232
    :cond_a
    iget-boolean v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 233
    .line 234
    if-eqz v4, :cond_b

    .line 235
    .line 236
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->N:I

    .line 237
    .line 238
    sub-int v6, v4, v8

    .line 239
    .line 240
    :cond_b
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 241
    .line 242
    if-eq v4, v7, :cond_e

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 245
    .line 246
    .line 247
    iget-boolean v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 248
    .line 249
    if-eqz v4, :cond_c

    .line 250
    .line 251
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 252
    .line 253
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 254
    .line 255
    .line 256
    :cond_c
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->j:Landroid/graphics/Rect;

    .line 257
    .line 258
    sget-object v5, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 259
    .line 260
    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 261
    .line 262
    .line 263
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 264
    .line 265
    int-to-float v4, v4

    .line 266
    int-to-float v5, v6

    .line 267
    iget-object v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 268
    .line 269
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 273
    .line 274
    .line 275
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 276
    .line 277
    iget v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 278
    .line 279
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 280
    .line 281
    .line 282
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 283
    .line 284
    iget v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->w:I

    .line 285
    .line 286
    int-to-float v6, v6

    .line 287
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 291
    .line 292
    .line 293
    iget-boolean v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 294
    .line 295
    if-eqz v4, :cond_d

    .line 296
    .line 297
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 298
    .line 299
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 300
    .line 301
    .line 302
    :cond_d
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->j:Landroid/graphics/Rect;

    .line 303
    .line 304
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 305
    .line 306
    .line 307
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 308
    .line 309
    int-to-float v4, v4

    .line 310
    iget-object v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 311
    .line 312
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 316
    .line 317
    .line 318
    goto :goto_5

    .line 319
    :cond_e
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 320
    .line 321
    .line 322
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 323
    .line 324
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 325
    .line 326
    .line 327
    iget-boolean v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 328
    .line 329
    if-eqz v4, :cond_f

    .line 330
    .line 331
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k:Landroid/graphics/Matrix;

    .line 332
    .line 333
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 334
    .line 335
    .line 336
    :cond_f
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->M:I

    .line 337
    .line 338
    int-to-float v4, v4

    .line 339
    int-to-float v5, v6

    .line 340
    iget-object v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 341
    .line 342
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 346
    .line 347
    .line 348
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 349
    .line 350
    add-int/lit8 v1, v1, 0x1

    .line 351
    .line 352
    goto/16 :goto_0

    .line 353
    .line 354
    :cond_10
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->U:Z

    .line 355
    .line 356
    if-eqz v0, :cond_11

    .line 357
    .line 358
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 359
    .line 360
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->y:I

    .line 361
    .line 362
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 363
    .line 364
    .line 365
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 366
    .line 367
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 370
    .line 371
    .line 372
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->h:Landroid/graphics/Rect;

    .line 373
    .line 374
    iget-object v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 375
    .line 376
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 377
    .line 378
    .line 379
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->i:Landroid/graphics/Rect;

    .line 380
    .line 381
    iget-object p0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 382
    .line 383
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 384
    .line 385
    .line 386
    :cond_11
    :goto_6
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->r:I

    .line 18
    .line 19
    iget v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->s:I

    .line 20
    .line 21
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 22
    .line 23
    mul-int/2addr v3, v4

    .line 24
    iget v5, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->z:I

    .line 25
    .line 26
    add-int/lit8 v4, v4, -0x1

    .line 27
    .line 28
    mul-int/2addr v5, v4

    .line 29
    add-int/2addr v3, v5

    .line 30
    iget-boolean v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    mul-int/lit8 v3, v3, 0x2

    .line 35
    .line 36
    int-to-double v3, v3

    .line 37
    const-wide v5, 0x400921fb54442d18L    # Math.PI

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    div-double/2addr v3, v5

    .line 43
    double-to-int v3, v3

    .line 44
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    add-int/2addr v4, v5

    .line 53
    add-int/2addr v2, v4

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    add-int/2addr v4, v5

    .line 63
    add-int/2addr v3, v4

    .line 64
    invoke-direct {p0, v0, p1, v2}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->i(III)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-direct {p0, v1, p2, v3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->i(III)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int/2addr p4, v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v0, v1

    .line 29
    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->K:I

    .line 39
    .line 40
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->L:I

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    div-int/lit8 p1, p1, 0x2

    .line 58
    .line 59
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->D:I

    .line 60
    .line 61
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g:Landroid/graphics/Rect;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget p2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 68
    .line 69
    div-int/2addr p1, p2

    .line 70
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 71
    .line 72
    div-int/lit8 p1, p1, 0x2

    .line 73
    .line 74
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->C:I

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d()V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e()V

    .line 80
    .line 81
    .line 82
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v0, v1, :cond_5

    .line 11
    .line 12
    const/4 v4, 0x2

    .line 13
    if-eq v0, v4, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq v0, p1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 34
    .line 35
    if-eqz p1, :cond_f

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_2
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->R:I

    .line 45
    .line 46
    int-to-float v0, v0

    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-float/2addr v0, v2

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->S:I

    .line 57
    .line 58
    int-to-float v2, v2

    .line 59
    cmpg-float v0, v0, v2

    .line 60
    .line 61
    if-gez v0, :cond_3

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k0:Z

    .line 64
    .line 65
    goto/16 :goto_3

    .line 66
    .line 67
    :cond_3
    iput-boolean v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k0:Z

    .line 68
    .line 69
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->Q:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    sub-float/2addr v0, v2

    .line 82
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/high16 v3, 0x3f800000    # 1.0f

    .line 87
    .line 88
    cmpg-float v2, v2, v3

    .line 89
    .line 90
    if-gez v2, :cond_4

    .line 91
    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :cond_4
    iget v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    add-float/2addr v2, v0

    .line 98
    float-to-int v0, v2

    .line 99
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    float-to-int p1, p1

    .line 106
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->Q:I

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 109
    .line 110
    .line 111
    goto/16 :goto_3

    .line 112
    .line 113
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k0:Z

    .line 127
    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p0:Z

    .line 131
    .line 132
    if-nez v0, :cond_7

    .line 133
    .line 134
    goto/16 :goto_3

    .line 135
    .line 136
    :cond_7
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 142
    .line 143
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->J:I

    .line 144
    .line 145
    int-to-float v0, v0

    .line 146
    const/16 v4, 0x3e8

    .line 147
    .line 148
    invoke-virtual {p1, v4, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 149
    .line 150
    .line 151
    iput-boolean v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p0:Z

    .line 152
    .line 153
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    float-to-int v8, p1

    .line 160
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->I:I

    .line 165
    .line 166
    iget-object v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 167
    .line 168
    if-le p1, v0, :cond_8

    .line 169
    .line 170
    iget v6, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 171
    .line 172
    iget v11, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->G:I

    .line 173
    .line 174
    iget v12, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->H:I

    .line 175
    .line 176
    const/4 v5, 0x0

    .line 177
    const/4 v7, 0x0

    .line 178
    const/4 v9, 0x0

    .line 179
    const/4 v10, 0x0

    .line 180
    invoke-virtual/range {v4 .. v12}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 184
    .line 185
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    iget-object v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 190
    .line 191
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    iget v4, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 196
    .line 197
    rem-int/2addr v3, v4

    .line 198
    invoke-direct {p0, v3}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b(I)I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    add-int/2addr v0, v3

    .line 203
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_8
    iget p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 208
    .line 209
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 210
    .line 211
    rem-int v0, p1, v0

    .line 212
    .line 213
    invoke-direct {p0, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b(I)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    invoke-virtual {v4, v3, p1, v3, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 218
    .line 219
    .line 220
    :goto_0
    iget-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 221
    .line 222
    if-nez p1, :cond_a

    .line 223
    .line 224
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 225
    .line 226
    invoke-virtual {p1}, Landroid/widget/Scroller;->getFinalY()I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->H:I

    .line 231
    .line 232
    iget-object v3, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 233
    .line 234
    if-le p1, v0, :cond_9

    .line 235
    .line 236
    invoke-virtual {v3, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_9
    invoke-virtual {v3}, Landroid/widget/Scroller;->getFinalY()I

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->G:I

    .line 245
    .line 246
    if-ge p1, v0, :cond_a

    .line 247
    .line 248
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 249
    .line 250
    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->setFinalY(I)V

    .line 251
    .line 252
    .line 253
    :cond_a
    :goto_1
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a:Landroid/os/Handler;

    .line 254
    .line 255
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 259
    .line 260
    if-eqz p1, :cond_f

    .line 261
    .line 262
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 263
    .line 264
    .line 265
    iput-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_b
    iput-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e:Z

    .line 269
    .line 270
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    if-eqz v0, :cond_c

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 281
    .line 282
    .line 283
    :cond_c
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 284
    .line 285
    if-nez v0, :cond_d

    .line 286
    .line 287
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iput-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_d
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 295
    .line 296
    .line 297
    :goto_2
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d:Landroid/view/VelocityTracker;

    .line 298
    .line 299
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 303
    .line 304
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_e

    .line 309
    .line 310
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 311
    .line 312
    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 313
    .line 314
    .line 315
    iput-boolean v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p0:Z

    .line 316
    .line 317
    :cond_e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    float-to-int p1, p1

    .line 322
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->Q:I

    .line 323
    .line 324
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->R:I

    .line 325
    .line 326
    :cond_f
    :goto_3
    return v1
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->p0:Z

    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->B:I

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 30
    .line 31
    neg-int v1, v1

    .line 32
    div-int/2addr v1, v0

    .line 33
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 34
    .line 35
    add-int/2addr v1, v0

    .line 36
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    rem-int/2addr v1, v0

    .line 43
    if-gez v1, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr v1, v0

    .line 52
    :cond_2
    iput v1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->f:Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e:Z

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v0, p0, v2, v1}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;->a(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;Ljava/lang/Object;I)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c:Landroid/widget/Scroller;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a:Landroid/os/Handler;

    .line 91
    .line 92
    const-wide/16 v1, 0x10

    .line 93
    .line 94
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    return-void
.end method

.method public setCurved(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->W:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCyclic(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->V:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->m:Ljava/util/List;

    .line 4
    .line 5
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    if-gt v0, v1, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    if-le v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 27
    .line 28
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    add-int/lit8 p1, p1, -0x1

    .line 36
    .line 37
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->F:I

    .line 38
    .line 39
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->E:I

    .line 40
    .line 41
    :goto_1
    const/4 p1, 0x0

    .line 42
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->O:I

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->d()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    const-string p0, "WheelPicker\'s data can not be null!"

    .line 58
    .line 59
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public setIndicator(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->U:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->x:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setItemAlign(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->A:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->k()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->c()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setItemSpace(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->z:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setItemTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->t:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setItemTextSize(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->v:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setMaximumWidthText(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Maximum width text can not be null!"

    .line 16
    .line 17
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setOnItemSelectedListener(Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->f:Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker$a;

    .line 2
    .line 3
    return-void
.end method

.method public setSameWidth(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->T:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setSelectedItemPosition(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->j(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setSelectedItemTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->u:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->a()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->g()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setVisibleItemCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->o:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/wheelpiker/WheelPicker;->l()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
