.class public Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:I

.field public c:F

.field public d:I

.field public e:F

.field public f:Landroid/graphics/Path;

.field public g:Landroid/graphics/RectF;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41000000    # 8.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    .line 19
    .line 20
    const p1, -0x777778

    .line 21
    .line 22
    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41000000    # 8.0f

    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    const/4 p1, 0x0

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    const/4 p2, 0x0

    .line 32
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    const p1, -0x777778

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41000000    # 8.0f

    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    const/4 p2, 0x0

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    const p1, -0x777778

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->e:I

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    const v1, 0x40490fdb    # (float)Math.PI

    .line 9
    .line 10
    .line 11
    mul-float/2addr v0, v1

    .line 12
    const/high16 v1, 0x40000000    # 2.0f

    .line 13
    .line 14
    div-float/2addr v0, v1

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/c9c0;->I:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 28
    .line 29
    new-instance v0, Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 35
    .line 36
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Landroid/graphics/Path;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 47
    .line 48
    new-instance v0, Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 54
    .line 55
    return-void
.end method

.method public b(F)F
    .locals 1

    .line 1
    const/high16 v0, 0x42b40000    # 90.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 5
    .line 6
    div-float/2addr p1, p0

    .line 7
    return p1
.end method

.method public c(FIII)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/high16 v3, -0x10000

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    int-to-float v3, v3

    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 26
    .line 27
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 28
    .line 29
    .line 30
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 31
    .line 32
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 33
    .line 34
    int-to-float v5, v5

    .line 35
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    .line 37
    .line 38
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 39
    .line 40
    int-to-float v5, v4

    .line 41
    const v6, 0x40490fdb    # (float)Math.PI

    .line 42
    .line 43
    .line 44
    mul-float/2addr v5, v6

    .line 45
    const/high16 v6, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v5, v6

    .line 48
    iput v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 49
    .line 50
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 51
    .line 52
    int-to-float v7, v5

    .line 53
    sub-float v7, v2, v7

    .line 54
    .line 55
    mul-int/lit8 v8, v4, 0x2

    .line 56
    .line 57
    int-to-float v8, v8

    .line 58
    sub-float/2addr v7, v8

    .line 59
    int-to-float v5, v5

    .line 60
    sub-float v5, v3, v5

    .line 61
    .line 62
    mul-int/lit8 v8, v4, 0x2

    .line 63
    .line 64
    int-to-float v8, v8

    .line 65
    sub-float/2addr v5, v8

    .line 66
    iget v8, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    .line 67
    .line 68
    float-to-double v8, v8

    .line 69
    const-wide v10, 0x401921fb54442d18L    # 6.283185307179586

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    int-to-double v12, v4

    .line 75
    mul-double/2addr v12, v10

    .line 76
    mul-float v4, v7, v6

    .line 77
    .line 78
    float-to-double v10, v4

    .line 79
    add-double/2addr v12, v10

    .line 80
    mul-float v4, v5, v6

    .line 81
    .line 82
    float-to-double v10, v4

    .line 83
    add-double/2addr v12, v10

    .line 84
    mul-double/2addr v8, v12

    .line 85
    double-to-float v4, v8

    .line 86
    const/high16 v8, 0x42c80000    # 100.0f

    .line 87
    .line 88
    div-float/2addr v4, v8

    .line 89
    const/4 v8, 0x0

    .line 90
    cmpg-float v8, v4, v8

    .line 91
    .line 92
    if-gez v8, :cond_0

    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 96
    .line 97
    iget v9, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->h:I

    .line 98
    .line 99
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 100
    .line 101
    .line 102
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 103
    .line 104
    div-float v9, v2, v6

    .line 105
    .line 106
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 107
    .line 108
    int-to-float v10, v10

    .line 109
    div-float/2addr v10, v6

    .line 110
    sub-float v10, v3, v10

    .line 111
    .line 112
    invoke-virtual {v8, v9, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 113
    .line 114
    .line 115
    div-float v8, v7, v6

    .line 116
    .line 117
    cmpg-float v10, v4, v8

    .line 118
    .line 119
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 120
    .line 121
    if-gez v10, :cond_1

    .line 122
    .line 123
    sub-float/2addr v9, v4

    .line 124
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 125
    .line 126
    int-to-float v2, v2

    .line 127
    div-float/2addr v2, v6

    .line 128
    sub-float/2addr v3, v2

    .line 129
    invoke-virtual {v11, v9, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 130
    .line 131
    .line 132
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_1
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 141
    .line 142
    int-to-float v10, v10

    .line 143
    iget v12, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 144
    .line 145
    int-to-float v12, v12

    .line 146
    div-float/2addr v12, v6

    .line 147
    sub-float v12, v3, v12

    .line 148
    .line 149
    invoke-virtual {v11, v10, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 150
    .line 151
    .line 152
    sub-float/2addr v4, v8

    .line 153
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 154
    .line 155
    iget v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 156
    .line 157
    int-to-float v12, v11

    .line 158
    div-float/2addr v12, v6

    .line 159
    iget v13, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 160
    .line 161
    mul-int/lit8 v14, v13, 0x2

    .line 162
    .line 163
    int-to-float v14, v14

    .line 164
    sub-float v14, v3, v14

    .line 165
    .line 166
    int-to-float v15, v11

    .line 167
    div-float/2addr v15, v6

    .line 168
    sub-float/2addr v14, v15

    .line 169
    int-to-float v15, v11

    .line 170
    div-float/2addr v15, v6

    .line 171
    mul-int/lit8 v13, v13, 0x2

    .line 172
    .line 173
    int-to-float v13, v13

    .line 174
    add-float/2addr v15, v13

    .line 175
    int-to-float v11, v11

    .line 176
    div-float/2addr v11, v6

    .line 177
    sub-float v11, v3, v11

    .line 178
    .line 179
    invoke-virtual {v10, v12, v14, v15, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 180
    .line 181
    .line 182
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 183
    .line 184
    cmpg-float v10, v4, v10

    .line 185
    .line 186
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 187
    .line 188
    const/high16 v12, 0x42b40000    # 90.0f

    .line 189
    .line 190
    if-gez v10, :cond_2

    .line 191
    .line 192
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 193
    .line 194
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b(F)F

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    invoke-virtual {v11, v2, v12, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 199
    .line 200
    .line 201
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 202
    .line 203
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 204
    .line 205
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_2
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 210
    .line 211
    invoke-virtual {v11, v10, v12, v12}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 212
    .line 213
    .line 214
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 215
    .line 216
    sub-float/2addr v4, v10

    .line 217
    cmpg-float v10, v4, v5

    .line 218
    .line 219
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 220
    .line 221
    if-gez v10, :cond_3

    .line 222
    .line 223
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 224
    .line 225
    int-to-float v5, v2

    .line 226
    div-float/2addr v5, v6

    .line 227
    int-to-float v2, v2

    .line 228
    div-float/2addr v2, v6

    .line 229
    sub-float/2addr v3, v2

    .line 230
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 231
    .line 232
    int-to-float v2, v2

    .line 233
    sub-float/2addr v3, v2

    .line 234
    sub-float/2addr v3, v4

    .line 235
    invoke-virtual {v11, v5, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 236
    .line 237
    .line 238
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 239
    .line 240
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 241
    .line 242
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_3
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 247
    .line 248
    int-to-float v13, v10

    .line 249
    div-float/2addr v13, v6

    .line 250
    int-to-float v10, v10

    .line 251
    div-float/2addr v10, v6

    .line 252
    iget v14, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 253
    .line 254
    int-to-float v14, v14

    .line 255
    add-float/2addr v10, v14

    .line 256
    invoke-virtual {v11, v13, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 257
    .line 258
    .line 259
    sub-float/2addr v4, v5

    .line 260
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 261
    .line 262
    iget v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 263
    .line 264
    int-to-float v13, v11

    .line 265
    div-float/2addr v13, v6

    .line 266
    int-to-float v14, v11

    .line 267
    div-float/2addr v14, v6

    .line 268
    int-to-float v15, v11

    .line 269
    div-float/2addr v15, v6

    .line 270
    move/from16 v16, v6

    .line 271
    .line 272
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 273
    .line 274
    mul-int/lit8 v12, v6, 0x2

    .line 275
    .line 276
    int-to-float v12, v12

    .line 277
    add-float/2addr v15, v12

    .line 278
    mul-int/lit8 v6, v6, 0x2

    .line 279
    .line 280
    int-to-float v6, v6

    .line 281
    int-to-float v11, v11

    .line 282
    div-float v11, v11, v16

    .line 283
    .line 284
    add-float/2addr v6, v11

    .line 285
    invoke-virtual {v10, v13, v14, v15, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 286
    .line 287
    .line 288
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 289
    .line 290
    cmpg-float v6, v4, v6

    .line 291
    .line 292
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 293
    .line 294
    const/high16 v11, 0x43340000    # 180.0f

    .line 295
    .line 296
    if-gez v6, :cond_4

    .line 297
    .line 298
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 299
    .line 300
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b(F)F

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    invoke-virtual {v10, v2, v11, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 305
    .line 306
    .line 307
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 308
    .line 309
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 310
    .line 311
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :cond_4
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 316
    .line 317
    const/high16 v12, 0x42b40000    # 90.0f

    .line 318
    .line 319
    invoke-virtual {v10, v6, v11, v12}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 320
    .line 321
    .line 322
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 323
    .line 324
    sub-float/2addr v4, v6

    .line 325
    cmpg-float v6, v4, v7

    .line 326
    .line 327
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 328
    .line 329
    if-gez v6, :cond_5

    .line 330
    .line 331
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 332
    .line 333
    int-to-float v3, v2

    .line 334
    div-float v3, v3, v16

    .line 335
    .line 336
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 337
    .line 338
    int-to-float v5, v5

    .line 339
    add-float/2addr v3, v5

    .line 340
    add-float/2addr v3, v4

    .line 341
    int-to-float v2, v2

    .line 342
    div-float v2, v2, v16

    .line 343
    .line 344
    invoke-virtual {v10, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 345
    .line 346
    .line 347
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 348
    .line 349
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 350
    .line 351
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 352
    .line 353
    .line 354
    return-void

    .line 355
    :cond_5
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 356
    .line 357
    int-to-float v11, v6

    .line 358
    div-float v11, v11, v16

    .line 359
    .line 360
    sub-float v11, v2, v11

    .line 361
    .line 362
    iget v12, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 363
    .line 364
    int-to-float v12, v12

    .line 365
    sub-float/2addr v11, v12

    .line 366
    int-to-float v6, v6

    .line 367
    div-float v6, v6, v16

    .line 368
    .line 369
    invoke-virtual {v10, v11, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 370
    .line 371
    .line 372
    sub-float/2addr v4, v7

    .line 373
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 374
    .line 375
    iget v7, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 376
    .line 377
    mul-int/lit8 v10, v7, 0x2

    .line 378
    .line 379
    int-to-float v10, v10

    .line 380
    sub-float v10, v2, v10

    .line 381
    .line 382
    iget v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 383
    .line 384
    int-to-float v12, v11

    .line 385
    div-float v12, v12, v16

    .line 386
    .line 387
    sub-float/2addr v10, v12

    .line 388
    int-to-float v12, v11

    .line 389
    div-float v12, v12, v16

    .line 390
    .line 391
    int-to-float v13, v11

    .line 392
    div-float v13, v13, v16

    .line 393
    .line 394
    sub-float v13, v2, v13

    .line 395
    .line 396
    mul-int/lit8 v7, v7, 0x2

    .line 397
    .line 398
    int-to-float v7, v7

    .line 399
    int-to-float v11, v11

    .line 400
    div-float v11, v11, v16

    .line 401
    .line 402
    add-float/2addr v7, v11

    .line 403
    invoke-virtual {v6, v10, v12, v13, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 404
    .line 405
    .line 406
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 407
    .line 408
    cmpg-float v6, v4, v6

    .line 409
    .line 410
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 411
    .line 412
    const/high16 v10, 0x43870000    # 270.0f

    .line 413
    .line 414
    if-gez v6, :cond_6

    .line 415
    .line 416
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 417
    .line 418
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b(F)F

    .line 419
    .line 420
    .line 421
    move-result v3

    .line 422
    invoke-virtual {v7, v2, v10, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 423
    .line 424
    .line 425
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 426
    .line 427
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 428
    .line 429
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 430
    .line 431
    .line 432
    return-void

    .line 433
    :cond_6
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 434
    .line 435
    const/high16 v12, 0x42b40000    # 90.0f

    .line 436
    .line 437
    invoke-virtual {v7, v6, v10, v12}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 438
    .line 439
    .line 440
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 441
    .line 442
    sub-float/2addr v4, v6

    .line 443
    cmpg-float v6, v4, v5

    .line 444
    .line 445
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 446
    .line 447
    if-gez v6, :cond_7

    .line 448
    .line 449
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 450
    .line 451
    int-to-float v5, v3

    .line 452
    div-float v5, v5, v16

    .line 453
    .line 454
    sub-float/2addr v2, v5

    .line 455
    int-to-float v3, v3

    .line 456
    div-float v3, v3, v16

    .line 457
    .line 458
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 459
    .line 460
    int-to-float v5, v5

    .line 461
    add-float/2addr v3, v5

    .line 462
    add-float/2addr v3, v4

    .line 463
    invoke-virtual {v7, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 464
    .line 465
    .line 466
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 467
    .line 468
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 469
    .line 470
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 471
    .line 472
    .line 473
    return-void

    .line 474
    :cond_7
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 475
    .line 476
    int-to-float v10, v6

    .line 477
    div-float v10, v10, v16

    .line 478
    .line 479
    sub-float v10, v2, v10

    .line 480
    .line 481
    int-to-float v6, v6

    .line 482
    div-float v6, v6, v16

    .line 483
    .line 484
    sub-float v6, v3, v6

    .line 485
    .line 486
    iget v11, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 487
    .line 488
    int-to-float v11, v11

    .line 489
    sub-float/2addr v6, v11

    .line 490
    invoke-virtual {v7, v10, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 491
    .line 492
    .line 493
    sub-float/2addr v4, v5

    .line 494
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 495
    .line 496
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 497
    .line 498
    mul-int/lit8 v7, v6, 0x2

    .line 499
    .line 500
    int-to-float v7, v7

    .line 501
    sub-float v7, v2, v7

    .line 502
    .line 503
    iget v10, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 504
    .line 505
    int-to-float v11, v10

    .line 506
    div-float v11, v11, v16

    .line 507
    .line 508
    sub-float/2addr v7, v11

    .line 509
    int-to-float v11, v10

    .line 510
    div-float v11, v11, v16

    .line 511
    .line 512
    sub-float v11, v3, v11

    .line 513
    .line 514
    mul-int/lit8 v6, v6, 0x2

    .line 515
    .line 516
    int-to-float v6, v6

    .line 517
    sub-float/2addr v11, v6

    .line 518
    int-to-float v6, v10

    .line 519
    div-float v6, v6, v16

    .line 520
    .line 521
    sub-float v6, v2, v6

    .line 522
    .line 523
    int-to-float v10, v10

    .line 524
    div-float v10, v10, v16

    .line 525
    .line 526
    sub-float v10, v3, v10

    .line 527
    .line 528
    invoke-virtual {v5, v7, v11, v6, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 529
    .line 530
    .line 531
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 532
    .line 533
    cmpg-float v5, v4, v5

    .line 534
    .line 535
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 536
    .line 537
    const/high16 v7, 0x43b40000    # 360.0f

    .line 538
    .line 539
    if-gez v5, :cond_8

    .line 540
    .line 541
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 542
    .line 543
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b(F)F

    .line 544
    .line 545
    .line 546
    move-result v3

    .line 547
    invoke-virtual {v6, v2, v7, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 548
    .line 549
    .line 550
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 551
    .line 552
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 553
    .line 554
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 555
    .line 556
    .line 557
    return-void

    .line 558
    :cond_8
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->g:Landroid/graphics/RectF;

    .line 559
    .line 560
    const/high16 v12, 0x42b40000    # 90.0f

    .line 561
    .line 562
    invoke-virtual {v6, v5, v7, v12}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 563
    .line 564
    .line 565
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->c:F

    .line 566
    .line 567
    sub-float/2addr v4, v5

    .line 568
    cmpg-float v5, v4, v8

    .line 569
    .line 570
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 571
    .line 572
    if-gez v5, :cond_9

    .line 573
    .line 574
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 575
    .line 576
    int-to-float v7, v5

    .line 577
    div-float v7, v7, v16

    .line 578
    .line 579
    sub-float/2addr v2, v7

    .line 580
    iget v7, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->b:I

    .line 581
    .line 582
    int-to-float v7, v7

    .line 583
    sub-float/2addr v2, v7

    .line 584
    sub-float/2addr v2, v4

    .line 585
    int-to-float v4, v5

    .line 586
    div-float v4, v4, v16

    .line 587
    .line 588
    sub-float/2addr v3, v4

    .line 589
    invoke-virtual {v6, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 590
    .line 591
    .line 592
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 593
    .line 594
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 595
    .line 596
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 597
    .line 598
    .line 599
    return-void

    .line 600
    :cond_9
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->d:I

    .line 601
    .line 602
    int-to-float v2, v2

    .line 603
    div-float v2, v2, v16

    .line 604
    .line 605
    sub-float/2addr v3, v2

    .line 606
    invoke-virtual {v6, v9, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 607
    .line 608
    .line 609
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->f:Landroid/graphics/Path;

    .line 610
    .line 611
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->a:Landroid/graphics/Paint;

    .line 612
    .line 613
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 614
    .line 615
    .line 616
    return-void
.end method

.method public setData(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;->e:F

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
