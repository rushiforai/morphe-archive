.class public Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:I

.field public e:I

.field public f:I

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public final k:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->j:F

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->k:Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->f()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->g(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public b(I)I
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    float-to-int p0, p0

    .line 16
    return p0
.end method

.method public final c(Landroid/graphics/Paint$Style;I)Landroid/graphics/Paint;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public final d(Landroid/graphics/Paint$Style;IF)Landroid/graphics/Paint;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->c(Landroid/graphics/Paint$Style;I)Landroid/graphics/Paint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/rhc0;->y:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget p2, Ll/rhc0;->A:I

    .line 13
    .line 14
    const/16 v0, 0x1e

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->b(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->g:F

    .line 26
    .line 27
    sget p2, Ll/rhc0;->D:I

    .line 28
    .line 29
    const/4 v0, 0x6

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->b(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-float v0, v0

    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->i:F

    .line 40
    .line 41
    sget p2, Ll/rhc0;->z:I

    .line 42
    .line 43
    const-string v0, "#08000000"

    .line 44
    .line 45
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->d:I

    .line 54
    .line 55
    sget p2, Ll/rhc0;->C:I

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v1, Ll/j9c0;->f:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->e:I

    .line 72
    .line 73
    sget p2, Ll/rhc0;->B:I

    .line 74
    .line 75
    const-string v0, "#1AFE7E1D"

    .line 76
    .line 77
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->f:I

    .line 86
    .line 87
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->g:F

    .line 88
    .line 89
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->i:F

    .line 90
    .line 91
    const/high16 v0, 0x40000000    # 2.0f

    .line 92
    .line 93
    div-float/2addr p2, v0

    .line 94
    add-float/2addr p1, p2

    .line 95
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->h:F

    .line 96
    .line 97
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->d:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->c(Landroid/graphics/Paint$Style;I)Landroid/graphics/Paint;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->f:I

    .line 14
    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->i:F

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->d(Landroid/graphics/Paint$Style;IF)Landroid/graphics/Paint;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->c:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->e:I

    .line 24
    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->i:F

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->d(Landroid/graphics/Paint$Style;IF)Landroid/graphics/Paint;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->b:Landroid/graphics/Paint;

    .line 32
    .line 33
    sget-object p0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic g(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->j:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    int-to-float v1, v1

    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->g:F

    .line 19
    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->a:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->k:Landroid/graphics/RectF;

    .line 26
    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->h:F

    .line 28
    .line 29
    sub-float v3, v0, v2

    .line 30
    .line 31
    iput v3, v5, Landroid/graphics/RectF;->left:F

    .line 32
    .line 33
    sub-float v3, v1, v2

    .line 34
    .line 35
    iput v3, v5, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    const/high16 v3, 0x40000000    # 2.0f

    .line 38
    .line 39
    mul-float v6, v2, v3

    .line 40
    .line 41
    sub-float v7, v0, v2

    .line 42
    .line 43
    add-float/2addr v6, v7

    .line 44
    iput v6, v5, Landroid/graphics/RectF;->right:F

    .line 45
    .line 46
    mul-float v6, v2, v3

    .line 47
    .line 48
    sub-float v2, v1, v2

    .line 49
    .line 50
    add-float/2addr v6, v2

    .line 51
    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    .line 52
    .line 53
    const/4 v8, 0x0

    .line 54
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->c:Landroid/graphics/Paint;

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    const/high16 v7, 0x43b40000    # 360.0f

    .line 58
    .line 59
    move-object v4, p1

    .line 60
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->j:F

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    cmpl-float v2, v2, v4

    .line 67
    .line 68
    if-lez v2, :cond_0

    .line 69
    .line 70
    new-instance v5, Landroid/graphics/RectF;

    .line 71
    .line 72
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 73
    .line 74
    .line 75
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->h:F

    .line 76
    .line 77
    sub-float v4, v0, v2

    .line 78
    .line 79
    iput v4, v5, Landroid/graphics/RectF;->left:F

    .line 80
    .line 81
    sub-float v4, v1, v2

    .line 82
    .line 83
    iput v4, v5, Landroid/graphics/RectF;->top:F

    .line 84
    .line 85
    mul-float v4, v2, v3

    .line 86
    .line 87
    sub-float/2addr v0, v2

    .line 88
    add-float/2addr v4, v0

    .line 89
    iput v4, v5, Landroid/graphics/RectF;->right:F

    .line 90
    .line 91
    mul-float/2addr v3, v2

    .line 92
    sub-float/2addr v1, v2

    .line 93
    add-float/2addr v3, v1

    .line 94
    iput v3, v5, Landroid/graphics/RectF;->bottom:F

    .line 95
    .line 96
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->j:F

    .line 97
    .line 98
    const/high16 v1, 0x42c80000    # 100.0f

    .line 99
    .line 100
    div-float/2addr v0, v1

    .line 101
    const/high16 v1, 0x43b40000    # 360.0f

    .line 102
    .line 103
    mul-float v7, v0, v1

    .line 104
    .line 105
    const/4 v8, 0x0

    .line 106
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->b:Landroid/graphics/Paint;

    .line 107
    .line 108
    const/high16 v6, 0x42b40000    # 90.0f

    .line 109
    .line 110
    move-object v4, p1

    .line 111
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setProgress(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->j:F

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput v0, v1, v2

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aput p1, v1, v0

    .line 11
    .line 12
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-wide/16 v0, 0x12c

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/ddd0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/ddd0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setRingColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->f:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
