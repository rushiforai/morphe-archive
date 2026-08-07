.class public Ll/yvb;
.super Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;
.source "SourceFile"


# instance fields
.field public f:Landroid/graphics/Paint;

.field public g:I

.field public h:F

.field public i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/RectF;

.field public k:I

.field public l:I

.field public m:[F


# direct methods
.method public constructor <init>(Ll/bwb;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaRectShape;-><init>(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/yvb;->g:I

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 18
    .line 19
    new-instance p1, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 25
    .line 26
    const/high16 p1, 0x42100000    # 36.0f

    .line 27
    .line 28
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Ll/yvb;->k:I

    .line 33
    .line 34
    const/high16 p1, 0x41a00000    # 20.0f

    .line 35
    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Ll/yvb;->l:I

    .line 41
    .line 42
    new-instance p1, Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/yvb;->f:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget v0, p0, Ll/yvb;->g:I

    .line 50
    .line 51
    int-to-float v0, v0

    .line 52
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/yvb;->f:Landroid/graphics/Paint;

    .line 56
    .line 57
    const/4 v0, -0x1

    .line 58
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/yvb;->f:Landroid/graphics/Paint;

    .line 62
    .line 63
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static i(Landroid/graphics/RectF;)[F
    .locals 5

    .line 1
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 2
    .line 3
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 4
    .line 5
    iget v2, p0, Landroid/graphics/RectF;->right:F

    .line 6
    .line 7
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 8
    .line 9
    const/16 v3, 0x8

    .line 10
    .line 11
    new-array v3, v3, [F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    aput v0, v3, v4

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    aput v1, v3, v4

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    aput v2, v3, v4

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    aput v1, v3, v4

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    aput v2, v3, v1

    .line 27
    .line 28
    const/4 v1, 0x5

    .line 29
    aput p0, v3, v1

    .line 30
    .line 31
    const/4 v1, 0x6

    .line 32
    aput v0, v3, v1

    .line 33
    .line 34
    const/4 v0, 0x7

    .line 35
    aput p0, v3, v0

    .line 36
    .line 37
    return-object v3
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 1

    .line 1
    sget p0, Ll/qa00;->i:I

    .line 2
    .line 3
    int-to-float v0, p0

    .line 4
    int-to-float p0, p0

    .line 5
    invoke-virtual {p1, p2, v0, p0, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 5

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    int-to-float v2, v0

    .line 5
    invoke-virtual {p1, p2, v1, v2, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/yvb;->g:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p3}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    sub-float/2addr v1, p3

    .line 16
    const/high16 p3, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr v1, p3

    .line 19
    iput v1, p0, Ll/yvb;->h:F

    .line 20
    .line 21
    iget-object p3, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 22
    .line 23
    iget v2, p2, Landroid/graphics/RectF;->left:F

    .line 24
    .line 25
    sub-float/2addr v2, v1

    .line 26
    iget v3, p2, Landroid/graphics/RectF;->top:F

    .line 27
    .line 28
    sub-float/2addr v3, v1

    .line 29
    iget v4, p2, Landroid/graphics/RectF;->right:F

    .line 30
    .line 31
    add-float/2addr v4, v1

    .line 32
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 33
    .line 34
    add-float/2addr p2, v1

    .line 35
    invoke-virtual {p3, v2, v3, v4, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 42
    .line 43
    iget-object p3, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-virtual {p2, p3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 49
    .line 50
    iget p3, p0, Ll/yvb;->k:I

    .line 51
    .line 52
    int-to-float v1, p3

    .line 53
    neg-int p3, p3

    .line 54
    int-to-float p3, p3

    .line 55
    invoke-virtual {p2, v1, p3}, Landroid/graphics/RectF;->inset(FF)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 59
    .line 60
    sget-object p3, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 61
    .line 62
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 66
    .line 67
    iget-object v1, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 73
    .line 74
    iget v1, p0, Ll/yvb;->k:I

    .line 75
    .line 76
    neg-int v2, v1

    .line 77
    int-to-float v2, v2

    .line 78
    int-to-float v1, v1

    .line 79
    invoke-virtual {p2, v2, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Ll/yvb;->j:Landroid/graphics/RectF;

    .line 83
    .line 84
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 88
    .line 89
    int-to-float p3, v0

    .line 90
    int-to-float v0, v0

    .line 91
    iget-object v1, p0, Ll/yvb;->f:Landroid/graphics/Paint;

    .line 92
    .line 93
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/yvb;->k()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public e(Landroid/graphics/Canvas;FFFF)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fwb;->f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(FF)I
    .locals 10

    .line 1
    iget v0, p0, Ll/yvb;->l:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    const/4 v2, -0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    :goto_0
    const/16 v4, 0x8

    .line 7
    .line 8
    if-ge v3, v4, :cond_1

    .line 9
    .line 10
    iget-object v4, p0, Ll/yvb;->m:[F

    .line 11
    .line 12
    aget v4, v4, v3

    .line 13
    .line 14
    sub-float v4, p1, v4

    .line 15
    .line 16
    float-to-double v4, v4

    .line 17
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 18
    .line 19
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 20
    .line 21
    .line 22
    move-result-wide v4

    .line 23
    iget-object v8, p0, Ll/yvb;->m:[F

    .line 24
    .line 25
    add-int/lit8 v9, v3, 0x1

    .line 26
    .line 27
    aget v8, v8, v9

    .line 28
    .line 29
    sub-float v8, p2, v8

    .line 30
    .line 31
    float-to-double v8, v8

    .line 32
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    add-double/2addr v4, v6

    .line 37
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    cmpg-double v6, v4, v0

    .line 42
    .line 43
    if-gez v6, :cond_0

    .line 44
    .line 45
    div-int/lit8 v0, v3, 0x2

    .line 46
    .line 47
    move v2, v0

    .line 48
    move-wide v0, v4

    .line 49
    :cond_0
    add-int/lit8 v3, v3, 0x2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 58
    .line 59
    iget v3, v1, Landroid/graphics/RectF;->left:F

    .line 60
    .line 61
    iget v4, v1, Landroid/graphics/RectF;->top:F

    .line 62
    .line 63
    iget v5, p0, Ll/yvb;->l:I

    .line 64
    .line 65
    int-to-float v6, v5

    .line 66
    sub-float v6, v4, v6

    .line 67
    .line 68
    iget v1, v1, Landroid/graphics/RectF;->right:F

    .line 69
    .line 70
    int-to-float v5, v5

    .line 71
    add-float/2addr v4, v5

    .line 72
    invoke-virtual {v0, v3, v6, v1, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Landroid/graphics/RectF;

    .line 76
    .line 77
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget v4, v3, Landroid/graphics/RectF;->left:F

    .line 83
    .line 84
    iget v5, v3, Landroid/graphics/RectF;->bottom:F

    .line 85
    .line 86
    iget p0, p0, Ll/yvb;->l:I

    .line 87
    .line 88
    int-to-float v6, p0

    .line 89
    sub-float v6, v5, v6

    .line 90
    .line 91
    iget v3, v3, Landroid/graphics/RectF;->right:F

    .line 92
    .line 93
    int-to-float p0, p0

    .line 94
    add-float/2addr v5, p0

    .line 95
    invoke-virtual {v1, v4, v6, v3, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 96
    .line 97
    .line 98
    if-gez v2, :cond_2

    .line 99
    .line 100
    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_2

    .line 105
    .line 106
    const/4 v2, 0x4

    .line 107
    :cond_2
    if-gez v2, :cond_3

    .line 108
    .line 109
    invoke-virtual {v1, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    const/4 p0, 0x5

    .line 116
    return p0

    .line 117
    :cond_3
    return v2
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yvb;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yvb;->i(Landroid/graphics/RectF;)[F

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/yvb;->m:[F

    .line 8
    .line 9
    return-void
.end method
