.class public final Lis8;
.super Lfs8;
.source "SourceFile"


# instance fields
.field public final i:Lcr8;


# direct methods
.method public constructor <init>(Lcr8;)V
    .registers 3

    invoke-direct {p0, p1}, Lfs8;-><init>(Lfr8;)V

    const v0, 0x7f0a0421

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    iput-object p1, p0, Lis8;->i:Lcr8;

    return-void
.end method


# virtual methods
.method public final Z(Lhq8;)V
    .registers 7

    invoke-super {p0, p1}, Lfs8;->Z(Lhq8;)V

    check-cast p1, Ltq8;

    iget-object p0, p0, Lis8;->i:Lcr8;

    iget-object v0, p0, Lcr8;->x:Ljava/util/ArrayList;

    iget-object v1, p0, Lcr8;->v:Ltq8;

    if-eq v1, p1, :cond_4f

    if-eqz v1, :cond_12

    invoke-virtual {v1, p0}, Lhq8;->o(Lgq8;)V

    :cond_12
    iput-object p1, p0, Lcr8;->v:Ltq8;

    if-eqz p1, :cond_19

    invoke-virtual {p1, p0}, Lhq8;->b(Lgq8;)V

    :cond_19
    iget-object p1, p0, Lcr8;->v:Ltq8;

    if-eqz p1, :cond_25

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcr8;->t(Z)V

    invoke-virtual {p0}, Lcr8;->s()V

    goto :goto_4c

    :cond_25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    move v2, v1

    :goto_2b
    if-ge v2, p1, :cond_49

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lbr8;

    iget-object v4, v3, Lbr8;->a:Lhq8;

    invoke-virtual {v4, v3}, Lhq8;->o(Lgq8;)V

    iget-object v3, v3, Lbr8;->b:Lyr8;

    const/4 v4, 0x0

    iput-object v4, v3, Lyr8;->f:Lhq8;

    iput v1, v3, Lyr8;->j:I

    invoke-virtual {v3}, Lyr8;->e()V

    iput-object v4, v3, Lyr8;->k:Ljava/lang/String;

    iput-object v4, v3, Lyr8;->l:Lvmj;

    goto :goto_2b

    :cond_49
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :goto_4c
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_4f
    invoke-virtual {p0}, Lfr8;->l()V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Lfs8;->f:Lhq8;

    if-eqz p1, :cond_1b

    iget-object p1, p0, Les8;->d:Lns8;

    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lfs8;->Y()Lcom/opera/android/favorites/e;

    move-result-object p1

    iget-object v0, p0, Lfs8;->f:Lhq8;

    invoke-virtual {p1, v0}, Lcom/opera/android/favorites/e;->k(Lhq8;)V

    iget-object p1, p0, Les8;->d:Lns8;

    iget-object p0, p0, Lfs8;->f:Lhq8;

    check-cast p0, Ltq8;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lns8;->Y(Ltq8;Z)V

    :cond_1b
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 3

    iget-object p1, p0, Lfs8;->f:Lhq8;

    if-eqz p1, :cond_d

    iget-object v0, p0, Les8;->d:Lns8;

    if-eqz v0, :cond_d

    invoke-virtual {v0, p0, p1}, Lns8;->L(Lfs8;Lhq8;)Z

    move-result p0

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final x(Z)V
    .registers 5

    iget-object p0, p0, Lis8;->i:Lcr8;

    iget-object v0, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    if-eqz p1, :cond_1e

    const p1, 0x3f933333    # 1.15f

    goto :goto_20

    :cond_1e
    const/high16 p1, 0x3f800000    # 1.0f

    :goto_20
    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput v0, v1, v2

    const/4 v0, 0x1

    aput p1, v1, v0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    iget v0, p0, Lcr8;->z:I

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
