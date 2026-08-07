.class public Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Landroid/animation/ValueAnimator;

.field public c:Landroid/graphics/Point;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/Paint;

.field public k:Landroid/graphics/Path;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a:F

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->l:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic a(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 140
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    .line 141
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a:F

    .line 142
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 130
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public a(FII)I
    .locals 5

    const/high16 p0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, p0

    if-lez v0, :cond_0

    move p1, p0

    .line 131
    :cond_0
    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    move-result p0

    .line 132
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v0

    .line 133
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    .line 134
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result p2

    .line 135
    invoke-static {p3}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    .line 136
    invoke-static {p3}, Landroid/graphics/Color;->red(I)I

    move-result v3

    .line 137
    invoke-static {p3}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    .line 138
    invoke-static {p3}, Landroid/graphics/Color;->green(I)I

    move-result p3

    sub-int/2addr v2, p0

    sub-int/2addr v3, v0

    sub-int/2addr v4, v1

    sub-int/2addr p3, p2

    int-to-float p0, p0

    int-to-float v2, v2

    mul-float/2addr v2, p1

    add-float/2addr p0, v2

    float-to-int p0, p0

    int-to-float v0, v0

    int-to-float v2, v3

    mul-float/2addr v2, p1

    add-float/2addr v0, v2

    float-to-int v0, v0

    int-to-float v1, v1

    int-to-float v2, v4

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    float-to-int v1, v1

    int-to-float p2, p2

    int-to-float p3, p3

    mul-float/2addr p1, p3

    add-float/2addr p2, p1

    float-to-int p1, p2

    .line 139
    invoke-static {p0, v0, p1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method public final a()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->c:Landroid/graphics/Point;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/tencent/could/huiyansdk/R$color;->txy_animation_start_color:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->d:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/tencent/could/huiyansdk/R$color;->txy_animation_mid_color:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->f:I

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/tencent/could/huiyansdk/R$color;->txy_animation_end_color:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->e:I

    .line 43
    .line 44
    new-instance v0, Landroid/graphics/Paint;

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 51
    .line 52
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 58
    .line 59
    iget v2, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->f:I

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 65
    .line 66
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 72
    .line 73
    const/high16 v3, 0x40600000    # 3.5f

    .line 74
    .line 75
    invoke-static {p0, v3}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    int-to-float v4, v4

    .line 80
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Landroid/graphics/Path;

    .line 84
    .line 85
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->k:Landroid/graphics/Path;

    .line 89
    .line 90
    new-instance v0, Landroid/graphics/Paint;

    .line 91
    .line 92
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Lcom/tencent/could/huiyansdk/R$color;->txy_circle_color:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->g:I

    .line 108
    .line 109
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-static {p0, v3}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    int-to-float p0, p0

    .line 126
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->l:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v2, Ll/xtv;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/xtv;-><init>(Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    const-wide/16 v2, 0x7d0

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    const/4 v1, -0x1

    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    nop

    .line 53
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->k:Landroid/graphics/Path;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a:F

    .line 20
    .line 21
    const/high16 v1, 0x43b40000    # 360.0f

    .line 22
    .line 23
    mul-float/2addr v0, v1

    .line 24
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->c:Landroid/graphics/Point;

    .line 25
    .line 26
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 27
    .line 28
    int-to-float v2, v2

    .line 29
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    invoke-virtual {p1, v0, v2, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    :goto_0
    const/16 v1, 0x168

    .line 37
    .line 38
    if-gt v0, v1, :cond_2

    .line 39
    .line 40
    const/16 v1, 0x10e

    .line 41
    .line 42
    if-ge v0, v1, :cond_1

    .line 43
    .line 44
    int-to-float v1, v0

    .line 45
    const/high16 v2, 0x43870000    # 270.0f

    .line 46
    .line 47
    div-float/2addr v1, v2

    .line 48
    iget v2, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->d:I

    .line 49
    .line 50
    iget v3, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->f:I

    .line 51
    .line 52
    invoke-virtual {p0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a(FII)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    add-int/lit16 v1, v0, -0x10e

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    const/high16 v2, 0x42b40000    # 90.0f

    .line 61
    .line 62
    div-float/2addr v1, v2

    .line 63
    iget v2, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->f:I

    .line 64
    .line 65
    iget v3, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->e:I

    .line 66
    .line 67
    invoke-virtual {p0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a(FII)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    :goto_1
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->i:Landroid/graphics/RectF;

    .line 77
    .line 78
    int-to-float v5, v0

    .line 79
    iget-object v8, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->h:Landroid/graphics/Paint;

    .line 80
    .line 81
    const/high16 v6, 0x3f800000    # 1.0f

    .line 82
    .line 83
    const/4 v7, 0x0

    .line 84
    move-object v3, p1

    .line 85
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v0, v0, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    move-object v3, p1

    .line 92
    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->c:Landroid/graphics/Point;

    .line 13
    .line 14
    shr-int/lit8 v1, p1, 0x1

    .line 15
    .line 16
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 17
    .line 18
    shr-int/lit8 v2, p2, 0x1

    .line 19
    .line 20
    iput v2, v0, Landroid/graphics/Point;->y:I

    .line 21
    .line 22
    if-le v1, v2, :cond_0

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 26
    .line 27
    .line 28
    const p1, 0x3ff33333    # 1.9f

    .line 29
    .line 30
    .line 31
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->dpToPx(Landroid/view/View;F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    sub-int/2addr v1, p1

    .line 36
    new-instance p1, Landroid/graphics/RectF;

    .line 37
    .line 38
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->c:Landroid/graphics/Point;

    .line 39
    .line 40
    iget v0, p2, Landroid/graphics/Point;->x:I

    .line 41
    .line 42
    sub-int v2, v0, v1

    .line 43
    .line 44
    int-to-float v2, v2

    .line 45
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    sub-int v3, p2, v1

    .line 48
    .line 49
    int-to-float v3, v3

    .line 50
    add-int/2addr v0, v1

    .line 51
    int-to-float v0, v0

    .line 52
    add-int/2addr p2, v1

    .line 53
    int-to-float p2, p2

    .line 54
    invoke-direct {p1, v2, v3, v0, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->i:Landroid/graphics/RectF;

    .line 58
    .line 59
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->k:Landroid/graphics/Path;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->k:Landroid/graphics/Path;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->c:Landroid/graphics/Point;

    .line 67
    .line 68
    iget p2, p0, Landroid/graphics/Point;->x:I

    .line 69
    .line 70
    int-to-float p2, p2

    .line 71
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 72
    .line 73
    int-to-float p0, p0

    .line 74
    int-to-float v0, v1

    .line 75
    sget-object v1, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 76
    .line 77
    invoke-virtual {p1, p2, p0, v0, v1}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
