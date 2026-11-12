.class public final Lvkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Landroid/view/View;

.field public final d:Landroid/view/View;

.field public final e:Lcom/opera/android/media/MediaPlayerMini;

.field public final f:Lsjg;

.field public final g:Landroid/animation/ValueAnimator;

.field public final h:Landroid/graphics/Rect;

.field public final i:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/view/ViewGroup;ZLandroid/graphics/Rect;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v0

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz p4, :cond_1b

    move v3, v1

    move v1, v2

    goto :goto_1c

    :cond_1b
    move v3, v2

    :goto_1c
    const v4, 0x7f0a0679

    invoke-virtual {p1, v4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvkd;

    if-eqz v5, :cond_38

    iget-object v3, v5, Lvkd;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v5, v5, Lvkd;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_38
    invoke-virtual {p1, v4, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    iput-object p5, p0, Lvkd;->a:Landroid/graphics/Rect;

    iput-object p3, p0, Lvkd;->b:Landroid/view/ViewGroup;

    iput-object p1, p0, Lvkd;->c:Landroid/view/View;

    iput-object p2, p0, Lvkd;->d:Landroid/view/View;

    const p1, 0x7f0d0287

    const/4 p2, 0x0

    invoke-static {p3, p1, p3, p2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/media/MediaPlayerMini;

    iput-object p1, p0, Lvkd;->e:Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Lsjg;

    iget-object v5, p1, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v6, v5, Lei;->f:Ljava/lang/Object;

    check-cast v6, Landroidx/media3/ui/PlayerView;

    const/4 v7, 0x3

    invoke-direct {v4, v7, v6}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object v4, p0, Lvkd;->f:Lsjg;

    xor-int/lit8 v6, p4, 0x1

    const/4 v7, 0x1

    if-nez p4, :cond_69

    invoke-virtual {v0, v4, v7}, Ltjg;->b(Lsjg;Z)V

    goto :goto_71

    :cond_69
    iget-object p4, v5, Lei;->e:Landroid/view/View;

    check-cast p4, Lcom/opera/android/media/PlayerContainerView;

    const/4 v4, 0x4

    invoke-virtual {p4, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_71
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationZ(F)V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    check-cast p4, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p5, :cond_8b

    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    move-result v2

    iput v2, p4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    move-result v2

    iput v2, p4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {p1, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_8b
    invoke-static {p3}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p1

    if-eqz p5, :cond_aa

    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    move-result p4

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eq p4, v2, :cond_aa

    new-instance p4, Landroid/graphics/Rect;

    invoke-direct {p4, p5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iget p5, p1, Landroid/graphics/Rect;->left:I

    neg-int p5, p5

    iget p1, p1, Landroid/graphics/Rect;->top:I

    neg-int p1, p1

    invoke-virtual {p4, p5, p1}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_c2

    :cond_aa
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p4

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, p5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iget p5, p1, Landroid/graphics/Rect;->left:I

    neg-int p5, p5

    iget p1, p1, Landroid/graphics/Rect;->top:I

    neg-int p1, p1

    invoke-virtual {v2, p5, p1}, Landroid/graphics/Rect;->offset(II)V

    iget p1, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr p1, p4

    iput p1, v2, Landroid/graphics/Rect;->bottom:I

    move-object p4, v2

    :goto_c2
    iput-object p4, p0, Lvkd;->h:Landroid/graphics/Rect;

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p3

    new-instance p4, Landroid/graphics/Rect;

    invoke-direct {p4, p2, p2, p1, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p4, p0, Lvkd;->i:Landroid/graphics/Rect;

    const/4 p1, 0x2

    new-array p1, p1, [F

    aput v3, p1, p2

    aput v1, p1, v7

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lvkd;->g:Landroid/animation/ValueAnimator;

    const-wide/16 p2, 0x12c

    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object p2, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p2, Lcf1;

    invoke-direct {p2, p0, v6, v0}, Lcf1;-><init>(Lvkd;ZLtjg;)V

    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 11

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lvkd;->h:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget-object v2, p0, Lvkd;->i:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    invoke-static {v3, v1, p1, v1}, Lv0g;->g(FFFF)F

    move-result v1

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    iget v4, v2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    invoke-static {v4, v3, p1, v3}, Lv0g;->g(FFFF)F

    move-result v3

    iget v4, v0, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    iget v5, v2, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    invoke-static {v5, v4, p1, v4}, Lv0g;->g(FFFF)F

    move-result v4

    iget v5, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    invoke-static {v6, v5, p1, v5}, Lv0g;->g(FFFF)F

    move-result v5

    iget-object v6, p0, Lvkd;->b:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/4 v8, 0x0

    add-float/2addr v7, v8

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, v8

    sub-float/2addr v4, v1

    sub-float/2addr v7, v8

    div-float/2addr v4, v7

    iget-object v7, p0, Lvkd;->c:Landroid/view/View;

    invoke-virtual {v7, v4}, Landroid/view/View;->setScaleX(F)V

    sub-float/2addr v5, v3

    sub-float/2addr v6, v8

    div-float/2addr v5, v6

    invoke-virtual {v7, v5}, Landroid/view/View;->setScaleY(F)V

    sub-float/2addr v1, v8

    invoke-virtual {v7, v1}, Landroid/view/View;->setTranslationX(F)V

    sub-float v4, v3, v8

    invoke-virtual {v7, v4}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setPivotY(F)V

    const/high16 v5, 0x3f800000    # 1.0f

    iget-object v6, p0, Lvkd;->a:Landroid/graphics/Rect;

    if-eqz v6, :cond_87

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-ne v7, v2, :cond_87

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    sub-int/2addr v2, v6

    int-to-float v2, v2

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    sub-float/2addr v3, v2

    sub-float/2addr v0, v2

    div-float/2addr v3, v0

    invoke-static {v3, v8, v5}, Lcs5;->s(FFF)F

    move-result v0

    sub-float v0, v5, v0

    goto :goto_88

    :cond_87
    move v0, v5

    :goto_88
    iget-object v2, p0, Lvkd;->d:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    sub-float/2addr v5, p1

    iget-object p0, p0, Lvkd;->e:Lcom/opera/android/media/MediaPlayerMini;

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v4}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p0, v5}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
