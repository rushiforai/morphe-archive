.class public Lcom/opera/android/media/MediaPlayerBottomSlideLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static final synthetic d:I


# instance fields
.field public a:Z

.field public b:Landroid/animation/ValueAnimator;

.field public c:Lcld;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a()F
    .registers 2

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    :cond_f
    iget-boolean p0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    if-eqz p0, :cond_16

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final b(Z)V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a()F

    move-result v0

    if-eqz p1, :cond_e

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    iget-object v2, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_16
    iput-boolean p1, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    const/4 p1, 0x2

    new-array p1, p1, [F

    const/4 v2, 0x0

    aput v0, p1, v2

    const/4 v0, 0x1

    aput v1, p1, v0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    sget-object v0, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    new-instance v0, Lnl2;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    new-instance v0, Lkc;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final c()V
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a()F

    move-result v4

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a()F

    move-result v5

    neg-float v5, v5

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v6

    cmpl-float v6, v5, v6

    if-eqz v6, :cond_43

    invoke-virtual {v1, v5}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationY(F)V

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v5, v4, v5

    if-eqz v5, :cond_2f

    move v5, v2

    goto :goto_30

    :cond_2f
    move v5, v0

    :goto_30
    invoke-virtual {v1, v5}, Landroid/view/View;->setEnabled(Z)V

    const/4 v1, 0x0

    cmpl-float v1, v4, v1

    if-eqz v1, :cond_39

    move v0, v2

    :cond_39
    invoke-virtual {v3, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->c:Lcld;

    if-eqz p0, :cond_43

    invoke-virtual {p0}, Lcld;->run()V

    :cond_43
    return-void
.end method

.method public final onFinishInflate()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 7

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p4

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p5

    invoke-virtual {p2, p1, p1, p4, p5}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result p4

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result p5

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result p2

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p2

    invoke-virtual {p3, p1, p4, p5, v0}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->c()V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method
