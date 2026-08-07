.class public Ll/o9c;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Ll/zim;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ll/h1e0;

.field public h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:I

.field public k:I

.field public final l:Landroid/graphics/Paint;

.field public final m:Landroid/graphics/Matrix;

.field public final n:Landroid/graphics/Rect;

.field public final o:Landroid/graphics/RectF;

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:J

.field public v:Ljava/lang/String;

.field public w:I

.field public x:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/o9c;->h:Ljava/util/HashMap;

    .line 10
    .line 11
    const/16 v0, 0x50

    .line 12
    .line 13
    iput v0, p0, Ll/o9c;->k:I

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/Paint;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 22
    .line 23
    new-instance v0, Landroid/graphics/Matrix;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/o9c;->m:Landroid/graphics/Matrix;

    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/o9c;->n:Landroid/graphics/Rect;

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/o9c;->o:Landroid/graphics/RectF;

    .line 43
    .line 44
    const/4 v0, -0x1

    .line 45
    iput v0, p0, Ll/o9c;->w:I

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iput v0, p0, Ll/o9c;->x:I

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/o9c;->i()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static varargs g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 5
    .line 6
    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public a(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/o9c;->u:J

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o9c;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/o9c;->e(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/o9c;->e(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 6
    .line 7
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 13
    .line 14
    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 20
    .line 21
    const/16 v2, -0x6800

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    int-to-float v3, v1

    .line 29
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 30
    .line 31
    int-to-float v4, v1

    .line 32
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 33
    .line 34
    int-to-float v5, v1

    .line 35
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    int-to-float v6, v1

    .line 38
    iget-object v7, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 39
    .line 40
    move-object v2, p1

    .line 41
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 45
    .line 46
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 52
    .line 53
    iget v3, p0, Ll/o9c;->x:I

    .line 54
    .line 55
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    .line 57
    .line 58
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    int-to-float v9, p1

    .line 61
    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 62
    .line 63
    int-to-float v10, p1

    .line 64
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-float v11, p1

    .line 67
    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    int-to-float v12, p1

    .line 70
    iget-object v13, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 71
    .line 72
    move-object v8, v2

    .line 73
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 88
    .line 89
    const/4 v1, -0x1

    .line 90
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    .line 92
    .line 93
    iget p1, p0, Ll/o9c;->p:I

    .line 94
    .line 95
    iput p1, p0, Ll/o9c;->s:I

    .line 96
    .line 97
    iget p1, p0, Ll/o9c;->q:I

    .line 98
    .line 99
    iput p1, p0, Ll/o9c;->t:I

    .line 100
    .line 101
    iget-object p1, p0, Ll/o9c;->b:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v1, p0, Ll/o9c;->a:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p1, :cond_0

    .line 106
    .line 107
    const-string v3, "%s, %s"

    .line 108
    .line 109
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {v3, p1}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string v1, "IDs"

    .line 118
    .line 119
    invoke-virtual {p0, v2, v1, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    const-string p1, "ID"

    .line 124
    .line 125
    invoke-virtual {p0, v2, p1, v1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    const-string v1, "%dx%d"

    .line 149
    .line 150
    invoke-static {v1, p1}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const-string v3, "D"

    .line 155
    .line 156
    invoke-virtual {p0, v2, v3, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-lez p1, :cond_1

    .line 164
    .line 165
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    int-to-float p1, p1

    .line 170
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    int-to-float v0, v0

    .line 175
    div-float/2addr p1, v0

    .line 176
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    const-string v0, "DAR"

    .line 181
    .line 182
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->c(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    :cond_1
    iget p1, p0, Ll/o9c;->c:I

    .line 186
    .line 187
    iget v0, p0, Ll/o9c;->d:I

    .line 188
    .line 189
    iget-object v3, p0, Ll/o9c;->g:Ll/h1e0;

    .line 190
    .line 191
    invoke-virtual {p0, p1, v0, v3}, Ll/o9c;->f(IILl/h1e0;)I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    iget v0, p0, Ll/o9c;->c:I

    .line 196
    .line 197
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget v3, p0, Ll/o9c;->d:I

    .line 202
    .line 203
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    filled-new-array {v0, v3}, [Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v1, v0}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    const-string v1, "I"

    .line 216
    .line 217
    invoke-virtual {p0, v2, v1, v0, p1}, Ll/o9c;->e(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;I)V

    .line 218
    .line 219
    .line 220
    iget p1, p0, Ll/o9c;->d:I

    .line 221
    .line 222
    if-lez p1, :cond_2

    .line 223
    .line 224
    iget v0, p0, Ll/o9c;->c:I

    .line 225
    .line 226
    int-to-float v0, v0

    .line 227
    int-to-float p1, p1

    .line 228
    div-float/2addr v0, p1

    .line 229
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    const-string v0, "IAR"

    .line 234
    .line 235
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->c(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/Object;)V

    .line 236
    .line 237
    .line 238
    :cond_2
    iget p1, p0, Ll/o9c;->e:I

    .line 239
    .line 240
    div-int/lit16 p1, p1, 0x400

    .line 241
    .line 242
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    const-string v0, "%d KiB"

    .line 251
    .line 252
    invoke-static {v0, p1}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-virtual {p0, v2, v1, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Ll/o9c;->f:Ljava/lang/String;

    .line 260
    .line 261
    if-eqz p1, :cond_3

    .line 262
    .line 263
    const-string v0, "i format"

    .line 264
    .line 265
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    :cond_3
    iget p1, p0, Ll/o9c;->i:I

    .line 269
    .line 270
    if-lez p1, :cond_4

    .line 271
    .line 272
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    iget v0, p0, Ll/o9c;->j:I

    .line 277
    .line 278
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    const-string v0, "f %d, l %d"

    .line 287
    .line 288
    invoke-static {v0, p1}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    const-string v0, "anim"

    .line 293
    .line 294
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    :cond_4
    iget-object p1, p0, Ll/o9c;->g:Ll/h1e0;

    .line 298
    .line 299
    if-eqz p1, :cond_5

    .line 300
    .line 301
    const-string v0, "scale"

    .line 302
    .line 303
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->c(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    :cond_5
    iget-wide v0, p0, Ll/o9c;->u:J

    .line 307
    .line 308
    const-wide/16 v3, 0x0

    .line 309
    .line 310
    cmp-long p1, v0, v3

    .line 311
    .line 312
    if-ltz p1, :cond_6

    .line 313
    .line 314
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    const-string v0, "%d ms"

    .line 323
    .line 324
    invoke-static {v0, p1}, Ll/o9c;->g(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    const-string v0, "t"

    .line 329
    .line 330
    invoke-virtual {p0, v2, v0, p1}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    :cond_6
    iget-object p1, p0, Ll/o9c;->v:Ljava/lang/String;

    .line 334
    .line 335
    if-eqz p1, :cond_7

    .line 336
    .line 337
    const-string v0, "origin"

    .line 338
    .line 339
    iget v1, p0, Ll/o9c;->w:I

    .line 340
    .line 341
    invoke-virtual {p0, v2, v0, p1, v1}, Ll/o9c;->e(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;I)V

    .line 342
    .line 343
    .line 344
    :cond_7
    iget-object p1, p0, Ll/o9c;->h:Ljava/util/HashMap;

    .line 345
    .line 346
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_8

    .line 359
    .line 360
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    check-cast v0, Ljava/util/Map$Entry;

    .line 365
    .line 366
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    check-cast v1, Ljava/lang/String;

    .line 371
    .line 372
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    check-cast v0, Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {p0, v2, v1, v0}, Ll/o9c;->d(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    goto :goto_1

    .line 382
    :cond_8
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p2, ": "

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object v0, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {v1, p3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/high16 v3, 0x66000000

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    .line 36
    .line 37
    iget v2, p0, Ll/o9c;->s:I

    .line 38
    .line 39
    add-int/lit8 v3, v2, -0x4

    .line 40
    .line 41
    int-to-float v5, v3

    .line 42
    iget v3, p0, Ll/o9c;->t:I

    .line 43
    .line 44
    add-int/lit8 v4, v3, 0x8

    .line 45
    .line 46
    int-to-float v6, v4

    .line 47
    int-to-float v2, v2

    .line 48
    add-float/2addr v2, v0

    .line 49
    add-float/2addr v2, v1

    .line 50
    const/high16 v1, 0x40800000    # 4.0f

    .line 51
    .line 52
    add-float v7, v2, v1

    .line 53
    .line 54
    iget v1, p0, Ll/o9c;->r:I

    .line 55
    .line 56
    add-int/2addr v3, v1

    .line 57
    add-int/lit8 v3, v3, 0x8

    .line 58
    .line 59
    int-to-float v8, v3

    .line 60
    iget-object v9, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 61
    .line 62
    move-object v4, p1

    .line 63
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 67
    .line 68
    const/4 v1, -0x1

    .line 69
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    .line 71
    .line 72
    iget p1, p0, Ll/o9c;->s:I

    .line 73
    .line 74
    int-to-float p1, p1

    .line 75
    iget v1, p0, Ll/o9c;->t:I

    .line 76
    .line 77
    int-to-float v1, v1

    .line 78
    iget-object v2, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {v4, p2, p1, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    iget p1, p0, Ll/o9c;->s:I

    .line 89
    .line 90
    int-to-float p1, p1

    .line 91
    add-float/2addr p1, v0

    .line 92
    iget p2, p0, Ll/o9c;->t:I

    .line 93
    .line 94
    int-to-float p2, p2

    .line 95
    iget-object p4, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {v4, p3, p1, p2, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 98
    .line 99
    .line 100
    iget p1, p0, Ll/o9c;->t:I

    .line 101
    .line 102
    iget p2, p0, Ll/o9c;->r:I

    .line 103
    .line 104
    add-int/2addr p1, p2

    .line 105
    iput p1, p0, Ll/o9c;->t:I

    .line 106
    .line 107
    return-void
.end method

.method public f(IILl/h1e0;)I
    .locals 11
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/high16 v2, -0x10000

    .line 18
    .line 19
    if-lez v0, :cond_3

    .line 20
    .line 21
    if-lez v1, :cond_3

    .line 22
    .line 23
    if-lez p1, :cond_3

    .line 24
    .line 25
    if-gtz p2, :cond_0

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    if-eqz p3, :cond_1

    .line 30
    .line 31
    iget-object v3, p0, Ll/o9c;->n:Landroid/graphics/Rect;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    iput v4, v3, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    iput v4, v3, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    iput v0, v3, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    iput v1, v3, Landroid/graphics/Rect;->bottom:I

    .line 41
    .line 42
    iget-object v3, p0, Ll/o9c;->m:Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 45
    .line 46
    .line 47
    iget-object v5, p0, Ll/o9c;->m:Landroid/graphics/Matrix;

    .line 48
    .line 49
    iget-object v6, p0, Ll/o9c;->n:Landroid/graphics/Rect;

    .line 50
    .line 51
    const/4 v9, 0x0

    .line 52
    const/4 v10, 0x0

    .line 53
    move v7, p1

    .line 54
    move v8, p2

    .line 55
    move-object v4, p3

    .line 56
    invoke-interface/range {v4 .. v10}, Ll/h1e0;->a(Landroid/graphics/Matrix;Landroid/graphics/Rect;IIFF)Landroid/graphics/Matrix;

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/o9c;->o:Landroid/graphics/RectF;

    .line 60
    .line 61
    const/4 p2, 0x0

    .line 62
    iput p2, p1, Landroid/graphics/RectF;->top:F

    .line 63
    .line 64
    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 65
    .line 66
    int-to-float p2, v7

    .line 67
    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 68
    .line 69
    int-to-float p2, v8

    .line 70
    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    .line 71
    .line 72
    iget-object p2, p0, Ll/o9c;->m:Landroid/graphics/Matrix;

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/o9c;->o:Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    float-to-int p1, p1

    .line 84
    iget-object p0, p0, Ll/o9c;->o:Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    float-to-int p0, p0

    .line 91
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_0

    .line 100
    :cond_1
    move v7, p1

    .line 101
    move v8, p2

    .line 102
    :goto_0
    int-to-float p0, v0

    .line 103
    const p1, 0x3dcccccd    # 0.1f

    .line 104
    .line 105
    .line 106
    mul-float p2, p0, p1

    .line 107
    .line 108
    const/high16 p3, 0x3f000000    # 0.5f

    .line 109
    .line 110
    mul-float/2addr p0, p3

    .line 111
    int-to-float v3, v1

    .line 112
    mul-float/2addr p1, v3

    .line 113
    mul-float/2addr v3, p3

    .line 114
    sub-int p3, v7, v0

    .line 115
    .line 116
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    sub-int v0, v8, v1

    .line 121
    .line 122
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    int-to-float p3, p3

    .line 127
    cmpg-float p2, p3, p2

    .line 128
    .line 129
    if-gez p2, :cond_2

    .line 130
    .line 131
    int-to-float p2, v0

    .line 132
    cmpg-float p1, p2, p1

    .line 133
    .line 134
    if-gez p1, :cond_2

    .line 135
    .line 136
    const p0, -0xff0100

    .line 137
    .line 138
    .line 139
    return p0

    .line 140
    :cond_2
    cmpg-float p0, p3, p0

    .line 141
    .line 142
    if-gez p0, :cond_3

    .line 143
    .line 144
    int-to-float p0, v0

    .line 145
    cmpg-float p0, p0, v3

    .line 146
    .line 147
    if-gez p0, :cond_3

    .line 148
    .line 149
    const/16 p0, -0x100

    .line 150
    .line 151
    return p0

    .line 152
    :cond_3
    :goto_1
    return v2
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public final h(Landroid/graphics/Rect;II)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/2addr v0, p3

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    div-int/2addr p3, p2

    .line 11
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/16 p3, 0xa

    .line 16
    .line 17
    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/16 v0, 0x28

    .line 22
    .line 23
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iget-object v0, p0, Ll/o9c;->l:Landroid/graphics/Paint;

    .line 28
    .line 29
    int-to-float v1, p2

    .line 30
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 p2, p2, 0x8

    .line 34
    .line 35
    iput p2, p0, Ll/o9c;->r:I

    .line 36
    .line 37
    iget v0, p0, Ll/o9c;->k:I

    .line 38
    .line 39
    const/16 v1, 0x50

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    mul-int/lit8 p2, p2, -0x1

    .line 44
    .line 45
    iput p2, p0, Ll/o9c;->r:I

    .line 46
    .line 47
    :cond_0
    iget p2, p1, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    add-int/2addr p2, p3

    .line 50
    iput p2, p0, Ll/o9c;->p:I

    .line 51
    .line 52
    if-ne v0, v1, :cond_1

    .line 53
    .line 54
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 55
    .line 56
    sub-int/2addr p1, p3

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 59
    .line 60
    add-int/lit8 p1, p1, 0x14

    .line 61
    .line 62
    :goto_0
    iput p1, p0, Ll/o9c;->q:I

    .line 63
    .line 64
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/o9c;->c:I

    .line 3
    .line 4
    iput v0, p0, Ll/o9c;->d:I

    .line 5
    .line 6
    iput v0, p0, Ll/o9c;->e:I

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/o9c;->h:Ljava/util/HashMap;

    .line 14
    .line 15
    iput v0, p0, Ll/o9c;->i:I

    .line 16
    .line 17
    iput v0, p0, Ll/o9c;->j:I

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/o9c;->f:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/o9c;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 v2, -0x1

    .line 26
    .line 27
    iput-wide v2, p0, Ll/o9c;->u:J

    .line 28
    .line 29
    iput-object v1, p0, Ll/o9c;->v:Ljava/lang/String;

    .line 30
    .line 31
    iput v0, p0, Ll/o9c;->w:I

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string p1, "none"

    .line 5
    .line 6
    :goto_0
    iput-object p1, p0, Ll/o9c;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/o9c;->c:I

    .line 2
    .line 3
    iput p2, p0, Ll/o9c;->d:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/o9c;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public m(Ll/h1e0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o9c;->g:Ll/h1e0;

    .line 2
    .line 3
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, v1}, Ll/o9c;->h(Landroid/graphics/Rect;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
