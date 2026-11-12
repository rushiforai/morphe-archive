.class public final Lf56;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/recyclerview/widget/i;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/ViewPropertyAnimator;

.field public final synthetic e:Lk56;


# direct methods
.method public synthetic constructor <init>(Lk56;Landroidx/recyclerview/widget/i;Landroid/view/View;Landroid/view/ViewPropertyAnimator;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lf56;->a:B

    iput-object p2, p0, Lf56;->b:Landroidx/recyclerview/widget/i;

    iput-object p3, p0, Lf56;->c:Landroid/view/View;

    iput-object p4, p0, Lf56;->d:Landroid/view/ViewPropertyAnimator;

    iput-object p1, p0, Lf56;->e:Lk56;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Lk56;Landroidx/recyclerview/widget/i;Landroid/view/ViewPropertyAnimator;Landroid/view/View;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lf56;->a:B

    iput-object p2, p0, Lf56;->b:Landroidx/recyclerview/widget/i;

    iput-object p3, p0, Lf56;->d:Landroid/view/ViewPropertyAnimator;

    iput-object p4, p0, Lf56;->c:Landroid/view/View;

    iput-object p1, p0, Lf56;->e:Lk56;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 5

    iget-byte v0, p0, Lf56;->a:B

    const/high16 v1, 0x3f800000    # 1.0f

    iget-object v2, p0, Lf56;->c:Landroid/view/View;

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void

    :pswitch_d
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Landroid/view/View;->setTranslationY(F)V

    return-void

    :pswitch_15
    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 6

    iget-byte p1, p0, Lf56;->a:B

    iget-object v0, p0, Lf56;->b:Landroidx/recyclerview/widget/i;

    iget-object v1, p0, Lf56;->e:Lk56;

    const/4 v2, 0x0

    iget-object v3, p0, Lf56;->d:Landroid/view/ViewPropertyAnimator;

    packed-switch p1, :pswitch_data_4c

    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    check-cast v1, Lvqk;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    iget-object p0, v1, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lk56;->w()Z

    move-result p0

    if-eqz p0, :cond_26

    iget-boolean p0, v1, Lvqk;->w:Z

    if-eqz p0, :cond_26

    const/4 p0, 0x0

    iput-boolean p0, v1, Lvqk;->w:Z

    :cond_26
    return-void

    :pswitch_27
    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    iget-object p0, v1, Lk56;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lk56;->w()Z

    return-void

    :pswitch_36
    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    iget-object p0, p0, Lf56;->c:Landroid/view/View;

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    iget-object p0, v1, Lk56;->r:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lk56;->w()Z

    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_36
        :pswitch_27
    .end packed-switch
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p1, p0, Lf56;->a:B

    packed-switch p1, :pswitch_data_1a

    iget-object p0, p0, Lf56;->e:Lk56;

    check-cast p0, Lvqk;

    invoke-virtual {p0}, Lvqk;->p()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lf56;->e:Lk56;

    invoke-virtual {p0}, Lxkj;->p()V

    return-void

    :pswitch_13
    iget-object p0, p0, Lf56;->e:Lk56;

    invoke-virtual {p0}, Lxkj;->r()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
