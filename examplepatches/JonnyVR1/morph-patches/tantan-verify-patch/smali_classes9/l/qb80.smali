.class public Ll/qb80;
.super Ll/o510;
.source "SourceFile"


# instance fields
.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o510;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/qb80;->n(Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic g(Ll/qb80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qb80;->q()V

    return-void
.end method

.method public static synthetic h(Ll/qb80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qb80;->o()V

    return-void
.end method

.method public static synthetic i(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/qb80;->p(Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method private r()V
    .locals 10

    .line 1
    invoke-static {}, Ll/ynp0;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    div-int/lit8 v5, v0, 0x2

    .line 7
    .line 8
    const v0, 0x3fbe76c9    # 1.488f

    .line 9
    .line 10
    .line 11
    int-to-float v2, v5

    .line 12
    mul-float/2addr v2, v0

    .line 13
    float-to-int v6, v2

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {v0}, Ll/fct;->a(Z)I

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 25
    .line 26
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v2, p0, Ll/o510;->a:Ll/r510$a;

    .line 35
    .line 36
    iget-object v2, v2, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v0, 0x0

    .line 44
    move v2, v0

    .line 45
    :goto_0
    sub-int v8, v0, v5

    .line 46
    .line 47
    sub-int v9, v2, v6

    .line 48
    .line 49
    new-array v0, v1, [F

    .line 50
    .line 51
    fill-array-data v0, :array_0

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/ob80;

    .line 59
    .line 60
    move-object v3, p0

    .line 61
    invoke-direct/range {v2 .. v9}, Ll/ob80;-><init>(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIII)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v1, 0x12c

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    new-instance p0, Ll/pb80;

    .line 78
    .line 79
    invoke-direct {p0, v3}, Ll/pb80;-><init>(Ll/qb80;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, p0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    check-cast v0, Landroid/view/ViewGroup;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 35
    .line 36
    iget-object p0, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    const-string p0, "showRemoteView "

    .line 42
    .line 43
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qb80;->t()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0}, Ll/qb80;->r()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qb80;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Ll/r510$a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o510;->e(Ll/r510$a;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "updateViews"

    .line 5
    .line 6
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(Landroid/view/SurfaceView;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 5
    .line 6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "addRemoteView "

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 8
    .line 9
    iget-object v1, v1, Ll/r510$a;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 21
    .line 22
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 35
    .line 36
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 37
    .line 38
    iget-object v1, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 44
    .line 45
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-direct {p0}, Ll/qb80;->s()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qb80;->m()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/qb80;->c:Landroid/view/SurfaceView;

    .line 6
    .line 7
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/o510;->a:Ll/r510$a;

    .line 6
    .line 7
    iget-object v1, v1, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 15
    .line 16
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 17
    .line 18
    iget-object v1, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    const-string p0, "cleanRemoteView "

    .line 27
    .line 28
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic n(Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p7

    .line 5
    check-cast p7, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p7}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p7

    .line 11
    iget-object v0, p0, Ll/qb80;->b:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    int-to-float v2, p2

    .line 18
    mul-float v3, v2, p7

    .line 19
    .line 20
    float-to-int v3, v3

    .line 21
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 22
    .line 23
    int-to-float v3, p3

    .line 24
    mul-float/2addr v3, p7

    .line 25
    float-to-int v3, v3

    .line 26
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 27
    .line 28
    sub-float v3, v1, p7

    .line 29
    .line 30
    mul-float/2addr v3, v2

    .line 31
    add-float/2addr v3, v2

    .line 32
    float-to-int v2, v3

    .line 33
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 34
    .line 35
    iput p4, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Ll/o510;->a:Ll/r510$a;

    .line 41
    .line 42
    iget-object p1, p1, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-static {p1}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    int-to-float p4, p4

    .line 51
    mul-float/2addr p4, p7

    .line 52
    float-to-int p4, p4

    .line 53
    iput p4, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 54
    .line 55
    int-to-float p2, p2

    .line 56
    int-to-float p4, p5

    .line 57
    sub-float/2addr v1, p7

    .line 58
    mul-float/2addr p4, v1

    .line 59
    add-float/2addr p2, p4

    .line 60
    float-to-int p2, p2

    .line 61
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 62
    .line 63
    int-to-float p2, p3

    .line 64
    int-to-float p3, p6

    .line 65
    mul-float/2addr p3, v1

    .line 66
    add-float/2addr p2, p3

    .line 67
    float-to-int p2, p2

    .line 68
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 69
    .line 70
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 71
    .line 72
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final synthetic o()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/qb80;->k()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic p(Landroid/widget/FrameLayout$LayoutParams;IIIIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p7

    .line 5
    check-cast p7, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p7}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p7

    .line 11
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 12
    .line 13
    iget-object p0, p0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    int-to-float p2, p2

    .line 18
    mul-float/2addr p2, p7

    .line 19
    float-to-int p2, p2

    .line 20
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 21
    .line 22
    int-to-float p2, p3

    .line 23
    sub-int/2addr p3, p4

    .line 24
    int-to-float p3, p3

    .line 25
    mul-float/2addr p3, p7

    .line 26
    sub-float/2addr p2, p3

    .line 27
    float-to-int p2, p2

    .line 28
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 29
    .line 30
    int-to-float p2, p5

    .line 31
    sub-int/2addr p5, p6

    .line 32
    int-to-float p3, p5

    .line 33
    mul-float/2addr p3, p7

    .line 34
    sub-float/2addr p2, p3

    .line 35
    float-to-int p2, p2

    .line 36
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 12
    .line 13
    iget-object p0, p0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public final t()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 12
    .line 13
    iget-object v1, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 27
    .line 28
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 35
    .line 36
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-static {v0}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 45
    .line 46
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 53
    .line 54
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    const/4 v0, 0x2

    .line 61
    new-array v0, v0, [F

    .line 62
    .line 63
    fill-array-data v0, :array_0

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/mb80;

    .line 71
    .line 72
    move-object v2, p0

    .line 73
    invoke-direct/range {v1 .. v8}, Ll/mb80;-><init>(Ll/qb80;Landroid/widget/FrameLayout$LayoutParams;IIIII)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 82
    .line 83
    .line 84
    const-wide/16 v3, 0x12c

    .line 85
    .line 86
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    .line 89
    new-instance p0, Ll/nb80;

    .line 90
    .line 91
    invoke-direct {p0, v2}, Ll/nb80;-><init>(Ll/qb80;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, p0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    return-void

    .line 101
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
