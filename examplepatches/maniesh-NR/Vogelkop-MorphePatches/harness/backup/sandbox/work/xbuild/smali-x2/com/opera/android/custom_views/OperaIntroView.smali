.class public Lcom/opera/android/custom_views/OperaIntroView;
.super Lcom/opera/android/widget/ThemeableLottieAnimationView;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# static fields
.field public static final synthetic F:I


# instance fields
.field public final A:Ljava/util/PriorityQueue;

.field public B:Lelf;

.field public C:I

.field public D:F

.field public E:Ljava/lang/Float;

.field public final y:Lnli;

.field public final z:Ldlf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lnli;

    invoke-direct {p1}, Lnli;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->y:Lnli;

    new-instance p1, Ldlf;

    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->z:Ldlf;

    new-instance p2, Ljava/util/PriorityQueue;

    invoke-direct {p2}, Ljava/util/PriorityQueue;-><init>()V

    iput-object p2, p0, Lcom/opera/android/custom_views/OperaIntroView;->A:Ljava/util/PriorityQueue;

    const/4 p2, 0x0

    iput p2, p0, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    new-instance v0, Li3d;

    const-string v1, "color0"

    const v2, 0x7f04056e

    invoke-direct {v0, v1, v2}, Li3d;-><init>(Ljava/lang/String;I)V

    new-instance v1, Li3d;

    const-string v2, "color1"

    const v3, 0x7f04056f

    invoke-direct {v1, v2, v3}, Li3d;-><init>(Ljava/lang/String;I)V

    new-instance v4, Li3d;

    sget-object v5, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v5, 0x2

    invoke-direct {v4, v3, v5, v2, p2}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {v0, v1, v4}, [Li3d;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    const-string p2, "progressBar"

    invoke-static {p2}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p2

    sget-object v0, Lk3d;->j:Lnli;

    new-instance v1, Lkqd;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p2, v0, v1}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaIntroView;->B:Lelf;

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaIntroView;->B()F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    :goto_11
    iget-object v1, p0, Lcom/opera/android/custom_views/OperaIntroView;->A:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_35

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-gt v2, v0, :cond_35

    iget-object v2, p0, Lcom/opera/android/custom_views/OperaIntroView;->B:Lelf;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v2, v1}, Lelf;->onProgress(I)V

    goto :goto_11

    :cond_35
    return-void
.end method

.method public final B()F
    .registers 2

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaIntroView;->z:Ldlf;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_13

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaIntroView;->E:Ljava/lang/Float;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0

    :cond_13
    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method public final C(I)V
    .registers 4

    iget v0, p0, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    new-instance v0, Lea3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lea3;-><init>(Ljava/lang/Object;IB)V

    iget-object p1, p0, Ln2d;->d:Lf3d;

    iget-object p1, p1, Lf3d;->b:Lp3d;

    invoke-virtual {p1, v0}, Lp3d;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ln2d;->p(I)V

    return-void
.end method

.method public final D(Lelf;Ljava/util/List;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaIntroView;->A:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->clear()V

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->B:Lelf;

    if-eqz p2, :cond_20

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_20
    return-void
.end method

.method public final E(FI)V
    .registers 11

    iget v0, p0, Lcom/opera/android/custom_views/OperaIntroView;->D:F

    cmpl-float v0, v0, p1

    if-lez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaIntroView;->B()F

    move-result v0

    iget-object v1, p0, Lcom/opera/android/custom_views/OperaIntroView;->z:Ldlf;

    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    move-result v2

    iget-object v3, p0, Ln2d;->d:Lf3d;

    iget-object v3, v3, Lf3d;->b:Lp3d;

    iget v3, v3, Lp3d;->h:F

    float-to-int v4, v3

    const/16 v5, 0x9c

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-lt v4, v5, :cond_25

    float-to-int v3, v3

    const/16 v4, 0xed

    if-ge v3, v4, :cond_25

    move v3, v7

    goto :goto_26

    :cond_25
    move v3, v6

    :goto_26
    const/4 v4, 0x2

    new-array v4, v4, [F

    aput v0, v4, v6

    aput p1, v4, v7

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    int-to-long v4, p2

    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    if-eqz v2, :cond_3c

    sget-object p2, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    goto :goto_3e

    :cond_3c
    sget-object p2, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    :goto_3e
    invoke-virtual {v1, p2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    if-eqz v3, :cond_46

    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    :cond_46
    invoke-virtual {p0}, Ln2d;->invalidate()V

    iput p1, p0, Lcom/opera/android/custom_views/OperaIntroView;->D:F

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaIntroView;->A()V

    invoke-virtual {p0}, Ln2d;->invalidate()V

    return-void
.end method

.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    instance-of v0, p1, Lflf;

    if-nez v0, :cond_8

    invoke-super {p0, p1}, Ln2d;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    :cond_8
    check-cast p1, Lflf;

    iget-object v0, p1, Lg3;->a:Landroid/os/Parcelable;

    invoke-super {p0, v0}, Ln2d;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    new-instance v0, Lclf;

    invoke-direct {v0, p0, p1}, Lclf;-><init>(Lcom/opera/android/custom_views/OperaIntroView;Lflf;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u(Loll;)V

    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Parcelable;
    .registers 9

    invoke-super {p0}, Ln2d;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Lflf;

    iget v3, p0, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaIntroView;->B()F

    move-result v4

    iget v5, p0, Lcom/opera/android/custom_views/OperaIntroView;->D:F

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaIntroView;->z:Ldlf;

    invoke-virtual {p0}, Landroid/animation/Animator;->getDuration()J

    move-result-wide v6

    long-to-int v6, v6

    move-object v2, v0

    check-cast v2, Lj2d;

    invoke-direct/range {v1 .. v6}, Lflf;-><init>(Lj2d;IFFI)V

    return-object v1
.end method
