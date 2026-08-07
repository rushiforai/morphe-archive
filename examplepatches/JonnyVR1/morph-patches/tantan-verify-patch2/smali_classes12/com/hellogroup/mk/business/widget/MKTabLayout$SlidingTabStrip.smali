.class Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SlidingTabStrip"
.end annotation


# instance fields
.field private a:I

.field private final b:Landroid/graphics/Paint;

.field private c:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

.field d:I

.field e:I

.field f:F

.field private g:I

.field private h:I

.field private i:Landroid/animation/ValueAnimator;

.field final synthetic j:Lcom/hellogroup/mk/business/widget/MKTabLayout;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->j:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->d:I

    .line 8
    .line 9
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 10
    .line 11
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g:I

    .line 12
    .line 13
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;)Lcom/hellogroup/mk/business/widget/MKTabLayout$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;IF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->l(IF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k(Z)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-lez v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 27
    .line 28
    cmpl-float v4, v4, v1

    .line 29
    .line 30
    if-lez v4, :cond_1

    .line 31
    .line 32
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    add-int/lit8 v5, v5, -0x1

    .line 39
    .line 40
    if-ge v4, v5, :cond_1

    .line 41
    .line 42
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 43
    .line 44
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget v5, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    int-to-float v6, v6

    .line 57
    mul-float/2addr v5, v6

    .line 58
    iget v6, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 59
    .line 60
    sub-float v7, v2, v6

    .line 61
    .line 62
    int-to-float v3, v3

    .line 63
    mul-float/2addr v7, v3

    .line 64
    add-float/2addr v5, v7

    .line 65
    float-to-int v3, v5

    .line 66
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    int-to-float v4, v4

    .line 71
    mul-float/2addr v6, v4

    .line 72
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 73
    .line 74
    sub-float v4, v2, v4

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    mul-float/2addr v4, v0

    .line 78
    add-float/2addr v6, v4

    .line 79
    float-to-int v0, v6

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const/4 v3, -0x1

    .line 82
    move v0, v3

    .line 83
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->d:I

    .line 86
    .line 87
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 88
    .line 89
    if-eq p1, v4, :cond_2

    .line 90
    .line 91
    add-int/lit8 v4, v4, 0x1

    .line 92
    .line 93
    if-eq p1, v4, :cond_2

    .line 94
    .line 95
    invoke-direct {p0, p1, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->l(IF)V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 99
    .line 100
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 101
    .line 102
    sub-float/2addr v2, v1

    .line 103
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    invoke-direct {p0, p1, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->l(IF)V

    .line 108
    .line 109
    .line 110
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 111
    .line 112
    add-int/lit8 p1, p1, 0x1

    .line 113
    .line 114
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 115
    .line 116
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-direct {p0, p1, v1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->l(IF)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-virtual {p0, v3, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f(II)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method private l(IF)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->j:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t(I)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 20
    .line 21
    invoke-virtual {v0, p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->d(Lcom/hellogroup/mk/business/widget/MKTabLayout;IF)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public c(II)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p0}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-ne v0, v2, :cond_1

    .line 23
    .line 24
    move v0, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    if-nez v6, :cond_2

    .line 32
    .line 33
    invoke-direct {p0, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->k(Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    iget v5, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 46
    .line 47
    sub-int v5, p1, v5

    .line 48
    .line 49
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-gt v5, v2, :cond_3

    .line 54
    .line 55
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g:I

    .line 56
    .line 57
    iget v5, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 58
    .line 59
    move v7, v5

    .line 60
    move v5, v0

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    iget-object v5, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->j:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 63
    .line 64
    const/16 v7, 0x18

    .line 65
    .line 66
    invoke-virtual {v5, v7}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->s(I)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    iget v7, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 71
    .line 72
    if-ge p1, v7, :cond_6

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    :cond_4
    sub-int v0, v3, v5

    .line 77
    .line 78
    :goto_1
    move v5, v0

    .line 79
    move v7, v5

    .line 80
    goto :goto_3

    .line 81
    :cond_5
    :goto_2
    add-int v0, v4, v5

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_6
    if-eqz v0, :cond_4

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :goto_3
    if-ne v5, v3, :cond_8

    .line 88
    .line 89
    if-eq v7, v4, :cond_7

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_7
    return-void

    .line 93
    :cond_8
    :goto_4
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 94
    .line 95
    if-ne v0, p1, :cond_9

    .line 96
    .line 97
    move v8, v2

    .line 98
    goto :goto_5

    .line 99
    :cond_9
    move v8, v1

    .line 100
    :goto_5
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

    .line 106
    .line 107
    sget-object v1, Ll/or0;->f:Landroid/view/animation/Interpolator;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 110
    .line 111
    .line 112
    int-to-long v1, p2

    .line 113
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    .line 116
    const/4 p2, 0x2

    .line 117
    new-array p2, p2, [F

    .line 118
    .line 119
    fill-array-data p2, :array_0

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 123
    .line 124
    .line 125
    new-instance v3, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;

    .line 126
    .line 127
    move-object v4, p0

    .line 128
    move v9, p1

    .line 129
    invoke-direct/range {v3 .. v9}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;ILandroid/view/View;IZI)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 133
    .line 134
    .line 135
    new-instance p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;

    .line 136
    .line 137
    invoke-direct {p0, v4, v8, v9}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;-><init>(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;ZI)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public d()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-gtz v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g:I

    .line 5
    .line 6
    if-ltz v2, :cond_1

    .line 7
    .line 8
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 9
    .line 10
    if-le v4, v2, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    iget v6, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move-object v1, p1

    .line 24
    invoke-interface/range {v0 .. v6}, Lcom/hellogroup/mk/business/widget/MKTabLayout$b;->a(Landroid/graphics/Canvas;IIIIF)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    move-object v1, p1

    .line 29
    int-to-float v8, v2

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->a:I

    .line 35
    .line 36
    sub-int/2addr p1, v0

    .line 37
    int-to-float v9, p1

    .line 38
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 39
    .line 40
    int-to-float v10, p1

    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    int-to-float v11, p1

    .line 46
    iget-object v12, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 47
    .line 48
    move-object v7, v1

    .line 49
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public e()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 5
    .line 6
    add-float/2addr v0, p0

    .line 7
    return v0
.end method

.method public f(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->g:I

    .line 12
    .line 13
    iput p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->h:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g(IF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 17
    .line 18
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->d:I

    .line 19
    .line 20
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 21
    .line 22
    iput p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->k(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public h(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public i(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->a:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->a:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public j(Lcom/hellogroup/mk/business/widget/MKTabLayout$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$b;

    .line 6
    .line 7
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    sub-int/2addr p2, p3

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    sub-int/2addr p2, p3

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    sub-int/2addr p2, p3

    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    const/4 p4, 0x0

    .line 29
    move p5, p4

    .line 30
    :goto_0
    if-ge p5, p3, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/16 v2, 0x8

    .line 41
    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 57
    .line 58
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 59
    .line 60
    add-int/2addr p1, v4

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    sub-int v5, p2, v2

    .line 66
    .line 67
    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 68
    .line 69
    sub-int/2addr v5, v6

    .line 70
    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 71
    .line 72
    sub-int/2addr v5, v6

    .line 73
    div-int/lit8 v5, v5, 0x2

    .line 74
    .line 75
    add-int/2addr v4, v5

    .line 76
    add-int v5, p1, v1

    .line 77
    .line 78
    add-int/2addr v2, v4

    .line 79
    invoke-virtual {v0, p1, v4, v5, v2}, Landroid/view/View;->layout(IIII)V

    .line 80
    .line 81
    .line 82
    iget v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 83
    .line 84
    add-int/2addr v1, v0

    .line 85
    add-int/2addr p1, v1

    .line 86
    :cond_0
    add-int/lit8 p5, p5, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->i:Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_2

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    return-void

    .line 101
    :cond_3
    :goto_1
    invoke-direct {p0, p4}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->k(Z)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->j:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 14
    .line 15
    iget v0, v0, Lcom/hellogroup/mk/business/widget/MKTabLayout;->t:I

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x0

    .line 19
    if-ne v0, v2, :cond_3

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    div-int/2addr v2, v0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    :goto_0
    if-ge v3, v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-virtual {p0, v4, v5, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v3, v3, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    move v1, v3

    .line 62
    move v2, v1

    .line 63
    :goto_1
    if-ge v3, v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {p0, v4, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 77
    .line 78
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    iget v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 83
    .line 84
    add-int/2addr v6, v7

    .line 85
    iget v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 86
    .line 87
    add-int/2addr v6, v7

    .line 88
    add-int/2addr v1, v6

    .line 89
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    iget v6, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 94
    .line 95
    add-int/2addr v4, v6

    .line 96
    iget v5, v5, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 97
    .line 98
    add-int/2addr v4, v5

    .line 99
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    invoke-virtual {p0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
