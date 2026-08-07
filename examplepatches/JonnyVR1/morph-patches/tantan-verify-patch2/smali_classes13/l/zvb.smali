.class public Ll/zvb;
.super Ll/yvb;
.source "SourceFile"


# instance fields
.field public n:Landroid/graphics/Paint;

.field public o:I

.field public p:I

.field public q:I

.field public r:F

.field public s:Landroid/graphics/PathEffect;

.field public t:Landroid/graphics/Paint;

.field public u:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Ll/bwb;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/yvb;-><init>(Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40000000    # 2.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/zvb;->o:I

    .line 11
    .line 12
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ll/zvb;->p:I

    .line 17
    .line 18
    const/high16 p1, 0x41000000    # 8.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Ll/zvb;->q:I

    .line 25
    .line 26
    const p1, 0x3de147ae    # 0.11f

    .line 27
    .line 28
    .line 29
    iput p1, p0, Ll/zvb;->r:F

    .line 30
    .line 31
    new-instance p1, Landroid/graphics/DashPathEffect;

    .line 32
    .line 33
    iget v0, p0, Ll/zvb;->q:I

    .line 34
    .line 35
    int-to-float v1, v0

    .line 36
    int-to-float v0, v0

    .line 37
    const/4 v2, 0x2

    .line 38
    new-array v2, v2, [F

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    aput v1, v2, v3

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    aput v0, v2, v1

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-direct {p1, v2, v0}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/zvb;->s:Landroid/graphics/PathEffect;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Ll/zvb;->u:Landroid/graphics/RectF;

    .line 54
    .line 55
    new-instance p1, Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/zvb;->n:Landroid/graphics/Paint;

    .line 61
    .line 62
    iget v0, p0, Ll/zvb;->o:I

    .line 63
    .line 64
    int-to-float v0, v0

    .line 65
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/zvb;->n:Landroid/graphics/Paint;

    .line 69
    .line 70
    const/4 v0, -0x1

    .line 71
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/zvb;->n:Landroid/graphics/Paint;

    .line 75
    .line 76
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Ll/zvb;->t:Landroid/graphics/Paint;

    .line 87
    .line 88
    iget v2, p0, Ll/zvb;->p:I

    .line 89
    .line 90
    int-to-float v2, v2

    .line 91
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/zvb;->t:Landroid/graphics/Paint;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/zvb;->t:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/zvb;->t:Landroid/graphics/Paint;

    .line 105
    .line 106
    iget-object p0, p0, Ll/zvb;->s:Landroid/graphics/PathEffect;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 109
    .line 110
    .line 111
    return-void
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
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yvb;->d(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    iget v0, p0, Ll/zvb;->r:F

    .line 9
    .line 10
    mul-float/2addr p3, v0

    .line 11
    new-instance v0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 17
    .line 18
    add-float/2addr v1, p3

    .line 19
    iget v2, p2, Landroid/graphics/RectF;->top:F

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 22
    .line 23
    .line 24
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 25
    .line 26
    add-float/2addr v1, p3

    .line 27
    iget v2, p2, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 30
    .line 31
    .line 32
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 33
    .line 34
    sub-float/2addr v1, p3

    .line 35
    iget v2, p2, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 38
    .line 39
    .line 40
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 41
    .line 42
    sub-float/2addr v1, p3

    .line 43
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 44
    .line 45
    invoke-virtual {v0, v1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/zvb;->t:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public f(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 0

    .line 1
    return-void
.end method
