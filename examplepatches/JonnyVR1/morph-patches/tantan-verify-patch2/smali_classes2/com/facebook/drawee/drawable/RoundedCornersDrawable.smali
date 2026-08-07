.class public Lcom/facebook/drawee/drawable/RoundedCornersDrawable;
.super Ll/p2j;
.source "SourceFile"

# interfaces
.implements Ll/and0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;
    }
.end annotation


# instance fields
.field public e:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final f:Landroid/graphics/RectF;

.field public g:Landroid/graphics/RectF;

.field public h:Landroid/graphics/Matrix;

.field public final i:[F

.field public final j:[F
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final k:Landroid/graphics/Paint;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public l:Z

.field public m:F

.field public n:I

.field public o:I

.field public p:F

.field public q:Z

.field public r:Z

.field public final s:Landroid/graphics/Path;

.field public final t:Landroid/graphics/Path;

.field public final u:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/p2j;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;->OVERLAY_COLOR:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->e:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;

    .line 13
    .line 14
    new-instance p1, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 20
    .line 21
    const/16 p1, 0x8

    .line 22
    .line 23
    new-array v0, p1, [F

    .line 24
    .line 25
    iput-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

    .line 26
    .line 27
    new-array p1, p1, [F

    .line 28
    .line 29
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->j:[F

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/Paint;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->l:Z

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 44
    .line 45
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->n:I

    .line 46
    .line 47
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->o:I

    .line 48
    .line 49
    iput v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->p:F

    .line 50
    .line 51
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->q:Z

    .line 52
    .line 53
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->r:Z

    .line 54
    .line 55
    new-instance p1, Landroid/graphics/Path;

    .line 56
    .line 57
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 61
    .line 62
    new-instance p1, Landroid/graphics/Path;

    .line 63
    .line 64
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->t:Landroid/graphics/Path;

    .line 68
    .line 69
    new-instance p1, Landroid/graphics/RectF;

    .line 70
    .line 71
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 75
    .line 76
    return-void
.end method

.method private u()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->t:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

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
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->p:F

    .line 23
    .line 24
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->e:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;

    .line 28
    .line 29
    sget-object v1, Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;->OVERLAY_COLOR:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;

    .line 30
    .line 31
    if-ne v0, v1, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 36
    .line 37
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->l:Z

    .line 43
    .line 44
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 45
    .line 46
    const/high16 v2, 0x40000000    # 2.0f

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    iget-object v5, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 69
    .line 70
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    div-float/2addr v4, v2

    .line 79
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 80
    .line 81
    invoke-virtual {v1, v0, v3, v4, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 86
    .line 87
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

    .line 88
    .line 89
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 90
    .line 91
    invoke-virtual {v1, v0, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 95
    .line 96
    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->p:F

    .line 97
    .line 98
    neg-float v3, v1

    .line 99
    neg-float v1, v1

    .line 100
    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 106
    .line 107
    div-float v3, v1, v2

    .line 108
    .line 109
    div-float/2addr v1, v2

    .line 110
    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 111
    .line 112
    .line 113
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->l:Z

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 124
    .line 125
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    div-float/2addr v0, v2

    .line 134
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->t:Landroid/graphics/Path;

    .line 135
    .line 136
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 137
    .line 138
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 143
    .line 144
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 149
    .line 150
    invoke-virtual {v1, v3, v4, v0, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_2
    const/4 v0, 0x0

    .line 155
    :goto_1
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->j:[F

    .line 156
    .line 157
    array-length v3, v1

    .line 158
    if-ge v0, v3, :cond_3

    .line 159
    .line 160
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

    .line 161
    .line 162
    aget v3, v3, v0

    .line 163
    .line 164
    iget v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->p:F

    .line 165
    .line 166
    add-float/2addr v3, v4

    .line 167
    iget v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 168
    .line 169
    div-float/2addr v4, v2

    .line 170
    sub-float/2addr v3, v4

    .line 171
    aput v3, v1, v0

    .line 172
    .line 173
    add-int/lit8 v0, v0, 0x1

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->t:Landroid/graphics/Path;

    .line 177
    .line 178
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 179
    .line 180
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 181
    .line 182
    invoke-virtual {v0, v3, v1, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 183
    .line 184
    .line 185
    :goto_2
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u:Landroid/graphics/RectF;

    .line 186
    .line 187
    iget p0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 188
    .line 189
    neg-float v1, p0

    .line 190
    div-float/2addr v1, v2

    .line 191
    neg-float p0, p0

    .line 192
    div-float/2addr p0, v2

    .line 193
    invoke-virtual {v0, v1, p0}, Landroid/graphics/RectF;->inset(FF)V

    .line 194
    .line 195
    .line 196
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->l:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/util/Arrays;->fill([FF)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c(IF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->n:I

    .line 2
    .line 3
    iput p2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    sget-object v2, Lcom/facebook/drawee/drawable/RoundedCornersDrawable$a;->a:[I

    .line 11
    .line 12
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->e:Lcom/facebook/drawee/drawable/RoundedCornersDrawable$Type;

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    aget v2, v2, v3

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-eq v2, v3, :cond_5

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    if-eq v2, v3, :cond_0

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_0
    iget-boolean v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->q:Z

    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->g:Landroid/graphics/RectF;

    .line 33
    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    new-instance v2, Landroid/graphics/RectF;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-direct {v2, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->g:Landroid/graphics/RectF;

    .line 44
    .line 45
    new-instance v2, Landroid/graphics/Matrix;

    .line 46
    .line 47
    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->h:Landroid/graphics/Matrix;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->g:Landroid/graphics/RectF;

    .line 59
    .line 60
    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 61
    .line 62
    invoke-virtual {v2, v3, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->h:Landroid/graphics/Matrix;

    .line 66
    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->g:Landroid/graphics/RectF;

    .line 72
    .line 73
    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 74
    .line 75
    invoke-virtual {v2, v3, v4, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 83
    .line 84
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->h:Landroid/graphics/Matrix;

    .line 88
    .line 89
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 90
    .line 91
    .line 92
    invoke-super/range {p0 .. p1}, Ll/p2j;->draw(Landroid/graphics/Canvas;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    invoke-super/range {p0 .. p1}, Ll/p2j;->draw(Landroid/graphics/Canvas;)V

    .line 100
    .line 101
    .line 102
    :goto_1
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 103
    .line 104
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 110
    .line 111
    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->o:I

    .line 112
    .line 113
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 117
    .line 118
    const/4 v7, 0x0

    .line 119
    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s()Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 132
    .line 133
    sget-object v3, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 139
    .line 140
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 141
    .line 142
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 143
    .line 144
    .line 145
    iget-boolean v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->l:Z

    .line 146
    .line 147
    if-eqz v2, :cond_6

    .line 148
    .line 149
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 150
    .line 151
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 156
    .line 157
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    sub-float/2addr v2, v3

    .line 162
    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 163
    .line 164
    add-float/2addr v2, v3

    .line 165
    const/high16 v3, 0x40000000    # 2.0f

    .line 166
    .line 167
    div-float v8, v2, v3

    .line 168
    .line 169
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 170
    .line 171
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    iget-object v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 176
    .line 177
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    sub-float/2addr v2, v4

    .line 182
    iget v4, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 183
    .line 184
    add-float/2addr v2, v4

    .line 185
    div-float v9, v2, v3

    .line 186
    .line 187
    cmpl-float v2, v8, v7

    .line 188
    .line 189
    if-lez v2, :cond_4

    .line 190
    .line 191
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 192
    .line 193
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 194
    .line 195
    move v4, v3

    .line 196
    iget v3, v2, Landroid/graphics/RectF;->top:F

    .line 197
    .line 198
    move v5, v4

    .line 199
    add-float v4, v5, v8

    .line 200
    .line 201
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 202
    .line 203
    iget-object v6, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 204
    .line 205
    move v1, v5

    .line 206
    move v5, v2

    .line 207
    move v2, v1

    .line 208
    move-object v1, p1

    .line 209
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 213
    .line 214
    iget v4, v1, Landroid/graphics/RectF;->right:F

    .line 215
    .line 216
    sub-float v2, v4, v8

    .line 217
    .line 218
    iget v3, v1, Landroid/graphics/RectF;->top:F

    .line 219
    .line 220
    iget v5, v1, Landroid/graphics/RectF;->bottom:F

    .line 221
    .line 222
    iget-object v6, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 223
    .line 224
    move-object v1, p1

    .line 225
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 226
    .line 227
    .line 228
    :cond_4
    cmpl-float v1, v9, v7

    .line 229
    .line 230
    if-lez v1, :cond_6

    .line 231
    .line 232
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 233
    .line 234
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 235
    .line 236
    iget v3, v1, Landroid/graphics/RectF;->top:F

    .line 237
    .line 238
    iget v4, v1, Landroid/graphics/RectF;->right:F

    .line 239
    .line 240
    add-float v5, v3, v9

    .line 241
    .line 242
    iget-object v6, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 243
    .line 244
    move-object v1, p1

    .line 245
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->f:Landroid/graphics/RectF;

    .line 249
    .line 250
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 251
    .line 252
    iget v5, v1, Landroid/graphics/RectF;->bottom:F

    .line 253
    .line 254
    sub-float v3, v5, v9

    .line 255
    .line 256
    iget v4, v1, Landroid/graphics/RectF;->right:F

    .line 257
    .line 258
    iget-object v6, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 259
    .line 260
    move-object v1, p1

    .line 261
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 262
    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    iget-object v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 270
    .line 271
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 272
    .line 273
    .line 274
    invoke-super/range {p0 .. p1}, Ll/p2j;->draw(Landroid/graphics/Canvas;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 278
    .line 279
    .line 280
    :cond_6
    :goto_2
    iget v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->n:I

    .line 281
    .line 282
    if-eqz v2, :cond_7

    .line 283
    .line 284
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 285
    .line 286
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 287
    .line 288
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 289
    .line 290
    .line 291
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 292
    .line 293
    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->n:I

    .line 294
    .line 295
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 296
    .line 297
    .line 298
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 299
    .line 300
    iget v3, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->m:F

    .line 301
    .line 302
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 303
    .line 304
    .line 305
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->s:Landroid/graphics/Path;

    .line 306
    .line 307
    sget-object v3, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 308
    .line 309
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 310
    .line 311
    .line 312
    iget-object v2, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->t:Landroid/graphics/Path;

    .line 313
    .line 314
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->k:Landroid/graphics/Paint;

    .line 315
    .line 316
    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 317
    .line 318
    .line 319
    :cond_7
    return-void
.end method

.method public e(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->p:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
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
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->r:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->r:Z

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
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->q:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n([F)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

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
    iget-object v0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->i:[F

    .line 25
    .line 26
    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    :goto_1
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

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
    invoke-super {p0, p1}, Ll/p2j;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->u()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/facebook/drawee/drawable/RoundedCornersDrawable;->o:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
