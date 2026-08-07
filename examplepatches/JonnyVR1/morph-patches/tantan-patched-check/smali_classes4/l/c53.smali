.class public Ll/c53;
.super Ll/ho0$a;
.source "SourceFile"


# static fields
.field private static k:Landroid/graphics/Rect;

.field private static l:Landroid/graphics/RectF;


# instance fields
.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;

.field public h:Ll/ho0;

.field public i:Ljava/lang/Integer;

.field public j:Ll/p60;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c53;->k:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/c53;->l:Landroid/graphics/RectF;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/p60;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ho0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/c53;->f:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/c53;->g:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/c53;->h:Ll/ho0;

    .line 15
    .line 16
    iput-object v0, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 17
    .line 18
    iput-object p1, p0, Ll/c53;->j:Ll/p60;

    .line 19
    .line 20
    return-void
.end method

.method private f(Ll/g1g0;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/c53;->j:Ll/p60;

    .line 2
    .line 3
    iget p0, p0, Ll/p60;->h:I

    .line 4
    .line 5
    const/16 v0, 0xff

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 10
    .line 11
    iget v1, p1, Ll/cce;->f:I

    .line 12
    .line 13
    mul-int/2addr v1, p0

    .line 14
    div-int/2addr v1, v0

    .line 15
    iput v1, p1, Ll/cce;->f:I

    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public d()Ll/ho0;
    .locals 5

    .line 1
    new-instance v0, Ll/ho0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ho0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Ll/ho0;->d:Ll/drf0;

    .line 7
    .line 8
    iget-object v2, p0, Ll/c53;->f:Ljava/util/List;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    const/high16 v4, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v2, v4

    .line 25
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, v1, Ll/drf0;->a:Ljava/lang/Object;

    .line 30
    .line 31
    iget-object v1, v0, Ll/ho0;->d:Ll/drf0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/c53;->f:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Landroid/graphics/Rect;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-float p0, p0

    .line 46
    div-float/2addr p0, v4

    .line 47
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iput-object p0, v1, Ll/drf0;->b:Ljava/lang/Object;

    .line 52
    .line 53
    return-object v0
.end method

.method public e(Ll/g1g0;Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/ho0$a;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/sunshine/engine/base/a;->e:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object v2, p0, Ll/c53;->f:Ljava/util/List;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/graphics/Rect;

    .line 20
    .line 21
    iget-object v3, p0, Ll/c53;->g:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/sunshine/engine/base/a;->u:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/graphics/Bitmap;

    .line 33
    .line 34
    iget-object v2, p1, Lcom/sunshine/engine/base/a;->w:Ljava/util/Map;

    .line 35
    .line 36
    iget-object v3, p0, Ll/c53;->g:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/sunshine/engine/base/r$a;

    .line 43
    .line 44
    move-object v10, v4

    .line 45
    move-object v4, v2

    .line 46
    move-object v2, v10

    .line 47
    :cond_0
    if-nez v0, :cond_1

    .line 48
    .line 49
    if-nez v4, :cond_1

    .line 50
    .line 51
    goto/16 :goto_2

    .line 52
    .line 53
    :cond_1
    iget-boolean v3, p1, Ll/g1g0;->B:Z

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    iget-object v3, p0, Ll/c53;->h:Ll/ho0;

    .line 58
    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/sunshine/engine/base/a;->f()F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {p0, v3}, Ll/ho0$a;->a(F)Ll/ho0;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    :goto_0
    if-eqz v3, :cond_8

    .line 71
    .line 72
    iget-object v5, v3, Ll/ho0;->a:Ll/tfe;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/sunshine/engine/base/a;->f()F

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    invoke-virtual {v5, v6}, Ll/tfe;->b(F)F

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-virtual {v3, v5, p1}, Ll/ho0;->a(FLcom/sunshine/engine/base/a;)Z

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    if-eqz v6, :cond_8

    .line 87
    .line 88
    invoke-direct {p0, p1}, Ll/c53;->f(Ll/g1g0;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, p1}, Ll/ho0;->b(Lcom/sunshine/engine/base/a;)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 95
    .line 96
    iget-object v6, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 97
    .line 98
    iget-object v6, v6, Ll/cce;->a:Landroid/graphics/RectF;

    .line 99
    .line 100
    invoke-virtual {v3, v6}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Lcom/sunshine/engine/base/a;->g(Landroid/graphics/Matrix;)V

    .line 106
    .line 107
    .line 108
    const/4 v3, 0x1

    .line 109
    iput-boolean v3, p0, Ll/mrf0;->a:Z

    .line 110
    .line 111
    iget-object v6, p0, Ll/c53;->f:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-le v6, v3, :cond_3

    .line 118
    .line 119
    iget-object v2, p0, Ll/c53;->f:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    sub-int/2addr v6, v3

    .line 126
    int-to-float v6, v6

    .line 127
    mul-float/2addr v6, v5

    .line 128
    float-to-int v6, v6

    .line 129
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Landroid/graphics/Rect;

    .line 134
    .line 135
    :cond_3
    iget-object v6, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 136
    .line 137
    if-nez v6, :cond_5

    .line 138
    .line 139
    if-nez v4, :cond_4

    .line 140
    .line 141
    iget-object p0, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 142
    .line 143
    invoke-static {p2, v0, v2, p0}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_4
    invoke-static {p2, v4, v5, p1}, Lcom/sunshine/engine/base/r;->b(Landroid/graphics/Canvas;Lcom/sunshine/engine/base/r$a;FLcom/sunshine/engine/base/a;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_5
    if-eqz v0, :cond_8

    .line 152
    .line 153
    sget-object v4, Ll/c53;->k:Landroid/graphics/Rect;

    .line 154
    .line 155
    invoke-virtual {v4, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 156
    .line 157
    .line 158
    sget-object v4, Ll/c53;->l:Landroid/graphics/RectF;

    .line 159
    .line 160
    iget-object v5, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 161
    .line 162
    iget-object v5, v5, Ll/cce;->c:Landroid/graphics/RectF;

    .line 163
    .line 164
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 165
    .line 166
    .line 167
    iget-object v4, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 168
    .line 169
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-lez v4, :cond_8

    .line 174
    .line 175
    iget-object v4, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 176
    .line 177
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    if-gt v4, v5, :cond_8

    .line 186
    .line 187
    iget-object v4, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 188
    .line 189
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    if-le v4, v3, :cond_6

    .line 194
    .line 195
    sget-object v4, Ll/c53;->k:Landroid/graphics/Rect;

    .line 196
    .line 197
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 198
    .line 199
    iget v6, v2, Landroid/graphics/Rect;->top:I

    .line 200
    .line 201
    iget v7, v2, Landroid/graphics/Rect;->right:I

    .line 202
    .line 203
    iget-object v8, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 204
    .line 205
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    add-int/2addr v8, v6

    .line 210
    sub-int/2addr v8, v3

    .line 211
    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 212
    .line 213
    .line 214
    iget-object v4, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 215
    .line 216
    iget-object v4, v4, Ll/cce;->c:Landroid/graphics/RectF;

    .line 217
    .line 218
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 223
    .line 224
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    int-to-float v5, v5

    .line 229
    mul-float/2addr v4, v5

    .line 230
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 231
    .line 232
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    int-to-float v5, v5

    .line 237
    div-float/2addr v4, v5

    .line 238
    iget-object v5, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 239
    .line 240
    iget-object v5, v5, Ll/cce;->c:Landroid/graphics/RectF;

    .line 241
    .line 242
    sget-object v6, Ll/c53;->l:Landroid/graphics/RectF;

    .line 243
    .line 244
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 245
    .line 246
    iget v8, v6, Landroid/graphics/RectF;->top:F

    .line 247
    .line 248
    iget v6, v6, Landroid/graphics/RectF;->right:F

    .line 249
    .line 250
    add-float v9, v8, v4

    .line 251
    .line 252
    invoke-virtual {v5, v7, v8, v6, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 253
    .line 254
    .line 255
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 256
    .line 257
    iget-object v6, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 258
    .line 259
    invoke-static {p2, v0, v5, v6}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 260
    .line 261
    .line 262
    goto :goto_1

    .line 263
    :cond_6
    move v4, v1

    .line 264
    :goto_1
    iget-object v5, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 265
    .line 266
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 271
    .line 272
    .line 273
    move-result v6

    .line 274
    if-ge v5, v6, :cond_7

    .line 275
    .line 276
    sget-object v1, Ll/c53;->k:Landroid/graphics/Rect;

    .line 277
    .line 278
    iget v5, v2, Landroid/graphics/Rect;->left:I

    .line 279
    .line 280
    iget v6, v2, Landroid/graphics/Rect;->top:I

    .line 281
    .line 282
    iget-object v7, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 283
    .line 284
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 285
    .line 286
    .line 287
    move-result v7

    .line 288
    add-int/2addr v6, v7

    .line 289
    iget v7, v2, Landroid/graphics/Rect;->right:I

    .line 290
    .line 291
    iget v8, v2, Landroid/graphics/Rect;->bottom:I

    .line 292
    .line 293
    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 294
    .line 295
    .line 296
    iget-object v1, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 297
    .line 298
    iget-object v1, v1, Ll/cce;->c:Landroid/graphics/RectF;

    .line 299
    .line 300
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 305
    .line 306
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 307
    .line 308
    .line 309
    move-result v5

    .line 310
    int-to-float v5, v5

    .line 311
    mul-float/2addr v1, v5

    .line 312
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 313
    .line 314
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 315
    .line 316
    .line 317
    move-result v5

    .line 318
    int-to-float v5, v5

    .line 319
    div-float/2addr v1, v5

    .line 320
    iget-object v5, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 321
    .line 322
    iget-object v5, v5, Ll/cce;->c:Landroid/graphics/RectF;

    .line 323
    .line 324
    sget-object v6, Ll/c53;->l:Landroid/graphics/RectF;

    .line 325
    .line 326
    iget v7, v6, Landroid/graphics/RectF;->left:F

    .line 327
    .line 328
    iget v8, v6, Landroid/graphics/RectF;->bottom:F

    .line 329
    .line 330
    sub-float v9, v8, v1

    .line 331
    .line 332
    iget v6, v6, Landroid/graphics/RectF;->right:F

    .line 333
    .line 334
    invoke-virtual {v5, v7, v9, v6, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 335
    .line 336
    .line 337
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 338
    .line 339
    iget-object v6, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 340
    .line 341
    invoke-static {p2, v0, v5, v6}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 342
    .line 343
    .line 344
    :cond_7
    sget-object v5, Ll/c53;->k:Landroid/graphics/Rect;

    .line 345
    .line 346
    iget v6, v2, Landroid/graphics/Rect;->left:I

    .line 347
    .line 348
    iget v7, v2, Landroid/graphics/Rect;->top:I

    .line 349
    .line 350
    iget-object v8, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 351
    .line 352
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 353
    .line 354
    .line 355
    move-result v8

    .line 356
    add-int/2addr v7, v8

    .line 357
    sub-int/2addr v7, v3

    .line 358
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 359
    .line 360
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 361
    .line 362
    iget-object p0, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 363
    .line 364
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 365
    .line 366
    .line 367
    move-result p0

    .line 368
    add-int/2addr v2, p0

    .line 369
    invoke-virtual {v5, v6, v7, v3, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 370
    .line 371
    .line 372
    iget-object p0, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 373
    .line 374
    iget-object p0, p0, Ll/cce;->c:Landroid/graphics/RectF;

    .line 375
    .line 376
    sget-object v2, Ll/c53;->l:Landroid/graphics/RectF;

    .line 377
    .line 378
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 379
    .line 380
    iget v5, v2, Landroid/graphics/RectF;->top:F

    .line 381
    .line 382
    add-float/2addr v5, v4

    .line 383
    const/high16 v4, 0x3f800000    # 1.0f

    .line 384
    .line 385
    sub-float/2addr v5, v4

    .line 386
    iget v6, v2, Landroid/graphics/RectF;->right:F

    .line 387
    .line 388
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 389
    .line 390
    sub-float/2addr v2, v1

    .line 391
    add-float/2addr v2, v4

    .line 392
    invoke-virtual {p0, v3, v5, v6, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 393
    .line 394
    .line 395
    sget-object p0, Ll/c53;->k:Landroid/graphics/Rect;

    .line 396
    .line 397
    iget-object p1, p1, Lcom/sunshine/engine/base/a;->s:Ll/cce;

    .line 398
    .line 399
    invoke-static {p2, v0, p0, p1}, Lcom/sunshine/engine/base/r;->a(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Rect;Ll/cce;)V

    .line 400
    .line 401
    .line 402
    :cond_8
    :goto_2
    return-void
.end method
