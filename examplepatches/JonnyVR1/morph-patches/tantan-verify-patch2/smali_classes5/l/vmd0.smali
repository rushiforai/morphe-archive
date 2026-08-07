.class public Ll/vmd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/umd0;


# instance fields
.field public a:Landroid/content/Context;

.field public b:Landroid/view/View;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:Landroid/graphics/Path;

.field public h:Landroid/graphics/Path;

.field public i:Landroid/graphics/Xfermode;

.field public j:Z

.field public k:[F

.field public l:[F

.field public m:I

.field public n:I

.field public o:I

.field public p:F

.field public q:F

.field public r:F

.field public s:F

.field public t:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/vmd0;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public b(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->q:F

    .line 11
    .line 12
    iput p1, p0, Ll/vmd0;->r:F

    .line 13
    .line 14
    iput p1, p0, Ll/vmd0;->s:F

    .line 15
    .line 16
    iput p1, p0, Ll/vmd0;->t:F

    .line 17
    .line 18
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget p1, p0, Ll/vmd0;->m:I

    .line 23
    .line 24
    iget v0, p0, Ll/vmd0;->n:I

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public c(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->q:F

    .line 11
    .line 12
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/vmd0;->m:I

    .line 17
    .line 18
    iget v0, p0, Ll/vmd0;->n:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public d(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->q:F

    .line 11
    .line 12
    iput p1, p0, Ll/vmd0;->r:F

    .line 13
    .line 14
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Ll/vmd0;->m:I

    .line 19
    .line 20
    iget v0, p0, Ll/vmd0;->n:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/vmd0;->o:I

    .line 2
    .line 3
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p1, p0, Ll/vmd0;->m:I

    .line 8
    .line 9
    iget v0, p0, Ll/vmd0;->n:I

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public f(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 25
    .line 26
    iget-object v1, p0, Ll/vmd0;->i:Landroid/graphics/Xfermode;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 32
    .line 33
    iget-object v1, p0, Ll/vmd0;->d:Landroid/graphics/RectF;

    .line 34
    .line 35
    iget-object v2, p0, Ll/vmd0;->k:[F

    .line 36
    .line 37
    sget-object v3, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/vmd0;->h:Landroid/graphics/Path;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/vmd0;->h:Landroid/graphics/Path;

    .line 48
    .line 49
    iget-object v1, p0, Ll/vmd0;->f:Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/vmd0;->h:Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v1, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 57
    .line 58
    sget-object v2, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/vmd0;->h:Landroid/graphics/Path;

    .line 64
    .line 65
    iget-object v1, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 71
    .line 72
    const/4 v1, 0x0

    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 82
    .line 83
    .line 84
    iget v0, p0, Ll/vmd0;->p:F

    .line 85
    .line 86
    const/4 v1, 0x0

    .line 87
    cmpl-float v0, v0, v1

    .line 88
    .line 89
    if-lez v0, :cond_0

    .line 90
    .line 91
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 92
    .line 93
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 99
    .line 100
    iget v1, p0, Ll/vmd0;->p:F

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 106
    .line 107
    iget v1, p0, Ll/vmd0;->o:I

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 118
    .line 119
    iget-object v1, p0, Ll/vmd0;->e:Landroid/graphics/RectF;

    .line 120
    .line 121
    iget-object v2, p0, Ll/vmd0;->l:[F

    .line 122
    .line 123
    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 127
    .line 128
    iget-object p0, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 129
    .line 130
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 131
    .line 132
    .line 133
    :cond_0
    return-void
.end method

.method public g(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->r:F

    .line 11
    .line 12
    iput p1, p0, Ll/vmd0;->t:F

    .line 13
    .line 14
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Ll/vmd0;->m:I

    .line 19
    .line 20
    iget v0, p0, Ll/vmd0;->n:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public h(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->q:F

    .line 11
    .line 12
    iput p1, p0, Ll/vmd0;->s:F

    .line 13
    .line 14
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Ll/vmd0;->m:I

    .line 19
    .line 20
    iget v0, p0, Ll/vmd0;->n:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public i(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->t:F

    .line 11
    .line 12
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/vmd0;->m:I

    .line 17
    .line 18
    iget v0, p0, Ll/vmd0;->n:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->p:F

    .line 11
    .line 12
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/vmd0;->m:I

    .line 17
    .line 18
    iget v0, p0, Ll/vmd0;->n:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public k(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->s:F

    .line 11
    .line 12
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/vmd0;->m:I

    .line 17
    .line 18
    iget v0, p0, Ll/vmd0;->n:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public l(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->s:F

    .line 11
    .line 12
    iput p1, p0, Ll/vmd0;->t:F

    .line 13
    .line 14
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Ll/vmd0;->m:I

    .line 19
    .line 20
    iget v0, p0, Ll/vmd0;->n:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public m(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vmd0;->d:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0x1f

    .line 5
    .line 6
    invoke-virtual {p1, p0, v0, v1}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0, p1}, Ll/kvd;->a(Landroid/content/Context;F)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/vmd0;->r:F

    .line 11
    .line 12
    iget-object p1, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/vmd0;->m:I

    .line 17
    .line 18
    iget v0, p0, Ll/vmd0;->n:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/vmd0;->onSizeChanged(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public o(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "#00000000"

    .line 8
    .line 9
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p3, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/vmd0;->a:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p3, p0, Ll/vmd0;->b:Landroid/view/View;

    .line 24
    .line 25
    const/16 p3, 0x8

    .line 26
    .line 27
    new-array v0, p3, [F

    .line 28
    .line 29
    iput-object v0, p0, Ll/vmd0;->k:[F

    .line 30
    .line 31
    new-array p3, p3, [F

    .line 32
    .line 33
    iput-object p3, p0, Ll/vmd0;->l:[F

    .line 34
    .line 35
    new-instance p3, Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Ll/vmd0;->c:Landroid/graphics/Paint;

    .line 41
    .line 42
    new-instance p3, Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p3, p0, Ll/vmd0;->d:Landroid/graphics/RectF;

    .line 48
    .line 49
    new-instance p3, Landroid/graphics/RectF;

    .line 50
    .line 51
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p3, p0, Ll/vmd0;->e:Landroid/graphics/RectF;

    .line 55
    .line 56
    new-instance p3, Landroid/graphics/RectF;

    .line 57
    .line 58
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p3, p0, Ll/vmd0;->f:Landroid/graphics/RectF;

    .line 62
    .line 63
    new-instance p3, Landroid/graphics/Path;

    .line 64
    .line 65
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p3, p0, Ll/vmd0;->g:Landroid/graphics/Path;

    .line 69
    .line 70
    new-instance p3, Landroid/graphics/Path;

    .line 71
    .line 72
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p3, p0, Ll/vmd0;->h:Landroid/graphics/Path;

    .line 76
    .line 77
    new-instance p3, Landroid/graphics/PorterDuffXfermode;

    .line 78
    .line 79
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 80
    .line 81
    invoke-direct {p3, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 82
    .line 83
    .line 84
    iput-object p3, p0, Ll/vmd0;->i:Landroid/graphics/Xfermode;

    .line 85
    .line 86
    const/4 p3, -0x1

    .line 87
    iput p3, p0, Ll/vmd0;->o:I

    .line 88
    .line 89
    sget-object p3, Ll/xhc0;->y:[I

    .line 90
    .line 91
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-nez p1, :cond_1

    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    sget p2, Ll/xhc0;->D:I

    .line 99
    .line 100
    const/4 p3, 0x0

    .line 101
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    sget v0, Ll/xhc0;->C:I

    .line 106
    .line 107
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    sget v1, Ll/xhc0;->E:I

    .line 112
    .line 113
    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    sget v2, Ll/xhc0;->I:I

    .line 118
    .line 119
    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    sget v3, Ll/xhc0;->A:I

    .line 124
    .line 125
    invoke-virtual {p1, v3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    sget v3, Ll/xhc0;->H:I

    .line 130
    .line 131
    cmpl-float v4, v2, p3

    .line 132
    .line 133
    if-lez v4, :cond_2

    .line 134
    .line 135
    move v5, v2

    .line 136
    goto :goto_0

    .line 137
    :cond_2
    move v5, v0

    .line 138
    :goto_0
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    iput v3, p0, Ll/vmd0;->q:F

    .line 143
    .line 144
    sget v3, Ll/xhc0;->J:I

    .line 145
    .line 146
    if-lez v4, :cond_3

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_3
    move v2, v1

    .line 150
    :goto_1
    invoke-virtual {p1, v3, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    iput v2, p0, Ll/vmd0;->r:F

    .line 155
    .line 156
    sget v2, Ll/xhc0;->z:I

    .line 157
    .line 158
    cmpl-float v3, p2, p3

    .line 159
    .line 160
    if-lez v3, :cond_4

    .line 161
    .line 162
    move v0, p2

    .line 163
    :cond_4
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    iput v0, p0, Ll/vmd0;->s:F

    .line 168
    .line 169
    sget v0, Ll/xhc0;->B:I

    .line 170
    .line 171
    if-lez v3, :cond_5

    .line 172
    .line 173
    move v1, p2

    .line 174
    :cond_5
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    iput p2, p0, Ll/vmd0;->t:F

    .line 179
    .line 180
    sget p2, Ll/xhc0;->G:I

    .line 181
    .line 182
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    iput p2, p0, Ll/vmd0;->p:F

    .line 187
    .line 188
    sget p2, Ll/xhc0;->F:I

    .line 189
    .line 190
    iget p3, p0, Ll/vmd0;->o:I

    .line 191
    .line 192
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    iput p2, p0, Ll/vmd0;->o:I

    .line 197
    .line 198
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public onSizeChanged(II)V
    .locals 7

    .line 1
    iput p1, p0, Ll/vmd0;->m:I

    .line 2
    .line 3
    iput p2, p0, Ll/vmd0;->n:I

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/vmd0;->j:Z

    .line 6
    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    mul-float/2addr v0, v2

    .line 19
    div-float/2addr v0, v1

    .line 20
    iput v0, p0, Ll/vmd0;->q:F

    .line 21
    .line 22
    iput v0, p0, Ll/vmd0;->r:F

    .line 23
    .line 24
    iput v0, p0, Ll/vmd0;->t:F

    .line 25
    .line 26
    iput v0, p0, Ll/vmd0;->s:F

    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/vmd0;->p()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/vmd0;->d:Landroid/graphics/RectF;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget v2, p0, Ll/vmd0;->p:F

    .line 36
    .line 37
    int-to-float v3, p1

    .line 38
    sub-float/2addr v3, v2

    .line 39
    int-to-float v4, p2

    .line 40
    sub-float/2addr v4, v2

    .line 41
    invoke-virtual {v0, v2, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/vmd0;->e:Landroid/graphics/RectF;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget v2, p0, Ll/vmd0;->p:F

    .line 49
    .line 50
    div-float v3, v2, v1

    .line 51
    .line 52
    div-float v4, v2, v1

    .line 53
    .line 54
    int-to-float v5, p1

    .line 55
    div-float v6, v2, v1

    .line 56
    .line 57
    sub-float/2addr v5, v6

    .line 58
    int-to-float v6, p2

    .line 59
    div-float/2addr v2, v1

    .line 60
    sub-float/2addr v6, v2

    .line 61
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p0, p0, Ll/vmd0;->f:Landroid/graphics/RectF;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    int-to-float p1, p1

    .line 69
    int-to-float p2, p2

    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 72
    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public final p()V
    .locals 15

    .line 1
    iget-object v0, p0, Ll/vmd0;->k:[F

    .line 2
    .line 3
    iget v1, p0, Ll/vmd0;->q:F

    .line 4
    .line 5
    iget v2, p0, Ll/vmd0;->p:F

    .line 6
    .line 7
    sub-float v3, v1, v2

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    aput v3, v0, v4

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    aput v3, v0, v5

    .line 14
    .line 15
    iget v3, p0, Ll/vmd0;->r:F

    .line 16
    .line 17
    sub-float v6, v3, v2

    .line 18
    .line 19
    const/4 v7, 0x3

    .line 20
    aput v6, v0, v7

    .line 21
    .line 22
    const/4 v8, 0x2

    .line 23
    aput v6, v0, v8

    .line 24
    .line 25
    iget v6, p0, Ll/vmd0;->t:F

    .line 26
    .line 27
    sub-float v9, v6, v2

    .line 28
    .line 29
    const/4 v10, 0x5

    .line 30
    aput v9, v0, v10

    .line 31
    .line 32
    const/4 v11, 0x4

    .line 33
    aput v9, v0, v11

    .line 34
    .line 35
    iget v9, p0, Ll/vmd0;->s:F

    .line 36
    .line 37
    sub-float v12, v9, v2

    .line 38
    .line 39
    const/4 v13, 0x7

    .line 40
    aput v12, v0, v13

    .line 41
    .line 42
    const/4 v14, 0x6

    .line 43
    aput v12, v0, v14

    .line 44
    .line 45
    iget-object p0, p0, Ll/vmd0;->l:[F

    .line 46
    .line 47
    const/high16 v0, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float v12, v2, v0

    .line 50
    .line 51
    sub-float/2addr v1, v12

    .line 52
    aput v1, p0, v4

    .line 53
    .line 54
    aput v1, p0, v5

    .line 55
    .line 56
    div-float v1, v2, v0

    .line 57
    .line 58
    sub-float/2addr v3, v1

    .line 59
    aput v3, p0, v7

    .line 60
    .line 61
    aput v3, p0, v8

    .line 62
    .line 63
    div-float v1, v2, v0

    .line 64
    .line 65
    sub-float/2addr v6, v1

    .line 66
    aput v6, p0, v10

    .line 67
    .line 68
    aput v6, p0, v11

    .line 69
    .line 70
    div-float/2addr v2, v0

    .line 71
    sub-float/2addr v9, v2

    .line 72
    aput v9, p0, v13

    .line 73
    .line 74
    aput v9, p0, v14

    .line 75
    .line 76
    return-void
.end method
