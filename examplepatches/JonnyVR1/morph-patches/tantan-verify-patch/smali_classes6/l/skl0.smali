.class public Ll/skl0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:I

.field public c:I

.field public d:Landroid/animation/ValueAnimator;

.field public e:Ll/z3h;

.field public f:Ll/y3h;


# direct methods
.method public constructor <init>(Landroid/view/View;Ll/z3h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/skl0;->a:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Ll/skl0;->e:Ll/z3h;

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->w0()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Ll/skl0;->b:I

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/skl0;->c:I

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/skl0;FFFLandroid/animation/ValueAnimator;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/skl0;->k(FFFLandroid/animation/ValueAnimator;FLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/skl0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/skl0;->j(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/skl0;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skl0;->a:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public d()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/skl0;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x2

    .line 15
    new-array v4, v3, [F

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    aput v2, v4, v5

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aput v2, v4, v1

    .line 22
    .line 23
    const-string v6, "scaleX"

    .line 24
    .line 25
    invoke-static {v0, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v4, p0, Ll/skl0;->a:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v4}, Landroid/view/View;->getScaleY()F

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    new-array v7, v3, [F

    .line 36
    .line 37
    aput v6, v7, v5

    .line 38
    .line 39
    aput v2, v7, v1

    .line 40
    .line 41
    const-string v2, "scaleY"

    .line 42
    .line 43
    invoke-static {v4, v2, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v4, p0, Ll/skl0;->a:Landroid/view/View;

    .line 48
    .line 49
    new-array v6, v3, [F

    .line 50
    .line 51
    fill-array-data v6, :array_0

    .line 52
    .line 53
    .line 54
    const-string v7, "alpha"

    .line 55
    .line 56
    invoke-static {v4, v7, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget-object v6, p0, Ll/skl0;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    instance-of v6, v6, Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    const-wide/16 v7, 0xc8

    .line 69
    .line 70
    if-eqz v6, :cond_0

    .line 71
    .line 72
    iget-object v6, p0, Ll/skl0;->a:Landroid/view/View;

    .line 73
    .line 74
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    check-cast v6, Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    invoke-virtual {v6}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    invoke-virtual {v6}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    int-to-float v6, v6

    .line 93
    float-to-int v6, v6

    .line 94
    filled-new-array {v6, v5}, [I

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {v6, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    new-instance v9, Ll/okl0;

    .line 106
    .line 107
    invoke-direct {v9, p0}, Ll/okl0;-><init>(Ll/skl0;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v6, v9}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    const/4 v6, 0x0

    .line 115
    :goto_0
    invoke-virtual {v0, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 122
    .line 123
    .line 124
    new-instance v7, Landroid/animation/AnimatorSet;

    .line 125
    .line 126
    invoke-direct {v7}, Landroid/animation/AnimatorSet;-><init>()V

    .line 127
    .line 128
    .line 129
    const/4 v8, 0x3

    .line 130
    new-array v8, v8, [Landroid/animation/Animator;

    .line 131
    .line 132
    aput-object v0, v8, v5

    .line 133
    .line 134
    aput-object v2, v8, v1

    .line 135
    .line 136
    aput-object v4, v8, v3

    .line 137
    .line 138
    invoke-virtual {v7, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 139
    .line 140
    .line 141
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_1

    .line 146
    .line 147
    new-array v0, v1, [Landroid/animation/Animator;

    .line 148
    .line 149
    aput-object v6, v0, v5

    .line 150
    .line 151
    invoke-virtual {v7, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 152
    .line 153
    .line 154
    :cond_1
    new-instance v0, Ll/skl0$b;

    .line 155
    .line 156
    invoke-direct {v0, p0}, Ll/skl0$b;-><init>(Ll/skl0;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v7, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v7}, Landroid/animation/AnimatorSet;->start()V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    invoke-virtual {p0, v1}, Ll/skl0;->m(Z)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    nop

    .line 171
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public e(FF)F
    .locals 2

    .line 1
    iget v0, p0, Ll/skl0;->b:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    int-to-float v0, v0

    .line 5
    add-float/2addr v0, p2

    .line 6
    div-float/2addr v1, v0

    .line 7
    iget-object p2, p0, Ll/skl0;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    instance-of p2, p2, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget p0, p0, Ll/skl0;->c:I

    .line 18
    .line 19
    int-to-float p2, p0

    .line 20
    int-to-float p0, p0

    .line 21
    const/high16 v0, 0x40000000    # 2.0f

    .line 22
    .line 23
    mul-float/2addr p1, v0

    .line 24
    add-float/2addr p0, p1

    .line 25
    div-float/2addr p2, p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/high16 p2, 0x4f000000

    .line 28
    .line 29
    :goto_0
    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public f(FF)F
    .locals 2

    .line 1
    iget v0, p0, Ll/skl0;->b:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    int-to-float v0, v0

    .line 5
    add-float/2addr v0, p2

    .line 6
    div-float/2addr v1, v0

    .line 7
    iget-object p2, p0, Ll/skl0;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    instance-of p2, p2, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget p0, p0, Ll/skl0;->c:I

    .line 18
    .line 19
    int-to-float p2, p0

    .line 20
    int-to-float p0, p0

    .line 21
    const/high16 v0, 0x40000000    # 2.0f

    .line 22
    .line 23
    mul-float/2addr p1, v0

    .line 24
    add-float/2addr p0, p1

    .line 25
    div-float/2addr p2, p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/high16 p2, 0x4f000000

    .line 28
    .line 29
    :goto_0
    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public g(FF)F
    .locals 0

    .line 1
    return p1
.end method

.method public h(FF)F
    .locals 0

    .line 1
    return p2
.end method

.method public final i()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d2()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public final synthetic j(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic k(FFFLandroid/animation/ValueAnimator;FLandroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-float/2addr v0, p1

    .line 6
    sub-float/2addr p1, v0

    .line 7
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 8
    .line 9
    .line 10
    move-result p6

    .line 11
    mul-float/2addr p6, p2

    .line 12
    sub-float/2addr p2, p6

    .line 13
    iget-object p6, p0, Ll/skl0;->a:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p6, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/skl0;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    const/high16 p1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    sub-float p2, p1, p3

    .line 26
    .line 27
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 28
    .line 29
    .line 30
    move-result p6

    .line 31
    mul-float/2addr p2, p6

    .line 32
    add-float/2addr p3, p2

    .line 33
    sub-float/2addr p1, p5

    .line 34
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    mul-float/2addr p1, p2

    .line 39
    add-float/2addr p5, p1

    .line 40
    iget-object p1, p0, Ll/skl0;->a:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Landroid/view/View;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p0, p5}, Landroid/view/View;->setScaleY(F)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public l(FF)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/skl0;->f:Ll/y3h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/skl0;->f:Ll/y3h;

    .line 10
    .line 11
    invoke-interface {v0, p1, p2}, Ll/y3h;->a(FF)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/skl0;->e:Ll/z3h;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/skl0;->e:Ll/z3h;

    .line 23
    .line 24
    invoke-interface {v0, p1, p2}, Ll/am50;->c(FF)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ll/skl0;->g(FF)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Ll/skl0;->h(FF)F

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p0, p1, p2}, Ll/skl0;->e(FF)F

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const v2, 0x3f19999a    # 0.6f

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 70
    .line 71
    invoke-virtual {p0, p1, p2}, Ll/skl0;->f(FF)F

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-static {p0, v2}, Ljava/lang/Math;->max(FF)F

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-virtual {v0, p0}, Landroid/view/View;->setScaleY(F)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/skl0;->e:Ll/z3h;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/skl0;->e:Ll/z3h;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/am50;->d()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    iget-object p1, p0, Ll/skl0;->f:Ll/y3h;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Ll/skl0;->f:Ll/y3h;

    .line 26
    .line 27
    invoke-interface {p1}, Ll/y3h;->b()V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p1, p0, Ll/skl0;->e:Ll/z3h;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Ll/skl0;->e:Ll/z3h;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/z3h;->a()V

    .line 41
    .line 42
    .line 43
    :cond_3
    invoke-virtual {p0}, Ll/skl0;->n()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final n()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/skl0;->d:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/skl0;->d:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/skl0;->d:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    iget-object v0, p0, Ll/skl0;->a:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    const/4 v0, 0x0

    .line 52
    cmpl-float v1, v3, v0

    .line 53
    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    cmpl-float v0, v4, v0

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :goto_0
    return-void

    .line 62
    :cond_3
    :goto_1
    const/4 v0, 0x2

    .line 63
    new-array v0, v0, [F

    .line 64
    .line 65
    fill-array-data v0, :array_0

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-wide/16 v1, 0x64

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 79
    .line 80
    const/high16 v1, 0x40000000    # 2.0f

    .line 81
    .line 82
    invoke-direct {v0, v1}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v6, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/qkl0;

    .line 89
    .line 90
    move-object v2, p0

    .line 91
    invoke-direct/range {v1 .. v7}, Ll/qkl0;-><init>(Ll/skl0;FFFLandroid/animation/ValueAnimator;F)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 95
    .line 96
    .line 97
    new-instance p0, Ll/skl0$a;

    .line 98
    .line 99
    invoke-direct {p0, v2}, Ll/skl0$a;-><init>(Ll/skl0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 103
    .line 104
    .line 105
    iput-object v6, v2, Ll/skl0;->d:Landroid/animation/ValueAnimator;

    .line 106
    .line 107
    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public o(Ll/y3h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/skl0;->f:Ll/y3h;

    .line 2
    .line 3
    return-void
.end method
