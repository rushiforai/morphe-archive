.class public final Lal9;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 15
    iput-byte p1, p0, Lal9;->a:B

    iput-object p2, p0, Lal9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lal9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Lal9;->a:B

    iput-object p1, p0, Lal9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lal9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Lnrl;Landroid/view/View;Lld9;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lal9;->a:B

    iput-object p2, p0, Lal9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lal9;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 3

    iget-byte v0, p0, Lal9;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lal9;->c:Ljava/lang/Object;

    check-cast p0, Lo8n;

    invoke-interface {p0}, Lo8n;->d()V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x5
        :pswitch_9
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 7

    iget-byte v0, p0, Lal9;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lal9;->b:Ljava/lang/Object;

    iget-object p0, p0, Lal9;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_88

    check-cast v4, La3p;

    const/16 p1, 0x8

    invoke-virtual {v4, p1}, Landroid/view/View;->setVisibility(I)V

    check-cast p0, Lqqo;

    invoke-virtual {p0}, Lqqo;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_19
    check-cast p0, Ln2o;

    const/high16 p1, 0x3f800000    # 1.0f

    iget-object v0, p0, Ln2o;->a:Lm2o;

    invoke-virtual {v0, p1}, Lm2o;->e(F)V

    check-cast v4, Landroid/view/View;

    invoke-static {v4, p0}, Lj2o;->f(Landroid/view/View;Ln2o;)V

    return-void

    :pswitch_28
    check-cast p0, Lo8n;

    invoke-interface {p0}, Lo8n;->g()V

    return-void

    :pswitch_2e
    check-cast v4, Landroidx/collection/ArrayMap;

    invoke-virtual {v4, p1}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Ly2m;

    iget-object p0, p0, Ly2m;->n:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_3b
    check-cast v4, Lor2;

    iget-object p1, v4, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object p1, p1, Ln2d;->d:Lf3d;

    iget-object p1, p1, Lf3d;->b:Lp3d;

    invoke-virtual {p1}, Lp3d;->b()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_57

    check-cast p0, Lo9k;

    iget-object p0, p0, Lo9k;->f:Lpde;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_57
    return-void

    :pswitch_58
    check-cast v4, Landroid/view/View;

    check-cast p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;

    iput-object v3, p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;->k:Landroid/view/ViewPropertyAnimator;

    iget-byte p0, p0, Lcom/google/android/material/behavior/HideViewOnScrollBehavior;->j:B

    if-ne p0, v2, :cond_6b

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_6b

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_6b
    return-void

    :pswitch_6c
    check-cast v4, Landroid/view/View;

    check-cast p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;

    iput-object v3, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->k:Landroid/view/ViewPropertyAnimator;

    iget-byte p0, p0, Lcom/google/android/material/behavior/HideBottomViewOnScrollBehavior;->j:B

    if-ne p0, v2, :cond_7f

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_7f

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_7f
    return-void

    :pswitch_80
    check-cast v4, Landroid/view/View;

    check-cast p0, Lld9;

    invoke-virtual {v4, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_80
        :pswitch_6c
        :pswitch_58
        :pswitch_3b
        :pswitch_2e
        :pswitch_28
        :pswitch_19
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 4

    iget-byte v0, p0, Lal9;->a:B

    iget-object v1, p0, Lal9;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    return-void

    :pswitch_b
    check-cast v1, Lo8n;

    invoke-interface {v1}, Lo8n;->f()V

    return-void

    :pswitch_11
    check-cast v1, Ly2m;

    iget-object p0, v1, Ly2m;->n:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x4
        :pswitch_11
        :pswitch_b
    .end packed-switch
.end method
