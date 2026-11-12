.class public final Lkc;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/OmniButtonView;)V
    .registers 3

    const/16 v0, 0x16

    iput-byte v0, p0, Lkc;->a:B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lkc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 13
    iput-byte p2, p0, Lkc;->a:B

    iput-object p1, p0, Lkc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Ltah;)V
    .registers 3

    const/16 v0, 0x17

    iput-byte v0, p0, Lkc;->a:B

    .line 14
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lkc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lkc;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lkc;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_3a

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :sswitch_c
    check-cast v2, Lesg;

    iput-object v1, v2, Lesg;->c:Ljava/lang/Object;

    return-void

    :sswitch_11
    check-cast v2, Lcom/opera/android/widget/LottieAnimationView;

    iput-object v1, v2, Lcom/opera/android/widget/LottieAnimationView;->r:Ljava/lang/Runnable;

    return-void

    :sswitch_16
    check-cast v2, Landroidx/recyclerview/widget/i;

    iget-object p0, v2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationZ(F)V

    return-void

    :sswitch_1f
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    check-cast v2, Lcom/google/android/material/focus/FocusRingDrawable;

    const/high16 p0, 0x3f800000    # 1.0f

    iput p0, v2, Lcom/google/android/material/focus/FocusRingDrawable;->k:F

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :sswitch_2c
    check-cast v2, Lyi2;

    invoke-virtual {v2}, Lyi2;->f()V

    return-void

    :sswitch_32
    check-cast v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iput-object v1, v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/view/ViewPropertyAnimator;

    const/4 p0, 0x0

    iput-boolean p0, v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;->i:Z

    return-void

    :sswitch_data_3a
    .sparse-switch
        0x0 -> :sswitch_32
        0x9 -> :sswitch_2c
        0xa -> :sswitch_1f
        0xe -> :sswitch_16
        0x11 -> :sswitch_11
        0x12 -> :sswitch_c
    .end sparse-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 8

    iget-byte v0, p0, Lkc;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x5

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lkc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_fe

    :pswitch_b
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void

    :pswitch_f
    check-cast v5, Ly2m;

    invoke-virtual {v5}, Ly2m;->p()V

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :pswitch_18
    check-cast v5, Lg7m;

    iput-object v4, v5, Lg7m;->j:Ljava/lang/Object;

    return-void

    :pswitch_1d
    check-cast v5, Lcom/opera/android/custom_views/ToolbarProgressBar;

    iput-boolean v3, v5, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-static {v5}, Lcom/opera/android/custom_views/ToolbarProgressBar;->b(Lcom/opera/android/custom_views/ToolbarProgressBar;)V

    return-void

    :pswitch_25
    check-cast v5, Lg7b;

    iput-byte v3, v5, Lg7b;->e:B

    iput-object v4, v5, Lg7b;->f:Landroid/animation/AnimatorSet;

    iput-boolean v3, v5, Lg7b;->l:Z

    return-void

    :pswitch_2e
    check-cast v5, Lghf;

    iget-object p0, v5, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->endFakeDrag()V

    iput-object v4, v5, Lghf;->d:Ljava/lang/Object;

    return-void

    :pswitch_3a
    check-cast v5, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    invoke-virtual {v5, v2}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->y(I)V

    iget-object p0, v5, Lcom/google/android/material/sidesheet/SideSheetBehavior;->p:Ljava/lang/ref/WeakReference;

    if-eqz p0, :cond_54

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_54

    iget-object p0, v5, Lcom/google/android/material/sidesheet/SideSheetBehavior;->p:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_54
    return-void

    :pswitch_55
    check-cast v5, Ltah;

    invoke-virtual {v5}, Ltah;->x()V

    return-void

    :pswitch_5b
    check-cast v5, Llqe;

    iput-object v4, v5, Llqe;->j:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_60
    check-cast v5, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    iput-object v4, v5, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_65
    check-cast v5, Lddd;

    iget-object p0, v5, Lycd;->b:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v5, v1}, Lddd;->b(F)V

    return-void

    :pswitch_70
    check-cast v5, Lesg;

    iget-object p0, v5, Lesg;->c:Ljava/lang/Object;

    check-cast p0, Lmcn;

    if-eqz p0, :cond_7d

    iput-object v4, v5, Lesg;->c:Ljava/lang/Object;

    invoke-virtual {p0}, Lmcn;->run()V

    :cond_7d
    return-void

    :pswitch_7e
    check-cast v5, Lcom/opera/android/widget/LottieAnimationView;

    iput-boolean v3, v5, Lcom/opera/android/widget/LottieAnimationView;->p:Z

    iget-object p0, v5, Lcom/opera/android/widget/LottieAnimationView;->r:Ljava/lang/Runnable;

    if-eqz p0, :cond_8b

    iput-object v4, v5, Lcom/opera/android/widget/LottieAnimationView;->r:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_8b
    return-void

    :pswitch_8c
    check-cast v5, Ljba;

    const/4 p0, 0x1

    invoke-virtual {v5, p0}, Ljba;->a(Z)V

    return-void

    :pswitch_93
    check-cast v5, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;

    iget p0, v5, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->H0:I

    iput p0, v5, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    iput-object v4, v5, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_9c
    check-cast v5, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;

    iget p0, v5, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->b:I

    iput p0, v5, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    iput-object v4, v5, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_a5
    check-cast v5, Lyi2;

    invoke-virtual {v5}, Lyi2;->g()V

    return-void

    :pswitch_ab
    check-cast v5, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;

    iput-object v4, v5, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;->b:Landroid/animation/AnimatorSet;

    return-void

    :pswitch_b0
    check-cast v5, Lym7;

    invoke-virtual {v5}, La38;->p()V

    iget-object p0, v5, Lym7;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :pswitch_bb
    check-cast v5, Lo85;

    iput-object v4, v5, Lo85;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {v5}, Lo85;->d()V

    return-void

    :pswitch_c3
    check-cast v5, Ln85;

    iget-object p0, v5, Ln85;->b:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p1

    cmpl-float p1, p1, v1

    if-gtz p1, :cond_d1

    const/16 v3, 0x8

    :cond_d1
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    iput-object v4, v5, Ln85;->h:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_d7
    check-cast v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {v5, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->N(I)V

    iget-object p0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:Ljava/lang/ref/WeakReference;

    if-eqz p0, :cond_f1

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_f1

    iget-object p0, v5, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_f1
    return-void

    :pswitch_f2
    check-cast v5, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    iput-object v4, v5, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->d:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_f7
    check-cast v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iput-object v4, v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/view/ViewPropertyAnimator;

    iput-boolean v3, v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;->i:Z

    return-void

    :pswitch_data_fe
    .packed-switch 0x0
        :pswitch_f7
        :pswitch_f2
        :pswitch_d7
        :pswitch_b
        :pswitch_b
        :pswitch_c3
        :pswitch_bb
        :pswitch_b0
        :pswitch_ab
        :pswitch_a5
        :pswitch_b
        :pswitch_9c
        :pswitch_93
        :pswitch_8c
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_7e
        :pswitch_70
        :pswitch_65
        :pswitch_60
        :pswitch_5b
        :pswitch_b
        :pswitch_55
        :pswitch_3a
        :pswitch_2e
        :pswitch_25
        :pswitch_1d
        :pswitch_18
        :pswitch_f
    .end packed-switch
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lkc;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lkc;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_58

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    return-void

    :sswitch_c
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    check-cast v2, Lyec;

    iget p0, v2, Lyec;->g:I

    add-int/2addr p0, v1

    iget-object p1, v2, Lyec;->f:Lhfc;

    iget-object p1, p1, Lp83;->e:[I

    array-length p1, p1

    rem-int/2addr p0, p1

    iput p0, v2, Lyec;->g:I

    iput-boolean v1, v2, Lyec;->h:Z

    return-void

    :sswitch_1f
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    check-cast v2, Lwec;

    iget p0, v2, Lwec;->f:I

    add-int/2addr p0, v1

    iget-object p1, v2, Lwec;->e:Lhfc;

    iget-object p1, p1, Lp83;->e:[I

    array-length p1, p1

    rem-int/2addr p0, p1

    iput p0, v2, Lwec;->f:I

    iput-boolean v1, v2, Lwec;->g:Z

    return-void

    :sswitch_32
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    check-cast v2, Lo05;

    iget p0, v2, Lo05;->g:I

    sget-object p1, Lo05;->l:[I

    array-length p1, p1

    add-int/2addr p0, p1

    iget-object p1, v2, Lo05;->f:Ly05;

    iget-object p1, p1, Lp83;->e:[I

    array-length p1, p1

    rem-int/2addr p0, p1

    iput p0, v2, Lo05;->g:I

    return-void

    :sswitch_46
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    check-cast v2, Lm05;

    iget p0, v2, Lm05;->g:I

    add-int/lit8 p0, p0, 0x4

    iget-object p1, v2, Lm05;->f:Ly05;

    iget-object p1, p1, Lp83;->e:[I

    array-length p1, p1

    rem-int/2addr p0, p1

    iput p0, v2, Lm05;->g:I

    return-void

    :sswitch_data_58
    .sparse-switch
        0x3 -> :sswitch_46
        0x4 -> :sswitch_32
        0xf -> :sswitch_1f
        0x10 -> :sswitch_c
    .end sparse-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 6

    iget-byte v0, p0, Lkc;->a:B

    iget-object v1, p0, Lkc;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_52

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :sswitch_b
    check-cast v1, Lcom/opera/android/bar/OmniButtonView;

    iget-object p0, v1, Lcom/opera/android/bar/OmniButtonView;->j:Lbp;

    if-eqz p0, :cond_15

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbp;->U(Z)V

    :cond_15
    return-void

    :sswitch_16
    check-cast v1, Lyi2;

    invoke-virtual {v1, p1}, Lyi2;->h(Landroid/animation/Animator;)V

    return-void

    :sswitch_1c
    check-cast v1, Lo85;

    iget-object p0, v1, Lo85;->b:Lu85;

    iget-object p0, p0, Lu85;->k:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq85;

    iget-object p1, v1, Lo85;->a:Lp85;

    iget-object v0, p1, Lp85;->l:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Lp85;->i:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v2, p0, Lq85;->c:Lo24;

    const/16 v3, 0x8

    if-eqz v2, :cond_40

    move v2, v1

    goto :goto_41

    :cond_40
    move v2, v3

    :goto_41
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Lp85;->k:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageView;

    iget-object p0, p0, Lq85;->d:Lo24;

    if-nez p0, :cond_4d

    move v1, v3

    :cond_4d
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    nop

    :sswitch_data_52
    .sparse-switch
        0x6 -> :sswitch_1c
        0x9 -> :sswitch_16
        0x16 -> :sswitch_b
    .end sparse-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;Z)V
    .registers 4

    iget-byte v0, p0, Lkc;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;Z)V

    return-void

    .line 82
    :pswitch_9
    iget-object p0, p0, Lkc;->b:Ljava/lang/Object;

    check-cast p0, Ln85;

    .line 83
    iget-object p0, p0, Ln85;->b:Landroid/view/View;

    const/4 p1, 0x0

    .line 84
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_data_14
    .packed-switch 0x5
        :pswitch_9
    .end packed-switch
.end method
