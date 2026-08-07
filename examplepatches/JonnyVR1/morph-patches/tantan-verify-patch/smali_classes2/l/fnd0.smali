.class public Ll/fnd0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Ll/and0;


# instance fields
.field public final a:[F

.field public final b:[F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public c:[F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final d:Landroid/graphics/Paint;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public e:Z

.field public f:F

.field public g:F

.field public h:I

.field public i:Z

.field public j:Z

.field public final k:Landroid/graphics/Path;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final l:Landroid/graphics/Path;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public m:I

.field public final n:Landroid/graphics/RectF;

.field public o:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Ll/fnd0;->a:[F

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    iput-object v0, p0, Ll/fnd0;->b:[F

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/fnd0;->e:Z

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Ll/fnd0;->f:F

    .line 27
    .line 28
    iput v1, p0, Ll/fnd0;->g:F

    .line 29
    .line 30
    iput v0, p0, Ll/fnd0;->h:I

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/fnd0;->i:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/fnd0;->j:Z

    .line 35
    .line 36
    new-instance v1, Landroid/graphics/Path;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 42
    .line 43
    new-instance v1, Landroid/graphics/Path;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Ll/fnd0;->l:Landroid/graphics/Path;

    .line 49
    .line 50
    iput v0, p0, Ll/fnd0;->m:I

    .line 51
    .line 52
    new-instance v0, Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 58
    .line 59
    const/16 v0, 0xff

    .line 60
    .line 61
    iput v0, p0, Ll/fnd0;->o:I

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/fnd0;->i(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>([FI)V
    .locals 0

    .line 67
    invoke-direct {p0, p2}, Ll/fnd0;-><init>(I)V

    .line 68
    invoke-virtual {p0, p1}, Ll/fnd0;->n([F)V

    return-void
.end method

.method public static d(Landroid/graphics/drawable/ColorDrawable;)Ll/fnd0;
    .locals 1

    .line 1
    new-instance v0, Ll/fnd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-direct {v0, p0}, Ll/fnd0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method private j()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fnd0;->l:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p0, Ll/fnd0;->f:F

    .line 23
    .line 24
    const/high16 v2, 0x40000000    # 2.0f

    .line 25
    .line 26
    div-float v3, v1, v2

    .line 27
    .line 28
    div-float/2addr v1, v2

    .line 29
    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Ll/fnd0;->e:Z

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v3, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    div-float/2addr v0, v2

    .line 54
    iget-object v3, p0, Ll/fnd0;->l:Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v4, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 57
    .line 58
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    iget-object v5, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 69
    .line 70
    invoke-virtual {v3, v4, v5, v0, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_0
    move v0, v1

    .line 75
    :goto_0
    iget-object v3, p0, Ll/fnd0;->b:[F

    .line 76
    .line 77
    array-length v4, v3

    .line 78
    if-ge v0, v4, :cond_1

    .line 79
    .line 80
    iget-object v4, p0, Ll/fnd0;->a:[F

    .line 81
    .line 82
    aget v4, v4, v0

    .line 83
    .line 84
    iget v5, p0, Ll/fnd0;->g:F

    .line 85
    .line 86
    add-float/2addr v4, v5

    .line 87
    iget v5, p0, Ll/fnd0;->f:F

    .line 88
    .line 89
    div-float/2addr v5, v2

    .line 90
    sub-float/2addr v4, v5

    .line 91
    aput v4, v3, v0

    .line 92
    .line 93
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    iget-object v0, p0, Ll/fnd0;->l:Landroid/graphics/Path;

    .line 97
    .line 98
    iget-object v4, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 99
    .line 100
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 101
    .line 102
    invoke-virtual {v0, v4, v3, v5}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    iget-object v0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 106
    .line 107
    iget v3, p0, Ll/fnd0;->f:F

    .line 108
    .line 109
    neg-float v4, v3

    .line 110
    div-float/2addr v4, v2

    .line 111
    neg-float v3, v3

    .line 112
    div-float/2addr v3, v2

    .line 113
    invoke-virtual {v0, v4, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 114
    .line 115
    .line 116
    iget v0, p0, Ll/fnd0;->g:F

    .line 117
    .line 118
    iget-boolean v3, p0, Ll/fnd0;->i:Z

    .line 119
    .line 120
    if-eqz v3, :cond_2

    .line 121
    .line 122
    iget v3, p0, Ll/fnd0;->f:F

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_2
    const/4 v3, 0x0

    .line 126
    :goto_2
    add-float/2addr v0, v3

    .line 127
    iget-object v3, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 128
    .line 129
    invoke-virtual {v3, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 130
    .line 131
    .line 132
    iget-boolean v3, p0, Ll/fnd0;->e:Z

    .line 133
    .line 134
    if-eqz v3, :cond_3

    .line 135
    .line 136
    iget-object v1, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 137
    .line 138
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    iget-object v3, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 143
    .line 144
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    div-float/2addr v1, v2

    .line 153
    iget-object v2, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 154
    .line 155
    iget-object v3, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 156
    .line 157
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    iget-object v4, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 168
    .line 169
    invoke-virtual {v2, v3, v4, v1, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 170
    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_3
    iget-boolean v2, p0, Ll/fnd0;->i:Z

    .line 174
    .line 175
    if-eqz v2, :cond_6

    .line 176
    .line 177
    iget-object v2, p0, Ll/fnd0;->c:[F

    .line 178
    .line 179
    if-nez v2, :cond_4

    .line 180
    .line 181
    const/16 v2, 0x8

    .line 182
    .line 183
    new-array v2, v2, [F

    .line 184
    .line 185
    iput-object v2, p0, Ll/fnd0;->c:[F

    .line 186
    .line 187
    :cond_4
    :goto_3
    iget-object v2, p0, Ll/fnd0;->c:[F

    .line 188
    .line 189
    array-length v3, v2

    .line 190
    if-ge v1, v3, :cond_5

    .line 191
    .line 192
    iget-object v3, p0, Ll/fnd0;->a:[F

    .line 193
    .line 194
    aget v3, v3, v1

    .line 195
    .line 196
    iget v4, p0, Ll/fnd0;->f:F

    .line 197
    .line 198
    sub-float/2addr v3, v4

    .line 199
    aput v3, v2, v1

    .line 200
    .line 201
    add-int/lit8 v1, v1, 0x1

    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_5
    iget-object v1, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 205
    .line 206
    iget-object v3, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 207
    .line 208
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 209
    .line 210
    invoke-virtual {v1, v3, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_6
    iget-object v1, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 215
    .line 216
    iget-object v2, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 217
    .line 218
    iget-object v3, p0, Ll/fnd0;->a:[F

    .line 219
    .line 220
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 221
    .line 222
    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 223
    .line 224
    .line 225
    :goto_4
    iget-object p0, p0, Ll/fnd0;->n:Landroid/graphics/RectF;

    .line 226
    .line 227
    neg-float v0, v0

    .line 228
    invoke-virtual {p0, v0, v0}, Landroid/graphics/RectF;->inset(FF)V

    .line 229
    .line 230
    .line 231
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fnd0;->e:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    const-string v1, "radius should be non negative"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/wn80;->c(ZLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fnd0;->a:[F

    .line 15
    .line 16
    invoke-static {v0, p1}, Ljava/util/Arrays;->fill([FF)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public c(IF)V
    .locals 1

    .line 1
    iget v0, p0, Ll/fnd0;->h:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/fnd0;->h:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget p1, p0, Ll/fnd0;->f:F

    .line 11
    .line 12
    cmpl-float p1, p1, p2

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iput p2, p0, Ll/fnd0;->f:F

    .line 17
    .line 18
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Ll/fnd0;->m:I

    .line 4
    .line 5
    iget v2, p0, Ll/fnd0;->o:I

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/fde;->c(II)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 15
    .line 16
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fnd0;->h()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/fnd0;->k:Landroid/graphics/Path;

    .line 31
    .line 32
    iget-object v1, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/fnd0;->f:F

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    cmpl-float v0, v0, v1

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 45
    .line 46
    iget v1, p0, Ll/fnd0;->h:I

    .line 47
    .line 48
    iget v2, p0, Ll/fnd0;->o:I

    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/fde;->c(II)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 58
    .line 59
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 65
    .line 66
    iget v1, p0, Ll/fnd0;->f:F

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/fnd0;->l:Landroid/graphics/Path;

    .line 72
    .line 73
    iget-object p0, p0, Ll/fnd0;->d:Landroid/graphics/Paint;

    .line 74
    .line 75
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public e(F)V
    .locals 1

    .line 1
    iget v0, p0, Ll/fnd0;->g:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ll/fnd0;->g:F

    .line 8
    .line 9
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fnd0;->j:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/fnd0;->j:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fnd0;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 1

    .line 1
    iget v0, p0, Ll/fnd0;->m:I

    .line 2
    .line 3
    iget p0, p0, Ll/fnd0;->o:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/fde;->c(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ll/fde;->b(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fnd0;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/fnd0;->m:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/fnd0;->m:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fnd0;->i:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/fnd0;->i:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public n([F)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/fnd0;->a:[F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([FF)V

    .line 7
    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    array-length v0, p1

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v2

    .line 19
    :goto_0
    const-string v3, "radii should have exactly 8 values"

    .line 20
    .line 21
    invoke-static {v0, v3}, Ll/wn80;->c(ZLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fnd0;->a:[F

    .line 25
    .line 26
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    :goto_1
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/fnd0;->j()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/fnd0;->o:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/fnd0;->o:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method
