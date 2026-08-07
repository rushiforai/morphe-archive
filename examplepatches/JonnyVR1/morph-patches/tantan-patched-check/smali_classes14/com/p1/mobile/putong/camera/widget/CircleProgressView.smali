.class public Lcom/p1/mobile/putong/camera/widget/CircleProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/RectF;

.field public e:F

.field public f:I

.field public g:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/high16 p1, 0x40c00000    # 6.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    const/high16 p1, 0x40c00000    # 6.0f

    .line 29
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    const/4 p1, 0x0

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    const/high16 p1, 0x40c00000    # 6.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/camera/widget/CircleProgressView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 25
    .line 26
    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 32
    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    const-string v3, "#80ffffff"

    .line 41
    .line 42
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 70
    .line 71
    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 77
    .line 78
    iget v2, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 84
    .line 85
    const-string v2, "#ff3a00"

    .line 86
    .line 87
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Landroid/graphics/Paint;

    .line 95
    .line 96
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c:Landroid/graphics/Paint;

    .line 110
    .line 111
    const/4 v1, -0x1

    .line 112
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c:Landroid/graphics/Paint;

    .line 116
    .line 117
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public d(IJ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p2, v0

    .line 7
    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->setProgress(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 15
    .line 16
    filled-new-array {v0, p1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView$a;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView$a;-><init>(Lcom/p1/mobile/putong/camera/widget/CircleProgressView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->g:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public getProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    .line 5
    .line 6
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 7
    .line 8
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 9
    .line 10
    add-float/2addr v1, v2

    .line 11
    const/high16 v2, 0x3f000000    # 0.5f

    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    iget v3, v0, Landroid/graphics/RectF;->top:F

    .line 15
    .line 16
    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    .line 17
    .line 18
    add-float/2addr v3, v4

    .line 19
    mul-float/2addr v3, v2

    .line 20
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/high16 v2, 0x40000000    # 2.0f

    .line 25
    .line 26
    div-float/2addr v0, v2

    .line 27
    iget v4, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 28
    .line 29
    div-float/2addr v4, v2

    .line 30
    sub-float/2addr v0, v4

    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->c:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {p1, v1, v3, v0, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 34
    .line 35
    .line 36
    iget-object v5, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    iget-object v9, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->a:Landroid/graphics/Paint;

    .line 40
    .line 41
    const/4 v6, 0x0

    .line 42
    const/high16 v7, 0x43b40000    # 360.0f

    .line 43
    .line 44
    move-object v4, p1

    .line 45
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 46
    .line 47
    .line 48
    iget-object v5, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    .line 49
    .line 50
    iget v0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 51
    .line 52
    mul-int/lit16 v0, v0, 0x168

    .line 53
    .line 54
    int-to-float v0, v0

    .line 55
    const/high16 v1, 0x42c80000    # 100.0f

    .line 56
    .line 57
    div-float v7, v0, v1

    .line 58
    .line 59
    iget-object v9, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b:Landroid/graphics/Paint;

    .line 60
    .line 61
    const/high16 v6, 0x43870000    # 270.0f

    .line 62
    .line 63
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    sub-int/2addr p1, p2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    sub-int/2addr p1, p2

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    sub-int/2addr p2, v0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sub-int/2addr p2, v0

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-float v0, v0

    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 38
    .line 39
    add-float/2addr v0, v1

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/2addr v1, p1

    .line 45
    int-to-float p1, v1

    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 47
    .line 48
    sub-float/2addr p1, v1

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    int-to-float v1, v1

    .line 54
    iget v2, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 55
    .line 56
    add-float/2addr v1, v2

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    add-int/2addr v2, p2

    .line 62
    int-to-float p2, v2

    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->e:F

    .line 64
    .line 65
    sub-float/2addr p2, v2

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d:Landroid/graphics/RectF;

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public setProgress(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->f:I

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
