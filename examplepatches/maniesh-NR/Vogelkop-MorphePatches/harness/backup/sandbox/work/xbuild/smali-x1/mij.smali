.class public final Lmij;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# static fields
.field public static final synthetic e:I


# instance fields
.field public a:Landroid/view/View;

.field public final b:Landroid/view/ViewParent;

.field public final c:Landroid/animation/ValueAnimator;

.field public d:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 6

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lmij;->c:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    iput v1, p0, Lmij;->d:I

    iput-object p1, p0, Lmij;->a:Landroid/view/View;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    aput v2, v1, v3

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iput-object v1, p0, Lmij;->b:Landroid/view/ViewParent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0c0087

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object p1, Llf1;->g:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method


# virtual methods
.method public final a(ZZ)V
    .registers 7

    iget v0, p0, Lmij;->d:I

    iget-object v1, p0, Lmij;->c:Landroid/animation/ValueAnimator;

    if-ne v0, p1, :cond_12

    if-eqz p2, :cond_11

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->end()V

    :cond_11
    return-void

    :cond_12
    iput p1, p0, Lmij;->d:I

    invoke-virtual {p0}, Lmij;->b()F

    move-result v0

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    int-to-float p1, p1

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v0, 0x1

    aput p1, v2, v0

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object p1, p0, Lmij;->a:Landroid/view/View;

    instance-of v0, p1, Landroid/view/ViewStub;

    if-eqz v0, :cond_36

    check-cast p1, Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lmij;->a:Landroid/view/View;

    :cond_36
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    if-nez p2, :cond_3f

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :cond_3f
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->end()V

    return-void
.end method

.method public final b()F
    .registers 3

    iget-object v0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    iget-object p0, p0, Lmij;->c:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method public final c()I
    .registers 3

    iget-object v0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    iget-object v0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    iget-object v0, p0, Lmij;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0}, Lmij;->b()F

    move-result p0

    mul-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    invoke-virtual {p0}, Lmij;->b()F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-nez p1, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lmij;->a:Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    iget-object p0, p0, Lmij;->b:Landroid/view/ViewParent;

    invoke-interface {p0}, Landroid/view/ViewParent;->requestLayout()V

    return-void
.end method
