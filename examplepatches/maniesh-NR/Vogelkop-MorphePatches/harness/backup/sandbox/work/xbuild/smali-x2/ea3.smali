.class public final Lea3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    iput-byte p3, p0, Lea3;->a:B

    iput-object p1, p0, Lea3;->c:Ljava/lang/Object;

    iput p2, p0, Lea3;->b:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    iget-byte v0, p0, Lea3;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lea3;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaIntroView;

    iget-object v0, p1, Ln2d;->d:Lf3d;

    iget-object v0, v0, Lf3d;->b:Lp3d;

    invoke-virtual {v0, p0}, Lp3d;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    const/4 p0, 0x0

    iput p0, p1, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    return-void

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 5

    iget-byte p1, p0, Lea3;->a:B

    iget v0, p0, Lea3;->b:I

    iget-object v1, p0, Lea3;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_44

    check-cast v1, Lcom/opera/android/custom_views/OperaIntroView;

    iget-object p1, v1, Ln2d;->d:Lf3d;

    iget-object p1, p1, Lf3d;->b:Lp3d;

    invoke-virtual {p1, p0}, Lp3d;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    const/4 p0, 0x0

    iput p0, v1, Lcom/opera/android/custom_views/OperaIntroView;->C:I

    sget p1, Lcom/opera/android/custom_views/OperaIntroView;->F:I

    const/4 p1, 0x1

    if-eq v0, p1, :cond_33

    const/4 p1, 0x2

    const/4 v2, 0x3

    if-eq v0, p1, :cond_27

    if-eq v0, v2, :cond_24

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_36

    :cond_24
    iget-object p0, v1, Lcom/opera/android/custom_views/OperaIntroView;->B:Lelf;

    goto :goto_36

    :cond_27
    invoke-virtual {v1, v2}, Lcom/opera/android/custom_views/OperaIntroView;->C(I)V

    const/16 p1, 0x101

    const/4 v0, 0x0

    const/16 v2, 0xed

    invoke-virtual {v1, p0, v2, p1, v0}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    goto :goto_36

    :cond_33
    invoke-virtual {v1}, Lcom/opera/android/custom_views/OperaIntroView;->A()V

    :goto_36
    return-void

    :pswitch_37
    check-cast v1, Lna3;

    invoke-virtual {v1, v0}, Lna3;->d(I)V

    return-void

    :pswitch_3d
    check-cast v1, Lna3;

    invoke-virtual {v1, v0}, Lna3;->d(I)V

    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_37
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 9

    iget-byte v0, p0, Lea3;->a:B

    packed-switch v0, :pswitch_data_5e

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lea3;->c:Ljava/lang/Object;

    check-cast p0, Lna3;

    iget-object p1, p0, Lna3;->j:Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget p0, p0, Lna3;->b:I

    iget-object v0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v3, p0

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    iget-object v0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->c:Landroid/animation/TimeInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v5, 0x0

    invoke-virtual {p0, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    iget-object p0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->b:Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_5d

    iget-object p0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->b:Landroid/widget/Button;

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, p1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->b:Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_5d
    return-void

    :pswitch_data_5e
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
