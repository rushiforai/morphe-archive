.class public final Lls8;
.super Lfs8;
.source "SourceFile"


# instance fields
.field public final i:Lks8;

.field public final j:Ler8;


# direct methods
.method public constructor <init>(Ler8;)V
    .registers 4

    invoke-direct {p0, p1}, Lfs8;-><init>(Lfr8;)V

    new-instance v0, Lks8;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lks8;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lls8;->i:Lks8;

    const v0, 0x7f0a0423

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    iput-object p1, p0, Lls8;->j:Ler8;

    return-void
.end method


# virtual methods
.method public final a0(Lhq8;Z)V
    .registers 5

    invoke-super {p0, p1, p2}, Lfs8;->a0(Lhq8;Z)V

    iget-object v0, p0, Les8;->d:Lns8;

    if-eqz v0, :cond_3f

    iget-object p0, p0, Lls8;->j:Ler8;

    iget-object v0, p0, Ler8;->s:Lhq8;

    if-eq v0, p1, :cond_3f

    if-eqz v0, :cond_12

    invoke-virtual {v0, p0}, Lhq8;->o(Lgq8;)V

    :cond_12
    iput-object p1, p0, Ler8;->s:Lhq8;

    if-eqz p1, :cond_19

    invoke-virtual {p1, p0}, Lhq8;->b(Lgq8;)V

    :cond_19
    iget-object p1, p0, Ler8;->t:Lyr8;

    iget-object v0, p0, Ler8;->s:Lhq8;

    iput-object v0, p1, Lyr8;->f:Lhq8;

    const/4 v0, 0x0

    iput v0, p1, Lyr8;->j:I

    invoke-virtual {p1}, Lyr8;->e()V

    const/4 v1, 0x0

    iput-object v1, p1, Lyr8;->k:Ljava/lang/String;

    iput-object v1, p1, Lyr8;->l:Lvmj;

    iput-boolean v0, p0, Ler8;->u:Z

    invoke-virtual {p0}, Ler8;->t()Ljava/lang/Float;

    iget-object p1, p0, Ler8;->s:Lhq8;

    if-eqz p1, :cond_39

    invoke-virtual {p0, p2}, Ler8;->q(Z)V

    invoke-virtual {p0}, Ler8;->s()V

    :cond_39
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p0}, Ler8;->x()V

    :cond_3f
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-object p0, p0, Lls8;->i:Lks8;

    invoke-virtual {p0, p1}, Ly0j;->onClick(Landroid/view/View;)V

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
    .registers 10

    iget-object p0, p0, Lls8;->j:Ler8;

    iget v0, p0, Ler8;->z:I

    iget-boolean v1, p0, Ler8;->u:Z

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v1, :cond_15

    if-eqz p1, :cond_11

    iput-boolean v4, p0, Ler8;->u:Z

    goto :goto_15

    :cond_11
    invoke-virtual {p0}, Ler8;->t()Ljava/lang/Float;

    goto :goto_45

    :cond_15
    :goto_15
    invoke-virtual {p0}, Ler8;->t()Ljava/lang/Float;

    move-result-object v1

    const v6, 0x3f933333    # 1.15f

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_28

    :cond_23
    if-eqz p1, :cond_27

    move v1, v5

    goto :goto_28

    :cond_27
    move v1, v6

    :goto_28
    if-nez p1, :cond_2b

    move v6, v5

    :cond_2b
    new-array v7, v3, [F

    aput v1, v7, v2

    aput v6, v7, v4

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    int-to-long v6, v0

    invoke-virtual {v1, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v1, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v1, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    :goto_45
    iget-object v1, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    const/high16 v6, 0x3f800000    # 1.0f

    if-eqz v1, :cond_60

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v7, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v7, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {v7, p0}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_65

    :cond_60
    if-eqz p1, :cond_64

    move v1, v5

    goto :goto_65

    :cond_64
    move v1, v6

    :goto_65
    if-eqz p1, :cond_68

    move v5, v6

    :cond_68
    new-array p1, v3, [F

    aput v1, p1, v2

    aput v5, p1, v4

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
