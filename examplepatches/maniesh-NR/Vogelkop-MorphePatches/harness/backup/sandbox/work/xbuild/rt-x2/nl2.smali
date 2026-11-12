.class public final synthetic Lnl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lnl2;->a:B

    iput-object p1, p0, Lnl2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 7

    iget-byte v0, p0, Lnl2;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    iget-object p0, p0, Lnl2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_278

    check-cast p0, Lxbf;

    iget-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p1, Lwbn;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object p0, p0, Ln2d;->d:Lf3d;

    iget-object p0, p0, Lf3d;->b:Lp3d;

    iget p0, p0, Lp3d;->h:F

    float-to-int p0, p0

    iget v0, p1, Lwbn;->d:I

    if-eq v0, p0, :cond_41

    iget v1, p1, Lwbn;->b:F

    sub-int v0, p0, v0

    if-gtz v0, :cond_32

    iget-object v2, p1, Lwbn;->c:Ls75;

    iget-object v2, v2, Ls75;->c:Ljava/lang/Object;

    check-cast v2, Lk2d;

    iget-short v4, v2, Lk2d;->b:S

    add-int/2addr v0, v4

    iget-short v2, v2, Lk2d;->a:S

    sub-int/2addr v0, v2

    :cond_32
    int-to-float v0, v0

    mul-float/2addr v0, v3

    add-float/2addr v0, v1

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float/2addr v0, v1

    iput v0, p1, Lwbn;->b:F

    iput p0, p1, Lwbn;->d:I

    iget-object p0, p1, Lwbn;->a:Lm2n;

    invoke-virtual {p0}, Lm2n;->invoke()Ljava/lang/Object;

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Ld0n;

    iget-object p1, p0, Ld0n;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object p1, p1, Ln2d;->d:Lf3d;

    iget-object p1, p1, Lf3d;->b:Lp3d;

    invoke-virtual {p1}, Lp3d;->b()F

    move-result p1

    iget-object v0, p0, Ld0n;->h:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    sub-float v0, p1, v0

    cmpg-float v1, v2, v0

    if-gtz v1, :cond_69

    const/high16 v1, 0x3f000000    # 0.5f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_69

    invoke-virtual {p0, p1}, Ld0n;->a(F)V

    :cond_69
    return-void

    :pswitch_6a
    check-cast p0, Lgcl;

    iget-object v0, p0, Lgcl;->h:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lgcl;->c:Lw05;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_85
    check-cast p0, Lcom/opera/android/flow/MyFlowMessageRoot;

    sget v0, Lcom/opera/android/flow/MyFlowMessageRoot;->l:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x40400000    # 3.0f

    mul-float/2addr p1, v0

    sub-float/2addr p1, v3

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget-object v0, p0, Lcom/opera/android/flow/MyFlowMessageRoot;->h:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_a4
    check-cast p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    sget p1, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->d:I

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->c()V

    return-void

    :pswitch_ac
    check-cast p0, Lndd;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    iget-object v1, p0, Lndd;->k:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iput p1, p0, Lndd;->y:F

    return-void

    :pswitch_c4
    check-cast p0, Lj5d;

    iget v0, p0, Lj5d;->f:F

    iget v1, p0, Lj5d;->h:F

    sub-float/2addr v1, v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v2

    mul-float/2addr v2, v1

    add-float/2addr v2, v0

    iput v2, p0, Lj5d;->d:F

    iget v0, p0, Lj5d;->g:F

    iget v1, p0, Lj5d;->i:F

    sub-float/2addr v1, v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    mul-float/2addr p1, v1

    add-float/2addr p1, v0

    iput p1, p0, Lj5d;->e:F

    iget-object v0, p0, Lj5d;->a:Ls6h;

    iget p0, p0, Lj5d;->d:F

    iget-object v1, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v1, Ltxi;

    invoke-virtual {v1}, Ltxi;->i()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_fe

    iget-object v2, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v2, Landroid/widget/Magnifier;

    if-nez v2, :cond_fb

    new-instance v2, Landroid/widget/Magnifier;

    invoke-direct {v2, v1}, Landroid/widget/Magnifier;-><init>(Landroid/view/View;)V

    iput-object v2, v0, Ls6h;->a:Ljava/lang/Object;

    :cond_fb
    invoke-virtual {v2, p0, p1}, Landroid/widget/Magnifier;->show(FF)V

    :cond_fe
    return-void

    :pswitch_ff
    check-cast p0, Lf3d;

    iget p1, p0, Lf3d;->G:I

    if-eqz p1, :cond_106

    move v1, p1

    :cond_106
    const/4 p1, 0x2

    if-ne v1, p1, :cond_10d

    invoke-virtual {p0}, Lf3d;->invalidateSelf()V

    goto :goto_11a

    :cond_10d
    iget-object p1, p0, Lf3d;->l:Lgi5;

    if-eqz p1, :cond_11a

    iget-object p0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {p0}, Lp3d;->b()F

    move-result p0

    invoke-virtual {p1, p0}, Lgi5;->q(F)V

    :cond_11a
    :goto_11a
    return-void

    :pswitch_11b
    check-cast p0, Laba;

    iget-object p1, p0, Laba;->i:Lpde;

    invoke-virtual {p0}, Laba;->a()Lzaa;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_127
    check-cast p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;

    sget v0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->K0:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void

    :pswitch_13b
    check-cast p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;

    sget v0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->e:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_14f
    check-cast p0, Lcom/opera/android/widget/GraphView;

    sget-object v0, Lcom/opera/android/widget/GraphView;->p:Lzp8;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/GraphView;->n:F

    iput-boolean v1, p0, Lcom/opera/android/widget/GraphView;->l:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_165
    check-cast p0, Lrh8;

    iget-object p0, p0, Lrh8;->l:Lc1f;

    if-eqz p0, :cond_16e

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_16e
    return-void

    :pswitch_16f
    check-cast p0, Ld48;

    iget-object p0, p0, Ld48;->j:Lc1f;

    if-eqz p0, :cond_178

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_178
    return-void

    :pswitch_179
    check-cast p0, Lym7;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, La38;->d:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void

    :pswitch_18b
    check-cast p0, Lf47;

    iget-object p1, p0, Lf47;->p:Lrl7;

    iget-object v0, p0, Lf47;->t:Landroid/animation/TimeInterpolator;

    iget-object p0, p0, Lf47;->s:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p0

    invoke-interface {v0, p0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p0

    iput p0, p1, Lrl7;->e:F

    return-void

    :pswitch_19e
    check-cast p0, Luw6;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Luw6;->F:F

    iget-object p1, p0, Luw6;->a:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    return-void

    :pswitch_1b2
    check-cast p0, Ln85;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Ln85;->g:F

    iget-object v0, p0, Ln85;->a:Landroid/view/View;

    iget v1, p0, Ln85;->c:I

    iget v2, p0, Ln85;->d:I

    sget-object v3, Lo85;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {v3, p1}, Landroid/view/animation/AccelerateDecelerateInterpolator;->getInterpolation(F)F

    move-result p1

    int-to-float v3, v1

    sub-int/2addr v2, v1

    int-to-float v1, v2

    mul-float/2addr v1, p1

    add-float/2addr v1, v3

    invoke-static {v1}, Lzed;->b(F)I

    move-result p1

    invoke-static {p1, v0}, Lp37;->l0(ILandroid/view/View;)V

    iget-object p1, p0, Ln85;->b:Landroid/view/View;

    sget-object v0, Lo85;->x:Landroid/view/animation/AccelerateInterpolator;

    iget p0, p0, Ln85;->g:F

    invoke-virtual {v0, p0}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    return-void

    :pswitch_1e6
    check-cast p0, Lo85;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lo85;->a:Lp85;

    iget-object v1, v0, Lp85;->f:Landroid/view/ViewGroup;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget v2, p0, Lo85;->g:I

    invoke-virtual {p0}, Lo85;->e()I

    move-result v3

    int-to-float v4, v2

    sub-int/2addr v3, v2

    int-to-float v2, v3

    mul-float/2addr v2, p1

    add-float/2addr v2, v4

    invoke-static {v2}, Lzed;->b(F)I

    move-result v2

    invoke-static {v2, v1}, Lp37;->t0(ILandroid/view/View;)V

    iget-object v2, v0, Lp85;->l:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    iget-object v2, v0, Lp85;->i:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    iget-object v2, v0, Lp85;->k:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    iget-object v2, p0, Lo85;->e:Landroid/animation/ArgbEvaluator;

    iget-object v3, p0, Lo85;->c:Landroid/content/Context;

    const v4, 0x7f0401f8

    invoke-static {v4, v3}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget p0, p0, Lo85;->l:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v2, p1, v3, p0}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object p0, v0, Lp85;->m:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    iget-object p1, p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a:Lzi4;

    invoke-virtual {p1, v0}, Lzi4;->X(F)Z

    move-result p1

    if-eqz p1, :cond_257

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_257
    return-void

    :pswitch_258
    check-cast p0, Lql2;

    sget-object v0, Lql2;->j:Landroid/view/animation/DecelerateInterpolator;

    iget-object p0, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_277

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p1, :cond_277

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_277
    return-void

    :pswitch_data_278
    .packed-switch 0x0
        :pswitch_258
        :pswitch_1e6
        :pswitch_1b2
        :pswitch_19e
        :pswitch_18b
        :pswitch_179
        :pswitch_16f
        :pswitch_165
        :pswitch_14f
        :pswitch_13b
        :pswitch_127
        :pswitch_11b
        :pswitch_ff
        :pswitch_c4
        :pswitch_ac
        :pswitch_a4
        :pswitch_85
        :pswitch_6a
        :pswitch_42
    .end packed-switch
.end method
