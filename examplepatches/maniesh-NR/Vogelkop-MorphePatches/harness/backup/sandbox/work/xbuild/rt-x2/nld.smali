.class public final Lnld;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# instance fields
.field public final a:Lnrl;

.field public final b:Lqe6;

.field public final c:Llld;

.field public final d:Lwub;

.field public final e:Lbp;

.field public final f:Lnv6;

.field public final g:Lqfb;

.field public final h:Lpld;

.field public final i:Lold;

.field public final j:Lpgh;

.field public final k:Lmld;

.field public l:Z

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Lhld;Lmig;La0n;Leme;Z)V
    .registers 16

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    new-instance v0, Lmld;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmld;-><init>(Lnld;B)V

    iput-object v0, p0, Lnld;->k:Lmld;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnld;->l:Z

    new-instance v2, Lnrl;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p1, v2, Lnrl;->b:Ljava/lang/Object;

    iput-boolean p5, v2, Lnrl;->a:Z

    if-eqz p5, :cond_34

    iget-object p5, p1, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    new-instance v3, Lao4;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p5, Landroidx/mediarouter/app/OperaMediaRouteButton;->d:Lcnd;

    new-instance v3, Lr16;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iget-object v4, p5, Landroidx/mediarouter/app/OperaMediaRouteButton;->e:Lr16;

    if-eq v3, v4, :cond_3b

    iput-object v3, p5, Landroidx/mediarouter/app/OperaMediaRouteButton;->e:Lr16;

    invoke-virtual {p5}, Landroidx/mediarouter/app/OperaMediaRouteButton;->c()V

    invoke-virtual {p5}, Landroidx/mediarouter/app/OperaMediaRouteButton;->b()V

    goto :goto_3b

    :cond_34
    iget-object p5, p1, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    const/16 v3, 0x8

    invoke-virtual {p5, v3}, Landroidx/mediarouter/app/OperaMediaRouteButton;->setVisibility(I)V

    :cond_3b
    :goto_3b
    iput-object v2, p0, Lnld;->a:Lnrl;

    new-instance p5, Lqe6;

    const/16 v2, 0x1d

    invoke-direct {p5, p1, v2}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object p5, p0, Lnld;->b:Lqe6;

    new-instance v2, Llld;

    invoke-direct {v2, p1, v1}, Llld;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Lnld;->c:Llld;

    new-instance v1, Lwub;

    invoke-direct {v1, p1}, Lwub;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lnld;->d:Lwub;

    new-instance v5, Lbp;

    invoke-direct {v5, p1}, Lbp;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lnld;->e:Lbp;

    new-instance v6, Lnv6;

    invoke-direct {v6, p1}, Lnv6;-><init>(Ljava/lang/Object;)V

    iput-object v6, p0, Lnld;->f:Lnv6;

    new-instance v7, Lqfb;

    const/16 v1, 0x9

    invoke-direct {v7, p1, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v7, p0, Lnld;->g:Lqfb;

    new-instance v1, Lpld;

    iget-object v2, p1, Lhld;->a:Lcom/opera/android/custom_views/InterceptableFrameLayout;

    invoke-direct {v1, p2, v5, v2, p5}, Lpld;-><init>(Lmig;Lbp;Landroid/view/View;Lqe6;)V

    iput-object v1, p0, Lnld;->h:Lpld;

    new-instance v2, Lold;

    iget-object v8, p1, Lhld;->a:Lcom/opera/android/custom_views/InterceptableFrameLayout;

    new-instance v9, Lmld;

    invoke-direct {v9, p0, v0}, Lmld;-><init>(Lnld;B)V

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v2 .. v9}, Lold;-><init>(La0n;Leme;Lbp;Lnv6;Lqfb;Landroid/view/View;Lmld;)V

    iput-object v2, p0, Lnld;->i:Lold;

    new-instance p3, Lpgh;

    new-instance p4, Lrgh;

    iget-object p5, p1, Lhld;->p:Lpt1;

    invoke-direct {p4, p5}, Lrgh;-><init>(Lpt1;)V

    iget-object p1, p1, Lhld;->e:Landroid/view/View;

    new-instance p5, Lild;

    invoke-direct {p5, p0}, Lild;-><init>(Lnld;)V

    invoke-direct {p3, p4, p2, p1, p5}, Lpgh;-><init>(Lrgh;Lmig;Landroid/view/View;Logh;)V

    iput-object p3, p0, Lnld;->j:Lpgh;

    invoke-virtual {p0}, Lnld;->c()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lnld;->j:Lpgh;

    const/4 v1, 0x0

    iput v1, v0, Lpgh;->e:I

    invoke-virtual {p0}, Lnld;->b()V

    iget-object v0, p0, Lnld;->e:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v0, v0, Lhld;->t:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lnld;->f:Lnv6;

    invoke-virtual {v0}, Lnv6;->d()V

    iget-object p0, p0, Lnld;->g:Lqfb;

    invoke-virtual {p0}, Lqfb;->d()V

    return-void
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lnld;->a:Lnrl;

    iget-object v1, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v1, Lhld;

    iget-object v1, v1, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/high16 v2, 0x43160000    # 150.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iget-object v3, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v3, Lhld;

    iget-object v4, v3, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v1, v4}, Lnrl;->e(ILandroid/view/View;)V

    iget-object v4, v3, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v1, v4}, Lnrl;->e(ILandroid/view/View;)V

    iget-boolean v4, v0, Lnrl;->a:Z

    if-eqz v4, :cond_27

    iget-object v3, v3, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {v0, v1, v3}, Lnrl;->e(ILandroid/view/View;)V

    :cond_27
    iget-object v0, p0, Lnld;->b:Lqe6;

    iget-object v1, v0, Lqe6;->b:Ljava/lang/Object;

    check-cast v1, Lhld;

    iget-object v1, v1, Lhld;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lqe6;->M(I)V

    iget-object v0, p0, Lnld;->c:Llld;

    iget-object v1, v0, Llld;->b:Ljava/lang/Object;

    check-cast v1, Lhld;

    iget-object v3, v1, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v3

    mul-float/2addr v3, v2

    float-to-int v3, v3

    iget-object v4, v1, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v3, v4}, Llld;->a0(ILandroid/view/View;)V

    iget-object v4, v1, Lhld;->k:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v3, v4}, Llld;->a0(ILandroid/view/View;)V

    iget-object v4, v1, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    invoke-virtual {v0, v3, v4}, Llld;->a0(ILandroid/view/View;)V

    iget-object v4, v1, Lhld;->f:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v3, v4}, Llld;->a0(ILandroid/view/View;)V

    iget-object v1, v1, Lhld;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v3, v1}, Llld;->a0(ILandroid/view/View;)V

    iget-object v0, p0, Lnld;->d:Lwub;

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Lhld;

    iget-object v1, v0, Lhld;->e:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iget-object v0, v0, Lhld;->e:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_7a

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    goto :goto_8c

    :cond_7a
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    :goto_8c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnld;->l:Z

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lnld;->j:Lpgh;

    iget v0, v0, Lpgh;->e:I

    if-lez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lnld;->k:Lmld;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-boolean v1, p0, Lnld;->m:Z

    if-eqz v1, :cond_19

    iget-boolean p0, p0, Lnld;->n:Z

    if-nez p0, :cond_19

    const-wide/16 v1, 0xbb8

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_19
    return-void
.end method

.method public final onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object p0, p0, Lnld;->j:Lpgh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget-object v0, p0, Lpgh;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    cmpg-float p1, p1, v0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-gez p1, :cond_1b

    move p1, v1

    goto :goto_1c

    :cond_1b
    move p1, v0

    :goto_1c
    iget-boolean v2, p0, Lpgh;->i:Z

    if-eqz v2, :cond_22

    if-nez p1, :cond_28

    :cond_22
    iget-boolean v2, p0, Lpgh;->j:Z

    if-eqz v2, :cond_2c

    if-nez p1, :cond_2c

    :cond_28
    invoke-virtual {p0, p1}, Lpgh;->b(Z)V

    return v1

    :cond_2c
    return v0
.end method

.method public final onDown(Landroid/view/MotionEvent;)Z
    .registers 10

    iget-object v0, p0, Lnld;->h:Lpld;

    iget-boolean v1, v0, Lpld;->f:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_12

    iget-wide v4, v0, Lpld;->i:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_12

    move v1, v2

    goto :goto_13

    :cond_12
    move v1, v3

    :goto_13
    iput-boolean v1, v0, Lpld;->g:Z

    iput-boolean v3, v0, Lpld;->h:Z

    iget-object p0, p0, Lnld;->i:Lold;

    iget-object v0, p0, Lold;->g:Leme;

    iget-object v4, p0, Lold;->f:La0n;

    iget-object v5, p0, Lold;->d:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    if-lez v5, :cond_52

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    cmpg-float p1, p1, v5

    if-gtz p1, :cond_45

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v4, p0, Lold;->h:La0n;

    const p1, 0x7f080628

    iput p1, p0, Lold;->k:I

    const p1, 0x7f08062b

    iput p1, p0, Lold;->l:I

    iget-object p1, p0, Lold;->b:Lnv6;

    iput-object p1, p0, Lold;->j:Lqld;

    goto :goto_52

    :cond_45
    iput-object v0, p0, Lold;->h:La0n;

    const p1, 0x7f080508

    iput p1, p0, Lold;->k:I

    iput p1, p0, Lold;->l:I

    iget-object p1, p0, Lold;->c:Lqfb;

    iput-object p1, p0, Lold;->j:Lqld;

    :cond_52
    :goto_52
    const/4 p1, 0x0

    iput-object p1, p0, Lold;->i:La0n;

    iget-object p0, p0, Lold;->h:La0n;

    if-eqz p0, :cond_5b

    move p0, v2

    goto :goto_5c

    :cond_5b
    move p0, v3

    :goto_5c
    if-nez v1, :cond_61

    if-nez p0, :cond_61

    return v3

    :cond_61
    return v2
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 18

    iget-object v0, p0, Lnld;->h:Lpld;

    iget-object v1, v0, Lpld;->b:Lmig;

    iget-boolean v2, v0, Lpld;->g:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_46

    iput-boolean v4, v0, Lpld;->g:Z

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v2, v2, v5

    if-lez v2, :cond_46

    iget-object v2, v0, Lpld;->d:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    if-lez v2, :cond_46

    iget-object v5, v0, Lpld;->e:Lqe6;

    iget-object v6, v5, Lqe6;->b:Ljava/lang/Object;

    check-cast v6, Lhld;

    iget-object v6, v6, Lhld;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/view/View;->getAlpha()F

    move-result v6

    const/high16 v7, 0x43160000    # 150.0f

    mul-float/2addr v6, v7

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Lqe6;->M(I)V

    iput-boolean v3, v0, Lpld;->h:Z

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v5

    invoke-interface {v5}, Lgig;->getCurrentPosition()J

    move-result-wide v5

    iput-wide v5, v0, Lpld;->j:J

    const v5, 0x47ea6000    # 120000.0f

    int-to-float v2, v2

    div-float/2addr v5, v2

    iput v5, v0, Lpld;->k:F

    :cond_46
    iget-boolean v2, v0, Lpld;->h:Z

    if-eqz v2, :cond_a8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    sub-float/2addr v2, v5

    iget-wide v5, v0, Lpld;->j:J

    iget v7, v0, Lpld;->k:F

    mul-float/2addr v7, v2

    float-to-long v7, v7

    add-long/2addr v7, v5

    iget-wide v9, v0, Lpld;->i:J

    const-wide/16 v11, 0x0

    cmp-long v2, v7, v11

    if-gez v2, :cond_64

    move-wide v7, v11

    goto :goto_69

    :cond_64
    cmp-long v2, v7, v9

    if-lez v2, :cond_69

    move-wide v7, v9

    :cond_69
    :goto_69
    sub-long v5, v7, v5

    cmp-long v2, v5, v11

    if-ltz v2, :cond_73

    const v2, 0x7f080561

    goto :goto_76

    :cond_73
    const v2, 0x7f0805e2

    :goto_76
    iget-object v5, v0, Lpld;->c:Lbp;

    iget-object v0, v0, Lpld;->a:Lc5o;

    invoke-virtual {v0, v7, v8}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v0

    iget-object v6, v5, Lbp;->b:Ljava/lang/Object;

    check-cast v6, Lhld;

    iget v9, v5, Lbp;->a:I

    if-eq v2, v9, :cond_8d

    iput v2, v5, Lbp;->a:I

    iget-object v5, v6, Lhld;->u:Landroid/widget/ImageView;

    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_8d
    iget-object v2, v6, Lhld;->v:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v6, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->getCurrentWindowIndex()I

    move-result v1

    invoke-interface {v0, v1, v7, v8}, Lgig;->seekTo(IJ)V

    move v0, v3

    goto :goto_a9

    :cond_a8
    move v0, v4

    :goto_a9
    iget-object p0, p0, Lnld;->i:Lold;

    iget-object v1, p0, Lold;->h:La0n;

    if-eqz v1, :cond_d9

    const/4 v2, 0x0

    iput-object v2, p0, Lold;->h:La0n;

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v2, v2, v5

    if-lez v2, :cond_d9

    iget-object v2, p0, Lold;->d:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    if-lez v2, :cond_d9

    iget-object v5, p0, Lold;->e:Lmld;

    invoke-virtual {v5}, Lmld;->run()V

    iput-object v1, p0, Lold;->i:La0n;

    invoke-interface {v1}, La0n;->i()I

    move-result v1

    iput v1, p0, Lold;->m:I

    const/high16 v1, 0x42f00000    # 120.0f

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lold;->n:F

    :cond_d9
    iget-object v1, p0, Lold;->i:La0n;

    if-eqz v1, :cond_125

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    sub-float/2addr p1, v1

    iget v1, p0, Lold;->m:I

    iget v2, p0, Lold;->n:F

    mul-float/2addr v2, p1

    float-to-int p1, v2

    add-int/2addr v1, p1

    const/16 p1, 0x64

    invoke-static {v1, v4, p1}, Lnb6;->j(III)I

    move-result p1

    iget-object v1, p0, Lold;->a:Lbp;

    if-lez p1, :cond_fa

    iget v2, p0, Lold;->k:I

    goto :goto_fc

    :cond_fa
    iget v2, p0, Lold;->l:I

    :goto_fc
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v6, Lhld;

    iget v7, v1, Lbp;->a:I

    if-eq v2, v7, :cond_10f

    iput v2, v1, Lbp;->a:I

    iget-object v1, v6, Lhld;->u:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_10f
    iget-object v1, v6, Lhld;->v:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v6, Lhld;->t:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lold;->j:Lqld;

    invoke-interface {v1, p1}, Lqld;->show(I)V

    iget-object p0, p0, Lold;->i:La0n;

    invoke-interface {p0, p1}, La0n;->G(I)V

    move p0, v3

    goto :goto_126

    :cond_125
    move p0, v4

    :goto_126
    if-nez v0, :cond_12b

    if-nez p0, :cond_12b

    return v4

    :cond_12b
    return v3
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 10

    iget-object p1, p0, Lnld;->j:Lpgh;

    iget v0, p1, Lpgh;->e:I

    const/4 v1, 0x0

    if-lez v0, :cond_8

    return v1

    :cond_8
    iget-boolean v0, p0, Lnld;->l:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lnld;->a()V

    return v2

    :cond_11
    iget-object v0, p0, Lnld;->a:Lnrl;

    iget-object v3, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v3, Lhld;

    iget-object v4, v3, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v4, v5, v4

    const/high16 v6, 0x43160000    # 150.0f

    mul-float/2addr v4, v6

    float-to-int v4, v4

    iget-object v7, v3, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v4, v7}, Lnrl;->f(ILandroid/view/View;)V

    iget-object v7, v3, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v4, v7}, Lnrl;->f(ILandroid/view/View;)V

    iget-boolean v7, v0, Lnrl;->a:Z

    if-eqz v7, :cond_38

    iget-object v3, v3, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {v0, v4, v3}, Lnrl;->f(ILandroid/view/View;)V

    :cond_38
    iget-object v0, p0, Lnld;->b:Lqe6;

    iget-object v3, v0, Lqe6;->b:Ljava/lang/Object;

    check-cast v3, Lhld;

    iget-object v4, v3, Lhld;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v4

    sub-float v4, v5, v4

    mul-float/2addr v4, v6

    float-to-int v4, v4

    iget-object v3, v3, Lhld;->l:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    int-to-long v6, v4

    invoke-virtual {v5, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    sget-object v5, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    new-instance v5, Lc48;

    invoke-direct {v5, v0, v3}, Lc48;-><init>(Lqe6;Landroid/view/View;)V

    invoke-virtual {v4, v5}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lnld;->c:Llld;

    invoke-virtual {v0}, Llld;->p0()V

    iget-object v0, p0, Lnld;->d:Lwub;

    invoke-virtual {v0}, Lwub;->P()V

    iput-boolean v2, p0, Lnld;->l:Z

    iput v1, p1, Lpgh;->e:I

    invoke-virtual {p0}, Lnld;->c()V

    return v2
.end method

.method public final onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 2

    iget-object p0, p0, Lnld;->j:Lpgh;

    invoke-virtual {p0, p1}, Lpgh;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
