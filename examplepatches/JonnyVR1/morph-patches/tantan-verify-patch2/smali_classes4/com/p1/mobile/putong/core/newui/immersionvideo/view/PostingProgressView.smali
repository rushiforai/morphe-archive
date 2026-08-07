.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Landroid/graphics/Paint;

.field public final c:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public final d:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public final e:I

.field public final f:I

.field public final g:Landroid/graphics/RectF;

.field public h:Landroid/graphics/Path;

.field public final i:Landroid/graphics/Path;

.field public j:I

.field public final k:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 58
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a:F

    .line 6
    .line 7
    const p1, 0x4dffffff    # 5.3687088E8f

    .line 8
    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->c:I

    .line 11
    .line 12
    const p1, -0x180e2

    .line 13
    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->d:I

    .line 16
    .line 17
    const/high16 p1, 0x3fc00000    # 1.5f

    .line 18
    .line 19
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 24
    .line 25
    const/high16 p1, 0x41380000    # 11.5f

    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 32
    .line 33
    new-instance p1, Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 39
    .line 40
    new-instance p1, Landroid/graphics/Path;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 46
    .line 47
    new-instance p1, Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a()V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 27
    .line 28
    mul-int/lit8 v1, v1, 0x2

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 35
    .line 36
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public getProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 9
    .line 10
    const v1, 0x4dffffff    # 5.3687088E8f

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->h:Landroid/graphics/Path;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a:F

    .line 24
    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    cmpl-float v0, v0, v1

    .line 28
    .line 29
    const v1, -0x180e2

    .line 30
    .line 31
    .line 32
    if-ltz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->h:Landroid/graphics/Path;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 60
    .line 61
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 62
    .line 63
    add-int/2addr v1, v2

    .line 64
    int-to-float v1, v1

    .line 65
    int-to-float v2, v2

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 67
    .line 68
    .line 69
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->j:I

    .line 70
    .line 71
    int-to-float v0, v0

    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a:F

    .line 73
    .line 74
    mul-float/2addr v0, v1

    .line 75
    float-to-int v0, v0

    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 81
    .line 82
    mul-int/lit8 v2, v2, 0x2

    .line 83
    .line 84
    sub-int/2addr v1, v2

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 90
    .line 91
    mul-int/lit8 v3, v3, 0x2

    .line 92
    .line 93
    sub-int/2addr v2, v3

    .line 94
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 95
    .line 96
    mul-int/lit8 v4, v3, 0x2

    .line 97
    .line 98
    sub-int v4, v1, v4

    .line 99
    .line 100
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 101
    .line 102
    const/4 v6, 0x0

    .line 103
    if-ge v0, v4, :cond_2

    .line 104
    .line 105
    int-to-float v0, v0

    .line 106
    invoke-virtual {v5, v0, v6}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 112
    .line 113
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    mul-int/lit8 v3, v3, 0x2

    .line 118
    .line 119
    sub-int v3, v1, v3

    .line 120
    .line 121
    int-to-float v3, v3

    .line 122
    invoke-virtual {v5, v3, v6}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 123
    .line 124
    .line 125
    sub-int/2addr v0, v1

    .line 126
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 127
    .line 128
    mul-int/lit8 v3, v3, 0x2

    .line 129
    .line 130
    add-int/2addr v0, v3

    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 132
    .line 133
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 134
    .line 135
    int-to-float v4, v4

    .line 136
    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 143
    .line 144
    sub-int/2addr v4, v5

    .line 145
    int-to-float v4, v4

    .line 146
    iput v4, v3, Landroid/graphics/RectF;->right:F

    .line 147
    .line 148
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 149
    .line 150
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 151
    .line 152
    iget v5, v4, Landroid/graphics/RectF;->right:F

    .line 153
    .line 154
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 155
    .line 156
    mul-int/lit8 v8, v7, 0x2

    .line 157
    .line 158
    int-to-float v8, v8

    .line 159
    sub-float/2addr v5, v8

    .line 160
    iput v5, v3, Landroid/graphics/RectF;->left:F

    .line 161
    .line 162
    iget v4, v4, Landroid/graphics/RectF;->top:F

    .line 163
    .line 164
    mul-int/lit8 v5, v7, 0x2

    .line 165
    .line 166
    int-to-float v5, v5

    .line 167
    add-float/2addr v4, v5

    .line 168
    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 169
    .line 170
    mul-int/lit8 v4, v7, 0x2

    .line 171
    .line 172
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 173
    .line 174
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 175
    .line 176
    const/4 v9, 0x1

    .line 177
    const/high16 v10, 0x42b40000    # 90.0f

    .line 178
    .line 179
    if-ge v0, v4, :cond_3

    .line 180
    .line 181
    int-to-float v0, v0

    .line 182
    mul-float/2addr v0, v10

    .line 183
    mul-int/lit8 v7, v7, 0x2

    .line 184
    .line 185
    int-to-float v1, v7

    .line 186
    div-float/2addr v0, v1

    .line 187
    invoke-virtual {v5, v3, v8, v0, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 193
    .line 194
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_3
    invoke-virtual {v5, v3, v8, v10, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 199
    .line 200
    .line 201
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 202
    .line 203
    mul-int/lit8 v4, v3, 0x2

    .line 204
    .line 205
    sub-int/2addr v0, v4

    .line 206
    mul-int/lit8 v4, v3, 0x2

    .line 207
    .line 208
    sub-int v4, v2, v4

    .line 209
    .line 210
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 211
    .line 212
    if-ge v0, v4, :cond_4

    .line 213
    .line 214
    int-to-float v0, v0

    .line 215
    invoke-virtual {v5, v6, v0}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 221
    .line 222
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_4
    mul-int/lit8 v3, v3, 0x2

    .line 227
    .line 228
    sub-int v3, v2, v3

    .line 229
    .line 230
    int-to-float v3, v3

    .line 231
    invoke-virtual {v5, v6, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 232
    .line 233
    .line 234
    sub-int/2addr v0, v2

    .line 235
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 236
    .line 237
    mul-int/lit8 v3, v3, 0x2

    .line 238
    .line 239
    add-int/2addr v0, v3

    .line 240
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 241
    .line 242
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 247
    .line 248
    sub-int/2addr v4, v5

    .line 249
    int-to-float v4, v4

    .line 250
    iput v4, v3, Landroid/graphics/RectF;->right:F

    .line 251
    .line 252
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 259
    .line 260
    sub-int/2addr v4, v5

    .line 261
    int-to-float v4, v4

    .line 262
    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 263
    .line 264
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 265
    .line 266
    iget v4, v3, Landroid/graphics/RectF;->bottom:F

    .line 267
    .line 268
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 269
    .line 270
    mul-int/lit8 v7, v5, 0x2

    .line 271
    .line 272
    int-to-float v7, v7

    .line 273
    sub-float/2addr v4, v7

    .line 274
    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 275
    .line 276
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 277
    .line 278
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 279
    .line 280
    mul-int/lit8 v7, v5, 0x2

    .line 281
    .line 282
    int-to-float v7, v7

    .line 283
    sub-float/2addr v4, v7

    .line 284
    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 285
    .line 286
    mul-int/lit8 v4, v5, 0x2

    .line 287
    .line 288
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 289
    .line 290
    if-ge v0, v4, :cond_5

    .line 291
    .line 292
    int-to-float v0, v0

    .line 293
    mul-float/2addr v0, v10

    .line 294
    mul-int/lit8 v5, v5, 0x2

    .line 295
    .line 296
    int-to-float v1, v5

    .line 297
    div-float/2addr v0, v1

    .line 298
    invoke-virtual {v7, v3, v6, v0, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 302
    .line 303
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 304
    .line 305
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :cond_5
    invoke-virtual {v7, v3, v6, v10, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 310
    .line 311
    .line 312
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 313
    .line 314
    mul-int/lit8 v4, v3, 0x2

    .line 315
    .line 316
    sub-int/2addr v0, v4

    .line 317
    mul-int/lit8 v4, v3, 0x2

    .line 318
    .line 319
    sub-int v4, v1, v4

    .line 320
    .line 321
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 322
    .line 323
    if-ge v0, v4, :cond_6

    .line 324
    .line 325
    neg-int v0, v0

    .line 326
    int-to-float v0, v0

    .line 327
    invoke-virtual {v5, v0, v6}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 328
    .line 329
    .line 330
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 331
    .line 332
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 333
    .line 334
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_6
    neg-int v4, v1

    .line 339
    mul-int/lit8 v3, v3, 0x2

    .line 340
    .line 341
    add-int/2addr v4, v3

    .line 342
    int-to-float v3, v4

    .line 343
    invoke-virtual {v5, v3, v6}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 344
    .line 345
    .line 346
    sub-int/2addr v0, v1

    .line 347
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 348
    .line 349
    mul-int/lit8 v1, v1, 0x2

    .line 350
    .line 351
    add-int/2addr v0, v1

    .line 352
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 353
    .line 354
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 355
    .line 356
    int-to-float v3, v3

    .line 357
    iput v3, v1, Landroid/graphics/RectF;->left:F

    .line 358
    .line 359
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 364
    .line 365
    sub-int/2addr v3, v4

    .line 366
    int-to-float v3, v3

    .line 367
    iput v3, v1, Landroid/graphics/RectF;->bottom:F

    .line 368
    .line 369
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 370
    .line 371
    iget v3, v1, Landroid/graphics/RectF;->bottom:F

    .line 372
    .line 373
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 374
    .line 375
    mul-int/lit8 v5, v4, 0x2

    .line 376
    .line 377
    int-to-float v5, v5

    .line 378
    sub-float/2addr v3, v5

    .line 379
    iput v3, v1, Landroid/graphics/RectF;->top:F

    .line 380
    .line 381
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 382
    .line 383
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 384
    .line 385
    mul-int/lit8 v5, v4, 0x2

    .line 386
    .line 387
    int-to-float v5, v5

    .line 388
    add-float/2addr v3, v5

    .line 389
    iput v3, v1, Landroid/graphics/RectF;->right:F

    .line 390
    .line 391
    mul-int/lit8 v3, v4, 0x2

    .line 392
    .line 393
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 394
    .line 395
    if-ge v0, v3, :cond_7

    .line 396
    .line 397
    int-to-float v0, v0

    .line 398
    mul-float/2addr v0, v10

    .line 399
    mul-int/lit8 v4, v4, 0x2

    .line 400
    .line 401
    int-to-float v2, v4

    .line 402
    div-float/2addr v0, v2

    .line 403
    invoke-virtual {v5, v1, v10, v0, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 407
    .line 408
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 409
    .line 410
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :cond_7
    invoke-virtual {v5, v1, v10, v10, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 415
    .line 416
    .line 417
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 418
    .line 419
    mul-int/lit8 v3, v1, 0x2

    .line 420
    .line 421
    sub-int/2addr v0, v3

    .line 422
    mul-int/lit8 v3, v1, 0x2

    .line 423
    .line 424
    sub-int v3, v2, v3

    .line 425
    .line 426
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 427
    .line 428
    if-ge v0, v3, :cond_8

    .line 429
    .line 430
    neg-int v0, v0

    .line 431
    int-to-float v0, v0

    .line 432
    invoke-virtual {v4, v6, v0}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 433
    .line 434
    .line 435
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 436
    .line 437
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 438
    .line 439
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 440
    .line 441
    .line 442
    return-void

    .line 443
    :cond_8
    neg-int v3, v2

    .line 444
    mul-int/lit8 v1, v1, 0x2

    .line 445
    .line 446
    add-int/2addr v3, v1

    .line 447
    int-to-float v1, v3

    .line 448
    invoke-virtual {v4, v6, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 449
    .line 450
    .line 451
    sub-int/2addr v0, v2

    .line 452
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 453
    .line 454
    mul-int/lit8 v2, v1, 0x2

    .line 455
    .line 456
    add-int/2addr v0, v2

    .line 457
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->k:Landroid/graphics/RectF;

    .line 458
    .line 459
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 460
    .line 461
    int-to-float v4, v3

    .line 462
    iput v4, v2, Landroid/graphics/RectF;->left:F

    .line 463
    .line 464
    int-to-float v3, v3

    .line 465
    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 466
    .line 467
    mul-int/lit8 v4, v1, 0x2

    .line 468
    .line 469
    int-to-float v4, v4

    .line 470
    add-float/2addr v3, v4

    .line 471
    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 472
    .line 473
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 474
    .line 475
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 476
    .line 477
    mul-int/lit8 v4, v1, 0x2

    .line 478
    .line 479
    int-to-float v4, v4

    .line 480
    add-float/2addr v3, v4

    .line 481
    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 482
    .line 483
    mul-int/lit8 v3, v1, 0x2

    .line 484
    .line 485
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 486
    .line 487
    const/high16 v5, 0x43340000    # 180.0f

    .line 488
    .line 489
    if-ge v0, v3, :cond_9

    .line 490
    .line 491
    int-to-float v0, v0

    .line 492
    mul-float/2addr v0, v10

    .line 493
    mul-int/lit8 v1, v1, 0x2

    .line 494
    .line 495
    int-to-float v1, v1

    .line 496
    div-float/2addr v0, v1

    .line 497
    invoke-virtual {v4, v2, v5, v0, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 498
    .line 499
    .line 500
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 501
    .line 502
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 503
    .line 504
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 505
    .line 506
    .line 507
    return-void

    .line 508
    :cond_9
    invoke-virtual {v4, v2, v5, v10, v9}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 509
    .line 510
    .line 511
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->i:Landroid/graphics/Path;

    .line 512
    .line 513
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->b:Landroid/graphics/Paint;

    .line 514
    .line 515
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 516
    .line 517
    .line 518
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-lez p1, :cond_0

    .line 5
    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget p4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->e:I

    .line 11
    .line 12
    int-to-float v0, p4

    .line 13
    iput v0, p3, Landroid/graphics/RectF;->top:F

    .line 14
    .line 15
    int-to-float v0, p4

    .line 16
    iput v0, p3, Landroid/graphics/RectF;->left:F

    .line 17
    .line 18
    sub-int v0, p1, p4

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    iput v0, p3, Landroid/graphics/RectF;->right:F

    .line 22
    .line 23
    sub-int p4, p2, p4

    .line 24
    .line 25
    int-to-float p4, p4

    .line 26
    iput p4, p3, Landroid/graphics/RectF;->bottom:F

    .line 27
    .line 28
    new-instance p3, Landroid/graphics/Path;

    .line 29
    .line 30
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->h:Landroid/graphics/Path;

    .line 34
    .line 35
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->g:Landroid/graphics/RectF;

    .line 36
    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->f:I

    .line 38
    .line 39
    int-to-float v1, v0

    .line 40
    int-to-float v0, v0

    .line 41
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 42
    .line 43
    invoke-virtual {p3, p4, v1, v0, v2}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 44
    .line 45
    .line 46
    mul-int/lit8 p1, p1, 0x2

    .line 47
    .line 48
    mul-int/lit8 p2, p2, 0x2

    .line 49
    .line 50
    add-int/2addr p1, p2

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->j:I

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public setProgress(F)V
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/PostingProgressView;->a:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
