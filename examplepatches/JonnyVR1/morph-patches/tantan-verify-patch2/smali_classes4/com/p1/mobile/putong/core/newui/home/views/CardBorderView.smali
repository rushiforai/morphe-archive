.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public A:[I

.field public B:F

.field public final C:Landroid/graphics/Paint;

.field public final D:Landroid/graphics/Path;

.field public final E:[I

.field public final F:[F

.field public final G:I

.field public final H:I

.field public I:Z

.field public J:Landroid/graphics/DrawFilter;

.field public final K:Landroid/graphics/Paint;

.field public final a:[I

.field public final b:[I

.field public final c:[I

.field public final d:[F

.field public final e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroid/graphics/Path;

.field public final m:Landroid/graphics/RectF;

.field public final n:Landroid/graphics/RectF;

.field public final o:Landroid/graphics/PorterDuffXfermode;

.field public p:I

.field public q:I

.field public r:Landroid/graphics/Bitmap;

.field public s:[I

.field public final t:I

.field public final u:[I

.field public final v:[I

.field public final w:[F

.field public final x:Landroid/graphics/Paint;

.field public final y:Landroid/graphics/Path;

.field public final z:Landroid/graphics/PorterDuffXfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 368
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 367
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#ffe78c"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string p1, "#f8c045"

    .line 11
    .line 12
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string p2, "#ffe993"

    .line 17
    .line 18
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const-string p1, "#ffe686"

    .line 27
    .line 28
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    const-string p1, "#fbc44f"

    .line 33
    .line 34
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    filled-new-array/range {v0 .. v5}, [I

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->a:[I

    .line 43
    .line 44
    const-string p2, "#e4f0ff"

    .line 45
    .line 46
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const-string p2, "#8b9fbb"

    .line 51
    .line 52
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const-string p2, "#cdd9e6"

    .line 57
    .line 58
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    const-string p3, "#93a0b4"

    .line 63
    .line 64
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    filled-new-array/range {v0 .. v5}, [I

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->b:[I

    .line 81
    .line 82
    const-string p2, "#211d18"

    .line 83
    .line 84
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    filled-new-array/range {v0 .. v5}, [I

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->c:[I

    .line 113
    .line 114
    const/4 p2, 0x6

    .line 115
    new-array p2, p2, [F

    .line 116
    .line 117
    fill-array-data p2, :array_0

    .line 118
    .line 119
    .line 120
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->d:[F

    .line 121
    .line 122
    sget p2, Ll/qa00;->o:I

    .line 123
    .line 124
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->e:I

    .line 125
    .line 126
    sget p3, Ll/qa00;->m:I

    .line 127
    .line 128
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 129
    .line 130
    sget v0, Ll/qa00;->I:I

    .line 131
    .line 132
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g:I

    .line 133
    .line 134
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->h:I

    .line 135
    .line 136
    sget p2, Ll/qa00;->g:I

    .line 137
    .line 138
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->i:I

    .line 139
    .line 140
    const/high16 p2, 0x40e00000    # 7.0f

    .line 141
    .line 142
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 147
    .line 148
    new-instance p2, Landroid/graphics/Paint;

    .line 149
    .line 150
    const/4 v0, 0x1

    .line 151
    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 152
    .line 153
    .line 154
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 155
    .line 156
    new-instance p2, Landroid/graphics/Path;

    .line 157
    .line 158
    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 162
    .line 163
    new-instance p2, Landroid/graphics/RectF;

    .line 164
    .line 165
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 166
    .line 167
    .line 168
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->m:Landroid/graphics/RectF;

    .line 169
    .line 170
    new-instance p2, Landroid/graphics/RectF;

    .line 171
    .line 172
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 173
    .line 174
    .line 175
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->n:Landroid/graphics/RectF;

    .line 176
    .line 177
    new-instance p2, Landroid/graphics/PorterDuffXfermode;

    .line 178
    .line 179
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 180
    .line 181
    invoke-direct {p2, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 182
    .line 183
    .line 184
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->o:Landroid/graphics/PorterDuffXfermode;

    .line 185
    .line 186
    const/4 p2, 0x0

    .line 187
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->r:Landroid/graphics/Bitmap;

    .line 188
    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->s:[I

    .line 190
    .line 191
    sget p1, Ll/qa00;->O:I

    .line 192
    .line 193
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->t:I

    .line 194
    .line 195
    const-string p1, "#00FFFFFF"

    .line 196
    .line 197
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result p2

    .line 201
    const-string v1, "#CCFFF473"

    .line 202
    .line 203
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    const-string v3, "#E5FFFCB1"

    .line 208
    .line 209
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    filled-new-array {p2, v2, v3, v1, v4}, [I

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->u:[I

    .line 226
    .line 227
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    const-string v2, "#CCDBEDFF"

    .line 232
    .line 233
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    const-string v4, "#E5E9F4FF"

    .line 238
    .line 239
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    filled-new-array {v1, v3, v4, v2, p1}, [I

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->v:[I

    .line 256
    .line 257
    const/4 p1, 0x5

    .line 258
    new-array p1, p1, [F

    .line 259
    .line 260
    fill-array-data p1, :array_1

    .line 261
    .line 262
    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->w:[F

    .line 264
    .line 265
    new-instance p1, Landroid/graphics/Paint;

    .line 266
    .line 267
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 268
    .line 269
    .line 270
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 271
    .line 272
    new-instance p1, Landroid/graphics/Path;

    .line 273
    .line 274
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 275
    .line 276
    .line 277
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 278
    .line 279
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 280
    .line 281
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 282
    .line 283
    invoke-direct {p1, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 284
    .line 285
    .line 286
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->z:Landroid/graphics/PorterDuffXfermode;

    .line 287
    .line 288
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->A:[I

    .line 289
    .line 290
    const/4 p1, 0x0

    .line 291
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->B:F

    .line 292
    .line 293
    new-instance p1, Landroid/graphics/Paint;

    .line 294
    .line 295
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 296
    .line 297
    .line 298
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 299
    .line 300
    new-instance p1, Landroid/graphics/Path;

    .line 301
    .line 302
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 303
    .line 304
    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 306
    .line 307
    const-string p1, "#F2CF94"

    .line 308
    .line 309
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    const-string p2, "#E2C088"

    .line 314
    .line 315
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    const-string v1, "#FCDD99"

    .line 320
    .line 321
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    filled-new-array {p1, p2, v1}, [I

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->E:[I

    .line 330
    .line 331
    const/4 p1, 0x3

    .line 332
    new-array p2, p1, [F

    .line 333
    .line 334
    fill-array-data p2, :array_2

    .line 335
    .line 336
    .line 337
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->F:[F

    .line 338
    .line 339
    sget p2, Ll/qa00;->c:I

    .line 340
    .line 341
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->G:I

    .line 342
    .line 343
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 344
    .line 345
    const/4 p2, 0x0

    .line 346
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->I:Z

    .line 347
    .line 348
    new-instance p3, Landroid/graphics/PaintFlagsDrawFilter;

    .line 349
    .line 350
    invoke-direct {p3, p2, p1}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 351
    .line 352
    .line 353
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->J:Landroid/graphics/DrawFilter;

    .line 354
    .line 355
    new-instance p1, Landroid/graphics/Paint;

    .line 356
    .line 357
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 358
    .line 359
    .line 360
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->K:Landroid/graphics/Paint;

    .line 361
    .line 362
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->e()V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    nop

    .line 367
    :array_0
    .array-data 4
        0x0
        0x3e6147ae    # 0.22f
        0x3ed1eb85    # 0.41f
        0x3f147ae1    # 0.58f
        0x3f4f5c29    # 0.81f
        0x3f800000    # 1.0f
    .end array-data

    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    :array_1
    .array-data 4
        0x0
        0x3e800000    # 0.25f
        0x3f000000    # 0.5f
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data

    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    :array_2
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    sget v0, Ll/qa00;->j:I

    .line 2
    .line 3
    neg-int v1, v0

    .line 4
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final b()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 4
    .line 5
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 6
    .line 7
    sub-int/2addr v1, v2

    .line 8
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 11
    .line 12
    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 14
    .line 15
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 16
    .line 17
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 18
    .line 19
    add-int/2addr v4, v3

    .line 20
    int-to-float v4, v4

    .line 21
    int-to-float v3, v3

    .line 22
    invoke-virtual {v2, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 23
    .line 24
    .line 25
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g:I

    .line 26
    .line 27
    sub-int v2, v1, v2

    .line 28
    .line 29
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 30
    .line 31
    int-to-float v4, v2

    .line 32
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 33
    .line 34
    int-to-float v5, v5

    .line 35
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 36
    .line 37
    .line 38
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 39
    .line 40
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->g:I

    .line 41
    .line 42
    sub-int/2addr v2, v3

    .line 43
    int-to-float v7, v2

    .line 44
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 45
    .line 46
    int-to-float v8, v2

    .line 47
    int-to-float v9, v1

    .line 48
    mul-int/lit8 v3, v3, 0x2

    .line 49
    .line 50
    add-int/2addr v3, v2

    .line 51
    int-to-float v10, v3

    .line 52
    const/high16 v12, 0x42b40000    # 90.0f

    .line 53
    .line 54
    const/4 v13, 0x0

    .line 55
    const/high16 v11, -0x3d4c0000    # -90.0f

    .line 56
    .line 57
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 58
    .line 59
    .line 60
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 61
    .line 62
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 63
    .line 64
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 65
    .line 66
    sub-int/2addr v3, v4

    .line 67
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 68
    .line 69
    sub-int/2addr v3, v4

    .line 70
    int-to-float v3, v3

    .line 71
    invoke-virtual {v2, v9, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 72
    .line 73
    .line 74
    move v12, v9

    .line 75
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 76
    .line 77
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 78
    .line 79
    mul-int/lit8 v3, v2, 0x2

    .line 80
    .line 81
    sub-int/2addr v1, v3

    .line 82
    int-to-float v10, v1

    .line 83
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 84
    .line 85
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 86
    .line 87
    sub-int v4, v1, v3

    .line 88
    .line 89
    mul-int/lit8 v2, v2, 0x2

    .line 90
    .line 91
    sub-int/2addr v4, v2

    .line 92
    int-to-float v11, v4

    .line 93
    sub-int/2addr v1, v3

    .line 94
    int-to-float v13, v1

    .line 95
    const/high16 v15, 0x42b40000    # 90.0f

    .line 96
    .line 97
    const/16 v16, 0x0

    .line 98
    .line 99
    const/4 v14, 0x0

    .line 100
    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 101
    .line 102
    .line 103
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 104
    .line 105
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 106
    .line 107
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 108
    .line 109
    add-int/2addr v3, v2

    .line 110
    int-to-float v3, v3

    .line 111
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 112
    .line 113
    sub-int/2addr v4, v2

    .line 114
    int-to-float v2, v4

    .line 115
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 116
    .line 117
    .line 118
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 119
    .line 120
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 121
    .line 122
    int-to-float v5, v1

    .line 123
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 124
    .line 125
    sub-int v3, v2, v1

    .line 126
    .line 127
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 128
    .line 129
    mul-int/lit8 v7, v6, 0x2

    .line 130
    .line 131
    sub-int/2addr v3, v7

    .line 132
    int-to-float v3, v3

    .line 133
    mul-int/lit8 v6, v6, 0x2

    .line 134
    .line 135
    add-int/2addr v6, v1

    .line 136
    int-to-float v7, v6

    .line 137
    sub-int/2addr v2, v1

    .line 138
    int-to-float v8, v2

    .line 139
    const/high16 v10, 0x42b40000    # 90.0f

    .line 140
    .line 141
    const/4 v11, 0x0

    .line 142
    const/high16 v9, 0x42b40000    # 90.0f

    .line 143
    .line 144
    move v6, v3

    .line 145
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 146
    .line 147
    .line 148
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 149
    .line 150
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 151
    .line 152
    int-to-float v3, v2

    .line 153
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 154
    .line 155
    add-int/2addr v2, v4

    .line 156
    int-to-float v2, v2

    .line 157
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 158
    .line 159
    .line 160
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 161
    .line 162
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 163
    .line 164
    int-to-float v5, v1

    .line 165
    int-to-float v6, v1

    .line 166
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f:I

    .line 167
    .line 168
    mul-int/lit8 v3, v2, 0x2

    .line 169
    .line 170
    add-int/2addr v3, v1

    .line 171
    int-to-float v7, v3

    .line 172
    mul-int/lit8 v2, v2, 0x2

    .line 173
    .line 174
    add-int/2addr v1, v2

    .line 175
    int-to-float v8, v1

    .line 176
    const/high16 v9, 0x43340000    # 180.0f

    .line 177
    .line 178
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 179
    .line 180
    .line 181
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public final c()V
    .locals 15

    .line 1
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 4
    .line 5
    int-to-float v4, v1

    .line 6
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->s:[I

    .line 7
    .line 8
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->d:[F

    .line 9
    .line 10
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 21
    .line 22
    .line 23
    move-object v14, v7

    .line 24
    new-instance v7, Landroid/graphics/LinearGradient;

    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 27
    .line 28
    int-to-float v9, v0

    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 30
    .line 31
    int-to-float v10, v0

    .line 32
    iget-object v12, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->E:[I

    .line 33
    .line 34
    iget-object v13, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->F:[F

    .line 35
    .line 36
    const/4 v8, 0x0

    .line 37
    const/4 v11, 0x0

    .line 38
    invoke-direct/range {v7 .. v14}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p0, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final d()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->n:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->h:I

    .line 6
    .line 7
    sub-int v3, v1, v2

    .line 8
    .line 9
    int-to-float v3, v3

    .line 10
    int-to-float v1, v1

    .line 11
    int-to-float v2, v2

    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->n:Landroid/graphics/RectF;

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->i:I

    .line 19
    .line 20
    neg-int v1, p0

    .line 21
    int-to-float v1, v1

    .line 22
    int-to-float p0, p0

    .line 23
    invoke-virtual {v0, v1, p0}, Landroid/graphics/RectF;->offset(FF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->K:Landroid/graphics/Paint;

    .line 7
    .line 8
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 14
    .line 15
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->C:Landroid/graphics/Paint;

    .line 31
    .line 32
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->G:I

    .line 33
    .line 34
    int-to-float p0, p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 2
    .line 3
    if-lez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->d()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->c()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->b()V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final g(I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->j:I

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 8
    .line 9
    sub-int/2addr v2, v1

    .line 10
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 11
    .line 12
    sub-int/2addr v3, v1

    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 19
    .line 20
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 21
    .line 22
    add-int/2addr v5, v1

    .line 23
    int-to-float v5, v5

    .line 24
    int-to-float v7, v1

    .line 25
    invoke-virtual {v4, v5, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 26
    .line 27
    .line 28
    sget v4, Ll/qa00;->G:I

    .line 29
    .line 30
    add-int v4, v4, p1

    .line 31
    .line 32
    sub-int v5, v2, v4

    .line 33
    .line 34
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 35
    .line 36
    int-to-float v8, v5

    .line 37
    invoke-virtual {v6, v8, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 38
    .line 39
    .line 40
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 41
    .line 42
    sub-int/2addr v5, v4

    .line 43
    int-to-float v5, v5

    .line 44
    int-to-float v9, v2

    .line 45
    mul-int/lit8 v4, v4, 0x2

    .line 46
    .line 47
    add-int/2addr v4, v1

    .line 48
    int-to-float v10, v4

    .line 49
    const/high16 v12, 0x42b40000    # 90.0f

    .line 50
    .line 51
    const/4 v13, 0x0

    .line 52
    const/high16 v11, -0x3d4c0000    # -90.0f

    .line 53
    .line 54
    move v8, v7

    .line 55
    move v7, v5

    .line 56
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 57
    .line 58
    .line 59
    move v7, v8

    .line 60
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 61
    .line 62
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 63
    .line 64
    sub-int v5, v3, v5

    .line 65
    .line 66
    int-to-float v5, v5

    .line 67
    invoke-virtual {v4, v9, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 68
    .line 69
    .line 70
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 71
    .line 72
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 73
    .line 74
    mul-int/lit8 v5, v4, 0x2

    .line 75
    .line 76
    sub-int/2addr v2, v5

    .line 77
    int-to-float v2, v2

    .line 78
    mul-int/lit8 v4, v4, 0x2

    .line 79
    .line 80
    sub-int v4, v3, v4

    .line 81
    .line 82
    int-to-float v10, v4

    .line 83
    int-to-float v12, v3

    .line 84
    const/high16 v14, 0x42b40000    # 90.0f

    .line 85
    .line 86
    const/4 v15, 0x0

    .line 87
    const/4 v13, 0x0

    .line 88
    move v11, v9

    .line 89
    move v9, v2

    .line 90
    invoke-virtual/range {v8 .. v15}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 91
    .line 92
    .line 93
    move v10, v12

    .line 94
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 95
    .line 96
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 97
    .line 98
    add-int/2addr v4, v1

    .line 99
    int-to-float v4, v4

    .line 100
    invoke-virtual {v2, v4, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 101
    .line 102
    .line 103
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 104
    .line 105
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 106
    .line 107
    mul-int/lit8 v4, v2, 0x2

    .line 108
    .line 109
    sub-int/2addr v3, v4

    .line 110
    int-to-float v8, v3

    .line 111
    mul-int/lit8 v2, v2, 0x2

    .line 112
    .line 113
    add-int/2addr v2, v1

    .line 114
    int-to-float v9, v2

    .line 115
    const/high16 v12, 0x42b40000    # 90.0f

    .line 116
    .line 117
    const/4 v13, 0x0

    .line 118
    const/high16 v11, 0x42b40000    # 90.0f

    .line 119
    .line 120
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 121
    .line 122
    .line 123
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 124
    .line 125
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 126
    .line 127
    add-int/2addr v3, v1

    .line 128
    int-to-float v3, v3

    .line 129
    invoke-virtual {v2, v7, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 130
    .line 131
    .line 132
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 133
    .line 134
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->H:I

    .line 135
    .line 136
    mul-int/lit8 v3, v2, 0x2

    .line 137
    .line 138
    add-int/2addr v3, v1

    .line 139
    int-to-float v9, v3

    .line 140
    mul-int/lit8 v2, v2, 0x2

    .line 141
    .line 142
    add-int/2addr v1, v2

    .line 143
    int-to-float v10, v1

    .line 144
    const/high16 v11, 0x43340000    # 180.0f

    .line 145
    .line 146
    move v8, v7

    .line 147
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 148
    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->D:Landroid/graphics/Path;

    .line 151
    .line 152
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public final h(F)V
    .locals 13

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 2
    .line 3
    if-lez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->t:I

    .line 11
    .line 12
    int-to-double v0, v0

    .line 13
    const-wide v2, 0x3fd0c15240000000L    # 0.2617993950843811

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    div-double/2addr v0, v4

    .line 23
    double-to-float v0, v0

    .line 24
    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 29
    .line 30
    int-to-double v6, v1

    .line 31
    mul-double/2addr v4, v6

    .line 32
    double-to-float v1, v4

    .line 33
    add-float/2addr v1, v0

    .line 34
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 35
    .line 36
    int-to-float v4, v4

    .line 37
    add-float/2addr v4, v1

    .line 38
    mul-float/2addr v4, p1

    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 42
    .line 43
    .line 44
    neg-float p1, v1

    .line 45
    add-float v6, p1, v4

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {p1, v6, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 54
    .line 55
    add-float v5, v6, v0

    .line 56
    .line 57
    invoke-virtual {p1, v5, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    invoke-virtual {p1, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 69
    .line 70
    neg-float v0, v0

    .line 71
    add-float/2addr v0, v4

    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 73
    .line 74
    int-to-float v1, v1

    .line 75
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 81
    .line 82
    .line 83
    float-to-double v0, v6

    .line 84
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->t:I

    .line 85
    .line 86
    int-to-double v4, p1

    .line 87
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 88
    .line 89
    .line 90
    move-result-wide v7

    .line 91
    mul-double/2addr v4, v7

    .line 92
    add-double/2addr v0, v4

    .line 93
    double-to-float v8, v0

    .line 94
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->t:I

    .line 95
    .line 96
    neg-int p1, p1

    .line 97
    int-to-double v0, p1

    .line 98
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    mul-double/2addr v0, v2

    .line 103
    double-to-float v9, v0

    .line 104
    new-instance v5, Landroid/graphics/LinearGradient;

    .line 105
    .line 106
    iget-object v10, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->A:[I

    .line 107
    .line 108
    iget-object v11, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->w:[F

    .line 109
    .line 110
    sget-object v12, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 111
    .line 112
    const/4 v7, 0x0

    .line 113
    invoke-direct/range {v5 .. v12}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-virtual {p0, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 119
    .line 120
    .line 121
    :cond_1
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->J:Landroid/graphics/DrawFilter;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->m:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->m:Landroid/graphics/RectF;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->e:I

    .line 35
    .line 36
    int-to-float v2, v1

    .line 37
    int-to-float v1, v1

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->o:Landroid/graphics/PorterDuffXfermode;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->l:Landroid/graphics/Path;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->k:Landroid/graphics/Paint;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->I:Z

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->a(Landroid/graphics/Canvas;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->z:Landroid/graphics/PorterDuffXfermode;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 75
    .line 76
    .line 77
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->B:F

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->h(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->y:Landroid/graphics/Path;

    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->x:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->r:Landroid/graphics/Bitmap;

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->n:Landroid/graphics/RectF;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->K:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 15
    .line 16
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->p:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->q:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBorderView;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
