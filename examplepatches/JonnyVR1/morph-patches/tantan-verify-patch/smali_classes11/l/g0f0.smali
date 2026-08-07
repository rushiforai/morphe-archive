.class public Ll/g0f0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/RectF;

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:I

.field public g:I

.field public h:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(FFFFII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g0f0;->h:Landroid/graphics/Paint;

    .line 10
    .line 11
    iput p1, p0, Ll/g0f0;->b:F

    .line 12
    .line 13
    iput p2, p0, Ll/g0f0;->c:F

    .line 14
    .line 15
    iput p3, p0, Ll/g0f0;->d:F

    .line 16
    .line 17
    iput p4, p0, Ll/g0f0;->e:F

    .line 18
    .line 19
    iput p5, p0, Ll/g0f0;->f:I

    .line 20
    .line 21
    iput p6, p0, Ll/g0f0;->g:I

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/g0f0;->h:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {p1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/g0f0;->h:Landroid/graphics/Paint;

    .line 33
    .line 34
    sget-object p6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 35
    .line 36
    invoke-virtual {p1, p6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/g0f0;->h:Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 7
    .line 8
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    sub-int/2addr v1, p1

    .line 11
    new-instance p1, Landroid/graphics/RectF;

    .line 12
    .line 13
    iget v2, p0, Ll/g0f0;->c:F

    .line 14
    .line 15
    int-to-float v0, v0

    .line 16
    sub-float/2addr v0, v2

    .line 17
    int-to-float v1, v1

    .line 18
    sub-float/2addr v1, v2

    .line 19
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 23
    .line 24
    iget v0, p0, Ll/g0f0;->e:F

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    cmpl-float v2, v0, v1

    .line 28
    .line 29
    if-lez v2, :cond_0

    .line 30
    .line 31
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 32
    .line 33
    add-float/2addr v2, v0

    .line 34
    iput v2, p1, Landroid/graphics/RectF;->top:F

    .line 35
    .line 36
    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    .line 37
    .line 38
    sub-float/2addr v2, v0

    .line 39
    iput v2, p1, Landroid/graphics/RectF;->bottom:F

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    cmpg-float v2, v0, v1

    .line 43
    .line 44
    if-gez v2, :cond_1

    .line 45
    .line 46
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 47
    .line 48
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-float/2addr v2, v0

    .line 53
    iput v2, p1, Landroid/graphics/RectF;->top:F

    .line 54
    .line 55
    iget-object p1, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 56
    .line 57
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 58
    .line 59
    iget v2, p0, Ll/g0f0;->e:F

    .line 60
    .line 61
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    sub-float/2addr v0, v2

    .line 66
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 67
    .line 68
    :cond_1
    :goto_0
    iget p1, p0, Ll/g0f0;->d:F

    .line 69
    .line 70
    cmpl-float v0, p1, v1

    .line 71
    .line 72
    if-lez v0, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 75
    .line 76
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 77
    .line 78
    add-float/2addr v0, p1

    .line 79
    iput v0, p0, Landroid/graphics/RectF;->left:F

    .line 80
    .line 81
    iget v0, p0, Landroid/graphics/RectF;->right:F

    .line 82
    .line 83
    sub-float/2addr v0, p1

    .line 84
    iput v0, p0, Landroid/graphics/RectF;->right:F

    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    cmpg-float v0, p1, v1

    .line 88
    .line 89
    if-gez v0, :cond_3

    .line 90
    .line 91
    iget-object v0, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 92
    .line 93
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 94
    .line 95
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    add-float/2addr v1, p1

    .line 100
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 101
    .line 102
    iget-object p1, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 103
    .line 104
    iget v0, p1, Landroid/graphics/RectF;->right:F

    .line 105
    .line 106
    iget p0, p0, Ll/g0f0;->d:F

    .line 107
    .line 108
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    sub-float/2addr v0, p0

    .line 113
    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 114
    .line 115
    :cond_3
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/g0f0;->a(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/g0f0;->a:Landroid/graphics/RectF;

    .line 13
    .line 14
    iget v1, p0, Ll/g0f0;->b:F

    .line 15
    .line 16
    iget-object p0, p0, Ll/g0f0;->h:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 5
    .line 6
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    sub-int/2addr v0, v1

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    sub-int/2addr v0, v1

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/g0f0;->a(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onStateChange([I)Z
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
