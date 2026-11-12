.class public final Ljq3;
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

    iput-byte p2, p0, Ljq3;->a:B

    iput-object p1, p0, Ljq3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 4

    iget-byte v0, p0, Ljq3;->a:B

    iget-object p0, p0, Ljq3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ba

    check-cast p0, Lvr3;

    iget-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/UrlFieldEditText;

    iget p0, p0, Lvr3;->a:I

    invoke-virtual {p1, p0}, Lcom/opera/android/widget/UrlFieldEditText;->setHighlightColor(I)V

    return-void

    :pswitch_13
    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->v0:Lv85;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lv85;->x(F)V

    return-void

    :pswitch_25
    check-cast p0, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/View;->scrollTo(II)V

    return-void

    :pswitch_36
    check-cast p0, Lghf;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :try_start_46
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    move-result v0

    sub-int/2addr v0, p1

    int-to-float p1, v0

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->fakeDragBy(F)V
    :try_end_4f
    .catch Ljava/lang/NullPointerException; {:try_start_46 .. :try_end_4f} :catch_50

    goto :goto_53

    :catch_50
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->beginFakeDrag()Z

    :goto_53
    return-void

    :pswitch_54
    check-cast p0, Lxkb;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    iput p1, p0, Lxkb;->m:F

    return-void

    :pswitch_5d
    check-cast p0, Lelb;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    invoke-virtual {p0, p1}, Lelb;->a(F)V

    return-void

    :pswitch_67
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    check-cast p0, Leq8;

    iget-object v0, p0, Leq8;->c:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Leq8;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object p0, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_87
    check-cast p0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->f(I)V

    return-void

    :pswitch_97
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    check-cast p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lzdd;

    if-eqz p0, :cond_b9

    iget-object v0, p0, Lzdd;->b:Lxdd;

    iget v1, v0, Lxdd;->j:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_b9

    iput p1, v0, Lxdd;->j:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lzdd;->f:Z

    iput-boolean p1, p0, Lzdd;->g:Z

    invoke-virtual {p0}, Lzdd;->invalidateSelf()V

    :cond_b9
    return-void

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_97
        :pswitch_87
        :pswitch_67
        :pswitch_5d
        :pswitch_54
        :pswitch_36
        :pswitch_25
        :pswitch_13
    .end packed-switch
.end method
