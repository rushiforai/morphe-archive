.class public final Ll/tdg0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:Landroid/text/StaticLayout;

.field public F:Landroid/text/StaticLayout;

.field public G:I

.field public H:I

.field public I:I

.field public J:Landroid/graphics/Rect;

.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:Landroid/text/TextPaint;

.field public final g:Landroid/graphics/Paint;

.field public final h:Landroid/graphics/Paint;

.field public i:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Landroid/text/Layout$Alignment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Landroid/graphics/Bitmap;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:F

.field public m:I

.field public n:I

.field public o:F

.field public p:I

.field public q:F

.field public r:F

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x1010217

    .line 5
    .line 6
    .line 7
    const v1, 0x1010218

    .line 8
    .line 9
    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p1, v1, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    iput v1, p0, Ll/tdg0;->e:F

    .line 26
    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p0, Ll/tdg0;->d:F

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 48
    .line 49
    int-to-float p1, p1

    .line 50
    const/high16 v0, 0x40000000    # 2.0f

    .line 51
    .line 52
    mul-float/2addr p1, v0

    .line 53
    const/high16 v0, 0x43200000    # 160.0f

    .line 54
    .line 55
    div-float/2addr p1, v0

    .line 56
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    int-to-float p1, p1

    .line 61
    iput p1, p0, Ll/tdg0;->a:F

    .line 62
    .line 63
    iput p1, p0, Ll/tdg0;->b:F

    .line 64
    .line 65
    iput p1, p0, Ll/tdg0;->c:F

    .line 66
    .line 67
    new-instance p1, Landroid/text/TextPaint;

    .line 68
    .line 69
    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setSubpixelText(Z)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Ll/tdg0;->g:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 88
    .line 89
    .line 90
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 93
    .line 94
    .line 95
    new-instance p1, Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Ll/tdg0;->h:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .locals 0
    .param p0    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eq p0, p1, :cond_1

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method


# virtual methods
.method public b(Ll/myb;Ll/sg4;FFFLandroid/graphics/Canvas;IIII)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/myb;->d:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v1, p1, Ll/myb;->a:Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-boolean v1, p1, Ll/myb;->l:Z

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget v1, p1, Ll/myb;->m:I

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    iget v1, p2, Ll/sg4;->c:I

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_3
    const/high16 v1, -0x1000000

    .line 30
    .line 31
    :goto_1
    iget-object v2, p0, Ll/tdg0;->i:Ljava/lang/CharSequence;

    .line 32
    .line 33
    iget-object v3, p1, Ll/myb;->a:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/tdg0;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_4

    .line 40
    .line 41
    iget-object v2, p0, Ll/tdg0;->j:Landroid/text/Layout$Alignment;

    .line 42
    .line 43
    iget-object v3, p1, Ll/myb;->b:Landroid/text/Layout$Alignment;

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_4

    .line 50
    .line 51
    iget-object v2, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 52
    .line 53
    iget-object v3, p1, Ll/myb;->d:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    if-ne v2, v3, :cond_4

    .line 56
    .line 57
    iget v2, p0, Ll/tdg0;->l:F

    .line 58
    .line 59
    iget v3, p1, Ll/myb;->e:F

    .line 60
    .line 61
    cmpl-float v2, v2, v3

    .line 62
    .line 63
    if-nez v2, :cond_4

    .line 64
    .line 65
    iget v2, p0, Ll/tdg0;->m:I

    .line 66
    .line 67
    iget v3, p1, Ll/myb;->f:I

    .line 68
    .line 69
    if-ne v2, v3, :cond_4

    .line 70
    .line 71
    iget v2, p0, Ll/tdg0;->n:I

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget v3, p1, Ll/myb;->g:I

    .line 78
    .line 79
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-static {v2, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_4

    .line 88
    .line 89
    iget v2, p0, Ll/tdg0;->o:F

    .line 90
    .line 91
    iget v3, p1, Ll/myb;->h:F

    .line 92
    .line 93
    cmpl-float v2, v2, v3

    .line 94
    .line 95
    if-nez v2, :cond_4

    .line 96
    .line 97
    iget v2, p0, Ll/tdg0;->p:I

    .line 98
    .line 99
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iget v3, p1, Ll/myb;->i:I

    .line 104
    .line 105
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-static {v2, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_4

    .line 114
    .line 115
    iget v2, p0, Ll/tdg0;->q:F

    .line 116
    .line 117
    iget v3, p1, Ll/myb;->j:F

    .line 118
    .line 119
    cmpl-float v2, v2, v3

    .line 120
    .line 121
    if-nez v2, :cond_4

    .line 122
    .line 123
    iget v2, p0, Ll/tdg0;->r:F

    .line 124
    .line 125
    iget v3, p1, Ll/myb;->k:F

    .line 126
    .line 127
    cmpl-float v2, v2, v3

    .line 128
    .line 129
    if-nez v2, :cond_4

    .line 130
    .line 131
    iget v2, p0, Ll/tdg0;->s:I

    .line 132
    .line 133
    iget v3, p2, Ll/sg4;->a:I

    .line 134
    .line 135
    if-ne v2, v3, :cond_4

    .line 136
    .line 137
    iget v2, p0, Ll/tdg0;->t:I

    .line 138
    .line 139
    iget v3, p2, Ll/sg4;->b:I

    .line 140
    .line 141
    if-ne v2, v3, :cond_4

    .line 142
    .line 143
    iget v2, p0, Ll/tdg0;->u:I

    .line 144
    .line 145
    if-ne v2, v1, :cond_4

    .line 146
    .line 147
    iget v2, p0, Ll/tdg0;->w:I

    .line 148
    .line 149
    iget v3, p2, Ll/sg4;->d:I

    .line 150
    .line 151
    if-ne v2, v3, :cond_4

    .line 152
    .line 153
    iget v2, p0, Ll/tdg0;->v:I

    .line 154
    .line 155
    iget v3, p2, Ll/sg4;->e:I

    .line 156
    .line 157
    if-ne v2, v3, :cond_4

    .line 158
    .line 159
    iget-object v2, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 160
    .line 161
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iget-object v3, p2, Ll/sg4;->f:Landroid/graphics/Typeface;

    .line 166
    .line 167
    invoke-static {v2, v3}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_4

    .line 172
    .line 173
    iget v2, p0, Ll/tdg0;->x:F

    .line 174
    .line 175
    cmpl-float v2, v2, p3

    .line 176
    .line 177
    if-nez v2, :cond_4

    .line 178
    .line 179
    iget v2, p0, Ll/tdg0;->y:F

    .line 180
    .line 181
    cmpl-float v2, v2, p4

    .line 182
    .line 183
    if-nez v2, :cond_4

    .line 184
    .line 185
    iget v2, p0, Ll/tdg0;->z:F

    .line 186
    .line 187
    cmpl-float v2, v2, p5

    .line 188
    .line 189
    if-nez v2, :cond_4

    .line 190
    .line 191
    iget v2, p0, Ll/tdg0;->A:I

    .line 192
    .line 193
    if-ne v2, p7, :cond_4

    .line 194
    .line 195
    iget v2, p0, Ll/tdg0;->B:I

    .line 196
    .line 197
    if-ne v2, p8, :cond_4

    .line 198
    .line 199
    iget v2, p0, Ll/tdg0;->C:I

    .line 200
    .line 201
    if-ne v2, p9, :cond_4

    .line 202
    .line 203
    iget v2, p0, Ll/tdg0;->D:I

    .line 204
    .line 205
    if-ne v2, p10, :cond_4

    .line 206
    .line 207
    invoke-virtual {p0, p6, v0}, Ll/tdg0;->d(Landroid/graphics/Canvas;Z)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_4
    iget-object v2, p1, Ll/myb;->a:Ljava/lang/CharSequence;

    .line 212
    .line 213
    iput-object v2, p0, Ll/tdg0;->i:Ljava/lang/CharSequence;

    .line 214
    .line 215
    iget-object v2, p1, Ll/myb;->b:Landroid/text/Layout$Alignment;

    .line 216
    .line 217
    iput-object v2, p0, Ll/tdg0;->j:Landroid/text/Layout$Alignment;

    .line 218
    .line 219
    iget-object v2, p1, Ll/myb;->d:Landroid/graphics/Bitmap;

    .line 220
    .line 221
    iput-object v2, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 222
    .line 223
    iget v2, p1, Ll/myb;->e:F

    .line 224
    .line 225
    iput v2, p0, Ll/tdg0;->l:F

    .line 226
    .line 227
    iget v2, p1, Ll/myb;->f:I

    .line 228
    .line 229
    iput v2, p0, Ll/tdg0;->m:I

    .line 230
    .line 231
    iget v2, p1, Ll/myb;->g:I

    .line 232
    .line 233
    iput v2, p0, Ll/tdg0;->n:I

    .line 234
    .line 235
    iget v2, p1, Ll/myb;->h:F

    .line 236
    .line 237
    iput v2, p0, Ll/tdg0;->o:F

    .line 238
    .line 239
    iget v2, p1, Ll/myb;->i:I

    .line 240
    .line 241
    iput v2, p0, Ll/tdg0;->p:I

    .line 242
    .line 243
    iget v2, p1, Ll/myb;->j:F

    .line 244
    .line 245
    iput v2, p0, Ll/tdg0;->q:F

    .line 246
    .line 247
    iget p1, p1, Ll/myb;->k:F

    .line 248
    .line 249
    iput p1, p0, Ll/tdg0;->r:F

    .line 250
    .line 251
    iget p1, p2, Ll/sg4;->a:I

    .line 252
    .line 253
    iput p1, p0, Ll/tdg0;->s:I

    .line 254
    .line 255
    iget p1, p2, Ll/sg4;->b:I

    .line 256
    .line 257
    iput p1, p0, Ll/tdg0;->t:I

    .line 258
    .line 259
    iput v1, p0, Ll/tdg0;->u:I

    .line 260
    .line 261
    iget p1, p2, Ll/sg4;->d:I

    .line 262
    .line 263
    iput p1, p0, Ll/tdg0;->w:I

    .line 264
    .line 265
    iget p1, p2, Ll/sg4;->e:I

    .line 266
    .line 267
    iput p1, p0, Ll/tdg0;->v:I

    .line 268
    .line 269
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 270
    .line 271
    iget-object p2, p2, Ll/sg4;->f:Landroid/graphics/Typeface;

    .line 272
    .line 273
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 274
    .line 275
    .line 276
    iput p3, p0, Ll/tdg0;->x:F

    .line 277
    .line 278
    iput p4, p0, Ll/tdg0;->y:F

    .line 279
    .line 280
    iput p5, p0, Ll/tdg0;->z:F

    .line 281
    .line 282
    iput p7, p0, Ll/tdg0;->A:I

    .line 283
    .line 284
    iput p8, p0, Ll/tdg0;->B:I

    .line 285
    .line 286
    iput p9, p0, Ll/tdg0;->C:I

    .line 287
    .line 288
    iput p10, p0, Ll/tdg0;->D:I

    .line 289
    .line 290
    if-eqz v0, :cond_5

    .line 291
    .line 292
    iget-object p1, p0, Ll/tdg0;->i:Ljava/lang/CharSequence;

    .line 293
    .line 294
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0}, Ll/tdg0;->g()V

    .line 298
    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_5
    iget-object p1, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 302
    .line 303
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p0}, Ll/tdg0;->f()V

    .line 307
    .line 308
    .line 309
    :goto_2
    invoke-virtual {p0, p6, v0}, Ll/tdg0;->d(Landroid/graphics/Canvas;Z)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 3
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "cueBitmap",
            "bitmapRect"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tdg0;->J:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget-object p0, p0, Ll/tdg0;->h:Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tdg0;->e(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p2, p0, Ll/tdg0;->J:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/tdg0;->c(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tdg0;->F:Landroid/text/StaticLayout;

    .line 4
    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget v3, p0, Ll/tdg0;->G:I

    .line 16
    .line 17
    int-to-float v3, v3

    .line 18
    iget v4, p0, Ll/tdg0;->H:I

    .line 19
    .line 20
    int-to-float v4, v4

    .line 21
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 22
    .line 23
    .line 24
    iget v3, p0, Ll/tdg0;->u:I

    .line 25
    .line 26
    invoke-static {v3}, Landroid/graphics/Color;->alpha(I)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-lez v3, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Ll/tdg0;->g:Landroid/graphics/Paint;

    .line 33
    .line 34
    iget v4, p0, Ll/tdg0;->u:I

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    iget v3, p0, Ll/tdg0;->I:I

    .line 40
    .line 41
    neg-int v3, v3

    .line 42
    int-to-float v5, v3

    .line 43
    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    iget v4, p0, Ll/tdg0;->I:I

    .line 48
    .line 49
    add-int/2addr v3, v4

    .line 50
    int-to-float v7, v3

    .line 51
    invoke-virtual {v0}, Landroid/text/Layout;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    int-to-float v8, v3

    .line 56
    iget-object v9, p0, Ll/tdg0;->g:Landroid/graphics/Paint;

    .line 57
    .line 58
    const/4 v6, 0x0

    .line 59
    move-object v4, p1

    .line 60
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move-object v4, p1

    .line 65
    :goto_0
    iget p1, p0, Ll/tdg0;->w:I

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    const/4 v5, 0x1

    .line 69
    if-ne p1, v5, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 72
    .line 73
    sget-object v5, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 74
    .line 75
    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 79
    .line 80
    iget v5, p0, Ll/tdg0;->a:F

    .line 81
    .line 82
    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 86
    .line 87
    iget v5, p0, Ll/tdg0;->v:I

    .line 88
    .line 89
    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 93
    .line 94
    sget-object v5, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 95
    .line 96
    invoke-virtual {p1, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v4}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_2
    const/4 v6, 0x2

    .line 104
    if-ne p1, v6, :cond_3

    .line 105
    .line 106
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 107
    .line 108
    iget v1, p0, Ll/tdg0;->b:F

    .line 109
    .line 110
    iget v5, p0, Ll/tdg0;->c:F

    .line 111
    .line 112
    iget v6, p0, Ll/tdg0;->v:I

    .line 113
    .line 114
    invoke-virtual {p1, v1, v5, v5, v6}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 115
    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_3
    const/4 v6, 0x3

    .line 119
    if-eq p1, v6, :cond_4

    .line 120
    .line 121
    const/4 v7, 0x4

    .line 122
    if-ne p1, v7, :cond_8

    .line 123
    .line 124
    :cond_4
    if-ne p1, v6, :cond_5

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    move v5, v3

    .line 128
    :goto_1
    const/4 p1, -0x1

    .line 129
    if-eqz v5, :cond_6

    .line 130
    .line 131
    move v6, p1

    .line 132
    goto :goto_2

    .line 133
    :cond_6
    iget v6, p0, Ll/tdg0;->v:I

    .line 134
    .line 135
    :goto_2
    if-eqz v5, :cond_7

    .line 136
    .line 137
    iget p1, p0, Ll/tdg0;->v:I

    .line 138
    .line 139
    :cond_7
    iget v5, p0, Ll/tdg0;->b:F

    .line 140
    .line 141
    const/high16 v7, 0x40000000    # 2.0f

    .line 142
    .line 143
    div-float/2addr v5, v7

    .line 144
    iget-object v7, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 145
    .line 146
    iget v8, p0, Ll/tdg0;->s:I

    .line 147
    .line 148
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 149
    .line 150
    .line 151
    iget-object v7, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 152
    .line 153
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 154
    .line 155
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 156
    .line 157
    .line 158
    iget-object v7, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 159
    .line 160
    iget v8, p0, Ll/tdg0;->b:F

    .line 161
    .line 162
    neg-float v9, v5

    .line 163
    invoke-virtual {v7, v8, v9, v9, v6}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v4}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 170
    .line 171
    iget v6, p0, Ll/tdg0;->b:F

    .line 172
    .line 173
    invoke-virtual {v1, v6, v5, v5, p1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 174
    .line 175
    .line 176
    :cond_8
    :goto_3
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 177
    .line 178
    iget v1, p0, Ll/tdg0;->s:I

    .line 179
    .line 180
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 184
    .line 185
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 186
    .line 187
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v4}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 194
    .line 195
    const/4 p1, 0x0

    .line 196
    invoke-virtual {p0, p1, p1, p1, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v4, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 200
    .line 201
    .line 202
    :cond_9
    :goto_4
    return-void
.end method

.method public final f()V
    .locals 7
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "cueBitmap"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tdg0;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget v1, p0, Ll/tdg0;->C:I

    .line 4
    .line 5
    iget v2, p0, Ll/tdg0;->A:I

    .line 6
    .line 7
    sub-int/2addr v1, v2

    .line 8
    iget v3, p0, Ll/tdg0;->D:I

    .line 9
    .line 10
    iget v4, p0, Ll/tdg0;->B:I

    .line 11
    .line 12
    sub-int/2addr v3, v4

    .line 13
    int-to-float v2, v2

    .line 14
    int-to-float v1, v1

    .line 15
    iget v5, p0, Ll/tdg0;->o:F

    .line 16
    .line 17
    mul-float/2addr v5, v1

    .line 18
    add-float/2addr v2, v5

    .line 19
    int-to-float v4, v4

    .line 20
    int-to-float v3, v3

    .line 21
    iget v5, p0, Ll/tdg0;->l:F

    .line 22
    .line 23
    mul-float/2addr v5, v3

    .line 24
    add-float/2addr v4, v5

    .line 25
    iget v5, p0, Ll/tdg0;->q:F

    .line 26
    .line 27
    mul-float/2addr v1, v5

    .line 28
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget v5, p0, Ll/tdg0;->r:F

    .line 33
    .line 34
    const v6, -0x800001

    .line 35
    .line 36
    .line 37
    cmpl-float v6, v5, v6

    .line 38
    .line 39
    if-eqz v6, :cond_0

    .line 40
    .line 41
    mul-float/2addr v3, v5

    .line 42
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    int-to-float v3, v1

    .line 48
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    int-to-float v5, v5

    .line 53
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    div-float/2addr v5, v0

    .line 59
    mul-float/2addr v3, v5

    .line 60
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    :goto_0
    iget v3, p0, Ll/tdg0;->p:I

    .line 65
    .line 66
    const/4 v5, 0x1

    .line 67
    const/4 v6, 0x2

    .line 68
    if-ne v3, v6, :cond_1

    .line 69
    .line 70
    int-to-float v3, v1

    .line 71
    :goto_1
    sub-float/2addr v2, v3

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    if-ne v3, v5, :cond_2

    .line 74
    .line 75
    div-int/lit8 v3, v1, 0x2

    .line 76
    .line 77
    int-to-float v3, v3

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    :goto_2
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    iget v3, p0, Ll/tdg0;->n:I

    .line 84
    .line 85
    if-ne v3, v6, :cond_3

    .line 86
    .line 87
    int-to-float v3, v0

    .line 88
    :goto_3
    sub-float/2addr v4, v3

    .line 89
    goto :goto_4

    .line 90
    :cond_3
    if-ne v3, v5, :cond_4

    .line 91
    .line 92
    div-int/lit8 v3, v0, 0x2

    .line 93
    .line 94
    int-to-float v3, v3

    .line 95
    goto :goto_3

    .line 96
    :cond_4
    :goto_4
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    new-instance v4, Landroid/graphics/Rect;

    .line 101
    .line 102
    add-int/2addr v1, v2

    .line 103
    add-int/2addr v0, v3

    .line 104
    invoke-direct {v4, v2, v3, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 105
    .line 106
    .line 107
    iput-object v4, p0, Ll/tdg0;->J:Landroid/graphics/Rect;

    .line 108
    .line 109
    return-void
.end method

.method public final g()V
    .locals 24
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "cueText"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/tdg0;->i:Ljava/lang/CharSequence;

    .line 4
    .line 5
    instance-of v2, v1, Landroid/text/SpannableStringBuilder;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    check-cast v1, Landroid/text/SpannableStringBuilder;

    .line 10
    .line 11
    :goto_0
    move-object v4, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 14
    .line 15
    iget-object v2, v0, Ll/tdg0;->i:Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    iget v1, v0, Ll/tdg0;->C:I

    .line 22
    .line 23
    iget v2, v0, Ll/tdg0;->A:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    iget v2, v0, Ll/tdg0;->D:I

    .line 27
    .line 28
    iget v3, v0, Ll/tdg0;->B:I

    .line 29
    .line 30
    sub-int/2addr v2, v3

    .line 31
    iget-object v3, v0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 32
    .line 33
    iget v5, v0, Ll/tdg0;->x:F

    .line 34
    .line 35
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 36
    .line 37
    .line 38
    iget v3, v0, Ll/tdg0;->x:F

    .line 39
    .line 40
    const/high16 v5, 0x3e000000    # 0.125f

    .line 41
    .line 42
    mul-float/2addr v3, v5

    .line 43
    const/high16 v5, 0x3f000000    # 0.5f

    .line 44
    .line 45
    add-float/2addr v3, v5

    .line 46
    float-to-int v11, v3

    .line 47
    mul-int/lit8 v12, v11, 0x2

    .line 48
    .line 49
    sub-int v3, v1, v12

    .line 50
    .line 51
    iget v5, v0, Ll/tdg0;->q:F

    .line 52
    .line 53
    const v13, -0x800001

    .line 54
    .line 55
    .line 56
    cmpl-float v6, v5, v13

    .line 57
    .line 58
    if-eqz v6, :cond_1

    .line 59
    .line 60
    int-to-float v3, v3

    .line 61
    mul-float/2addr v3, v5

    .line 62
    float-to-int v3, v3

    .line 63
    :cond_1
    move v6, v3

    .line 64
    const-string v14, "SubtitlePainter"

    .line 65
    .line 66
    if-gtz v6, :cond_2

    .line 67
    .line 68
    const-string v0, "Skipped drawing subtitle cue (insufficient space)"

    .line 69
    .line 70
    invoke-static {v14, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    iget v3, v0, Ll/tdg0;->y:F

    .line 75
    .line 76
    const/4 v15, 0x0

    .line 77
    cmpl-float v3, v3, v15

    .line 78
    .line 79
    const/high16 v5, 0xff0000

    .line 80
    .line 81
    const/4 v7, 0x0

    .line 82
    if-lez v3, :cond_3

    .line 83
    .line 84
    new-instance v3, Landroid/text/style/AbsoluteSizeSpan;

    .line 85
    .line 86
    iget v8, v0, Ll/tdg0;->y:F

    .line 87
    .line 88
    float-to-int v8, v8

    .line 89
    invoke-direct {v3, v8}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    invoke-virtual {v4, v3, v7, v8, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 97
    .line 98
    .line 99
    :cond_3
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 100
    .line 101
    invoke-direct {v3, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget v8, v0, Ll/tdg0;->w:I

    .line 105
    .line 106
    const/4 v9, 0x1

    .line 107
    if-ne v8, v9, :cond_4

    .line 108
    .line 109
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    const-class v10, Landroid/text/style/ForegroundColorSpan;

    .line 114
    .line 115
    invoke-virtual {v3, v7, v8, v10}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    check-cast v8, [Landroid/text/style/ForegroundColorSpan;

    .line 120
    .line 121
    array-length v10, v8

    .line 122
    move v9, v7

    .line 123
    :goto_2
    if-ge v9, v10, :cond_4

    .line 124
    .line 125
    move/from16 v17, v13

    .line 126
    .line 127
    aget-object v13, v8, v9

    .line 128
    .line 129
    invoke-virtual {v3, v13}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 v9, v9, 0x1

    .line 133
    .line 134
    move/from16 v13, v17

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_4
    move/from16 v17, v13

    .line 138
    .line 139
    iget v8, v0, Ll/tdg0;->t:I

    .line 140
    .line 141
    invoke-static {v8}, Landroid/graphics/Color;->alpha(I)I

    .line 142
    .line 143
    .line 144
    move-result v8

    .line 145
    const/4 v13, 0x2

    .line 146
    if-lez v8, :cond_7

    .line 147
    .line 148
    iget v8, v0, Ll/tdg0;->w:I

    .line 149
    .line 150
    if-eqz v8, :cond_6

    .line 151
    .line 152
    if-ne v8, v13, :cond_5

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_5
    new-instance v8, Landroid/text/style/BackgroundColorSpan;

    .line 156
    .line 157
    iget v9, v0, Ll/tdg0;->t:I

    .line 158
    .line 159
    invoke-direct {v8, v9}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    invoke-virtual {v3, v8, v7, v9, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 167
    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_6
    :goto_3
    new-instance v8, Landroid/text/style/BackgroundColorSpan;

    .line 171
    .line 172
    iget v9, v0, Ll/tdg0;->t:I

    .line 173
    .line 174
    invoke-direct {v8, v9}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    .line 178
    .line 179
    .line 180
    move-result v9

    .line 181
    invoke-virtual {v4, v8, v7, v9, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 182
    .line 183
    .line 184
    :cond_7
    :goto_4
    iget-object v5, v0, Ll/tdg0;->j:Landroid/text/Layout$Alignment;

    .line 185
    .line 186
    if-nez v5, :cond_8

    .line 187
    .line 188
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 189
    .line 190
    :cond_8
    move-object/from16 v20, v5

    .line 191
    .line 192
    move-object v5, v3

    .line 193
    new-instance v3, Landroid/text/StaticLayout;

    .line 194
    .line 195
    move-object v8, v5

    .line 196
    iget-object v5, v0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 197
    .line 198
    move-object v9, v8

    .line 199
    iget v8, v0, Ll/tdg0;->d:F

    .line 200
    .line 201
    move-object v10, v9

    .line 202
    iget v9, v0, Ll/tdg0;->e:F

    .line 203
    .line 204
    move-object/from16 v18, v10

    .line 205
    .line 206
    const/4 v10, 0x1

    .line 207
    move/from16 v19, v15

    .line 208
    .line 209
    move-object/from16 v7, v20

    .line 210
    .line 211
    const/4 v15, 0x1

    .line 212
    invoke-direct/range {v3 .. v10}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 213
    .line 214
    .line 215
    iput-object v3, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 216
    .line 217
    invoke-virtual {v3}, Landroid/text/Layout;->getHeight()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    iget-object v5, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 222
    .line 223
    invoke-virtual {v5}, Landroid/text/StaticLayout;->getLineCount()I

    .line 224
    .line 225
    .line 226
    move-result v5

    .line 227
    const/4 v8, 0x0

    .line 228
    const/4 v9, 0x0

    .line 229
    :goto_5
    if-ge v9, v5, :cond_9

    .line 230
    .line 231
    iget-object v10, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 232
    .line 233
    invoke-virtual {v10, v9}, Landroid/text/Layout;->getLineWidth(I)F

    .line 234
    .line 235
    .line 236
    move-result v10

    .line 237
    move-object/from16 v20, v14

    .line 238
    .line 239
    float-to-double v13, v10

    .line 240
    invoke-static {v13, v14}, Ljava/lang/Math;->ceil(D)D

    .line 241
    .line 242
    .line 243
    move-result-wide v13

    .line 244
    double-to-int v10, v13

    .line 245
    invoke-static {v10, v8}, Ljava/lang/Math;->max(II)I

    .line 246
    .line 247
    .line 248
    move-result v8

    .line 249
    add-int/lit8 v9, v9, 0x1

    .line 250
    .line 251
    move-object/from16 v14, v20

    .line 252
    .line 253
    const/4 v13, 0x2

    .line 254
    goto :goto_5

    .line 255
    :cond_9
    move-object/from16 v20, v14

    .line 256
    .line 257
    iget v5, v0, Ll/tdg0;->q:F

    .line 258
    .line 259
    cmpl-float v5, v5, v17

    .line 260
    .line 261
    if-eqz v5, :cond_a

    .line 262
    .line 263
    if-ge v8, v6, :cond_a

    .line 264
    .line 265
    goto :goto_6

    .line 266
    :cond_a
    move v6, v8

    .line 267
    :goto_6
    add-int/2addr v6, v12

    .line 268
    iget v5, v0, Ll/tdg0;->o:F

    .line 269
    .line 270
    cmpl-float v8, v5, v17

    .line 271
    .line 272
    if-eqz v8, :cond_d

    .line 273
    .line 274
    int-to-float v1, v1

    .line 275
    mul-float/2addr v1, v5

    .line 276
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    iget v5, v0, Ll/tdg0;->A:I

    .line 281
    .line 282
    add-int/2addr v1, v5

    .line 283
    iget v8, v0, Ll/tdg0;->p:I

    .line 284
    .line 285
    if-eq v8, v15, :cond_c

    .line 286
    .line 287
    const/4 v9, 0x2

    .line 288
    if-eq v8, v9, :cond_b

    .line 289
    .line 290
    goto :goto_7

    .line 291
    :cond_b
    sub-int/2addr v1, v6

    .line 292
    goto :goto_7

    .line 293
    :cond_c
    const/4 v9, 0x2

    .line 294
    mul-int/lit8 v1, v1, 0x2

    .line 295
    .line 296
    sub-int/2addr v1, v6

    .line 297
    div-int/2addr v1, v9

    .line 298
    :goto_7
    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    add-int/2addr v6, v1

    .line 303
    iget v5, v0, Ll/tdg0;->C:I

    .line 304
    .line 305
    invoke-static {v6, v5}, Ljava/lang/Math;->min(II)I

    .line 306
    .line 307
    .line 308
    move-result v5

    .line 309
    goto :goto_8

    .line 310
    :cond_d
    const/4 v9, 0x2

    .line 311
    sub-int/2addr v1, v6

    .line 312
    div-int/2addr v1, v9

    .line 313
    iget v5, v0, Ll/tdg0;->A:I

    .line 314
    .line 315
    add-int/2addr v1, v5

    .line 316
    add-int v5, v1, v6

    .line 317
    .line 318
    :goto_8
    sub-int v6, v5, v1

    .line 319
    .line 320
    if-gtz v6, :cond_e

    .line 321
    .line 322
    const-string v0, "Skipped drawing subtitle cue (invalid horizontal positioning)"

    .line 323
    .line 324
    move-object/from16 v1, v20

    .line 325
    .line 326
    invoke-static {v1, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    :cond_e
    iget v5, v0, Ll/tdg0;->l:F

    .line 331
    .line 332
    cmpl-float v8, v5, v17

    .line 333
    .line 334
    if-eqz v8, :cond_14

    .line 335
    .line 336
    iget v8, v0, Ll/tdg0;->m:I

    .line 337
    .line 338
    if-nez v8, :cond_10

    .line 339
    .line 340
    int-to-float v2, v2

    .line 341
    mul-float/2addr v2, v5

    .line 342
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 343
    .line 344
    .line 345
    move-result v2

    .line 346
    iget v5, v0, Ll/tdg0;->B:I

    .line 347
    .line 348
    add-int/2addr v2, v5

    .line 349
    iget v5, v0, Ll/tdg0;->n:I

    .line 350
    .line 351
    const/4 v9, 0x2

    .line 352
    if-ne v5, v9, :cond_f

    .line 353
    .line 354
    goto :goto_9

    .line 355
    :cond_f
    if-ne v5, v15, :cond_12

    .line 356
    .line 357
    mul-int/lit8 v2, v2, 0x2

    .line 358
    .line 359
    sub-int/2addr v2, v3

    .line 360
    div-int/2addr v2, v9

    .line 361
    goto :goto_a

    .line 362
    :cond_10
    iget-object v2, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 363
    .line 364
    const/4 v5, 0x0

    .line 365
    invoke-virtual {v2, v5}, Landroid/text/Layout;->getLineBottom(I)I

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    iget-object v8, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 370
    .line 371
    invoke-virtual {v8, v5}, Landroid/text/StaticLayout;->getLineTop(I)I

    .line 372
    .line 373
    .line 374
    move-result v5

    .line 375
    sub-int/2addr v2, v5

    .line 376
    iget v5, v0, Ll/tdg0;->l:F

    .line 377
    .line 378
    cmpl-float v8, v5, v19

    .line 379
    .line 380
    if-ltz v8, :cond_11

    .line 381
    .line 382
    int-to-float v2, v2

    .line 383
    mul-float/2addr v5, v2

    .line 384
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    iget v5, v0, Ll/tdg0;->B:I

    .line 389
    .line 390
    add-int/2addr v2, v5

    .line 391
    goto :goto_a

    .line 392
    :cond_11
    const/high16 v8, 0x3f800000    # 1.0f

    .line 393
    .line 394
    add-float/2addr v5, v8

    .line 395
    int-to-float v2, v2

    .line 396
    mul-float/2addr v5, v2

    .line 397
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    iget v5, v0, Ll/tdg0;->D:I

    .line 402
    .line 403
    add-int/2addr v2, v5

    .line 404
    :goto_9
    sub-int/2addr v2, v3

    .line 405
    :cond_12
    :goto_a
    add-int v5, v2, v3

    .line 406
    .line 407
    iget v8, v0, Ll/tdg0;->D:I

    .line 408
    .line 409
    if-le v5, v8, :cond_13

    .line 410
    .line 411
    sub-int v2, v8, v3

    .line 412
    .line 413
    goto :goto_b

    .line 414
    :cond_13
    iget v3, v0, Ll/tdg0;->B:I

    .line 415
    .line 416
    if-ge v2, v3, :cond_15

    .line 417
    .line 418
    move v2, v3

    .line 419
    goto :goto_b

    .line 420
    :cond_14
    iget v5, v0, Ll/tdg0;->D:I

    .line 421
    .line 422
    sub-int/2addr v5, v3

    .line 423
    int-to-float v2, v2

    .line 424
    iget v3, v0, Ll/tdg0;->z:F

    .line 425
    .line 426
    mul-float/2addr v2, v3

    .line 427
    float-to-int v2, v2

    .line 428
    sub-int v2, v5, v2

    .line 429
    .line 430
    :cond_15
    :goto_b
    new-instance v3, Landroid/text/StaticLayout;

    .line 431
    .line 432
    iget-object v5, v0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 433
    .line 434
    iget v8, v0, Ll/tdg0;->d:F

    .line 435
    .line 436
    iget v9, v0, Ll/tdg0;->e:F

    .line 437
    .line 438
    const/4 v10, 0x1

    .line 439
    invoke-direct/range {v3 .. v10}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 440
    .line 441
    .line 442
    move/from16 v19, v6

    .line 443
    .line 444
    iput-object v3, v0, Ll/tdg0;->E:Landroid/text/StaticLayout;

    .line 445
    .line 446
    new-instance v16, Landroid/text/StaticLayout;

    .line 447
    .line 448
    iget-object v3, v0, Ll/tdg0;->f:Landroid/text/TextPaint;

    .line 449
    .line 450
    iget v4, v0, Ll/tdg0;->d:F

    .line 451
    .line 452
    iget v5, v0, Ll/tdg0;->e:F

    .line 453
    .line 454
    const/16 v23, 0x1

    .line 455
    .line 456
    move/from16 v21, v4

    .line 457
    .line 458
    move/from16 v22, v5

    .line 459
    .line 460
    move-object/from16 v20, v7

    .line 461
    .line 462
    move-object/from16 v17, v18

    .line 463
    .line 464
    move-object/from16 v18, v3

    .line 465
    .line 466
    invoke-direct/range {v16 .. v23}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 467
    .line 468
    .line 469
    move-object/from16 v3, v16

    .line 470
    .line 471
    iput-object v3, v0, Ll/tdg0;->F:Landroid/text/StaticLayout;

    .line 472
    .line 473
    iput v1, v0, Ll/tdg0;->G:I

    .line 474
    .line 475
    iput v2, v0, Ll/tdg0;->H:I

    .line 476
    .line 477
    iput v11, v0, Ll/tdg0;->I:I

    .line 478
    .line 479
    return-void
.end method
