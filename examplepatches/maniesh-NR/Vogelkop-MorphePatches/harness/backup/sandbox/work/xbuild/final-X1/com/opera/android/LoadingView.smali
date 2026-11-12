.class public Lcom/opera/android/LoadingView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Ltah;

.field public b:Llv3;

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 10

    iget-boolean v0, p0, Lcom/opera/android/LoadingView;->c:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/LoadingView;->c:Z

    iget-object p0, p0, Lcom/opera/android/LoadingView;->a:Ltah;

    iget-object v1, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v1, Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    sget-object v1, Lyne;->b:Ldeg;

    iget-object v2, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Ldeg;->c(Landroid/widget/ImageView;)V

    if-nez p1, :cond_22

    invoke-virtual {p0}, Ltah;->x()V

    goto :goto_95

    :cond_22
    iget-object p1, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    new-array v2, v1, [F

    const/4 v3, 0x0

    aput v3, v2, v0

    const-string v3, "alpha"

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iget-object v2, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v2, Landroid/widget/FrameLayout;

    new-array v4, v1, [F

    const/high16 v5, 0x40200000    # 2.5f

    aput v5, v4, v0

    const-string v6, "scaleX"

    invoke-static {v2, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iget-object v4, p0, Ltah;->g:Ljava/lang/Object;

    check-cast v4, Landroid/widget/FrameLayout;

    new-array v6, v1, [F

    aput v5, v6, v0

    const-string v5, "scaleY"

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    iget-object v5, p0, Ltah;->d:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/LoadingView;

    const/4 v6, 0x2

    new-array v7, v6, [F

    fill-array-data v7, :array_96

    invoke-static {v5, v3, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    sget-object v5, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p1, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v4, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v3, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v5, p0, Ltah;->j:Ljava/lang/Object;

    const/4 v7, 0x4

    new-array v7, v7, [Landroid/animation/Animator;

    aput-object p1, v7, v0

    aput-object v2, v7, v1

    aput-object v4, v7, v6

    const/4 p1, 0x3

    aput-object v3, v7, p1

    invoke-virtual {v5, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p1, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p1, Landroid/animation/AnimatorSet;

    new-instance v0, Lkc;

    invoke-direct {v0, p0}, Lkc;-><init>(Ltah;)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Ltah;->j:Ljava/lang/Object;

    check-cast p0, Landroid/animation/AnimatorSet;

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    :cond_95
    :goto_95
    return-void

    :array_96
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final b(Ltah;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/LoadingView;->a:Ltah;

    if-eq v0, p1, :cond_87

    if-eqz v0, :cond_28

    iget-object v1, v0, Ltah;->j:Ljava/lang/Object;

    check-cast v1, Landroid/animation/AnimatorSet;

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    iput-object v2, v0, Ltah;->j:Ljava/lang/Object;

    :cond_12
    iget-object v1, v0, Ltah;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/LoadingView;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    iget-object v1, v0, Ltah;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/LoadingView;

    iget-object v3, v0, Ltah;->g:Ljava/lang/Object;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iput-object v2, v0, Ltah;->d:Ljava/lang/Object;

    :cond_28
    iput-object p1, p0, Lcom/opera/android/LoadingView;->a:Ltah;

    if-eqz p1, :cond_87

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Ltah;->g:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    if-nez v1, :cond_7e

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p1, Ltah;->g:Ljava/lang/Object;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p1, Ltah;->h:Ljava/lang/Object;

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p1, Ltah;->g:Ljava/lang/Object;

    check-cast v3, Landroid/widget/FrameLayout;

    iget-object v4, p1, Ltah;->h:Ljava/lang/Object;

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v3, Lwmj;

    invoke-direct {v3, v0}, Lwmj;-><init>(Landroid/content/Context;)V

    iput-object v3, p1, Ltah;->i:Ljava/lang/Object;

    iput-boolean v2, v3, Lwmj;->e:Z

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p1, Ltah;->g:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p1, Ltah;->i:Ljava/lang/Object;

    check-cast v1, Lwmj;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Le3g;

    iget-object v1, p1, Ltah;->h:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Le3g;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p1, Ltah;->k:Ljava/lang/Object;

    :cond_7e
    iput-object p0, p1, Ltah;->d:Ljava/lang/Object;

    iget-object p1, p1, Ltah;->g:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_87
    return-void
.end method

.method public final onSetAlpha(I)Z
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onSetAlpha(I)Z

    move-result p1

    iget-object v0, p0, Lcom/opera/android/LoadingView;->b:Llv3;

    if-eqz v0, :cond_1d

    iget-boolean v1, p0, Lcom/opera/android/LoadingView;->d:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    iget-object v0, v0, Llv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y1:Lpde;

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_1d
    return p1
.end method

.method public final onVisibilityAggregated(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onVisibilityAggregated(Z)V

    iput-boolean p1, p0, Lcom/opera/android/LoadingView;->d:Z

    iget-object v0, p0, Lcom/opera/android/LoadingView;->b:Llv3;

    if-eqz v0, :cond_1c

    if-eqz p1, :cond_10

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    iget-object p1, v0, Llv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->y1:Lpde;

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_1c
    return-void
.end method
