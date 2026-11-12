.class public final Lg56;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/recyclerview/widget/i;

.field public final synthetic c:I

.field public final synthetic d:Landroid/view/View;

.field public final synthetic e:I

.field public final synthetic f:Landroid/view/ViewPropertyAnimator;

.field public final synthetic g:Lxkj;


# direct methods
.method public synthetic constructor <init>(Lxkj;Landroidx/recyclerview/widget/i;ILandroid/view/View;ILandroid/view/ViewPropertyAnimator;B)V
    .registers 8

    iput-byte p7, p0, Lg56;->a:B

    iput-object p2, p0, Lg56;->b:Landroidx/recyclerview/widget/i;

    iput p3, p0, Lg56;->c:I

    iput-object p4, p0, Lg56;->d:Landroid/view/View;

    iput p5, p0, Lg56;->e:I

    iput-object p6, p0, Lg56;->f:Landroid/view/ViewPropertyAnimator;

    iput-object p1, p0, Lg56;->g:Lxkj;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method private final a(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 4

    iget-byte p1, p0, Lg56;->a:B

    packed-switch p1, :pswitch_data_2a

    iget p1, p0, Lg56;->c:I

    const/4 v0, 0x0

    iget-object v1, p0, Lg56;->d:Landroid/view/View;

    if-eqz p1, :cond_f

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    :cond_f
    iget p0, p0, Lg56;->e:I

    if-eqz p0, :cond_16

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_16
    return-void

    :pswitch_17
    iget p1, p0, Lg56;->c:I

    const/4 v0, 0x0

    iget-object v1, p0, Lg56;->d:Landroid/view/View;

    if-eqz p1, :cond_21

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    :cond_21
    iget p0, p0, Lg56;->e:I

    if-eqz p0, :cond_28

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_28
    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 5

    iget-byte p1, p0, Lg56;->a:B

    iget-object v0, p0, Lg56;->b:Landroidx/recyclerview/widget/i;

    iget-object v1, p0, Lg56;->g:Lxkj;

    const/4 v2, 0x0

    iget-object p0, p0, Lg56;->f:Landroid/view/ViewPropertyAnimator;

    packed-switch p1, :pswitch_data_2e

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    check-cast v1, Lxr6;

    invoke-virtual {v1, v0}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    iget-object p0, v1, Lxr6;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lxr6;->t()V

    return-void

    :pswitch_1d
    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    check-cast v1, Lk56;

    invoke-virtual {v1, v0}, Lxkj;->o(Landroidx/recyclerview/widget/i;)V

    iget-object p0, v1, Lk56;->q:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lk56;->w()Z

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p1, p0, Lg56;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lg56;->g:Lxkj;

    check-cast p0, Lk56;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
